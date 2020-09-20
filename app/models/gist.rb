class Gist
  attr_reader :url, :title, :email
  def self.all
    GistsService.new.gists.map { |g| Gist.new(g) }
  end

  def initialize(gist)
    @url = gist.html_url
    _, @title, @email = gist.description.split(':::')
  end
end