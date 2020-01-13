<?php
class ControllerCommonHeader extends Controller {
	public function index() {

		$this->load->model('tool/image');
		
		// Analytics
		$this->load->model('extension/extension');

		$data['analytics'] = array();

		$analytics = $this->model_extension_extension->getExtensions('analytics');


		foreach ($analytics as $analytic) {
			if ($this->config->get($analytic['code'] . '_status')) {
				$data['analytics'][] = $this->load->controller('extension/analytics/' . $analytic['code'], $this->config->get($analytic['code'] . '_status'));
			}
		}

		if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
			$server = $this->config->get('config_ssl');
		} else {
			$server = $this->config->get('config_url');
		}

		if (is_file(DIR_IMAGE . $this->config->get('config_icon'))) {
			$this->document->addLink($server . 'image/' . $this->config->get('config_icon'), 'icon');
		}

		$data['title'] = $this->document->getTitle();

		$data['base'] = $server;
		$data['description'] = $this->document->getDescription();
		$data['keywords'] = $this->document->getKeywords();
		$data['links'] = $this->document->getLinks();
		$data['styles'] = $this->document->getStyles();
		$data['scripts'] = $this->document->getScripts();
		$data['lang'] = $this->language->get('code');
		$data['direction'] = $this->language->get('direction');

		/*$data['micro_markup'] = '<script type="application/ld+json">
		{
			"@context": "https://schema.org",

			"@type": "Corporation",
			"name": "AV-TOOL - PDR Инструмент №1 в РФ",
			"url": "https://www.av-tool.ru/",
			"logo": "https://www.av-tool.ru/image/catalog/loaded_logo.png",
			"sameAs": [
			"instagram.com/avmasters",
			"https://www.youtube.com/user/avmasters1",
			"https://www.facebook.com/avtoolrussia/"
			]
		}
		</script>';*/
		
		
		
		/* for timer special */
		$data['days'] = $this->language->get('days');
		$data['hours'] = $this->language->get('hours');
		$data['min'] = $this->language->get('min');
		$data['sec'] = $this->language->get('sec');
		
		$data['name'] = $this->config->get('config_name');

