# Prerequisites
1. [`angular-cli`](https://cli.angular.io/) installed globally
```
npm i -g @angular/cli
```
2. [`yarn`](https://yarnpkg.com/getting-started/install) installed globally
```
npm i -g yarn
```
3. [`docker`](https://www.docker.com/)

# Launch Drill4J services
1. Run  
```
docker-compose up -d
```
2. Open admin UI on [http://localhost:9091](http://localhost:9091)

# Setup Drill4J browser extension
1. Download [build](https://github.com/Drill4J/browser-extension/releases/download/v0.3.16/release.zip)
3. Open `chrome://extensions`; enable Developer mode; install extension
2. Open extension settings and add agent with the following properties

Host
```
localhost
```
Agent ID
```
angular-demo-agent
```
Admin URL
```
localhost:9404
```
Agent Type
```
JS
```

# Setup sample app
1. Install packages
```
yarn install
```
2. Build app
```
ng build
```
3. Parse application with drill4js-cli
```
npx drill4js-cli -c ./drill4js.config.json -b 0.0.1
```
4. Host build
```
docker build . -t sample -f run-nginx.dockerfile --no-cache
docker run --rm -d  -p 80:80/tcp sample:latest
```
5. Open app on [localhost](http://localhost)
6. Open Drill4J extension, wait a bit, press "Open widget"
7. You are ready to collect some coverage