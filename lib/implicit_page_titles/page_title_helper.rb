module ImplicitPageTitles
  module PageTitleHelper
    def page_title(page_title = nil)
      @page_title = page_title unless page_title.nil?
      @page_title || show_action_page_title || path_to_page_title(request.try(:path)) || app_name
    end

    def show_action_page_title
      return nil unless controller && controller_name
      return nil unless action_name && action_name == "show"

      var_name = "@" + controller_name.singularize
      variable = controller.instance_variable_get(var_name)
      variable.try(:title) || variable.try(:name)
    end

    def path_to_page_title(path)
      last_segment = path.to_s.split("/").last
      return nil if last_segment.nil?

      title = last_segment
      title = title.gsub(/[-_]/, " ")
      title = title.gsub(/\s+/, " ").strip
      title.humanize
    end

    def app_name
      Rails.application.class.to_s.split("::").first.underscore.humanize
    end
  end
end
