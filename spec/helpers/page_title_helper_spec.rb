require "rails_helper"

describe ImplicitPageTitles::PageTitleHelper, type: :helper do
  describe "#page_title" do
    it "returns the app name by default" do
      expect(helper.page_title).to eq "Dummy app"
    end

    it "returns the set title" do
      expect(helper.page_title("Foo")).to eq "Foo"
    end

    it "remembers a previously set page_title" do
      helper.page_title("Foobar")
      expect(helper.page_title).to eq "Foobar"
    end
  end

  describe "#app_name" do
    subject { helper.app_name }
    it "returns a human readable app name" do
      expect(subject).to eq "Dummy app"
    end
  end
end
