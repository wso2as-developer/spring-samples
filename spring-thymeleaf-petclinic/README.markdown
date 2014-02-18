# Spring PetClinic + Thymeleaf Sample Application

## What's this?
This is a thymeleaf-enabled version of the Spring PetClinic official
sample application by SpringSource.

The original application lives at https://github.com/SpringSource/spring-petclinic

## Running petclinic locally

First, you will have to download it. If you have a local installation of git, you can
do it by simply cloning this repository:

```
	git clone https://github.com/wso2as-developer/spring-samples.git
```

If you don't have git installed, you can download a `.zip` by pressing on the 
*Download zip* button in the upper side of this page.

Once downloaded, the application can be locally build with:

```
	mvn clean package
```

Once you build the .WAR file deploy into WSO2 AS https://192.168.1.2:9443/carbon/
