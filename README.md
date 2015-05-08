# Yolo

Connect with a stranger, maybe they'll reply, end of story.

```
brew install httpie
bundle install
rake db:reset
bundle exec rails s
```

Connect with a stranger:

```
http POST localhost:3000/messages < yolo.json
```

Maybe they'll reply:

```
http POST localhost:3000/messages/1/reply < yolo_back.json
```

End of story.
