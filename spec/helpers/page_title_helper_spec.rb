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

    it "returns the app name for the root path" do
      controller.request.path = "/"
      expect(helper.page_title).to eq "Dummy app"
    end

    it "returns the path as page title when possible" do
      controller.request.path = "/test-page"
      expect(helper.page_title).to eq "Test page"
    end
  end

  describe "#restful_page_title" do
    before do
      allow(helper).to receive(:controller_name).and_return("posts")
    end

    context "show" do
      before do
        allow(helper).to receive(:action_name).and_return("show")
      end
      it "returns the main object title" do
        controller.instance_variable_set :@post, double("post", title: "Hello")
        expect(helper.restful_page_title).to eq "Hello"
      end

      it "returns the main object name if there is no title" do
        controller.instance_variable_set :@post, double("post", name: "World")
        expect(helper.restful_page_title).to eq "World"
      end

      it "returns the main object title over name" do
        controller.instance_variable_set :@post, double("post", title: "Hello", name: "World")
        expect(helper.restful_page_title).to eq "Hello"
      end

      it "returns nil if no title or name attribute" do
        controller.instance_variable_set :@post, double("post")
        expect(helper.restful_page_title).to eq nil
      end
    end

    context "edit" do
      it "prepends 'Edit' to the title" do
        allow(helper).to receive(:action_name).and_return("edit")
        controller.instance_variable_set :@post, double("post", name: "World")
        expect(helper.restful_page_title).to eq "Edit World"
      end
    end

    context "new" do
      it "returns the singular model name" do
        allow(helper).to receive(:action_name).and_return("new")
        allow(helper).to receive(:_current_path).and_return("/posts/new")
        expect(helper.restful_page_title).to eq "New Post"
      end
    end

    context "index" do
      it "returns nil when not on show" do
        allow(helper).to receive(:action_name).and_return("index")
        expect(helper.restful_page_title).to eq nil
      end
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

    it "returns nil when path cannot be obtained" do
      expect(helper.path_to_page_title("/")).to eq nil
    end

    it "returns nil when given nil" do
      expect(helper.path_to_page_title(nil)).to eq nil
    end
  end

  describe "#default_page_title" do
    subject { helper.default_page_title }
    it "returns a human readable app name" do
      expect(subject).to eq "Dummy app"
    end
  end
end
