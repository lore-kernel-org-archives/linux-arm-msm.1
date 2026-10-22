Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792653568;
	b=e6cj5ZErzQjy32NfD8K42ieGyePxNtuM94pmLesYIYSyxDdn3iaBeb3+R/SLA6v9aeFm
	 f93UucdVBTG3gpwwXgExNjsMlVpASBvjaLihqSIUPUD7bL5LwJ+Lax/1c++ysjIj+IqOe
	 QYVNe3Sn2O1SaHQH/0283jrTwgagx17EHrlOD4VVD5zgfNF/0jhgot3mnM3MHtPUUhINN
	 OaZleNJfY3IaekIf3sfA67tDEACoVMk6V0rb7AjSJrzo5+uFk/KRR7S8+sv08sGbWxwf6
	 Vo5SzsD0HyIsxCS8HpXgo5o8W2sSTpAPkKSJ0KEeii68RE6vwpxY4/al1bF06gzR52Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792653568;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Nf3jSk7w1j+okvpezp41LPgG6BghIMDC87ldAfN1ggo=;
	b=qHIDaf2e+siWe/LlJ0iASoK5raewc/Kz+XJbCCNXIZhFGMzCrF9b67vernZyDeiTJzmb
	 bAkDetZTpSPRnuD2po6biLCGcri5cgVx1z9Ytg/n46s9nQvxilkp5uFnan4b8RZ1umRkZ
	 so1UM3vMI8XYnopVmcwwPsFHQXDKgxpvSIxPT55mwQO3ntwdTQB9MHeuaPqSJbRMd1Hgn
	 eUWin7l86GhXM3uydUxjwDUOsPFpvfCVN4hnmZ/KM57x3bw25fza1LvL8bBzE7gfFM8ts
	 kA9M/AGba08DsdtYnJxy0YjMczN5wsDpWXLz7hxr4fW6JtyF/BFeTbQTzzg1FFDBlnA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m32+gmS1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HFmts7vs;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0391606A319
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 07:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0391606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=m32+gmS1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HFmts7vs
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M701mS2714299
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 07:19:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nf3jSk7w1j+okvpezp41LPgG6BghIMDC87ldAfN1ggo=; b=m32+gmS1Ymgq9JAz
	909NtzQRlLitABxi+BEbDuyTVdl0Tfme/4QwK7FCvNftCP5Ro+9ZqYZoH5KdhcXe
	2l0fewiOP9qDBRoBHxPQD9+yeoahvjMqNb0gZghc3DC/t7RxBSwEYemaMi0KmsxP
	JKuZiMMl2L8o1VlUE9MaQ7nw/HEpUf9FKwnyKPx7lJc8ObyytvsYG/uWQAaYckhY
	HVVi2rYzJ7hbE3C0ZnliDhzGigHl+qsz7YtfrIw3gJb4skPLHpv1n1dLakzb90e4
	oIOqlnzo11KIZrSj1XGscGwf0RtpkIUiUJvIeQgVY4a4lWwpi+ggExICml39zqpI
	bLKhZQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bs69t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 07:19:26 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-536708d1a3eso4656281cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 00:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792653566; x=1793258366; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nf3jSk7w1j+okvpezp41LPgG6BghIMDC87ldAfN1ggo=;
        b=HFmts7vsImyCOEdAlE39KgvF+SV7PEbRoMJ+yTcnycpUz2J1Pv7sePCw3AyCZCrERy
         nbab86v8bW5n56GzG7QjCJ4W/0cKk2fEFvz2sC1PV+SYAnzToXGXwaMq7yUGIuSnhI+T
         dUXomsHIlGKFJYWnibqmOJEZcTDT70VcJUkRM4kWgxSAG3M9XG47+2X1538BufOCPnaF
         Iyc1FcVe07Atq0w8FYwzUn/K6h7888fKohoNewKkLWcmni8gmSihl1Ig3yNWvd355dYV
         VGvmfU/BrZnZY+E2AbKiU6cOnLNomnrfTNDmFJ8nOo/ue5oI+RtZA0YTf8RisZrKqpBS
         Td1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792653566; x=1793258366;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nf3jSk7w1j+okvpezp41LPgG6BghIMDC87ldAfN1ggo=;
        b=C3t0BgopODGHkDHz+h75xEvciNwg4eVJs+jbsTO4Qr+OcRgIBYbDZhQgn2/kKyt9nE
         AAZXuIoo97rvF+9Tf3tuTLMeCD4aTbFslzJ3uaEynv0GEnkSmgjPetNSXEoIxynh+sgP
         nBH7thCtU2nfIBV0U8/ujNl5lZX22qJL4TRl856nFhK5GKRn7sI89SejCTP1cFFbKpPQ
         W/BjMN9CP1CDWya6sE0yk2lWtUVB5oiB6lo5WfSEBWuNsD/nTS/TJQUuoh/VZ2VLMkkS
         xh++BOSKGJ+w4Sx0NLJTSI37PQel3AUdqM048Q0oACddpakw8AqLYghSUduscz+6qcf9
         bTeQ==
X-Gm-Message-State: AFq9FYKJqZ14vy6cJimUVeAS7Jur7GFqIhrDNQGrUfMkojDa6jdiABg2
	pgha35qnbPWfd24TU8a0UFUPmtCr/cSghGneRQU4fBOdIu0y9HBuDr4nTdn+lKCa+BY/d49Zx90
	dD5MVcFLqzJgladqEGB/XKMywB/NUO4Yw5yyL/5jRxmBVomxAKgMIwV8sp+d8mXapgUAD
