build:
	ruby gen.rb "#d40000" >logo-red.svg
	ruby gen.rb white >logo-white.svg

png:
	magick -density 300 -background none logo-red.svg -resize 512x512 logo-red.png
	magick -density 300 -background none logo-white.svg -resize 512x512 logo-white.png

favicon:
	magick -density 100 -background none logo-red.svg -resize 32x32 favicon.png

watch:
	fswatch logo.erb gen.rb | xargs -n1 -I{} make build
