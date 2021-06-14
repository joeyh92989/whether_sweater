class Background
  attr_reader :image

  def initialize(attributes)
    @image = build_image(attributes)
  end

  def build_image(args)
    attributes = {}
    attributes[:description] = args[:results][0][:description]
    attributes[:image_url] = args[:results][0][:urls][:full]
    attributes[:attribution] = attribution(args[:results][0][:user])
    attributes
  end

  def attribution(args)
    attributes = {}
    attributes[:source] = 'https://unsplash.com'
    attributes[:author] = args[:username]
    attributes[:portfolio] = args[:links][:html]
    attributes
  end
end
