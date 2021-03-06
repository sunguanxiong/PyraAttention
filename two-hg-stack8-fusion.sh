#!/usr/bin/env sh
expID=mpii/two-hg-stack6-fusion #快照和日志文件将保存在checkpoints/$expID
dataset=mpii
gpuID=0 #编程所用GPU
nGPU=1 #所使用的GPU数量
batchSize=3
LR=4e-4
netType=two-hg-fusion #所使用的网络架构
nStack=6
nResidual=1
nThreads=8	# 使用多少个线程来加载数据
minusMean=true
nClasses=16
nEpochs=200
snapshot=5
nFeats=256
baseWidth=9
cardinality=4
isdebug=true
w_2=0.0025

CUDA_VISIBLE_DEVICES=$gpuID qlua main.lua \
	-dataset $dataset \
	-expID $expID \
	-batchSize $batchSize \
	-nGPU $nGPU \
	-LR $LR \
	-momentum 0.0 \
	-weightDecay 0.0 \
	-netType $netType \
	-nStack $nStack \
	-nResidual $nResidual \
	-nThreads $nThreads \
	-minusMean $minusMean \
	-nClasses $nClasses \
	-nEpochs $nEpochs \
	-snapshot $snapshot \
	-nFeats $nFeats \
	-baseWidth $baseWidth \
	-cardinality $cardinality \
    	-debug $isdebug \
	-w_2 $w_2
