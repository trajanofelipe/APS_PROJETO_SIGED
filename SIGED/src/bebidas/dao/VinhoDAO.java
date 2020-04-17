
package bebidas.dao;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;

import bebidas.model.Vinho;

public class VinhoDAO extends CommonsDAO {

	@Override
	public boolean apagar(int identificador) {
		EntityManagerFactory factory = HibernateUtil.getEntityManagerFactory();
		EntityManager manager = factory.createEntityManager();
		Vinho resultado = manager.find(Vinho.class, identificador);
		System.out.println(resultado);
//		try {
//			manager.getTransaction().begin();
//			manager.remove( resultado );
//			manager.getTransaction().commit();
//		} catch( Exception e ){
//			e.printStackTrace();
//			return false;
//		}
		manager.close();	
		return true;
	}

	@Override
	public List<Vinho> selecionarTodos() {
		List<Vinho> resultado = new ArrayList<Vinho>();
		EntityManagerFactory factory = HibernateUtil.getEntityManagerFactory();
		EntityManager manager = factory.createEntityManager();		
	    Query query = manager.createQuery("from Vinho v order by idVinho");
	    resultado = query.getResultList();
	    manager.close();
		return resultado;
	}

	@Override
	public Vinho selecionarPorId(int idVinho) {
		EntityManagerFactory factory = HibernateUtil.getEntityManagerFactory();
		EntityManager manager = factory.createEntityManager();
		Query query = manager.createQuery("select v from Vinho v where v.idVinho = :idVinho");
		query.setParameter("idVinho", idVinho);
		if( query.getResultList() != null && !query.getResultList().isEmpty()  ) {
			Vinho resultado = (Vinho)query.getResultList().get(0);
			manager.close();
			return resultado;
		} 
		manager.close();
		return null;
	}
	
	public Vinho selecionarPorNome( String nomeVinho ) {
		EntityManagerFactory factory = HibernateUtil.getEntityManagerFactory();
		EntityManager manager = factory.createEntityManager();
		Query query = manager.createQuery("select v from Vinho v where v.nomeVinho = :nomeVinho order by idVinho");
		query.setParameter("nomeVinho", nomeVinho);
		if( query.getResultList() != null && !query.getResultList().isEmpty()  ) {
			Vinho resultado = (Vinho)query.getResultList().get(0);
			manager.close();
			return resultado;
		} 
		manager.close();
		return null;
	}

}
