module ImplicitPageTitles
  module Utils
    def self.app_name
      Rails.application.class.to_s.split("::").first.underscore.humanize
    end
  end
end
