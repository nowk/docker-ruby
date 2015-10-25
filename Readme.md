> I refuse to install Ruby on my machine.

# ruby-base

Ruby Docker Base Image

## Usage

    FROM nowk/ruby-base:<VERSION>

---

| Versions     |
| ------------ |
| 2.1.7 (p400) |


---

# ruby-env

Ruby Docker enviroment

## Usage

    FROM nowk/ruby-env:<VERSION>

---

| Environment Vars  |                     |
| ----------------- | ------------------- |
| GEM_HOME          | /usr/local/bundle   |
| PATH              | $GEM_HOME/bin:$PATH |
| BUNDLE_APP_CONFIG | $GEM_HOME           |

---

| User | UID  | SUDO |
| ---- | ---- | ---- |
| ruby | 1001 | TRUE |

*Switching `USER` must be explicitly called.*

--

| Volumes | Example        |
| ------- | -------------- |
| /src    | -v $(pwd):/src |

---

| WORKDIR |
| ------- |
| /src    |

## Example

    FROM nowk/ruby-env:2.1.7

    USER ruby

    ---

    docker build --rm -t myrubyproject .
    docker run -v $(pwd):/src --rm -it myrubyproject bundle install

