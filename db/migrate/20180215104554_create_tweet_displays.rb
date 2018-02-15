class CreateTweetDisplays < ActiveRecord::Migration[5.1]
  def change
    create_table :tweet_displays do |t|

      t.timestamps
    end
  end
end
