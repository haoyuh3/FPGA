/**
 * @file graph_tools.cpp
 * This is where you will implement several functions that operate on graphs.
 * Be sure to thoroughly read the comments above each function, as they give
 *  hints and instructions on how to solve the problems.
 */

#include "graph_tools.h"
#include <stack>

/**
 * Finds the minimum edge weight in the Graph graph.
 * THIS FUNCTION IS GRADED.
 *
 * @param graph - the graph to search
 * @return the minimum weighted edge
 *
 * @todo Label the minimum edge as "MIN". It will appear blue when
 *  graph.savePNG() is called in minweight_test.
 *
 * @note You must do a traversal.
 * @note You may use the STL stack and queue.
 * @note You may assume the graph is connected.
 *
 * @hint Initially label vertices and edges as unvisited.
 */
int GraphTools::findMinWeight(Graph& graph)
{
    /* Your code here! */

    vector<Vertex> v=graph.getVertices();
    vector<Edge> e=graph.getEdges();
    for(Vertex i:v){
        graph.setVertexLabel(i,"UNEXPLORED");
    }
    for(Edge j: e){
        graph.setEdgeLabel(j.source,j.dest,"UNEXPLORED");
    }
    Edge min_edge=e[0];
    for(Vertex i:v){
        if(graph.getVertexLabel(i)=="UNEXPLORED"){
            min_edge = std::min(min_edge, DFS(graph, i));
        }
    }
    graph.setEdgeLabel(min_edge.source,min_edge.dest,"MIN");
    return graph.getEdgeWeight(min_edge.source, min_edge.dest);
}

/**
 * Returns the shortest distance (in edges) between the Vertices
 *  start and end.
 * THIS FUNCTION IS GRADED.
 *
 * @param graph - the graph to search
 * @param start - the vertex to start the search from
 * @param end - the vertex to find a path to
 * @return the minimum number of edges between start and end
 *
 * @todo Label each edge "MINPATH" if it is part of the minimum path
 *
 * @note Remember this is the shortest path in terms of edges,
 *  not edge weights.
 * @note Again, you may use the STL stack and queue.
 * @note You may also use the STL's unordered_map, but it is possible
 *  to solve this problem without it.
 *
 * @hint In order to draw (and correctly count) the edges between two
 *  vertices, you'll have to remember each vertex's parent somehow.
 */

int GraphTools::findShortestPath(Graph& graph, Vertex start, Vertex end)
{
    queue <Vertex> q;
	unordered_map <Vertex, Vertex> map_P;
    vector <Edge> edges = graph.getEdges();
	vector <Vertex> vertices = graph.getVertices();
    //initialize all the edges and vertex
	for(size_t i = 0; i < vertices.size(); i++){
        graph.setVertexLabel(vertices[i], "UNEXPLORED");
    }
	
	for(size_t i = 0; i < edges.size(); i++)
	{	
		graph.setEdgeLabel(edges[i].source, edges[i].dest, "UNEXPLORED");
	}
	
	q.push(start);
	graph.setVertexLabel(start, "VISITED");	
	while(!q.empty())
	{
		Vertex w = q.front();
		q.pop();
		vector <Vertex> adj_v = graph.getAdjacent(w);
		for(size_t i = 0; i < adj_v.size(); i++){
			if(graph.getVertexLabel(adj_v[i])=="UNEXPLORED"){
                graph.setVertexLabel(adj_v[i],"VISITED");
				graph.setEdgeLabel(w, adj_v[i],"DISCOVERY");
				//mark the  prevouse vertex
				pair<Vertex, Vertex>pairVertex (adj_v[i], w);
				map_P.insert(pairVertex);

				q.push(adj_v[i]); 
			}
			else if(graph.getEdgeLabel(w, adj_v[i]) == "UNEXPLORED"){
				graph.setEdgeLabel(w, adj_v[i], "CORSS");
			}
		}
	}
	int dis = 0;
	while(start!=end){
		graph.setEdgeLabel(end, map_P[end], "MINPATH");
		end = map_P[end];
		dis++;
	}
	return dis;	
}



