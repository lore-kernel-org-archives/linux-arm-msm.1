Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793483082;
	b=WLncjsNA5GhxLJJvSrqtJS9cJZdxAINW006eNFMctz7OcttqbbzMDU8pjPuTUV1qHKRi
	 bORBXX/zVoQ8ln2oMe3P6OuOnpwdXuZNfD4/oDI8suRrxan/Tv0rIJ8smuh0GvSGuDvnw
	 jFsWsDvbVxIHC+rt66lYJ8JoUTOpQl5MTWbO9TwRT09AXP1V0mS9kJPSRrqFAx2Ws5kO9
	 Uu+ZMmpQuNW1MG2cGD6TBFGdyRM6qDqRg52c81EIUdSqErXO6zxjxLWOki1bbZzJgprsX
	 TokO2cGBxgI7XS0YuLw9wL4d4Q1y1uK4h6jgWHMGUvlxtKTH36fsindyaPDpQEXoXGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793483082;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=G3WyDIFGwvzASNJI/Vjyj4QhfCstvrtuJBWM5WfABQc=;
	b=JcZjL086dRIpT7wsb7HeqLOPkL6lEgfFkRhKwQKomlQnv1M2Y0a1MPWGCil6Ae/smOmG
	 89fiklPjpfCRDRZug0QUrA2IvzMpJRGAWyxNbPxIFsepz9TOIC0l09jPeDmpR3zSxQr6X
	 +7YU7rw6x9dAqys4obVYBYyLRv8T47QMT/SKboWXgDwYwY3KpgqQU5ylquOdRTtfA+5zj
	 aU23+YTBPFYFUPRzmmfTLL8G7c2lHEnz22siz+4y/ywD3LIzB1d8Wxk9NRXm2nIdAMKnZ
	 Z6bhBPYIw0y44EXxemHDLP6INZ1j3x700JSavoIjfvM/vv2SXqW+GKl/0nZbsIEmLeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cfscsYbp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UT6Sitmm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521B7606A31A
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 21:44:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 521B7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cfscsYbp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UT6Sitmm
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VJEplf2968823
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 21:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=G3WyDIFGwvzASNJI/Vjyj4Qh
	fCstvrtuJBWM5WfABQc=; b=cfscsYbpsec9HVAUghcqDLk1GkfjoPRWcgsNbSdA
	B9hcnyI2MIKFlurfd9j0Xr4QDHssmu20XO0LiLSYWGpC7sHjGDiw1Yk8WvcQBysK
	6/EnIvKoZg3hLhhqCv8NRfdRVD2yGWHN4K+qLjENYbNY/gYmJi1kAysZ/KJzQsg4
	4D8DZ61LSUc1PDv+psXFJdfvsxplaIb7b7M9/6oUvl34It1OyXIq9rFukGiOzU0y
	EBkEhSsYmY3Z6ZxYkorIL7WMyqdNqj6Pw/PAKvt3xkL+RdgR15PDMAurujmFBskx
	qVd9Zp3OlmW1h5DQwz+aeaJOPItSCpvAcGK902Cw3k9OPg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn5pkjgxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 21:44:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1e62510cso420648485a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 14:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793483080; x=1794087880; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G3WyDIFGwvzASNJI/Vjyj4QhfCstvrtuJBWM5WfABQc=;
        b=UT6SitmmfMTjrmHFPLL5aDrV/T4PWs5ITVUV4L7V/EXnfAwufSb5vUmHtgAierwI1Z
         GKwPEVcjwBjGohmH0x7v7yswp8mA30INc0CG2zgH7frQz48SbeYwzKJliRnbGKpVN8ar
         Z1OtuaYBqzUvIH4N5cvDMyR/hUghhFQqG1yqFVX0W1zCpiZQUHeMCwHhOsPCI1V6tpe8
         LBy4x+JwNvKHyyKGP3pnZ55baJoekZh1bi7Qw5lpZ6OIdQn8HKcEGfdk4JeIWNWC0y9N
         1WrSzddehkd7CYqYeNCbXuoN/iEqUPoIE7qKksDREuItPLqWEQlW4a5ydwjkdQS0a9Zn
         hRjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793483080; x=1794087880;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G3WyDIFGwvzASNJI/Vjyj4QhfCstvrtuJBWM5WfABQc=;
        b=z9ZzQNCMAZye2XtAm1ZIg2vWuzIRn7IuAejv+SQwS5/TZn5Skxv7j2M7kHa/IfWklk
         23xCkxm+JjXqV1HJuym/0Ra79Uervr2ivL1mWZNMhdvgaGn9po6+sGgq64yZe8fyE1Z9
         0Aevq5+pEfZQ1yxuAYTNrDJDsF3I0qTKbVOrjwkbmmB4ZL7dJCDQvdcz/38q87GWpBJ9
         YIvhZbZFOyG3AbMoTKdvHFfCNhK+CmHfIj6eMTTNmfkuDJdJrw+hxEp5ZdLglTTlmbaC
         UyQWYSQM8KspdD+DA73IRqo0u4zjIaHi+Ag85k9dzXtnib4Z7BJmVc2o6LpIt53rRUiH
         yKKQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8KssvZqfsLVdz1wb9wa5E/wDbYhdLZBP6MEZbydQFI6kE8HDiADWfWTF7eLoFVwYPrbXtrMGn/1A6oxBV@vger.kernel.org
