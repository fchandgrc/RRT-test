function add_qnew = is_add_in_veritces(x,q_new,q_near,vector_dir,insert_p)
%�ж��Ƿ���뵽�б��У�q_new,��edges_new
%���:add_qnew=1���� 0������
%ע�⣺sub2ind,[y��,x��]=size(map),q_goal=[x��,y��]
%dist_new2near = norm(q_new - q_near);%�˴�������
%dist_gap = dist_new2near/insert_p;
ii =1:insert_p;
insert_point = repmat(q_near,insert_p,1)+ii'./insert_p* vector_dir;
insert_point =[floor(insert_point);q_new];
insert_num = sub2ind(size(x),insert_point(:,1),insert_point(:,2));
or =find( x(insert_num)<100 );
if ~isempty(or)
    add_qnew=0;
else
    add_qnew=1;
end

end