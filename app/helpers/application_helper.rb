module ApplicationHelper
  def sortable(column, created = nil)
    created ||= column.titleize
    direction = column == params[:sort] && params[:direction] == 'asc' ? 'desc' : 'asc'
    link_to created, remote: true, :sort => column, :direction => direction, class: "sort_link"
  end
end
