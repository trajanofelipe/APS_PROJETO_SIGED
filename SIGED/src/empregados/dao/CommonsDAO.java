
package empregados.dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

public abstract class CommonsDAO implements GenericDAO{
	
	//@Override
	public void inserir(Object objeto) {
		EntityManagerFactory factory = HibernateUtil.getEntityManagerFactory();
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		manager.persist(objeto);
		manager.getTransaction().commit();
		manager.close();
	}

	//@Override
	public abstract boolean apagar(int identificador);
	

	//@Override
	public void atualizar(Object objeto) {
		EntityManagerFactory factory = HibernateUtil.getEntityManagerFactory();
		EntityManager manager = factory.createEntityManager();
		manager.getTransaction().begin();
		/*manager.merge(objeto);*/
		manager.persist(objeto);
		manager.getTransaction().commit();
		manager.close();
	}

	//@Override
	public abstract List<?> selecionarTodos();
	
	//@Override
	public abstract void apagartudo();

	//@Override
	public abstract Object selecionarPorMat(int identificador);

}
