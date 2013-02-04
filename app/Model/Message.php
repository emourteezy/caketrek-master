<?php
App::uses('AppModel', 'Model');
/**
 * Message Model
 *
 * @property Sender $Sender
 * @property Receiver $Receiver
 */
class Message extends AppModel {


	public $actsAs = array('Containable');
	
/**
 * Display field
 *
 * @var string
 */
	public $displayField = 'subject';


	//The Associations below have been created with all possible keys, those that are not needed can be removed

/**
 * belongsTo associations
 *
 * @var array
 */
	public $belongsTo = array(
		'Sender' => array(
			'className' => 'Tourist',
			'foreignKey' => 'sender_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		),
		'Receiver' => array(
			'className' => 'Tourist',
			'foreignKey' => 'receiver_id',
			'conditions' => '',
			'fields' => '',
			'order' => ''
		)
	);
}
