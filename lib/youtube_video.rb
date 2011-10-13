require 'rubygems'
require 'httparty'
require 'uri'
require 'cgi'

class YoutubeVideo

  def initialize page_uri
    @uri = URI.parse page_uri
  end

  def can_get_stream?
    HTTParty.head( stream_uri ).code == 200
  end

  def stream_uri
    params(url_encoded_fmt_stream_map)['url'].first
  end

  def video_id
    params(@uri.query)['v'].first
  end

  def url_encoded_fmt_stream_map
    params(extended_info.body)['url_encoded_fmt_stream_map'].first if extended_info.code == 200
  end

  def extended_info
    @video_info ||= HTTParty.get("http://www.youtube.com/get_video_info?video_id=#{video_id}&el=detailpage")
  end

  private

  def params(body)
    CGI.parse(body)
  end

end