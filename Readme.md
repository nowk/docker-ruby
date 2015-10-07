# ruby-env

Ruby Dockern enviroment

*I refuse to install Ruby on my machine.*

## Usage

    FROM nowk/ruby-env:<VERSION>

---

| Environment Vars  |                     |
| ----------------- | ------------------- |
| GEM_HOME          | /usr/local/bundle   |
| PATH              | $GEM_HOME/bin:$PATH |
| BUNDLE_APP_CONFIG | $GEM_HOME           |

---

| Versions     |
| ------------ |
| 2.1.7 (p400) |


## Example

    FROM nowk/ruby-env:2.1.7

    ---

    docker build --rm -t myrubyproject .
    docker run -v $(pwd):/src --rm -it myrubyproject bundle install

