class Filter

  def initialize(resource, params = {})
    params = params.nil? ? {} : params
    @resource           = resource
    @object_initializer = params.clone
    @params             = sanitize_params(params)
  end

  def apply_scopes(options = {})
    scoped_elem = @resource

    @params.each do |param, value|
      if options[:ignore_values]
        scoped_elem = scoped_elem.send(param)
      else
        scoped_elem = scoped_elem.send(param, value)
      end
    end

    scoped_elem.all
  end

  def object
    return nil if @object_initializer.empty?
    klass = class_definition

    @object_initializer.each do |variable, value|
      klass.instance_variable_set("@#{variable}", value)
      klass.class_eval("attr_accessor :#{variable}")
    end
    klass.new(@object_initializer)
  end

  private

  def sanitize_params(params)
    params.compact.delete_if {|param, value| value.blank? }
  end

  def class_definition
    Class.new do
      extend ActiveModel::Naming

      def initialize(params)
        params.each do |variable, value|
          self.send("#{variable}=", value)
        end
      end

      def self.name
        'Filter'
      end

      def to_key
        []
      end
    end
  end
end
