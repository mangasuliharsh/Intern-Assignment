package com.auth.Demo.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    private static final String[] PERMITTED_PATHS = {
            "/", "/register", "/login", "/login?continue",
            "/student-login", "/faculty-login",
            "/css/**", "/js/**", "/images/**", "/WEB-INF/views/**"
    };

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers(PERMITTED_PATHS).permitAll()
                        .requestMatchers("/student-dashboard").hasRole("STUDENT")
                        .requestMatchers("/faculty-dashboard").hasRole("FACULTY")
                        .anyRequest().authenticated()
                )
                .formLogin(login -> login
                        .loginPage("/register")
                        .loginProcessingUrl("/perform-login")
                        .successHandler(customSuccessHandler()) // Role-based redirection
                        .failureUrl("/login?error=true")
                        .permitAll()
                )
                .logout(logout -> logout
                        .logoutUrl("/logout")
                        .logoutSuccessUrl("/login?logout")
                        .permitAll()
                )
                .csrf(AbstractHttpConfigurer::disable);

        return http.build();
    }

    @Bean
    public AuthenticationSuccessHandler customSuccessHandler() {
        return (request, response, authentication) -> {
            var authorities = authentication.getAuthorities();
            if (authorities.stream().anyMatch(a -> a.getAuthority().equals("ROLE_STUDENT"))) {
                response.sendRedirect("/student-dashboard");
            } else if (authorities.stream().anyMatch(a -> a.getAuthority().equals("ROLE_FACULTY"))) {
                response.sendRedirect("/faculty-dashboard");
            } else  {
                response.sendRedirect("/home");
            }
        };
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
