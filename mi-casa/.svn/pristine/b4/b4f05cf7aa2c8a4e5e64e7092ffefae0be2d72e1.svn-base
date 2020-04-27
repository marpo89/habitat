package org.habitatnicaragua.micasa.captcha;

import java.awt.Font;

import com.octo.captcha.component.image.backgroundgenerator.BackgroundGenerator;
import com.octo.captcha.component.image.backgroundgenerator.FunkyBackgroundGenerator;
import com.octo.captcha.component.image.color.RandomRangeColorGenerator;
import com.octo.captcha.component.image.fontgenerator.FontGenerator;
import com.octo.captcha.component.image.fontgenerator.RandomFontGenerator;
import com.octo.captcha.component.image.textpaster.RandomTextPaster;
import com.octo.captcha.component.image.textpaster.TextPaster;
import com.octo.captcha.component.image.wordtoimage.ComposedWordToImage;
import com.octo.captcha.component.image.wordtoimage.WordToImage;
import com.octo.captcha.component.word.wordgenerator.RandomWordGenerator;
import com.octo.captcha.component.word.wordgenerator.WordGenerator;
import com.octo.captcha.engine.image.ListImageCaptchaEngine;
import com.octo.captcha.image.gimpy.GimpyFactory;

public class MyImageCaptchaEngine extends ListImageCaptchaEngine {

	@Override
	protected void buildInitialFactories() {

		WordGenerator wgen = new RandomWordGenerator("aenmrgABDEGHLMNQRT2345678923456789");
		
		RandomRangeColorGenerator cgen = new RandomRangeColorGenerator(new int[] { 20, 200 }, new int[] { 20, 100 }, new int[] { 20, 100 });

		TextPaster textPaster = new RandomTextPaster(4, 5, cgen, Boolean.TRUE);

		//BackgroundGenerator backgroundGenerator = new UniColorBackgroundGenerator(new Integer(240), new Integer(60), new Color(252, 252, 253));

		BackgroundGenerator backgroundGenerator = new FunkyBackgroundGenerator(new Integer(240), new Integer(60));
		
		Font[] fontsList = new Font[] { 
				/*
				new Font("Helvetica", Font.BOLD, 12), 
				new Font("Arial", Font.BOLD, 13), 
				new Font("Vardana", Font.BOLD, 15),
				*/
				new Font("Helvetica", Font.BOLD + Font.ITALIC, 13), 
				new Font("Arial", Font.BOLD + Font.ITALIC, 14), 
				new Font("Vardana", Font.BOLD + Font.ITALIC, 17),
				/*
				new Font("Helvetica", Font.PLAIN, 13), 
				new Font("Arial", Font.PLAIN, 14), 
				new Font("Vardana", Font.PLAIN, 15),
				*/
				};

		FontGenerator fontGenerator = new RandomFontGenerator(25, 30, fontsList);
		WordToImage wordToImage = new ComposedWordToImage(fontGenerator, backgroundGenerator, textPaster);
		
		this.addFactory(new GimpyFactory(wgen, wordToImage));
	}
}
