<?php
class ControllerCommonFooter extends Controller {
	public function index() {

            	$this->load->language('product/search');
                $data['text_empty'] = $this->language->get('text_empty');

            	$data['text_view_all_results'] = $this->config->get('live_search_view_all_results')[$this->config->get('config_language_id')]['name'];
                $data['live_search_ajax_status'] = $this->config->get('live_search_ajax_status');
                $data['live_search_show_image'] = $this->config->get('live_search_show_image');
                $data['live_search_show_price'] = $this->config->get('live_search_show_price');
                $data['live_search_show_description'] = $this->config->get('live_search_show_description');
                $data['live_search_href'] = $this->url->link('product/search', 'search=');
                $data['live_search_min_length'] = $this->config->get('live_search_min_length');
            
		$this->load->language('common/footer');

		$data['scripts'] = $this->document->getScripts('footer');

		$data['text_information'] = $this->language->get('text_information');
		$data['text_service'] = $this->language->get('text_service');
		$data['text_extra'] = $this->language->get('text_extra');
		$data['text_contact'] = $this->language->get('text_contact');
		$data['text_return'] = $this->language->get('text_return');
		$data['text_sitemap'] = $this->language->get('text_sitemap');
		$data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$data['text_voucher'] = $this->language->get('text_voucher');
		$data['text_affiliate'] = $this->language->get('text_affiliate');
		$data['text_special'] = $this->language->get('text_special');
		$data['text_account'] = $this->language->get('text_account');
		$data['text_order'] = $this->language->get('text_order');
		$data['text_wishlist'] = $this->language->get('text_wishlist');
		$data['text_newsletter'] = $this->language->get('text_newsletter');
		
		$data['text_copyright'] = $this->language->get('text_copyright');
		$data['text_partner'] = $this->language->get('text_partner');
		$data['text_partner_2'] = $this->language->get('text_partner_2');
		$data['text_partner_3'] = $this->language->get('text_partner_3');
		$data['text_partner_3_2'] = $this->language->get('text_partner_3_2');
		
		$data['text_contact_us'] = $this->language->get('text_contact_us');
		$data['text_in_internet'] = $this->language->get('text_in_internet');
		
		$data['text_educational_center'] = $this->language->get('text_educational_center');
		$data['text_catalog_tool'] = $this->language->get('text_catalog_tool');
		$data['text_discont'] = $this->language->get('text_discont');
		
		$data['text_payment'] = $this->language->get('text_payment');
		$data['text_warranty'] = $this->language->get('text_warranty');
		$data['text_about'] = $this->language->get('text_about');
		$data['text_blog'] = $this->language->get('text_blog');
		
		$data['telephone'] = $this->config->get('config_telephone');
		$data['telephone_link'] = $this->config->get('config_telephone_link');
		$data['email'] = $this->config->get('config_email');
		$data['address'] = nl2br($this->config->get('config_address'));
		
		$this->load->model('catalog/information');

		$data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$data['informations'][] = array(
					'title' => $result['title'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
		}

		$data['contact'] = $this->url->link('information/contact');
		$data['return'] = $this->url->link('account/return/add', '', true);
		$data['sitemap'] = $this->url->link('information/sitemap');
		$data['manufacturer'] = $this->url->link('product/manufacturer');
		$data['voucher'] = $this->url->link('account/voucher', '', true);
		$data['affiliate'] = $this->url->link('affiliate/account', '', true);
		$data['special'] = $this->url->link('product/special');
		$data['account'] = $this->url->link('account/account', '', true);
		$data['order'] = $this->url->link('account/order', '', true);
		$data['wishlist'] = $this->url->link('account/wishlist', '', true);
		$data['newsletter'] = $this->url->link('account/newsletter', '', true);
$data['yandex_metrika'] = $this->config->get('yandex_money_metrika_code') ? html_entity_decode($this->config->get('yandex_money_metrika_code'), ENT_QUOTES, 'UTF-8') : '';
            $data['yandex_money_metrika_active'] = $this->config->get('yandex_money_metrika_active') ? true : false;
            $data['yandex_money_kassa_show_in_footer'] = $this->config->get('yandex_money_kassa_enabled') && $this->config->get('yandex_money_kassa_show_in_footer');
            $data['yandex_money_product_info_url'] = 'index.php?route='.(version_compare(VERSION, "2.3.0", '>=')?"extension/":"").'payment/yandex_money/productInfo';
            
		
		$data['url_educational_center'] = $this->url->link('information/information', 'information_id=11');
		$data['url_catalog_tool'] = $this->url->link('product/category', 'path=18');
		//$data['url_discont'] = $this->url->link('information/information', 'information_id=7');
		$data['url_discont'] = $this->url->link('product/category', 'path=132');

		$data['url_payment'] = $this->url->link('information/information', 'information_id=6');
		$data['url_warranty'] = $this->url->link('information/information', 'information_id=12');
		$data['url_about'] = $this->url->link('information/information', 'information_id=4');
		$data['url_blog'] = $this->url->link('newsblog/category', 'newsblog_path=1');
		
		
		
		$data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));

		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');

			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];
			} else {
				$ip = '';
			}

			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];
			} else {
				$url = '';
			}

			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];
			} else {
				$referer = '';
			}

			$this->model_tool_online->addOnline($ip, $this->customer->getId(), $url, $referer);
		}

		return $this->load->view('common/footer', $data);
	}
}
