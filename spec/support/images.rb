# Helper function to open product images
def open_asset(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end

def open_asset_detail(file_name)
  File.open(Rails.root.join('db', 'seed_assets', file_name))
end