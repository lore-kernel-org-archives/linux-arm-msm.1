Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C704A68A7
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 12:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792155375; cv=none; b=rhrIOGMdh8l66tJObqwqIoo8y9itBjwF++QnsxVLzMTFZFlMD+i+WjI5A+z4S5mg/WHQDppR/meloBpoGFG2nfKKaRCN3fvP/QIFYbve5/Wl2kzcZqZ7mkhTcA+7M/Ut87ffUkbq/X4hJ0jwX7DEZstjQGB4lO5NZWwNkPvw+sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792155375; c=relaxed/simple;
	bh=Y6c9TJV5NBgC3Inpfz38sjLRG2sl6V1/vkLt/+r28F0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZapOY+Hxr3iYOEhjSlnfBtB2Gw8L92kk9LO3ZDRTgxjVqWrw6Mh8G7CQbO0rYzzs01fJqXlKdOsbpuIzNMiT6CiDMfLFzMKgB2Rzudv5AxXO+zhKANt9E9KzLopnQNQGDXY9NB3Hc3ht8UALByBrZJWrSAipO01nEAeZScwRTvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SPqgLoz0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hpAb0Ng2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SPqgLoz0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hpAb0Ng2"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAAIuj2998514
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 12:56:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5AeWBEFxL8OW2rqpw2rU9v/zxqIPkPc3rrlHLYBWX3I=; b=SPqgLoz0tGkjNBHk
	A1Fqggh0Av95qdVGg17CVDxSOU6/uo3GTcj4WopiE5y3VUcJZBMeOf0jEe9GWiEM
	pcyZTcZXeuWpBDiOtOfvO4xj95XJy0lizpSbd2aRPQFwwd88baJyWvhxNKATBGAP
	u//SW88UVOjx0PIZr46IVhO+kd0sxxEstIimZxMu4VY/ZX4mvZY+4M2dEFTcRWFd
	MfYiTToJoSsWWpMYwpv57QS62uHe6N3TFiSaCxnZsNpVcr74B4TZKTenLtG7KHY0
	LF/RbHYKGlW3R8vtUF18ckdDM0XnUQiXWT921xUHVTpHS/kriTxCY7ceiZLCzS7g
	VlGaNg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb8r12m36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 12:56:11 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c5aef2a74so9157586eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 05:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792155371; x=1792760171; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5AeWBEFxL8OW2rqpw2rU9v/zxqIPkPc3rrlHLYBWX3I=;
        b=hpAb0Ng2fcfEBt1TP/o4TUNI/1zXCyjHescXpBdLCNcgvnUxBYOFlU/IhwzruVsVxN
         FUL4uJDlxwOPNYE/ZILtK7CaQwamVjxDVjbYy8FN3cAVD00i85aOIiQMhSbpgCITgT5g
         Fh2JWzRHIbrk9pIHp8utQ93BxtvjlAPC8x62FcwmdqhTs3aPkMyeC0I0SwXU3stSj6SW
         3CUOxYZzm6xf2L1wFPkf41dxwiL566X7w8mM41v+pcQlY8lXqhMiwwRlriSq/SsUKDaY
         A9XsbA5Hw2al/mwXcebHNWfQRYHtNgDn0eaKTSw7kGTCOKT5/asRcuQwFxxmH4F41UFt
         SQvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792155371; x=1792760171;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5AeWBEFxL8OW2rqpw2rU9v/zxqIPkPc3rrlHLYBWX3I=;
        b=QBL20xXhJClDUBOphmZFYnhEfOD848f8jxf9XPVSNiw2fsH2IymTmtiyclguCNc/yx
         E7kabyUBgPCrDpHUZu+26qPl6Bxd+KDSw4KhcbjPwTmvxC/m6e1LNNuDFWvnugE7laTm
         I6Mq4SiwSvZIgtzX3PPUsJA6pJjWflvKRHjRI1uT1ZORBHqX8nBu2eOSDMgpWQ5nw5rD
         t3bu8ceeTPogqDdTbWi4UNcj74A1Xt4226hVpdXy6yNRewc0yeKjcejkPaktq25GD9mQ
         cBPM7I+aJJv2EJtlZHeUEH61mdWL9ST62IE0Sxh0A8gv85dEyreBwDNwwFq2O/49raRl
         5C+w==
X-Forwarded-Encrypted: i=1; AKwUvBxS/xnDJZwLpiBOjtM0XAb1SVzbYLVXhZY7rqeqkFqv9F2Gl0DYDJVqJQQgC4y0bAuBmRzxLmI3izUOnUO9@vger.kernel.org
X-Gm-Message-State: AFq9FYJEINKlnQFVm0ysY5F5kMgQZgwlH+Zma11s2vc7j0vYRigUiE1h
	FPFsUP4NNkl6IOKYTrsa0eQShXpogMAoEKWpLBCeZJkTvs6lZzoukjW/b8d7atMqLqWI54Zt5y2
	mToMelnGR6eS75Zxh2+zDiNFqHYzQKLdaqaQn5lB4cXnv8HOW2sfsOyxitN0WR60++yGC
