FROM ruby:2.3

RUN apt-get update && apt-get install -y \ 
  build-essential \ 
  nodejs

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5

COPY . ./
RUN rails db:migrate

EXPOSE 3000

CMD ["bundle","exec","rails","server","-b","0.0.0.0"]