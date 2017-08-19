package cotroller.Order;

import model.Order.Order;
import model.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.Order.OrderService;

/**
 * Created by as749 on 2017/8/17.
 */
@Controller
@RequestMapping("/order")
public class OrderC {

    @Autowired
    private OrderService orderService;

    @RequestMapping(value = "/add")
    @ResponseBody
    public Result addOrder(Order order){
        return orderService.addOrder(order);
    }

    @RequestMapping(value = "/getOrderById")
    @ResponseBody
    public Result getOrderById(int id){
        return orderService.getOrderById(id);
    }

    @RequestMapping(value = "/deleteOrderById")
    @ResponseBody
    public Result deleteOrderById(int id){
        return orderService.deleteOrderById(id);
    }

    @RequestMapping(value = "/queryOrderByType")
    @ResponseBody
    public Result queryOrderByType(int status,int pageSize,int pageId){
        return orderService.queryOrderByType(status,pageSize,pageId);
    }

    @RequestMapping(value = "/queryAll")
    @ResponseBody
    public Result getAllOrder() {
        Result result = orderService.queryAll(0, 30);
        System.out.println("---------------"+result.toString());
        return result;
    }

}
