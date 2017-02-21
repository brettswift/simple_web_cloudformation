#!/usr/bin/env ruby

puts "What region are you using?"
REGION = gets

begin
  # create a clean stack.
  aws cloudformation create-stack \
          --stack-name 'Main-Network-Pipeline' \
          --template-url ''


  stack.create({
    template_url: "TemplateURL",
    parameters: [
      {
        parameter_key: "ParameterKey",
        parameter_value: "ParameterValue",
        use_previous_value: false,
      },
    ],
    disable_rollback: false,
    timeout_in_minutes: 1,
    notification_arns: ["NotificationARN"],
    capabilities: ["CAPABILITY_IAM"], # accepts CAPABILITY_IAM, CAPABILITY_NAMED_IAM
    resource_types: ["ResourceType"],
    role_arn: "RoleARN",
    on_failure: "DO_NOTHING", # accepts DO_NOTHING, ROLLBACK, DELETE
    stack_policy_body: "StackPolicyBody",
    stack_policy_url: "StackPolicyURL",
    tags: [
      {
        key: "TagKey",
        value: "TagValue",
      },
    ],
  })

rescue Aws::CloudFormation::Errors::ServiceError exception
  # rescues all errors returned by AWS CloudFormation
  puts "Oops.  Something crappy happened. See below"
  puts exception
end
