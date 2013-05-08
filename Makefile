#
# BUILD LIB FILES
#

build:
	mkdir -p dist
	cat lib/css/base.css lib/css/grid.css lib/css/buttons.css lib/css/icons.css lib/css/forms.css lib/css/tables.css > ./dist/chassis.tmp.css
	@echo "/**\n * ==================================\n * Chassis v1.0\n * Licensed under The MIT License\n * http://opensource.org/licenses/MIT\n * ==================================\n */\n\n" > ./dist/copywrite.txt
	cat ./dist/copywrite.txt ./dist/chassis.tmp.css > ./dist/chassis.css
	rm  ./dist/chassis.tmp.css ./dist/copywrite.txt