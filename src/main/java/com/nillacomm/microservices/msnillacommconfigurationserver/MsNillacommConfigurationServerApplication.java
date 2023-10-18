package com.nillacomm.microservices.msnillacommconfigurationserver;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.config.server.EnableConfigServer;

@EnableConfigServer
@SpringBootApplication
public class MsNillacommConfigurationServerApplication {

    public static void main(String[] args) {
        var springApplication = new SpringApplication(MsNillacommConfigurationServerApplication.class);
        springApplication.setAddCommandLineProperties(false);
        springApplication.run();
    }

}
