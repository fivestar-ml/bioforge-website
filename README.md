# BioForge Public Website

Static launch pages for the URLs currently referenced by the app:

- `https://zboxgames.com/`
- `https://zboxgames.com/app-ads.txt`
- `https://zboxgames.com/privacy`
- `https://zboxgames.com/support`
- `https://zboxgames.com/fairway-fortune/`
- `https://zboxgames.com/fairway-fortune/privacy/`
- `https://zboxgames.com/fairway-fortune/support/`

These files are ready to publish to any static host. Before App Store submission, confirm that:

- The `zboxgames.com` domain points to the chosen host.
- `/app-ads.txt` is publicly reachable and contains `google.com, pub-3492670382418249, DIRECT, f08c47fec0942fa0` for Fairway Fortune AdMob verification.
- `zboxgamessupport@gmail.com` is a real monitored mailbox, or replace it everywhere with the final support contact.
- `/privacy` and `/support` are publicly reachable without login.
- The privacy policy still matches `BioForge/Resources/PrivacyInfo.xcprivacy` and the App Store Connect privacy answers.
- `/fairway-fortune/privacy/` and `/fairway-fortune/support/` are publicly reachable without login.
- The Fairway Fortune privacy policy still matches `GolfIdle/PrivacyInfo.xcprivacy` and the App Store Connect privacy answers.

Run the local static-page check before publishing:

```sh
scripts/check-pages.sh
```
