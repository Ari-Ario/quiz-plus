
// set the dimensions and margins of the graph
const margin = {top: 20, right: 30, bottom: 40, left: 90},
    width = 460 - margin.left - margin.right,
    height = 400 - margin.top - margin.bottom;

// append the svg object to the body of the page
const svg = d3.select("#beliebte-themen-chart")
  .append("svg")
    .attr("width", width + margin.left + margin.right)
    .attr("height", height + margin.top + margin.bottom)
  .append("g")
    .attr("transform", `translate(${margin.left}, ${margin.top})`);

// Parse the Data
d3.csv("https://raw.githubusercontent.com/holtzy/data_to_viz/master/Example_dataset/7_OneCatOneNum_header.csv").then( function(data) {

  // Add X axis
  const x = d3.scaleLinear()
    .domain([0, 13000])
    .range([ 0, width]);
  svg.append("g")
    .attr("transform", `translate(0, ${height})`)
    .call(d3.axisBottom(x))
    .selectAll("text")
      .attr("transform", "translate(-10,0)rotate(-45)")
      .style("text-anchor", "end");

  // Y axis
  const y = d3.scaleBand()
    .range([ 0, height ])
    .domain(data.map(d => d.Country))
    .padding(.1);
  svg.append("g")
    .call(d3.axisLeft(y))

  //Bars
  svg.selectAll("myRect")
    .data(data)
    .join("rect")
    .attr("x", x(0) )
    .attr("y", d => y(d.Country))
    .attr("width", d => x(d.Value))
    .attr("height", y.bandwidth())
    .attr("fill", "#b7bded")

})




function drawGraph(){

var margin  = {top: 20, right: 20, bottom: 100, left: 60},
        width   = 600 - margin.left - margin.right,
        height  = 400 - margin.top - margin.bottom,
        x       = d3.scale.ordinal().rangeRoundBands([0,width], 0.5),
        y       = d3.scale.linear().range([height,0]);

//draw axis
    var xAxis   = d3.svg.axis()
        .scale(x)
        .orient("bottom");
	var yAxis   = d3.svg.axis()
        .scale(y)
        .orient("left")
        .ticks(5)
        .innerTickSize(-width)
        .outerTickSize(0)
        .tickPadding(10);

 var svg     = d3.select("#testGraph")
        .append("svg")
        .attr("width", width + margin.left + margin.right)
        .attr("height", height + margin.top + margin.bottom)
        .append("g")
        .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

d3.json(topics, function (data)
    {
        x.domain(data.map(function (d)
        {
            return d.topic;
        }));

        y.domain([0, d3.max(data, function (d)
        {
            return d.anzahl;
        })]);

        svg.append("g")
            .attr("class", "x axis")
            .attr("transform", "translate(0, " + height + ")")
            .call(xAxis)
            .selectAll("text")
            .style("text-anchor", "middle")
            .attr("dx", "-0.5em")
            .attr("dy", "-.55em")
            .attr("y", 30)
            .attr("transform", "rotate(0)" );

        svg.append("g")
            .attr("class", "y axis")
            .call(yAxis)
            .append("text")
            .attr("transform", "rotate(-90)")
            .attr("y", 5)
            .attr("dy", "0.8em")
            .attr("text-anchor", "end")
            .text("Word Count");

        svg.selectAll("bar")
            .data(data)
            .enter()
            .append("rect")
            .style("fill", "orange")
            .attr("x", function(d)
            {
                return x(d.topic);
            })
            .attr("width", x.rangeBand())
            .attr("y", function (d)
            {
                return y(d.anzahl);
            })
            .attr("height", function (d)
            {
                return height - y(d.anzahl);
            });
		
})
console.log("testGraph")

}


drawGraph()