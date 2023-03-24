# How to use dockerized easyblogger
## Authorization
### Generate auth url
To use blogger, the first step is fetching credentials.

You can find the ${blogId} once you logins blogger, the last part of url path

`https://www.blogger.com/blog/posts/8010633675189262826`
${blogId} is 8010633675189262826 for me. 

Then run the command below.
```shell
docker run -a stdout -t --rm --name easyblogger -v ${localdir}:/root/ murmursdev/easyblogger --blogid ${blogid} -v DEBUG get
```

`-a sdtout` show docker output to your host's output.

`-t` is required to show debug information.

`-v ${localdir}:/root/` to store the credential to your host.

After running the command, you will get 

https://accounts.google.com/o/oauth2/v2/auth?client_id=132424086208.apps.googleusercontent.com&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2F&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fblogger&access_type=offline&response_type=code

### Authorization
Click or copy the Google url to your browser, then finish authorization.

Now you will get a callback url with 

http://localhost:8080/?code=4/0AVHEtKTa_TfgiI8Iw&scope=https://www.googleapis.com/auth/blogger

Then you need to notify easyblogger with the command below because the server is running in docker.

```shell
docker exec easyblogger curl ${callbackUrl}
```

## Usage of easyblogger 

Once you got the credential you can call easyblogger with command below.

For more usage, please look at [here](https://github.com/MurmursDev/easyblogger#usage)

```shell
docker run -a stdout -t --rm --name easyblogger -v ${localdir}:/root/ murmursdev/easyblogger 
```
