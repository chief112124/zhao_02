package dao.line;

import model.line.Day;

import java.util.List;

/**
 * Created by as749 on 2017/8/17.
 */
public interface DayDao {
    List<Day> getDaysByLineId(int lineId);

    void deleteDaysByLineId(int lineId);

    void inertLineDay(Day day);

    void deleteDaysById(int id);

    void updateDaysById(Day day);

    Day queryOneById(int id);
}
