# nginx Cookbook

This cookbook set up nginx

### Platforms

- Centos 6.7

### Chef

- Chef 12.0 or later

## Attributes

### nginx::default

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><tt>['nginx']['port']</tt></td>
    <td>integer</td>
    <td>port of nginx</td>
  </tr>
  <tr>
    <td><tt>['tomcat']['port']</tt></td>
    <td>integer</td>
    <td>port of tomcat</td>
  </tr>
  <tr>
    <td><tt>['jenkins']['port']</tt></td>
    <td>integer</td>
    <td>port of jenkins</td>
  </tr>

</table>

## Usage

### Nginx

Just include `nginx` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[nginx]"
  ]
}
```

## Contributing

1. Install NGINX via yum install
2. Replace default.conf file with settings
3. Run NGINX

## License and Authors

Authors: Anton Tkachenka

