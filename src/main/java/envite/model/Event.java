package envite.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob; 
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.CascadeType;

import org.springframework.transaction.annotation.Transactional;

@Entity
@Table(name = "events")
public class Event implements Serializable {

	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private Integer id;
	
	private String title;
	private String message;
	
	@OneToMany( cascade = { CascadeType.PERSIST, CascadeType.MERGE } )
	private List<Guest> guests;
	
	@OneToOne( cascade = CascadeType.ALL )
	private User creator;

	// Store the banner image in database
	@Lob
	@Basic(fetch = FetchType.LAZY)
	@Column(nullable = true)
	private byte[] banner;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public List<Guest> getGuests() {
		return guests;
	}

	public void setGuests(List<Guest> guests) {
		this.guests = guests;
	}

	public User getCreator() {
		return creator;
	}

	public void setCreator(User creator) {
		this.creator = creator;
	}

	@Transactional
	public byte[] getBanner() {
		return banner;
	}

	@Transactional
	public void setBanner(byte[] banner) {
		this.banner = banner;
	}
}
