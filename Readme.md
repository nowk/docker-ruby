> I refuse to install Ruby on my machine.

# ruby-base

Ruby Docker

---

| Entrypoint | Cmd    |
| ---------- | ------ |
| ruby       | --help |

## Example

    docker run -v $(pwd):/src --rm -it nowk/ruby:2.2.3 --version


---

## -base

    FROM nowk/ruby-base:<VERSION>

---

| Versions     |
| ------------ |
| 2.1.6        |
| ------------ |
| 2.2.3        |


---

## -onbuild

    FROM nowk/ruby-onbuild:<VERSION>

---

| Environment Vars  |                     |
| ----------------- | ------------------- |
| GEM_HOME          | /src/.bundle        |
| PATH              | $GEM_HOME/bin:$PATH |
| BUNDLE_APP_CONFIG | $GEM_HOME           |

---

| User | UID  | SUDO |
| ---- | ---- | ---- |
| ruby | 1000 | TRUE |

*Switching `USER` must be explicitly called.*

--

| Volumes | Example        |
| ------- | -------------- |
| /src    | -v $(pwd):/src |

---

| WORKDIR |
| ------- |
| /src    |

