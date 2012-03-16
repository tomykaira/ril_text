require 'ril_text'

describe RilText do
  let(:url) { 'http://readitlaterlist.com/api/docs' }
  let(:res) { RilText.get(url) }
  it "should have body and meta info" do
    res[:text].should include 'API Documentation'
    res[:title].should == 'Read It Later: Developer API: Documentation'
    res[:resolved].should == 'http://readitlaterlist.com/api/docs'
  end
end
