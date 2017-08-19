package cotroller.line;

import model.Result;
import model.line.Line;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.line.LineService;

/**
 * Created by as749 on 2017/8/17.
 */
@Controller
@RequestMapping("/line")
public class LineC {
    @Autowired
    private LineService lineService;

    @RequestMapping("/add")
    @ResponseBody
    public Result addLine(@RequestBody Line line){
        return lineService.addLine(line);
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result updateLine(@RequestBody Line line){
        return lineService.updateLine(line);
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result deleteLine(int id){
        return lineService.deleteLine(id);
    }

    @RequestMapping("/queryOneById")
    @ResponseBody
    public Result queryOneById(int id){
        return lineService.queryOneById(id);
    }

    @RequestMapping("/queryAllPage")
    @ResponseBody
    public Result queryAllPage(int pageSize, int pageId, long beginTime,long endTime){
        return lineService.queryAllPage(pageSize,pageId,beginTime,endTime);
    }

    @RequestMapping("/queryAll")
    @ResponseBody
    public Result queryAll(long beginTime,long endTime){
        return lineService.queryAll(beginTime,endTime);
    }
}
