### A Pluto.jl notebook ###
# v0.20.3

using Markdown
using InteractiveUtils

# This Pluto notebook uses @bind for interactivity. When running this notebook outside of Pluto, the following 'mock version' of @bind gives bound variables a default value (instead of an error).
macro bind(def, element)
    #! format: off
    quote
        local iv = try Base.loaded_modules[Base.PkgId(Base.UUID("6e696c72-6542-2067-7265-42206c756150"), "AbstractPlutoDingetjes")].Bonds.initial_value catch; b -> missing; end
        local el = $(esc(element))
        global $(esc(def)) = Core.applicable(Base.get, el) ? Base.get(el) : iv(el)
        el
    end
    #! format: on
end

# ╔═╡ 2b55dfeb-d53d-4662-bcad-bab4cf66cb6c
begin
using Pkg
Pkg.activate()
using PlutoUI
end

# ╔═╡ cfd1ae65-cd64-40a5-8312-69b98515b5fc
# ╠═╡ show_logs = false
using PlotlyJS

# ╔═╡ 16a54e9f-ac7b-4844-bcd2-0de918269ed2
using PlutoPlotly

# ╔═╡ f95b670b-92db-4a13-8629-667ab2816941


# ╔═╡ 03f5b981-7832-4f69-915d-2e7cfb72aba1
@bind x Slider(1:100)

# ╔═╡ 6c870db2-7520-464d-9a75-ebe55c883a02
let
p = Plot(
    indicator(
        mode = "gauge+number+delta",
        value = x,
        domain = attr(x= [0, 1], y= [0, 1]),
        title = attr(text= "Ток якоря", font= attr(size= 24)),
        gauge = attr(
            axis= attr(range= [0,100], tickwidth= 1, tickcolor= "darkblue",dtick=10,tickfont=attr(size=18)),
            bar= attr(color= "darkblue"),
            bgcolor= "white",
            borderwidth= 2,
            bordercolor= "gray",
            steps= [
                attr(range= [0, 75], color= "lightgreen"),
                attr(range= [75, 90], color= "yellow"),
				attr(range= [90,100], color= "red")],
            threshold= attr(
                line= attr(color= "pink", width= 4),
                thickness= 0.75,
                value= 99
            )
        )
    ),
    Layout(paper_bgcolor = "lavender", font = attr(color= "darkblue", family= "Arial"))
)
PlutoPlot(p)
end

# ╔═╡ Cell order:
# ╠═f95b670b-92db-4a13-8629-667ab2816941
# ╠═2b55dfeb-d53d-4662-bcad-bab4cf66cb6c
# ╠═cfd1ae65-cd64-40a5-8312-69b98515b5fc
# ╠═16a54e9f-ac7b-4844-bcd2-0de918269ed2
# ╠═03f5b981-7832-4f69-915d-2e7cfb72aba1
# ╠═6c870db2-7520-464d-9a75-ebe55c883a02
