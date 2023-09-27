###############################################
#
# git_install_config.sh
# 
# This script installs git and configures it.
# It is meant to be run on a fresh install.
#
###############################################

# Check if git is already installed
if [ -x "$(command -v git)" ]; then
  echo "git is already installed"
else
  # check if apt or apt-get is installed
  if [ -x "$(command -v apt)" ]; then
    echo "apt exists"
    sudo apt update
    sudo apt install -y git
  elif [ -x "$(command -v apt-get)" ]; then
    echo "apt-get exists"
    sudo apt-get update
    sudo apt-get install -y git
  else
    echo "No package manager found. Please install apt or apt-get"
    exit 1;
  fi
fi

# git config, ask the user for infos
read -p "git.config.user.name: " name
read -p "git.config.user.email: " email
read -p "git.config.user.username: " username

git config --global user.name "$name"
git config --global user.email "$email"
git config --global user.username "$username"