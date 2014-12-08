build:
	ruby gen.rb "#d40000" >logo-red.svg
	ruby gen.rb white >logo-white.svg

png:
	# needs rsvg-convert (brew install librsvg)
	rsvg-convert -h 512 logo-red.svg >logo-red.png
	rsvg-convert -h 512 logo-white.svg >logo-white.png

favicon:
	rsvg-convert -h 32 logo-red.svg >favicon.png

watch:
	fswatch logo.erb gen.rb | xargs -n1 -I{} make build
