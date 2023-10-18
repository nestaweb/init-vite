if [ -z "$1" ]
then 
	directory="Vite-App"
else
	directory=$1
fi

if [ -z "$2" ]
then 
	# Clean directory
	rm counter.js javascript.svg main.js style.css index.html

	# Copy files from init-vite
	cp -r ~/init-vite/app ./src
	# cp -r ~/init-vite/index.html ./
	cp -r ~/init-vite/styles ./src
	mkdir images
	touch index.html
	cat ~/init-vite/head.html > index.html
	echo $directory >> index.html
	cat ~/init-vite/starter.html >> index.html
	echo $directory >> index.html
	cat ~/init-vite/end.html >> index.html

	# Dependencies
	npm add 'split-type'
	npm add 'gsap'
	echo "====== ====== there1 == ======= = === "
else
	template=$2
	echo "====== ====== there2 == ======= = === "
	cp -r ~/init-vite/styles ./src
	cat ./index_vue.js > ./src/main.js
fi

if [ $1 == "--update" ]
then
	cd ~/init-vite
	git pull
	echo "init-vite has been updated"
	exit
fi

alias init_vite="sh ~/init-vite/init.sh"

echo $directory "has been created"

# Create vite app with vanilla template
npm create vite@latest $directory -- --template $template
cd $directory

# Run dev server
npm install
npm install -D sass
npm i @studio-freight/lenis
npm run dev