resource "azurerm_frontdoor" "fdg" {
  for_each = var.front_door
  name                = "FrontDoor"
  resource_group_name = "Home_office"


  routing_rule {
    name               = "RoutingRule"
    accepted_protocols = ["Http", "Https"]
    patterns_to_match  = ["/*"]
    frontend_endpoints = ["fdgFrontendEndpoint"]

    forwarding_configuration {
      forwarding_protocol = "MatchRequest"
      backend_pool_name   = "fdgBackendpool"
    }
  }

  backend_pool_load_balancing {
    name                            = "backLoadBalancing"
    sample_size                     = 4
    successful_samples_required     = 2
    additional_latency_milliseconds = 60
  }

  backend_pool_health_probe {
    name                = "fdgHealthProbe"
    enabled             = true
    path                = "/"
    protocol            = "Http"
    probe_method        = "HEAD"
    interval_in_seconds = 10
  }

  backend_pool {
    name                = "fdgBackendpool"
    load_balancing_name = "backLoadBalancing"
    health_probe_name   = "fdgHealthProbe"

    backend {
      host_header = "www.vadantabharat.online"
      address     = "www.vadantabharat.online"
      http_port   = 80
      https_port  = 443
    }


  }

  frontend_endpoint {
    name      = "fdgFrontendEndpoint"
    host_name = "example-FrontDoor.azurefd.net"
  }


}