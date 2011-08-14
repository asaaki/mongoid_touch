# mongoid_touch ![build status](http://travis-ci.org/asaaki/mongoid_touch.png)

A tiny mongoid extension to provide the `touch` method known from ActiveRecord to Mongoid::Document.

## Usage

Use Bundler/Gemfile, add `gem "mongoid_touch"` right after your added mongoid.

Now you can use:

```ruby
my_model_instance.touch
my_model_instance.touch! # alias of .touch
```

This will update the `updated_at` field if present.

```ruby
my_model_instance.touch(:modified_at)
```

This will update the custom field `modified_at` if present.

If the corresponding field is not present, mongoid_touch will raise an `Mongoid::Errors::MissingField`.

## Contributing to `mongoid_touch`
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it
* Fork the project
* Start a feature/bugfix branch
* Commit and push until you are happy with your contribution
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

## Copyright

Copyright (c) 2011 Christoph Grabo. See LICENSE.txt for
further details.

