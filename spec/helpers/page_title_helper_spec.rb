require "rails_helper"

describe ImplicitPageTitles::PageTitleHelper, type: :helper do
  describe "#page_title default response" do
    subject { helper.page_title }
    it { should == "Dummy app" }
  end

  describe "#app_name" do
    subject { helper.app_name }
    it { should == "Dummy app" }
  end
end
