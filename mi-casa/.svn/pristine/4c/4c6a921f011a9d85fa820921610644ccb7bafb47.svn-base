package org.habitatnicaragua.micasa.captcha;

import com.octo.captcha.service.captchastore.FastHashMapCaptchaStore;
import com.octo.captcha.service.image.AbstractManageableImageCaptchaService;
import com.octo.captcha.service.image.ImageCaptchaService;

public class MyDefaultManageableImageCaptchaService extends AbstractManageableImageCaptchaService
		implements ImageCaptchaService {
	public MyDefaultManageableImageCaptchaService() {
		super(new FastHashMapCaptchaStore(), new MyImageCaptchaEngine(), 180, 100000, 75000);
	}

}