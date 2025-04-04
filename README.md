# Custom Buoys

This is a growing collection of reusable scripts designed for use with [tmux-buoyshell](https://github.com/navahas/tmux-buoyshell).

These scripts are designed to be used as **custom popup shells** triggered via `custom_buoy` in your `.tmux.conf`.

--- 

## How to Use

You can either manually copy the scripts you want or clone this repo to pick and choose from your local copy.

### Option 1: Manual Copy

Just copy the scripts you want into your custom buoys folder:

```bash
mkdir -p ~/.config/custom-buoys
curl -o ~/.config/custom-buoys/smart-build.sh https://raw.githubusercontent.com/navahas/custom-buoys/main/utils/smart-build.sh
chmod +x ~/.config/custom-buoys/smart-build.sh
```

By default, tmux-buoyshell uses `~/.config/custom-buoys` as the script base path.

### Option 2: Clone & Copy Locally

If you want to explore all scripts:

```bash
git clone https://github.com/navahas/custom-buoys.git
mkdir -p ~/.config/custom-buoys
cp custom-buoys/utils/*.sh ~/.config/custom-buoys/
chmod +x ~/.config/custom-buoys/*.sh
```

Then in .tmux.conf

```tmux
bind-key -T prefix B run-shell "custom_buoy standard build 'buoys/smart-build.sh' --replay"
```
If the script starts with buoys/, will resolve to @buoyshell-buoyspath (default: `~/.config/custom-buoys`).

---

## Contributing

Have a handy shell script you use with tmux-buoyshell?

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

### Categories (WIP)

We’ll eventually organize these scripts by purpose:
	•	utils/: general-purpose helpers (e.g. smart-build.sh)
	•	dev/: language/dev-related scripts
	•	ops/: monitoring/logs/system utilities
	•	fun/: personal, creative, or playful buoys
