module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(body, author, options = {})
    repo = options[:repo] ? "/#{options[:repo]}" : ''
    link_to body, "https://github.com/#{author}#{repo}", options.except(:repo)
  end
end
