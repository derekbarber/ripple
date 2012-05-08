class FamiliesDatatable
  delegate :params, :h, :link_to, :number_to_currency, to: :@view

  def initialize(view)
    @view = view
  end

  def as_json(options = {})
    {
      sEcho: params[:sEcho].to_i,
      iTotalRecords: Family.count,
      iTotalDisplayRecords: families.total_entries,
      aaData: data
    }
  end

private

  def data
    families.map do |family|
      [
        link_to(product.name, product),
        h(product.category),
        h(product.released_on.strftime("%B %e, %Y")),
        number_to_currency(product.price)
      ]
    end
  end

  def products
    @products ||= fetch_products
  end

  def fetch_products
    families = Family.order("#{sort_column} #{sort_direction}")
    families = families.page(page).per_page(per_page)
    if params[:sSearch].present?
      products = families.where("name like :search or category like :search", search: "%#{params[:sSearch]}%")
    end
    products
  end

  def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[name category released_on price]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end
end