package cotroller.line;

import model.Result;
import model.line.Day;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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

    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Result addLineDay(Day day){
        return dayService.addLineDay(day);
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delLineDay(int id){
        return dayService.delLineDay(id);
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    @ResponseBody
    public Result updateLineDay(Day day){
        return dayService.updateLineDay(day);
    }

    @RequestMapping("/queryOneById")
    @ResponseBody
    public Result queryOneById(int id){
        return dayService.queryOneById(id);
    }

    @RequestMapping(value = "/getDaysByLineId")
    @ResponseBody
    public Result queryAllByLineId(int rows, int page, int lineId){
        return dayService.getDaysByLineId(rows, page, lineId);
    }
    @RequestMapping(value = "/getAllDays")
    @ResponseBody
    public Result queryAllByLineId(int rows, int page){
        return dayService.getAllDays(rows, page);
    }
}
