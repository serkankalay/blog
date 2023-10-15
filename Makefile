.PHONY: site post

site:
	hugo server --disableFastRender

# Get the arguments after 'post'
POST_NAME := $(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))

post:
	mkdir -p content/post/$(POST_NAME) && cp -r templates/post/* content/post/$(POST_NAME)/ && awk '{gsub(/slug: template/, "slug: $(POST_NAME)")} 1' content/post/$(POST_NAME)/index.md > temp && mv temp content/post/$(POST_NAME)/index.md
