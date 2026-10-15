# 📸 Evidence Log — Exhibit A through Exhibit 🎁

Chain of custody: strong. Chain of password reuse: also strong, unfortunately.

All images were captured during the authorized TryHackMe room. The IPs visible in them were **transient lab addresses** and are almost certainly doing something else now — possibly printing someone's Q3 report in a building you've never visited.

| Exhibit | File | What it proves | Elven commentary |
|---|---|---|---|
| A | [`01-day02-files.png`](01-day02-files.png) | The room supplies `index.html` and `server.py` | Two files. One of them is a whole phishing campaign. Modesty is a design choice. |
| B | [`02-set-toolkit.png`](02-set-toolkit.png) | SET starts | The Social-Engineer Toolkit, named as though social engineering were a sports utility vehicle. |
| C | [`03-set-mailer-menu.png`](03-set-mailer-menu.png) | Menu path 5 → 1 | "Mass Mailer Attack" — a menu label that would never survive a legal review, presented as option five, calmly, in a terminal. |
| D | [`04-set-smtp-configuration.png`](04-set-smtp-configuration.png) | Sender, relay and recipient fields | "Flying Deer" is not a company. It has never been a company. It sounds like a mascot that escaped a logistics brochure. |
| E | [`05-tbfc-portal.png`](05-tbfc-portal.png) | The lookalike TBFC sign-in page, over HTTP, marked **Not Secure** | The browser is doing the awareness training. For free. In the address bar. And people scroll straight past it. |
| F | [`06-factory-mailbox.png`](06-factory-mailbox.png) | Marta's `Urgent: Production & Shipping Request — 1984000 Units (Next 2 Weeks)` | Marta did nothing wrong. Marta is a victim of process. Marta is, in fact, the hero of this repository. |
| G | [`07-room-answers.png`](07-room-answers.png) | Accepted answers confirmed | The satisfying part, if you enjoy watching a multi-stage failure get scored out of two. |

## Notes on handling

- The password shown in the room is a **lab artefact**. It is public, worthless, and retired. It is not now, and has never been, a real credential. Do not enter it anywhere; do not enter your own anywhere that looks like this.
- Any address in these images should be treated as dead. If it happens to be alive, it belongs to somebody else, and they've had enough.
- If you're reproducing this write-up, keep the "Not Secure" screenshot visible. It is, genuinely, the single most transferable red flag in the set — the one clue that requires no tools, no experience, and no thinking, and still gets ignored by millions of people a year.

<sub>Filed by the on-call elf, who would like to note that Exhibit E is the only screenshot in history to be both evidence and a public service announcement.</sub>
