package service.line;

import com.sun.org.apache.regexp.internal.RE;
import dao.line.DayDao;
import model.Result;
import model.line.Day;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

/**
 * Created by as749 on 2017/8/17.
 */
@Service
public class DayService {

    @Autowired
    private DayDao dayDao;

    public Result addLineDay(Day day) {
        Result result = new Result();
        result.setStatus(Result.SUCCESS);
        day.setCreateTime(new Date().getTime());
        day.setStatus(0);
        try{
            dayDao.inertLineDay(day);
        }catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    public Result delLineDay(int id) {
        Result result = new Result();
        result.setStatus(Result.SUCCESS);
        try{
            dayDao.deleteDaysById(id);
        }catch (Exception e){
            result.setStatus(Result.INCORRECT);
            result.setMessage("添加失败！");
        }
        return result;
    }

    public Result updateLineDay(Day day) {
        Result result = new Result();
        result.setStatus(Result.SUCCESS);
        try{
            dayDao.updateDaysById(day);
        }catch (Exception e){
            result.setStatus(Result.INCORRECT);
            result.setMessage("修改失败！");
        }
        return result;
    }

    public Result queryOneById(int id) {
        Result result = new Result();
        result.setStatus(Result.SUCCESS);
        try{
            Day day = dayDao.queryOneById(id);
            if(day == null){
                result.setStatus(Result.NORECORD);
                result.setMessage("无效目标，请刷新列表！");
                return result;
            }
            result.setData(day);
        }catch (Exception e){
            result.setStatus(Result.INCORRECT);
            result.setMessage("系统异常！");
        }
        return result;
    }

    public Result queryAllByLineId(int lineId) {
        Result result = new Result();
        result.setStatus(Result.SUCCESS);
        try{
            List<Day> days = dayDao.getDaysByLineId(lineId);
            if(days == null || days.size() == 0){
                result.setStatus(Result.NORECORD);
                result.setMessage("暂无数据！");
                return result;
            }
            result.setData(days);
        }catch (Exception e){
            result.setStatus(Result.INCORRECT);
            result.setMessage("系统异常！");
        }
        return result;
    }

    public Result getAllDays(int rows, int page) {
        Result result = new Result();
        int count = 0;
        HashMap<String,Object> map = new HashMap<String,Object>();

        try {
            int start = (page-1)*rows;
            map.put("limit", rows);
            map.put("offset", start);
            count = dayDao.queryAllCount();
            List<HashMap<String, Object>> days = dayDao.queryAllDay(map);
            if (count != 0 && days.size() > 0) {
                result.setTotal(count);
                result.setRows(days);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }


    public Result getDaysByLineId(int rows, int page, int lineId) {
        Result result = new Result();
        int count = 0;
        HashMap<String,Object> map = new HashMap<String,Object>();

        try {
            int start = (page-1)*rows;
            map.put("limit", rows);
            map.put("offset", start);
            map.put("lineId", lineId);
            count = dayDao.queryDayCountByLineId(lineId);
            List<HashMap<String, Object>> days = dayDao.queryDayByLineId(map);
            if (count != 0 && days.size() > 0) {
                result.setTotal(count);
                result.setRows(days);
            } else {
                result.setTotal(0);
                result.setRows(0);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
}
