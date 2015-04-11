module ImplicitPageTitles
  module PageTitleHelper
    def app_name
      Rails.application.class.to_s.split("::").first.underscore.humanize
    end
  end
end
