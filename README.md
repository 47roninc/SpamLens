# 🔬 SpamLens

**Analyze your Gmail spam folder** — identify patterns, track volume trends over time, detect phishing attempts, and understand what's targeting your inbox.

SpamLens runs **100% locally in your browser**. Your emails never leave your machine.

![SpamLens Dashboard](https://via.placeholder.com/800x450/060c18/38bdf8?text=SpamLens+Dashboard)
*Replace this placeholder with a screenshot of your dashboard*

---

## ✨ Features

- **📈 Volume Trends** — Weekly and monthly spam charts showing changes over time
- **🎣 Phishing Detection** — Automatically identifies credential theft attempts
- **🔑 Keyword Analysis** — Visual cloud of urgency tactics and psychological triggers
- **🎯 Category Breakdown** — Splits spam into Phishing, Scams, Promotional, Newsletter, and Other
- **👤 Repeat Offenders** — Bar chart of top spam domains
- **📧 Full Message List** — Searchable, filterable feed of all spam emails

**All analysis happens in your browser.** SpamLens connects directly to Gmail's API — no backend, no server storing your data.

---

## 🚀 Quick Start

### Prerequisites
- Python 3 (check by running `python3 --version` or `python --version` in terminal)
- A Gmail account
- 5 minutes for one-time Google setup

### Installation

1. **Download this repository**
   - Click the green **Code** button above → **Download ZIP**
   - Unzip the folder

2. **Run the launcher**
   - **Mac/Linux:** Double-click `start.command` 
     - (If macOS blocks it: right-click → Open → Open anyway)
   - **Windows:** Double-click `start.bat`
   
   Your browser will open at `http://localhost:8080`

3. **Set up Google OAuth** (one-time, ~5 minutes)
   - See [detailed setup instructions below](#google-oauth-setup)

4. **Paste your Client ID into SpamLens** and click **Sign in with Google**

That's it! SpamLens will analyze your spam and show you the dashboard.

---

## 🔐 Google OAuth Setup

SpamLens uses Google's official OAuth to read your Gmail spam folder. Here's how to set it up:

### Step 1: Create a Google Cloud Project

1. Go to [console.cloud.google.com](https://console.cloud.google.com)
2. Click the project dropdown (top left) → **New Project**
3. Name it anything (e.g., "SpamLens") → **Create**

### Step 2: Enable Gmail API

1. In the search bar at the top, type **Gmail API**
2. Click the result → Click **Enable**

### Step 3: Configure OAuth Consent Screen

1. In the left sidebar: **APIs & Services** → **OAuth consent screen**
2. Choose **External** → **Create**
3. Fill in:
   - **App name:** SpamLens (or anything)
   - **User support email:** Your email
   - **Developer contact email:** Your email
4. Click **Save and Continue**
5. On the **Scopes** page, click **Save and Continue** (you can skip adding scopes manually)
6. On the **Test users** page:
   - Click **+ Add Users**
   - Enter your Gmail address
   - Click **Save**
7. Click **Save and Continue** → **Back to Dashboard**

### Step 4: Create OAuth Client ID

1. In the left sidebar: **APIs & Services** → **Credentials**
2. Click **+ Create Credentials** → **OAuth client ID**
3. Application type: **Web application**
4. Name: SpamLens (or anything)
5. Under **Authorized JavaScript origins**, click **+ Add URI**:
   ```
   http://localhost:8080
   ```
6. Under **Authorized redirect URIs**, click **+ Add URI**:
   ```
   http://localhost:8080/index.html
   ```
7. Click **Create**
8. **Copy your Client ID** (looks like `123456789-abc.apps.googleusercontent.com`)

### Step 5: Use Your Client ID

1. Paste it into SpamLens when prompted
2. Click **Sign in with Google**
3. Google will ask you to approve Gmail read-only access
4. You may see "This app isn't verified" — click **Advanced** → **Go to SpamLens (unsafe)**
   - This is normal for personal apps in testing mode
5. Click **Allow**

SpamLens will automatically fetch and analyze your spam!

---

## 📊 What Gets Analyzed

SpamLens fetches up to 200 messages from your Gmail spam folder and analyzes:

- **Volume trends** — How much spam you're receiving week-over-week and month-over-month
- **Categories** — Automatically classifies emails as Phishing, Scam, Promotional, Newsletter, or Other
- **Top domains** — Which senders are hitting you most frequently
- **Urgency keywords** — Words like "urgent", "act now", "final chance", "verify", etc.
- **Insights** — Auto-generated observations like volume changes, repeat offenders, and urgency tactics

---

## 🔒 Privacy & Security

- **No backend server** — SpamLens runs entirely in your browser
- **No data stored** — When you close the tab, everything is gone
- **Direct to Gmail** — Your emails are fetched directly from Google's servers to your browser
- **Read-only access** — SpamLens can only *read* your spam, never send, delete, or modify emails
- **Open source** — You can inspect all the code in `index.html`

Your OAuth token is stored in your browser's session only while analyzing. It's never sent to any third-party server.

---

## 🛠️ Troubleshooting

### "localhost refused to connect"
The local server isn't running. Instead of double-clicking the launcher:
- **Mac/Linux:** Open Terminal, navigate to the folder, run `python3 -m http.server 8080`
- **Windows:** Open Command Prompt, navigate to the folder, run `python -m http.server 8080`

Then go to `http://localhost:8080/index.html`

### "python was not found"
Install Python:
- Download from [python.org/downloads](https://www.python.org/downloads/)
- **Important:** Check "Add Python to PATH" during installation

### "Error 400: redirect_uri_mismatch"
In Google Cloud Console → Credentials, make sure you have:
- **Authorized JavaScript origins:** `http://localhost:8080`
- **Authorized redirect URIs:** `http://localhost:8080/index.html`

Both are required. Save and wait 1-2 minutes.

### "Error 403: access_denied"
Add yourself as a test user:
- Go to **OAuth consent screen** → scroll to **Test users** → **+ Add Users** → enter your Gmail address

### "Too many concurrent requests"
You've tried signing in too many times quickly. Wait 5-10 minutes and try again.

### "Something went wrong"
- Hard refresh the page (Ctrl+Shift+R or Cmd+Shift+R)
- Try in an incognito/private window
- Make sure Gmail API is enabled and has had 2-3 minutes to propagate

---

## 🤝 Contributing

Found a bug? Have a feature idea? 

- Open an issue
- Submit a pull request
- Share your thoughts

---

## 📝 License

MIT License - feel free to use, modify, and share!

---

## 💡 How It Works

SpamLens uses:
- **Google OAuth 2.0** for secure authentication
- **Gmail API** to fetch spam messages
- **Chart.js** for beautiful visualizations
- **Pure JavaScript** — no frameworks, no build step, just one HTML file

The app uses OAuth's implicit/token flow: when you click "Sign in with Google", you're redirected to Google's auth page. After approval, Google redirects back to localhost with an access token in the URL. SpamLens reads that token and uses it to make API calls directly to Gmail.

---

**Built with ☕ and curiosity about what's really in our spam folders.**
