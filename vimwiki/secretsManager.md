# Google Secrets Manager Quickstart

## Notes
- Billing must be enabled on the project
- Optionally you can install the gcloud CLI

## Steps

1) Enable the api for the project [here](https://console.cloud.google.com/apis/enableflow?apiid=secretmanager.googleapis.com&redirect=https:%2F%2Fconsole.cloud.google.com&_ga=2.227795165.1341661704.1643838441-1254371316.1643751528&_gac=1.117477755.1643751530.Cj0KCQiA0eOPBhCGARIsAFIwTs7BYq0_pKmcUYuqc4EdPmLTp28wr8uEEZhB9PaSjzTjQ0eAFFang2kaAo4kEALw_wcB&project=rumpelstiltskin-8cadf).
1) Go to the IAM page in the Gcloud Console [here](https://console.cloud.google.com/iam-admin/iam?_ga=2.236546881.1341661704.1643838441-1254371316.1643751528&_gac=1.192901464.1643751530.Cj0KCQiA0eOPBhCGARIsAFIwTs7BYq0_pKmcUYuqc4EdPmLTp28wr8uEEZhB9PaSjzTjQ0eAFFang2kaAo4kEALw_wcB&project=rumpelstiltskin-8cadf).
1) For firebase projects find the 'app engine default account'.
1) Assign the role of 'secret manager accessor' to the above account. Make sure you don't delete the 'editor role that is already there'
1) Create a new secret for the project [here](https://console.cloud.google.com/security/secret-manager?_ga=2.164130815.1341661704.1643838441-1254371316.1643751528&_gac=1.192910936.1643751530.Cj0KCQiA0eOPBhCGARIsAFIwTs7BYq0_pKmcUYuqc4EdPmLTp28wr8uEEZhB9PaSjzTjQ0eAFFang2kaAo4kEALw_wcB&project=rumpelstiltskin-8cadf).
1) Optionally you can click on the key find your version and click on the three dots under actions to find the 'copy resource id' setting, you will need this to access the secret later.
1) Install the google secrets manager SDK by running:
```
npm install --save @google-cloud/secret-manager
```

Then you can access the secret by executing the following:

```
**version.name  is the 'resource id' that you copied from the console earlier -- step 6**

const {SecretManagerServiceClient} = require('@google-cloud/secret-manager');
const client = new SecretManagerServiceClient();

  const [accessResponse] = await client.accessSecretVersion({
    name: version.name,
  });

  const responsePayload = accessResponse.payload.data.toString('utf8');
  console.info(`Payload: ${responsePayload}`);
```


