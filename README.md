# My dotfiles for GitHub Codespaces

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

- Click `Use this template`
  - Create a repo at yourName/dotfiles
  - Make sure the repo is public
  - Global search for `bartr` and update
- The dotfiles are cloned to `/workspaces/.codespaces/.persistedshare/dotfiles/` when a `Codespace` is created
  - This command in install.sh links at `$HOME/dotfiles` for convenience
    - `ln -s /workspaces/.codespaces/.persistedshare/dotfiles $HOME/dotfiles`
  - You can keep the files updated using git pull
  - You can update your `dotfiles` in any `Codespace` and git push
  - You can reference the files in other startup scripts like `.zshrc`
- `install.sh` adds `$HOME/dotfiles/bin` to the path
  - a great place to keep scripts / utils that you use all the time

### Customizing your dotfiles

- Edit install.sh to install / customize any scripts / utilities
  - recommend not including `apt upgrade` in `install.sh`
- Edit my_zshrc with your preferences
  - install.sh adds a `source my_zshrc` to `$HOME/.zshrc`
  - since this is the last line in `.zshrc` commands will override previous values
- Add additional files to your dotfiles repo
  - You can add a `home` folder and have `install.sh` copy to $HOME
  - Make sure not to include any `secrets` in your public repo!
    - use [Codespaces Secrets](https://github.com/settings/codespaces) to inject

## How to file issues and get help  

This project uses GitHub Issues to track bugs and feature requests. Please search the existing issues before filing new issues to avoid duplicates. For new issues, file your bug or feature request as a new issue.

For help and questions about using this project, please open a GitHub issue.

## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us the rights to use your contribution. For details, visit <https://cla.opensource.microsoft.com>

When you submit a pull request, a CLA bot will automatically determine whether you need to provide a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/). For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Trademarks

This project may contain trademarks or logos for projects, products, or services.

Authorized use of Microsoft trademarks or logos is subject to and must follow [Microsoft's Trademark & Brand Guidelines](https://www.microsoft.com/en-us/legal/intellectualproperty/trademarks/usage/general).

Use of Microsoft trademarks or logos in modified versions of this project must not cause confusion or imply Microsoft sponsorship.

Any use of third-party trademarks or logos are subject to those third-party's policies.
