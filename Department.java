package models;

import java.util.*;
import javax.persistence.*;

import io.ebean.*;
import play.data.format.*;
import play.data.validation.*;

@Entity

public class Department extends Model {
@Id
private long id;

 @Constraints.Required
    private String name;

	@OneToMany 
	private List<Users> users;

	public Department(){
	
	}

	public Department(Long id, String name, List<Users> users) {
        this.id = id;
        this.name = name;
        this.users = users;
    }

	 public Long getId() {
        return this.id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Users> getUsers() {
        return users;
    }

    public void setUsers(List<Users> users) {
        this.users = users;
    }

}