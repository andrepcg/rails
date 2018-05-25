FROM ruby:2.5.0

# see update.sh for why all "apt-get install"s have to stay as one long line
RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*

# install yarn
RUN \ 
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \ 
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \ 
    apt-get update && \ 
    apt-get install -y --force-yes --no-install-recommends yarn

# see http://guides.rubyonrails.org/command_line.html#rails-dbconsole
RUN apt-get update && apt-get install -y mysql-client postgresql-client sqlite3 --no-install-recommends && rm -rf /var/lib/apt/lists/*

# Rails v5.1.4
RUN gem install rails -v 5.1.4
