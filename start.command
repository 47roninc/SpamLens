#!/bin/bash
# SpamLens Launcher
# Double-click this file (or run it in Terminal) to start SpamLens

PORT=8080
DIR="$(cd "$(dirname "$0")" && pwd)"

echo "🔬 Starting SpamLens on http://localhost:$PORT"
echo "   Press Ctrl+C to stop."
echo ""

# Kill anything already on port 8080
lsof -ti tcp:$PORT | xargs kill -9 2>/dev/null

# Open browser after short delay
(sleep 1.2 && open "http://localhost:$PORT/index.html" 2>/dev/null || xdg-open "http://localhost:$PORT/index.html" 2>/dev/null) &

# Start server
cd "$DIR"
python3 -m http.server $PORT
