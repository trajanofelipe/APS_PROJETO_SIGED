package empregados.model;
import java.util.List;

//import org.hibernate.mapping.Map;

import empregados.dao.EmpregadoDAO;


public class EmpregadoManager {

	public static String cadastrarEmpregado(int matEmpregado, String nomeEmpregado, String cargoEmpregado, String senhaEmpregado, String depEmpregado) {
		EmpregadoDAO dao = new EmpregadoDAO();

		// Verifica se todos os campos estão preenchidos
		if( nomeEmpregado == null || matEmpregado == 0|| cargoEmpregado == null || senhaEmpregado == null || depEmpregado == null) { 
			String mensagem = "Não foi possível cadastrar o empregado: Preencha todos os campos obrigatórios.";
			return mensagem;
		}

		// Verifica se Já existe empregado com este nome
		Empregado existente = dao.selecionarPorNome(nomeEmpregado);
		if( existente != null ) {
			String mensagem = "Não foi possível cadastrar o empregado: Já existe outro empregado com o mesmo nome.";
			return mensagem;
		}

		Empregado novo = new Empregado();
		novo.setMatEmpregado(matEmpregado);
		novo.setNomeEmpregado(nomeEmpregado);
		novo.setCargoEmpregado(cargoEmpregado);
		novo.setSenhaEmpregado(senhaEmpregado);
		novo.setDepEmpregado(depEmpregado);
		
		try {
			dao.inserir(novo);
			String mensagem = "Empregado " + novo.getNomeEmpregado() + " inserido com sucesso.";
			return mensagem;
		} catch( Exception e ) {
			e.printStackTrace();
			String mensagem = "Não foi possível cadastrar o empregado";
			
			return mensagem;
		}
	}
	
	public EmpregadoManager() {
	super();
	// TODO Auto-generated constructor stub
	}
	public static String editarEmpregado(int matEmpregado, String nomeEmpregado, String cargoEmpregado, String senhaEmpregado, String depEmpregado) {
		EmpregadoDAO dao = new EmpregadoDAO();

		// Verifica se todos os campos estão preenchidos
		if( nomeEmpregado == null || matEmpregado == 0 || cargoEmpregado== null || senhaEmpregado == null || depEmpregado == null) { 
			String mensagem = "Não foi possível editar o empregado: Preencha todos os campos obrigatórios.";
			return mensagem;
		}

		// Verifica se Já existe empregado com este nome
		Empregado existente = dao.selecionarPorNome(nomeEmpregado);
		if( existente != null && existente.getMatEmpregado() != matEmpregado) {
			String mensagem = "Não foi possível editar o empregado: Já existe outro Empregado com este nome.";
			return mensagem;
		}

		// Recupera o Empregado a editar
		existente = (Empregado)dao.selecionarPorMat(matEmpregado);
		existente.setNomeEmpregado(nomeEmpregado);
		existente.setMatEmpregado(matEmpregado);
		existente.setCargoEmpregado(cargoEmpregado);
		existente.setSenhaEmpregado(senhaEmpregado);
		existente.setDepEmpregado(depEmpregado);
		
		
		try {
			dao.atualizar(existente);
			String mensagem = "Empregado " + existente.getNomeEmpregado() + " atualizado com sucesso.";
			return mensagem;
		} catch( Exception e ) {
			e.printStackTrace();
			String mensagem = "Não foi possível editar o Empregado";
			System.out.println(existente.getNomeEmpregado());
			return mensagem;
		}
	}
	
	public static String apagarEmpregado( int matEmpregado ) {
		EmpregadoDAO dao = new EmpregadoDAO();
		
		try {
			dao.apagar(matEmpregado);
			System.out.println(matEmpregado);
			String mensagem = "Empregado apagado com sucesso: ";
			return mensagem;
		} catch( Exception e ) {
			e.printStackTrace();
			String mensagem = "Não foi possível apagar o empregado: ";
			return mensagem;
		}
	}


	public static List<Empregado> consultarTodosEmpregado() {
		EmpregadoDAO dao = new EmpregadoDAO();
		List<Empregado> lista = dao.selecionarTodos();
		return lista;
	}
	
