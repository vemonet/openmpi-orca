
Download Orca: https://orcaforum.kofo.mpg.de/app.php/dlext/

> 3.5G file, **cannot be redistributed**

Installing on Linux: https://www.youtube.com/watch?v=61mDG1q7z44

---

## Docker

Make sure Orca has been downloaded and the name match with the one used in the Dockerfile

### Build

```bash
docker build -t openmpi-orca .
```

### Run

```bash
docker run -it --rm --name orca openmpi-orca
```

---

## Build and deploy

See [documentation to build without using DockerHub](https://maastrichtu-ids.github.io/dsri-documentation/docs/guide-dockerfile-to-openshift).

Create build in `test-vincent` project:

```bash
oc project test-vincent
oc new-build --name openmpi-orcas-vieru --binary
```

Build:

```bash
oc start-build openmpi-orcas-vieru --from-dir=. --follow --wait
```

Deploy from build:

```bash
oc new-app openmpi-orcas-vieru
```

### Or push the already built image

Docker build:

```bash
docker build -t openmpi-orca .
```

Push the local image to OpenShift:

```bash
oc new-app openmpi-orca --name openmpi-orca-app
```

## Test it

Copy the test file to the pod:

```bash
oc cp orca-test.inp openmpi-orca-app:/root
```

Connect to the pod:

```bash
oc rsh openmpi-orca-app
```

Run orca:

```bash
orca.exe orca-test.inp > orca_results.out
```

## Delete deployment

```bash
oc delete build openmpi-orcas-vieru
```

