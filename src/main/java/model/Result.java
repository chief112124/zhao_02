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

    /*easyUI??????????*/
    private int total;
    private Object rows;

    /*?????URL*/
    private String url;

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

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

    @Override
    public String toString() {
        return "Result{" +
                "status='" + status + '\'' +
                ", data=" + data +
                ", count=" + count +
                ", message='" + message + '\'' +
                ", total=" + total +
                ", rows=" + rows +
                '}';
    }
}
