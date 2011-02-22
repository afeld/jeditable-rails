module JeditableHelper
  # If the <tt>condition</tt> evaluates to <tt>true</tt>, an editable field
  # will be created.  Otherwise, the value of the property of the object is
  # returned.  See #editable_field for options.
  def editable_field_if(condition, object, property, options={})
    if condition
      editable_field(object, property, options)
    else
      object.send property
    end
  end

  def jeditable_args(args)
    "{#{args.collect {|key,value| (key==:callback) ? "#{key}:#{value}" : "#{key}:'#{value}'"}.join(',')}}"
  end

  # Creates an editable span for the given property of the given object.
  #
  # === Options
  #
  # [:method]
  #   Specify the HTTP method to use: <tt>'PUT'</tt> or <tt>'POST'</tt>.
  # [:name]
  #   The <tt>name</tt> attribute to be used when the form is posted.
  # [:update_url]
  #   The URL to submit the form to.  Defaults to <tt>url_for(object)</tt>.
  def editable_field(object, property, options={})
    name = "#{object.class.to_s.underscore}[#{property}]"
    value = object.send property
    update_url = options.delete(:update_url) || url_for(object)
    args = {:method => 'PUT', :name => name}.merge(options)
    %{
      <span class="editable" data-id="#{object.id}" data-name="#{name}">#{value}</span>
      <script type="text/javascript">
        (function( $ ){
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
            $.extend(args, #{jeditable_args(args)});
            $(".editable[data-id='#{object.id}'][data-name='#{name}']").editable("#{update_url}", args);
          });
        })( jQuery );
      </script>
    }.html_safe
  end
end

