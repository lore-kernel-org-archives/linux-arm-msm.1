Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C1D3624A5
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Aug 2026 08:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787388432; cv=none; b=S9EJ7t1ZdO1/81UGy4RHINSCu7gN0VNvURwwmgEeeRZM0g54JpSJnYjUHYwwQDNg4P0PKqEPql2sYXxuL6Hf0kUFUgezmE19lf0c0kvYPDOTMKPLAN8PC7JLYgRQKQQZ4ZPTkmf8wNkmlmJrX7QktJh5EAiwar7mfobaOttXEVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787388432; c=relaxed/simple;
	bh=wMoeAWoSG/tKAcuQ/6pVYPb0wAlwRUU+jLDFr//YoP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ErgUd5QIuMbzJWtCDLa0adYaPArM1qjqh8gQ1NMKuMN+2SzioneCUzcc9asINQVUfs0wjFzXCC96moioGtPzm9qhsDe3oCVp/lvwhQGWQD7tVoAROMYSyd9wq1kW0sG6TSZaUTIaAbSTfrXdtE0yEWzTzRcmc/iE6GK9+xPlHqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EMTf8zbk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YURVtRpX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EMTf8zbk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YURVtRpX"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67M7xY4c1218094
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Aug 2026 08:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2xyiDkmSoXEYwFIOKDY5gdNL
	xvz1vUv06irZue3YGAU=; b=EMTf8zbk3iKHAyJfLjkSe+5z8Sjewl4/IaCraSM1
	bMqAHq0MdqFIUeqGSYKd7sVRnXmCwWBWJJh9ZN4lqc6bfeYDg7101XbuMrvNHBf6
	rVA6j0tfvH1LrUwYQ24Jpf8s9OJOexyxNPCCdoQvKcEE2TlVK/Pis+4BNicaS0DV
	Cm0RMalDlTx2mYhMjAaLRJTAocaSmzx1NBsLlLksVNEn9YlVcX6g3iLn0P/Gkm3U
	mbQjS/OdpyQeLje7/TAEd4gIEme3NhJwHohyv/hq6qp4yJPSqBjouHRMwAToXMaN
	okeS1VAdJcut9fhjCKzoaOiGhvgvfUNLIrax5NGHVyxGog==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g744wrnyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Aug 2026 08:47:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e538afe65so211191285a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Aug 2026 01:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787388429; x=1787993229; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2xyiDkmSoXEYwFIOKDY5gdNLxvz1vUv06irZue3YGAU=;
        b=YURVtRpXXwucl86Jtl/CRasr7prsgwcKaFtYh07IhBDaz6ehZH8RLHkbDPfUWbk1kP
         Bdi/zX6woJiYtE89w8KF7VJii5nHS1TQedkRur1r4r9/K/54BfXA4nFPFxVDxqLxg76K
         0fEWaHoHtYytHApEfzkEfDpTuGe22TZtmcxSU3Q7ZAguKkWhZT58TCW/lt4xFyoSvOBS
         fzMqOzf8JJVfXY/ZrnweyVRSUMVgKlYY/Nf5+5amPaabQfhr97E9ayERKh+045iJxJa8
         mg5PgQnckxR8MTsjwsOJKwFQ5fLpEGYU+7YEvEDndmMoAr+kJLuUmmlZBQb3AfDLWeH9
         GCgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787388429; x=1787993229;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2xyiDkmSoXEYwFIOKDY5gdNLxvz1vUv06irZue3YGAU=;
        b=X65YaDxpWiEsIEmcb7IkfowY1ggJ0JxQaIxW1MhUdmXv+Bo1Vm33dfwMoYsJxvVnBe
         z/by2OZAo8dKfv2USsFMrPrNUbhxKMjrcIFTbnbpFwLsJnz0QlmShwxHKM2Lix9OzAVn
         zHFinsnT8woVEhd2M9ou1ZP55UhZK934BVOW4bTGjFPAYSTxtu+Oq4u+Tlzk0PbzD5n+
         lrynd4P6OQf3bHvGzxCM3OWAlbpSzUKcbZoTGQZA0uuknhPgunDtl9rprYkeY8xr6Epq
         qaOGQZN40LDg17OXF5yraLTzHJ+e60nzlFaUAQ9eBIL7XfTdBbYFEkdV6swZrfML4zFD
         hSAg==
X-Forwarded-Encrypted: i=1; AHgh+RroweE/2arGxUs6GL4+WIr7FTo2lypU3kJ9d3nzWqG0NETs6MD0LQMMqGRUJfuxdKCxuZsWVH0KpU5vsT9x@vger.kernel.org
X-Gm-Message-State: AFuF++nxfV0u0sL3iy4GlbR8Wgoe6gfw2qBZdICKMny3aGmNWAt9JcCV
	qftHeCWPhJpNXaitjx1vOvgNnpgs/BfKvrzu46H3ZFQJ7d9GcXkh3QcehrFnoh8x+ofQ9CNUUBp
	X4lvpcwPD0SQMoygH4K/Lr6myKFUBm8t+vfSOSFM+hdVRkRbokwFlD7M8VYXoIA9w+TkP