X-Gm-Message-State: AFq9FYKDW305FP0Fw+9aII/4FW3TLCN5fX6bg67ot7cqsCFlYBqsG0Kk
	bskT4+GtUUZjqxQmyivOzO6KLHSGAmuQ0DMCjZmFrjA4TWa43n63VL7DhG/Fb1BmsClLoVYK1OU
	3bg2vImlQEw4QVGHWXd9ycB+bj9YPiaAbi/owUH5BLq/Im/XPlbkbIf1iOgthxI1uW1IR
X-Gm-Gg: AYBFou2ZBFYUJULKoBzxYjt7j431F0pcx95ELJkggiAA+H09NWwbe04LW38VgLjHi+x
	g/hjVx2lTTaRMJowuA7zZ/sbT1HFW2cWX07Md4xvHgmadZDUM53eAqSG/0dc0bXsSlRLomkhJzL
	pyIU/ThTGnLBT1Vl68u9O0ztBvsEgpXP1wxTuldQMpL3WXGW9Vz0NgD6hx7lIBhxyqrWy8FFB3d
	92fpCYTPzLfO++nkAtEn8TLsQjkJawEQ1UKvCL+FcvfXSWWWwSTB6MLaOSYxciN6kU5fgwKQKyk
	p3HjFNP3NozR+otQFW9PMJBRpEQSixv6zGaJn89gtUEz/1xhkg9nK+1zX6F5f6y609+S1k8AYBS
	cOR+GZCIlFbcl9OUq5Sjwwn82yhZSDMEhhG5PnC4kEtbPc7wVDhIU+e1MsR2Ny7ECnt6AVbBAc7
	CiHzSQ4YgGHvldnrAR9Hf7pGgMapSCZhLHp/p/z6DUgUHv/4WqdcMbtcgV+x3zXA==
X-Received: by 2002:a05:620a:4720:b0:93c:2c15:e510 with SMTP id af79cd13be357-9442174eff2mr1120358485a.37.1793483080533;
        Sat, 31 Oct 2026 14:44:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4720:b0:93c:2c15:e510 with SMTP id af79cd13be357-9442174eff2mr1120355585a.37.1793483080047;
        Sat, 31 Oct 2026 14:44:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe074666csm760682e87.67.2026.10.31.14.44.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 14:44:38 -0700 (PDT)
Date: Sat, 31 Oct 2026 23:44:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ishu Brar <patches@brar.si>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] drm/msm/dpu: Add SM7250 support
Message-ID: <zmzl7btnsgzb7ywrescyvtuksu6edrch6i6i5euhy2ven7qmzx@xhgfspbq4q5t>
References: <20261031-dpu-sm7250-v1-0-159f403ec405@brar.si>
 <20261031-dpu-sm7250-v1-4-159f403ec405@brar.si>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261031-dpu-sm7250-v1-4-159f403ec405@brar.si>
X-Proofpoint-GUID: KMaL22sFoUNBkjaoT2g6s7zMLuSvXDmH
X-Authority-Analysis: v=2.4 cv=Z4F5j3RA c=1 sm=1 tr=0 ts=6ae66149 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=Jal6vLO4qNuLzgKlUnIA:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA4NiBTYWx0ZWRfX1YL9eIiqVfqq
 V15+UzB9Qamoh+K8tZcw773gqLe+py3jmPnzrbbUKZcDWHpuLDWuSEKafWV5deaLLaXzjIo22jw
 kWFp+SY2kD75S8FE7/42OErGulnlwtE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA4NiBTYWx0ZWRfX5NVRQHW1k8ma
 HqgQ/JvG7UCFL097DSGt/CWb5XMhR+LkNtG9M75/X3T8ZCERA2H0CycsUp7XX4rQoM9PnPK8hmj
 EVedNygNTyXnU2SQxrSqQ3ATit+eeyFHUs7F8nmCZD44ZTyyk0wxa3RqgLVLnUyYecP6o/Tjpwz
 FMg1HxSWPHVGCMaADqKU3xqhfTEdLu+CKM1pYJSAeX1NBk4Xu4Zu5LQCPH1em+o2+BqcvQvz3SU
 X4SgAson4NoPjRDBFXYsV/xsnu399evmPsLaLZTtxEaMv27l1J3Icg3SLgxFcdK1Osl7FzDlO5O
 kbKlE3T6styeR+tLZqbcIOtLo8qQo2rGDUZ5aabrGTH7zJJP1P6cZlXx/nwdznZLTyPW2iqEwkK
 L4pgln+LrmSEObCbw2jyl+tD0pttgmdU/HZY/JCpuJ93etOAjetebrso2e5vTDh3dxDP5XGJepn
 zlpwIqWnZffUrk1PIoQ==
X-Proofpoint-ORIG-GUID: KMaL22sFoUNBkjaoT2g6s7zMLuSvXDmH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 phishscore=0 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2610310086

On Sat, Oct 31, 2026 at 01:23:40PM +0530, Ishu Brar wrote:
> Add definitions for the display hardware (DPU 6.1) used on the Qualcomm
> SM7250 platform. The values come from the downstream lito devicetree.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_1_sm7250.h | 311 +++++++++++++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
>  4 files changed, 314 insertions(+)
> 
> +
> +static const struct dpu_sspp_cfg sm7250_sspp[] = {
> +	{
> +		.name = "sspp_0", .id = SSPP_VIG0,
> +		.base = 0x4000, .len = 0x1f8,
> +		.features = VIG_SDM845_MASK_SDMA,
> +		.sblk = &dpu_vig_sblk_qseed3_2_4,

qseed3_3_0

> +		.xin_id = 0,
> +		.type = SSPP_TYPE_VIG,
> +		.clk_ctrl = DPU_CLK_CTRL_VIG0,
> +	}, {

-- 
With best wishes
Dmitry
