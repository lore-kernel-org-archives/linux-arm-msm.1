Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4FD432BC2
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 07:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789976443; cv=none; b=mCW/d6F9V+I0IrP+3/9ka/wgpuW+rH9YDLUBq/uYsoZqlH+vFiWUCA77zgCcXt6hUecYSn2x1RyJ7msfD1dzn1LdSGAvLJfL/7oBHdva2f+uDX3qZcGRKopDCKcm6zAwAWbvHKpOb8x2ZKK9Sb4Ur3N4zeW11DrG36mi+tPnA34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789976443; c=relaxed/simple;
	bh=4eD74MwKhN0aMZI8VG5TG6F2fwsOEEYUrLJzPn3MfwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U7EjrSTqOHvMbkETpeRUzh6dfM2Encw8s2tRoukciZ0jQ2qpp7WQiyC0UL/og69r+jJH2J8FMrPHgmAj24xtiIqA8gJVo8EsSUTCcv5WdzF4DodzaVdxXFtvfZl2gtXcVbL/y3FUaV9uOwIgJalH5Q8Rnoa5CNUxNHthPe2v3yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p1x3Rkxa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PqjeXJWm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p1x3Rkxa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PqjeXJWm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7AOG43351580
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 07:40:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RXBm8BbIlNlS9kij4DyUUNrfUO/dqmeuJb9GLNDGhLA=; b=p1x3Rkxa/Ri6FZmM
	swaVj3mjJj1KVPn2xk0A9rf15aEH7VumO78sNYkHdG9Jxv5CZDq6k7x7YZngk1YE
	+ItJUGiXVT3z+pIHQXeqRtoYV/YTlnMLbVa2xUzM3UmrVrYqoaWWRII9YE6w1soD
	bEeODR9EJoiRQ3e+QLtCiaiXWGseqodbd3A6p2gsd4ctBk2dvQx7oom+VugiPa9W
	ff2SREqjxxDqeq3BgthSa70YPo37OVTQnTzq1uuxCs5lXfavekiGjabfpaIJOxtc
	QMUYk7VCyI9C7enFvmn4F8jZXDgNKH6xVSL2qmFAP+upuLhzKvHH/BuxeymaiHGq
	JOlAXQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq799gf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 07:40:40 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-530d89f2f4eso4250661cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 00:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789976440; x=1790581240; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RXBm8BbIlNlS9kij4DyUUNrfUO/dqmeuJb9GLNDGhLA=;
        b=PqjeXJWmfxg+WsufwKmJ8aqdzSBgXmAnshb88DneKQpWb+oTBH3uZwz/odbdW4iOJF
         dqV2V+alJVSnvOYKtKem7qwaM1K8jCKUoAjH6AqXbiZTeqP/DscCqL3LV005UvwQ40JJ
         X4U9sC4jJr3D9yv9dZExXaqlTOv4AIEmSeoui6UZhUbKsSIAMX1/GSXote3YwuPlfGui
         ActWNDmuBzK8flh/8KCO0IX2qarTLTuCBIDiy2xk6k9ZNpP2T8xtDHnu3Gawa2Gf7qDJ
         k5gvTMrywbcfgzNIv8wPDwWNLzv02fLiFOxOLfp1le0Zj0Rds4mqGJ3HoizYs/+waEo9
         jSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789976440; x=1790581240;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RXBm8BbIlNlS9kij4DyUUNrfUO/dqmeuJb9GLNDGhLA=;
        b=hMkYuetPV/yFaI0x185Z8XL4klwaXDTI1Jo8mqELEw0wc7ihPsr39WYTqx2q9nVEW7
         Bt/E32P54vHhdXlXzMOMdAqRa9OroPLcNcCrOj9BkcbJ9zHE8G8C6RAEUnoHCXlpEc1k
         YqxZAcWCXULu8xmdz0lR8wVCKZ8EgROuqudb2q+bGouz/DjY7NU3ZezzIMEWYycN9O29
         xe6LSH5LdEGuq/44ZPnAwICuFUoSxxy1jUUFl9Zvh4z6IaGUP5e+m8/tDXPdxl9eRG/5
         N2HbXZBIWCFlEw971ZfFwFizYVAP7hpKFj0XV2lqzM5rvA04CAKF/SGgGpn9TZhrQnLn
         fq5Q==
X-Gm-Message-State: AFuF++nGJj8qBzUSdlWSuM7dDQGf2PKsmaB0oNzH8qpCZwseHC4n3Bm/
	smjFkjkjiHtqCFEJwlWuLexj2UaYOozZ0ACphaSOKjBZtRy1QIKUFoNkDcmUvZZovdKLruJFAdW
	LQwf89cDf4J4RI9RCmZTgR2p5xUBatrgyF5yrV3Ra7rZ1OSmOYx1fG1VTmZna/8vtWdNF
X-Gm-Gg: AYBFou3aSjnUZEszDCoIAOAF/EdOu05pZ020IcmPl/EmyzUISj5jpc6UBHjQ1sc2cUN
	TzswTfl0EY/EwoGV+YEG72D2ujGVIe/f72g0Az7ShXenFfSMLdR1h0qdqCl7w/Yewow82SUryQp
	TeAu9R3eSy7PfyQqRUmopeGj7ZpL6TKdHtyfRgfnguk9Z83Ab6NOdPlpLa7ATep4afhcQ1sxxn9
	gsRteOcUth97ovzpDRZmbFKFkz/WGg5MRsrtWWdW0vYrmwyUGT4dX4PQ0S5teG7tmAiQiDddQQF
	oBuoN7bMETUYJ97sqk2xsGKnGfYSF7G+RY1VVY4sGHPpUSGiGFjsQLLOqUJ6fksPYMgYpA0VoPg
	qPKgY2qIFnJEWSd7o1emm5Q==
