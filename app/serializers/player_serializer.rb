class PlayerSerializer < ActiveModel::Serializer
  attributes :user_id, :score

  def user_id
    object.id
  end

  def score
    object.plays.inject(0) do |sum, play|
      sum += play.score
    end
  end
end
