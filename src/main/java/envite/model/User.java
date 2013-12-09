package envite.model;

import java.io.Serializable;

import java.util.Set;
import java.util.HashSet;

import javax.persistence.Column;
import javax.persistence.CollectionTable;
import javax.persistence.Entity;
import javax.persistence.ElementCollection;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "users")
public class User implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private Integer id;

	// everything is embedded

	@Column(nullable = false, unique = true)
	private String username;

	private String password;

	@Transient
	private String password2;

	@JsonIgnore
    @ElementCollection
    @CollectionTable(name = "authorities",
        joinColumns = @JoinColumn(name = "username", referencedColumnName="username"))
    @Column(name = "authority")
    private Set<String> roles;

    @JsonIgnore
    @Column(nullable = false)
    private boolean enabled;

	private String email;
	private String firstName;
	private String lastName;

	public User() {
		enabled = true;
		roles = new HashSet<String>();
	}

	// getters / setters
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	public Set<String> getRoles()
    {
        return roles;
    }

    public void setRoles( Set<String> roles )
    {
        this.roles = roles;
    }

	public String getEmail() {
		return email;
	}

	public boolean isEnabled()
    {
        return enabled;
    }

    public void setEnabled( boolean enabled )
    {
        this.enabled = enabled;
    }

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
}
