class String

  # 全角文字を半角の2個分と扱ってtruncateを行う
  # truncate_atで指定された字数を超えない(切り捨て)
  #
  # @return [String] 短縮された文字列
  def my_truncate(truncate_at, options = {})
    omission = options[:omission] || '...'

    if size == bytesize
      truncate(truncate_at, options)
    else
      size.times do |i|
        str_size = (self[0..i].bytesize - self[0..i].size) / 2 + self[0..i].size
        next if str_size < (truncate_at - omission.size)

        return "#{ self[0..i] }#{ omission }" if str_size == (truncate_at - omission.size)
        return "#{ self[0..(i - 1)] }#{ omission }"
      end

      return self
    end
  end
end