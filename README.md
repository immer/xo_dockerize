XO Dockerize
---

### Pre-requisites

You should have these programs installed

- `aws`
- `eb`
- `docker`


## Setup

To install the docker scaffolding to your project

```
curl --remote-name https://raw.githubusercontent.com/xogroup/xo_dockerize/master/dkr

sh dkr
```

This command will (among other things) create a `env.example` file. Fill in the
values of the environment variables listed in that file with the values you
require.

After that, you should be able to run these commands to push a container to a
registry


```
source <my-env-file>

make release
```

When you are ready to deploy your application, you'll need a stack. Run these
commands to set things up


```
curl --remote-name https://raw.githubusercontent.com/xogroup/xo_dockerize/master/stk

sh stk
```

Once your stack is created, you'll want to customize it. For a list of helpful
suggestions re. tagging, tiers, load balancers, etc., run this command


```
aws elasticbeanstalk update-environment help
```


## Development

The `stk` and `dkr` executables are composed of other files located in the `etc`
directory. Take a look at the `Makefile` for an idea of what's going on.

If you need to start afresh, you can run

```
make clean
```
