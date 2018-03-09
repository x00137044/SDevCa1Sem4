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
	private List<Employee> employee;

	public Department(){
	
	}

	public Department(Long id, String name, List<Users> employee) {
        this.id = id;
        this.name = name;
        this.employee = employee;
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

    public List<Employee> getEmployee() {
        return employee;
    }

    public void setEmployee(List<Employee> employee) {
        this.employee = employee;
    }
	
	public static Finder<Long, Department> find = new Finder<Long, Department>(Department.class);

    public static List<Department> findAll() {
        return Department.find.query().where().orderBy("name asc").findList();
    }

    public static Map<String, String> options() {
        LinkedHashMap<String, String> options = new LinkedHashMap();

        for (Department a: Department.findAll()) {
            options.put(a.getId().toString(), a.getName());
        }
        
        return options;
    }
}