# macos-dev-setup

My personal guide on how to set up a new Mac as a web developer workstation.

## Command Line Goodness

First, we will need a package manager.
I like to use the plain terminal for macOS with the RedSands profile and the Jovial Theme.

### Install macOS' Command Line Tools

Command Line Tools are an optional component of Xcode that bring a variety of advanced utilities to the Mac command
line, including compilers, debuggers, and other essentials for software development and command line
tinkering.[*](https://osxdaily.com/2024/09/30/how-install-command-line-tools-macos-sonoma/)

These are required for building packages from source.

```shell
xcode-select --install
```

### Install Homebrew, The Missing Package Manager for macOS

[Homebrew](https://brew.sh/) helps install the commands you need that Apple didn’t include with macOS. It is the macOS
equivalent of apt-get on Debian/Ubuntu
linux distros. Note that the CLI command is brew and not homebrew.

```shell
/bin/zsh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Generic Shell Utilities

Install GNU Core Utils. I use this here for the Gnu LS command `gls` that allows the `--group-directories-first` flag.
It is referred in the `ll` shortcut in the [.zlogin](.zlogin) file

```shell
brew install coreutils
```

### Install Jovial

[Jovial](https://github.com/zthxxx/jovial) is a nice [Oh My ZSH](https://ohmyz.sh/) theme that keeps things simple.
It means that you don't have to dive deep in the Oh My ZSH universe to customize a theme and 500 options and plugins.

```shell
curl -sSL https://github.com/zthxxx/jovial/raw/master/installer.sh | sudo -E zsh -s ${USER:=`whoami`}
```

No special font is needed, your typical monospaced font will do. _(Monaco, Menlo, JetBrains Mono)_
| NOTE: also remember to set font line-height to 1.0

An interesting alternative to Oh My ZSH and Jovial is [iTerm2](https://iterm2.com/) that you can customize to reach a
feature equivalence.

Now is the time to copy the [.zlogin](.zlogin) file to your $HOME folder. This will override the weird squigly faces of
Jovial that represent a dirty or clean state for git repositories. This also overrides Jovial's `ll` shortcut that is
not to my liking with gls from `coretuils` (see above).

## Install programming tools

What's your stack? Mine is of many.

### Node.js

```shell
# Node.js packages
brew install nvm 
# Set NVM - Node Version Manager - To use the latest Node version
nvm install node
# OR Set NVM - Node Version Manager - To use the latest Long-Term Support version
nvm install --lts
```

### Install Java through SDKMan

Use [SDKMan](https://sdkman.io/) to manage Java, Kotlin, Groovy, Gradle, Maven & more

```shell
curl -s "https://get.sdkman.io" | zsh
```

Open a new shell, then run

```shell
source "$HOME/.sdkman/bin/sdkman-init.sh"
```

to finish the installation process.

List available Java JDK and install the one you like.

```shell

sdk list java
sdk install java # Append desired specifier from the list command
```

Repeat for Gradle, Kotlin and as many formulas as needed.

### Install [Python](https://www.python.org/)

I have encountered permission issues with Python's venv — Virtual Environments — using the Homebrew version.
It is preferable to use the official binaries from Python's [Download Page](https://www.python.org/downloads/)

### PHP

PHP & Composer should be all you need, but [PHPbrew](https://github.com/phpbrew/phpbrew) can help with managing multiple
PHP versions on your machine.

```shell
# PHP packages
brew install php phpbrew composer

```

## ZSH Config files

This repository includes 3 zsh config files

- [.zprofile](.zprofile)
    - Loads before .zshrc
    - Contains NVM, SDKMan and Homebrew configs
    - If anything you put in there does not behave as expected, or is not loaded, it might be the victim of an override
      from the theme setup. Therefore, try moving your lines to the .zlogin file
    - Includes a daily auto-update automation for Node.js through nvm, homebrew packages and global npm packages
- [.zshrc](.zshrc)
    - Loads in second place
    - Contains Oh My ZSH with Jovial Theme config
    - Other setups will recommend using this file for config, I prefer to keep Jovial / Oh my ZSH in there on its own
      and use the other two, depending on the use case.
- [.zlogin](.zlogin)
    - Loads after `.zshrc`
    - I use it to override Oh my ZSH Jovial settings that I do not like

Reminder: The load order for zsh config files is the following:

- .zshenv
- .zprofile
- .zshrc
- .zlogin
- .zlogout (loaded when quitting)

You should have copied [.zlogin](.zlogin) already from earlier steps. Now is the time to copy
over [.zprofile](.zprofile) and [.zshrc](.zshrc). You can copy them as-is, but using a diff tool is
better here to make sure you only take what you need from these files.

## IDE

Now's the time for installing your favorite IDE.

### The JetBrains Collection

If you are using any JetBrains IDE,
especially if you use more than one, I recommend using the
[JetBrains Toolbox App](https://www.jetbrains.com/toolbox-app/)

### Visual Studio Code

[Visual Studio Code](https://code.visualstudio.com/) is also a safe bet. Although I appreciate Microsoft's turn towards
open-source and plugin oriented solutions, I still prefer JetBrains' IDEs since they make very reliable plugins. When
searching for a plugin that they don't provide, you will generally only have one option, and it will be just what you
need, therefore avoiding the need to evaluate a plethora of candidates.

It is a better solution for Shopify development, since Liquid syntax support is clearly outdated and neglected in
JetBrains solutions (as of 2023/2024).

### Zed

[Zed](https://zed.dev/) is an up-and-coming IDE, superfast and with an AI first mindset. I love it, but at the time of
this writing, it is missing a critical feature a [diff view](https://github.com/zed-industries/zed/issues/4523).

