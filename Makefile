.PHONY: site post

site:
	hugo server --disableFastRender

# Get the arguments for 'post'
POST_NAME := $(wordlist 2, $(words $(MAKECMDGOALS)), $(MAKECMDGOALS))
CURRENT_DATE := $(shell date -u +%Y-%m-%d\ %H:%M:%S%z)


post:
	mkdir -p content/post/$(POST_NAME) && cp -r templates/post/* content/post/$(POST_NAME)/ && awk '{gsub(/slug: template/, "slug: $(POST_NAME)")} 1' content/post/$(POST_NAME)/index.md > temp && mv temp content/post/$(POST_NAME)/index.md && awk '{gsub(/date: HERE_IS_A_DATE/, "date: $(CURRENT_DATE)")} 1' content/post/$(POST_NAME)/index.md > temp && mv temp content/post/$(POST_NAME)/index.md

