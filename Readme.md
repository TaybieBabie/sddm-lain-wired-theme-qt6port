# Sddm-lain-wired-theme

A sddm login screen inspired by 1998 anime ["Serial Experiments Lain"](https://myanimelist.net/anime/339/Serial_Experiments_Lain)

**Note-
This is a fork.
Original version can be found [here](https://gitlab.com/mixedCase/sddm-lain-wired-theme)**

This one contains changes that I made for my 1366*786 screen.

## Qt6 / modern SDDM compatibility

This theme has been ported away from **QtQuick Controls 1.4** so it works with modern SDDM greeters that run on **Qt6** (including Bazzite defaults).

# In action :-
You can watch the preview video [here.](https://youtu.be/M-p7cHx4OM0)

# Installation :-
**Arch Linux**

It is available on the [AUR](https://aur.archlinux.org/packages/sddm-lain-wired-theme), you can install it with `makepkg` or using an AUR helper.

Using `makepkg`:

```shell
git clone https://aur.archlinux.org/sddm-lain-wired-theme.git
cd sddm-lain-wired-theme
makepkg -Ccsi
```

**Other GNU/Linux distros**
- Make sure you have sddm installed and configured as your default login manager.
- Install SDDM with Qt6 support and Qt multimedia runtime packages using your distro package manager (for example, `sddm` + Qt6 multimedia packages).
- No QtQuick Controls 1.x package is required anymore.
- Wav audio codecs are needed to play the sound, make sure you have package(s) that fulfill that installed. 
- Download the [latest release](https://github.com/lll2yu/sddm-lain-wired-theme/releases/latest)
- Decompress the `*.zip` or `*.tar.gz` file or run `git clone https://github.com/lll2yu/sddm-lain-wired-theme`
- Copy all files and directories into `/usr/share/sddm/themes/sddm-lain-wired-theme/` or open a terminal and run `sudo cp -r sddm-lain-wired-theme /usr/share/sddm/themes`

### Usage
- Open up your configuration file `/etc/sddm.conf` and set `sddm-lain-wired-theme` as your current theme

```shell
[Theme]
# Current theme name
Current=sddm-lain-wired-theme
```
- Now you are all set. Enjoy the aesthetic.
