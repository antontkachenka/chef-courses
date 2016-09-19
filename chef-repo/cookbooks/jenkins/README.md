# JENKINS Cookbook

This cookbook set up Jenkins

### Platforms

- Centos 6.7

### Chef

- Chef 12.0 or later

## Usage

### Jenkins

Just include `jenkins` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[jenkins]"
  ]
}
```

## Contributing

1. Install Jenkins via yum install
2. Replace jenkins in sysconfig
3. Replace config.xml
4. Put jobs to /var/lib/jenkins
5. Put plugins to /var/lib/jenkins
6. Put MAVEN's settings to /var/lib/jenkins

## License and Authors

Created by Anton Tkachenka
