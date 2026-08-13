Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744C4471CF8
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 16:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786637171; cv=none; b=pR6i2IxAcCdU8/MQ8lG8thBnGLuq1NBu70Lj/XNQxOhLNCU7wUsminZlu9pLXkdUH16pKk+MpZt2DVWyq2SHjQcVLw4DtNZZA0ApZwofBwACmzZ0BEr05Tngj/Vwf5mWrM0FkGnV+6nRTpbXBjtYDFifAEepv2D+Kv0aAfncky0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786637171; c=relaxed/simple;
	bh=3A8s4FWLqJUb3Sqf6EsETRqj1s05lDQHiJ92Tii2Gkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kULs3h6IxROBSkC8A9odGxLBvezRRxFo7e9nwp/6XHtMb7KUug9Vub6Jq05NukfTp60OrANOGIvQPvpnzMXciOz/60/dZ+VA2I4BQ7EVJvmk10aw4B9f4O02sKFJgYUKrYyuKQkgBNzX2gwAII/XGWtQqDBwuvnf/ULqJ1Q8UI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KsiAbc8U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WrM/LZQm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KsiAbc8U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WrM/LZQm"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DFqsKJ3180711
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 16:06:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Z5QCS0LzCMHdHChJ5cMNSJzL
	+k+DFOwJ1h+R1Nhv55U=; b=KsiAbc8Uwz4mH7stLfth8VXzuLzjErnh4VjhhRao
	hqrO1R6cEjgn/O7r4pri85qHNOSc+HxpvwUnE2JsSznAg6ntVzFSrXcilzJvKsWe
	H+hToNJXChGh3TkUVDmEsFSxQDvoe8nZTsKZwTUrUsJMTRwU4MFxIR4YDJ1w27sn
	y1K8LInj75lKHp2T/2SJEjxggf+JiHiBoLej5/tmxhUy2ZXA6ixuCJYJb7FcfYA+
	mRdKcUhBkBHgg95lEROF35MxUUIRZp+RkhgJrdzeMHjlAPdNN2WgCOmddQyD0u8a
	uR3jSaGCvLNLCbrApqcFogUdKhdxPhXWoByN6o3Fr9Yh+w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1gy4r23m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 16:06:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52769fc3f2eso1272821cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Aug 2026 09:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786637169; x=1787241969; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z5QCS0LzCMHdHChJ5cMNSJzL+k+DFOwJ1h+R1Nhv55U=;
        b=WrM/LZQmTn2+S1TOfV9n2AIimO37V5ghFB6zXmzkITBPGz10soUi85idsNgi4Cq0RV
         mbXkG3YSWiGOiLCk9yDW1KfvShcbMW2yXJcKWXB8C4PaU5AF8YUYhyoZnMmP7Qg8PArw
         e9wFBrzTXsrgFuoq1YqxA3FRdgeX6Ob6kmsdHdl5LCE5wdzNTGjSVbfZKEarUq3zJvVl
         Dvp9RaiMtbSn+cAqoZdTPsP8iK+srceD6u2fHiRlk8EiVlYrklYEIQfHv/IjntsQvpCv
         0N7PjGQatc55lLjo0A8CWpdq0ICduG6ghuSNMktnnbFLaSMeYi5e5JtPtfv/J9/vdLx/
         l8Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786637169; x=1787241969;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z5QCS0LzCMHdHChJ5cMNSJzL+k+DFOwJ1h+R1Nhv55U=;
        b=ItQjrVtp4mkAynNOQgDehy+e4zB257X59SU2kz0SeS18ccJYj6dZEuZ/6eLC0s6Ymn
         XmcDFK+RCb3CDDSHIMlZdZZKNFgxExOWuK5udUhU9xabZJu9jRzj5oXVNJ6kW+PG6znr
         nCA7npj1KCUdPdneqpsHOsZQa3utf+7etK8nP3DRBhRRiT7W1yIPPue3dwDZSkIzAaCH
         KxtfX3gTlEZYx7tWOrzz5m3JeKzRv9IAzLIqQanw8NIoFPANhjIBH9lgkpHjAf2ennkC
         CJp7ja48X3G5CqPpT65pwJyXey2FG8nTKkse+JJ9nPbgGXas/GsPF5q8julVKnQLIS18
         QFxQ==
X-Forwarded-Encrypted: i=1; AHgh+RqJIxnpCedG7q3bKUFBt4Y1OwJM/qeisMJPYzCiRynquhou07b7zei0rFNzMOmEKWJ6BYWMgzlxOwZr0PqF@vger.kernel.org
X-Gm-Message-State: AOJu0YwFGYgMgAv0zh3gj8Y0WCG2lt4yJCuy5C2x3AqRR6axwkXshosf
	hzSRLy1aHDDEL8RAijFU10tsrehz7EKaUFoFRrYWJrh3Zm88f5ykx5U7FxYjMFdoFUBfpoyBloj
	kgIHdRAxz6BMoirCB2lKJAkY+e07P/MRtCkVB9RHN+w+wkM0MDUTAZjcIarMLCDOT/YDF
