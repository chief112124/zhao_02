package cotroller.upload;

import model.Result;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.Date;

/**
 * Created by as749 on 2017/8/24.
 */
@Controller
@RequestMapping("/file")
public class FileController {
    @ResponseBody
    @RequestMapping(value = "/upload" ,method = RequestMethod.POST)
    public Result upload(@RequestParam(value="img",required=false) MultipartFile img, HttpServletRequest request,HttpServletResponse response) throws Exception{
        Result result = new Result();
        result.setStatus(Result.SUCCESS);

//        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        String path = "/home/ftpuser/www/imageWeb/";
        String fileName = new Date().getTime()+".jpg";
        File targetFile = new File(path, fileName);
        if(!targetFile.exists()){
            targetFile.mkdirs();
        }
        //保存
        try {
            img.transferTo(targetFile);
        } catch (Exception e) {
            e.printStackTrace();
        }
        result.setUrl("http://47.94.175.16/imageWeb"+"/"+fileName);
        return result;
    }

    @RequestMapping(value = "/uploadtest")
    @ResponseBody
    public String uploadTest() {
        return "result";
    }
}
