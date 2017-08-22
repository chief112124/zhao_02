package dao.order;

import model.Order.Order;

import java.util.HashMap;
import java.util.List;

/**
 * Created by as749 on 2017/8/17.
 */
public interface OrderDao {
    public void addOrder(Order order);

    public Order queryOrderById(int id);

    void deleteOrderById(int id);

    int queryOrderByType(int type);

    List<Order> queryOrderByTypePage(HashMap<String, Object> map);

    List<Order> queryAll(HashMap<String, Integer> map);

    int getTotalCount();
    int getTotalCountOfTime(HashMap<String, Object> map);
    List<Order> queryOrderByTime(HashMap<String, Object> map);
}
