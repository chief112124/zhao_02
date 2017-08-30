package cotroller.Order;

import model.Order.Order;
import model.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Result addOrder(@RequestBody Order order){
        return orderService.addOrder(order);
    }

    @RequestMapping(value = "/getOrderById")
    @ResponseBody
    public Result getOrderById(int id){
        return orderService.getOrderById(id);
    }

    @RequestMapping(value = "/deleteOrderById", method = RequestMethod.POST)
    @ResponseBody
    public Result deleteOrderById(int id){
        return orderService.deleteOrderById(id);
    }

  /*  @RequestMapping(value = "/queryOrderByType")
    @ResponseBody
    public Result queryOrderByType(int status,int pageSize,int pageId){
        return orderService.queryOrderByType(status,pageSize,pageId);
    }*/

    @RequestMapping(value = "/queryAll")
    @ResponseBody
    public Result getAllOrder(Integer page, Integer rows) {
        Result result = orderService.queryAll(page.intValue(), rows.intValue());
        return result;
    }

    @RequestMapping(value = "/queryOrderByTime")
    @ResponseBody
    public Result queryOrderByTime(String beginTime, String endTime, int rows, int page){
        return orderService.queryOrderByTime(beginTime, endTime, rows, page);
    }

}
