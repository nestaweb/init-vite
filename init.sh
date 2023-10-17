if [ -z "$1" ]
then 
	directory="Vite-App"
else
	directory=$1
fi

alias init_vite="sh ~/init-vite/init.sh"

echo $directory "has been created"

# Create vite app with vanilla template
npm create vite@latest $directory -- --template vanilla
cd $directory

# Clean directory
rm counter.js javascript.svg main.js style.css index.html

# Copy files from init-vite
cp -r ~/init-vite/app ./
# cp -r ~/init-vite/index.html ./
cp -r ~/init-vite/styles ./
mkdir images
touch index.html
cat ~/init-vite/head.html > index.html
echo $directory >> index.html
cat ~/init-vite/starter.html >> index.html
echo $directory >> index.html
cat ~/init-vite/end.html >> index.html

# Dependencies
npm install
npm i @studio-freight/lenis
npm add 'split-type'
npm add 'gsap'
npm install -D sass

# Run dev server
npm run dev
