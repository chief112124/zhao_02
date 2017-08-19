package model;

/**
 * Created by as749 on 2017/8/14.
 */
public class Result {

    public static final String SUCCESS = "success";
    public static final String NORECORD = "norecord";
    public static final String INCORRECT = "incorrect";

    public String status;
    public Object data;
    public int count;
    private String message;

    /*easyUI使用的返回参数*/
    private int total;
    private Object rows;

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public Object getRows() {
        return rows;
    }

    public void setRows(Object rows) {
        this.rows = rows;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
