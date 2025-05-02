# Grimoire

![Preview](https://raw.githubusercontent.com/navahas/grimoire/refs/heads/assets/images/grimoire.png)

This is a growing collection of reusable scripts designed for use with [tmux-grimoire](https://github.com/navahas/tmux-grimoire).
These scripts are designed to be used as **custom popup shells** triggered via `custom_shpell` in your `.tmux.conf`.

## How to Use

You can either manually copy the scripts you want or clone this repo to pick and choose from your local copy.

### Option 1: Manual Copy

Just copy the scripts you want into your custom grimoire folder:

```
mkdir -p ~/.config/grimoire
curl -o ~/.config/grimoire/smart-build.sh https://raw.githubusercontent.com/navahas/grimoire/main/utils/smart-build.sh
chmod +x ~/.config/grimoire/smart-build.sh
```

By default, tmux-grimoire uses `~/.config/grimoire` as the script base path.

### Option 2: Clone & Copy Locally

If you want to explore all scripts:

```
git clone https://github.com/navahas/grimoire.git
mkdir -p ~/.config/grimoire
cp grimoire/utils/*.sh ~/.config/grimoire/
chmod +x ~/.config/grimoire/*.sh
```

Then in .tmux.conf

```tmux
bind-key -T prefix b run-shell "custom_shpell standard build 'shpell/smart-build.sh' --replay"
```
If the script starts with shpells/, will resolve to @grimoire-path (default: `~/.config/grimoire`).

---

## Contributing

Have a handy shell script you use with tmux-grimoire?

We’d love to include it here!

Guidelines
- Scripts should be self-contained .sh files.
- Use clear names and add a short comment at the top explaining what it does.
- Keep dependencies minimal or document them clearly inside the script.

How to Contribute
1. Fork this repo
2. Add your script in the appropriate folder (e.g. utils/)
3. Make it executable: `chmod +x your-script.sh`
4. Add a one-liner explanation as a comment at the top of the script
5. Submit a pull request with a brief description

#### Categories (WIP)

We’ll eventually organize these scripts by purpose:
- utils/: general-purpose helpers (e.g. smart-build.sh)
- dev/: language/dev-related scripts
- ops/: monitoring/logs/system utilities
- fun/: personal, creative, or playful shpells
