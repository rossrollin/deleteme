### TODO

1. Remote-exec installs ansible, but thats useless. local-exec runs commands from your LOCAL MACHINE. Now we know how it works, change it to include configuration locally from ansible, or use remote-exec entirely for provisioning. Technically theres nothing wrong with doing that - its still config as code for an inital deployment. Just managing it going forward could be a pain
2. Change classic load balancer to elastic load balancer. 
