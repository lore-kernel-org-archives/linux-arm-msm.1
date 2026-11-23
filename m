Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795469967;
	b=fgxtNO3QwyAEJ7ySiSGNrXTqyDXKl/u9f6u6ZfdOPxIZgJsSrIDXCpOw0dxYmx1fq2MV
	 gk2e3KhWTmjEcQWawpnQqHOoAdE5PdfmuUefpyXcSG/RAu2ONqiGhP7tYglZEJdAlZP48
	 wXAIenPzdIOJc5TMNiV3tVVe+WK/0mfAtyRENlDUZKcdl2l8/yatd9e5VyQnDWWNOv8FY
	 OwOALd1qAtG62C6rLMk/WQBNzf4PRID9pRjQEImXWaxrjyr9ypYbr1hsfaclaAHRE+AK5
	 ehqhxYWrxu2lv19A5MFw5lRHTF94Evh1xEQMLUxL0MlIneKXrweFgk8GErTxcv//4sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795469967;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5eN+uAzBwgDgS7ksun4UE/qn3Qm3xyff5PhqmXd2xcQ=;
	b=KBAE0dGy7qAkKswqdfDql+Prw5aVxpmGkD14lEKgRyeMMZDZ2jeZB4gxwowJEJpCiKrn
	 C7XNXJaYKmeXmP3uX3w+p0TfL0is7+j4w9Wtp66rDoAqZFw74JbirEdk3GPMx9JFqc0tQ
	 VQiIH7hI6mCDHa1kCnYZ+J08eWrw7rmei+Ospfo09suExoBrFvHyQjBgkoWpR/Nde1W2F
	 91UAP+gljeJHcMAHmM+i0mS3Y/eE7SxvYFYD/rRuCSlPCLyaJFVExbTsSkCfaz/9nWZiB
	 06uFXCzmy4hL80L46Cm14gfIHF8elmZceyTyxiHVSqAmH9OGDmxiYgxKPRQcxzXf3mQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ennYUH5R;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WU1roOux;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F7B606A321
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 21:39:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24F7B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ennYUH5R;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WU1roOux
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJueVM2827546
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 21:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5eN+uAzBwgDgS7ksun4UE/qn3Qm3xyff5PhqmXd2xcQ=; b=ennYUH5RgxtQLvCC
	9aIQW0JsVuJ9awN6zp/wLVjINNwben8d1a/sNxZk5QarJ33qluJ7hSV7ADJwVAKD
	vtht8YHS68f5kRxOHdZDjGhfsWwf1c7mRE6zoCEDKPhQOW0k6bhAfHwfcfGtlnyR
	kJxbqnpIGkVmiNNB7qTV+odRbYXZTWkBmpSE3gxWTFoBdFgOomuuY3yhpsY1YtG/
	wRv9d2lzZ/mDHAXaE508glP9OTYZjSckvVmhkfSXRYMd4GaXSGaxsD8y/7yExmo4
	Bbw5WhOP9pPJw5vJHwoxS1dql0bTBYQnDKjO6ia7wk73aDSDqUhqWjIQeFMP1EdC
	lqVzPw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx3rxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 21:39:25 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386a65fca25so2399209eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 13:39:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795469965; x=1796074765; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5eN+uAzBwgDgS7ksun4UE/qn3Qm3xyff5PhqmXd2xcQ=;
        b=WU1roOuxQj1o9wSocebp3zl5zWFYEicAOEQIGkk5gvne3RRb7T7aStIP5TDqCNBEtC
         TWHVI05aXn6H0cjcexgsJUtDxKuzchalVJte6SKCLfXu9qCufyQDfoVDyARc6Qa6QLnZ
         WH4Z3BNNiq3k09b4akHyD+9k9d/2/BvxNYkauG7D9w7bFaOf68ln5CCkXCJYEICmcVA9
         d/hZYnGGZX2T+VC8ObYSlPx2NyTP9q4932d7h7kTFSgP+2UVcS6jW/8HUtk8DzCRKVoc
         ABWefKJg8UZoASTze4mPb7UuxdxX8BHaEPthHWG5psLPnX1EVTu5J83Pqgy8PgpR30aC
         zDog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795469965; x=1796074765;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5eN+uAzBwgDgS7ksun4UE/qn3Qm3xyff5PhqmXd2xcQ=;
        b=rjAdHCTfuIQVXU6ebsf5Nuj1ufZ9IegtDCTf/ITJW3I3kfTrCWWXfPzcnlRbCQnSje
         BoM2+ay2xNfYNUb60E6J4AvS7/Ng4wd1zfQgIc1n4Mg7h+A5rIVSXcYNdsueFMC60wto
         i2lM7knflj+TPmVEN9TtuNOCCPkWNFXfW8Fu6dZ+6xPHKSrLfRd36oU6THWO+WIXWGr/
         viiy8ZBGyCIaZaXXUBTRlG13I2niZkZSqU/+5ExLqLh+ZYTu5/HyloNJKoORv8FQCDbw
         kAmyXcYMW8Mm+rECnwyej5NdFk+V/B3Ua+Hzg7t+EbikuY7gb07Ec9sx+9rRZkRQKG2A
         PkmA==
