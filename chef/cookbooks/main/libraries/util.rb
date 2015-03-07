class Chef
  class Recipe
    def gui_packages?
      node[:gui_packages] || false
    end
  end
end