Edge GraphTools:: DFS(Graph& graph, Vertex start){
    Edge min_edge;
    std::stack<Vertex> s;
    graph.setVertexLabel(start,"VISITED");
    s.push(start);
    graph.initSnapshot("myDFS");

    while(!s.empty()){
        Vertex cur=s.top();
        s.pop();
        for (Vertex w : graph.getAdjacent(cur)){
            if(min_edge.weight==-1){
                min_edge=graph.getEdge(cur,w);

            }else{
                min_edge=std::min(min_edge,graph.getEdge(cur,w));
            }
            if(graph.getVertexLabel(w)=="UNEXPLORED"){
                graph.setEdgeLabel(cur, w, "DISCOVERY");
				graph.setVertexLabel(w, "VISITED");
				s.push(w);

            }
            else if (graph.getEdgeLabel(cur, w) == "UNEXPLORED") {
                graph.setEdgeLabel(cur, w, "BACK");
			}

        } 
    }
    return min_edge;
}
// Edge GraphTools::BFS(Graph& graph, Vertex start) {
// 	Edge minEdge;
// 	std::queue<Vertex> q;
// 	graph.setVertexLabel(start, "VISITED");
// 	q.push(start);

// 	graph.initSnapshot("myBFS");

// 	while (!q.empty()) {
// 		//graph.snapshot();
// 		Vertex v = q.front(); q.pop();
// 		for (Vertex w : graph.getAdjacent(v)) {
// 			// if minEdge is still the default, set it to this edge,
// 			// otherwise update only if this edge is lower weight
// 			if (minEdge.weight == -1) minEdge = graph.getEdge(v, w);
// 			else minEdge = std::min(minEdge, graph.getEdge(v, w));

// 			// for each unexplored neighbor, mark a discovery edge and
// 			// add the neighbor to the traversal queue
// 			if (graph.getVertexLabel(w) == "UNEXPLORED") {
// 				graph.setEdgeLabel(v, w, "DISCOVERY");
// 				graph.setVertexLabel(w, "VISITED");
// 				q.push(w);
//                 //graph.snapshot();
// 			}
// 			// if the neighbor is explored, but the edge is not,
// 			// mark a cross edge
// 			else if (graph.getEdgeLabel(v, w) == "UNEXPLORED") {
// 				graph.setEdgeLabel(v, w, "CROSS");
// 			}
// 			// if the neighbor and edge are both marked, do nothing.
// 		}
// 	}
// 	return minEdge;
// }


/**
 * Finds a minimal spanning tree on a graph.
 * THIS FUNCTION IS GRADED.
 *
 * @param graph - the graph to find the MST of
 *
 * @todo Label the edges of a minimal spanning tree as "MST"
 *  in the graph. They will appear blue when graph.savePNG() is called.
 *
 * @note Use your disjoint sets class from MP 7.1 to help you with
 *  Kruskal's algorithm. Copy the files into the libdsets folder.
 * @note You may call std::sort instead of creating a priority queue.
 */
void GraphTools::findMST(Graph& graph)
{
    /* Your code here! */
    vector<Vertex> vectries=graph.getVertices();
    vector<Edge> Edges=graph.getEdges();
    std::sort(Edges.begin(),Edges.end());
    //sort the edges
    size_t MST_e=0;
    DisjointSets MST;
    MST.addelements(vectries.size());

    for(Edge i:Edges){
        int source_l=-1;
        int dest_l=-1;
        //find the specific vertex
        for(size_t j=0; j< vectries.size();j++){
            if(i.dest==vectries[j]) dest_l=j;
            if(i.source==vectries[j])source_l=j;
            if(dest_l>=0 && source_l>=0) break;
        }
        if(MST.find(source_l)!=MST.find(dest_l)){
            
            MST.setunion(source_l,dest_l);
            graph.setEdgeLabel(i.source,i.dest,"MST");
            MST_e++;

        }else{
            graph.setEdgeLabel(i.source,i.dest,"UNEXPLORED");

        }
        if (MST_e >= vectries.size() - 1) break;
    }
}

