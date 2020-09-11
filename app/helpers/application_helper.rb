module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(body, author, options = {})
    repo = options[:repo] ? "/#{options[:repo]}" : ''
    link_to body, "https://github.com/#{author}#{repo}", options.except(:repo)
  end

  def appeal(current_user)
    f, l, e = current_user.first_name, current_user.last_name, current_user.email
    f && l ? "#{f} #{l}" : e
  end
end
