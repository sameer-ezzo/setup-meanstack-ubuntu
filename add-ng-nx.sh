# !/bin/sh

# Exit on error
set -e

curl -fsSL https://get.pnpm.io/install.sh | sh -
\. /home/$(whoami)/.bashrc
pnpm i --global @angular/cli nx