X-Received: by 2002:a05:620a:4803:b0:939:b8da:1242 with SMTP id af79cd13be357-93bf518f649mr907437085a.0.1789976439790;
        Mon, 21 Sep 2026 00:40:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4803:b0:939:b8da:1242 with SMTP id af79cd13be357-93bf518f649mr907434085a.0.1789976439390;
        Mon, 21 Sep 2026 00:40:39 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67d821efsm3775171a12.10.2026.09.21.00.40.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 00:40:38 -0700 (PDT)
Message-ID: <1eca3b55-fce3-4a39-9e0d-2c6d1fcd6a86@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 09:40:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a5xx: don't read the GPMU registers on GPUs
 without a GPMU
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260920-a5xx-no-gpmu-v1-1-714200254f76@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260920-a5xx-no-gpmu-v1-1-714200254f76@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aJ9lOr9m c=1 sm=1 tr=0 ts=6ab0df78 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=nNp-cgRbjtXmMSB73TMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEwOSBTYWx0ZWRfX0zEirFE3mhZc
 gbne0en5+RrxDYhX6P5yCAwYf8BVmB0dLQq21IJScV5QTEONP8q/aLNK2189c1zN5dOyNVrIBcD
 egGw3lotKgYRo1iiHRxZu01ChoNtmmM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEwOSBTYWx0ZWRfX5gx8LDF64u43
 DDS8OurZC2XElR3IR/MlUuZA9EIznx8BTjvJM9OLZ1mlN1RWCQ25spjiHbJo58CUdhbOo+x0y7k
 Bd2408HJkZml8t2Us/YJpWLlbazRah3Ag+ajEURINmvFgmz1WvBFnS8Cne03e8c4DD/QF8c4dxJ
 Cew7p1O5Sg6ijEDraEEWsuTFC1jWgmhKDNWueZtZFYlpIx6juk7+hlyO50dzr2QnZRIF+AaUOmI
 LeH6CPdLP2imLyi3ZQDep4wfnomvWOfuqPDz8xbXOpddDWRL+Jo8V1Y0GxAXDdaIOtwFVa5FiZx
 iOhdc5mi4a7MfeyiCwiKdAspJRlf2GlrSuAKTN2dqyN0g+v5ya8NtoakA5vULds6gfdvUhoj3rX
 emTZ1JBregTLKtW2gT6Es6zf1wCYjH8hDj+xBFiRY1gxIoC8nZSJAlkpE6tHjo9YvmM3biIgS22
 Vmqy7uQbHNTNaj7uu5g==
X-Proofpoint-ORIG-GUID: EBr-kjNX8_G46Kkatoym7eK0SNTNuIJC
X-Proofpoint-GUID: EBr-kjNX8_G46Kkatoym7eK0SNTNuIJC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210109

On 9/20/26 1:08 PM, Dmitry Baryshkov wrote:
> Only a530/a540 have a GPMU.  On the other a5xx parts, reading the
> 0xa800-0xac60 GPMU aperture during a crashdump resets the board -- on
> sda660 (a512) a GPU hang thus reboots the SoC instead of recovering.
> 
> Split the GPMU block into its own array and collect it only when a GPMU
> is present.
> 
> Fixes: e20c9284c8f2 ("drm/msm/adreno: Add support for Adreno 510 GPU")
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 49 ++++++++++++++++++++++++++++++++---
>  1 file changed, 46 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 5d96b8f63156..3974aaf6fd33 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1337,9 +1337,14 @@ static const u32 a5xx_registers[] = {
>  	0xE800, 0xE806, 0xE810, 0xE89A, 0xE8A0, 0xE8A4, 0xE8AA, 0xE8EB,
>  	0xE900, 0xE905, 0xEB80, 0xEB8F, 0xEBB0, 0xEBB0, 0xEC00, 0xEC05,
>  	0xEC08, 0xECE9, 0xECF0, 0xECF0, 0xEA80, 0xEA80, 0xEA82, 0xEAA3,
> -	0xEAA5, 0xEAC2, 0xA800, 0xA800, 0xA820, 0xA828, 0xA840, 0xA87D,
> -	0XA880, 0xA88D, 0xA890, 0xA8A3, 0xA8D0, 0xA8D8, 0xA8E0, 0xA8F5,
> -	0xAC60, 0xAC60, ~0,
> +	0xEAA5, 0xEAC2, ~0,
> +};
> +
> +/* GPMU registers, only valid on parts with a GPMU (a530/a540) */
> +static const u32 a5xx_gpmu_registers[] = {
> +	0xA800, 0xA800, 0xA820, 0xA828, 0xA840, 0xA87D, 0xA880, 0xA88D,
> +	0xA890, 0xA8A3, 0xA8D0, 0xA8D8, 0xA8E0, 0xA8F5, 0xAC60, 0xAC60,
> +	~0,
>  };

I'm not sure if there are holes in these ranges in the hw, but msm-3.18
(8998 kernel) simply has:

0xA800-0xA8FF
and
0xAC60-0xAC60

(both ranges inclusive)

Konrad
