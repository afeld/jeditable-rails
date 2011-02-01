module JeditableHelper
  def editable_field(object, property, options={})
    name = "#{object.class.to_s.underscore}[#{property}]"
    value = object.send property
    %{
      <span class="editable" data-name="#{name}">#{value}</span>
      <script type="text/javascript">
        $(function(){
          $(".editable[data-name='#{name}']").editable("#{url_for(object)}", {
            method: 'PUT',
            name: "#{name}"
          });
        });
      </script>
    }.html_safe
  end
end
