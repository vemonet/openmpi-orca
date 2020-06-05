
Download Orca: https://orcaforum.kofo.mpg.de/app.php/dlext/

> 3.5G file, **cannot be redistributed**

Installing on Linux: https://www.youtube.com/watch?v=61mDG1q7z44

---

## Docker

### Build

```bash
docker build -t umdsri/openmpi-orca .
```

### Run

```bash
docker run -it --rm --name orca umdsri/openmpi-orca
```

---

## Build and deploy on OpenShift

Build without using DockerHub:

https://maastrichtu-ids.github.io/dsri-documentation/docs/guide-dockerfile-to-openshift

```bash
oc new-build --name openmpi-orcas-vieru --binary
oc start-build openmpi-orcas-vieru --from-dir=. --follow --wait
oc new-app openmpi-orcas-vieru
```

## Test it

```bash
orca.exe nam.inp > orca_results.out
```

## Delete deployment

```bash
oc delete build openmpi-orcas-vieru
```