X-Gm-Message-State: APuU4Z8fkO1qUpLVs6UxxpSfiNwoTOxuEPEymOD3Lvur02U6BwWiyNgs
	vJMGiRZXsY4h8ZK33S2WJSM8poofmBBPaPxMYaBSc/7QL4RK+koijQ9Q0O9OHmtS8GTcFeHBqrX
	XIqQb9AiEV8mRcTr8C2uxdtZlxVL//ZstzH29UppuStrGbavO1n1HWq1yGr8DLWE1vilx
X-Gm-Gg: AZFdTZflvXSTPmLz390LAEaUT6IppIYXwdsif860yWUKLvEyfugCMlQ3ykDqd7SUcs0
	jc6xXUNCI3FrDr1bLYdADEupwQg8Xv0qdvBbe0uKQeGMiPhKq3HPuDS2LcGg5may08UhxFPJ+1p
	FE5KZANgHrK1mCDkmIXZBuU5HcjGT5sd4UWYOnESwF6oBr7/79XPOPbYkaWne4DSK3tTO0hJkd+
	NHPCfAa/HRhB+Pr+1dU2VwHAOdZbB5ReBaX18DEmvE1jVGGWiJXlDtTK/UfH5bQx0SBLttBLAob
	sbtZinYuBsLhCMdlYf5L8axqghVztVJuQuNJIA9ebfPBdQSI5Xz5CmB7RsCAcYg+3l3SoXBq6uh
	s59reNFjghQL+X8BOE3eRCE/VoJ3SBaTFAF2no3H82NAZFTFraf8EgXDc1Px0+Z/5b9KI+Rs=
X-Received: by 2002:a05:693c:68d3:b0:386:912f:c8dc with SMTP id 5a478bee46e88-386912fe5efmr10344174eec.6.1795469964623;
        Mon, 23 Nov 2026 13:39:24 -0800 (PST)
X-Received: by 2002:a05:693c:68d3:b0:386:912f:c8dc with SMTP id 5a478bee46e88-386912fe5efmr10344150eec.6.1795469964115;
        Mon, 23 Nov 2026 13:39:24 -0800 (PST)