X-Gm-Gg: AR+sD10CF75XzRn4zZbTdCkT4AYSx3ko2EXb39r3Yy5FinFfTHX5l49PsG+iR3e+Edx
	Ex3qcwbKC6E1Ob7rVUMDEb0DbXC2lwrx0rEGmAKUrkBd/g0kNqJPR3PyNcmdbENeV6CUwRO2Cqi
	KykuUkDBLZRxbrZZWV0kpqT+J5TzQPACsULgjoy96Z1ugvJ3tP4v278ziHEaJ8o4B05n7p1lqht
	DMfV+QwMhJsADOCoy1R2OtxUqF3UZ9ZE+0ks0bGw9b17HVwghHFiQQv7HxG190JrImDxgc7+i3b
	pFJAAFekUYQZiNvhFOkSgOkTlD/HUZ7T/B4eG7RF0sBytwIAKTaya/qcpFwh6OGN7P5kBLEj1zZ
	snUmiKFsG86l5tdN1mc7/gMXOtjcgvH/d4/pNl6YHYMd910+upwTks7uZ/hmJdOcL6JaBgeFpE2
	/W3jUyRv7ti5E3
X-Received: by 2002:a05:620a:4783:b0:937:123a:3b11 with SMTP id af79cd13be357-9373955373amr846530785a.28.1787388429104;
        Sat, 22 Aug 2026 01:47:09 -0700 (PDT)
X-Received: by 2002:a05:620a:4783:b0:937:123a:3b11 with SMTP id af79cd13be357-9373955373amr846527685a.28.1787388428651;
        Sat, 22 Aug 2026 01:47:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a1c2e89c54sm2840991fa.17.2026.08.22.01.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 01:47:07 -0700 (PDT)
Date: Sat, 22 Aug 2026 11:47:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 55/70] drm/msm: mdp5: Convert to atomic_create_state
Message-ID: <ucsot4m66fnajtgfz2ewtsiqemtlerrquxk37dlw6npb4s5u65@faoite334nqw>
References: <20260821-drm-no-more-crtc-reset-v1-0-fb793475c05a@kernel.org>
 <20260821-drm-no-more-crtc-reset-v1-55-fb793475c05a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-drm-no-more-crtc-reset-v1-55-fb793475c05a@kernel.org>
X-Proofpoint-ORIG-GUID: q53_f4fDhXtLky9qwJAHx-k49VBYGrMg
X-Proofpoint-GUID: q53_f4fDhXtLky9qwJAHx-k49VBYGrMg
X-Authority-Analysis: v=2.4 cv=KuF9H2WN c=1 sm=1 tr=0 ts=6a89620e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=tVI0ZWmoAAAA:8 a=EUspDBNiAAAA:8 a=e5mUnYsNAAAA:8
 a=JUukOM_wEb1cdPDkkI0A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIyMDA3MCBTYWx0ZWRfX8mJmNOaEUoqW
 BpwvxoOllIma0IBNlGxqXfC1T2ZBz2Zrp9ZOFWQPiTRp01zVVaFd0cY+xgJ21P0yy5Zh/whKQA7
 gXgHTxuSu9MRBJe5t/YdEao1UrZp8TlM4Kzf0pYnqKC0gIn/Y93nYjOHFAc7jLfw9ZVpxifjRc5
 zvEzTnRGWcEUfIOmMEqX2WdkolD6aKVthv+I89SRbe3jFGBNN2jm+EReSkQ9xefnrkLuUDI0BQT
 oQO7v9hYLPJrxSUs4ecyDZvxB9f1FM91C7Lco7iBFAaMeNqtpxM8MaQbD1MiZ7P1s3X/2dlVzOF
 yrvXLVDWwnOaDqHZ+uvdxPeI5Wo+X88UTzI+ewtFLYZTeLRfIc+8xkYLPO5hvQcNBy2NhCb/j53
 1afEDNh6kDhYSmRTAXc9TMfgRHmocmdFwRYUn6pjTWUk0oSiQjuekGwC9551w6C16FhUHSbwfZ+
 rTq0Sxomx3SvRsGSscg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIyMDA3MCBTYWx0ZWRfX4Jwj4+cMUA22
 n0zoi4xc2A4eJRIudSyp3iYoQNwDJghnVUQIB3ukCmUA/QlUXlHBZHano494EEbhtOKrq2Ufjx7
 wMPtSw9lh2LbcAo6H4PhH1rCiYDvdsw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-22_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608220070

On Fri, Aug 21, 2026 at 04:39:31PM +0200, Maxime Ripard wrote:
> The mdp5 crtc implementation provides a custom reset hook. However,
> this hook only allocates the state, initializes it with
> __drm_atomic_helper_crtc_reset(), and frees the previous state. It
> does not perform any hardware reset.
> 
> Since this is exactly what the atomic_create_state hook is meant to
> do, minus the old state cleanup which the caller handles, convert the
> implementation to use atomic_create_state with
> __drm_atomic_helper_crtc_state_init() instead.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
> Cc: Abhinav Kumar <abhinav.kumar@linux.dev>
> Cc: Dmitry Baryshkov <lumag@kernel.org>
> Cc: Jessica Zhang <jesszhan0024@gmail.com>
> Cc: Marijn Suijten <marijn.suijten@somainline.org>
> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-arm-msm@vger.kernel.org
> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
