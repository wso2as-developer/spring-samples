// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.springsource.vote.domain;

import com.springsource.vote.domain.Vote;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Vote_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Vote.entityManager;
    
    public static final EntityManager Vote.entityManager() {
        EntityManager em = new Vote().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Vote.countVotes() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Vote o", Long.class).getSingleResult();
    }
    
    public static List<Vote> Vote.findAllVotes() {
        return entityManager().createQuery("SELECT o FROM Vote o", Vote.class).getResultList();
    }
    
    public static Vote Vote.findVote(Long id) {
        if (id == null) return null;
        return entityManager().find(Vote.class, id);
    }
    
    public static List<Vote> Vote.findVoteEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Vote o", Vote.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Vote.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Vote.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Vote attached = Vote.findVote(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Vote.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Vote.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Vote Vote.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Vote merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
