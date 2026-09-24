Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145AC3F4DD2
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 05:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790228650; cv=none; b=JnuzIy2j1swyl6vSPZrnQQ0je/eQvfiKJ87fIi2Cx0BUQQXDNVgKSE9h3GFz6xVhCaEUtsIFhO5mPMlAcH27SF/x7nJqdlnBzwUGpWM8VJjqn8imBM6sWi+D4pXrE50pLL0+FeMlptVpxbc/4j5fMovIB+l2+sA4f+ceSx1SHvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790228650; c=relaxed/simple;
	bh=/5nGC3DI2uQnuEckbcMT4n7vOg6tU5KZ48BGgutQ0kU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oChB439r1nLfbb9RexHKjvWyblZNC1gegtzVqQw6YvO+BCz9hozpYwuScMOVoeSqEwfh9sEh76dtDM83XjzdgseSV5NZmZe2Dub34e4lgrjV3HcPKSJn3O+yFvZk10XpFf/ZwF10tx/f1yZBPpfepTAc9kky9AOvds++c+DiaBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ChCZ5MRN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uwek6veZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ChCZ5MRN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uwek6veZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5e92r772430
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 05:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u42SO957172KIHAPRFEnb8SUe8Sdylu7eyZ5jZhTkfY=; b=ChCZ5MRN2vWsXFuq
	FTsDXspcO1dAVpf/yqBdVW1LksWBZ6qdWMd8pcAzsc/Zh7EDQ9rr2yp+2fxuiMsf
	WCSzA9nwh+IvFKv1ESgP4LvLxyCpqrE8J6rpbnqtrpfJd5Eaku4uhXVTSn/Us0Ow
	acpEJaoZBZuEIzu+wMsuRurzkG5v6LjCK9IWk6kglvmYuVAZP4YafWAp0motoQNG
	MIa8B3mDSpP25csg23xmM/+sqsMiZcInZWxDi8+vIALPGh2zTMEwTEJwjDUIiNc/
	uhFZIv25qGKPcns5Mhwoy41sqeE57GMqSUsuLwpHGRILrDg6s/86WJYu1vg+8WXk
	wH9fjg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr909528-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 05:44:07 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-32850005b6bso2169819eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 22:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790228647; x=1790833447; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u42SO957172KIHAPRFEnb8SUe8Sdylu7eyZ5jZhTkfY=;
        b=Uwek6veZBxTDu7IhzvfOTOJ3v0JMmhTNk/Q/znjY6ucXMKAT6JxERXt51dgeiTrvps
         7B09hpbTvEap5tZFAJhu6afycAkfiVomY9V2XPDPyhHDvf0Y6feCpodMKE4GFJ+pQpMh
         oc5zZnUcaWd+wBRIqio/Hzv/jTuzciFF7OsgN36OWputyBvTIOpYGsESKI3UezcmviVw
         CrR9u34HbvKf+Rf0zCejmc8Pp1+ETrayltU4Pns4PA32QpzdUGq8albq15/l542Md6Ok
         pz4KZbqozV+odhzkozHpBcEwTYIW3KaHRcvTk44DqmQX2y9LlDGOobFCMSUY/H/xhRm3
         trFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790228647; x=1790833447;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u42SO957172KIHAPRFEnb8SUe8Sdylu7eyZ5jZhTkfY=;
        b=KeGbqY59TkwtalJWbfkysfuvrSSWEGBer3u5V1CE4sz2jOKEZukbzdYJHmDCm/UcDa
         EVBOQlnEO7MpJFleW8UXETmNlNzOHDH2wTM+djSihL7pxyIhPmEBDFKysF6EVkkrp6y+
         t28QBHD00SGtAfGBBjwTLZs+zWhmYQY3d1ZJ+w+qLy7CuM2nuNUiHwrFGRyaqE/MiCdJ
         Wlo3irqduI1Yo77Z+fm8rlWcpjejNMiJj2INQlHO//mQxh97vXfsv88jdc5xYRmlX//M
         e2c7caaDBSLaX7F9ZtgFddclcRuQNC1Gqw8IJbvcyfSLR9B9G3BL0dx8eXFgfsoy70VJ
         J4/w==
X-Forwarded-Encrypted: i=1; AKwUvBx1pp/Zf2udpdg9T8xt3y5t07nlnbVQOYDOjT8DPGCdCUh5KD5s/RhczudCWvnwZ3u8oSyS6wY64gttWzZV@vger.kernel.org
X-Gm-Message-State: AFuF++kBa404eTy9s68bubBfby9PlfKDLulbn1T1TLJA1MuVHtAACs2x
	ZMI1caLdpzXKS0aJvzpUfpo+DayNIkQ3o4uKi3nlplnybuRMgpYFvK61f4i4om/v2F4ayVoVCoX
	DX54OaNkSgLQA1isDmdHQKSqMfLvWmWnVl60JwAASuSrf6NOsBD9QCyH7yMexjUHdoy+t
