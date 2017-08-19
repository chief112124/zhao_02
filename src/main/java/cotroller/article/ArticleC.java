package cotroller.article;

import model.Result;
import model.artical.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import service.Article.ArticleService;

/**
 * Created by as749 on 2017/8/17.
 */
@Controller
@RequestMapping("/article")
public class ArticleC {
    @Autowired
    private ArticleService articleService;

    @RequestMapping(value = "/add", method= RequestMethod.POST)
    @ResponseBody
    public Result addArticle(Article article){
        return articleService.addArticle(article);
    }

    @RequestMapping(value = "/delete", method=RequestMethod.POST)
    @ResponseBody
    public Result deleteArticle(int id){
        return articleService.deleteArticleById(id);
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public Result updateArticle(Article article){
        return articleService.updateArticleById(article);
    }

    @RequestMapping(value = "/queryArticleById")
    @ResponseBody
    public Result queryArticleById(int id){
        return articleService.queryArticleById(id);
    }

    @RequestMapping(value = "/queryArticleByType")
    @ResponseBody
    public Result queryArticleByType(int articleType,int pageSize,int pageId){
        return articleService.queryArticleByType(articleType,pageSize,pageId);
    }

    /*
    *  查询所有文章
    */

    @RequestMapping(value = "/queryAll")
    @ResponseBody
    public Result queryAll() {
        Result result = articleService.queryAll(30, 0);
        System.out.println("--------------------"+result.toString());
        return result;
    }
}
