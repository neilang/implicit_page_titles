module ImplicitPageTitles
  module PageTitleHelper
    def page_title(page_title = nil)
      @page_title = page_title unless page_title.nil?
      @page_title || app_name
    end

    def app_name
      Rails.application.class.to_s.split("::").first.underscore.humanize
    end
  end
end