X-Gm-Gg: AR+sD11FVUAu9jYFvyZIqs05NsN62DBymE0tIEINPjUvemAiupn7oTsNpEPoI1qIW0Q
	o+jW4RBzeC8vmqTuC2Gdx7gulr8SIKnEeUKrOUq7rovkG2YX9u8+IMI+I8BVQcUHIipSPXCOHGZ
	pOm/RP97Uhyu+rFSwXBuqNYtPBzI/xoLkod/yVYTtmTtaJpfWJdZV03TFsYiZpZ7YldGOyIwhs2
	MJaMMKCj9kInfFsdkRePcgCVLBDRVTeWKGtDFPEZIrXlpS6LnT1ArflldztPIbtGAre7z8rh5av
	CtBLDZ+QpKC62fKANl+BPEO0lqOz/9naUMzCQEh2mgTnFciYQOY8Dj9nASpZHPjwWZgmEiQQxxJ
	kyFMSsYgUMxGV+4nguxh2ajrIKK2S6IujTfg9zoe63Gv3PbtguDQoya0JdhhktA2E2i1L+j91bm
	0efGPI2bcidbgF
X-Received: by 2002:a05:622a:4818:b0:50d:9e8d:9837 with SMTP id d75a77b69052e-52d73c0f303mr76159011cf.11.1786637168639;
        Thu, 13 Aug 2026 09:06:08 -0700 (PDT)
X-Received: by 2002:a05:622a:4818:b0:50d:9e8d:9837 with SMTP id d75a77b69052e-52d73c0f303mr76157761cf.11.1786637167971;
        Thu, 13 Aug 2026 09:06:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a130cd9086sm359111fa.23.2026.08.13.09.06.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:06:06 -0700 (PDT)
Date: Thu, 13 Aug 2026 19:06:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
Subject: Re: [PATCH 5/6] arm64: dts: qcom: sm8750-mtp: Enable Adreno 830 GPU
Message-ID: <ewc7lex7wi6g7ukq6xijieikuq3saw34b3hezfbr5776zmgxcc@upndudhd2bvb>
References: <20260809-pakala-gpu-v1-0-207ad1fac1c7@oss.qualcomm.com>
 <20260809-pakala-gpu-v1-5-207ad1fac1c7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260809-pakala-gpu-v1-5-207ad1fac1c7@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: CsnBGERXUuI4n_yE6FTYNnLYjBYJ-MAL
X-Authority-Analysis: v=2.4 cv=ZYAt8MVA c=1 sm=1 tr=0 ts=6a7deb71 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=UQAiW8fk4jwks4S4FoYA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDExNSBTYWx0ZWRfX3+xxZmls1PPV
 JmHORugavqSQx2JmYt54JgCiRc4Jx1J18xXzwjUcxshTWSN5h2JzoBftzJiYN0HGZPTXLB6pMsP
 XECVKyXCTL/yJWZXYBzgkC88wJhLE8k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDExNSBTYWx0ZWRfXxpb25pymEvhB
 9XYeuIifp6Vol7tNLZb6+uVUnBckCt8BOFF0R1r6pnnbJljncHVXi5vmshOBQZMpU+2Sw/AWUuq
 l6lmaIOi/8VUZQCmBQ5Dpy/xYBKgptVBYBYdLcapPGTPLYcVaxZKc+bYANOOee4V22GmvVqYgO+
 e1eyHjxP7g+YrKK6deHCt0bdK6YP9fwtV03wEpuaptxN1n/RZRx8bqTfgouEXmyn/002AniTuvT
 ytGWq6dfl33Xa72TtbWAtBdS1NEkB0x4eRYkJ573UVtLEzGMpP2io/YQIapsaApvUDFMIFWr2Ll
 lCR/ZKa/wrvdg97hIzHrK6IPyUvMsI/xFtDiiJOzhZhDU/PyO7OQ2lrOdE6DbOf4MtJxRi1Pj7I
 2k5S6RzT45s8M+EjVPgfSEGp/RE3bY23RTITcjzDApCAHAYh0t4irSMcLsRPZfiH0/17p3cZlQH
 8EdNpwHhV1uUJOTrIqg==
X-Proofpoint-GUID: CsnBGERXUuI4n_yE6FTYNnLYjBYJ-MAL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130115

On Sun, Aug 09, 2026 at 01:53:12AM +0530, Akhil P Oommen wrote:
> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
> 
> Enable GPU for sm8750-mtp platform and provide path for zap
> shader.
> 
> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
