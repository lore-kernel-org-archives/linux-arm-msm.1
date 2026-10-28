Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793150098;
	b=LbKDMY69Qj8QpntUd7/rU9DZsbje82VkAaeZGaH7k/cSlxVR1aRA1N35Q/CIqB8uK1TT
	 EGqwlavetC8fO8TXlbD9fKPh/T1hlxFLhfxARtHnN4kpGRifiHpvvZtMKNZFOYblomNno
	 FawdTwK824DiCez5eeds3Tyheqkl3BnySmU77s1+PV76y/YkBsYsRYTsWHnP3l14Y7qK9
	 10o/f5odP2K5AWbWHsF/e95am1reapxO4PwVwrWguZ5VNd22YuSNyLlIq5MhLsUCPF591
	 PxYpNg4esbPyAjdQjEqySCz6/8E//l+1DWaxG0yR7hLCEgtis5mPvcfnMqcQbgOITYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793150098;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xZH3utzkTV32x5e3Qo7yc9QKlSSV4XGUFUs3fU/VUmE=;
	b=CAvgc49M9T452yA1bqXj0TmIgIcx1Go/jW6MfXjkbT22pQG9Ms0wuXHtnjbZKu0XDVFu
	 IJ0VvAiv/dvLjWjX7HzLHgwFI8ueuxh/uw+mZMUXPDoJvJPLT4MxgiCIibgqGVBqb7AD8
	 P8ns41uCSOOE4Arh4KSbJ4ZA5YeGMbROixzGpq5CcYrp5N23O4o9JPRR23bTd7Xxz03eB
	 AWMtb6aG7FAV2eUmchi37RBVYP85N0PkSQ/3BhW9TsZ8BkFzVAuZwLRZ1WsLp/ERRFpIp
	 aORo+JjK8SbVLo1neDb4Lq3WpgQKHdHzMHskGMe7ku3rtwYndspo6APAvJKfflNRi4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y+vSERIw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XVC04pz1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90873606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 01:14:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90873606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y+vSERIw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XVC04pz1
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S0jKlU2734887
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 01:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xZH3utzkTV32x5e3Qo7yc9QK
	lSSV4XGUFUs3fU/VUmE=; b=Y+vSERIwAKZcDLiMG2qxIfjdEWYbo7A036dCT/dE
	aug6zLuixgg+G0du54YZ8eLh8j66I4gk97XD2Ju3GXe/VsAKA8AAaZVJ/chcsu/K
	p42DyppHFHITrha/JroAmgpwDTajQrLTqrooMQJ7isegPzIfFy3yurB8Atna+/yE
	EXksK+X1LX10lKWuk6ROl+RyAxWROTJ2xjulw3WW2oEeG6Z6BSTu+esvkUgu53mJ
	5rnShGoN69TvP34c2p/SPVl/we9HgIejyQi5KgvmgnPSxIzfIzb+sWcJi40Vjwi4
	C4tSe5W3pLHP/99fEgyQYWgcD8A4+GePfqYNBnId0E2vBg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjux9avhe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 01:14:56 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eaad995a7eso173313e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 18:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793150096; x=1793754896; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xZH3utzkTV32x5e3Qo7yc9QKlSSV4XGUFUs3fU/VUmE=;
        b=XVC04pz1Mc9IZBMz55yAbWDyNb4BPcL7xcZmOZ8Q9W3fkpCuJ7juVbM8Th67GyNv+P
         EZOo96vu6gvJ0EVRVBoBbVfHagQtgjPTy/U44RapGMJ171xFhE7KXZVv/c+MUuP+ANcR
         CHXGDzurkEzhy6B2JBmwjIQqplAjDeW4E6GSPvK+ba7UEsWTN43Q51X8dksEBGMHSXC7
         3QfJ/6fj0HK2TfYj+EaykJkdRbw1eX/fN+OVrAV789NvfXxl99DpGv5dYKeGkPnwHXyd
         NgJDceeoq1+DcXYq0zYUel2lmQVGESVn4Y/lrhTweBBCf7qNu7fkq9tzI5tqqcP6rgwd
         Shfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793150096; x=1793754896;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xZH3utzkTV32x5e3Qo7yc9QKlSSV4XGUFUs3fU/VUmE=;
        b=vYO+XweisIR1v//VLT2qkEp+uN8b2n97mwMJqSU6mA9PYwLngcEx5MKeeD5cMSGk4v
         5fNd80vNZlQG6SUqZrJICttDbt8klnGkq/rTrzEgSpMevPqtxBOZ+GMNyG/BG+5nruEd
         47MWQOK4LmHyzhfKoGyHr/zZ2ZOR/rHzhIXXl/iqgslZtLCWUpItdoHUlgt83yYWhv3j
         3Po/nIZ4HY/KfxIw5GIdLrZZM2N6TTBm6jO8+3pqi1I5s4NszA8T7R6lNhK3xhn7IGRH
         3rRKkdVWTDsSFvSIU+cxoxKNSMP1ctVhKQxDmfNLRcRNcf27+mr2JcXU27F9zcCmLUFc
         A3DQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/4Ikw2Z2JyCgk21NuCH4XoaFSb9LCekMIPMpT29m9ZtUj/AOhO8nocTXBzf5moliByO2beZVo6bx7HwIG@vger.kernel.org
