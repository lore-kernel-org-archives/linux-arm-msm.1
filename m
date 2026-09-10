Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862BF47043E
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 15:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789052807; cv=none; b=Dd+uwwM2wXuKbVtr/Q2MFCgzxeKvBheBnf/q1gOGyG685wP3KiRsKHuKKXYpecKFOXcBy8wDNPqAVshjV+bgDs9ET01nkaaBL2wvEgSnuKJoNvwD/rqSqUSgKzCGPV8lXZv8z0rX2VpqHpdCx9G6GsP+7F6z4cLWmL2xeKkGJr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789052807; c=relaxed/simple;
	bh=HhKxfqZri4OGfPWO86TNfFiRawc8WRDx4wxR8ivdMMA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r+vZGWTq2YoA3rbGwRG4j2AcuQaYz/zT6utKFSXhWdEKZuH4EFRo078TVj5x4mtmebuTpUH2CSNWBdEFPxK+4diQ3W/RKVFr6XbA5vyVek24A1c7YG2s1A+RnCieAJ/TAI4eaoOBCcweR3/+4c2Oq+HFL4sgO8AjAhj1/HZYczU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DWMeiqBq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iwTofXjv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DWMeiqBq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iwTofXjv"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AF556W650750
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 15:06:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PkPrpuB/2JVj3QeHoZHTBk6+
	P5ZBHLDJoXGucnbPeZ0=; b=DWMeiqBqEHVh3r3sB6fUKU2AXhCac2u3sfAnj2dh
	/6caS+/4QyoMpgUoqOc2QVOc3zvRrHDuN1wO2YTZ46CiW2M11CQDEf1prnU4UgrN
	3owOi4eeco0GBjW9selJVxpLPdTCTfDfRzfFUtXg2lw/PHsBMVH0ilToDhW3N/WB
	Si62Mf/bHaxrRjk4LKrluxGrlZrAN3SiZnTEkcY+j67SRlwduRyRJtatCYXd7UZi
	9uUZ46h4t1Kmkooub0tJkgEWKcaabuRluLlx5xbaxguagD4H+4eEP+CybNEvQoii
	U/68grNkRbZSicAeVN6/e8dJrxvywGZEDcoklGSAUpoqWw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkxv780w6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 15:06:40 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-396901263b6so13288059a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 08:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789052794; x=1789657594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PkPrpuB/2JVj3QeHoZHTBk6+P5ZBHLDJoXGucnbPeZ0=;
        b=iwTofXjvi1eeO8dwVvyj4RLo+d57HVMKRXmi7/4r0lXWgDww9q86cTXKrRDOQ6EyKP
         OToFheiLGtc6IHBep1btGp2yx3oEvB5zOb8opjS1hQkqEzs7JhDmUNK8DrsXqYJtx0eD
         H24XS79xy9h8qycz6/TF0en74Tgxx0426cMOAfJiE84N0kvHoOxrLaaqp89KQgbXWm2P
         KMHA2CyoPlWBF4AIMTJE63UoXGmoQs30G5y+Jvn9pGMHAtCxQcwT2yseXuqzLFUIk3WV
         P4+P+hm39mx/KOzmvirbHYG91bZFTYNTjXCumto/f96EN5S553yzkRnlAwd+TZL6GGKS
         hW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789052794; x=1789657594;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PkPrpuB/2JVj3QeHoZHTBk6+P5ZBHLDJoXGucnbPeZ0=;
        b=LP9opgN9s7Ghmb8TSEi5HfvH6cG04KYC/Jia7XeEKC0DguNRRc7ibTI0D/855dY1Sx
         4tQUT33EEHa6TpmFpHz06XMhNxGztMIdP8DgP43FNA6XR4Nux5DwgjYVaSjdHod8hveE
         QZ8BjfrdiYGNca0jIyQsPANqy0I9xKk+0aF70XeqvtWO4S5Mi6GlgzoghER4qKxi/aGn
         M/++gmVnR9mOeqqBUAwNw/Ba9GAWw6YrKRm1+5atp2+GBfK+RbJUS9h+9OC+0q1D8mCq
         3urS38Lm0anvgPYEcIQCPaIdK0Gm40AVi1kLAWeQC6bX7fl2Rutn68EvrJMbi0/QXT26
         8uFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxhsx7TZNdaUIfShwLLaJybJlqNgdtLcDM7FM2Zdfhsb7Ex0MtMkGSyyOC1Hd48xNBYLk/1stPqaKyDt+Hq@vger.kernel.org
X-Gm-Message-State: AFuF++laMPglT+G6n9th5rS0LbqVCImHecLtdn1jsAO1dlxqnIcWKWo8
	ybpAbjZ+u92QZn5cToL8TV5B383hC4JxOk6+j4zrkK5d0+0nxZvetepFGJeibGCdIBqirtPruqm
	mi7QzccFAFlf6i0zAIsj8T+rJXwsixqCNK0MxCQGZqVrqSGjN10Gn2ZDFDIc022Cw07F7
