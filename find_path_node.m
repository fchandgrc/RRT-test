
function path =find_path_node(edges)
%����·�� ,path�����ڶ����е����������ص���������
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
