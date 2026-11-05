Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793914741;
	b=E6pVltDoQkZ++GlBLiQs0uDgRx3/KBUzMweOEGaV8uH6RS+WcGaWO3MhgAGreOWUr1Re
	 ffPfvp4+hb1D5PZb4vViUbmZ4J1uD9SQKjF8oDm/4D3sBT80GlgeGUp1Dn9ggtboyAdXi
	 ID968ZFKFy4DQqsRSqeK4db2ShTgcBoAjKuRVOWNsqlQi9+d7xHObBgnM1l+0fr+YxecN
	 5v9in2Mc1hK2VQqtVLKUcpBtW59RdruI92gLJ+MqKg6oWYPVv5Kq+jQkdLnVGwqZOlSf2
	 qSBwcO+vynh7NmFqBBZaDkGxauIaP3iY1Wlt4ixEyq/e3f+2EaMHorJ1q6zL7XShQmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793914741;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Jv1bi07Ci6Wf/YaWMkjal9ROI5Op0rlvb15GSZqGEvQ=;
	b=E8c5H/PTt+c0uTl6O6H40EsoLasOGl+8t2h4JbJ6Q488Gb56LIIzA9+OiqrQoqPb5lin
	 6auplGvQgQ9koAh3QnUrcGu58wMNCFQiBrE+H5gFLBWhXjph8/e873Fmn+kAQlrraAAjV
	 BnJFe5uMKsKK+YxIVEBjYfh+Q0KFg1sBmB3bkfeY1OnvxifwONeQ9t5lUt8Tm/rHrY8kW
	 UHQp3F3WRldpAdzHGlkSqRA2ywb4Vly1sCL4eSmP6YufnY8x1gRIsnLflht56KXCwY4ad
	 XIRRKRzAsezycBoXUaPqRrJ37KJ4C7ANaPbd0y00G98bwY/EMqvAe3C+yVtBipE2GcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QjNyagW2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DKlEAiLE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B17606A32D
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 21:39:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62B17606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QjNyagW2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DKlEAiLE
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5L6E1O1898045
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 21:39:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jv1bi07Ci6Wf/YaWMkjal9ROI5Op0rlvb15GSZqGEvQ=; b=QjNyagW2t0YDVsPm
	xuG3mHlKojV9a3jZJ7AqT1B4IgCLZaHpmVhePqzQX3p4UDxjaecymVJCzXene17t
	/XhFUvPvbXanmFDF7hNjJCtitsMz+5ViTFar/DXZRPmox0QlMSsfvZLg7/5aE5bG
	qrME+9vQSqQnnYMF7L7f3EKVUIoEI+cFKIWapqUuNT3ydJPohK0NUMJnAVK95juV
	wbnsVLv5mu3w8HKdJB2mUTey2Sq4sbZN8YLvn0z/VaCeKCYtx07/qexhsgsM8P8i
	R8fWxvKPpW88skcJ1vYpezasRc8qs4vJdz3DDymuiG1P64l02QPvyqRiJPl26948
	qSEydQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrm9v3xrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 21:39:00 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so4495157eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 13:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793914740; x=1794519540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jv1bi07Ci6Wf/YaWMkjal9ROI5Op0rlvb15GSZqGEvQ=;
        b=DKlEAiLErhpqC4yjFEmMQR8fe9S3zuhglaD9coBDisU3VHYMtmexZMwwufLQgVh1Qq
         AY78ub74HPW23BzeTb77rINrLOgNrDZZ+A19fkgNDSQTP0ggnLNuZHWHbk2TmeuPq5XD
         Y48NVFpGdW4WPaLGUVw7Ke5n0mavi1rjAzf2zZCMEanPUIpYWaLyHEOycjiAv/mpBBLy
         eJJfs/9NeP7iw6blicceG2xMXY6GzRxID8SQmRQ4r1es6kid8GRtO0+wdsgwxEIagIa7
         1/za4FrztJtnksKie8MYXuFcBbQttYXiMFgOspuhxWkLlxJe/iFLJDignM1t4B8J+O8y
         UuFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793914740; x=1794519540;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jv1bi07Ci6Wf/YaWMkjal9ROI5Op0rlvb15GSZqGEvQ=;
        b=xxsl42ExTo2ZytBNIz5kAZ19vcziZSS0Lzsz+P0XWyJi5YZnDQvPGTx3zXcvSnK1OE
         xsCkLar91N7nxXZ7xHnp2W4O33X8fO+gbA++X8CN/w34z3WqRA5CVM/0J38oYokUxBKR
         JvFsgXndrOkGaN22TYQwx/CzTxW+v+dKTZNuugUaL1rh7XDmlBrCuSUsg1JuscrSNjHZ
         jXTd0jP4xs9ljHQvniBkb3knOGq44rDndE5NdIrxuFo9+Zycu2ri5DDYe+jmrgNwVBL+
         gPNyP35eLiB2NlQbWHvLLUVknem4vkypW742MBhRr9TPiyTWxaRhxtmVLziJmyg/vsuu
         aOQQ==
X-Gm-Message-State: APuU4Z+ZUtrtETqaxsen5Kc56fLgaSWiGe36JdVF9D578IXbu5HYDQAL
	eGneZ+Kyl7A42SxordAzU7sev+InOWsAcTINaNgV2NEdcShMCkIm4AuaWwznBlJXs5shOf/Y/zt
	Bi56M8ga7r1klxLGVqlO61Fm30FBw7vX674rPQ0TOHDXLkjiY/wqoVKtb0MHjPAp3nDgH
