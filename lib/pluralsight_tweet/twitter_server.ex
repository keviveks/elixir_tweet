defmodule PluralsightTweet.TweetServer do
  use GenServer

  def start_link() do
    GenServer.start_link(__MODULE__, :ok, name: :tweet_server)
  end

  def init(:ok) do
    {:ok, %{}}
  end

  # async function
  def handle_cast({:tweet, tweet}, _) do
    PluralsightTweet.Tweet.send(tweet)
    {:noreply, %{}}
  end

  def tweet(tweet) do
    GenServer.cast(:tweet_server, {:tweet, tweet})
  end
end
