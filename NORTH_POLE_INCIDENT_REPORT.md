# 🔔 NORTH POLE INCIDENT REPORT

> **Classification:** Internal — Nice List eyes only
> **Ticket:** INC-2025-1224-002
> **Severity:** P1 · *Ho Ho Ho*
> **Status:** Contained (the password, however, is gone forever)
> **Author:** On-call elf, 02:14, running on three candy canes and spite

---

## Summary

At 13:34 on 10 October, a production and shipping request was sent to the `factory` mailbox. Within the same operational window, a credential harvested from a lookalike "TBFC Staff Portal" page was successfully reused against that same mailbox. An unauthorised party read an urgent email containing a delivery quantity of **1,984,000 units**.

No malware was used. No exploit was required. Nobody cracked a password. A human being clicked a link and typed something, which is — as always — the cheapest attack vector ever invented.

## Impact

| Asset | Status |
|---|---|
| TBFC portal credential | Compromised (typed into a page serving plain HTTP) |
| `factory` mailbox | Accessed by unauthorised party |
| Delivery quantity (1,984,000 toys) | Disclosed |
| Elves' confidence | Degraded |
| Santa's blood pressure | See figure 1 (the figure is a red rectangle) |

## Timeline (all times local to the workshop)

| Time | Event |
|---|---|
| 13:34 | Marta sends `Urgent: Production & Shipping Request — 1984000 Units (Next 2 Weeks)`. Legitimate. Accurate. Snitched on by circumstances. |
| +~minutes | `updates@flyingdeer.thm`, display name "Flying Deer", arrives with a routine-sounding re-authentication prompt |
| +~seconds | An elf considers the message for a duration best measured in "yes" |
| +~seconds | Portal password entered into a page marked **Not Secure**, over HTTP, on an IP address |
| +~minutes | Same password used to sign in to the `factory` mailbox. It worked. It should not have. |
| +~minutes | The 1,984,000-unit request is read by the wrong person |
| 02:00 | On-call elf files this report. Santa asks "who is Flying Deer." Nobody knows. Nobody has ever known. |
| 02:14 | Everyone agrees the word "re-authenticate" should be legally required to arrive with a phone call |

## Root cause

**Password reuse between an unverified portal and a real mailbox.** Everything else is decoration.

The attacker's actual technique was: *ask nicely, use familiar words, and let the human complete the exploit.*

## The Five Whys (conducted at 02:00, quality of answers degrades)

1. **Why was the mailbox read?** Because someone had valid credentials.
2. **Why did they have valid credentials?** Because the same password protected both the lookalike portal and the mailbox.
3. **Why was the password entered on the portal?** Because the page looked like TBFC and the message sounded routine.
4. **Why did the message sound routine?** Because it referenced delivery-manifest changes, which is a real thing we do, on a schedule, with no security ceremony.
5. **Why did nobody verify the sender?** Because it arrived on a Tuesday morning during shipping season and everyone was already six hours behind.

## Contributing factors

- Login page served over plain HTTP and identified by an IP address
- Display name "Flying Deer" accepted as evidence of anything
- No MFA on the `factory` mailbox
- A mail relay happy to accept unauthenticated senders in the lab environment
- The phrase "re-authenticate" possessing an almost supernatural ability to make busy people stop thinking

## What made this worse than it needed to be

Nothing. It was already maximal for minimal effort. That *is* the finding.

## What made this better than it could have been

- The mailbox contained a production request and not, for example, payroll, HR records, or the Naughty List. (The Naughty List has its own controls now. We are not discussing the Naughty List.)
- The lesson landed before December 24th.

## Action items

| # | Action | Owner | Due |
|---|---|---|---|
| 1 | Enforce unique passwords + MFA on every mailbox | Elf SecOps | Before the next delivery window |
| 2 | Retire HTTP-only sign-in pages; HTTPS or nothing | Platform elves | Sprint 1 of the new year |
| 3 | SPF, DKIM, DMARC everywhere; no unauthenticated relay | Mail elf | Immediately |
| 4 | Bookmark-based access to staff portals; ban link-driven logins | Everyone | Now |
| 5 | Make reporting a phish fast, easy, and blame-free | Head Elf | This week |
| 6 | Rewrite the word "re-authenticate" out of all internal comms and replace it with "we will never ask you for this by email" | Comms | Retroactively |
| 7 | Ask Marta to maybe not open with "Urgent" | Marta | Marta has declined |

## Lessons, in the order the elves will actually remember them

1. A familiar name is not authentication.
2. Urgency is the tool, not the context.
3. Reuse turns one mistake into two incidents.
4. A mailbox is a data store. Treat it like one.
5. Report early. Nobody is getting a lump of coal for reporting.

---

*Signed, the on-call elf — who would like it noted, for the record, that this report was filed while off shift, on a Tuesday, with no biscuits available in the incident room.*