X-Gm-Message-State: AFq9FYIMP07Esn55DfNYLSAubMgz0kCTmcwvONOCd3tH3XsdOBfBmVYj
	QsQRHIAHvJ/Uy6heQ0zyNdS5eh+1UnH/Dd4NslGoZtHlaPnel1WIqs6SjGCaEfTFgtsPpsGOhtD
	2Cyjla+/EvxQyy2X0RgpClfxd4JG/6s0wW3O6iwshs0FaIDmd7pdd28gX4faT9SA0Atc0
X-Gm-Gg: AYBFou1LTJ/32mPAC/PB4ftnB9P60S8bzRRbn0I9Qm47kSVc2IQqYZM+j3jnoGTvHwp
	eeOTl74MX5VNK//vSZfv5GgabbhY4hUF8VFZxwvruqb0HfLsWmKyYI6MqR1rXBSqiLfmiYYHJJ9
	RD6SrNlRn/bsgl0mArM9GRhFYFukM5GNtY4h/byXD7xiOWUtrit0Dkx9Z3EuJunMPn2jpcV3q28
	w03gsI78fm4bVPkCTKhbJ+pTlFoRJq/jrolm2VDar1WrB8v9txCJvP7cZk5/b70KPnsXVyeh/dK
	tOFo9TR980Pu82OElJ7AeXZuoOBZrjNjG6BVDPmTGo2v/9kOBRd/wiURZfdK+QXrEpSPQL7B319
	LNhoQu8pY4aGs/tut+Rn6hN60Tdn/y/zPhH8ag8FDTL0RXy6XEGdZo4ptMztFVC9Wv4LLWD43We
	V/QOEKQDT2Ve+bQie0yr2jItp3fGcHrsMn1M78JWc6yH3kXYNU90JAWkUmEzG8sQ==
X-Received: by 2002:a05:6102:5688:b0:7cc:ccb:ce5a with SMTP id ada2fe7eead31-7d03a5c5b97mr394312137.28.1793150095443;
        Tue, 27 Oct 2026 18:14:55 -0700 (PDT)
X-Received: by 2002:a05:6102:5688:b0:7cc:ccb:ce5a with SMTP id ada2fe7eead31-7d03a5c5b97mr394300137.28.1793150094940;
        Tue, 27 Oct 2026 18:14:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709f3d9esm27236441fa.26.2026.10.27.18.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 18:14:52 -0700 (PDT)
