<?php
class ControllerProductCatalog extends Controller {
	public function index() {
		$this->load->language('product/catalog');

		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

        $data['categories'] = array();

        $this->document->addStyle('catalog/view/javascript/jquery/owl-carousel/owl.carousel.css');
        $this->document->addScript('catalog/view/javascript/jquery/owl-carousel/owl.carousel.min.js');

        

        $categories = $this->model_catalog_category->getCategories(0);


        foreach ($categories as $category) {
            if ($category['top']) {

                if ($category['image_ico']) {
                    $image_ico = $this->model_tool_image->resize($category['image_ico'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
                } else {
                    $image_ico = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
                }

                /*if ($category['image']) {
                    $image = $this->model_tool_image->resize($category['image'], $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
                } else {
                    $image = $this->model_tool_image->resize('placeholder.png', $this->config->get($this->config->get('config_theme') . '_image_product_width'), $this->config->get($this->config->get('config_theme') . '_image_product_height'));
                }*/

                if ($category['image']) {
                    $image = $this->model_tool_image->resize($category['image'], 320, 320);
                } else {
                    $image = $this->model_tool_image->resize('placeholder.png',  320, 320);
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
                        'description_small'  => utf8_substr(strip_tags(html_entity_decode($child['description_small'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get($this->config->get('config_theme') . '_product_description_length')) . '..',
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

            if ($shtangi_cat['image']) {
                $image = $this->model_tool_image->resize($shtangi_cat['image'], 320, 320);
            } else {
                $image = $this->model_tool_image->resize('placeholder.png',  320, 320);
            }

            $data['shtangi_cat'] = array(
                'name'     => $shtangi_cat['name'],
                'href'     => $this->url->link('product/category', 'path=' . $shtangi_cat['category_id']),
                'image'     => $image,
            );
        }


        /* info for menu*/

        $this->load->model('catalog/information');

        $data['informations'] = array();


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


        $data['breadcrumbs'] = array();

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_home'),
            'href' => $this->url->link('common/home')
        );

        $data['breadcrumbs'][] = array(
            'text' => $this->language->get('text_breadcrumb'),
        );

        $data['heading_title'] = $this->language->get('text_title');
        $data['page_title'] = $this->language->get('text_pagetitle');
        $data['meta_description'] = $this->language->get('meta_description');

        $this->document->setTitle($data['page_title']);
        $this->document->setDescription($data['meta_description']);
        

        $data['micro_markup'] = 
        '<script type="application/ld+json">
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
                "name": "Каталог",
                "item": "https://www.av-tool.ru/katalog/"
            }]
        }
        </script>';




			$data['continue'] = $this->url->link('common/home');

			$data['column_left'] = $this->load->controller('common/column_left');
			$data['column_right'] = $this->load->controller('common/column_right');
			$data['content_top'] = $this->load->controller('common/content_top');
			$data['content_bottom'] = $this->load->controller('common/content_bottom');
			$data['footer'] = $this->load->controller('common/footer');
			$data['header'] = $this->load->controller('common/header');

			$this->response->setOutput($this->load->view('product/catalog', $data));

	}
}