X-Gm-Gg: AYBFou1B3LDa/vTw1vSVg3KQ0nn8jQLYMwYvU2wVvzi38Z46IDRCj/g03vugkTBldmR
	SbJhKRMOY7iQRHgzOEfPvBEdH3YIT+U550avnQrqc+DHek2fin9I+qmgdeL8ir4M6TxFSrU3gDY
	s8+RKXsTvSfsUlJl1PeWM1qplyUVfFV0e4Cee08P+iNR91TDjHeoGfDYEvjbKS4WSbf4l443/Mb
	e00Jgizc24bDVFyIKdPfxnWeo07niacZA/DunbKU6kyJSZlOKMOjn5WYvrHKn9M0dP4/PVzscFf
	yQGV3ix4+OQX0uhLW9vbqaDLn03xAHdzuD8WFiUYV9a22zwmUvz3uLslS9dUhIwf7l+WJhPtfti
	542L66KIj/AC4EnYFRbItvWxUTmKQ
X-Received: by 2002:a05:693c:88d0:10b0:33f:155c:e8f9 with SMTP id 5a478bee46e88-34004a899e7mr1045207eec.14.1790228646554;
        Wed, 23 Sep 2026 22:44:06 -0700 (PDT)
X-Received: by 2002:a05:693c:88d0:10b0:33f:155c:e8f9 with SMTP id 5a478bee46e88-34004a899e7mr1045181eec.14.1790228645831;
        Wed, 23 Sep 2026 22:44:05 -0700 (PDT)
Received: from [192.168.1.25] ([122.183.173.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9625825asm10513616eec.13.2026.09.23.22.43.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 22:44:05 -0700 (PDT)
Message-ID: <b2d93cb3-2a07-42c3-a030-5d8ca951d3dd@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 11:13:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] ASoC: qcom: lpass-macro-common: Add missing v2.9
 version string
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
 <20260922-add_shikra_support-v1-2-6c6cb6444caf@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260922-add_shikra_support-v1-2-6c6cb6444caf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAyNCBTYWx0ZWRfX2f016IwyQyHT
 JJa/U21SBHeoVN6CLYmUR8/fZ2h/9X++svTDhO8nOZSO6ye8GzU8PP4MICbLuuUcYLibmef6D/6
 8Qpm6ctZGtjed60fapVsgnGe89t1YXA=
X-Proofpoint-GUID: S0TqahY8SoOM4n97FnNoLoRBTA2V4Zxf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAyNCBTYWx0ZWRfX49k8nBDPMz4z
 jfn2uG24fZl6WwPbcctqsl0n/wS6kyTxPff/9gYyfVaSPKi62NX90lbiH9BVeAOpCkMMlnIDdep
 GFwoshrX9ybyp1zAClIIzQ4ISzV4oakhUcTPF1yQZNlFlNf/+0MOVl2qdJPSQdVNWw4VE5mjXoY
 Mlv23vktSI/z+Aj0jdbdEeXHhvRvxr6KAC1k062aPE2ZK9KLRFpECWzlMB3UTJPRgAPAr2ikdr2
 utW+7pxXWxE38UnRKAoXvxZSFA0NOs2VMPavlBRfWObQn6WcRL6L3r1tb95vAE79arF0dtbSgbr
 aNFdKjxcpO9zn1mjSoyg7FiFAvVodmIhYmqMQM1vTFSkGoSXX+n+tsrdqZiHb1AWKpI4eIPV2u4
 mnNboY+yzN9TIG/5d5RDeeYK7FqiXTOP5VGv5SbOfzZBqfQWwRTNu6IAmJBXljJQGm89P/6Abe+
 GYrrNKvNj1V8nXbXtQw==
X-Proofpoint-ORIG-GUID: S0TqahY8SoOM4n97FnNoLoRBTA2V4Zxf
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab4b8a7 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=uk8ae9/F1LYL5lfeGCaUoA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=kbTR4NEJu8J_kXnuzwQA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240024



On 9/22/2026 3:12 PM, Mohammad Rafi Shaik wrote:
> LPASS_CODEC_VERSION_2_9 is detected by lpass-va-macro.c and consumed by
> lpass-wsa-macro.c, but lpass_macro_get_codec_version_string() never
> learned about it, so the probe log reports "LPASS Codec Version NA" on
> those parts.
> 
> Add the missing case.
> 
> Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---

LGTM

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