X-Gm-Gg: AYBFou2+6fppcl9CKhnTnhfzvS86CwwtRjEqKGiNYwJDQiQ78f2UjSEs3M/dEAZ232c
	M+vvhdfvcbZauXcJ/8W+PNg6xF1fQYTR82ImgI6BICg9eXfDTGwrLIeT2MpCgcv4NyJOx/5V024
	+SmHmKG7N0sdhJ2VqG4L/1HMAb7GQR29TnxMkuYhf01pTBYbARNfXc/nNia9uNshAXzFM9Tm2Re
	dt14Fabk9F9ynvHBfTIDaPjeA3kSIk0KbuGPNdc2TGmQFW4ch8oQe3LxDycj59j835Jfl9HNcyf
	1WVRev7o5xPBczjkPZWqbQ5rus7Whz2rk6TjCR0rX87FbkFRj3iZ5L757/ZHvYjEYQcC8sEgmus
	OQ+yMA+Zn2VI4uGRElb0kng==
X-Received: by 2002:ac8:5d15:0:b0:535:496:56ab with SMTP id d75a77b69052e-5369b1c0348mr85871801cf.0.1792653565680;
        Thu, 22 Oct 2026 00:19:25 -0700 (PDT)
X-Received: by 2002:ac8:5d15:0:b0:535:496:56ab with SMTP id d75a77b69052e-5369b1c0348mr85871531cf.0.1792653565233;
        Thu, 22 Oct 2026 00:19:25 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a59b91asm76726866b.52.2026.10.22.00.19.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 00:19:24 -0700 (PDT)
Message-ID: <aa6dda5b-419f-425f-a9b5-198a9bf7eac2@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 09:19:21 +0200
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
Subject: Re: [PATCH v2 05/14] drm/msm/a8xx: Add missing a850 ifpc reglist
 entries
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261021204244.67160-1-robin.clark@oss.qualcomm.com>
 <20261021204244.67160-6-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021204244.67160-6-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Wtpx0tysmmkXvFiNcbPlO6n7CyDqv5M5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAyOCBTYWx0ZWRfX/Xi58yucPBcX
 JdD4jIqH6kIca5vfSsjTDjwkFF7mRmi5Gyqboofh/P88SW6Lu8pZ5S/086lqlcupqqXkgS91E3O
 Ql9BXkAXbnr5Dsq7sSDVWcMpG6nDOjplz/a+mvt6EEe0MLNlyays8k0NzJjDx3d/hSoGro6QpKn
 LoXHjOPFQBeSD6MYZ/ewc0YIpXL+M6FFCu+h3ohXKXuUI68MRn32XBcekR8K0cgMhRlId07d6yS
 Jss0CDzb61lAGySCKGZCsRlgYKQq3V33PwRP5hYC2fcAR2s/4B/E2M3c/O/TRx5o3VTt+wSkQA3
 bKqFzldCwknWrEIXWSzMdfxxhIKweO1cp6jE7ETL6Sv6pL+ELUY1ACboGOmL40iNpamHIjrTIbg
 VAXQPrxLALv23DBaHjNw3LMj867S4caxREKhqskPMzrA8plOQ3YfoLoD90Sln88HKXvM3ONDakj
 GMgFpsntfXbXndm5NDQ==
X-Authority-Analysis: v=2.4 cv=HJxWhYtv c=1 sm=1 tr=0 ts=6ad9b8fe cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=ZG9rikoeVC3lgFHVExcA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAyOCBTYWx0ZWRfXyOcA+ldgt1b8
 HU60mBx9IFkHdwsY7lvXeJkcfodfELMxENnfawSogpkBqLXZgvxVrK4QP46eKkSdSh6pvFuvAfz
 R2jyYkGFD6fuOBkePxPDtw9mjoROAPo=
X-Proofpoint-ORIG-GUID: Wtpx0tysmmkXvFiNcbPlO6n7CyDqv5M5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220028

On 10/21/26 10:41 PM, Rob Clark wrote:
> We want to save/restore all of the CP_PROTECT regs across IFPC.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---


>  drivers/gpu/drm/msm/adreno/a8xx_catalog.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> index 55a805ab438c..45cd986ad4b5 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_catalog.c
> @@ -1477,6 +1477,13 @@ static const u32 a850_ifpc_reglist_regs[] = {
>  	REG_A8XX_CP_PROTECT_GLOBAL(53),
>  	REG_A8XX_CP_PROTECT_GLOBAL(54),
>  	REG_A8XX_CP_PROTECT_GLOBAL(55),
> +	REG_A8XX_CP_PROTECT_GLOBAL(56),
> +	REG_A8XX_CP_PROTECT_GLOBAL(57),
> +	REG_A8XX_CP_PROTECT_GLOBAL(58),
> +	REG_A8XX_CP_PROTECT_GLOBAL(59),
> +	REG_A8XX_CP_PROTECT_GLOBAL(60),
> +	REG_A8XX_CP_PROTECT_GLOBAL(61),
> +	REG_A8XX_CP_PROTECT_GLOBAL(62),
>  	REG_A8XX_CP_PROTECT_GLOBAL(63),

Sounds like we should autogen this part of the list?

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
