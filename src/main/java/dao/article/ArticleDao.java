package dao.article;

import model.artical.Article;

import java.util.HashMap;
import java.util.List;


/**
 * Created by Administrator on 2017/3/14.
 */

public interface ArticleDao {

    public void insertArticle(Article article);

    public void deleteArticleById(int id);

    public void updateArticleById(Article article);

    public Article queryArticleById(int id);

    public List<Article> queryArticleByTypePage(HashMap<String, Integer> type);

    public int queryArticleByType(int articleType);

    public List<Article> queryAll(HashMap<String, Integer> map);
}
