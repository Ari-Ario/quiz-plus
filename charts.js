// set the dimensions and margins of the graph
const margin = { top: 20, right: 0, bottom: 40, left: 20 },
  width = 400 - margin.left - margin.right,
  height = 200 - margin.top - margin.bottom;

// append the svg object to the body of the page
const svg = d3
  .select("#beliebte-themen-chart")
  .append("svg")
  .attr("width", width + margin.left + margin.right)
  .attr("height", height + margin.top + margin.bottom)
  .append("g")
  .attr("transform", `translate(${margin.left}, ${margin.top})`);

// Parse the Data
d3.csv("beliebte-themen.csv").then(function (data) {
  // Add X axis
  const x = d3.scaleLinear().domain([0, 120]).range([0, width]);
  svg
    .append("g")
    .attr("transform", `translate(0, ${height})`)
    .call(d3.axisBottom(x))
    .selectAll("text")
    .attr("transform", "translate(-10,0)rotate(-45)")
    .style("text-anchor", "end");

  // Y axis
  const y = d3
    .scaleBand()
    .range([0, height])
    .domain(data.map((d) => d.Topic))
    .padding(0.1);
  svg
    .append("g")
    .call(d3.axisLeft(y))
    .selectAll("text")
    .style("fill", "#b7bded")

    .attr("transform", "translate(-10,30)rotate(90)");
  // .attr("transform", "translate(-10,0)rotate(0)");
  //Bars
  svg
    .selectAll("myRect")
    .data(data)
    .join("rect")
    .attr("x", x(0))
    .attr("y", (d) => y(d.Topic))
    .attr("width", (d) => x(d.Anzahl))
    .attr("height", y.bandwidth())
    .attr("fill", "#b7bded")
    .attr("class", "graph-hover");
});
