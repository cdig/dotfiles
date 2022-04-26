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
brew install awscli bash bat cloc diff-so-fancy exa fd git hub node rbenv sass/sass/sass yarn

# Change the shell from system bash to brew bash:
# 1. Go to System Prefs > Users & Groups
# 2. Click the lock in the bottom left to unlock the preference pane
# 3. Right-click the current user, and choose "Advanced Options…"
# 4. Change the Login shell to /opt/homebrew/bin/bash

# Install the standard npm packages
npm install -g cdig/cli gulp-cli coffeescript

# Install desired atom packages (must install one package per line)
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
# If hub asks for credentials, your username is your GitHub username
# For password, you have to use a token: https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token
# The token issue is explained here: https://github.com/github/hub/issues/2655
# Note that hub is no longer officially supported, so it might break in the future
# Note that these dotfiles might behave weirdly if you don't have ruby installed. If that's the case, please edit this guide (Ivan) to pull the ruby install up from the developer section below.

# If desired, interactively set up opinionated Mac defaults
bash sane-defaults.sh
```

If you're just working on content, you're done! Head back to the [Setting up a new Mac](https://github.com/cdig/docs/wiki/Setting-up-a-new-Mac) guide.

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
