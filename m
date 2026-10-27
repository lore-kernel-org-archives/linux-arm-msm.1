Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100665;
	b=EXsHnJ0u7nOHDiM42P/5C3+lZuF25G3A67jhBL3OWkP4tAReml/6pax/xbV/IEkwFAMZ
	 NsEtfOjzZBehLyjDLz2OIbT00tbLrsPTxPeUh3XKZ/i/SNgyAis1Bhkhm7Ruf2m1QIrH/
	 4X+B11V4riy2GdrWqxBZ/2xBz9SAp+/9tu+P4nnSJawAhlG/ju4TpFutjIGyQFvHcLuih
	 p51bSMMRspWL3aRJtWNkvx8kusbj/yOA+d399f2+MWCJDRFXxMIaOFRXCqGxByWYEBFHY
	 1AYSsCuZFPZlUms9hjgzwDD+O+cbw/ALkB1QDtOwRLp73yvLVnaxT9nJQimor6pUi3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100665;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=EZV999AdlRRtqkxVlOTuk2BEEI+idcTU+X5XEmWLzBM=;
	b=5K1xGyV3afBdeh/nkEwdos4YPOMphX3c6OJTkZ/SCWCgeUub7cytbz3ywnl9pKWm5KGo
	 LmWfrsx7+KWept0jvEGm/MU3RZGvsZpSSrEkF2iyXSXTYFGrRHDOqCaB4reyrdl5/pl2R
	 h4ijlbUtp5Xk//otMmsWebe2+5vyOTD6Hr23IHhzMl1QsOfDACtWUGF19vPubDauWM25p
	 7XIX5JxX3T3zrN4MT0fQX4LaY48yCoq4c+MeOMB27Tsm5VWLjs5ylgkivv7XWd2n28+Pl
	 Oxc/xa5a+/EfnDlXrlU3/0xttaE0yqYEheTreOHKfhOL6ZKfdD3nXrByRmGteV1BWmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CxhXrxeR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T78TujVY;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D36606A31B
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:31:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 26D36606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CxhXrxeR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T78TujVY
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAdx4E2458143
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:31:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EZV999AdlRRtqkxVlOTuk2BEEI+idcTU+X5XEmWLzBM=; b=CxhXrxeRo0uHosVs
	d+YypxksBHMEuil3Lvq31ZAu7lZ5zUP/I0rhgeninKTHNegcPkDehC1Z7x/MhcqX
	57rao/AG897OTeTj/a9DdWqqBSTHHw91oaItygxwnh09mzR4dcnYfEusq7oakmi4
	FWOfMn7mEva1j6baGb424lXhwteRHSJKCoBsVedhOpCK/lmJ2MBEffZybvel80zJ
	bH6cvvvrVab2E+l9IiJCtjN2ijbQFSiSRSa663uHNgj1u4zlfyVdrv+zl4oLu9xJ
	zO0kxS0pnLRkwyxXHI9oS8iOJn0V7FDavUjXJfXEmAzVV3xC0fqx8YdITd1Zb7G9
	NRZCyg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbta1h1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:31:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-943fffbc5dbso3449385a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100663; x=1793705463; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EZV999AdlRRtqkxVlOTuk2BEEI+idcTU+X5XEmWLzBM=;
        b=T78TujVYKOU7ROi9xdJtpzVjavN1aqSV9ppzKfY3E3UOeETrQG2Ua+OS66dDr3RHid
         YHf/XBr+bc0JkcCcrc5s/P0X9vZV2MrHjT2NkxYzi4VPf6r5zv3cIlgP04jfIB4GyZPA
         2hnXw+a+buIBjuef1BAgvkZIzrvujyfzK2i1Lll1S3nS/iufux5YNke07eRvKH5n8cuJ
         RO4ehLLzkV6Tbv2t8BUAYIwWb0TLAOkwa2c/tOifngyZOGnFgs3TxgRTg7lEbrnw0I1h
         JX8nBnWgJRSl/q7rWUBr2G/c57KbK69HWFf7Ei5thRqBjEMSK45cx1v8XKsRmqzF3b8D
         rzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100663; x=1793705463;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZV999AdlRRtqkxVlOTuk2BEEI+idcTU+X5XEmWLzBM=;
        b=Bc8PbUQZhOHBv6ptF6dEzOu6Y2oPldHe0TmDranxoi+oP9mTPMGIAbNGZXg5ASi2qc
         2me0ih2LlEajyREjJNAB6Fk6H361lbM2KZ5+iTqkRnF2cL5orxo7/No4fP0DYthilez8
         OV/gMzzTPece3PbEsrfYsa70uO6/pWWQSq0Sl4e9fMJg6rdsPkwbb8yYLEcsJp7oZ33G
         wAjKXr3sYc1QN0CJ/DpuTB5F4RfkXWGXn0zBTHofe1V4KyzcIQ5ub4CirKqSqYlMPz4X
         +8BAoXZxPVl5GTJoC14BSEefqYhNVsQTeiD9adJMGXM07wdBhPBcO8qHtalnPnjs098R
         Jchg==
