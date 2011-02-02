module JeditableHelper
  def editable_field(object, property, options={})
    name = "#{object.class.to_s.underscore}[#{property}]"
    value = object.send property
    update_url = options.delete(:update_url) || url_for(object)
    args = {:method => 'PUT', :name => name}.merge(options)
    %{
      <span class="editable" data-name="#{name}">#{value}</span>
      <script type="text/javascript">
        $(function(){          
          var args = {data: function(value, settings) {
            // Unescape HTML
            var retval = value
              .replace(/&amp;/gi, '&')
              .replace(/&gt;/gi, '>')
              .replace(/&lt;/gi, '<')
              .replace(/&quot;/gi, "\\\"");
            return retval;
          }};
          $.extend(args, #{args.to_json});
          $(".editable[data-name='#{name}']").editable("#{update_url}", args);
        });
      </script>
    }.html_safe
  end
end
