package cotroller.admin;

import model.Result;
import model.admin.Admin;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import service.admin.AdminService;

import java.util.List;

/**
 * Created by Administrator on 2017/3/14.
 */
@Controller
@RequestMapping("/admin")
public class AdminC {

    @Autowired
    private AdminService adminService;

    @RequestMapping(value = "/hello")
    @ResponseBody
    public Admin hello(int id){
        Admin admin = adminService.getAdminById(id);
        return admin;
    }

    /*测试*/
    @RequestMapping(value = "/hello02")
    public String hello02(){
        return "/index";
    }

    /*测试*/
    @RequestMapping(value = "/hello03")
    @ResponseBody
    public Admin hello03(@RequestBody Admin admin){
        Admin admin01 = adminService.getAdminById(admin.getId());
        return admin01;
    }

    /*测试*/
    @RequestMapping(value = "/login")
    @ResponseBody
    public Result login(@RequestBody Admin admin){
        Result result = new Result();
        List<Admin> adminForReturn = adminService.getAdminByAdminName(admin.getAdminName());
        if(adminForReturn == null || adminForReturn.size() == 0){
            result.setStatus(Result.NORECORD);
            result.setMessage("用户名不存在！");
        }else if(!adminForReturn.get(0).getPasswd().equals(admin.getPasswd())){
            result.setStatus(Result.INCORRECT);
            result.setMessage("密码错误！");
        }else{
            result.setStatus(Result.SUCCESS);
        }
        return result;
    }
}
