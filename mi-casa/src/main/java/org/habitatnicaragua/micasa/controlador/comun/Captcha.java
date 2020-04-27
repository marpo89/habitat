package org.habitatnicaragua.micasa.controlador.comun;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.habitatnicaragua.micasa.captcha.CaptchaService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.octo.captcha.service.CaptchaServiceException;

/**
 * https://jcaptcha.atlassian.net/wiki/spaces/general/pages/1212432/5+minutes+application+integration+tutorial
 * http://parasjain.net/2008/11/11/jcaptcha-with-spring/
 * https://www.owasp.org/index.php/JCaptcha_servlet_example
 */
@Controller("captcha")
public class Captcha {

	private static final String IMG_TYPE = "png";
	
	@GetMapping({"/publico/captcha.png", "/publico/captcha/{x}.png"})
	public void captcha(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws IOException {
		
		if(httpServletRequest.getQueryString()!=null ) {
			httpServletResponse.sendError( HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "GET request should have no query string." );
			return;
		}
		
		// the output stream to render the captcha image as jpeg into
		ByteArrayOutputStream imgOutputStream = new ByteArrayOutputStream();
		byte[] captchaBytes;

		try {
			// get the session id that will identify the generated captcha.
			// the same id must be used to validate the response, the session id is a good
			// candidate!
			String captchaId = httpServletRequest.getSession().getId();
			// call the ImageCaptchaService getChallenge method
			BufferedImage challenge = 
					CaptchaService.getInstance().getImageChallengeForID(captchaId, httpServletRequest.getLocale());

			ImageIO.write( challenge, IMG_TYPE, imgOutputStream );
			captchaBytes = imgOutputStream.toByteArray();

			// Clear any existing flag.
			httpServletRequest.getSession().removeAttribute( "PassedCaptcha" );
		      
			
		} catch (IllegalArgumentException e) {
			httpServletResponse.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		} catch (CaptchaServiceException e) {
			httpServletResponse.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			return;
		}

		// flush it in the response
		httpServletResponse.setHeader("Cache-Control", "no-store");
		httpServletResponse.setHeader("Pragma", "no-cache");
		httpServletResponse.setDateHeader("Expires", 0);
		httpServletResponse.setContentType("image/" + IMG_TYPE);
		
		ServletOutputStream responseOutputStream = httpServletResponse.getOutputStream();
		responseOutputStream.write(captchaBytes);
		responseOutputStream.flush();
		responseOutputStream.close();
	}
}
