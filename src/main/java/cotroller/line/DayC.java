package cotroller.line;

import model.Result;
import model.line.Day;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.line.DayService;

/**
 * Created by as749 on 2017/8/17.
 */
@Controller
@RequestMapping("/lineDay")
public class DayC {
    @Autowired
    private DayService dayService;

    @RequestMapping("/add")
    @ResponseBody
    public Result addLineDay(@RequestBody Day day){
        return dayService.addLineDay(day);
    }

    @RequestMapping("/del")
    @ResponseBody
    public Result delLineDay(int id){
        return dayService.delLineDay(id);
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result updateLineDay(@RequestBody Day day){
        return dayService.updateLineDay(day);
    }

    @RequestMapping("/queryOneById")
    @ResponseBody
    public Result queryOneById(int id){
        return dayService.queryOneById(id);
    }

    @RequestMapping("/queryAllByLineId")
    @ResponseBody
    public Result queryAllByLineId(int lineId){
        return dayService.queryAllByLineId(lineId);
    }
}
