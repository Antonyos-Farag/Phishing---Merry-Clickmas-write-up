```
                             *        *
                       ___  /_\      /_\  ___
                      (   )( o )    ( o )(   )
                       ~~~  \_/      \_/  ~~~
                             ||        ||
                          __/  \______/  \__
                         (___________________)
                          \__|__|__|__|__|__/
                           |  |  |  |  |  |
```

# 🎄 Phishing — Merry Clickmas

**A spoiler-stuffed write-up for TryHackMe Advent of Cyber 2025, Day 2** — retold with the seriousness it deserves, which is roughly the seriousness of a novelty jumper with a flashing reindeer.

**TL;DR:** An elf clicked a link. A password got reused. A mailbox fell open. 1,984,000 toys became someone else's business intelligence. Somewhere, a CISO is drinking eggnog straight from the carton.

> **🚨 Lab safety (the load-bearing boring part):** everything below happened inside an authorized TryHackMe room. Don't phish real people. Don't phish your colleagues. Don't phish your relatives — especially not Uncle Dave, who clicks *everything* and then phones you to ask whether "URL" is a type of owl.
>
> **🪅 Spoilers:** the accepted answers are at the bottom, like the last present in the stocking.

**Prefer your crime scenes dry, factual, and free of sleigh bells?** The original straight-faced write-up lives untouched in [`docs/writeup-original.md`](docs/writeup-original.md). The rest of this repo is what happens when someone lets a security team near a thesaurus in December.

---

## The idea, explained like you're five (or like you're an elf with a deadline)

Phishing isn't magic malware. It's an email with *vibes*. The attacker borrows trust — a familiar name, a timely request, a whisper of urgency — and politely asks a human to do the dangerous part for them.

This room shows how a small chain escalates:

```text
A believable message
        ↓
A lookalike "please re-authenticate" page
        ↓
A password is captured (oops #1)
        ↓
That same password opens the factory mailbox (oops #2, the classic)
        ↓
An ordinary email reveals the delivery quantity (oops #3, and someone should tell Santa)
```

The lesson is the **chain**, not the tooling. One click plus one reused password turned a mailbox into a leaky chimney.

---

## The cast

| Character | Role | Security posture |
|---|---|---|
| The elves | Overworked production staff | Click first, verify... also first |
| Flying Deer | Sender of a *completely legitimate* email | Not a real organisation, somehow also not the giveaway |
| TBFC Staff Portal | The lookalike login page | Certified "Not Secure", proudly so |
| Marta (`marta`) | Sends urgent production emails | Innocent bystander. Did nothing wrong. |
| Roundcube | Factory webmail | Opened for one password. Just one. |
| Santa | Chief Nice List Officer / de facto CISO | Has questions. Will ask them in the Q1 review. |

---

## Room map

| Item | What you'll see |
|---|---|
| Room | Advent of Cyber 2025 — Day 2: Phishing — Merry Clickmas |
| AttackBox files | `~/Rooms/AoC2025/Day02/index.html` and `server.py` |
| Lookalike page | TBFC Staff Portal, served on port `8000` |
| Mail setup | SET single-recipient mailer against the room's SMTP service |
| Mailbox | Roundcube on the target machine |
| Evidence | The seven screenshots in [`screenshots/`](screenshots/) |

The screenshots show an AttackBox IP of `10.130.120.158` and a target IP of `10.130.128.226`. **Those are temporary.** Use the ones your own session hands you, because last week's IP is now a printer in Wolverhampton:

- `<ATTACKBOX_IP>` = the AttackBox address in your session
- `<TARGET_IP>` = the target machine address in your session

---

## Walkthrough

### 1. Find the room files 📁

```bash
cd ~/Rooms/AoC2025/Day02
ls
```

`index.html` and `server.py`. The HTML is the TBFC-looking sign-in page; the Python script serves the room's local web experience. Two files. Nothing suspicious. That's how it always starts.

<details>
<summary>Screenshot: the Day 2 files</summary>

![The Day 2 directory contains index.html and server.py](screenshots/01-day02-files.png)

</details>

### 2. Bring up the lookalike portal 🎪

```bash
python3 server.py
```

Then, in the AttackBox browser:

```text
http://<ATTACKBOX_IP>:8000
```

