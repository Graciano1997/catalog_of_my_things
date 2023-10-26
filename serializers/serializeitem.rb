require 'json'

module SerializationItem
  @@serializer = JSON # rubocop:disable Style/ClassVars

  def serialize
    obj = {}
    instance_variables.map do |var|
      obj[var] = instance_variable_get(var)
    end

    @@serializer.dump(obj)
  end

  def un_serialize(string)
    obj = @@serializer.parse(string)
    obj.keys.each { |key| instance_variable_set(key, obj[key]) }
  end
end