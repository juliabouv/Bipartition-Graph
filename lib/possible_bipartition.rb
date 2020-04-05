
def possible_bipartition(dislikes)
  return true if dislikes.empty?

  i = -1
  unvisited = dislikes.map { i += 1 }
  queue = [0]

  red = Set[0]
  green = Set[]

  until queue.empty? && unvisited.empty? do
    if queue.empty?
      current = unvisited.pop()
    else
      current = queue.shift
      unvisited.delete(current)
    end
    p red
    p green

    dislikes[current].each do |neighbor|
      if red.include?(current)
        return false if red.include?(neighbor)

        unless green.include?(neighbor)
          green.add(neighbor)
          queue << neighbor
        end
      else
        return false if green.include?(neighbor)

        unless red.include?(neighbor)
          red.add(neighbor)
          queue << neighbor
        end
      end
    end
  end

  return true
end