		if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
			$data['logo'] = $server . 'image/' . $this->config->get('config_logo');
		} else {
			$data['logo'] = '';
		}

		$this->load->language('common/header');
		$data['og_url'] = (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1')) ? HTTPS_SERVER : HTTP_SERVER) . substr($this->request->server['REQUEST_URI'], 1, (strlen($this->request->server['REQUEST_URI'])-1));
		$data['og_image'] = $this->document->getOgImage();

		$data['text_home'] = $this->language->get('text_home');
		
		$data['text_head_addres'] = nl2br($this->config->get('config_address'));
		
		$data['call_back'] = $this->language->get('call_back');
		$data['block_1'] = $this->language->get('block_1');
		$data['block_2'] = $this->language->get('block_2');
		$data['block_2_1'] = $this->language->get('block_2_1');
		$data['block_3'] = $this->language->get('block_3');
		$data['block_3_2'] = $this->language->get('block_3_2');
		$data['block_4'] = $this->language->get('block_4');
		$data['block_4_2'] = $this->language->get('block_4_2');
		
		// Wishlist
		if ($this->customer->isLogged()) {
			$this->load->model('account/wishlist');

			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), $this->model_account_wishlist->getTotalWishlist());
		} else {
			$data['text_wishlist'] = sprintf($this->language->get('text_wishlist'), (isset($this->session->data['wishlist']) ? count($this->session->data['wishlist']) : 0));
		}

		$data['text_shopping_cart'] = $this->language->get('text_shopping_cart');
		$data['text_logged'] = sprintf($this->language->get('text_logged'), $this->url->link('account/account', '', true), $this->customer->getFirstName(), $this->url->link('account/logout', '', true));

		$data['text_account'] = $this->language->get('text_account');
		$data['text_register'] = $this->language->get('text_register');
		$data['text_login'] = $this->language->get('text_login');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_transaction'] = $this->language->get('text_transaction');
		$data['text_download'] = $this->language->get('text_download');
		$data['text_logout'] = $this->language->get('text_logout');
		$data['text_checkout'] = $this->language->get('text_checkout');
		$data['text_page'] = $this->language->get('text_page');
		$data['text_category'] = $this->language->get('text_category');
		$data['text_all'] = $this->language->get('text_all');

		$data['home'] = $this->url->link('common/home');
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['logged'] = $this->customer->isLogged();
		$data['account'] = $this->url->link('account/account', '', true);
		$data['register'] = $this->url->link('account/register', '', true);
		$data['login'] = $this->url->link('account/login', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['transaction'] = $this->url->link('account/transaction', '', true);
		$data['download'] = $this->url->link('account/download', '', true);
		$data['logout'] = $this->url->link('account/logout', '', true);
		
            $data['shopping_cart'] = $this->url->link('checkout/buy');
            
		
            $data['checkout'] = $this->url->link('checkout/buy', '', true).'#checkout-f';
            
		$data['contact'] = $this->url->link('information/contact');
		$data['telephone'] = $this->config->get('config_telephone');
		$data['telephone_link'] = $this->config->get('config_telephone_link');
		$data['email'] = $this->config->get('config_email');
		
		
		$data['discont'] = $this->url->link('discont');
		$data['educational_center'] = $this->url->link('educational-center');
		$data['pdr_free_seminar'] = $this->url->link('pdr-free-seminar');
		$data['pdr_free_seminar'] = $this->url->link('pdr-free-seminar');
		
		/* info for menu*/
		
		$this->load->model('catalog/information');
		
		
		$data['informations_mob_menu'] = array();
		$data['informations_head'] = array();
		$data['informations'] = array();
		$data['informations_children'] = array();
		
		$information_mob_menu = array(4, 6);
		
		foreach ($information_mob_menu as $id) {
			$result = $this->model_catalog_information->getInformation($id);
			
				$data['informations_mob_menu'][$id] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			
		}
		
		$data['text_contact_link'] = $this->language->get('text_contact_link');
		
		$information_head = array(4, 6, 12, 13, 11);
		
		foreach ($information_head as $id) {
			$result = $this->model_catalog_information->getInformation($id);
			
				$data['informations_head'][$id] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			
		}
		
		/* blog for top info menu */
		$this->load->model('newsblog/category');

		$category_blog = $this->model_newsblog_category->getCategory(1);
			$data['informations_head']['blog'] = array(
				'title'     => $category_blog['name'],
				'href'     => $this->url->link('newsblog/category', 'newsblog_path=' . $category_blog['category_id'])
			);
		/* */

		$information_first_level = array(7, 8, 14);
		
		foreach ($information_first_level as $id) {
			$result = $this->model_catalog_information->getInformation($id);
            if(isset($result['title'])) {
                $data['informations'][$id] = array(
                    'title' => $result['title'],
                    'href' => $this->url->link('information/information', 'information_id=' . $result['information_id'])
                );
            }
			
		}
		
		
		
		$information_child = array(11, 9, 10);
		
		foreach ($information_child as $id) {
			$result = $this->model_catalog_information->getInformation($id);
			
				$data['informations_children'][$id] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			
		}
		
		/* end info for menu */
		
		/*foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
		}*/
		
		
		// Menu
		$this->load->model('catalog/category');
		
		$data['discount_cat'] = array();
		$discount_cat_id = 132;
		
		$discount_cat = $this->model_catalog_category->getCategory($discount_cat_id);
		
		if(!empty($discount_cat)){
			$data['discount_cat'] = array(
				'name'     => $discount_cat['name'],
				'href'     => $this->url->link('product/category', 'path=' . $discount_cat['category_id'])
			);
		}

        $data['shtangi_cat'] = array();
        $shtangi_cat_id = 152;

        $shtangi_cat = $this->model_catalog_category->getCategory($shtangi_cat_id);

        if(!empty($shtangi_cat)){
            $data['shtangi_cat'] = array(
                'name'     => $shtangi_cat['name'],
                'href'     => $this->url->link('product/category', 'path=' . $shtangi_cat['category_id'])
            );
        }
		
		$this->load->model('catalog/product');

		$data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($category['top']) {
				
				if ($category['image_ico']) {
					$image_ico = $this->model_tool_image->resize($category['image_ico'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				} else {
					$image_ico = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
				}

                if ($category['image']) {
                    $image = $this->model_tool_image->resize($category['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
                } else {
                    $image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
                }
			
				// Level 2
				$children_data = array();

				$children = $this->model_catalog_category->getCategories($category['category_id']);

				foreach ($children as $child) {

                    if ($child['image']) {
                        $child_image = $this->model_tool_image->resize($child['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
                    } else {
                        $child_image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
                    }

					$filter_data = array(
						'filter_category_id'  => $child['category_id'],
						'filter_sub_category' => true
					);

					$children_data[] = array(
						'name'  => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $this->model_catalog_product->getTotalProducts($filter_data) . ')' : ''),
						'image'  => $child_image,
                        'description_small'  => $child['description_small'],
						'href'  => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])
					);
				}

				// Level 1
                if($category['column'] ==0 || $category['column'] == 1) {
                    $category['column'] = 0;
                }
				$data['categories'][] = array(
					'name'     => $category['name'],
					'image_ico'=> $image_ico,
					'image'    => $image,
					'children' => $children_data,
					//'column'   => $category['column'] ? $category['column'] : 1,
					'column'   => $category['column'] ? $category['column'] : 0,
					'href'     => $this->url->link('product/category', 'path=' . $category['category_id'])
				);
			}
		}
		/*foreach($data['categories'] as $cat) {
            echo count($cat['children'])." ";
        }
        exit();*/

      	$this->load->model('newsblog/category');
        $this->load->model('newsblog/article');

		$data['newsblog_categories'] = array();

		$categories = $this->model_newsblog_category->getCategories(0);

		foreach ($categories as $category) {
			if ($category['settings']) {
				$settings=unserialize($category['settings']);
				if ($settings['show_in_top']==0) continue;
			}

			$articles = array();

			if ($category['settings'] && $settings['show_in_top_articles']) {
				$filter=array('filter_category_id'=>$category['category_id'],'filter_sub_category'=>true);
				$results = $this->model_newsblog_article->getArticles($filter);

				foreach ($results as $result) {
					$articles[] = array(
						'name'        => $result['name'],
						'href'        => $this->url->link('newsblog/article', 'newsblog_path=' . $category['category_id'] . '&newsblog_article_id=' . $result['article_id'])
					);
				}
            }
			$data['categories'][] = array(
				'name'     => $category['name'],
				'children' => $articles,
				'column'   => 1,
				'href'     => $this->url->link('newsblog/category', 'newsblog_path=' . $category['category_id'])
			);
		}


		// Микроразметка хлебных крошек для страниц кроме каталога и категорий
		if ($this->request->get['route'] == 'common/home') { // echo "string1";
			$data['micro_markup'] = '<script type="application/ld+json">
			{
				"@context": "https://schema.org",

				"@type": "Corporation",
				"name": "AV-TOOL - PDR Инструмент №1 в РФ",
				"url": "https://www.av-tool.ru/",
				"logo": "https://www.av-tool.ru/image/catalog/loaded_logo.png",
				"sameAs": [
				"instagram.com/avmasters",
				"https://www.youtube.com/user/avmasters1",
				"https://www.facebook.com/avtoolrussia/"
				]
			}
			</script>';
		} elseif ($this->request->get['route'] == 'newsblog/category') {  // echo "string2";
			$data['micro_markup'] = '<script type="application/ld+json">
			{
				"@context": "https://schema.org/",
				"@type": "BreadcrumbList",
				"itemListElement": [{
					"@type": "ListItem",
					"position": 1,
					"name": "Главная",
					"item": "https://www.av-tool.ru/"
				},{
					"@type": "ListItem",
					"position": 2,
					"name": "Блог",
					"item": "https://www.av-tool.ru/blog/"
				}]
			}
			</script>';
		} elseif ($this->request->get['route'] != 'product/category' && $this->request->get['route'] != 'product/catalog' && $this->request->get['route'] != 'product/product') {
			// echo "string3";
			if (isset($this->request->get['information_id'])){
				$breadcrumbs_parts = $data['informations_head'][$this->request->get['information_id']];
			} else {
				$breadcrumbs_parts['title'] = $data['title'];
				$breadcrumbs_parts['href'] = $this->config->get('config_url') . $this->request->request['route'];
			}
			// print_r( $data['categories']);
			// print_r($this->request);
			
			$data['micro_markup'] = '<script type="application/ld+json">
			{
				"@context": "https://schema.org/",
				"@type": "BreadcrumbList",
				"itemListElement": [{
					"@type": "ListItem",
					"position": 1,
					"name": "Главная",
					"item": "https://www.av-tool.ru/"
					},{
				"@type": "ListItem",
				"position": 2,
				"name": "'. $breadcrumbs_parts['title'] .'",
				"item": "'. $breadcrumbs_parts['href'] .'"
				}]
			}
			</script>';
		}
		// End микроразметка
		
		$data['language'] = $this->load->controller('common/language');
		$data['currency'] = $this->load->controller('common/currency');
		$data['search'] = $this->load->controller('common/search');
		$data['cart'] = $this->load->controller('common/cart');

		// For page specific css
		if (isset($this->request->get['route'])) {
			if (isset($this->request->get['product_id'])) {
				$class = '-' . $this->request->get['product_id'];
			} elseif (isset($this->request->get['path'])) {
				$class = '-' . $this->request->get['path'];
			} elseif (isset($this->request->get['manufacturer_id'])) {
				$class = '-' . $this->request->get['manufacturer_id'];
			} elseif (isset($this->request->get['information_id'])) {
				$class = '-' . $this->request->get['information_id'];
			} else {
				$class = '';
			}

			$data['class'] = str_replace('/', '-', $this->request->get['route']) . $class;
		} else {
			$data['class'] = 'common-home';
		}
		
		return $this->load->view('common/header', $data);
	}
}
