<h1 align="center">Welcome to Elasticsearch Cluster 👋</h1>
<p>
  <img src="https://img.shields.io/badge/version-v0.1.0-blue.svg?cacheSeconds=2592000" />
  <a href="https://raj.ninja/elk-cluster/docs">
    <img alt="Documentation" src="https://img.shields.io/badge/documentation-yes-brightgreen.svg" target="_blank" />
  </a>
  <a href="https://github.com/msfidelis/elk-cluster/LICENSE">
    <img alt="License: MIT" src="https://img.shields.io/badge/License-MIT-yellow.svg" target="_blank" />
  </a>
  <a href="https://twitter.com/fidelissauro">
    <img alt="Twitter: fidelissauro" src="https://img.shields.io/twitter/follow/fidelissauro.svg?style=social" target="_blank" />
  </a>
</p>

![Architecture](.github/img/elk-stack.png)

> Production ready Elasticsearch Cluster provisioned with Terraform and Ansible on AWS Cloud

### 🏠 [Homepage](https://raj.ninja/elk-cluster)

## Install

```sh
cd terraform; terraform init
```

## Usage

* Edit `terraform/variables.tf` and edit some configs like instance type, IP's whitelists, etc


* Apply Terraform to create infraestrutucture on AWS

```sh
terraform apply
```

* Run ansible playbook to configure cluster components


```sh
ansible-playbook playbooks/cluster.yml
```

## Author

👤 **Matheus Fidelis**

* Twitter: [@fidelissauro](https://twitter.com/fidelissauro)
* Github: [@msfidelis](https://github.com/msfidelis)
* Email: <matheus@nanoshots.com.br>

## 🤝 Contributing

Contributions, issues and feature requests are welcome!<br />Feel free to check [issues page](https://github.com/msfidelis/elk-cluster/issues).

## Show your support

Give a ⭐️ if this project helped you!

## 📝 License

Copyright © 2019 [Matheus Fidelis](https://github.com/msfidelis).<br />
This project is [MIT](https://github.com/msfidelis/elk-cluster/LICENSE) licensed.

***
_This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)_