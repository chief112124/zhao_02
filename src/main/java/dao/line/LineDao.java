package dao.line;

import model.line.Line;

import java.util.HashMap;
import java.util.List;

/**
 * Created by as749 on 2017/8/17.
 */
public interface LineDao {
    public int addLine(Line line);

    public void updateLine(Line line);

    void deleteLineById(int lineId);

    Line queryLineById(int id);

    List<Line> queryLineAllPage(HashMap<String,Object> map);

    List<Line> queryLinesAll(HashMap<String,Object> map);

    int getTotalCount();

    int getTotalCountByTime(HashMap<String,Object> map);

    List<HashMap<String, Object>> getAllLineIdAndTitle();

    List<Line> queryOtherThreeById(int id);


    List<Line> querySixLine();
}
