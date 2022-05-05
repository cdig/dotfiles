# Dotfiles

These are the CDIG-standard dotfiles and initialization scripts for setting up a new Mac.

This guide assumes you're coming from our [Setting up a new Mac](https://github.com/cdig/docs/wiki/Setting-up-a-new-Mac) guide.

Run the following commands in Hyper one at a time.

```bash
# First, change the shell from system zsh to system bash
chsh -s /bin/bash

# Then, install the CLI Tools if needed (just the tools, not Xcode)
xcode-select --install

# Then, install homebrew
open -a safari https://brew.sh

# Here are all the brew binaries we tend to use
brew install awscli bash bat cloc diff-so-fancy exa fd git node rbenv sass/sass/sass yarn

# Change the shell from system bash to brew bash:
# 1. Run the following, and note what the response is
brew --prefix
# 2. Go to System Prefs > Users & Groups
# 3. Click the lock in the bottom left to unlock the preference pane
# 4. Right-click the current user, and choose "Advanced Options…"
# 5a. If the brew --prefix command returned /usr/local, change the Login shell to /usr/local/bin/bash
# 5b. If the brew --prefix command returned /opt/homebrew, change the Login shell to /opt/homebrew/bin/bash

# Install the standard npm packages
npm i -g npm cdig/cli gulp-cli coffeescript

# Install desired atom packages (must install one package per line)
# If running these shows an error, just open Atom and choose Atom > Install Shell Commands
apm i auto-dark-mode
apm i auto-update-packages
apm i file-icons
apm i highlight-selected
apm i ivanreese/old-atom-dracula
apm i pretty-json
apm i show-invisibles-plus
apm i sorter
apm i tabs-to-spaces

# Set up the dotfiles
git clone https://github.com/cdig/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
source bootstrap.sh
# If git asks for credentials (like a username or password), stop here and get Ivan to help!
# Note for Ivan: use a token: https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token
# Note for Ivan: the token issue is explained here: https://github.com/github/hub/issues/2655
# Note for Ivan: these dotfiles might behave weirdly if you don't have ruby installed. If that's the case, please edit this guide (Ivan) to pull the ruby install up from the developer section below.

# If desired, interactively set up opinionated Mac defaults
bash sane-defaults.sh
```

If you're just working on content, you're done! Head back to the [Setting up a new Mac](https://github.com/cdig/docs/wiki/Setting-up-a-new-Mac) guide.

---

If you are a developer working on the LBS website itself, continue with the below.

```
# Set up an SSH key on Github
ssh-keygen -t rsa
pbcopy < ~/.ssh/id_rsa.pub
open -a safari https://github.com/settings/ssh

# Install the Heroku CLI
brew tap heroku/brew && brew install heroku

# Set up Ruby
rbenv install -l # Figure out which version of ruby is the current
ruby_version="3.1.2" # Update accordingly
rbenv install "$ruby_version"
rbenv global "$ruby_version"
rbenv shell "$ruby_version"
gem update --system
gem install bundler
gem install rails
rbenv rehash
```

Finally, install the [Postgres app](https://postgresapp.com) if needed, and then update `PGDATA` in `.bashrc` to the right version.
