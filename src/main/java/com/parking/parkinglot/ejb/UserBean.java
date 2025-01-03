package com.parking.parkinglot.ejb;

import com.parking.parkinglot.common.CarDto;
import com.parking.parkinglot.entities.Car;
import com.parking.parkinglot.entities.User;
import com.parking.parkinglot.entities.UserGroup;
import com.parking.parkinglot.common.UserDto;
import jakarta.ejb.EJBException;
import jakarta.ejb.Stateless;
import jakarta.inject.Inject;
import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.persistence.TypedQuery;

import java.util.ArrayList;
import java.util.Collection;
import java.util.logging.Logger;

import java.util.List;

@Stateless
public class UserBean {
    private static final Logger LOG = Logger.getLogger(UserBean.class.getName());
    @PersistenceContext
    EntityManager entityManager;

    @Inject
    PasswordBean passwordBean;

    public List<UserDto> findAllUsers() {
        LOG.info("findAllUsers");
        try {
            TypedQuery<User> typedQuery = entityManager.createQuery("SELECT u FROM User u", User.class);
            List<User> users = typedQuery.getResultList();
            return copyUsersToDto(users);

        }catch(Exception e){
            throw new EJBException(e);
        }
    }

    public Collection<String> findUsernameByUserId(Collection<Long> userIds) {
        LOG.info("findUsernameByUserId");
        List<String> usernames =
                entityManager.createQuery("SELECT u.username FROM User u WHERE u.id IN :userIds", String.class)
                    .setParameter("userIds",userIds)
                    .getResultList();
        return usernames;
    }
    private List<UserDto> copyUsersToDto(List<User> users){
        List<UserDto> temp = new java.util.ArrayList<>(List.of());
        for(User user : users){
            temp.add(new UserDto(user.getId(),user.getUsername(),user.getEmail()));
        }
        return temp;
    }
    public void createUser(String username, String email, String password, Collection<String> groups) {
        LOG.info("createUser");
        User newUser = new User();
        newUser.setUsername(username);
        newUser.setEmail(email);
        newUser.setPassword(passwordBean.convertToSha256(password));
        entityManager.persist(newUser);
        assignGroupsToUser(username, groups);
    }
    private void assignGroupsToUser(String username, Collection<String> groups) {
        LOG.info("assignGroupsToUser");
        for (String group : groups) {
            UserGroup userGroup = new UserGroup();
            userGroup.setUsername(username);
            userGroup.setUserGroup(group);
            entityManager.persist(userGroup);
        }
    }

    public UserDto findById(Long userId){
        LOG.info("findById");

        try {
            TypedQuery<User> typedQuery = entityManager.createQuery("SELECT u FROM User u WHERE u.id like "+userId.toString(), User.class);
            return new UserDto(typedQuery.getSingleResult().getId(),
                    typedQuery.getSingleResult().getUsername(),
                    typedQuery.getSingleResult().getEmail(),
                    typedQuery.getSingleResult().getPassword());
        }catch(Exception e){
            throw new EJBException(e);
        }
    }

    public void updateUser(Long userId,String username, String email, String password){
        LOG.info("updateUser");
        User user = entityManager.find(User.class, userId);
        user.setUsername(username);
        user.setEmail(email);
        if(!password.isEmpty())user.setPassword(password);
    }
}
