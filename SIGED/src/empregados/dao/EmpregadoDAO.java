
package empregados.dao;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

//import org.hibernate.SessionFactory;

import empregados.model.Empregado;

public class EmpregadoDAO extends CommonsDAO {

	@Override
	public boolean apagar(int identificador) {
		EntityManagerFactory factory = HibernateUtil.getEntityManagerFactory();
		EntityManager manager = factory.createEntityManager();
		Empregado resultado = manager.find(Empregado.class, identificador);
//		System.out.println(resultado);
		try {
			manager.getTransaction().begin();
			manager.remove( resultado );
			manager.getTransaction().commit();
		} catch( Exception e ){
			e.printStackTrace();
			return false;
		}
		manager.close();	
		return true;
	}

	@Override
	public List<Empregado> selecionarTodos() {
		List<Empregado> resultado = new ArrayList<Empregado>();
		EntityManagerFactory factory = HibernateUtil.getEntityManagerFactory();
		EntityManager manager = factory.createEntityManager();		
	    Query query = manager.createQuery("from Empregado e order by matEmpregado");
	    resultado = query.getResultList();
	    manager.close();
		return resultado;
	}

	@Override
	public Empregado selecionarPorMat(int matEmpregado) {
		EntityManagerFactory factory = HibernateUtil.getEntityManagerFactory();
		EntityManager manager = factory.createEntityManager();
		Query query = manager.createQuery("select e from Empregado e where e.matEmpregado = :matEmpregado");
		query.setParameter("matEmpregado", matEmpregado);
		if( query.getResultList() != null && !query.getResultList().isEmpty()  ) {
			Empregado resultado = (Empregado)query.getResultList().get(0);
			manager.close();
			return resultado;
		} 
		manager.close();
		return null;
	}
	

	public Empregado login(String nomeEmpregado, String senhaEmpregado) {
		
//		boolean check = false;
		
		EntityManagerFactory factory = HibernateUtil.getEntityManagerFactory();
		EntityManager manager = factory.createEntityManager();
//		
		Query ususenha = manager.createQuery("select e from Empregado e where e.nomeEmpregado = :nomeEmpregado and e.senhaEmpregado = :senhaEmpregado");
		
		ususenha.setParameter("nomeEmpregado", nomeEmpregado);
		ususenha.setParameter("senhaEmpregado", senhaEmpregado);
		
				
		if( ususenha.getResultList() != null && !ususenha.getResultList().isEmpty()  ) {
			Empregado resultado = (Empregado)ususenha.getResultList().get(0);
			manager.close();
			return resultado;
		} 
		
		System.out.println("nao func");
		manager.close();
		return null;
	}
	
	public Empregado selecionarPorNome( String nomeEmpregado ) {
		EntityManagerFactory factory = HibernateUtil.getEntityManagerFactory();
		EntityManager manager = factory.createEntityManager();
		Query query = manager.createQuery("select e from Empregado e where e.nomeEmpregado = :nomeEmpregado order by matEmpregado");
		query.setParameter("nomeEmpregado", nomeEmpregado);
		if( query.getResultList() != null && !query.getResultList().isEmpty()  ) {
			Empregado resultado = (Empregado)query.getResultList().get(0);
			manager.close();
			return resultado;
		} 
		manager.close();
		return null;
	}
	
//	public List<Empregado> selecionarLogin() {
//		List<Empregado> resultado = new ArrayList<Empregado>();
//		EntityManagerFactory factory = HibernateUtil.getEntityManagerFactory();
//		EntityManager manager = factory.createEntityManager();		
//	    Query query = manager.createQuery("from Empregado e order by matEmpregado");
//	    resultado = query.getResultList();
//	    manager.close();
//		return resultado;
//	}
	
	
		
//		try {
//			manager.getTransaction().begin();
//			(if !sessionFactory.getCurrentSession().getTransaction().isActive())
			
//			manager.equals(resultado);
	
			
//			manager.find(Empregado.class,resultado);
			
			
//		return (Empregado) usuario.getSingleResult();
			
//			public boolean apagar(int identificador) {
//				EntityManagerFactory factory = HibernateUtil.getEntityManagerFactory();
//				EntityManager manager = factory.createEntityManager();
//				Empregado resultado = manager.find(Empregado.class, identificador);
////				System.out.println(resultado);
//				try {
//					manager.getTransaction().begin();
//					manager.remove( resultado );
//					manager.getTransaction().commit();
//				} catch( Exception e ){
//					e.printStackTrace();
//					return false;
//				}
//				manager.close();	
//				return true;
//			}
						
			
//		} catch (Exception e) {
			
//			System.out.println("Não foi encontrado login compativel");
//			return null;
//			
//		}
//		manager.close();
//		return resultado; 
//	}
			
//			
//			
////			resultado.getSenhaEmpregado();
//			
//			if(resultado != null) {
////				manager.getTransaction().begin();
////				manager.persist(resultado);
//				manager.close();
////				manager.getTransaction().begin();
////				manager.remove( resultado );
////				manager.getTransaction().commit();
//				return resultado;
//			}
//			
////		return (Empregado) session.getCurrentSession().createCriteria(E.class)
////			if (usuario.getSingleResult()
//		
////		} 
////	catch( Exception e ){
////			e.printStackTrace();
////			System.out.println(usu);
////			System.out.println(sen);
//			manager.close();
//			return null;
//		}
//		
		
		
		
	}
		




