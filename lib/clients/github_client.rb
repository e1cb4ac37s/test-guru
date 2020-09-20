class GithubClient
  def initialize
    @client = Octokit::Client.new(access_token: Rails.application.credentials.github_api_key)
  end

  def create_gist(opts)
    @client.create_gist(opts)
  end

  def gists
    @client.gists
  end
end