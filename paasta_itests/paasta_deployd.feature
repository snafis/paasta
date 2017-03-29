Feature: paasta-deployd deploys apps

  Scenario: deployd will deploy a new app
    Given a working paasta cluster
      And paasta-deployd is running
      And I have yelpsoa-configs for the marathon job "test-service.main"
      And we have a deployments.json for the service "test-service" with enabled instance "main"
     Then we should see "test-service.main" listed in marathon after 30 seconds
     Then we can run get_app
     Then paasta-deployd can be stopped

  Scenario: deployd starts and only one leader
    Given a working paasta cluster
      And paasta-deployd is running
     Then a second deployd does not become leader
     Then paasta-deployd can be stopped
     Then a second deployd becomes leader

