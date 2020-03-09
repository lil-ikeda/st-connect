FROM ruby:2.5.1

# 必要なパッケージのインストール（基本的に必要になってくるものだと思うので削らないこと）
RUN apt-get update -qq && \
    apt-get install -y build-essential \ 
                        libpq-dev \        
                        nodejs           

# 作業ディレクトリの作成、設定
RUN mkdir /app_name 
##作業ディレクトリ名をAPP_ROOTに割り当てて、以下$APP_ROOTで参照
ENV APP_ROOT /app_name 
WORKDIR $APP_ROOT

# ホスト側（ローカル）のGemfileを追加する（ローカルのGemfileは【３】で作成）
ADD ./Gemfile $APP_ROOT/Gemfile
ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

# ENV BUNDLER_VERSION 2.1.0
# RUN gem install bundler

# Gemfileのbundle install
RUN bundle install
ADD . $APP_ROOT

# # 必要なパッケージのインストール（基本的に必要になってくるものだと思うので削らないこと）
# RUN apt-get update -qq && \
#     apt-get install -y build-essential \ 
#                        libpq-dev \        
#                        nodejs           

# # 作業ディレクトリの作成、設定
# RUN mkdir /app_name 
# ##作業ディレクトリ名をAPP_ROOTに割り当てて、以下$APP_ROOTで参照
# ENV APP_ROOT /app_name 
# WORKDIR $APP_ROOT

# # ホスト側（ローカル）のGemfileを追加する（ローカルのGemfileは【３】で作成）
# ADD ./Gemfile $APP_ROOT/Gemfile
# ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock

# # bundlerの環境設定
# ENV BUNDLER_VERSION 2.1.0
# RUN gem install bundler

# # Gemfileのbundle install
# RUN bundle install
# ADD . $APP_ROOT
