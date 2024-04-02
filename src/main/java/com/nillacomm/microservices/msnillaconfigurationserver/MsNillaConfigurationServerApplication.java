package com.nillacomm.microservices.msnillaconfigurationserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.config.server.EnableConfigServer;

@EnableConfigServer
@SpringBootApplication
public class MsNillaConfigurationServerApplication {

    public static void main(String[] args) {
        var springApplication = new SpringApplication(MsNillaConfigurationServerApplication.class);
        springApplication.setAddCommandLineProperties(false);
        springApplication.run();
    }

}
