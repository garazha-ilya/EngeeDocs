using GenieFramework, PlotlyBase
using StippleUI

@genietools


trace = indicator(
    mode="gauge+number+delta",
    value=tx[1],
    domain=attr(x=[0, 1], y=[0, 1]),
    title=attr(text="Ток якоря", font=attr(size=24)),
    gauge=attr(
        axis=attr(range=[0, 100], tickwidth=1, tickcolor="darkblue", dtick=10, tickfont=attr(size=18)),
        bar=attr(color="darkblue"),
        bgcolor="white",
        borderwidth=2,
        bordercolor="gray",
        steps=[
            attr(range=[0, 75], color="lightgreen"),
            attr(range=[75, 90], color="yellow"),
            attr(range=[90, 100], color="red")],
        threshold=attr(
            line=attr(color="pink", width=4),
            thickness=0.75,
            value=99
        )
    )
)
layout = PlotlyBase.Layout(paper_bgcolor="lavender", font=attr(color="darkblue", family="Arial"))



@app begin
    @in x = 0.0
    @out plot_data = [trace]
    @out plot_layout = layout
    @onchange x begin
        plot_data = [indicator(
            mode="gauge+number+delta",
            value=x,
            domain=attr(x=[0, 1], y=[0, 1]),
            title=attr(text="Ток якоря", font=attr(size=24)),
            gauge=attr(
                axis=attr(range=[0, 100], tickwidth=1, tickcolor="darkblue", dtick=10, tickfont=attr(size=18)),
                bar=attr(color="darkblue"),
                bgcolor="white",
                borderwidth=2,
                bordercolor="gray",
                steps=[
                    attr(range=[0, 75], color="lightgreen"),
                    attr(range=[75, 90], color="yellow"),
                    attr(range=[90, 100], color="red")],
                threshold=attr(
                    line=attr(color="pink", width=4),
                    thickness=0.75,
                    value=99
                )
            )
        )]
    end
end

function ui()
    [row(column(slider(1:1:100, :x), size=1)),
        row(plot(:plot_data, :plot_layout))]
end

@page("/", ui)