package be.kdg.infrastructure3.finalproject_backend;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageController {

    @GetMapping("/books")
    public String books() {
        return "books.html";
    }

}