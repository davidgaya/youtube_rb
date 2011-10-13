require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'test/unit'
require 'shoulda-context'
require 'fakeweb'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))
require 'youtube_video'

FakeWeb.allow_net_connect = false
FakeWeb.register_uri(:get, %r{http://www\.youtube\.com/get_video_info.*} , :body => File.read( File.join(File.dirname(__FILE__), 'fixtures/detailpage') ))
