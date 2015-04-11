module ImplicitPageTitles
  module PageTitleHelper
    def page_title(page_title = nil)
      @page_title = page_title unless page_title.nil?
      @page_title || app_name
    end

    def path_to_page_title(path)
      # request.path
      title = path.to_s.split("/").last.to_s
      title = title.gsub(/[-_]/, " ")
      title = title.gsub(/\s+/, " ").strip
      title.humanize
    end

    def app_name
      Rails.application.class.to_s.split("::").first.underscore.humanize
    end
  end
end
