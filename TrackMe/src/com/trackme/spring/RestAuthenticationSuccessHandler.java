package com.trackme.spring;
 
import java.io.IOException;
import java.util.Set;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.trackme.constants.Constant;
import com.trackme.spring.dao.UserMasterDAO;
import com.trackme.spring.model.UserMaster;
import com.trackme.spring.service.UserMasterService;


public class RestAuthenticationSuccessHandler extends
SimpleUrlAuthenticationSuccessHandler  {
 
	 private RequestCache requestCache = new HttpSessionRequestCache();
	 
	    @Override
	    public void onAuthenticationSuccess(
	      HttpServletRequest request,
	      HttpServletResponse response, 
	      Authentication authentication) 
	      throws ServletException, IOException {
	  
	        SavedRequest savedRequest
	          = requestCache.getRequest(request, response);
	 
	        if (savedRequest == null) {
	            clearAuthenticationAttributes(request);
	            return;
	        }
	        String targetUrlParam = getTargetUrlParameter();
	        if (isAlwaysUseDefaultTargetUrl()
	          || (targetUrlParam != null
	          && StringUtils.hasText(request.getParameter(targetUrlParam)))) {
	            requestCache.removeRequest(request, response);
	            clearAuthenticationAttributes(request);
	            return;
	        }
	 
	        clearAuthenticationAttributes(request);
	    }
	 
	    public void setRequestCache(RequestCache requestCache) {
	        this.requestCache = requestCache;
	    }
}