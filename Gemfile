source "https://rubygems.org"

# Declare your gem's dependencies in all_aboard.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# I know what you're thinking: what is this doing here?  Why isn't it in the
# gemspec.  You'd put it here, too, if you had been handfighting this thing
# wondering why nothing is going into your redis database.  I'm only requiring
# this gem in my spec_helper, but somehow it's overriding the real redis gem as
# soon as it gets required, which is what I assume is happening when I call
# 'gemspec' above.  Same deal with resque_spec.  Boy was that fun to troubleshoot!
gem 'fakeredis', require: nil
gem 'resque_spec', require: nil

gem 'resque-web', require: 'resque_web'

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use debugger
# gem 'debugger'
