package dao.line;

import model.line.LineImg;

import java.util.List;

/**
 * Created by as749 on 2017/8/17.
 */
public interface LineImgDao {
    void addImg(LineImg lineImg);

    void deleteImgBylineId(int id);

    List<LineImg> getLineImgByLineId(int lineId);
}
