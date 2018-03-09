package com.cms;

import com.cms.Entity.User;
import com.cms.Service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:/spring-mvc.xml", "classpath*:/spring-mybatis.xml"})
public class TestService {
    @Resource
    private UserService userService;
    
    @Test
    public void test1(){
        User user = userService.login("12345", "12345");
        System.out.println(user.toString());
    }
    
    @Test
    public void test2(){
        ApplicationContext ctx=new ClassPathXmlApplicationContext("spring-mybatis.xml");
        String[] beanNames=ctx.getBeanDefinitionNames();

        for(String name:beanNames){
            System.out.println("beanName--->>> "+name);
        }
    }
}
