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
  ArticleDao articleDao;
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

    public Result queryArticleByType(int articleType,int page,int row) {
        Result result = new Result();
        result.setStatus(Result.SUCCESS);
        HashMap<String,Integer> map = new HashMap<String,Integer>();
        map.put("articleType" ,articleType);
        int start = (page-1)*row;
        map.put("limit", page);
        map.put("offset",start);
        List<Article> articles = new ArrayList<Article>();
        try{
            int count = 0;
            if (articleType != 0) {
                count  = articleDao.queryArticleByType(articleType);
                articles = articleDao.queryArticleByTypePage(map);
            } else  {
                articles = articleDao.queryAll(map);
                count  = articles.size();
            }
            if(articles == null || articles.size() == 0) {
                result.setStatus(Result.NORECORD);
                result.setMessage("记录不存在！");
                result.setTotal(0);
                return result;
            }
            result.setTotal(count);
            result.setRows(this.articleListVO(articles));
        }catch (Exception e){
            result.setStatus(Result.INCORRECT);
            result.setMessage("查询失败！");
        }
        return result;
    }


    public Result queryAll(int rows,int page) {
        Result result = new Result();
        result.setStatus(Result.SUCCESS);
        HashMap<String,Integer> map = new HashMap<String,Integer>();
        int start = (page-1)*rows;
        map.put("limit", rows);
        map.put("offset", start);
        List<Article> articles = articleDao.queryAll(map);
        result.setRows(this.articleListVO(articles));
        result.setTotal(articles.size());

            try{
            articles = articleDao.queryAll(map);
            if(articles == null || articles.size() == 0) {
                result.setStatus(Result.NORECORD);
                result.setMessage("记录不存在！");
            }
            result.setRows(articles);
            result.setTotal(this.queryArticleAllCount());
        }catch (Exception e){
            result.setStatus(Result.INCORRECT);
            result.setMessage("查询失败！");
        }
        return result;
    }

    public int queryArticleAllCount() {
        Result result = new Result();
        int count = articleDao.queryArticleAllCount();
        return count;

    }


    List<Article> articleListVO (List<Article> articles) {
        for (Article item : articles) {
            switch (item.getArticleType()) {
                case 1:
                    item.setTypeStr("惠玩食宿行");
                    break;
                case 2:
                    item.setTypeStr("行摄北非");
                    break;
                case 3:
                    item.setTypeStr("贴心的话");
                    break;
                case 4:
                    item.setTypeStr("关于我们");
                    break;
                case 5:
                    item.setTypeStr("诚心");
                    break;
                case 6:
                    item.setTypeStr("贴心");
                    break;
                case 7:
                    item.setTypeStr("细心");
                    break;
                case 8:
                    item.setTypeStr("信心");
                    break;
                case 9:
                    item.setTypeStr("走心");
                    break;
                case 10:
                    item.setTypeStr("广告");
                    break;
                default:
                    item.setTypeStr("其他");
            }
        }
        return articles;
    }
}
