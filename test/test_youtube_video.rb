require 'helper'

class TestYoutubeVideo < Test::Unit::TestCase

  context "a Youtube Video" do

    should "be created with a url string" do
      assert YoutubeVideo.new "http://www.youtube.com/watch?v=zzG4K2m_j5U"
    end

    should "fail creation without a correct url string" do
      assert_raises URI::InvalidURIError do YoutubeVideo.new "this fails" end
    end

  end

  context "a given Youtube Video" do

    setup do
      @video = YoutubeVideo.new "http://www.youtube.com/watch?v=zzG4K2m_j5U"
    end

    should "have a video ID" do
      assert_equal "zzG4K2m_j5U", @video.video_id
    end

    should "have extended info" do
      assert @video.respond_to? :extended_info, "Video doesn't have extended info"
    end

    should "have stream uri" do
      assert_equal "http://o-o.preferred.iad09g05.v9.lscache3.c.youtube.com/videoplayback?sparams=id%2Cexpire%2Cip%2Cipbits%2Citag%2Csource%2Cratebypass%2Ccp&fexp=916004%2C914999%2C908408%2C905252&itag=43&ip=195.0.0.0&signature=06FC9E7AC539C3F90A2D02D1A8060B7B185C6E87.464162F659DAF6D7CF04F93520DD87C76DF38235&sver=3&ratebypass=yes&source=youtube&expire=1318518000&key=yt1&ipbits=8&cp=U0hQTVVMVl9FSkNOMF9NRlpBOjl5SmUtT21zWjBR&id=cf31b82b69bf8f95", @video.stream_uri
    end

  end

end