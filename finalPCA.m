eatmat = csvread('test.csv');
noneatmat = csvread('testNonEating.csv');
 [coeff,score,latent]=pca(transpose(eatmat));
 [coeffNE,scoreNE,latentNE]=pca(transpose(noneatmat));
 covariance=cov(eatmat);
 covarianceNE=cov(noneatmat);
 [eig_vect,eig_val] = eig(covariance);
 [eig_vectNE,eig_valNE] = eig(covarianceNE);
 pcca1 = eatmat * eig_vect;
 eig_val1=sort( diag (eig_val), 'descend' );
eig_val=sort( diag (eig_val), 'descend' );

eatbar=bar(eig_vect,'b');
hold on
noneatbar=bar(eig_vectNE,'r');
set([eatbar,noneatbar],'Linewidth',2);
disp("the pca for eating is ")
disp(pca(transpose(eatmat)));