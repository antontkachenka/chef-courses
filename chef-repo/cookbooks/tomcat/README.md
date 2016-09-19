# TOMCAT Cookbook

This cookbook set up TOMCAT

### Platforms

- Centos 6.7

### Chef

- Chef 12.0 or later

## Usage

### Tomcat

Just include `tomcat` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[tomcat]"
  ]
}
```

## Contributing

1. Install Tomcat via yum install
2. Replace server.xml
3. Run Tomcat

## License and Authors

Created by Anton Tkachenka
