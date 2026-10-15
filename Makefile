# 🎄 Makefile — North Pole tooling
#
# GNU Make lets us redefine the recipe prefix, which we do here because
# indentation debates have already ruined one Christmas.
.RECIPEPREFIX = >
.DEFAULT_GOAL := help

.PHONY: help christmas check-nice-list verify-sender portal mailbox naughty deploy coal clean all

help: ## Show this help (the only target that does anything useful)
> @echo "🎄 Merry Clickmas — available targets:"
> @echo ""
> @echo "  make christmas        Print a tree. It is not load-bearing."
> @echo "  make check-nice-list  Audit the repo for people on the Nice List"
> @echo "  make verify-sender    Reminder: display names are not authentication"
> @echo "  make portal           How to serve the lab portal (safely)"
> @echo "  make mailbox          How to reach the lab mailbox (in the room)"
> @echo "  make naughty          Attempt a naughty action (will refuse)"
> @echo "  make deploy           Absolutely not"
> @echo "  make coal             Deliver coal (the fun kind)"
> @echo "  make clean            Nothing to clean. We are tidy."
> @echo ""

christmas: ## Print a tree
> @echo "        *"
> @echo "       /_\\\\"
> @echo "      /___\\\\"
> @echo "     /_____\\\\"
> @echo "       |||"
> @echo "  (this is not a real tree)"

check-nice-list: ## Audit contributors
> @echo "🔎 Auditing the Nice List..."
> @echo "   ✓ everyone who reported a phish        → NICE"
> @echo "   ✓ everyone who clicked one and said so → NICE (bravery)"
> @echo "   ✓ anyone who reused a password         → NICE, but enrolled in MFA"
> @echo "   ✓ Santa                               → NICE (pending Q1 review)"
> @echo ""
> @echo "   Nobody gets coal for reporting. Nobody."

verify-sender: ## Check a sender before you trust it
> @echo "Before trusting a sender, confirm:"
> @echo "  1. The actual address — not the display name."
> @echo "  2. The context — did you expect this message?"
> @echo "  3. The urgency — is it being used as a crowbar?"
> @echo "  4. The destination — an IP address is not your company portal."
> @echo "  5. A second channel — ask a human, out loud, like an animal."
> @echo ""
> @echo "💡 'Flying Deer' is a display name, not evidence."

portal: ## Serve the lab portal — inside the room only
> @echo "python3 server.py      # run from ~/Rooms/AoC2025/Day02"
> @echo "http://<ATTACKBOX_IP>:8000"
> @echo ""
> @echo "⚠️  Authorized lab ranges only. Never to a real person."
> @echo "⚠️  Note the browser's 'Not Secure' warning. That is the lesson, not a bug."

mailbox: ## Reach the lab mailbox
> @echo "http://<TARGET_IP>/    # current session's target IP, not the screenshot's"
> @echo "user: factory"
> @echo "pass: the lab password from the portal step — never a real one"

naughty: ## Try to do a bad thing
> @echo "🚫 Request denied."
> @echo "   Phishing real people is not a prank, it is a crime."
> @echo "   This target exists for comic relief only."

deploy:
> @echo "❌ Refusing to deploy."
> @echo "   It's December 23rd. Nothing good has ever happened on December 23rd."

coal: ## Deliver coal, festively
> @echo "🪨 One (1) lump of coal."
> @echo "   Applied to: password reuse."
> @echo "   Not applied to: the person who reported the phish."

clean: ## Clean up
> @echo "🧹 Server stopped with Ctrl+C. Password retired. Sessions closed."
> @echo "   Lab password: do not reuse. Anywhere. For any reason."
> @echo "   In a real incident: reset, revoke sessions, audit rules, say thank you."

all: help
