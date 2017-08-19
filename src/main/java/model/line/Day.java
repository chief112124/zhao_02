package model.line;

/**
 * Created by as749 on 2017/8/14.
 */
public class Day {
    private int id;
    private int lineId;  //路线id
    private int dayNum; //天
    private String title; //标题
    private String meal;  //餐
    private String hotel; //住
    private String travel; //行程
    private String linghtPoint; //亮点
    private int status; //状态
    private long createTime;  //创建时间

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public long getCreateTime() {
        return createTime;
    }

    public void setCreateTime(long createTime) {
        this.createTime = createTime;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getLineId() {
        return lineId;
    }

    public void setLineId(int lineId) {
        this.lineId = lineId;
    }

    public int getDayNum() {
        return dayNum;
    }

    public void setDayNum(int dayNum) {
        this.dayNum = dayNum;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMeal() {
        return meal;
    }

    public void setMeal(String meal) {
        this.meal = meal;
    }

    public String getHotel() {
        return hotel;
    }

    public void setHotel(String hotel) {
        this.hotel = hotel;
    }

    public String getTravel() {
        return travel;
    }

    public void setTravel(String travel) {
        this.travel = travel;
    }

    public String getLinghtPoint() {
        return linghtPoint;
    }

    public void setLinghtPoint(String linghtPoint) {
        this.linghtPoint = linghtPoint;
    }
}
