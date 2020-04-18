package indicadores.model;

import java.util.List;

import indicadores.dao.IndicadorDAO;


public class IndicadorManager {

	public static String cadastrarIndicador(String nomeIndicador, int valorIndicador, String depIndicador, String dataIndicador, int metaIndicador) {
		
		IndicadorDAO dao = new IndicadorDAO();

		// Verifica se todos os campos estão preenchidos
		if( nomeIndicador == null || valorIndicador == 0|| metaIndicador==0 || depIndicador == null || dataIndicador == null) { 
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
		novo.setDataIndicador(dataIndicador);
		novo.setDepIndicador(depIndicador);
		novo.setNomeIndicador(nomeIndicador);
		novo.setValorIndicador(valorIndicador);
		novo.setMetaIndicador(metaIndicador);
		
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
	
	public static String editarIndicador(int idIndicador, String nomeIndicador, int valorIndicador, String depIndicador, String dataIndicador, int metaIndicador) {
		
		IndicadorDAO dao = new IndicadorDAO();

				// Verifica se todos os campos estão preenchidos
				if( nomeIndicador == null || valorIndicador == 0|| depIndicador == null || metaIndicador ==0 || dataIndicador == null) { 
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
		existente.setDepIndicador(depIndicador);
		existente.setNomeIndicador(nomeIndicador);
		existente.setValorIndicador(valorIndicador);
		existente.setMetaIndicador(metaIndicador);
				
		
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
		novo.setNomeIndicador("Operações Contratadas no mês");
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

}
