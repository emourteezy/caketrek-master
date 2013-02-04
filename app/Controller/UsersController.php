<?php
App::uses('AppController', 'Controller');
/**
 * Users Controller
 *
 * @property User $User
 */
class UsersController extends AppController {


	public $theme = "Bootstrap";

	public function beforeFilter() {
		parent::beforeFilter();
		$this->Auth->allow('add');
		$this->Auth->allow('facebook');
	}


/**
 * index method
 *
 * @return void
 */
	public function index() {
		$this->User->recursive = 0;
		$this->set('users', $this->paginate());
	}

/**
 * view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function view($id = null) {
		$this->User->id = $id;
		if (!$this->User->exists()) {
			throw new NotFoundException(__('Invalid user'));
		}
		$this->set('user', $this->User->read(null, $id));
	}

/**
 * add method
 *
 * @return void
 */
	public function add() {
		if ($this->request->is('post')) {
			$this->User->create();
			if ($this->User->save($this->request->data)) {
				$this->Session->setFlash(__('The user has been saved'),'success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The user could not be saved. Please, try again.'),'error');
			}
		}
		$badges = $this->User->Badge->find('list');
		$this->set(compact('badges'));
	}
	
	
	function facebook(){
		
		
		
		require APPLIBS.'Facebook'.DS.'facebook.php';
		$facebook = new Facebook(array(
			'appId' => '206480192823128',
			'secret' => 'a0074465073aaba9b23129c9730b39b1'
		));
		
		$user = $facebook->getUser();
		if($user){
			try{
				$infos = $facebook->api('/me');
				
				$u = $this->User->find('first',array(
				'recursive'	 => -1,
				'conditions' => array('facebook_id' => $infos['id']
				)));
				if(!empty($u)){
					$this->Auth->login($u['User']);
						$this->redirect('/');
				}
				
				if($this->request->is('post')){
					$data = $this->request->data['User'];
					$d = array(
						'username' => $data['username'],
						'facebook_id' => $infos['id'],
						'mail' => $infos['email']	
					);
					if($this->User->save($d)){
						$this->Session->setFlash('Vous êtes maintenant inscrit','notif');
						$u = $this->User->read();
						$this->Auth->login($u['User']);
						$this->redirect('/');
					
					}else{
						$this->Session->setFlash('Votre pseudo est déjà utilisé','notif',array('type'=>'error'));
				}
				
				}	
				$d = array();
				$d['user'] = $infos;
				$this->set($d);
					}catch(FacebookApiException $e){

			}
		}else{
			$this->Session->setFlash("Erreur de l'identification facebook","notif",array('type'=>'error'));
			$this->redirect(array('action'=>'login'));
			
		}


		}
/**
 * edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function edit($id = null) {
		$this->User->id = $id;
		if (!$this->User->exists()) {
			throw new NotFoundException(__('Invalid user'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			if ($this->User->save($this->request->data)) {
				$this->Session->setFlash(__('The user has been saved'),'success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The user could not be saved. Please, try again.'),'error');
			}
		} else {
			$this->request->data = $this->User->read(null, $id);
		}
		$badges = $this->User->Badge->find('list');
		$this->set(compact('badges'));
	}

/**
 * delete method
 *
 * @throws MethodNotAllowedException
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function delete($id = null) {
		if (!$this->request->is('post')) {
			throw new MethodNotAllowedException();
		}
		$this->User->id = $id;
		if (!$this->User->exists()) {
			throw new NotFoundException(__('Invalid user'));
		}
		if ($this->User->delete()) {
			$this->Session->setFlash(__('User deleted'),'alert');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('User was not deleted'),'error');
		$this->redirect(array('action' => 'index'));
	}

/**
 * admin_index method
 *
 * @return void
 */
	public function admin_index() {
		$this->User->recursive = 0;
		$this->set('users', $this->paginate());
	}

/**
 * admin_view method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_view($id = null) {
		$this->User->id = $id;
		if (!$this->User->exists()) {
			throw new NotFoundException(__('Invalid user'));
		}
		$this->set('user', $this->User->read(null, $id));
	}

/**
 * admin_add method
 *
 * @return void
 */
	public function admin_add() {
		if ($this->request->is('post')) {
			$this->User->create();
			if ($this->User->save($this->request->data)) {
				$this->Session->setFlash(__('The user has been saved'),'success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The user could not be saved. Please, try again.'),'error');
			}
		}
		$badges = $this->User->Badge->find('list');
		$this->set(compact('badges'));
	}

/**
 * admin_edit method
 *
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_edit($id = null) {
		$this->User->id = $id;
		if (!$this->User->exists()) {
			throw new NotFoundException(__('Invalid user'));
		}
		if ($this->request->is('post') || $this->request->is('put')) {
			if ($this->User->save($this->request->data)) {
				$this->Session->setFlash(__('The user has been saved'),'success');
				$this->redirect(array('action' => 'index'));
			} else {
				$this->Session->setFlash(__('The user could not be saved. Please, try again.'),'error');
			}
		} else {
			$this->request->data = $this->User->read(null, $id);
		}
		$badges = $this->User->Badge->find('list');
		$this->set(compact('badges'));
	}

/**
 * admin_delete method
 *
 * @throws MethodNotAllowedException
 * @throws NotFoundException
 * @param string $id
 * @return void
 */
	public function admin_delete($id = null) {
		if (!$this->request->is('post')) {
			throw new MethodNotAllowedException();
		}
		$this->User->id = $id;
		if (!$this->User->exists()) {
			throw new NotFoundException(__('Invalid user'));
		}
		if ($this->User->delete()) {
			$this->Session->setFlash(__('User deleted'),'alert');
			$this->redirect(array('action' => 'index'));
		}
		$this->Session->setFlash(__('User was not deleted'),'error');
		$this->redirect(array('action' => 'index'));
	}
	
	public function login() {
		if ($this->request->is('post')) {
			if ($this->Auth->login()) {
			} else {
				$this->Session->setFlash(__('Invalid username or password, try again'),'error');
			}
		}
	}
	
	public function logout() {
		$this->Auth->logout();
		$this->redirect('/');
	}
    
	
}
