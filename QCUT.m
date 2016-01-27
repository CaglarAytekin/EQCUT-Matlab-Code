function eigvec_now_2D=QCUT(H,smooth,PixNum, LabelLine,width, height)
[eigvec eigval]=eigs(sparse(H),1,'SM');
eigvec=abs(eigvec(:,1));

if smooth==0
    eigvec=eigvec.^2;
end

eigvec=mat2gray(eigvec);

eigvec_now_2D = sup2pixel( PixNum, LabelLine, eigvec );
eigvec_now_2D = reshape( eigvec_now_2D,width, height  );