FROM alpine:3.8

LABEL name="alpine-android" \
      description="Android Alpine Image" \
      url="https://cloud.docker.com/swarm/tatsontung/repository/docker/tatsontung/dev/general" \
      maintainer="tatsontung"

# Set environment variables
ENV VERSION_SDK_TOOLS=3952940
ENV ANDROID_HOME /usr/local/android-sdk
ENV PATH $PATH:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools

#ENV http_proxy someproxy:8080
#ENV https_proxy someproxy:8080

# Install all the necessary packages
RUN apk add --update --no-cache bash git unzip curl openssl ca-certificates openjdk8 \
    && rm -rf /var/cache/apk/* \
# Install Android SDK
    && wget -q -O sdk.zip http://dl.google.com/android/repository/sdk-tools-linux-$VERSION_SDK_TOOLS.zip \
    && unzip sdk.zip -d $ANDROID_HOME \
    && rm -f sdk.zip

ADD packages.txt $ANDROID_HOME
RUN mkdir ~/.android && touch ~/.android/repositories.cfg \
    && sdkmanager --update && yes | sdkmanager --licenses \
    && sdkmanager --package_file=$ANDROID_HOME/packages.txt
#--proxy=http --proxy_host=someproxy --proxy_port=8080
#RUN sdkmanager "build-tools;27.0.2" "platforms;android-27"
#--proxy=http --proxy_host=someproxy --proxy_port=8080