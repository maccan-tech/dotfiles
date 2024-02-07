My dotfiles

## Usage

### Install
Clone this repository locally to `~/dotfiles`.
This repository includes a custom shell script located at `bin/dotfiles`. This script will making sure any Ansible dependencies are installed and then run the playbook.
Playbook requires sudo privileges to set default shell.
```bash
./dotfiles --ask-become-pass
```
