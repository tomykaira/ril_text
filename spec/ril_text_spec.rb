require 'ril_text'

describe RilText do
  let(:url) { 'http://readitlaterlist.com/api/docs' }
  let(:res) { RilText.get(url) }
  it "should have body and meta info" do
    res[:text].should include 'API Documentation'
    res[:title].should == 'Read It Later: Developer API: Documentation'
    res[:resolved].should == 'http://readitlaterlist.com/api/docs'
  end

  describe "configure" do
    before do
      RilText.configure do |c|
        c.images = 1
        c.mode = 'more'
      end
    end

    subject { RilText.config.params }
    its([:images]) { should == 1 }
    its([:mode]) { should == 'more' }
  end
end
