package dao.admin;

import model.admin.Admin;

import java.util.List;


/**
 * Created by Administrator on 2017/3/14.
 */

public interface AdminDao {

    Admin getAdmin(int id);

    List<Admin> getAdminByAdminName(String adminName);
}
