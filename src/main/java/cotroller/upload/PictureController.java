/*
package cotroller.upload;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import service.PictureService;
import utils.JsonUtils;

import java.util.Map;

*/
/**
 * Created by Yang Qinfeng on 2017/8/26.
 *//*

@Controller
@RequestMapping("/pic")
public class PictureController {
    @RequestMapping("/upload")
    @ResponseBody
    public String pictureUpload(MultipartFile uploadFile) {
        PictureService pictureService = new PictureService();
        Map result = pictureService.uploadPicture(uploadFile);
        String json = JsonUtils.objectToJson(result);
        return json;
    }
}
*/
