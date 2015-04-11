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

    it "consistently returns the same value" do
      helper.page_title("Foobar")
      expect(helper.page_title).to eq "Foobar"
      expect(helper.page_title).to eq "Foobar"
    end
  end

  describe "#path_to_page_title" do
    it "works with a simple path" do
      expect(helper.path_to_page_title("/test")).to eq "Test"
    end

    it "works without initial slash" do
      expect(helper.path_to_page_title("test")).to eq "Test"
    end

    it "only uses last segment in path" do
      expect(helper.path_to_page_title("/a/test")).to eq "Test"
    end

    it "converts dashes to spaces" do
      expect(helper.path_to_page_title("/test-path")).to eq "Test path"
    end

    it "converts underscores to spaces" do
      expect(helper.path_to_page_title("/test_path")).to eq "Test path"
    end

    it "ignores double spacing" do
      expect(helper.path_to_page_title("/test--path")).to eq "Test path"
    end

    it "ignores trailing space" do
      expect(helper.path_to_page_title("/test--")).to eq "Test"
    end

    it "returns empty string when path cannot be obtained" do
      expect(helper.path_to_page_title("/")).to eq ""
    end

    it "returns empty string when given nil" do
      expect(helper.path_to_page_title(nil)).to eq ""
    end
  end

  describe "#app_name" do
    subject { helper.app_name }
    it "returns a human readable app name" do
      expect(subject).to eq "Dummy app"
    end
  end
end
