Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810055;
	b=EXZ6YnHNzB/VBWqL1vkrGq4gRFIJ1nwPT6LmBUBzcQnTBPvZJdAkkGsthR6iTcqOKYBP
	 U2JPiFqPp5US7vyfOB6HqyTM/MyEBpIsDvDzjhJjzUPNbsG1NxtVboGSJINbHF2Y5va2t
	 NIAKQ1iELwvjbXSls1W/LKynQhQGWKd7uYEF+6mF5cop7t1k+pFi1OyuUpgazc4qPWkyw
	 GTvMEsV/14xvGiSDP4dH+umE6iR6d9t6TXsMvyHQxjQY8o8ayDFgJm+vNzykJCXBN9Jml
	 8Q6yBTSoi+Cnw4Mj+4evQN/BG9RBn6e5ABVz1zbFoaFu6dXX+mYOzoVKjruhbFkE6Qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810055;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oh/vzk19jdClXLP1dpmBN9YXjCpwvxMhmfZBVEqASFQ=;
	b=bKH8c0Mzp+yGLk6PS2EwUTZ82z+sU8CeJYXxIpBj5B+JKrDt2hV/5P1CsdzljhGznt35
	 8cmxBFmfLdBUpe73VCYnS1a7Y5MLgFKNTBklK+rNknUFemMR2YOGkcg/szxWT/C7TWeTJ
	 cKXxzPazEql4EXNJyoFE7H+kM78ED3KsLnRhlsykO+D/dxep/Or4NRUFjnYhnoykC7byw
	 IoxiFdafUmT9zZ8OskyKJ3G0IIsERJshww1+RR7Omk6p83OSirjTZakfI7otWWTHRttFH
	 2eJ6nYzBknOi8+yWgJwjRmycAhTFW7enBR1WhxBWCHb/Nf/M9a8pXTHwXswCwdkra7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SQU2CaV4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="c/0s/R/S";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A45F606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:07:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A45F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SQU2CaV4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c/0s/R/S
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJAnsB3346864
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oh/vzk19jdClXLP1dpmBN9YXjCpwvxMhmfZBVEqASFQ=; b=SQU2CaV42WfJHzIa
	TY/FASVsPYHtxLcb2w4hUwSrnUMTz6jVyF0haDNWqhPuQb+jXkGM6PoaRccjkMOH
	Hc9s/bcQeRTBTrFs4sEyCpjcAg9wdLixKIa4LZXj0rc0LN3+159SaJ8yq9UT+3wE
	axKiPrjPX6yvbKeE60bNuiSL/ud6LsrIFw6D++DYFFYvJ2ASvMciE5OUp0twPS8x
	FP/DuWdZgpCHQ9dcRt7V7RzauF/Apa1fXoJ/SrZwheVNjKPKMj22uFcVlhoYnV0U
	Xsp8D9k8Pb/1dHGFQMhfJchUz/qxMGll8WEaBs1LXDZeW74C0sLVJ4YLG25ArHUd
	CgkNpA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhk0tv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:07:34 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ecffb6a384so3688588e0c.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795810053; x=1796414853; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oh/vzk19jdClXLP1dpmBN9YXjCpwvxMhmfZBVEqASFQ=;
        b=c/0s/R/SoT5OKiEKm6qu6CW86m0V1nuNxfjnnCMelYsYstTWSHtM7FcmcxIGZdgwUZ
         QVo/0cvfycVsJ4l0+9fjbZbsNywdzNLOq7WwI0JfBs/RDyNuIH+vDPic6tXyorV6bE7n
         x/zIFJMgSIvQ4QxbUtm6AG8+MvzKOPfnymi5RVREV9dQadHUYA3763NqLMK5YNJ0zMIl
         eQKvKQam+vCAfga9kizEc628mdA+5H2NXMgSni/p9dpZ28JYbLIYPUBXrtnxrpawkpaR
         T1YgMAeZcG78GV5dnUzTQ+/kwvN1wXbZh63uCaDwtGRqPHXg5Qis+UHQmFairouA6hfe
         xYHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810053; x=1796414853;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=oh/vzk19jdClXLP1dpmBN9YXjCpwvxMhmfZBVEqASFQ=;
        b=EDgpSTIGWFf2H2XyeWHLDLdsp/bCwvIOwgs9HMhb1iq6/ScXxqjZO4RiotWft3UKfN
         YZdknIvkNmYFJRdYCfwhHhjbJfoT79Wv+jU2fW0H3Ntqdy5cqJdGDD99sjOCWzXpO7H7
         I+xGKATQYD/RwbwpAFiSlIT9LcZhmy//e30RJH1YCL0KNcIV3wMDHn70/hFk7IrSdCuy
         goFMs13KFsPJr1qFARx2eVKEDDAhlQqSnF3CELGlgJZ0RwQRpy48EgxE3g/DYL08Zwu5
         0tvqrDhbppvO960oFY1x2iOMIU5NvENUH2pdZW4KvTnsz95Tkydtu3mHCAF4oqkBu6aY
         YJfw==
X-Forwarded-Encrypted: i=1; AL+hErH6QZrlWl2331F3CdFTdfFAW5KY9lbOq6p80MJBBxqC1KOjyEUbhlQnibSB6uIasiYD4gSb7kykT1Vvo+Bl@vger.kernel.org
X-Gm-Message-State: APuU4Z+ULCRkRMWDxOHkr4LKOaWDXtFpdvdISnFapZsWHxYveX2nXZ5s
	5b3IUq234veYfwGXz6pvEaitkhhV987TvvIkWiomHdrNSVKE4S+rLpmZKIXnhvfr4FnpizRCu6f
	TzlVS6vzYsZWtaAwNhcZmOzat1T2k2OTCaR/mh9Nw7GlVhqRjqXQZci4xKh+UZy6+xjRe