X-Gm-Gg: AYBFou1A1lsJcodoH5+OndVh2oBhatzX/hTwyvrMM99V5cjlmnC3BzXrndjmNoqMAjJ
	WPpyvjKMR+ZAUeLtuDlndieaiBihCDvY1ML2xUiiUfR3FiGvDGD16p3qGKbGnJcpsCQkE447esT
	CV+aprgG2+MBSA0Bs8D2IHwQsYsnaeFur42zQYWGdm4JsxXF7kcD4/Wx4Cy16Qpp9bItPR/kfD7
	bc/8yhzxHyH5QXGazamYrRk/Te8JrE7FYTv4ShRWj8lEoVt5Av0I7BY2mixMqhz3JKUt2OsU6UA
	D9M1MJ1AZ+GNqRfsaT3SVujRl4Nb7CgbigRwHUiUqM7K2/yzkJDhDQJ3o9su4aqjqhP1v2rjmdP
	2PD1XX1fS/kokR0fnqrcGi54lJlY=
X-Received: by 2002:a17:90b:17c2:b0:398:9be8:ea6a with SMTP id 98e67ed59e1d1-39bac4571cfmr18020018a91.23.1789052793747;
        Thu, 10 Sep 2026 08:06:33 -0700 (PDT)
X-Received: by 2002:a17:90b:17c2:b0:398:9be8:ea6a with SMTP id 98e67ed59e1d1-39bac4571cfmr18019875a91.23.1789052792935;
        Thu, 10 Sep 2026 08:06:32 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm47578520c88.3.2026.09.10.08.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:06:32 -0700 (PDT)
Date: Thu, 10 Sep 2026 20:36:25 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 2/3] dt-bindings: remoteproc: qcom,sm8550-pas: make
 qcom,hawi-cdsp-pas standalone
Message-ID: <20260910150625.6sqdwduft5ccflv4@hu-mojha-hyd.qualcomm.com>
References: <20260909105049.1317985-1-mukesh.ojha@oss.qualcomm.com>
 <20260909105049.1317985-3-mukesh.ojha@oss.qualcomm.com>
 <ff7a5250-d026-45ba-866b-f92302e3c87d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff7a5250-d026-45ba-866b-f92302e3c87d@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE4MiBTYWx0ZWRfXzQEE4At7/pHP
 QaktUHpvcfT/GGYWwYM2BVQM+um/B+dFJ9w3Tena8l4oK08M1/xxemobltFxYzzPjbz5eTYtiPs
 RN2x/x6r4UDD1/C9WZhOkr7vPzUeQOU=
X-Proofpoint-GUID: ots0mMSgLVlTc-C968ABwIdQXv_En9nh
X-Authority-Analysis: v=2.4 cv=FPSOVOos c=1 sm=1 tr=0 ts=6aa2c780 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=LBkXyKVgYJf2stFOIyoA:9 a=CjuIK1q_8ugA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE4MiBTYWx0ZWRfX/Rm+AYsPnPpQ
 6Dlvd7BB9MlVh2jo8lGvLEbhn0ssv7Gazs8RPzcw2MP5T8n1Tq0ysPDQVXzupsqLNQpeEwHp0o5
 stNa1cdYoWLtNpcBqOTOmH5HqX1krKqPsIgitjluCNfix31KkmvxRpDgMF934usA7nRXdq7LOrY
 C5BTk2A1Or94UGqGQBB10Z9YNFBgNGiDEffd1sco07tVYLHXsrLu5vdRvYfPZrauVLu3a2hPRIy
 rv2YI1ag6zMIIcsx+Ga1r+9I8NWxr3eqnvpkSIWMKIPzwLk1+Yrl20FYMOvAhhO+czMJfa1DzDp
 nYT0y1djClwX4oJSMMtY8gE6M98pDkRwO4FeouSSqW+EedgxoSaxxCYJYUDwFvS/AnMCUZVCEGL
 /pgEuZX0XJ9eePpzMGbpxdTdmicUx3XXdak0RUP1BEJJJ+EgjsXLjGbVJ6H5nZzu6UD7DtIHmYV
 1zfZIEOZNksEeBDNVKA==
X-Proofpoint-ORIG-GUID: ots0mMSgLVlTc-C968ABwIdQXv_En9nh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_05,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100182

On Thu, Sep 10, 2026 at 12:26:21PM +0800, Yijie Yang wrote:
> Maili faces the same issue, and I have verified that they share the same
> fix. Please bundle the Maili binding changes into the next version of this
> patch series.
> 

Sure.

- 
-Mukesh Ojha
