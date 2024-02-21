
My dotfiles

Inspired by https://github.com/TechDufus/dotfiles

<!--toc:start-->
- [Usage](#usage)
  - [Install](#install)
<!--toc:end-->

## Usage

### Install
Clone this repository locally to `~/dotfiles`.

This repository includes a custom shell script located at `bin/dotfiles`. This script will making sure any Ansible dependencies are installed and then run the playbook.

Playbook requires sudo privileges to set default shell in role ```zsh``` and to install dependencies.
```bash
./dotfiles --ask-become-pass
```

If you only want to run specific roles use tags.
```bash
./dotfiles --ask-become-pass --tags nvim
```