Received: from [192.168.1.9] ([106.222.230.69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c349csm41004355eec.22.2026.11.23.13.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 13:39:23 -0800 (PST)
Message-ID: <4d06325b-e1e9-4e82-82fa-a81c5e2d6134@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 03:09:18 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] drm/msm/a6xx: Polish up the IFPC counter enable
To: Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20261030-topic-a6xx_ifpc-v1-0-6992841a9a32@oss.qualcomm.com>
 <20261030-topic-a6xx_ifpc-v1-1-6992841a9a32@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261030-topic-a6xx_ifpc-v1-1-6992841a9a32@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b04b28d cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=6/OokicQZQM7IRI9QMJePA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=t7XnImjxOyE5UpSjZyAA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: _rAdRQjLAa1SLusFOEokentI6sa6TJOJ
X-Proofpoint-GUID: _rAdRQjLAa1SLusFOEokentI6sa6TJOJ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4NiBTYWx0ZWRfX/n9kgfacXpTc
 CVgWkjedIqNcDhWfXWD8vDyE4x+imUmxjdpPUdsP61h4DXcAfYWLnMAGtJRB+Ol3FWrWteRQ4/P
 Nr9a2pPTB+lv9ED7vjTp3gisiRgnjAU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4NiBTYWx0ZWRfX0H6uhSE4redT
 TkoHx23N/ot/7JxoLdRJEpF/ghsLOID6520Gl+m7IVpXlMD3adIC0CJOpLjK4KuP29WqBkZoSH+
 VMEisOXv9wqPDtQYIVvwl53KJCs0ISUn111enAubNi4YgPbOO4UqqPv2l4FDwkigN6vuiQaGARM
 UvnThJQSaWAKn4mej7xvgpTIwRUnp2gUz6X/jzeDRQoUH/bF54Y/NzK53Ip/6vRio+4u6RZQOuP
 hQ7L2ZptD9h+lIUaEVZ5TftG+366ITPRBncAPpOF8mI9O4X3d4JfD748dfuibXOT965XgkM4uSW
 Ix9IFusK8H4AmHAhNi1KF2S2/5yalECKq6gHGZ/9wSbYUrFLixrf0UGc54hIeaFNN99wG5wjkgs
 h/Kga8yArbsnA+hgD0FjxiIz7dzDTfIQjQVxb9shAEvUhWpJ7yCZ01kXwsQLyHHhhc9RZYHvl6L
 B05I/1+blw64XsOlV4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230086



On 10/30/2026 3:33 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Extend it to all targets with a real GMU and use a rmw instead of a
> full write to preserve other things within that register.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c             | 6 +++---
>  drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml | 1 +
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 92e8c8abb86d..48d3ee4d55d9 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1332,10 +1332,10 @@ static int hw_init(struct msm_gpu *gpu)
>  	/* Turn on performance counters */
>  	gpu_write(gpu, REG_A6XX_RBBM_PERFCTR_CNTL, 0x1);
>  
> -	if (adreno_is_a7xx(adreno_gpu)) {
> +	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
>  		/* Turn on the IFPC counter (countable 4 on XOCLK4) */
> -		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_CX_GMU_POWER_COUNTER_SELECT_1,
> -			  FIELD_PREP(GENMASK(7, 0), 0x4));
> +		gmu_rmw(&a6xx_gpu->gmu, REG_A6XX_GMU_CX_GMU_POWER_COUNTER_SELECT_1,
> +			GENMASK(7, 0), 0x4);
>  	}
>  
>  	/* Select CP0 to always count cycles */
> diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
> index b3082738c99d..4f934c194f73 100644
> --- a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
> +++ b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
> @@ -83,6 +83,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
>  	<reg32 offset="0x1f84a" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_3_L"/>
>  	<reg32 offset="0x1f84b" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_3_H"/>
>  	<reg32 offset="0x1f84c" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_4_L"/>
> +	<reg32 offset="0x1fca8" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_4_L" variants="A8XX-"/>

nit: this is unused in this commit.

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil
>  	<reg32 offset="0x1f84d" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_4_H"/>
>  	<reg32 offset="0x1f84e" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_5_L"/>
>  	<reg32 offset="0x1f84f" name="GMU_CX_GMU_POWER_COUNTER_XOCLK_5_H"/>
> 