You'll get a **TBFC Staff Portal** page branded *"SOCMAS Operations — Re-authentication."* It asks you to sign in again to apply the latest delivery-manifest changes. That's the pretext: a mundane work chore dressed up as a reason to type your password into a page you didn't navigate to.

Then admire the browser's **Not Secure** warning. Plain HTTP in the lab — a genuine red flag, and a polite reminder that passwords should never be posted over an unencrypted connection, where literally everyone on the path can read them like a postcard.

Extra credit: the branding says SOCMAS, a holiday so obscure that nobody remembered to book the venue — but the design department still shipped a logo, because *that* team is always fine.

<details>
<summary>Screenshot: the TBFC portal</summary>

![TBFC Staff Portal re-authentication page](screenshots/05-tbfc-portal.png)

</details>

### 3. Set up the one-recipient mail simulation 📮

The room uses the Social-Engineer Toolkit (SET) to demonstrate delivery:

```bash
setoolkit
```

Menu path:

1. **5 — Mass Mailer Attack**
2. **1 — E-Mail Attack Single Email Address**
3. **2 — One-Time Use Email Template**
4. Recipient: `factory@wareville.thm`
5. **2 — Use your own server or open relay**

| Field | Room value |
|---|---|
| From address | `updates@flyingdeer.thm` |
| From/display name | `Flying Deer` |
| SMTP server | `<TARGET_IP>` (shown as `10.130.128.226`) |
| SMTP port | `25` |
| Recipient | `factory@wareville.thm` |
| Portal link in the one-time message | `http://<ATTACKBOX_IP>:8000` |

Use your current room IPs, not the screenshot ones — the screenshots are frozen in time like a mammoth, and about as connectable.

The relay-credential prompts are blank because this is a lab with a purpose-built mail service. **Real mail servers do not work like this**, and a world where they did would be a world with no DMARC and no peace. Keep the recipient and mail service inside the authorized exercise, and remember that "it worked in the room" is not permission to try it on the internet.

<details>
<summary>Screenshots: SET and the mail configuration</summary>

![SET startup screen](screenshots/02-set-toolkit.png)

![SET single-recipient mass-mailer menu](screenshots/03-set-mailer-menu.png)

![SET sender and SMTP configuration](screenshots/04-set-smtp-configuration.png)

</details>

### 4. Follow the credential-capture step 🪣

The lookalike portal is the credential-capture stage of the room. In the intended lab flow, the simulated interaction supplies a portal password:

```text
unranked-wisdom-anthem
```

Keep it in the room. Never type a real password into a training page — save that bad decision for never.

The point isn't the password's strength; it's *where it was typed* and *what else it opened*. Phishing doesn't need to guess your password. It just needs you to hand it over once, and reusing it does the rest.

### 5. Check the factory mailbox 📬

```text
http://<TARGET_IP>/
```

Sign in to the **factory** mailbox with the password from step 4. This is password reuse in its natural habitat: a credential harvested at "TBFC" also opens an entirely different service. The mailbox does not ask questions. The mailbox is not paid to ask questions.

In the inbox, open Marta's (`marta`) message dated `2025-10-10 13:34`:

> **Urgent: Production & Shipping Request — 1984000 Units (Next 2 Weeks)**

The client expects **1,984,000 toys** manufactured and shipped within two weeks. That's the room's second answer — and the moment a phishing exercise quietly turns into business espionage, minus the trench coat. The lure page got the password. The reused password got the mailbox. The mailbox told us everything.

Note that no malware was involved at any point. Nobody had to bypass an EDR agent. Nobody had to crack a hash. A human read an email and did their job quickly. That's the whole scam.

<details>
<summary>Screenshot: the production request in Roundcube</summary>

