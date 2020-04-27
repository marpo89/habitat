package org.habitatnicaragua.micasa;

import java.util.concurrent.TimeUnit;

import org.habitatnicaragua.micasa.util.JpaRepositoryUnoImpl;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.embedded.ConfigurableEmbeddedServletContainer;
import org.springframework.boot.context.embedded.EmbeddedServletContainerCustomizer;
import org.springframework.boot.context.embedded.MimeMappings;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.cache.Cache;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.cache.guava.GuavaCache;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.Ordered;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.google.common.cache.CacheBuilder;

@SpringBootApplication
@ComponentScan({"org.habitatnicaragua.micasa"})
@Configuration
@EnableCaching
@ServletComponentScan
@EnableJpaRepositories(repositoryBaseClass = JpaRepositoryUnoImpl.class)
public class MiCasaApplication extends WebMvcConfigurerAdapter implements EmbeddedServletContainerCustomizer {

	public final static String CACHE_APP_L1 = "cacheAppL1";
	
	public static void main(String[] args) {
		SpringApplication.run(MiCasaApplication.class, args);
	}
	
	@Override
    public void addViewControllers( ViewControllerRegistry registry ) {
        registry.addViewController( "/" ).setViewName( "forward:/inicio" );
        registry.setOrder( Ordered.HIGHEST_PRECEDENCE );
        super.addViewControllers( registry );
    }

	@Override
	public void customize(ConfigurableEmbeddedServletContainer container) {
		MimeMappings mappings = new MimeMappings(MimeMappings.DEFAULT);
	    mappings.add("ico", "image/vnd.microsoft.icon");
	    container.setMimeMappings(mappings);
	}
	
	@Bean(name=CACHE_APP_L1)
	public Cache cacheAppL1() {
		return new GuavaCache(CACHE_APP_L1, CacheBuilder.newBuilder()
				.expireAfterWrite(30, TimeUnit.MINUTES)
				.build());
	}
}
