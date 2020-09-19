class GithubClient
  ROOT_ENDPOINT = 'https://api.github.com'
  ACCESS_TOKEN = '12fba180662d98cd673a7073558eaa7250006224'

  def initialize
    @http_client = setup_http_client
  end

  def create_gist(params)
    @http_client.post('gists') do |request|
      request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
      request.headers['Content-Type'] = 'application/json'
      request.body = params.to_json
    end
  end

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end
end