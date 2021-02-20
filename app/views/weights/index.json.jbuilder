json.array! @weights do |weight|
  json.extract! weight, :id
  json.extract! weight, :date
  json.extract! weight, :weight
  json.extract! weight, :comment
  json.tags weight.tags.map(&:name)
end