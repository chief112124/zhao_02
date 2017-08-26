package cotroller.upload;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import service.PictureService;
import utils.JsonUtils;

import java.util.Map;

/**
 * Created by Yang Qinfeng on 2017/8/26.
 */
public class PictureController {

    @Autowired
    private PictureService pictureService;

    @RequestMapping("/pic/upload")
    @ResponseBody
    public String pictureUpload(MultipartFile uploadFile) {
        Map result = pictureService.uploadPicture(uploadFile);
        //Ϊ�˱�֤���ܵļ����ԣ���Ҫ��Resultת����json��ʽ���ַ�����
        String json = JsonUtils.objectToJson(result);
        return json;
    }
}
