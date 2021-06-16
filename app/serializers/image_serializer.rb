class ImageSerializer
  include FastJsonapi::ObjectSerializer
  set_id { 'null' }
  attributes :image
end
