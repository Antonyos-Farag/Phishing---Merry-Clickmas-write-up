# Contributing 🧝

Thanks for wanting to help! This repo is a humorous write-up of an **authorized lab**. Contributing is welcome — the rules are short, and one of them is load-bearing.

## The one rule that actually matters

**This repo is for reading and for jokes about security awareness, not for building attacks.**

Contributions must not include, and will be closed for including:

- Real phishing pages, credential-capture forms, or anything designed to harvest a real login
- Clones of real companies' login screens, logos, or branding (the room's fictional "TBFC" stays fictional)
- Live sender infrastructure, SMTP relay configuration aimed at real hosts, or mass-mail templates
- Anything that is, or looks like, a weaponised lure
- Real credentials of any kind. Not yours, not a lab's, not an "obviously fake" one, not even in a screenshot

If a change would only make sense to someone attacking a real human, it's not for this repo.

## Prank vs. phishing: the laugh test

| ✅ Prank | ❌ Phishing |
|---|---|
| Hiding the office stapler | Sending mail that pretends to be IT |
| Renaming the Wi-Fi to "Get Off My LAN" | Standing up a Wi-Fi called "Get Off My LAN" that points at your own portal |
| A birthday cake shaped like a laptop | A login page shaped like your company's |
| This repo, which is words about a lab | Anything that captures a password for real |

The distinction is simple: **a prank has a punchline; phishing has a payload.** If someone could lose an account, a job, or money, it's not a prank, and it's not welcome here.

## Style guide

- Accuracy first. Jokes are on top of the facts; if a joke makes a step wrong, the joke loses. The answer `1984000` stays `1984000` no matter how funny you get.
- Never replace an `<IP>` placeholder with a real host.
- Keep the safety note at the top of the README. It's the only serious paragraph and it stays.
- Defenses sections stay genuinely useful. Nobody has ever fixed an outage with irony.
- Santa's name may be used in job titles only.

## What we'd love

- Typos, broken links, and screenshots that went stale
- Better explanations of *why* a step works — especially for people doing their first room
- Extra defenses that are actually implementable by a small team
- Accessibility fixes (alt text, contrast, screen-reader friendly structure)
- Jokes. Good ones. Build-quality ones.

## What we won't merge

- Anything that turns the write-up into a tutorial for harming a real person or organisation
- "It's fine, it's for awareness" used as a reason to ship a working phish
- Anything that makes the safety note into a footnote

## Submitting

1. Open a PR against this repo with a clear description of what changed and why.
2. If your change touches the walkthrough, re-run the steps if you can and say so.
3. Be kind in review. Everyone here is on the same team, and the team includes people who have clicked a bad link before — which is, statistically, everyone.

## Code of conduct, briefly

Don't be a grinch. Disagreement is fine, contempt is not. Every contributor has been phished at least once, or will be, and this repo exists precisely because that's true of all of us.
