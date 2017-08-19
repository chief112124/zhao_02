package model.line;

import java.util.List;

/**
 * Created by as749 on 2017/8/14.
 */
public class Line {
    private int id;
    private String lineName;  //路线名称
    private String lineContent;  //行程介绍
    private double price;  //单价
    private long goTimeStamp;  //预计出行时间
    private int status; //行程状态
    private long createTime; //创建时间
    private List<LineImg> lineImgs;
    private List<Day> days;

    public List<LineImg> getLineImgs() {
        return lineImgs;
    }

    public void setLineImgs(List<LineImg> lineImgs) {
        this.lineImgs = lineImgs;
    }

    public List<Day> getDays() {
        return days;
    }

    public void setDays(List<Day> days) {
        this.days = days;
    }

    public long getCreateTime() {
        return createTime;
    }

    public void setCreateTime(long createTime) {
        this.createTime = createTime;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLineName() {
        return lineName;
    }

    public void setLineName(String lineName) {
        this.lineName = lineName;
    }

    public String getLineContent() {
        return lineContent;
    }

    public void setLineContent(String lineContent) {
        this.lineContent = lineContent;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public long getGoTimeStamp() {
        return goTimeStamp;
    }

    public void setGoTimeStamp(long goTimeStamp) {
        this.goTimeStamp = goTimeStamp;
    }
}
