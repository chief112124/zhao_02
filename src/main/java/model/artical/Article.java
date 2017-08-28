package model.artical;

/**
 * Created by as749 on 2017/8/14.
 */
public class Article {
    private int id;
    private String title;  //文章标题
    private String img;
    private String content;  //文章内容
    private int articleType;   //文章类型
    private int sort;   //文章顺序
    private long createTime; //创建时间
    private long updateTime; //修改时间
    private int status;  //文章状态

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    /*VO属性*/
    private String typeStr;

    public String getTypeStr() {
        return typeStr;
    }

    public void setTypeStr(String typeStr) {
        this.typeStr = typeStr;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getArticleType() {
        return articleType;
    }

    public void setArticleType(int articleType) {
        this.articleType = articleType;
    }

    public int getSort() {
        return sort;
    }

    public void setSort(int sort) {
        this.sort = sort;
    }

    public long getCreateTime() {
        return createTime;
    }

    public void setCreateTime(long createTime) {
        this.createTime = createTime;
    }

    public long getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(long updateTime) {
        this.updateTime = updateTime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
