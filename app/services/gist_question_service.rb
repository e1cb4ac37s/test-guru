class GistQuestionService
  def initialize(question, user, client: nil)
    @question = question
    @test = @question.test
    @client = client || GithubClient.new
    @user = user
  end

  def call
    @client.create_gist(gist_params)
  end

  private

  def gist_params
    {
      description: gist_description,
      public: true,
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_description
    "TestGuru/#{@test.title}:::#{@question.body.truncate(25)}:::#{@user.email}"
  end

  def gist_content
    content = [@question.body]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
end