	public static Empregado login(String nomeEmpregado, String senhaEmpregado) {
		EmpregadoDAO dao = new EmpregadoDAO();
		Empregado empregado = dao.login(nomeEmpregado, senhaEmpregado);
		
		return empregado;
	}

	public static Empregado consultarEmpregadosPorMat( int matEmpregado ) {
		EmpregadoDAO dao = new EmpregadoDAO();
		Empregado empregado = dao.selecionarPorMat(matEmpregado);
		return empregado;
	}
	
	public static Empregado consultarEmpregadosPorNome(String nomeEmpregado ) {
		EmpregadoDAO dao = new EmpregadoDAO();
		Empregado empregado = dao.selecionarPorNome(nomeEmpregado);
		return empregado;
	}
	

//	public static Empregado consultarEmpregadosLogin( String nomeEmpregado, int senhaEmpregado ) {
//		EmpregadoDAO dao = new EmpregadoDAO();
//		Empregado empregado = dao.selecionarPorMat(matEmpregado);
//		return empregado;
//	}

	// Limpeza do BD
	
	
	public static void limparBDEmpregado() {
		EmpregadoDAO empregadoDAO = new EmpregadoDAO();
		List<Empregado> empregados = empregadoDAO.selecionarTodos();
		for (Empregado empregado : empregados) {
			empregadoDAO.apagar(empregado.getMatEmpregado());
//			System.out.println(empregado.getNomeEmpregado() + ' ' +  empregado.getMatEmpregado());
			
		}		
		System.out.println("Empregados apagados com sucesso!");
	}
	
	public static void popularBDEmpregado() {
		EmpregadoDAO empregadoDao = new EmpregadoDAO();
		Empregado novo = new Empregado();
		novo.setMatEmpregado(111);
		novo.setNomeEmpregado("marcelosilva");
		novo.setCargoEmpregado("Analista de Desenvolvimento");
		novo.setSenhaEmpregado("1111");
		novo.setDepEmpregado("DEPTI");
		empregadoDao.inserir(novo);
		
		novo.setMatEmpregado(121);
		novo.setNomeEmpregado("andreleite");
		novo.setCargoEmpregado("Gestor");
		novo.setSenhaEmpregado("2121");
		novo.setDepEmpregado("DEPTI");
		empregadoDao.inserir(novo);
		
		novo.setMatEmpregado(222);
		novo.setNomeEmpregado("felipevelozo");
		novo.setCargoEmpregado("Analista de Desenvolvimento");
		novo.setSenhaEmpregado("2222");
		novo.setDepEmpregado("DEOPE");
		empregadoDao.inserir(novo);
			
		novo.setMatEmpregado(333);
		novo.setNomeEmpregado("rafaelvieira");
		novo.setCargoEmpregado("Gestor");
		novo.setSenhaEmpregado("3333");
		novo.setDepEmpregado("DEOPE");
		empregadoDao.inserir(novo);
		
		novo.setMatEmpregado(414);
		novo.setNomeEmpregado("carlossantos");
		novo.setCargoEmpregado("Analista de Desenvolvimento");
		novo.setSenhaEmpregado("1414");
		novo.setDepEmpregado("DEPRH");
		empregadoDao.inserir(novo);
		
		novo.setMatEmpregado(424);
		novo.setNomeEmpregado("brunosilva");
		novo.setCargoEmpregado("Gestor");
		novo.setSenhaEmpregado("2424");
		novo.setDepEmpregado("DEPRH");
		empregadoDao.inserir(novo);
		
		novo.setMatEmpregado(444);
		novo.setNomeEmpregado("hicarosouza");
		novo.setCargoEmpregado("Analista do Sistema");
		novo.setSenhaEmpregado("4444");
		novo.setDepEmpregado("DEPTI");
		empregadoDao.inserir(novo);
		
	}
	
//		public String login(String nomeEmpregado, String senhaEmpregado) {
//			EmpregadoDAO dao = new EmpregadoDAO();
//			
//			
//			
//			if(dao.login(nomeEmpregado, senhaEmpregado) == null) {
//				return null;
//				
//			}else {
//				
//				Map <String, Object> session = ActionContext.getContext().getSession();
//				session.put("nomeEmpregado", nomeEmpregado);
//				return 
//				
//			}
//			
//			
//		}
	
}