Date: Wed, 28 Oct 2026 03:14:49 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Jianfeng Liu <liujianfeng1994@gmail.com>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 5/6] drm/msm: Convert map helper to use dma-address
Message-ID: <wxfx4nhwdx6dud4ahy3rfz3btfto4t2zor2pjbotlqpglvwolx@jhnm65bzecnq>
References: <20261027230452.130031-1-robin.clark@oss.qualcomm.com>
 <20261027230452.130031-6-robin.clark@oss.qualcomm.com>
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
In-Reply-To: <20261027230452.130031-6-robin.clark@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=GYyCDgXL c=1 sm=1 tr=0 ts=6ae14c90 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=Uw3JNNrttYxbrt0Y1o4A:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: j8pJf17c49SU8_ea7_xysKYNLKnhrfbd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAwNCBTYWx0ZWRfX8/A5hEKRjmMl
 n+QT/0YEncgljc1RyUHyJBfxQVn3Aw9GxwZ0SK4G0Ll4i5VGhRrIya3xOeb2ip/hCeLFKFi4Zpl
 Q56walRXq97P7s8cSy0ZcnjzSSTVujEYVsl3c0+WwOyfuHJCOcv/yqnz6k4phk/2+0d4hlUTXmf
 9pf65TH457zyDzwxPsrk1AigAJlrs+ZRc9MZ4hK4SHmskmeEu6tJjv0qM4IVZ76TrLaILdGk5yy
 W34h+tpu2/Tln8vr5EsRyI5glgl4yxUMysJ13usjKYmiVlNr0fbxUqer9S23hmL5pt+x1c9stJr
 L8QwtJBbLVZHb07BiWLfXUI4C5arT1hABI1z4anp3xN8Dd9MBnNo9hztCNNesCCl5i7Je1dhJki
 YWwasLtkYT3Vu0U0/zdMc82XxcaLT8+3fwNS73i8WOpd8fyaRW4BymoaEe5Ge4bWmSYHKQtxL1P
 5UAYiYw5gQMIi26V+1g==
X-Proofpoint-GUID: j8pJf17c49SU8_ea7_xysKYNLKnhrfbd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAwNCBTYWx0ZWRfX4bahRgNQupfw
 GpnaCTfm2z2eL9O1oYrzZNmNl8ED7uujIjOu0XRC/S6eBonCALITYHDIQC+epOSEk6pAXWJAJ57
 9J6XR49Omsyc4LsigKV2lAcQx4eGPRs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280004

On Tue, Oct 27, 2026 at 04:04:48PM -0700, Rob Clark wrote:
> Now that we have everything unified in one path, switch over to using
> dma addresses for setting up the mapping.  This avoids issues with
> CONFIG_DMABUF_DEBUG stripping the pages from the sgt.
> 
> Tested-by: Jianfeng Liu <liujianfeng1994@gmail.com> # x1e78100 (Acer SFA14-11), v7.3-rc5 + this series, CONFIG_DMABUF_DEBUG=y
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_iommu.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

This commit seems to break GPU on db410c (which uses qcom_iommu).

[  104.954564] [drm:a3xx_idle] *ERROR* 03000600: timeout waiting for GPU
to idle!
[  104.954932] msm_mdp 1a01000.display-controller: [drm:adreno_load_gpu]
*ERROR* gpu hw init failed: -22
[  105.958559] [drm:a3xx_idle] *ERROR* 03000600: timeout waiting for GPU
to idle!
[  109.082571] [drm:a3xx_idle] *ERROR* 03000600: timeout waiting for GPU
to idle!
[  109.082670] msm_mdp 1a01000.display-controller: [drm:adreno_load_gpu]
*ERROR* gpu hw init failed: -22
[  110.086572] [drm:a3xx_idle] *ERROR* 03000600: timeout waiting for GPU
to idle!
[  111.098576] [drm:a3xx_idle] *ERROR* 03000600: timeout waiting for GPU
to idle!
[  111.098674] msm_mdp 1a01000.display-controller: [drm:adreno_load_gpu]
*ERROR* gpu hw init failed: -22
c[  112.102576] [drm:a3xx_idle] *ERROR* 03000600: timeout waiting for
GPU to idle!
> 
> diff --git a/drivers/gpu/drm/msm/msm_iommu.c b/drivers/gpu/drm/msm/msm_iommu.c
> index 479e5450a4dc..c2950d32c507 100644
> --- a/drivers/gpu/drm/msm/msm_iommu.c
> +++ b/drivers/gpu/drm/msm/msm_iommu.c
> @@ -153,9 +153,9 @@ __do_map(unsigned long pgsize_bitmap, u64 iova, struct sg_table *sgt, size_t off
>  	u64 addr = iova;
>  	unsigned int i;
>  
> -	for_each_sgtable_sg (sgt, sg, i) {
> -		size_t size = sg->length;
> -		phys_addr_t phys = sg_phys(sg);
> +	for_each_sgtable_dma_sg (sgt, sg, i) {
> +		size_t size = sg_dma_len(sg);
> +		phys_addr_t phys = sg_dma_address(sg);
>  
>  		if (!len)
>  			break;
> -- 
> 2.56.0
> 

-- 
With best wishes
Dmitry
