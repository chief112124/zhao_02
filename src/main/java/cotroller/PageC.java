package cotroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Yang Qinfeng on 2017/8/19.
 */
@Controller
public class PageC {
    /*显示首页*/
    @RequestMapping("/backend")
    public String showIndex() {
        return "index";
    }

    /*显示首页*/
    @RequestMapping("/")
    public String showMain() {
        return "main";
    }

    @RequestMapping("/{page}")
    public String page(@PathVariable String page) {
        return page;
    }

}
