
package empregados.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Empregado")
public class Empregado {
	
	@Id
//	@GeneratedValue(strategy=GenerationType.AUTO)
//	@Column(name = "idEmpregado", nullable = false)
//	private int idEmpregado;
	
	@Column(name = "matEmpregado", nullable = false)
	private int matEmpregado;
	
	@Column(name = "nomeEmpregado")
	private String nomeEmpregado;
	
	@Column(name = "cargoEmpregado")
	private String cargoEmpregado;

	@Column(name = "senhaEmpregado")
	private int senhaEmpregado;
	
	public int getMatEmpregado() {
		return matEmpregado;
	}

	public void setMatEmpregado(int matEmpregado) {
		this.matEmpregado = matEmpregado;
	}

	public String getNomeEmpregado() {
		return nomeEmpregado;
	}

	public void setNomeEmpregado(String nomeEmpregado) {
		this.nomeEmpregado = nomeEmpregado;
	}

	public String getCargoEmpregado() {
		return cargoEmpregado;
	}

	public void setCargoEmpregado(String cargoEmpregado) {
		this.cargoEmpregado = cargoEmpregado;
	}

	public int getSenhaEmpregado() {
		return senhaEmpregado;
	}

	public void setSenhaEmpregado(int senhaEmpregado) {
		this.senhaEmpregado = senhaEmpregado;
	}

//	public int getIdEmpregado() {
//		return idEmpregado;
//	}
//
//	public void setIdEmpregado(int idEmpregado) {
//		this.idEmpregado = idEmpregado;
//	}

	
	
	
		
}