# Yolo

Connect with a stranger, maybe they'll reply, end of story.

```
brew install httpie
bundle install
rake db:reset
bundle exec rails s
http POST localhost:3000/messages < yolo.json
```
