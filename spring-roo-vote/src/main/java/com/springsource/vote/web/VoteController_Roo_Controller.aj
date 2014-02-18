// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.vote.web;

import com.springsource.vote.domain.Choice;
import com.springsource.vote.domain.Vote;
import com.springsource.vote.web.VoteController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect VoteController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String VoteController.create(@Valid Vote vote, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, vote);
            return "votes/create";
        }
        uiModel.asMap().clear();
        vote.persist();
        return "redirect:/votes/" + encodeUrlPathSegment(vote.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String VoteController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Vote());
        return "votes/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String VoteController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("vote", Vote.findVote(id));
        uiModel.addAttribute("itemId", id);
        return "votes/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String VoteController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("votes", Vote.findVoteEntries(firstResult, sizeNo));
            float nrOfPages = (float) Vote.countVotes() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("votes", Vote.findAllVotes());
        }
        addDateTimeFormatPatterns(uiModel);
        return "votes/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String VoteController.update(@Valid Vote vote, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, vote);
            return "votes/update";
        }
        uiModel.asMap().clear();
        vote.merge();
        return "redirect:/votes/" + encodeUrlPathSegment(vote.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String VoteController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Vote.findVote(id));
        return "votes/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String VoteController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Vote vote = Vote.findVote(id);
        vote.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/votes";
    }
    
    void VoteController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("vote_registered_date_format", DateTimeFormat.patternForStyle("M-", LocaleContextHolder.getLocale()));
    }
    
    void VoteController.populateEditForm(Model uiModel, Vote vote) {
        uiModel.addAttribute("vote", vote);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("choices", Choice.findAllChoices());
    }
    
    String VoteController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}