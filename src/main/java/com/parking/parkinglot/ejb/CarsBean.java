package com.parking.parkinglot.ejb;

import com.parking.parkinglot.entities.Car;
import com.parking.parkinglot.common.CarDto;
import jakarta.ejb.EJBException;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;
import java.util.logging.Logger;

import java.util.List;

@Stateless
public class CarsBean {
    private static final Logger LOG = Logger.getLogger(CarsBean.class.getName());
    @PersistenceContext
    EntityManager entityManager;

    public List<CarDto> findAllCars() {
        LOG.info("findAllCars");
        try {
            TypedQuery<Car> typedQuery = entityManager.createQuery("SELECT c FROM Car c", Car.class);
            List<Car> cars = typedQuery.getResultList();
            return copyCarsToDto(cars);

        }catch(Exception e){
            throw new EJBException(e);
        }
    }

    private List<CarDto> copyCarsToDto(List<Car> cars){
        List<CarDto> temp = new java.util.ArrayList<>(List.of());
        for(Car car : cars){
            temp.add(new CarDto(car.getId(),car.getLicensePlate(),car.getParkingSpot(),car.getOwner().getUsername()));
        }
        return temp;
    }
}
