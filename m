Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795812244;
	b=P9tjmMJKBweWXJQSThsvlaXVled4BdJMCFyLePKnS8T5eqvGiZ35s+c/cyF/GBTz4Kzb
	 3qwyBUbALTymYFOnfwAjdFAIiMKD6vJbIo75bLMzMCBTQ5Df4U2MmMKpmahjZrcJfJitn
	 jBWO4RejMpNsq35uaYa1QSoslOR8D0ibFEvJXfXwFfYtqLG78rKttRT2R2ckxT1ssfNKe
	 0naPnWrlvvSG7/cyfijl/dobZR0978yHBhsVEPvVqVQGb2yVVysKg32HHgWCOyxdbVo38
	 /tvmtj0kUkHw28l3Dl/bhzuZ+UmwibLaiLkkpPzdVS/pW1jfKsMqIITNbG2lgBWmdEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795812244;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZSkSS/hy39N3+R2zfTAM8tRPuUu4y2OH1GT6n9Dj9vM=;
	b=Av1tsxLH7jYUKjPr/bPVdmMn3R3Ns9rfGZXGGhe0RNtUTDBphlaFe9cHvnRr3Y+WBrdy
	 bYV4NxYLAyf16tViLyiQSyubnpQtAQ4FqeIJuGfOm8fB6GeJdf02npfx8u7lfBWu8PH83
	 jbGi4tBxkV9j1WCeXK/GGONew/4XfxQqz+UyxKYXWsNM+Csow56ZxokZVXXYBNuVQyvDA
	 8xDbV9FsCS0DByiIUQsTeMUaOXK9vce9NlKYKr+mhilaoBSJJnYg8pMmBHUxbb1ya05Di
	 0N8eoOTGKuHb9wDclR6VO8FtkTbrFQEHYcb5JL4sCjZGS1Rj3r7A67BMh5qULziXJcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hevO3G3k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J6x1K4O6;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BAD606A337
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:44:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 89BAD606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hevO3G3k;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J6x1K4O6
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJAujm3038741
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:44:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZSkSS/hy39N3+R2zfTAM8tRP
	uUu4y2OH1GT6n9Dj9vM=; b=hevO3G3kN3FCw5jH2838MED4kg1hM4arX74YxsMS
	kKKSFuFyJ6dhqrRWiUT/Th3EMOqm8Lmk51R5Mn3LZhsLgT3AeiBJ2xEEGhtQn1qL
	n5EuHWTI1VAOudAw8BfsaUEdKmiYiHt8KCQujMonDG8G7w/6Yd0e1YJ7e+1NJdl4
	ed0PDLDzeJaDWj+gI+H4GUTtsUMaxjfNThGuzP2BIwxv0BB1VfusiwMO87+pLzGx
	xuRczkFsX30TEqt7y/onLhfa+FcF6qyhyQHR8lxXn/pzuX3y4XTMpSjjLN6vmtb7
	2/kClNi6pnZVBogoLEvoIt/CJG3+qF9JG3DNwyVG4gH+NA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7e4ngfxq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:44:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2373e9b4so949074785a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795812243; x=1796417043; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZSkSS/hy39N3+R2zfTAM8tRPuUu4y2OH1GT6n9Dj9vM=;
        b=J6x1K4O631SWXhWiB0evAg4rQyUGnOnMSFzlolBvo08QIRdMJVyrSKm2fA0HZKUD6a
         Tm/bkkjP5fuZMJBU6/DVV/oMN8KnBpIdEVJKH4Rhnt2MDcOtGBaqnclRxWZea1ZiO891
         B0UJI616YHWx2VCcGOcVT6wFhsaNmXF9NXPTqT9gTmKtfKbJHqBgQUpJkHPrqMpg00cL
         A7wfU1b3oFFfdLScSu+1xY7PYMnF1chUtpTlqkVHy+dgKl2l89L6YMOXD6EP8us6uI9a
         5INLgNsZgdIy9IY+0HfmPXOoZ55tFOQAj7R5gJ1RWsQ9mU7f1U88qXXSH6JqGOwKN4nE
         QLOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795812243; x=1796417043;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZSkSS/hy39N3+R2zfTAM8tRPuUu4y2OH1GT6n9Dj9vM=;
        b=dfW/DIhwi7YFO/vw2+weifm3P8SpyEvWTywLuUVtSffnt8h/1erCPOgg0ZFEaQHVTH
         iJYEPgso2cPGACu6S5aNMngEp8CjTTHVYHUthKr7ppyRgZ+WDE2BcjdiOmWb8e8ydVj3
         Qvv296jbCtuGDdP/b/D+rZn3StbBNFNZhnN4hAxIpM1JXatvtJljbrwDIPy/lDpEnf8b
         zSx3OaV8NqsKu+o3NBYCNb5rx4Kcnqrw1LxL4Fa4gOctU+TSXkzv2w0fOSiuFiLBPRRb
         S9j9EDM0Mx4I6doi1MYVjkKbuM+zZhTno3E3KILbsmSMJP9tKVmqBnnnizB58pxFbL+B
         JYEA==
X-Forwarded-Encrypted: i=1; AL+hErFkug1iAd/8qBxOCVNA/GWjjKbrnPEyDLHdgkxyRiVJqj9EWkNV8zYLhdHwhaCbrzzp0wwlyUFeHnKX3Cu+@vger.kernel.org
X-Gm-Message-State: APuU4Z+Kjwpkj2m4qUdLeCAxNheWuIUQk2LajBqIUi9eQs9+mCJJ7kE0
	PGfJTX8OA6JjQ7/XH7f45rL76XF3vFGKi90lE2L/cBwxvT7gYMmnmR+TIRkj4EQMggZwc+s1z9U
	fTXHSgh9VlhOEBXALArkEagGxjeAdb+1s1aTRgZYRFHkK+y1QEAwoiKVJY4mwz+91JhoC
