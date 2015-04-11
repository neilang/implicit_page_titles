module ImplicitPageTitles
  module PageTitleHelper
    def page_title(page_title = nil)
      @page_title  = page_title unless page_title.nil?
      @page_title || restful_page_title || path_to_page_title || default_page_title
    end

    def restful_page_title
      case action_name
      when "show"
        _implicit_variable_title
      when "edit"
        "Edit #{_implicit_variable_title}"
      when "new"
        path  = _path_without_last_segment(_current_path)
        title = path_to_page_title(path).to_s.singularize
        "New #{title.downcase}"
      end
    end

    def path_to_page_title(path = _current_path)
      title = path.to_s.split("/").last
      return nil if title.nil?

      title = title.gsub(/[-_]/, " ")
      title = title.gsub(/\s+/, " ").strip
      title.humanize
    end

    def default_page_title
      Rails.application.class.to_s.split("::").first.underscore.humanize
    end

    def _current_path
      request.try :path
    end

    def _path_without_last_segment(path)
      path  = path.to_s
      index = path.rindex("/")
      index ? path[0, index] : nil
    end

    def _implicit_variable_title
      return unless controller && controller_name
      var_name = "@" + controller_name.singularize
      variable = controller.instance_variable_get(var_name)
      variable.try(:title) || variable.try(:name)
    end
  end
end
