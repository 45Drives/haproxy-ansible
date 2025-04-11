# haproxy-ansible
This playbook was designed to implement load-balancing across RGW nodes in a cluster using haproxy and keepalived.
It is an adaptation of the rgw-loadbalancer playbook present in ceph-ansible for ceph-ansible2.
The overal execution of the playbook is similar but handles variables differently.

HOW TO USE:

To use this playbook correctly, you'll need to configure some variables first.

###### groupvars/haproxynodes.yml ######

haproxy_frontend_port: This variable defines the listening port. Can usually leave as 80 unless it creates conflicts with some other process on the host.

haproxy_frontend_ssl_port: Defines the listening port for SSL. Can usually leave as 443.

haproxy_frontend_ssl_certificate: Defines the SSL cert that will be used. Can leave empty if not using one.

virtual_ips: This defines the virtual IPs that will be used for load balancing. Make sure the IPs aren't being already used.

virtual_ip_netmask: Defines the netmask the virtual IP network uses. Will usually be 24 or 16.


###### host_vars ######

Each node will need its own host var file here. It will be named {hostname}.yml

The contents of each file should resemble this structure:

---
rgw_instances:
  - instance_name: rgw.node1
    radosgw_address: 192.168.98.36
    radosgw_frontend_port: 8080

instance_name: The name of the RGW process running on the node.

radosgw_address: The IP address of the node.

radosgw_frontend_port: This defines the port the RGW node is using.

Outside of this block, there's one more variable to set.

virtual_ip_interfaces: Defines the interfaces that will host the virtual IPs.

###### Inventory File ######

In the inventory file, there will be two groups; [haproxynodes] and [rgws].

These two groups should be identical in terms of hosts present.

###### Running the Playbook ######

Once all the variables are in place, you can run the playbook with the command "ansible-playbook -i inventory.ini deploy_haproxy.yml".

