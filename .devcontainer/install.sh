# show progress
echo -e "Installing Node.js Version 24.x using fnm." 
sleep 3

# install fnm (Fast Node Manager)
curl -fsSL https://fnm.vercel.app/install | bash

# activate fnm
(
source ~/.bashrc
fnm use --install-if-missing 24
node -v
npm -v 
npx pnpm -v
) &