package indicadores.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name="Indicador")
public class Indicador {
	
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(name = "idIndicador", nullable = false)
	private int idIndicador;
	
	@Column(name = "dataIndicador")
	private String dataIndicador;
	
	@Column(name="depIndicador")
	private String depIndicador;
	
	@Column(name="nomeIndicador")
	private String nomeIndicador;
	
	@Column(name="valorIndicador")
	private double valorIndicador;
	
	@Column(name="metaIndicador")
	private double metaIndicador;

	

	
	// PENSEI EM CRIAR PESOS MAS DESISTI
	
	public int getIdIndicador() {
		return idIndicador;
	}

	public void setIdIndicador(int idIndicador) {
		this.idIndicador = idIndicador;
	}

	public String getDataIndicador() {
		return dataIndicador;
	}

	public void setDataIndicador(String dataIndicador) {
		this.dataIndicador = dataIndicador;
	}

	public String getDepIndicador() {
		return depIndicador;
	}

	public void setDepIndicador(String depIndicador) {
		this.depIndicador = depIndicador;
	}

	public String getNomeIndicador() {
		return nomeIndicador;
	}

	public void setNomeIndicador(String nomeIndicador) {
		this.nomeIndicador = nomeIndicador;
	}

	public double getValorIndicador() {
		return valorIndicador;
	}

	public void setValorIndicador(double valorIndicador) {
		this.valorIndicador = valorIndicador;
	}

	public double getMetaIndicador() {
		return metaIndicador;
	}

	public void setMetaIndicador(double metaIndicador) {
		this.metaIndicador = metaIndicador;
	}
	
	
	
	
	
}
	
	