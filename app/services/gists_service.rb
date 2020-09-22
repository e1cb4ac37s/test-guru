class GistsService
  def initialize
    @client = Octokit::Client.new(access_token: ENV['GITHUB_ACCESS_TOKEN'])
  end

  def gists
    @client.gists.select { |g| g.description.start_with?('TestGuru/') }
  end

  def create(question, user)
    @question = question
    @user = user
    @client.create_gist(create_gist_params)
  end

  def success?
    @client.last_response.status == 201
  end

  private

  def create_gist_params
    {
      description: "TestGuru/#{@question.test.title}:::#{@question.body.truncate(25)}:::#{@user.email}",
      public: true,
      files: {
        'test-guru-question.txt' => {
          content: new_gist_content
        }
      }
    }
  end

  def new_gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end
