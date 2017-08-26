package cotroller.upload;

import model.Result;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by as749 on 2017/8/24.
 */
@Controller
@RequestMapping("/file")
public class FileController {
    @ResponseBody
    @RequestMapping(value = "/upload" ,method = RequestMethod.POST)
    public Result upload(@RequestParam(value="dir",required=false) MultipartFile img, HttpServletRequest request,HttpServletResponse response) throws Exception{
        Result result = new Result();
        result.setStatus(Result.SUCCESS);
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);
        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
        MultipartFile multipartFile = img;
    /*    String path = "D:/img";
        String fileName = new Date().getTime()+".jpg";*/
/*        File targetFile = new File(path, fileName);
        if(!targetFile.exists()){
            targetFile.mkdirs();
        }
        //保存
        try {
            img.transferTo(targetFile);
        } catch (Exception e) {
            e.printStackTrace();
        }*/
       /* result.setUrl(path+"/"+fileName);*/

        return result;
    }

    @RequestMapping(value = "/uploadtest")
    @ResponseBody
    public String uploadTest() {
        return "result";
    }
}
