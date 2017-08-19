package service.Order;

import dao.order.OrderDao;
import model.Order.Order;
import model.Result;
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

    public Result queryOrderByType(int status, int pageSize, int pageId) {
        Result result = new Result();
        result.setStatus(Result.SUCCESS);
        HashMap<String,Integer> map = new HashMap<String,Integer>();
        map.put("status" ,status);
        map.put("limit", pageSize);
        map.put("offset",pageSize*(pageId-1));
        List<Order> orders = new ArrayList<Order>();
        try{
            int count = orderDao.queryOrderByType(status);
            orders = orderDao.queryOrderByTypePage(map);
            if(orders == null || orders.size() == 0) {
                result.setStatus(Result.NORECORD);
                result.setMessage("记录不存在！");
            }
            result.setCount(count);
            result.setData(orders);
        }catch (Exception e){
            result.setStatus(Result.INCORRECT);
            result.setMessage("查询失败！");
        }
        return result;
    }

    public Result queryAll(int pageId, int pageSize) {
        Result result = new Result();
        HashMap<String,Integer> map = new HashMap<String,Integer>();
        map.put("limit", pageSize);
        map.put("offset", pageId);
        List<Order> orderList = new ArrayList<Order>();
        orderList = orderDao.queryAll(map);
        result.setRows(orderList);
        result.setTotal(orderList.size());
        return result;
    }
}
