package empregados.model;
import java.util.List;

import empregados.dao.EmpregadoDAO;


public class EmpregadoManager {

	public static String cadastrarEmpregado(int matEmpregado, String nomeEmpregado, String cargoEmpregado, int senhaEmpregado) {
		EmpregadoDAO dao = new EmpregadoDAO();

		// Verifica se todos os campos estão preenchidos
		if( nomeEmpregado == null || matEmpregado == 0|| cargoEmpregado == null || senhaEmpregado == 0) { 
			String mensagem = "Não foi possível cadastrar o empregado: Preencha todos os campos obrigatórios.";
			return mensagem;
		}

		// Verifica se já existe empregado com este nome
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
	
//	public EmpregadoManager() {
//		super();
//		// TODO Auto-generated constructor stub
//	}
	public static String editarEmpregado(int matEmpregado, String nomeEmpregado, String cargoEmpregado, int senhaEmpregado) {
		EmpregadoDAO dao = new EmpregadoDAO();

		// Verifica se todos os campos estão preenchidos
		if( nomeEmpregado == null || matEmpregado == 0 || cargoEmpregado== null || senhaEmpregado == 0 ) { 
			String mensagem = "Não foi possível editar o empregado: Preencha todos os campos obrigatórios.";
			return mensagem;
		}

		// Verifica se já existe empregado com este nome
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
		
		
		try {
			dao.atualizar(existente);
			String mensagem = "Empregado " + existente.getNomeEmpregado() + " atualizado com sucesso.";
			return mensagem;
		} catch( Exception e ) {
			e.printStackTrace();
			String mensagem = "Não foi possível editar o Empregado";
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

	public static Empregado consultarEmpregadosPorMat( int matEmpregado ) {
		EmpregadoDAO dao = new EmpregadoDAO();
		Empregado empregado = dao.selecionarPorMat(matEmpregado);
		return empregado;
	}


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
		novo.setNomeEmpregado("brunoleite");
		novo.setCargoEmpregado("Analista de Desenvolvimento");
		novo.setSenhaEmpregado(1111);
		empregadoDao.inserir(novo);
		
		novo.setMatEmpregado(222);
		novo.setNomeEmpregado("andresilva");
		novo.setCargoEmpregado("Gestor");
		novo.setSenhaEmpregado(2222);
		empregadoDao.inserir(novo);
		
		
		novo.setMatEmpregado(333);
		novo.setNomeEmpregado("rafaelsantos");
		novo.setCargoEmpregado("Analista de Desenvolvimento");
		novo.setSenhaEmpregado(3333);
		empregadoDao.inserir(novo);
		
		novo.setMatEmpregado(444);
		novo.setNomeEmpregado("hicarosouza");
		novo.setCargoEmpregado("Analista do Sistema");
		novo.setSenhaEmpregado(4444);
		empregadoDao.inserir(novo);
		
	}
	
	
	
}