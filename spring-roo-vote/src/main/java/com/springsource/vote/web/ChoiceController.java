package com.springsource.vote.web;

import com.springsource.vote.domain.Choice;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/choices")
@Controller
@RooWebScaffold(path = "choices", formBackingObject = Choice.class)
public class ChoiceController {
}
