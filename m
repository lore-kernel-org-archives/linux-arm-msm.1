Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416312;
	b=iIqzl9Xhwc6vlImtjY/1LdaKkCm+6vDtuaWCZVKSkRl776JgBE4izlf4+exkTAW2lUAZ
	 5A9cdg+DSoaGP0JOMEveZD1p5XNwXjrDnS5oJIyvTMV3Xb9dyO7/oxFa4Cg7utlL47iYA
	 2/CduuouK1PiYZImJabQL88nS/nPIpvGYGH/3KiqMYP4W/FyXd45vXOKkKQz4fJ3lPmdx
	 ZgqrdTg9sbb1AP0vaP2lJREDe9H16u3jpJDbKrOx6NCqCKaRi6l442S0QDMLWbVt6opNt
	 eich3L8j5dTEX5uQbbKs7z1/AEuQkAlzNsBBftazhc6RIHekqW9f0iPnNciXXEGgMbA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416312;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iVL4AgBzRjfVaxiNh2wtau5x2llOdZbE8OF1pGpYIH8=;
	b=PY3Y8fO3+dLdTocYWxKFOsbqXWpMYFD9oEhbWO1t8XeWwEKpFFBOfLSD/x3aD8F5Bjhx
	 BxJ/iK+uoY1glIASpBjWTLrEp6aHMilEagJsOwwuadTtNOB39k/Es1rbBJsMZg+B37bnf
	 Kb3PJFCXktPqTsLGLimsacRiZHJJ5CybtoUwL1fIEibPzulPvRJWnLWIl5lDJ5tGe+yIM
	 +T5NIBpxYXLTZjSo7aht4zgXY4Gc4E3diu69UkQB9QA2+RGj6K1FSwp4L60knbuSig3aM
	 tVj2LKC7i8inirNaLgJzND25DJ3FxTdVL9sI/B4SNgl6boJtKoTt8KJJaQmXOGAZeNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mBKp1ibT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HVCHrBgG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A372B606A332
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 16:58:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A372B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mBKp1ibT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HVCHrBgG
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0HGr2651040
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 16:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iVL4AgBzRjfVaxiNh2wtau5x
	2llOdZbE8OF1pGpYIH8=; b=mBKp1ibT/8X0TXXehUE788rDJONH0PffKgI8OJoN
	LjpA0u/b2doe3unAvmlOxFkhN5D499Yt9/LQwSNudb6vGhvRb55PJwfWvCcFreNr
	RNfaNqGUGfcyb+judh1ANtRkhNdoKa6ZfvdN3aO8fT7/U6JOvlHE4XXoiGgfldD7
	rQQMp4tiSqPr7gwyW95A1fshqy4pTohfezwTVSu/IrvRQCVo7CA9UYXyCiCGkLMO
	2umEQcvFtC1DL8K9mSPkLAWfRfLvIzJwa+h4aZDP2OF64rUWs9vmG/Zz45VKOjW0
	Jk2cfLNaUtUZujvYNVANK3/OgHHewGl25jHT8OnDB4PYVQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnmbs9f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 16:58:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844cb60so8621385a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 08:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794416309; x=1795021109; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iVL4AgBzRjfVaxiNh2wtau5x2llOdZbE8OF1pGpYIH8=;
        b=HVCHrBgGxdElOdEoDLWhGMjtXWkAqlKyDBRzxKI6lCUamFfgDMKyTPuHA3HJLfyL1o
         NWT1WU0WqgP5ax5XzfxClbudyshnvuuiFQAjiUOdrMaNwe10c9MFip+DWLPdWZceIYiY
         w3VKi5l5uIwY1pNXjKkmBEXXNHDGhPxLHJVmEwt+1K/0TppGuWoKlHqEiH9TstdFFFSK
         RxKTJchXxRYrSGHeWdaU3yUkntnevs6FeOEnLxy2lNoyBiK6zyERwtgnKjIb1tlP+Oh5
         R3pi3wpHIG8BOMz+4NxrBakKTjrSc8s7FtirNDKsQIdAFoohcaIZfn6Vr5dRACZBRyfT
         iGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416309; x=1795021109;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iVL4AgBzRjfVaxiNh2wtau5x2llOdZbE8OF1pGpYIH8=;
        b=rMvVuadmcmPaTqbo4z++B81WSHyTmE6nACuBJ/TPMqPBcgTSN7FYRs2AJYTzzBfY5R
         Jw3MjK6S8ssfpywfEfgc4vEm7vJGEPULE43pT/OXhihuCwATZzB29aUbdzzE4W9pGDEt
         jovqgLtPRM/m5UBXFMBNJ+LxBKhFNwa/oXgq3hDSDNXS7qWBAjeqsx8/zQkap+BkqNsG
         ZIzCUq18e5x+qaJp/dcr5CldHYJqpZ4/wpSDR9prrD2IMl30Q8XY0NInj0ypkA6RD4LS
         sRQ/plgHlu2YKQ3qKxoZMlBZrG18d6JoTtPd2iVazrvQ539ZgqCu4o04wAwiU0+evBX8
         kGSg==
X-Forwarded-Encrypted: i=1; AL+hErHSGc+FpPBADsSdvkIWzjN15o2Jo5EPi35zCDQ536RJn70Em0uUdByRG+r0el+QHuaWsHs3Eb6s8QpDoaBB@vger.kernel.org
X-Gm-Message-State: APuU4Z8MMPSGD8CfvmzKVUnrJOZpUY/a6oO3XkIst+GnIr3PYlIMl1yz
	n85uLeNK9u6Xej5ec7KczDeUwKlgiZ706xpda14uIr0X3Q13Og0r06NfThMCJXm4AIBoFbXQN6N
	XwokpCzFpTiGVm1qIYgvFLfFQb6N+iuIN8bSpNCRxW8y5WaFhrLfaIMMLw8Wtg8216Z/i
