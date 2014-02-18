package com.springsource.vote.web;

import com.springsource.vote.domain.Vote;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/votes")
@Controller
@RooWebScaffold(path = "votes", formBackingObject = Vote.class)
public class VoteController {
}
