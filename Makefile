build:
	ruby gen.rb "#d40000" >logo-red.svg
	ruby gen.rb white >logo-white.svg

watch:
	fswatch logo.erb gen.rb | xargs -n1 -I{} make build
