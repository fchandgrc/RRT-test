
function path =find_path_node(edges)
%返回路径 ,path代表在顶点中的行数，返回的是行向量
e=edges(end,2);
path = edges(end,:);
while true
   ind= find(edges(:,1)==e);
    tmp_e = edges(ind,:);
    e=tmp_e(2);
    path=[path,e];
    if e==1
        break;
    end
end

end
