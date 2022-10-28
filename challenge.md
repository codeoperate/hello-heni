# Purpose
  To provide an approach to ABC Techs new Cloud Environment
  
## Cloud Provider
  We take a look at the application, and what resources it needed.  Most likey we would use AWS unless there was a specific reason
  to go else where, such as if there was a larely Microsoft system, using SQL Server, Power Platform or Power BI, 
  going to Azure and using AzureDevops would be an option.
  
## Authentication & Authorization
  Engineers should be able to use Single Sign-on with AWS integrated with Active Directory Authentication ideally.
  There should be access for using the console and for API Keys.
  Both are time bound with session tokens.
  IAM users and roles can be used for applications
   
## Products
  AWS Config to track changes to the accounts.
  Cloud Trail to track changes/updates/access to services.
  Route53 to manage our domain names and name resolution.
  AWS API Gateway as our entry point to our Lambdas.
  CloudWatch log groups for logging API Access, but also logs from lambdas.
  Certfite Manager to create and manage our certificates.
		
## Architecture
   We are operating out of one region, but if there are this many users, and if we have a global presence, 
   I would look to use Cloudfront

## GIT
  If we use a GIT repository only without any CI/CD tooling, we should definitely look to use a product offering.
  Having a GIT repo does allow us to use a few Vendors:  GitLab, GitHub or CircleCI, etc.  And these would have facilities to
  link with our existing GIT Repo.
  
  Since Development is ongoing, I would keep the application code in its own repo.  I would keep that line as is.
  
  We would use new repos for the infrastructure code that would start to setup the new AWS account.  The code we create would use reusable terraform modules, 
  and provide a set of resources that developer could also use to enable faster development.  We would have a repo for each reusable module.
  
  We would also have a repository that would be using these modules, and this repository would mirror the architecture of the system, having folder names for 
  each layer of our application.
  
  A github flow pattern where there was a main branch, and off this there would be feature or bug fix
  branches.   We would use the same process as for developers for creating branches and pull requests to the main branch, 
  for approvals.   We would follow a convention as as convential commits to allow us to auto version and create tools off
  commit information.
  
  
## CI/CD 
  Since deployments are done manually right now, it would be a very good opportunity to look at using a vendor that provides 
  the full suite of CI/CD tools rather than piecing together a system.  
  
  We also need to look at how the exising workload is tracked.
  What issue/ticketing system is in place, and how are developers managing their workload.   Also, as mentioend above, if there was
  a largely microsoft system and services, using AzureDevops would also be a candidate.  However, there are others such as GitLab,
  GitHub, CirleCI and AWS CodeCommit, CodePipeline.
  
  Regardless, using these tools will provide us with many features including the ability to create releases and rollbacks.  
  Due to the large number of users using the application, deployments would be a canary type - rolling out the update to a certain percentage of users initialy would be a correct approach.
  This would also be a factor in deciding which CI/CD tools to use.  I know AWS CI/CD tools provide this.
  
  The Pipelines would follow a github flow pattern where there was a main branch, and off this there would be feature or bug fix
  branches.  The commits to these branch would trigger workflows or pipelines that do auto linting and testing, as well as packaging.
  There would also be other codescanners and package scanner checking for vulnerabilities.
  
  The main branch would require pull requests and approvals before merging.  The creation of pull requests would also trigger workflows and pipelines
  to ensure the correctness of the branch.  There would be minimum number of approvers, and also pipelines runs need to be successful before any 
  merges would be allowed.
  
  We would have a staging or UAT release, where an application can be run and verified.  There could also be an approval stage here, where a certain authorised set
  of users can approve the deployment to production.
  
## Observability
  We would use AWS Cloudwatch as our observability platform for the application, along with alarms for notifications for breaching limits.
  
