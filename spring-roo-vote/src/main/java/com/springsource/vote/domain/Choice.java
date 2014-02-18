package com.springsource.vote.domain;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Choice {

    @NotNull
    @Size(min = 1, max = 30)
    private String namingChoice;

    @Size(max = 80)
    private String description;
}
