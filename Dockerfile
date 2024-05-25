FROM ruby:3.2
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs vim
WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
COPY . /app
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD [ "rails","server","-b","0.0.0.0" ]
# CMD ["rails", "server", "-b", "0.0.0.0"]
