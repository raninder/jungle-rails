module SalesHelper
	def active_sale?
		# Sale.where("sales.starts_on <= ? AND sales.ends_on >= ?",
		# Date.current, Date.current).any?
	
		# active class method defined in model sale.rb
		Sale.active.any?
	end

end