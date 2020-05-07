# ci-builder

Docker image designed for generic CI tasks

## Features

* Based on Ubuntu 19.10
* Go with golint and golangci-lint
* Git
* Curl
* nvm
* terraform-switcher
* kubectl

## Building from source

```sh
make docker-build
```

## Contributing

If you find a bug or have an idea for a new feature please [raise an issue](/AverageMarcus/ci-builder/issues/new) to discuss it.

Pull requests are welcomed but please try and follow similar code style as the rest of the project and ensure all tests and code checkers are passing.

Thank you 💛

## License

See [LICENSE](LICENSE)
