package Menu;
//Lab2change
//change
import com.opensymphony.xwork2.ActionSupport;
public class Author extends ActionSupport{
	private String Name;
	private String Country;
	private String Age;
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getCountry() {
		return Country;
	}
	public void setCountry(String country) {
		Country = country;
	}
	public String getAge() {
		return Age;
	}
	public void setAge(String age) {
		Age = age;
	}

}