X-Gm-Gg: AZFdTZfysPo7r2tcc4v0ZVQnAprZlxCO4hlBrsQkfd1BN0/TQArT7+TrUQyZav85ziq
	IXPMUt7abycKa9TL/m2/sMwYa6CSSVxQSs9jWrCzTVAniLBfnWUpRVWtBaoZNjY9GufmBUFJaAH
	eR1T2tgrT7UmYxobtOFb1kUQ2vV/2hHtWYIpMYpyv2mM+67Zj6K6zRvI0Vvh+V4+DTk2Q17oV9d
	L0OfP9bqTbMFi/HfTnEuFJJ3nfauaFfX4Wqx/xYgV+WTer19cwrG5umm1cOMWDlioOOqSxPJH4j
	xDqgOqRNR7LhaLK9f5gBqv1rrCmp1bhsZ6DybTREbik/vg4BC6RShdMigvQR/iFJBQNvva9tKz1
	iVm3SBOutlaUh9Oaw6OiXEKnDZFst2jUyCZOk1kbqzDqqRxJqWMeTR/58dUf7pv3Vk/DhWFj+BL
	QjI6CIuv+px5sakOpufwp5hiS3yX2sdLJt1kUZxVVKWS5W0dmidQitN2o1q7X+yg==
X-Received: by 2002:a05:620a:4012:b0:93f:228c:52fc with SMTP id af79cd13be357-949bab4d750mr4704917085a.58.1795812242608;
        Fri, 27 Nov 2026 12:44:02 -0800 (PST)
X-Received: by 2002:a05:620a:4012:b0:93f:228c:52fc with SMTP id af79cd13be357-949bab4d750mr4704913085a.58.1795812242065;
        Fri, 27 Nov 2026 12:44:02 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8056f133sm62291521fa.38.2026.11.27.12.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:43:59 -0800 (PST)
Date: Fri, 27 Nov 2026 22:43:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 2/2] drm/msm: fbdev: Add the missing VMA reference of the
 framebuffer
Message-ID: <ueaka5zx7kt2j4o2mjbbfahqnx4sto2h2jc4q55willon4v6dx@i45gawmfpeic>
References: <20261126170535.361985-1-vz@kernel.org>
 <20261126170535.361985-3-vz@kernel.org>
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
In-Reply-To: <20261126170535.361985-3-vz@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA4MiBTYWx0ZWRfXxR9bXBOIEc/c
 3zHPH0Fnvo6dDkRB+CnNn1qe7x1s5ZCiibu9AEXSdWNObxiNBvu8pwmZ0LSTgtnjEvUashuuGRZ
 fN7ligb3WVgfzYemCbggyJSJS8bX2jA=
X-Proofpoint-GUID: JgLUE_XPbY7twGn6VVN9vbpmEic_a5XC
X-Authority-Analysis: v=2.4 cv=LPLz05W9 c=1 sm=1 tr=0 ts=6b09eb93 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=-cx7zhLa7rps6zhCMHgA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: JgLUE_XPbY7twGn6VVN9vbpmEic_a5XC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA4MiBTYWx0ZWRfXynYOH9Flh1b6
 08lL/kdwjVYEKmkNItXZwzdHBunc650TEDcZgJM+oKzH524uqVgnOX+4wak57xcF6RUf5k6LkFj
 GcMasWdrkoAlZhIraJWRrrLOHMIb/bANU1nOLq2EpGf8mD41vPE3UZRpV8NjO4W02xqNeTrBR0k
 8x9BDCybByb+5z7ToRl68w1KAmZncWLW+agjkc7TZvLosvt2d0O8DvcUUlMIli/AXQPxBmnk7xh
 3fvwYBAHgayJV+x1BfDrRwz98Ss+Ij93JFD7kjgmq1WnJdTyQ3GS8PGnpyaggtRTlClgp+u1U+l
 oy2P9FidXKPrNmoLfMmoqFvqIp/ozciS5PyNmiHqDNR0zdq8dEaBBZbdEJAONf77/RPnivjNI5X
 Vt3QcpHED5j2Y/xOJnmzDDVhGULFAdd8x+ljLg8ej0ggzsf+qFT9B6djPl9NOlvnLGRaaKCz0Du
 dRTDG/20UHh4vFJxJGA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270082

On Thu, Nov 26, 2026 at 07:05:35PM +0200, Vladimir Zapolskiy wrote:
> A VMA reference of the framebuffer buffer object is dropped on the probe
> error path, like msm_framebuffer_cleanup() does, but the reference is
> never taken, and the VMA reference count underflows on the following
> deletion of the temporary GEM handle.
> 
> The missing reference also affects a successful probe: the KMS VMA is
> torn down, when the VMA reference count drops to zero, which happens on
> deletion of the temporary GEM handle at the end of the probe. Then
> fbi->fix.smem_start points to an unmapped address, and on fbdev
> destruction msm_gem_unpin_iova() finds no VMA and does not drop the pin,
> unless the framebuffer is prepared for scanout at that time.
> 
> Take a VMA reference before pinning the framebuffer on probe, like
> msm_framebuffer_prepare() does, and drop it after unpinning on fbdev
> destruction.
> 
> Fixes: eb714953c441 ("drm/msm: fbdev: Use a DRM client buffer")
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---
>  drivers/gpu/drm/msm/msm_fbdev.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