X-Gm-Gg: AYBFou0fDmYnD/ffvuoDROnN7TvPmO4rzZO36D75OwtbBGiaSC/WhObsYoghjFc9ySB
	AdGgSc7N7640sFX4B/ZAUQaeXuUGPWb3gqHkILp8elJ+M5SNV9qpD8A15KAwSkIsuV2ejhSfSiK
	TFa9g+kY+i/PVt8IRK+rU5oYGxFtuEfHkpI5uEktB9vb7YsqoY4arFz5aFa+ysCTKTyEzekOyWb
	t9Pqbz72sRNNPiv3KCDNURWEDgenwS3T1N4VTicYx6W+bCXFOAI8GTK/mHWoOoG0PkgVgK0g5bA
	xY18ux/XDmwbqAQdWCGl3Shn/LdmfN49pEJ2mM9k1Urd08klQtzFfh2nHYJ2GYMj4ctI/PROca6
	B7HgmCtdGgusZFWs524qBNhgAsbQ2ej1mv8DJPW2WhI0nJqfqeYD41E9Se0RmsjDgNyzjV6s=
X-Received: by 2002:a05:7301:fd06:b0:36e:16d6:f45 with SMTP id 5a478bee46e88-36f758318dcmr535695eec.23.1793914739859;
        Thu, 05 Nov 2026 13:38:59 -0800 (PST)
X-Received: by 2002:a05:7301:fd06:b0:36e:16d6:f45 with SMTP id 5a478bee46e88-36f758318dcmr535655eec.23.1793914739304;
        Thu, 05 Nov 2026 13:38:59 -0800 (PST)
Received: from [192.168.1.9] ([106.222.231.155])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f72dc30ebsm1033032eec.13.2026.11.05.13.38.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:38:58 -0800 (PST)
Message-ID: <9d91e39c-e29d-4e1f-804c-779a3aea21ff@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 03:08:52 +0530
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
Subject: Re: [PATCH v6 04/15] drm/msm/a8xx: Export slice helper
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
 <20261105203057.66520-5-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261105203057.66520-5-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4NiBTYWx0ZWRfX37PkAdJrxr61
 zUI0eEMGfieX4Qk9mZqAezeLqFcfBG5hiXyhMVQHbJADKGynv2T6G01V6zkG+0VLRUGSsaty9nW
 gkDMTTzunt8bvh6eKbANsiYfNstbRDQ=
X-Authority-Analysis: v=2.4 cv=KrHYSmWN c=1 sm=1 tr=0 ts=6aecf774 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Hj0ah+TxS5FywmoD0uLh0Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=QynUOb8fajV056UlVlEA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4NiBTYWx0ZWRfX4Z1W4Wu6Vp2U
 24gc8i2RjrIBEnfulirXpsU5BMh5gwd+x271SR1bJCOuvsCOHo+KYMYsFgcxiGk+HUqlmqfh76q
 gKIPwD33+n8pB7O8dI3gCf6TB5z4SyhZdMHR5LwJr5yu0jLs54r1CmcPFW4vUr9RhZk7w9yQ51q
 RON6XbHPXgNITHeGSkI2V1QOP/yRx/yhD+0nB2vr7jiMg6YvVChEku1BqAxaN0iuNvx3UTMRwoe
 G/WUAGl+/lFqZrOWTgzy+UC4SDbyJAmHnu4xB45+W9HGz5nTL0/D/NXkjJhDxz8V4tnQ/LIIVfQ
 8OdRD87g+/B0PXRHykrKulzElrQfJxxWQgtvXrr7wiQ3P8NzLi8A1pvQZQSHlAJUO1eb16x9AeY
 V3HwW56NeRglpmZyFQ7WRZ41xmbf14wXX+xPcFvvI52muwyDwZ4rZ2BaV2YOSX2BIb/ijdIpxeW
 DRB3RivKsYAF7KvLEJQ==
X-Proofpoint-GUID: QgjyzZkfaM9-AgqseuMxwxN4xadlrRGk
X-Proofpoint-ORIG-GUID: QgjyzZkfaM9-AgqseuMxwxN4xadlrRGk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050086



On 11/6/2026 1:59 AM, Rob Clark wrote:
> Something we'll need from the gpu snapshot code.
> 
> Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 1 +
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index e6ec85b20fb7..4a3898e58aee 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -357,6 +357,7 @@ u64 a8xx_gmu_get_timestamp(struct msm_gpu *gpu);
>  u64 a8xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate);
>  int a8xx_gpu_feature_probe(struct msm_gpu *gpu);
>  void a8xx_gpu_get_slice_info(struct msm_gpu *gpu);
> +u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu);
>  int a8xx_hw_init(struct msm_gpu *gpu);
>  irqreturn_t a8xx_irq(struct msm_gpu *gpu);
>  void a8xx_llc_activate(struct a6xx_gpu *a6xx_gpu);
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index be81f141300f..a29f8149493c 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -130,7 +130,7 @@ void a8xx_gpu_get_slice_info(struct msm_gpu *gpu)
>  	}
>  }
>  
> -static u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu)
> +u32 a8xx_get_first_slice(struct a6xx_gpu *a6xx_gpu)
>  {
>  	return ffs(a6xx_gpu->slice_mask) - 1;
>  }

