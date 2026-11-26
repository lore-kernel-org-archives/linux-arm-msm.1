Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795721199;
	b=WipFNOgEFe1O6UGEsI06NNtX6SrleK5LKPza/Ga/B9w2mcrfuSqc9vuvqIXSy3WzwIgO
	 2eGjb3Lrb+XJFCeTqzHU7L3hIu9Ckq37SCzr0KlPA4CB/vH8MIHFPqu93Yi4pVAj9NxE+
	 31Uh43H02/lao65Qg3CdEs5qshcjwta8hJrLEyz40gzIg5JCKEFmn380R0nOaINqCyTsO
	 MejPcd7npWHtTcC2W8Qt+D+XJiz167+MN/Wg38vXpgIIH6U2Qdq2wbe2xlplOU1DhYafS
	 38sTQiwxRYazbkwew2Qb9uSTS+qjdxi6PBODxFEAW95RXfdpWYWKzzbFHwyOPD2ImFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795721199;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RSbO/8C3j8RIVBHNdX+Dlhj+7Zj2tOE/srOubQ38wfA=;
	b=vthy78aI3qghzEmFDflzcrxHGTDaeEujHX2yWZuOH12MSqaqPdezDUFl+0qczDvCBnZd
	 oOP8as+kJILl4VwnVctGCSlzWh2Vhmn1HWaMZ46bDtpacSvfPI+pzpCHQON32H39xmkhS
	 hdS4cEn6KNJJNxeRlInYAbayWqqKBrYRTe1DsoL6nrm8oOJ/EBmZ9jwF46m1g8Vk6mM7T
	 lOP31jAzZlBaa1Fb/HR8n5zYxVP1YxLinHvS3MRebPfvTjV6FLjZHpXGtAfBt/AsTBJSB
	 07fNkdMiPmJbK3xPeJGvt68mIfUn6mrSuMAQFOyZC5GsDn4qmBPaAM8ged7cGBovWJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y6vxztZ7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="eO0Qr+/R";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A51606A31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 19:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26A51606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y6vxztZ7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eO0Qr+/R
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQGc3pn596445
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 19:26:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RSbO/8C3j8RIVBHNdX+Dlhj+7Zj2tOE/srOubQ38wfA=; b=Y6vxztZ7S8v5heaq
	gLEDsIR0PNNktgZKZ+zUllJa3BnwCokbTyCKp35pawsJD7jUZLLCMflHewAhKqJS
	7BqPortcbmF9YLDvciYxtaqgpAHWcnSRq5DRVOfTQtmaNRR4fRR0Q5UKGz/Q7SmM
	5/wRD3IXwhdzsCJruxhIWegfLpDS/r/AAPsww0i6WTLTnYm6mRbHbE0LiQRtcCFr
	GDHMfZ0DfQkMD01mm2hmRHQObVww2sm4DEBmwNuH3d61LU2qBOIO1KE50Xdy6/aV
	SlT1DPOfnUdcv3VV6llZXD93nxzDYvizSLpaG6aMy2Nrkqi2//sHlhMrI3tf6/GC
	Vyt1Ew==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf90faa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 19:26:37 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b55f4f3bb8so4276747c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795721197; x=1796325997; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RSbO/8C3j8RIVBHNdX+Dlhj+7Zj2tOE/srOubQ38wfA=;
        b=eO0Qr+/RaacgI2YzlWPMmhQaN42IU58jek8est1j/O23SR4QkplORHOJ+9gqqk1d0k
         uaon1OHT3aglu4Rp6Xrd7qlmzUpq7qqh/AoQdXJ+VduFpONkpDqin49t89K3pKGxdw23
         5HhWTw+mx3a85idfZ2WoSjO0OhtxkYVCGyi/QXDCHU9LgkM5BxAVoU7fDqY/5x1sSTgH
         dst0SzMXVjxIarBW8IMYkk7XlofEFsBwG8x3ecxk6JmJ2ezXYalmRuPH9gfm95iPGjfZ
         FU2abOoNsRKPwR/4Hqlm6NVQJvD0W5e1EZjXblCOzEsvV8dHwi4lyP8+FxIaxJF//lpU
         YTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795721197; x=1796325997;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RSbO/8C3j8RIVBHNdX+Dlhj+7Zj2tOE/srOubQ38wfA=;
        b=Y05CG6WMPmBQlxGnQnAWbpjtncZbhHQtxpnIYRjWG154PHLPGEOhobNGq5p6kafFpf
         QApu73aOtMFavlKMky3D1xQDO8JXn7Cz/X65kXsS5EQ3kL8PzhvgARm6Afg3eEzjrI/r
         SpsJdc9uwb7p9wLpMKrz9l6cNQWW6/wqr4FAQG9tiI5Wvk9MpJDnSi3o2Vkwqpk+e+Fx
         A8vAgbxOaqb1QINnSILvLdsLd9xiyupgsyS2GxL0HteoIJy1NJCaSSJhZrANL8Yj5Jyd
         4Fw/gM/yVpRw3iMx3JsKGvmDP+wObEycGXqMan1lzxp9QOs4jZ9TUMmC37aHx3nBodjZ
         L3VQ==
