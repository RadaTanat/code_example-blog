<?php

/**
 * Presneter class for reagistration of new user using Registration form factory
 */

namespace App\Presenters;

use Nette;
use Nette\Application\UI\Form;
use App\Forms\RegistrationFormFactory;

class RegistrationPresenter extends \Nette\Application\UI\Presenter
{
	private $database;

	/** @var RegistrationFormFactory @inject */
	public $RegistrationFormFactory;

	public function __construct(\Nette\Database\Context $database)
	{
		$this->database = $database;
	}

	public function renderDefault() {

	}
	
	/**
	 * Registration form factory.
	 * @return Nette\Application\UI\Form
	 */
	protected function createComponentRegistrationForm() {
		$form = $this->RegistrationFormFactory->create();
		$form->onSuccess[] = function ($form) {
			$values = $form->getValues();
			$pswds = new \Nette\Security\Passwords;
			$this->database->table('users')->insert([
				'username' => $values->username,
				'password' => $pswds->hash($values->password),
				'role' => 1,
				'email' => $values->email,
			]);
			$this->redirect('Sign:in');
		};
		$form->onError[] = function ($form) {
			// error status
		};
		return $form;
	}
}