![Marta's production and shipping request in the factory mailbox](screenshots/06-factory-mailbox.png)

</details>

---

## Red flags, ranked by how much they should ruin your day

| # | Red flag | Why it matters |
|---|---|---|
| 🥇 | The sign-in page is an **IP address over HTTP** | Verified company sites don't look like a speed test result |
| 🥈 | **Password reuse** across two unrelated services | One phish, two breaches, zero effort |
| 🥉 | Sender identity is a **display name** | `Flying Deer` proves nothing; check the real address and the context |
| 4 | **Urgency** ("apply the latest changes", "next 2 weeks") | Urgency is the crowbar. Panic skips verification |
| 5 | The prompt arrives from a **link in a message** | Navigate from a trusted bookmark instead |

---

## Defenses: keep the sleigh on the rails 🛷

**Naughty list (do not)**
- Reuse a password "just this once, it's a small account"
- Log in via a link in an unexpected message
- Reply to, click, or casually forward a suspicious message
- Assume your mail relay is safe because it "only sends internal stuff"

**Nice list (do)**
- Open important services from a trusted bookmark or known company URL
- Pause when a message manufactures urgency, then verify via a separate, trusted channel
- Use unique passwords plus MFA — phishing-resistant MFA where you can get it
- Serve HTTPS-only sign-in pages and watch for lookalike domains (your brand will be impersonated; plan accordingly)
- Configure and monitor SPF, DKIM and DMARC; slam the door on unauthorized SMTP relay
- Run safe, blame-free simulations — and reward the person who reports the phish, don't punish the person who clicked
- If credentials may be phished: reset them, revoke sessions, audit mailbox rules and forwarding, review sign-in activity

Blame-free reporting is not softness. If reporting feels dangerous, people stay quiet, and silence is the attacker's favourite teammate. Every phish gets reported early when the alternative is a lecture.

---

## Answers (spoilers, obviously) 🎁

| Room question | Answer |
|---|---|
| What is the password used to access the TBFC portal? | `unranked-wisdom-anthem` |
| What is the total number of toys expected for delivery? | `1984000` |
| Optional prompt to visit the Phishing Prevention room | No answer needed |

<details>
<summary>Screenshot: accepted room answers</summary>

![The room marks the password and toy quantity as correct](screenshots/07-room-answers.png)

</details>

---

## FAQ

**Is `unranked-wisdom-anthem` a good password?**
It's hyphenated, multi-word, and better than `Password1!`, but you've missed the point so beautifully that I'm framing it. The failure wasn't entropy — it was **reuse**.

**Can I use this knowledge on a real company?**
No. That's not a prank, that's a crime, and the only sleigh you'd be riding is a court date. Also: this repo is a write-up of a *lab*, and labs are the only place these buttons get pressed.

**I think I've received a real phishing email. What do I do?**
Report it through your organisation's official channel (spam button, security team, whatever your IT department shouts about in October). Don't forward it around casually, don't reply to it, and don't click it to "see what happens" — that's how you become the incident.

**Why is the repo like this?**
Because security awareness that people actually finish beats a 40-slide deck that people scroll past. If a joke about Marta gets one more person to pause before typing a password, the tinsel did its job.

---

## Quick troubleshooting

- **Portal doesn't load:** confirm `server.py` is still running — it's not being coy, it has probably died — and use the current AttackBox IP with port `8000`.
- **Roundcube doesn't load:** use the current *target* IP, not the AttackBox IP. The room's screenshots use plain HTTP on the default port, because it's a lab and the lab has no fashion sense.
- **Mailbox login fails:** username is `factory`, password is the one from the portal step. Do not substitute a real or personal password. Ever. This is the one rule with no punchline.
- **SET prompts differ:** menu wording drifts between versions. Stay on the single-recipient path, keep the addresses inside your room, and don't improvise in the direction of real inboxes.

---

## Clean up 🧹

- Stop the local server with **Ctrl+C** (a key combination, and a lifestyle).
- Close the room session.
- Don't reuse the lab password anywhere. It's now a museum piece: look at it, don't touch it.
- In a real incident: report the phish, rotate anything possibly exposed, and thank the person who reported it.

---

<sub>Also in this repo, for no operational reason whatsoever: an [incident report](NORTH_POLE_INCIDENT_REPORT.md) written by elves at 02:00, [prank-vs-phishing ground rules](CONTRIBUTING.md), a [way to report an elf](SECURITY.md), a [festive licence](LICENSE), a [Makefile](Makefile) that can make Christmas, and a [coal-aware .gitignore](.gitignore).</sub>

<sub>*Write-up based on screenshots captured during the room. The IP addresses in those screenshots are transient lab addresses, not stable endpoints — much like the elves' sense of trust.*</sub>