X-Gm-Message-State: AFq9FYL1YkYEFAomCarNu6ri1JdXc/8/zv5UrrTJk+MXs4ndxCh6IytH
	aWmFQzlOFGYrRgxy9GVHtAnvNKVwRw3TOQ+IboupGaC0RfxTkGqvilVI0HJ1was9BX8Pc4ECSRw
	tOZwKPqEjFxry0RK2vA399ww/q4VoGKAuV72qFajC5ejy7l+KDwK3Xk3OanoAN7guotvqFfQ12e
	6G
X-Gm-Gg: AYBFou00beSahKgNpDUuSn4xgmhLungSd/64pMaxhlcg5tkuzWefKggKNlUdhSjXkoD
	b2XLXO5qXFRcJEvMaLX8aYnvNN/IVFRkDEtCEqiOLM6N2aV9HvCApaxPt77xSATosVuQOz3WUsA
	yvLxIXDBp6UUSXCwzxN/DaDc7qxFcysB+JBFvzyWssKJJVkCipLUojz6aN+T4gAh7ov3nlc07UY
	Ty3Buk1bbuRIw1LTvNR/chAG6wYD/q75dBcGXWYkZTPFgAhkB+6Z3VStcS2GfxKwld32kGBIjCC
	x0lLtnmGdtADoQnEnSkCcNDO4PIQFB7JMsI/xFDVylPXkVa0rlwmdJn1xO7tsMlkM1UyCUMAelP
	S6jMXNtaZWcmIBYSGFvTBF8zsXfO5Q1tFrBjPPSs0KjYthDQwalUItb6Ec/ZhyIx4gTGrtJg=
X-Received: by 2002:a05:620a:57d1:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-940ef915dc2mr1745444785a.4.1793100662952;
        Tue, 27 Oct 2026 04:31:02 -0700 (PDT)
X-Received: by 2002:a05:620a:57d1:b0:93f:25c7:a4e7 with SMTP id af79cd13be357-940ef915dc2mr1745439485a.4.1793100662389;
        Tue, 27 Oct 2026 04:31:02 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd0f6f1asm441101766b.0.2026.10.27.04.30.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 04:31:00 -0700 (PDT)
Message-ID: <a3096f94-ae83-42f8-a9ab-19b185eb9531@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:30:57 +0100
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
Subject: Re: [PATCH v4 2/5] drm/msm/a6xx: Program the PDC sequencer on Adreno
 620
