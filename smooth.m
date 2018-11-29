function path_smooth = smooth(path,vertices,map)
%光滑方法：从起点往前找
% path = fliplr(path);
path_smooth =path(end);
tmp_point = vertices(1,:);
while true
    l_p = length(path);
    for i=1:l_p
        vec = vertices( path(i),:) - tmp_point;
        vec_dir = vec/norm(vec);
        or_reduce = is_add_in_veritces(map ,vertices(path(i),: ),tmp_point,vec_dir,60);
        if or_reduce==1 %可缩减
           path_smooth = [path_smooth, path(i)];
           tmp_point = vertices(path(i),: );
           break;
        else
            continue;
        end
    end
    vec_goal = vertices(end,:) - tmp_point;
    goal_dir = vec_goal/norm(vec_goal);
    or_goal = is_add_in_veritces(map , vertices(end,: ),tmp_point,goal_dir,60);
    if or_goal==1  %可以与目标点连接
        path_smooth = [path_smooth, path(1)];
        break;
    else
        ind_path = find(path==path(i));
        path=path(1:ind_path);
    end
end

end
