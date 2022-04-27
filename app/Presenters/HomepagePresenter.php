<?php

/**
 * Homepage - default presneter class with listing in posts
 */

declare(strict_types=1);

namespace App\Presenters;

use App\Model\PostFacade;
use Nette;


final class HomepagePresenter extends Nette\Application\UI\Presenter
{
	private PostFacade $facade;


	public function __construct(PostFacade $facade)
	{
		$this->facade = $facade;
	}

	public function renderDefault(int $page = 1): void
	{
		$this->template->page = $page;
		$this->template->posts = $this->facade
			->getPublicArticles()
			->page($page, 5);
	}
}