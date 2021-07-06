# Real-world-angular: Java+JS coverage

## Prerequisites

1. Drill4J services deployed (`admin`, `admin-ui`, `js-agent`)
2. RealWorld Example App API deployed

## How to register frontend application

1. Specify RealWorld Example App API address in `.env`, `REALWORLD_API_ADDRESS` variable;
2. Run `docker-compose.yml up -d` to launch frontend application. Inside the container the following will happen automatically:
    - frontend application is built;
    - frontend application is scanned with Drill4J scanning utility;
    - scanned sent to `js-agent` component in Drill4J services (see Prerequisites);
    - frontend hosted with `nginx` on port specified in `.env`;
3. Proceed to the admin panel and complete the registration of `angular-realworld-frontend`
    > TIP: (agent ID is specified in `.env`, `DRILL_JS_AGENT_AGENT_ID`)
    - Registration step 2: fill "Target host" with the address application is hosted at;
