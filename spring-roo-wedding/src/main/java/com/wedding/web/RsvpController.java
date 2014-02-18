package com.wedding.web;

import com.wedding.domain.Rsvp;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/rsvps")
@Controller
@RooWebScaffold(path = "rsvps", formBackingObject = Rsvp.class)
public class RsvpController {
}