X-Gm-Gg: AYBFou3Wrhyg4P++HE2bpwXllms2g2FHHPMR4+PqELMetMcSa0lpOO65TwVJP7WIzD0
	3A5tNUTyVTQeXmGwhUaIvjC+Dyz6EbTPvnIqVyH+DMZNkqsK45tvzcYrj4+VEsKnbZnKL20Ne6E
	XaUHVL2BybRqQuHoGmDzN3M3hXXqv1yjc9S+BkVlR+s2Pr4Fc763SOLJL6EWB1luFae5hsMZppT
	Q5JheqM7iSN3dqToNS77FEaWSo9gG47J71arjmJs5R8Z/2sjj+3PLsFkR+S5QbapOvBaVS6b8xI
	UrEnu7xeuWUCNs+WADdQh3NR04FiEm1PmlA649qYpA8y2iIAj5wPnHgmfAsLIHEliJIrl1efKKJ
	AoEn9Jtjl11PHlrZT5x5+YNeHIagr6j2QAW8S7zYRKEOk9BXl/sn27D2YUG4cFaGPXh0sJM0oq1
	cKBKX8c781aIexf7EOPxEQnTBdxlVv6LdOrTLKJH4qTlYRTN7tiI7MhjsY770Emg==
X-Received: by 2002:a05:620a:4556:b0:947:9133:661b with SMTP id af79cd13be357-9493301e750mr1790085a.11.1794416308596;
        Wed, 11 Nov 2026 08:58:28 -0800 (PST)
X-Received: by 2002:a05:620a:4556:b0:947:9133:661b with SMTP id af79cd13be357-9493301e750mr1783385a.11.1794416308035;
        Wed, 11 Nov 2026 08:58:28 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c160d60de3sm314560e87.49.2026.11.11.08.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:58:25 -0800 (PST)
Date: Wed, 11 Nov 2026 18:58:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH] drm/msm/dpu: reject undersized gamma LUT blobs
Message-ID: <h346otfneexdgpndvmydknzuxuljywvflaoss3xppblp4k2svo@wcanozcwnysb>
References: <20261013020425.408928-1-xiaqinghuan@mail.ustc.edu.cn>
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
In-Reply-To: <20261013020425.408928-1-xiaqinghuan@mail.ustc.edu.cn>
X-Proofpoint-ORIG-GUID: rgLl68auF1F28GX9D6NZFlKQwIXpMmVI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX8sHG1pu52ZW0
 35fT4O9/FnL9cXDKA9YN6LGBX/tLQ7Odv0Xvlb4+BngbhAlgrwyc+/XcJ0B7IM5tWjo5jqLSJ4W
 EtE1LLWmY40TiUSADVxvX8QFblG7zcg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NyBTYWx0ZWRfX1iays8sS7JyI
 TDuSbIvAX2bWjMAgStkG4/1Mi7akWnJLxlkviOj5zWcaaZabMRu4aJcFxC2Fb+ZY+gWYSuZcRwD
 KoeS7Q8+FEixt+xXCjsQ9myXgXit2h5QDFAiGOMeKOt4UlO6nEbD/kcPguJ8qUCfpewpFTjs83o
 u9EwUfkC3Amfx7R4r1DeSLXop7TX/MT4+MTrZmzxYseIF64CkC0T3Ww8pHM9WGnEDAUdXoW7uxk
 EgE4XHS91WpRaJXOkX21Qo+h0ZdUSUL45up4Ef9lyoISWMNxWHVBXr8jDuXVJn0akunQaE/8Ipw
 JZp8wVVM9d+H4EiplMCERftt4g4FydHGN7y54XkfsyqkgnM98xsbJhyfv81zcUsSjCj4dKbTRTl
 8kjQuevZwcNTowc6xmte+CfvMNbXcHuAisyv4JVe1gzT7+dVEiAlKJb6LAlSL9IdxCAvmE+tjuh
 uv8c4EW1T5/wAgk0VqQ==
X-Proofpoint-GUID: rgLl68auF1F28GX9D6NZFlKQwIXpMmVI
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af49eb5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=w7uqKdwnDGIzr5GqLesA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110067

On Tue, Oct 13, 2026 at 10:04:25AM +0800, Qianhui Xu wrote:
> From: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>
> 
> _dpu_crtc_get_gc_lut() packs DPU_GAMMA_LUT_SIZE entries of the
> user-provided LUT unconditionally:
> 
> 	for (i = 0; i < PGC_TBL_LEN; i++) {
> 		val_even = drm_color_lut_extract(lut[i * 2].green, 10);
> 		...
> 
> The DRM core validates the blob against the maximum size and the element
> size (drm_property_replace_blob_from_id() with max_size and
> expected_elem_size), but not against the exact size, so a blob that is
> shorter than DPU_GAMMA_LUT_SIZE * sizeof(struct drm_color_lut) is accepted
> and the loop reads past the end of the blob.
> 
> Reject such blobs in dpu_crtc_atomic_check().  This is reachable from
> userspace on any DPU platform that exposes the GC block (SDM845, SM8650,
> SM8750, ...).
> 
> Signed-off-by: Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 

Fixes: 39a750ff5fc9 ("drm/msm/dpu: Add DSPP GC driver to provide GAMMA_LUT DRM property")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
