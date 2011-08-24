# mongoid_touch ![build status](http://travis-ci.org/asaaki/mongoid_touch.png)

A tiny mongoid extension to provide the `touch` method known from ActiveRecord to Mongoid::Document.

## Install and Usage

Use Bundler/Gemfile, add `gem "mongoid_touch"` right after your added mongoid.

The method `.touch` can have an optional parameter for your custom Time based field, otherwise it will try to use the `updated_at` field (include Mongoid::Timestamps in your model).

Use `.touch!` if you want to get exceptions if touching fails.

Now you can use:

```ruby
my_model_instance.touch
my_model_instance.touch! # will raise errors if touching fails.
```

This will update the `updated_at` field if present.

```ruby
my_model_instance.touch(:modified_at)
my_model_instance.touch(:modified_at) # will raise errors if touching fails.
```

This will update the custom field `modified_at` if present.

## Exceptions for `touch!`

If the corresponding field is not present, mongoid_touch will raise a `Mongoid::Errors::MissingField`.

If the object is frozen, an exception of `Mongoid::Errors::FrozenInstance` is thrown.

If the underlying `update_attribute` doesn't return true, `Mongoid::Errors::DocumentNotUpdated` is thrown (unless mongoid itself throws an error).

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

