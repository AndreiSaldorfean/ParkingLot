package com.parking.parkinglot.ejb;

import com.parking.parkinglot.common.CarPhotoDto;
import com.parking.parkinglot.entities.Car;
import com.parking.parkinglot.common.CarDto;
import com.parking.parkinglot.entities.CarPhoto;
import com.parking.parkinglot.entities.User;
import jakarta.ejb.EJBException;
import jakarta.ejb.Stateless;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;

import javax.smartcardio.Card;
import java.util.Collection;
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
    public void deleteCarsByIds(Collection<Long> carIds){
        LOG.info("deleteCarsByIds");
        for(Long carId : carIds){
            Car car = entityManager.find(Car.class, carId);
            entityManager.remove(car);
        }
    }
    public void updateCar(Long carId,String licensePlate, String parkingSpot, Long userId){
        LOG.info("updateCar");
        Car car = entityManager.find(Car.class, carId);
        car.setLicensePlate(licensePlate);
        car.setParkingSpot(parkingSpot);

        // remove the car from the old owner
        User oldUser = car.getOwner();
        oldUser.getCars().remove(car);

        // add the car to its new owner
        User user = entityManager.find(User.class, userId);
        user.getCars().add(car);
        car.setOwner(user);
    }
    public CarDto findById(Long carId){
        LOG.info("findById");

        try {
            TypedQuery<Car> typedQuery = entityManager.createQuery("SELECT c FROM Car c WHERE c.id like "+carId.toString(), Car.class);
            return new CarDto(typedQuery.getSingleResult().getId(),
                              typedQuery.getSingleResult().getLicensePlate(),
                              typedQuery.getSingleResult().getParkingSpot(),
                              typedQuery.getSingleResult().getOwner().getUsername());


        }catch(Exception e){
            throw new EJBException(e);
        }
    }
    public void createCar(String licensePlate, String parkingSpot, Long userId) {
        LOG.info("createCar");
        Car car = new Car();
        car.setLicensePlate(licensePlate);
        car.setParkingSpot(parkingSpot);

        User user = entityManager.find(User.class, userId);
        user.getCars().add(car);
        car.setOwner(user);

        entityManager.persist(car);
    }
    private List<CarDto> copyCarsToDto(List<Car> cars){
        List<CarDto> temp = new java.util.ArrayList<>(List.of());
        for(Car car : cars){
            temp.add(new CarDto(car.getId(),car.getLicensePlate(),car.getParkingSpot(),car.getOwner().getUsername()));
        }
        return temp;
    }

    public void addPhotoToCar(Long carId, String filename, String fileType, byte[] fileContent) {
        LOG.info("addPhotoToCar");
        CarPhoto photo = new CarPhoto();
        photo.setFilename(filename);
        photo.setFileType(fileType);
        photo.setFileContent(fileContent);
        Car car = entityManager.find(Car.class, carId);
        if (car.getPhoto() != null) {
            entityManager.remove(car.getPhoto());
        }
        car.setPhoto(photo);
        photo.setCar(car);
        entityManager.persist(photo);
    }
    public CarPhotoDto findPhotoByCarId(Integer carId) {
        List<CarPhoto> photos = entityManager
                .createQuery("SELECT p FROM CarPhoto p where p.car.id = :id", CarPhoto.class)
                .setParameter("id", carId)
                .getResultList();
        if (photos.isEmpty()) {
            return null;
        }
        CarPhoto photo = photos.get(0); // the first element
        return new CarPhotoDto(photo.getId(), photo.getFilename(), photo.getFileType(),
                photo.getFileContent());
    }

}
