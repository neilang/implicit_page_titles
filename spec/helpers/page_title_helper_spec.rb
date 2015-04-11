require "rails_helper"

describe ImplicitPageTitles::PageTitleHelper, type: :helper do
  describe "#app_name" do
    subject { helper.app_name }
    it { should == "Dummy app" }
  end
end
