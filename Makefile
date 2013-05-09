#
# BUILD LIB FILES
#

build:
	mkdir -p dist
	cat lib/css/base.css lib/css/grid.css lib/css/buttons.css lib/css/icons.css lib/css/forms.css lib/css/tables.css > ./dist/chassis.tmp.css
	@echo "/**\n * ==================================\n * Chassis v1.0\n * Licensed under The MIT License\n * http://opensource.org/licenses/MIT\n * ==================================\n */\n\n" > ./dist/copywrite.txt
	cat ./dist/copywrite.txt ./dist/chassis.tmp.css > ./dist/chassis.css
	rm  ./dist/chassis.tmp.css ./dist/copywrite.txt

#
# BUILDS GH-PAGES BRANCH
#

gh-pages: build
	mkdir -p gh-pages
	cp -r docs/ gh-pages/
	cp -r lib gh-pages/lib
	cp -r dist gh-pages/dist
	cd gh-pages
	cp -r dist chassis
	zip -r chassis.zip chassis
	rm -rf chassis
	cd ..
	git fetch origin
	git checkout gh-pages
	sed -i -e 's/\.\.\//\.\//g' gh-pages/index.html
	sed -i -e 's/\.\.\//\.\//g' gh-pages/layout-example-one.html
	sed -i -e 's/\.\.\//\.\//g' gh-pages/layout-example-two.html
	sed -i -e 's/\.\.\//\.\//g' gh-pages/layout-example-three.html
	rm -rf ./css
	rm -rf ./js
	rm -rf ./lib
	rm -rf ./dist
	mv gh-pages/* .
	rm -rf ./*-e
	rm -rf gh-pages