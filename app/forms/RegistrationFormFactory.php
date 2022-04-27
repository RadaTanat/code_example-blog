<?php

/**
 * Form foactory for registration of new user  
 */

namespace App\Forms;

use Nette;
use Nette\Application\UI\Form;


class RegistrationFormFactory {
	/** @var FormFactory */
	private $factory;
	
	/** @var Database  */
	protected $database;



	public function __construct(FormFactory $factory, Nette\Database\Context $database)
	{
		$this->factory = $factory;
		$this->database = $database;
	}


	/**
	 * @return Form
	 */
	public function create()
	{
		$form = $this->factory->create();

		$form->addText('username', 'Jméno:', 32)->setRequired('Vyplňte jméno!');
		$form->addEmail('email', 'Email:')->setRequired('Vyplňte email!');
		$passwordInput = $form->addPassword('password', 'Heslo:')->setRequired('Vyplňte heslo!');
		$form->addPassword('password2', 'Potvrdit heslo:')->setRequired('Potvrďte heslo!')->addRule($form::EQUAL, 'Hesla se neshodují!', $passwordInput);
		$form->addSubmit('register', 'Registrace');

		$form->onSuccess[] = [$this, 'formSucceeded'];
		return $form;
	}


	public function formSucceeded(Form $form, $values)
	{

	}
	
}