X-Gm-Gg: AZFdTZebpaYfjcRU+l2/q83os0Vws6muTwniajfgGWCKylqiu9DlyTAvme2+ziWnLeE
	jye3nHp5j5IW2QPMaXOwz6gcyuvXkLXnW0vCsrauknCs0E4jEVHfKVyLwhwBc9QTaW69MpWgATv
	05rM/fLWvppAGSF5fq8c/l3ibDyMONEKlI0IINY2OVrqNYNSLdsd57bwKewXCQlZiZAiGOID0Us
	RUnIceb2soUb/3M+UPfYZuhIIiv364+MfJRAk/+WzN0Hb4RymlWyBwBMQl0cAU7FwAiZWVaZOFH
	OMiTdPIGDdTYX9ub9KtjMc7fCtdSU1lHcPPOGZfpysei+nZYecrL5v4Q30ac5mypp+EhedqYR4y
	LJfoH9YUpCtFMAY9eiyDG5T9AZT+iiYNKupjXcNsC5oMnFReJyxU/9YT8Hga0QxuspyCARNobSR
	6VXoJErIrGgXMb68KHrAIPnIp3PKDbr4/BhPf47T7JyQWiABJIZbJZ/SL4tjRWpQ==
X-Received: by 2002:a05:6122:3d10:b0:5ec:16d2:4537 with SMTP id 71dfb90a1353d-5ee8aebfff6mr16711948e0c.7.1795810053425;
        Fri, 27 Nov 2026 12:07:33 -0800 (PST)
X-Received: by 2002:a05:6122:3d10:b0:5ec:16d2:4537 with SMTP id 71dfb90a1353d-5ee8aebfff6mr16711865e0c.7.1795810052932;
        Fri, 27 Nov 2026 12:07:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8044e00dsm69559081fa.3.2026.11.27.12.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:07:31 -0800 (PST)
Date: Fri, 27 Nov 2026 22:07:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexandru =?utf-8?Q?Andrie=C8=99?= <alex.andries.aa@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: use single DSC encoder when slice_count is 1
Message-ID: <urgy4kbfvofgjznraum7gtjtrhikbthq4sfad35nc3jbzb7kaz@uswmsjw4ygav>
References: <20261119-upstream-drm-msm-dpu-dsc-single-slice-v1-v1-1-4744ad5b9747@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261119-upstream-drm-msm-dpu-dsc-single-slice-v1-v1-1-4744ad5b9747@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA4MCBTYWx0ZWRfX4NJJBHuwOrT1
 Q97+b2Lw9apK0V4bq6DXev1dykGJNa0TdQpDqDnRgfRNg7aBAvHu2nX+kHBRC1R07fLI300Qr6v
 Htw8T3R2wwv5qjrbx7an1roQKYMZ2pI=
X-Proofpoint-ORIG-GUID: ku0IapislHRy1OBhzWGq-vxj-m40yDvz
X-Proofpoint-GUID: ku0IapislHRy1OBhzWGq-vxj-m40yDvz
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b09e306 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=4NFimAn6xQd1D8YDhw0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA4MCBTYWx0ZWRfX6IvroPACbIPP
 e8e34gsCc3/wLDoULxT1UU1NZDaEU7+T/o6e9evjGk9uwam7EGu034V0pF5PrLcJdPlZsKO34zh
 YrAfxhExA+NANjUVzVBH2c/6KcTNeS4YdJxe14KOx7B0cgtm0brJB+ZeNrd+v+PRAzlcS8RxmBe
 44FLfCUCmTNRJ+fd6CLchEDjmyFWxG0vZg5gW2ohFIiBU2D9Y4TusgjnFnoQDliEDDr/I6bD2bP
 C6pe2DGvO7pQL5jW2nTrZOTM5ARpH6NpBNHpD/tGzRALaEPUsP6+oUuebtUQRjB+mHNW4O4P3is
 jVL/3msI4TutoNoKMC7eVu0OPxp7ajosO05NEU6SAIxFB6zG7MKU4ki5wsopUZ8mG/rDdekax+K
 X3VY8jj59Q3vD2uE9LRw/LD3yJhiNlT41SLYzps3cm8OU+TjFX96hd0HQGkhAZm0glQ/M6LuKJ+
 CXnAjM40X6Sqj78A4DA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270080

On Thu, Nov 19, 2026 at 01:47:58AM +0100, Alexandru Andrieș wrote:
> dpu_encoder_update_topology() currently selects 2 DSC encoders whenever
> catalog->dsc_count >= 2, even when the panel only uses a single DSC
> slice (dsc->slice_count == 1).
> 
> A single slice cannot be split across two DSC encoders: merge mode
> halves the per-encoder input width below slice_width and, on DPU 7.0+,
> computes num_active_slice_per_enc = dsc->slice_count / 2 = 0 in
> dpu_hw_dsc_config_1_2(), dividing by zero in
> _dsc_calc_output_buf_max_addr().
> 
> Require dsc->slice_count >= 2 before selecting 2 DSC encoders on a
> single interface so single-slice panels use 1 DSC encoder.
> 
> Fixes: b6090ffb30f3 ("drm/msm/dpu: Fall back to a single DSC encoder (1:1:1) on small SoCs")
> Cc: stable@vger.kernel.org
> Signed-off-by: Alexandru Andrieș <alex.andries.aa@gmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