X-Gm-Message-State: APuU4Z/eYsrt7EMYJg9HnQGe0cYabnQJoe7m9tG4XHFjq+nj9DgCWihf
	KhH1iA7n7labkNcWJG7T3IKnQthmbF8OpLNPN5G7Un/14QQq7vwsK3WOY0oRoIZ2D0AJeiu3RsY
	U9Cl9KRM9EcXmDb+mirAWW2LSSz7yAxdMon3O4hJwFVgq8r1uxwOsnvpAkXDm7U7h07GQ
X-Gm-Gg: AZFdTZePBnbueGn8uf6U34fV8PakOay5QiM0O6IiCLMLJYQGHARi2jPU7tXfvQx2gd9
	sKby8YIKRRHHdlfIqPRZ0opka4gc0wJ/y7xoWTMySMhOXiSIi5fdgwUN5Owrrg7Eg0LYU0dm2hD
	rEH9aSD2rDzKHZyPoKgOhlmJ4I03rj1ZFNC/PyoWRyNYgW0VNp58ubC1tQhqZ1qe/6D99PIpy9P
	FKzoCwMFRVzWifRdDAuZIPtQEA5k6A/8LwbQ2KGapFutrD834d4oWRVNDjlWRItCOWrob1hTAh5
	SAq/1fcy+jnQ2h0PMp6zYImSTg4QHsTrUOSnC364gxph+3qjvMO9yAzW2iAfBgRwT8oYXCUM+Vq
	0xchzdg8egS3ykUf6nH2guO29k5n0MT++CJdPwWNdbmKinN1QNw1a0tVZdFtEO8qOZx6M4N4D2Q
	==
X-Received: by 2002:a05:701b:2051:20b0:1b2:4998:a0df with SMTP id a92af1059eb24-1b5568fa273mr22224567c88.35.1795721197149;
        Thu, 26 Nov 2026 11:26:37 -0800 (PST)
X-Received: by 2002:a05:701b:2051:20b0:1b2:4998:a0df with SMTP id a92af1059eb24-1b5568fa273mr22224548c88.35.1795721196695;
        Thu, 26 Nov 2026 11:26:36 -0800 (PST)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566fdce48sm69877832eec.14.2026.11.26.11.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 11:26:36 -0800 (PST)
Message-ID: <83e49e4a-0e31-4802-bbcd-7e0c178b6ac0@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 00:56:31 +0530
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
Subject: Re: [PATCH 6/8] drm/msm/a6xx: Add IFPC tables for Adreno 640/680
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
 <20261030-topic-a6xx_ifpc-v1-6-6992841a9a32@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261030-topic-a6xx_ifpc-v1-6-6992841a9a32@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iALIUw8KIHJajzI6OBmfJ8gATO8zpSSY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3NiBTYWx0ZWRfXzuLMyt8kLtSV
 +AxEDFQABmy9c9tuoLI9bo99dicHtWe10rqBOQfYvtM/7TM3rlAMDxox8IfShA7wak/aJbfFAhc
 wTAAIOVBhL9RYdsMjwxMFri+Aa+QerohqNnzkHly4th8f7bqpAdpVaap+Lcd91jNzeQlubxIew8
 wVzdG/bLA1WVyk1eQ36yQXDkvc5m1+xN4lgBTdw3m9qOzQXnyLUeswyNoyvanxoc5vmIYR24ATZ
 kExOVX51qtvMNrcmerSwI2kHcc0AwYOrA6aw5k6yUSP0KZXT6paiH+jV5TkUVcGBPDHdroRItMZ
 8HDHlQUd16ULqOJph5NkM49kOEl4FrTlSyShvxxwFpBVV7oAfnRddWD+bEvHjIOMivEBYq1LWF3
 NOGQdjNbDjOTmXmsnKwbyeMNw089R1Tb66zv4gFq+1sOLjav9X4eJZMBnEeYpdJ3dsZH0Wp5VkY
 aQk6Md+NJa9usLRnaAw==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b0887ee cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=PhAf4g791m7IZrnnNEMA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3NiBTYWx0ZWRfX0WMg6MJQnLEc
 9EGS44wzMFSz9eD03Q1b62RRWFnQBH82myMBSVDmvYGrnpkHKR+qWeeuL1xEkrEoWrCAT9Z1Wq+
 WlCYEfJXS6j9jBEIw+gqNJwV1d/TH6M=
X-Proofpoint-GUID: iALIUw8KIHJajzI6OBmfJ8gATO8zpSSY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260076



