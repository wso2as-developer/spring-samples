package com.wedding.domain;

import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findRsvpsByCodeEquals" })
public class Rsvp {

    @NotNull
    @Size(min = 1, max = 30)
    private String code;

    @Size(max = 30)
    private String email;

    private Integer attending;

    @Size(max = 100)
    private String specialRequests;

    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(style = "M-")
    private Date confirmed;
}
