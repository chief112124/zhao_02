package cotroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Yang Qinfeng on 2017/8/19.
 */
@Controller
public class PageC {
    /*ÏÔÊ¾Ê×Ò³*/
    @RequestMapping("/")
    public String showIndex() {
        return "index";
    }

    @RequestMapping("/{page}")
    public String page(@PathVariable String page) {
        return page;
    }
}