On 10/30/2026 3:34 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Fill out the register tables to enable IFPC on these SKUs.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 47 +++++++++++++++++++++++++++++--
>  1 file changed, 45 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 5e1d91a73a4e..89829fa8f4f4 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -814,6 +814,43 @@ static const u32 a630_pwrup_reglist_regs[] = {
>  
>  DECLARE_ADRENO_REGLIST_LIST(a630_pwrup_reglist);
>  
> +static const u32 a640_pwrup_reglist_regs[] = {
> +	REG_A6XX_VSC_ADDR_MODE_CNTL,
> +	REG_A6XX_GRAS_ADDR_MODE_CNTL,
> +	REG_A6XX_RB_ADDR_MODE_CNTL,
> +	REG_A6XX_PC_ADDR_MODE_CNTL,
> +	REG_A6XX_HLSQ_ADDR_MODE_CNTL,
> +	REG_A6XX_VFD_ADDR_MODE_CNTL,
> +	REG_A6XX_VPC_ADDR_MODE_CNTL,
> +	REG_A6XX_UCHE_ADDR_MODE_CNTL,
> +	REG_A6XX_SP_ADDR_MODE_CNTL,
> +	REG_A6XX_TPL1_ADDR_MODE_CNTL,
> +	REG_A6XX_UCHE_WRITE_RANGE_MAX,
> +	REG_A6XX_UCHE_WRITE_RANGE_MAX + 1,
> +	REG_A6XX_UCHE_TRAP_BASE,
> +	REG_A6XX_UCHE_TRAP_BASE + 1,
> +	REG_A6XX_UCHE_WRITE_THRU_BASE,
> +	REG_A6XX_UCHE_WRITE_THRU_BASE + 1,
> +	REG_A6XX_UCHE_GMEM_RANGE_MIN,
> +	REG_A6XX_UCHE_GMEM_RANGE_MIN + 1,
> +	REG_A6XX_UCHE_GMEM_RANGE_MAX,
> +	REG_A6XX_UCHE_GMEM_RANGE_MAX + 1,
> +	REG_A6XX_UCHE_FILTER_CNTL,
> +	REG_A6XX_UCHE_CACHE_WAYS,
> +	REG_A6XX_UCHE_MODE_CNTL,
> +	REG_A6XX_RB_NC_MODE_CNTL,
> +	REG_A6XX_TPL1_NC_MODE_CNTL,
> +	REG_A6XX_SP_NC_MODE_CNTL,
> +	REG_A6XX_PC_DBG_ECO_CNTL,
> +	REG_A6XX_RB_CONTEXT_SWITCH_GMEM_SAVE_RESTORE_ENABLE,
> +	REG_A6XX_UCHE_GBIF_GX_CONFIG,
> +	REG_A6XX_UCHE_CLIENT_PF,
> +	REG_A6XX_RBBM_GBIF_CLIENT_QOS_CNTL,
> +	REG_A6XX_RBBM_PERFCTR_CNTL,
> +};
> +
> +DECLARE_ADRENO_REGLIST_LIST(a640_pwrup_reglist);
> +
>  static const struct adreno_info a6xx_gpus[] = {
>  	{
>  		.chip_ids = ADRENO_CHIP_IDS(0x06010000),
> @@ -1115,7 +1152,8 @@ static const struct adreno_info a6xx_gpus[] = {
>  		},
>  		.gmem = SZ_1M,
>  		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> -			  ADRENO_QUIRK_4GB_VA,
> +			  ADRENO_QUIRK_4GB_VA |
> +			  ADRENO_QUIRK_IFPC,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>  		.funcs = &a6xx_gpu_funcs,
>  		.zapfw = "a640_zap.mdt",
> @@ -1124,6 +1162,8 @@ static const struct adreno_info a6xx_gpus[] = {
>  			.protect = &a630_protect,
>  			.gmu_cgc_mode = 0x00020202,
>  			.prim_fifo_threshold = 0x00180000,
> +			.ifpc_reglist = &a630_ifpc_reglist,
> +			.pwrup_reglist = &a640_pwrup_reglist,
>  		},
>  		.speedbins = ADRENO_SPEEDBINS(
>  			{ 0, 0 },
> @@ -1238,7 +1278,8 @@ static const struct adreno_info a6xx_gpus[] = {
>  		},
>  		.gmem = SZ_2M,
>  		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> -			  ADRENO_QUIRK_4GB_VA,
> +			  ADRENO_QUIRK_4GB_VA |
> +			  ADRENO_QUIRK_IFPC,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>  		.funcs = &a6xx_gpu_funcs,
>  		.zapfw = "a640_zap.mdt",
> @@ -1247,6 +1288,8 @@ static const struct adreno_info a6xx_gpus[] = {
>  			.protect = &a630_protect,
>  			.gmu_cgc_mode = 0x00020202,
>  			.prim_fifo_threshold = 0x00200200,
> +			.ifpc_reglist = &a630_ifpc_reglist,
> +			.pwrup_reglist = &a640_pwrup_reglist,
>  		},
>  	}, {
>  		.chip_ids = ADRENO_CHIP_IDS(0x06090000),
> 

