# httpecho

This chart deploys the httpecho app into kubernetes.

## Example

Run the following command from within the root httpecho directory.

### Windows
```
helm install --set loadBalancerSourceRanges=%LOAD_BALANCER_SOURCE_RANGES% -n httpecho --namespace httpecho ./httpecho-helm
```

### Linux
```
helm install --set loadBalancerSourceRanges=$LOAD_BALANCER_SOURCE_RANGES -n httpecho --namespace httpecho ./httpecho-helm
```

Once the load balancer has started, you should be able to test the service by opening a browser to: [http://LOAD_BALANCER_ADDRESS:8080/echo/test](http://LOAD_BALANCER_ADDRESS:8080/echo/test) and you will see `test` in the window. Any word in the url after `/echo/` will be printed to the window.