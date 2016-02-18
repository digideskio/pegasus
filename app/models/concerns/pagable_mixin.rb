require 'active_support/concern'

module PagableMixin
  extend ActiveSupport::Concern

  def cursor_page(id_cursor = nil, limit_by = 20)
    return order(id: :desc).limit(limit_by) if id.nil?
    order(:id).where('id': id_cursor..-Float::INFINITY).limit(limit_by)
  end

  def cursor_page_reverse(id_cursor = nil, limit_by = 20)
    return order(id: :asc).limit(limit_by) if id.nil?
    order(:id).where('id': id_cursor..Float::INFINITY).limit(limit_by)
  end

  def previous_page(id_cursor = nil, limit_by = 1)
    record = cursor_page_reverse(id_cursor, limit_by).first
    return nil if record.nil? || record.id == id
    record.id
  end

  def next_page(id_cursor = nil, limit_by = 1)
    record = cursor_page(id_cursor, limit_by).last
    return nil if record.nil? || record.id == id
    record.id
  end
end