X-Gm-Gg: AYBFou0t3VGGVKv6mjt4Cp2E3wPDqItwYd5+FP7MEBy76TIGM6LqkcATEQJrPe+am7d
	5wxag5XbbS5QAgXsj+k++mYfPiNOtYch0wtpbmTQkJ6ujQsUvZzn2q0Av+VDLX4AeTPGhRyx8+V
	QUoHSwrro8P0yhDcVHilWfJM6mTXxD65hecmqHF0sCzu+0BsK8BIIoDBMmFXUC0JoE3UUJCN+yA
	opRzzMDPtAaBaCXoPKJOQWYxmfvwKnD55VVcegPRE9LP222a7WWjHBRXyCfUFpLK6/H8CNZrtcl
	kKeVJY/g8BilwCZoiRmxUCjclDAafoq6qy6CgEsYcsIhxkYvb0ZV8cKhi1Dk6FgEdLHqUyHkqDi
	zFjes4yly3ZiWu5YDsu/Rm/QC9kI1HIU=
X-Received: by 2002:a05:7301:e10e:b0:35c:707b:acba with SMTP id 5a478bee46e88-35c707baed8mr14511623eec.3.1792155371200;
        Fri, 16 Oct 2026 05:56:11 -0700 (PDT)
X-Received: by 2002:a05:7301:e10e:b0:35c:707b:acba with SMTP id 5a478bee46e88-35c707baed8mr14511598eec.3.1792155370692;
        Fri, 16 Oct 2026 05:56:10 -0700 (PDT)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3607ee0d391sm7195899eec.4.2026.10.16.05.56.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 05:56:09 -0700 (PDT)
Message-ID: <c9d04672-0099-478c-a774-cfa4fbc2afdb@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 18:26:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/7] tee: qcomtee: Add support for registering QTEE
 services on TEE bus
To: Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-0-1460691b35d3@oss.qualcomm.com>
 <20261015-qcom_uefisecapp_migrate_qcomtee-v5-5-1460691b35d3@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20261015-qcom_uefisecapp_migrate_qcomtee-v5-5-1460691b35d3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Owyx2zPmHWNG5N0Dw9RvLXhEbKGBpX86
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1MSBTYWx0ZWRfX+wdRoh1gUXQC
 reKBUUBUep2Sioa2qHOSLgJLnVAbEx5SUNJPuoyCaLUz8ZjozuA0CRa9un2j3B5J3zykf2GAgbg
 dPsmP82HpFBohuqGUKLgTuvX9x9nIHo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1MSBTYWx0ZWRfX4l6eFEzCtkKJ
 XTtUX/xr/kU7rwq+qfOVc1XclU7JXb7zfiSrTg7ubGD4XAjVPUcvjA226IKgOcsUo8YO6V0JjRd
 jwHlove0CvMowebBvD4n3vLbtpUYOmFTIaydNIn6eymo7xnEr2L5YBtDyeolvfISx6jlcZChOzb
 f+MtV/lBdiCOxr+DgqCui3y1USFpfYLaTH9HnmnlBJtWWT/Be+Qq6X2g18Exm5nJ3iM3rXWcN1L
 sfjZl1G0eSwxp+z1Xou2kDLcQvmXOdP6NiICKRExAth7XAV0FenK4c9OtyzsmccFxVfvJiK3EKW
 k0y7QRclcRReJvw+abqfTOPuHmZysrxmqMb1WPR/B7EysE0IGtg523ONH/CIKYlUoZDSup8VjDQ
 w/kSj55FCAUhArfFIqh7VrKv+1g+4bfaZFZVr7ov0LP/e7LJfh+qfB5EPehVJLOB+SjQbjf6J6S
 +CyhqYQ3hZa+DaZgBWA==
X-Proofpoint-GUID: Owyx2zPmHWNG5N0Dw9RvLXhEbKGBpX86
X-Authority-Analysis: v=2.4 cv=L/CI0OT8 c=1 sm=1 tr=0 ts=6ad21eeb cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=7ituTzxtpmmrCW-Ko3oA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160051

On 15-10-2026 17:09, Harshal Dev wrote:
> QTEE exposes certain secure services implemented either within the QTEE
> kernel or via pre-loaded Trusted Applications (TAs). Such always-available
> services can be readily accessed by TEE client drivers via QTEE's
> object-IPC protocol if the service is registered as a device on the TEE
> bus.
> 
> One such service is the EFI-variables service, implemented by the
> uefisecapp TA which enables kernel clients to access EFI variables at
> runtime.
> 
> Maintain a static list of such always-available secure services and add
> support for the QCOMTEE driver to register these services as devices on
> the TEE bus during probe.
> 
> Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com> #on Glymur-crd

-- 
Regards
Kuldeep

