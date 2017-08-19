package service.Article;

import dao.article.ArticleDao;
import model.Result;
import model.artical.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * Created by as749 on 2017/8/17.
 */
@Service
public class ArticleService {

    @Autowired
    private ArticleDao articleDao;
    public Result addArticle(Article article) {
        Result result = new Result();
        result.setStatus(Result.SUCCESS);
        article.setCreateTime(new Date().getTime());
        article.setUpdateTime(new Date().getTime());
        article.setStatus(0);
        try{
            articleDao.insertArticle(article);
        }catch (Exception e){
            result.setStatus(Result.INCORRECT);
            result.setMessage("文章添加失败！");
        }
        return result;
    }

    public Result deleteArticleById(int id) {
        Result result = new Result();
        result.setStatus(Result.SUCCESS);
        try{
            articleDao.deleteArticleById(id);
        }catch (Exception e){
            result.setStatus(Result.INCORRECT);
            result.setMessage("文章删除失败！");
        }
        return result;
    }

    public Result updateArticleById(Article article) {
        Result result = new Result();
        result.setStatus(Result.SUCCESS);
        article.setUpdateTime(new Date().getTime());
        try{
            articleDao.updateArticleById(article);
        }catch (Exception e){
            result.setStatus(Result.INCORRECT);
            result.setMessage("文章更新失败！");
        }
        return result;
    }

    public Result queryArticleById(int id) {
        Result result = new Result();
        result.setStatus(Result.SUCCESS);
        Article article = new Article();
        try{
            article = articleDao.queryArticleById(id);
            result.setData(article);
        }catch (Exception e){
            result.setStatus(Result.INCORRECT);
            result.setMessage("文章获取失败！");
        }
        return result;
    }

    public Result queryArticleByType(int articleType,int pageSize,int pageId) {
        Result result = new Result();
        result.setStatus(Result.SUCCESS);
        HashMap<String,Integer> map = new HashMap<String,Integer>();
        map.put("articleType" ,articleType);
        map.put("limit", pageSize);
        map.put("offset",pageSize*(pageId-1));
        List<Article> articles = new ArrayList<Article>();
        try{
            int count = articleDao.queryArticleByType(articleType);
            articles = articleDao.queryArticleByTypePage(map);
            if(articles == null || articles.size() == 0) {
                result.setStatus(Result.NORECORD);
                result.setMessage("记录不存在！");
            }
            result.setCount(count);
            result.setData(articles);
        }catch (Exception e){
            result.setStatus(Result.INCORRECT);
            result.setMessage("查询失败！");
        }
        return result;
    }


    public Result queryAll(int pageSize,int pageId) {
        Result result = new Result();
        result.setStatus(Result.SUCCESS);
        HashMap<String,Integer> map = new HashMap<String,Integer>();
        map.put("limit", pageSize);
        map.put("offset",pageId);
        List<Article> articles = new ArrayList<Article>();
        articles = articleDao.queryAll(map);
        result.setRows(articles);
        result.setTotal(articles.size());
        /*    try{
            articles = articleDao.queryAll(map);
            if(articles == null || articles.size() == 0) {
                result.setStatus(Result.NORECORD);
                result.setMessage("记录不存在！");
            }
            result.setRows(articles);
            result.setTotal(articles.size());
        }catch (Exception e){
            result.setStatus(Result.INCORRECT);
            result.setMessage("查询失败！");
        }*/
        return result;
    }
}
