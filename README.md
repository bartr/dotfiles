# Sample dotfiles for GitHub Codespaces

- [GitHub Codespaces](https://github.com/features/codespaces) allows you to customize your environment after the base image is created
- This repo is an example of common tasks that can be automated
- [Unofficial guide](https://dotfiles.github.io/) to dotfiles on GitHub

> Your dotfiles repo has to be public
>
> Do not store keys or secrets in a public repo!

## Injecting Secrets

- Codespaces will inject secrets into `env vars` for you automatically
- Add your secrets [here](https://github.com/settings/codespaces)

### Usage

- Clone (do not fork) this repo to your public dotfiles repo
- The dotfiles are cloned to `/workspaces/.codespaces/.persistedshare/dotfiles/` when a `Codespace` is created
  - Add this command to your install.sh to mount at `$HOME/dotfiles`
    - `ln -s /workspaces/.codespaces/.persistedshare/dotfiles $HOME/dotfiles`
  - You can keep the files updated using git pull
  - You can update your `dotfiles` in `Codespace` and git push
  - You can reference the files in other startup scripts like `.bashrc`
- `install.sh` adds `$HOME/dotfiles/bin` to the path
  - a great place to keep scripts / utils that you use all the time

### Customizing your dotfiles

- Edit install.sh to install / customize any apps
  - recommend not including `apt upgrade` in `install.sh`
- Edit my_rc with your preferences
  - install.sh adds a `source my_rc` to `$HOME/.bashrc` and `$HOME/.zshrc`
  - since this is the last line in `.bashrc` commands will override previous values
- Add additional files to your dotfiles repo
  - You can add a `bin` folder and add to the path
  - You can add a `home` folder and have `install.sh` copy to $HOME
  - Make sure not to include any `secrets` in your public repo!
    - use [Codespaces Secrets](https://github.com/settings/codespaces) to inject
