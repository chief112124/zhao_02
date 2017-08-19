package service.admin;

import dao.admin.AdminDao;
import model.admin.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/3/14.
 */
@Service
public class AdminService {
    @Autowired
    private AdminDao adminDao;
    public Admin getAdminById(int id){
        return adminDao.getAdmin(id);
    }

    public List<Admin> getAdminByAdminName(String adminName) {
        return adminDao.getAdminByAdminName(adminName);
    }
}
