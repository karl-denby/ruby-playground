FROM ruby:2.6

RUN apt-get update && apt-get install -y \ 
  build-essential \ 
  nodejs

WORKDIR /usr/src/app

COPY . ./
RUN gem install bundler && bundle  --jobs 20 --retry 5

RUN rails db:migrate

EXPOSE 3000

CMD ["bundle","exec","rails","server","-b","0.0.0.0"]
