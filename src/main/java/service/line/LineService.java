package service.line;

import dao.line.DayDao;
import dao.line.LineDao;
import dao.line.LineImgDao;
import model.Result;
import model.line.Day;
import model.line.Line;
import model.line.LineImg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by as749 on 2017/8/17.
 */
@Service
public class LineService {

    @Autowired
    private LineDao lineDao;
    @Autowired
    private LineImgDao lineImgDao;
    @Autowired
    private DayDao dayDao;

    public Result addLine(Line line) {
        Result result = new Result();
        result.setStatus(Result.SUCCESS);
        line.setCreateTime(new Date().getTime());
        line.setStatus(0);
        List<LineImg> lineImgs = line.getLineImgs();
        if(lineImgs == null || lineImgs.size() < 3){
            result.setStatus(Result.INCORRECT);
            result.setMessage("图片数量不足！");
            return result;
        }
        lineDao.addLine(line);
        for(LineImg lineImg:lineImgs){
            lineImg.setLineId(line.getId());
            lineImgDao.addImg(lineImg);
        }
        return result;
    }

    public Result updateLine(Line line) {
        Result result = new Result();
        result.setStatus(Result.SUCCESS);
        try{
            List<LineImg> lineImgs = line.getLineImgs();
            if(lineImgs == null || lineImgs.size() < 3){
                result.setStatus(Result.INCORRECT);
                result.setMessage("图片数量不足！");
                return result;
            }
            lineDao.updateLine(line);
            lineImgDao.deleteImgBylineId(line.getId());
            for(LineImg lineImg:lineImgs){
                lineImg.setLineId(line.getId());
                lineImgDao.addImg(lineImg);
            }
        }catch (Exception e){
            result.setStatus(Result.INCORRECT);
            result.setMessage("更新失败！");
        }
        return result;
    }

    public Result deleteLine(int lineId) {
        Result result = new Result();
        result.setStatus(Result.SUCCESS);
        try{
            lineDao.deleteLineById(lineId);
            lineImgDao.deleteImgBylineId(lineId);
            dayDao.deleteDaysByLineId(lineId);
        }catch (Exception e){
            result.setStatus(Result.INCORRECT);
            result.setMessage("删除失败！");
        }
        return result;
    }

    public Result queryOneById(int lineId) {
        Result result = new Result();
        result.setStatus(Result.SUCCESS);
        Line line = new Line();
        try{
            line = lineDao.queryLineById(lineId);
            if(line == null){
                result.setStatus(Result.NORECORD);
                result.setMessage("无效目标，请刷新列表！");
                return result;
            }
            List<LineImg> lineImgs = lineImgDao.getLineImgByLineId(lineId);
            line.setLineImgs(lineImgs);
            List<Day> days = dayDao.getDaysByLineId(lineId);
            line.setDays(days);
            result.setData(line);
        }catch (Exception e){
            result.setStatus(Result.INCORRECT);
            result.setMessage("系统异常！");
        }
        return result;
    }


    public Result queryAllPage(int pageSize, int pageId,String beginTime, String endTime) {
        Result result = new Result();
        result.setStatus(Result.SUCCESS);
        HashMap<String,Object> map = new HashMap<>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try{
            map.put("beginTime",sdf.parse(beginTime).getTime());
            map.put("endTime",sdf.parse(endTime).getTime());
            int  totalCount = lineDao.getTotalCountByTime(map);
            map.put("offset",pageSize*(pageId - 1));
            map.put("limit",pageSize);
/*            if( totalCount == 0){
                result.setTotal(0);
                result.setMessage("暂无数据！");
                return result;
            }*/
            result.setTotal(totalCount);
            List<Line> lines = lineDao.queryLineAllPage(map);
/*            if(lines == null || lines.size() == 0){
                result.setStatus(Result.NORECORD);
                result.setMessage("暂无数据！");
                return result;
            }*/
/*            for(Line line:lines){
                line.setLineImgs(lineImgDao.getLineImgByLineId(line.getId()));
                line.setDays(dayDao.getDaysByLineId(line.getId()));
            }*/
            if (lines.size()>0) {
                result.setRows(lines);
            } else {
                result.setRows(0);
            }
        }catch (Exception e){
            result.setStatus(Result.INCORRECT);
            result.setMessage("系统异常！");
        }
        return result;
    }

    public Result queryAll(int  rows,int  page) {
        Result result = new Result();
        result.setStatus(Result.SUCCESS);
        HashMap<String,Object> map = new HashMap<>();
        map.put("limit", rows);
        map.put("offset",(page-1)*rows);
        try{
            List<Line> linesAll = lineDao.queryLinesAll(map);
            if(linesAll == null){
                result.setStatus(Result.NORECORD);
                result.setMessage("暂无数据！");
                result.setTotal(0);
                return result;
            }
    /*        for(Line line:linesAll){
                line.setLineImgs(lineImgDao.getLineImgByLineId(line.getId()));
                line.setDays(dayDao.getDaysByLineId(line.getId()));
            }*/

            /*获取所有状态为0的路线数目*/
            int count = lineDao.getTotalCount();
            result.setRows(linesAll);
            result.setTotal(count);
        }catch (Exception e){
            result.setStatus(Result.INCORRECT);
            result.setMessage("系统异常！");
        }
        return result;
    }

    public Result getLineIdAndTitle() {
        Result result = new Result();
        List<HashMap<String, Object>> idAndTitles = null;
        try {
            idAndTitles = lineDao.getAllLineIdAndTitle();
            result.setRows(idAndTitles);
            result.setStatus(Result.SUCCESS);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public Result queryOtherThreeById(int id) {
        Result result = new Result();
        result.setStatus(Result.SUCCESS);
        List<Line> returnLines = new ArrayList<>();
        List<Line> lines = lineDao.queryOtherThreeById(id);
        Random random = new Random();
        boolean flag = true;
        List<Integer> nums = new ArrayList<>();
        if(lines.size()<=3){
            for(Line line:lines){
                List<LineImg> imgs = lineImgDao.getLineImgByLineId(line.getId());
                line.setLineImgs(imgs);
            }
            result.setData(lines);
            return result;
        }else {
            while(flag){
                int num = random.nextInt(lines.size());
                if(nums.size() == 0){
                    nums.add(num);
                }else {
                    boolean has = false;
                    for (Integer i : nums){
                        if(i == num){
                            has = true;
                            break;
                        }
                    }
                    if(!has){
                        nums.add(num);
                    }
                }
                if(nums.size() == 3){
                    flag = false;
                }
            }
            for(Integer i : nums){
                List<LineImg> imgs = lineImgDao.getLineImgByLineId(lines.get(i).getId());
                lines.get(i).setLineImgs(imgs);
                returnLines.add(lines.get(i));
            }
        }
        result.setData(returnLines);
        return result;
    }

    public Result querySixLine() {
        Result result = new Result();
        result.setStatus(Result.SUCCESS);
        List<Line> lines = lineDao.querySixLine();
        for(Line line:lines){
            List<LineImg> imgs = lineImgDao.getLineImgByLineId(line.getId());
            line.setLineImgs(imgs);
        }
        result.setData(lines);
        return result;
    }
}
