class ArticleCell < Cell::Rails
  def index_item(article)
    @article = article
    render
  end
end
