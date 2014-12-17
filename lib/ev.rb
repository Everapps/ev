require 'pathname'
Here = Pathname("..").expand_path(__FILE__)

# mess with the fabric of reality to allow this stuff to run from anywhere
ENV['BUNDLE_GEMFILE'] = (Here+'../Gemfile').expand_path.to_s


# rbenv/rvm hack:
# We've arranged it so that bx always runs its commands from $_BX_ROOT
# so that ruby stuff can pick up the correct ruby version.
#
# bx sets $BX_INVOCATION_PWD to the path it was originally run in, so
# we can switch back there now:
# Dir.chdir(ENV['EV_INVOCATION_PWD'])

require 'rubygems'
require 'bundler/setup'

require 'tapp'

$LOAD_PATH.unshift Here

module Ev
  def self.root
    @root ||= Here.join('..').expand_path
  end
end