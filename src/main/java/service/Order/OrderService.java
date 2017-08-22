package service.Order;

import dao.order.OrderDao;
import model.Order.Order;
import model.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * Created by as749 on 2017/8/17.
 */
@Service
public class OrderService {

    @Autowired
    private OrderDao orderDao;

    public Result addOrder(Order order) {
        Result result = new Result();
        result.setStatus(Result.SUCCESS);
        order.setStatus(0);
        order.setCreateTime(new Date().getTime());
        order.setNote("empty");
        try{
            orderDao.addOrder(order);
        }catch (Exception e){
            result.setStatus(Result.INCORRECT);
        };
        return result;
    }

    public Result getOrderById(int id) {
        Result result = new Result();
        result.setStatus(Result.SUCCESS);
        try{
            Order order = orderDao.queryOrderById(id);
            result.setData(order);
        }catch (Exception e){
            result.setStatus(Result.INCORRECT);
        };
        return result;
    }

    public Result deleteOrderById(int id) {
        Result result = new Result();
        result.setStatus(Result.SUCCESS);
        try{
            orderDao.deleteOrderById(id);
        }catch (Exception e){
            result.setStatus(Result.INCORRECT);
        };
        return result;
    }
    public Result queryAll(int pageId, int pageSize) {
        Result result = new Result();
        HashMap<String,Integer> map = new HashMap<String,Integer>();
        map.put("limit", pageSize);
        map.put("offset", (pageId-1)*pageSize);
        List<Order> orderList = new ArrayList<Order>();
        int count = orderDao.getTotalCount();
        orderList = orderDao.queryAll(map);
        result.setRows(orderList);
        result.setTotal(count);
        return result;
    }


    public Result queryOrderByTime(String beginTime, String endTime, int pageSize, int pageId) {
        Result result = new Result();
        result.setStatus(Result.SUCCESS);
        HashMap<String,Object> map = new HashMap<String,Object>();

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

        try{
            Date begin = sdf.parse(beginTime);
            Date end = sdf.parse(endTime);
            map.put("beginTime",begin.getTime());
            map.put("endTime",end.getTime());
            /*获取记录的总条数*/
            int count = orderDao.getTotalCountOfTime(map);
            map.put("limit", pageSize);
            map.put("offset", (pageId-1)*pageSize);
            List<Order> orders = new ArrayList<Order>();
            orders = orderDao.queryOrderByTime(map);
            if(orders == null || orders.size() == 0) {
                result.setStatus(Result.NORECORD);
                result.setMessage("记录不存在！");
            }
            result.setTotal(count);
            result.setRows(orders);
        }catch (Exception e){
            result.setStatus(Result.INCORRECT);
            result.setMessage("查询失败！");
        }
        return result;
    }

}
