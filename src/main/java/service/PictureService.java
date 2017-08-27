/*
package service;

import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import utils.FtpUtil;
import utils.IDUtils;

import java.util.HashMap;
import java.util.Map;

*/
/**
 * Created by Yang Qinfeng on 2017/8/26.
 *//*

@Service
public class PictureService {

    private String FTP_ADDRESS = "47.94.175.16";
    private Integer FTP_PORT = 22;
    private String FTP_USERNAME = "root";
    private String FTP_PASSWORD = "Zy1115741382";
    private String FTP_BASE_PATH = "/home/ftpuser/www/images";
    private String IMAGE_BASE_URL = "47.94.175.16/images";

    public Map uploadPicture(MultipartFile uploadFile) {
        Map resultMap = new HashMap<>();
        try {
            //???????????????
            //????????
            String oldName = uploadFile.getOriginalFilename();
            //???????????
            //UUID.randomUUID();
            String newName = IDUtils.genImageName();
            newName = newName + oldName.substring(oldName.lastIndexOf("."));
            //?????
            String imagePath = new DateTime().toString("/yyyy/MM/dd");
            boolean result = FtpUtil.uploadFile(FTP_ADDRESS, FTP_PORT, FTP_USERNAME, FTP_PASSWORD,
                    FTP_BASE_PATH, imagePath, newName, uploadFile.getInputStream());
            //??????
            if(!result) {
                resultMap.put("error", 1);
                resultMap.put("message", "?????????");
                return resultMap;
            }
            resultMap.put("error", 0);
            resultMap.put("url", IMAGE_BASE_URL + imagePath + "/" + newName);
            return resultMap;

        } catch (Exception e) {
            resultMap.put("error", 1);
            resultMap.put("message", "????????????");
            return resultMap;
        }
    }

}
*/
