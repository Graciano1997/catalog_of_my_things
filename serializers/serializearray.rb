require 'json'

module SerializationArray
  @@serializer = JSON # rubocop:disable Style/ClassVars

  def serialize(arr)
    res = []
    arr.each do |item|
      res << item.serialize
    end

    @@serializer.dump res
  end

  def file_path
    "solid/data/#{self.class.to_s.downcase}.json"
  end

  def write_data
    arr = take_array

    File.new(file_path) if File.exist?(file_path)
    file = File.open(file_path, 'w')
    seri_arr = serialize(arr)
    file.write(seri_arr)
    file.close
  end

  def read_data
    return unless File.exist?(file_path)

    add_list un_serialize(File.read(file_path))
  end

  def un_serialize(string)
    return [] unless string.length > 3

    obj = @@serializer.parse string
    arr = []
    obj.each do |item_string|
      item = create_item
      item.un_serialize(item_string)

      arr << item
    end
    arr
  end
end