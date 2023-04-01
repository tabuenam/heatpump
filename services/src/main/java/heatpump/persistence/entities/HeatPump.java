package heatpump.persistence.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "heat_pumps")
public class HeatPump {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long pumpId;

    @Column(name = "model", nullable = false)
    private String model;

    @Column(name = "brand", nullable = false)
    private String brand;

    @Column(name = "price", nullable = false)
    private int price;

    @Column(name = "cooling_capacity", nullable = false)
    private double coolingCapacity;

    @Column(name = "heating_capacity", nullable = false)
    private double heatingCapacity;

    @Column(name = "energy_rating", nullable = false)
    private String energyRating;

    @Column(name = "image_url", nullable = false)
    private String image;

    @Column(name = "created_at")
    private Date registeredDate;
}
