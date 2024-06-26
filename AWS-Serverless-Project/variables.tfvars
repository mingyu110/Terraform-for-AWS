# Remember all .tfvars files should be excluded in version control
# as there may contain sensitive data, such as password,private keys
# And this is only demo for how to write .tfvars and use it 

app_name        = "serverless-amplify-app"
app_repo        = "https://git-codecommit.us-east-1.amazonaws.com/v1/repos/Serverless-Project"
app_branch      = "master"
app_domain_name = "your domain name"
db_table_name = "Student-Details"
function_name_GET = "GET-lambda"
bucket_name = "lambda-code6576453"
GET_function_file = "GET.zip"
function_name_POST = "POST-lambda"
POST_function_file = "POST.zip"
GET_lambda_handler = "GETmethod.lambda_handler"
POST_lambda_handler = "POSTmethod.lambda_handler"
lambda_runtime = "python3.10"
lambda_memory_size = 128
lambda_timeout = 60
rest_api_name = "Student-API-Gateway-Lambda"
rest_api_description    = "Student API Gateway For Lambda"
api_resource_one = "addStudent"
api_resource_two = "getStudent"
role-1 =  "lambda-role"
role-2 = "amplify-role"
policy-1 = "lambda-policy"
policy-2 = "amplify-policy"
