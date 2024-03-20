package io.hasura.hibernatejava1.model;

import jakarta.persistence.*;
import java.util.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import com.google.gson.annotations.Expose;

@Entity @Table(name = "`order`")
public class Order extends AbstractModel {
    @Id @GeneratedValue @Expose
    public UUID id;

    @Column(name = "created_at") @CreationTimestamp @Expose
    public Date createdAt;

    @Column(name = "updated_at") @UpdateTimestamp @Expose
    public Date updatedAt;

    @Expose
    public String status;

    @OneToMany(fetch = FetchType.LAZY) @JoinColumn(name = "order_id") @Expose
    public Set<OrderDetail> orderDetails = new HashSet<>();
}
