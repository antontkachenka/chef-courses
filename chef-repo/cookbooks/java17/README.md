# JAVA Cookbook

This cookbook set up java 1.7

### Platforms

- Centos 6.7

### Chef

- Chef 12.0 or later

## Attributes

### Java::default

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><tt>['nginx']['version']</tt></td>
    <td>string</td>
    <td>Version of Java</td>
  </tr>
</table>

## Usage

### Java

Just include `java` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[java]"
  ]
}
```

## Contributing

1. Install Java via yum install

## License and Authors

Created by Anton Tkachenka
