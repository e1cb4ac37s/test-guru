class GistsService
  def initialize(client: nil)
    @client = client || GithubClient.new
  end

  def gists
    @client.gists.select { |g| g.description.start_with?('TestGuru/') }
  end
end