![Preview](https://raw.githubusercontent.com/navahas/grimoire/refs/heads/assets/images/grimoire.png)

# Grimoire

This is a growing collection of reusable scripts designed for use with 
These scripts are designed to be used as **custom popup shells** triggered via `custom_shpell` in your `.tmux.conf`.

A curated collection of reusable shell scripts ("shpells") for enhancing your workflows. Use them as summonable popup shells in [tmux-grimoire](https://github.com/navahas/tmux-grimoire) or integrate them directly into your shell via aliases or by adding them to your PATH.

--- 
## How to Use

Choose your preferred setup:

### For tmux-grimoire

Scripts are loaded from your `@grimoire-path` (default: `~/.config/grimoire`).

1. Clone repo
   ```bash
   git clone https://github.com/navahas/grimoire.git ~/.config/grimoire
   ```
2. Make executable
   ```bash
   chmod +x ~/.config/grimoire/**/*.sh
   ```
3. Bind in `~/.tmux.conf`
   ```tmux
   bind-key -T prefix b \
     run-shell "custom_shpell standard build 'shpells/smart-build.sh' --replay"
   ```

### Standalone (Shell/CLI)

1. Clone or download to a directory on your PATH, e.g.:
   ```bash
   git clone https://github.com/navahas/grimoire.git ~/grimoire
   mv ~/grimoire/utils ~/grimoire/dev ~/grimoire/ops ~/grimoire/fun ~/scripts  # or your chosen location
   ```
2. Add to PATH (add to `~/.bashrc` - `~/.zshrc` etc.):
   ```bash
   export PATH="$HOME/scripts:$PATH"
   ```
3. Run scripts directly:
   ```bash
   smart-build.sh   # equivalent to shpells/smart-build.sh
   ```

---

## Usage Examples

### tmux-grimoire

Trigger as a popup shell:
```tmux
bind-key -T prefix S \
  run-shell "custom_shpell standard smart-build 'shpells/smart-build.sh' --replay"
```

### Shell alias

Add to your shell config:
```bash
alias build="smart-build.sh"
```
Then run:
```bash
build
```

---

## Contributing

Contributions welcome! Please:

1. Fork this repo
2. Add a self-contained `.sh` script under a category folder
3. Add a one-line comment at the top explaining its purpose
4. `chmod +x your-script.sh`
5. Submit a PR with a brief description

Guidelines:

- Single-file scripts
- Clear naming & minimal dependencies

---

## Categories (WIP)

- `utils/` — general helpers (e.g. `smart-build.sh`)
- `dev/`   — development & build tools
- `ops/`   — system monitors, logs
- `fun/`   — playful or personal scripts

---
Made with ✨ by [navahas](https://github.com/navahas)
