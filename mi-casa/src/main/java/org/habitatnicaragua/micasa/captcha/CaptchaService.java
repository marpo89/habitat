package org.habitatnicaragua.micasa.captcha;

import com.octo.captcha.service.image.ImageCaptchaService;

/**
 * https://jcaptcha.atlassian.net/wiki/spaces/general/pages/1212432/5+minutes+application+integration+tutorial
 * http://parasjain.net/2008/11/11/jcaptcha-with-spring/
 * https://www.owasp.org/index.php/JCaptcha_servlet_example
 */
public class CaptchaService {

	// private static ImageCaptchaService instance = new DefaultManageableImageCaptchaService();
	private static ImageCaptchaService instance = new MyDefaultManageableImageCaptchaService();

	public static ImageCaptchaService getInstance() {
		return instance;
	}

	// https://stackoverflow.com/questions/31810395/how-to-set-font-style-for-text-in-captcha-generated-by-jcaptcha
	private CaptchaService() {
	}
}
