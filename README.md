### Setting up metricbeat dashboards

```sh
docker exec -it elkstackdocker_metricbeat_1 sh

# In the container
export NODE_NAME="default"
metricbeat setup --template
metricbeat setup --dashboards
```
