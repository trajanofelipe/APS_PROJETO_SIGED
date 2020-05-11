package indicadores.model;

import java.util.ArrayList;
import java.util.List;

import indicadores.dao.IndicadorDAO;


public class IndicadorManager {

		
	
	public static String cadastrarIndicador(String nomeIndicador, String dataIndicador, String depIndicador,  double metaIndicador, double valorIndicador) {
		
		IndicadorDAO dao = new IndicadorDAO();

		// Verifica se todos os campos estão preenchidos
		if( nomeIndicador == null || metaIndicador==0 || depIndicador == null || dataIndicador == null) { 
			String mensagem = "Não foi possível cadastrar o indicador: Preencha todos os campos obrigatórios.";
			return mensagem;
		}

		// Verifica se Já existe indicador com este nome
		Indicador existente = dao.selecionarPorNome(nomeIndicador);
		if( existente != null ) {
			String mensagem = "Não foi possível cadastrar o indicador: Já existe outro indicador com o mesmo nome.";
			return mensagem;
		}

		Indicador novo = new Indicador();
		novo.setNomeIndicador(nomeIndicador);
		novo.setDataIndicador(dataIndicador);
		novo.setDepIndicador(depIndicador);
		novo.setMetaIndicador(metaIndicador);
		novo.setValorIndicador(valorIndicador);
	
		
		
		
		try {
			dao.inserir(novo);
			String mensagem = "Indicador " + novo.getNomeIndicador() + " inserido com sucesso.";
			
			
			
			return mensagem;
		} catch( Exception e ) {
			e.printStackTrace();
			String mensagem = "Não foi possível cadastrar o indicador";
			
			return mensagem;
		}
	}
	
	public IndicadorManager() {
	super();
	// TODO Auto-generated constructor stub
	}
	
	public static String editarIndicador(int idIndicador, String dataIndicador, String nomeIndicador, String depIndicador, double metaIndicador, double valorIndicador) {
		
		IndicadorDAO dao = new IndicadorDAO();

				// Verifica se todos os campos estão preenchidos
				if( nomeIndicador == null || depIndicador == null || metaIndicador ==0 || dataIndicador == null) { 
					String mensagem = "Não foi possível editar o indicador: Preencha todos os campos obrigatórios.";
					return mensagem;
				}

				// Verifica se Já existe indicador com este nome
				Indicador existente = dao.selecionarPorNome(nomeIndicador);
				if( existente != null && existente.getIdIndicador() != idIndicador ) {
					String mensagem = "Não foi possível editar o indicaor: Já existe outro indicador com este nome.";
					return mensagem;
				}

		// Recupera o Indicador a editar
		existente = (Indicador)dao.selecionarPorId(idIndicador);
		existente.setDataIndicador(dataIndicador);
		existente.setNomeIndicador(nomeIndicador);
		existente.setDepIndicador(depIndicador);
		existente.setMetaIndicador(metaIndicador);
		existente.setValorIndicador(valorIndicador);
		
				
		
		try {
			dao.atualizar(existente);
			String mensagem = "Indicador " + existente.getNomeIndicador() + " atualizado com sucesso.";
			return mensagem;
		} catch( Exception e ) {
			e.printStackTrace();
			String mensagem = "Não foi possível editar o Indicador";
			System.out.println(existente.getNomeIndicador());
			return mensagem;
		}
	}
	
	public static String apagarIndicador( int idIndicador) {
		IndicadorDAO dao = new IndicadorDAO();
		
		try {
			dao.apagar(idIndicador);
			//System.out.println(matEmpregado);
			String mensagem = "Indicador apagado com sucesso";
			return mensagem;
		} catch( Exception e ) {
			e.printStackTrace();
			String mensagem = "Não foi possível apagar o indicador";
			return mensagem;
		}
	}


	public static List<Indicador> consultarTodosIndicador() {
		IndicadorDAO dao = new IndicadorDAO();
		List<Indicador> lista = dao.selecionarTodos();
		return lista;
	}

	
	public static List<String> consultarIndicadorPorNome() {
		IndicadorDAO dao = new IndicadorDAO();
		List<Indicador> indicador = dao.selecionarTodos();
		List<String> nome = new ArrayList<String>();
		
		for (Indicador ind : indicador) {
				
				nome.add(ind.getNomeIndicador());
			
		}
		
		
		
		
		return nome;
	}
	
	public static double resultado(double valorIndicador, double metaIndicador) {
		IndicadorDAO dao = new IndicadorDAO();
		
		double resultado = dao.resultado(valorIndicador, metaIndicador);
		return resultado;
	}

	
	
	public static Indicador consultarIndicadorPorId( int idIndicador) {
		IndicadorDAO dao = new IndicadorDAO();
		Indicador indicador = dao.selecionarPorId(idIndicador);
		return indicador;
	}


	

	// Limpeza do BD
	
	
	public static void limparBDIndicador() {
		IndicadorDAO indicadorDAO = new IndicadorDAO();
		List<Indicador> indicadores = indicadorDAO.selecionarTodos();
		for (Indicador indicador : indicadores) {
			indicadorDAO.apagar(indicador.getIdIndicador());
//			System.out.println(empregado.getNomeEmpregado() + ' ' +  empregado.getMatEmpregado());
			
		}		
		System.out.println("Indicadores apagados com sucesso!");
	}
	
	public static void popularBDIndicador() {
		IndicadorDAO indicadorDAO = new IndicadorDAO();
		Indicador novo = new Indicador();
		novo.setDataIndicador("Abril/2020");
		novo.setDepIndicador("DEOPE");
		novo.setNomeIndicador("Operações Contratadas");
		novo.setMetaIndicador(1000);
		novo.setValorIndicador(0);
		indicadorDAO.inserir(novo);
		
		novo.setDataIndicador("Abril/2020");
		novo.setDepIndicador("DEOPE");
		novo.setNomeIndicador("Clientes Atendidos");
		novo.setMetaIndicador(200);
		novo.setValorIndicador(0);
		indicadorDAO.inserir(novo);
		
		
	}
	
	public static List<Indicador> consultarIndicadorPorDataDep( String dataIndicador, String depIndicador) {
		IndicadorDAO dao = new IndicadorDAO();
		List <Indicador> indicador = dao.selecionarIndicadorPorData(dataIndicador, depIndicador);
		return indicador;
	}
	

		
	
	
	public static String lancarIndicador(int idIndicador, String dataIndicador, String nomeIndicador, String depIndicador, double metaIndicador, double valorIndicador) {
		
		IndicadorDAO dao = new IndicadorDAO();

			// Verifica se Já existe indicador com este nome
				Indicador existente = dao.selecionarPorNome(nomeIndicador);
			

		// Recupera o Indicador a editar
		existente = (Indicador)dao.selecionarPorId(idIndicador);
		existente.setDataIndicador(dataIndicador);
		existente.setNomeIndicador(nomeIndicador);
		existente.setDepIndicador(depIndicador);
		existente.setMetaIndicador(metaIndicador);
		existente.setValorIndicador(valorIndicador);
		
				
		
		try {
			dao.atualizar(existente);
			String mensagem = "Indicador " + existente.getNomeIndicador() + " lançado com sucesso.";
			return mensagem;
		} catch( Exception e ) {
			e.printStackTrace();
			String mensagem = "Não foi possível lançar o Indicador";
			System.out.println(existente.getNomeIndicador());
			return mensagem;
		}
	}

	
}