To: patches@brar.si, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261027-adreno-a620-v4-0-b0095e028c76@brar.si>
 <20261027-adreno-a620-v4-2-b0095e028c76@brar.si>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027-adreno-a620-v4-2-b0095e028c76@brar.si>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX4QY9kKIdfyWg
 y/ex9lSWKmQ2YpFBBufmUh47vjquQwZJfpyz3O8thQcqutMfuwcgRh2qvjSC4GPuAANHgdJIhrS
 tAOwzAcAalKuBhGlSWe6g8T0bmFKByU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX0OOab9JvzaJg
 5ytL5jd5M0l6ymZpNIYE8f5+bWsdZuWa1k+0nwfcUJhsaUqo3JdmutBL3vH/FF84eHBzIEGUx+0
 OXKdhMe9JUjsvpQUF5lAF84y1UGNX2qp3sSt+WLanFcI5Y4OhGAJf5KBGQZMMhr7EhD2s6cBqK6
 1y3rv8tVZRPohukjnUuRazBDaJTqn+itWY/IQZy5yDsV3+u+1HRRUI/3a+eOo4ySUU31olBPspd
 UlVv8qAGVjGvotRp0iZ7drAWHeb8Ed7lCdAybhgLz8HTygS/uKHxiuc2jBpHRM2eHMeihvtMlYx
 nWP1m/9lOmpMRff8g0PxB3uYXm7iwIlV3TgARayb8kuyk0wcKt3gXIAGuj4/nNIrEj7ioD/F9wQ
 vCnatwGurd57KZ5A+v6bSB+1t78iUcJcX8iURov+han3sP3Mo0aQweZzrs52yD4PvDjrK14swZK
 1Yg08QdhlkSl24oGGXA==
X-Proofpoint-ORIG-GUID: X43mmwBsYcsCbHsT_v7r7G0ysrOJlp1U
X-Proofpoint-GUID: X43mmwBsYcsCbHsT_v7r7G0ysrOJlp1U
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae08b77 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=27YcngequVK7hVtoIPYA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270045

On 10/27/26 8:14 AM, Ishu Brar via B4 Relay wrote:
> From: Ishu Brar <patches@brar.si>
> 
> Unlike the rest of the A650 family, the A620 does not get its PDC set up
> by AOP (the downstream devicetree has no pdc_in_aop for it). Without the
> sequence, the RSC never acks the second power-up ("Unable to power on
> the GPU RSC") and the device hangs.
> 
> Program the sequence from the driver, taking the xo, mx and cx resource
> addresses from cmd-db instead of the hardcoded ones. Like the downstream
> driver, also program the VRM command when cmd-db has a vrm.soc resource.
> Add adreno_is_a620() for the selection.
> 
> Signed-off-by: Ishu Brar <patches@brar.si>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c   | 35 +++++++++++++++++++++++++++------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  5 +++++
>  2 files changed, 34 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 662f09bec9d5..8d426f1f127e 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -686,6 +686,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>  	u32 seqmem0_drv0_reg = REG_A6XX_RSCC_SEQ_MEM_0_DRV0;
>  	void __iomem *seqptr = NULL;
>  	uint32_t pdc_address_offset;
> +	u32 mx_addr = 0x30010, cx_addr = 0x30000, vrm_addr = 0;

We should grab these form cmd_db unconditionally, so:

u32 cx_addr = cmd_db..
u32 mx_addr = cmd_db..

etc.

>  	void __iomem *pdcptr;
>  	bool pdc_in_aop = false;
>  
> @@ -697,8 +698,18 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
>  	if (IS_ERR(pdcptr))
>  		return;
>  
> -	if (adreno_is_a650_family(adreno_gpu) ||
> -	    adreno_is_a7xx(adreno_gpu))
> +	/* Unlike the rest of the A650 family, A620 has no PDC setup from AOP */
> +	if (adreno_is_a620(adreno_gpu)) {
> +		pdc_address_offset = cmd_db_read_addr("xo.lvl");
> +		mx_addr = cmd_db_read_addr("mx.lvl");
> +		cx_addr = cmd_db_read_addr("cx.lvl");
> +		vrm_addr = cmd_db_read_addr("vrm.soc");

but keep assigning vrm.addr here, as kgsl only ever writes there
on A620, but the cmd_db lookup will succeed on other SoCs too

Konrad
