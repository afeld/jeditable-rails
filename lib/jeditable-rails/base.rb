require 'jeditable-rails/helpers/jeditable_helper'

module ActionView
  class Base
    include JeditableHelper
  end
end
