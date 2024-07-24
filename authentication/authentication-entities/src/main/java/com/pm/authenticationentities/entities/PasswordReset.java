package com.pm.authenticationentities.entities;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.Date;
import java.util.UUID;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "passwordresets")
public class PasswordReset {

    @Id
    @GeneratedValue(generator = "UUID")
    @GenericGenerator(
            name = "UUID",
            strategy = "org.hibernate.id.UUIDGenerator"
    )
    @Column(updatable = false, nullable = false)
    private UUID id;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    private String resetCode;

    @Temporal(TemporalType.TIMESTAMP)
    private Date expiryTimestamp;

    private Boolean isReset = false;

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getResetCode() {
        return resetCode;
    }

    public void setResetCode(String resetCode) {
        this.resetCode = resetCode;
    }

    public Date getExpiryTimestamp() {
        return expiryTimestamp;
    }

    public void setExpiryTimestamp(Date expiryTimestamp) {
        this.expiryTimestamp = expiryTimestamp;
    }

    public Boolean getReset() {
        return isReset;
    }

    public void setReset(Boolean reset) {
        isReset = reset;
    }

    // Getters and ...
}
