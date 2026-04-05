#!/bin/bash

set -e  # stop on any error

echo "🔥 Hey! Let's install synfetch 🔥"

echo "🔍 Checking for existing synfetch..."

if command -v synfetch &>/dev/null; then
    OLD_PATH=$(command -v synfetch)
    echo "⚠️  Found old synfetch at: $OLD_PATH"
    echo "🗑️  Removing it now..."
    sudo rm -f "$OLD_PATH"
    echo "✅ Old version removed!"
else
    echo "✅ No existing synfetch found. Fresh install incoming~"
fi

for path in /usr/bin/synfetch /usr/local/bin/synfetch /usr/local/sbin/synfetch ~/.local/bin/synfetch; do
    if [ -f "$path" ]; then
        echo "🧹 Extra cleanup: removing leftover at $path"
        sudo rm -f "$path" 2>/dev/null || true
    fi
done

echo "📥 Cloning the latest synfetch from GitHub..."
git clone https://github.com/SXSLVT/synfetch.git synfetch-temp 2>/dev/null || {
    echo "❌ Clone failed! (is git installed?)"
    exit 1
}

cd synfetch-temp

echo "🔧 Making synfetch executable..."
chmod +x synfetch

echo "📦 Moving to /usr/local/bin/ (system-wide)..."
sudo mv synfetch /usr/local/bin/

cd - >/dev/null
echo "🧹 Cleaning up temp folder..."
rm -rf synfetch-temp

echo "🚀 Running synfetch to celebrate the new install..."
echo "────────────────────────────────────────────────────────────"
synfetch
echo "────────────────────────────────────────────────────────────"

echo "🎉 synfetch is now installed and ready!"
echo "   Just run 'synfetch' anytime (or 'synfetch --live' for the cool real-time mode)"
echo "   Made with love for you @SXSLVT 💖"
