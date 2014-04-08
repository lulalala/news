class ArticleCell < Cell::Rails
  def index_item(article)
    @article = article
    render
  end

  def company_list
    @counts = Article.count(:group => 'company_name')
    @counts = @counts.sort_by {|_key, value| -value}
    render
  end
end
