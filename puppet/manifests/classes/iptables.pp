class iptables {

  # make sure iptables is disabled.
  service { "iptables":
    ensure => "stopped",
  }

}