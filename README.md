# iamfactory
This was started to quickly prototype customer organization to start mapping iam polcies etc at scale. Along the way a pattern emerged. This project will serve the security team as a baseline to test and validate security configurations in their own organizations. Lessons learned will be folded back into this configuration. Based on our learnings we hope to provide a template enterprise customers can consume and easily operationlize using GCP best practices. 

## Philosophy 
An organizations security team's maturity is graded in part by their ability to operationalize IaC. The most fundamental being Org structure and IAM policy. This project is going to attempt to achieve those ends while adhearing to good software development principles. In order to do that we will have to be opinionated at times and force others to adopt our model while keeping an open mind and have the ability to quickly modify the code according to feedback from the crowd. 

## Resource Hierarchy
![Resource Hierarchy]("./content/resource_hierarchy.png")

## To do
- Incorporate/implement project factory 
- Incorporate/implement IAM factory 
- Incorporate/implement Org security policy 