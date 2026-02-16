# SpamLens — Gmail Spam Analyzer

## Quick Start

### Mac / Linux
1. Double-click `start.command`
   (If macOS blocks it: right-click → Open → Open anyway)
2. Your browser opens automatically at http://localhost:8080

### Windows
1. Double-click `start.bat`
2. Your browser opens automatically at http://localhost:8080

---

## One-Time Google Setup (~5 minutes)

1. Go to https://console.cloud.google.com
2. Create a project → Enable **Gmail API**
3. APIs & Services → OAuth consent screen → External → add scope `gmail.readonly`
4. Credentials → Create Credentials → OAuth client ID → Web application
5. Authorized JavaScript origins: `http://localhost:8080`
6. Copy the Client ID → paste it into SpamLens → Sign in with Google

---

## How it works

- Clicking "Sign in with Google" redirects you to Google's auth page
- After you approve, Google redirects back to localhost with a token in the URL
- SpamLens reads the token and fetches your spam directly from Gmail's API
- Everything stays in your browser — no data is sent anywhere
