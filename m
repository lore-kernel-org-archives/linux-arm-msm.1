Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795811385;
	b=isYhyjJvuzwdh8w7edfQ9iUlRS4mfp8aV/Jpg3i//zSVSr/i7TpVWJ0fpdoZwNCAREqn
	 kTM5Ge52OfBo3vtoR/loTxzwwX79HcPxz8UVlVRxSpqzX7GOzqNUe0dLPFq67hgV5MhhK
	 PMoCX/gnRnsX9qaVcjbKk+4ElBfrnDg2lvDPYSzAbcrNI5FR4TKQhTx7tjSzGfJVdmIFt
	 3Ngq1xyC3vdr5ImbEhzCkdn5bUT74hmJG64bAzey/MFjDHfiNx4atme5YfX9fkgeslxIq
	 brlXX8zXiBRp4QUyJUGVedIXeCOD4YAH3nczFx2xX5mOasbVe28ognqGTxW2yiO+3pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795811385;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wlqOV5YIfDiR1Zs66Hocz3ERIUaPwVEuthfmaePx5NA=;
	b=c39Jgl8tSVN61OkVn15wnUepfyKBwq0Y5aNPCIJax8KhmYpMUg5o22oHMmyRro02Sbs0
	 pgGBXmFcyj58w0+EgM9V5gthD52Ip0HbB9mWgxKjB92ZlF/csaTYeJ/6CjwFAwx9npemv
	 CrY3yFdSJEUiAlgTJexP7zyNxXXLCpNRYSyTGO/5CyYREuSWlmFxmIfoJEtCeGh15wqKU
	 KQ8/moKliC3wMW2ikt5bDGjP8ft0Txk8fpIy2u6Pb0u6jUUquEWyO30pcmDS+GdX/wh3P
	 xjyg5Zhyj/AfTetSPrrdVSwlGerLrraD0JeifzVdnpPnbxtUTu4smGzaH6OQ1edA5cA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o6sfJyHs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iTmQTQfV;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3956A606A323
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:29:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3956A606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o6sfJyHs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iTmQTQfV
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJAqJW3982219
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wlqOV5YIfDiR1Zs66Hocz3ER
	IUaPwVEuthfmaePx5NA=; b=o6sfJyHsUXzPNj8k0G7YJDSh/yHCDiEnq9pEq27F
	gvyEkhwMhUcHevOiTjjfLD+DiV+sAEdX5LL/B+p4giIun9d8sC8pK/8hU66Z7J8s
	Fn2WHWnhZoXepu3nitkHDdiysJYdd1aV3Pg3xEceHOLCIrFSZsDe/262O8p0pNSX
	37FXPV9rtskzKdyifrLKkDLe+KwYdCdXpHJoZHCxSUOYis1gWdLvA6siF2ROCR11
	Z9OpsAWZwdXoLtX/nyGI6Rfq+aAC76BG//whLkZ7xebL0NqtZdB/aG2xfxSHtZwt
	ZbPlXhtmlpIYhjUx2Q7oPCUeiBXbeXLcapGUTp0v5AsnOA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7f6d88un-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:29:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f6f4fe531so1255237385a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795811383; x=1796416183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wlqOV5YIfDiR1Zs66Hocz3ERIUaPwVEuthfmaePx5NA=;
        b=iTmQTQfVzMlVaWrTMolltPKGpNf25pqLEHVGVAk0iCW6JeQc9c50mRe4b/udRDr93i
         0ED0vuFdfgmx371OlFbI88H68/0t9357cWiGhLWPBUybvZw3YXJlYyWlQ9PIrU7zVKTP
         Fc+PmGP1TxQH4wQtDoVUw1MGFWpCiUIXUxxNdq3j0FC7FWdpaqa2BpVKp5gadz1hcWU/
         gVQdP8m335B62eYmcK3ESdnAULsMmaFQG8wHI4miPgmT+2DmP/hmmwhXooAp3IFtXbzj
         9LbxRQUxGclmDjb8GHWC5NFtnq55muolfssHIRtWRTmNo9qPVP+w52Ax60vs3DGKJjRq
         FpIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795811383; x=1796416183;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wlqOV5YIfDiR1Zs66Hocz3ERIUaPwVEuthfmaePx5NA=;
        b=GFp0MYw4mweoXV62mGq/3+o+qM7vlq9G6t4enA53RziR1wfn2WR4Zf21Jbim8hUvl4
         r99hK62nCbTMUvumRs3SUSUgvHjcXZ5LZe7WAcLm5qNdfLF/666X4QuM9Go/+oPOF+Ub
         gragRKTY2PbdNWlTgiqQevqWPUTEwPdMXrgILgucEPuMnYeHlPksp0vILC0TIzPSUWzY
         IXi7DwNxV9iHvd+B5z9Kn10W+RQcHyhCb3ZbHtOE3Tg5AXxperQb5WGeHdIn8OvaDXcj
         1aZVjsIS0qtSJMb4H2992Lo+jv/sXYNdkx/ILWx+H/9Ziq+f+5rJxqAX544QHM/Dr9t/
         sD6Q==
X-Forwarded-Encrypted: i=1; AL+hErGKMrLKZNnaXMnKDM7mJ0bdzVxdqQ+RkVEZlFKXSjxuY1se4ywvNYtmwX4DDXThVhnVwqz4k4pAHeTYI6gj@vger.kernel.org
X-Gm-Message-State: APuU4Z91Q8PDPSsGIOtfv4H3XdEf6igfcdUZipR3vaUpZW+XIzHTSZV1
	jTRkW+KidtG1QML8hePs9/nHxrqz/PM2CMorATB6Kj3JkErT2g+SXnH3p8KADSQuDW9BOUuZYvr
	SZkOiE9Bhy7XR295pSio01fQ3YowWwiV6bmyqqvM5Yrjhx96kRGf0S36tBs1sYKoK/jsT
X-Gm-Gg: AZFdTZcXzShHbr4pEMzLx7HXfYwUvMCOOcNHIYUooMKIW474AKUg9oso+zcqO3fqcyE
	p9GoGP5ohgnfCKoOFOUSxYg1legb5eMfBNomfD9fa7boyTW94j2amk/UupjecDIcB3nSfnPjcfM
	kYwOZZTNUhNiKkcfk31yVJRa1EnMbukp0fjkxYDDGil9iLThbgOS9qw+EVbNS73nu5MNWFnjtaR
	nzxJaCO0so+q4bUJSEEu8iq0Wq+9J62zmnGC+US4uFCDj0aQFwBsDXd/AXrYZA5EQYThQQHj2KS
	Doprk2sYBVKWsHzWlPe39kpvjMpfT/GSjA+PkzdcxNBmlf6T0Er66TE7c+fJaYaKSqPl6Ah8XxU
	zc34G5+23oshet8XzNB34C97dly3tQoJD3dQv/TfsbhCCmpK+ZI8r78sqHED82hl2/kmKmCnp+6
	Xf6X8LbS5L4OG4EAZ5x9J1EdTf+EL4sA7CrZF8Ghl7zwDveXlMrYS+kOzMh1ZHYA==
X-Received: by 2002:a05:620a:4404:b0:93f:19fe:e6ca with SMTP id af79cd13be357-949ba9aedf8mr4771517185a.43.1795811383299;
        Fri, 27 Nov 2026 12:29:43 -0800 (PST)
X-Received: by 2002:a05:620a:4404:b0:93f:19fe:e6ca with SMTP id af79cd13be357-949ba9aedf8mr4771511885a.43.1795811382791;
        Fri, 27 Nov 2026 12:29:42 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae80537021sm59515951fa.28.2026.11.27.12.29.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:29:41 -0800 (PST)
Date: Fri, 27 Nov 2026 22:29:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Pengyu Luo <mitltlatltl@gmail.com>,
        Alexander Koskovich <akoskovich@pm.me>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Kavan Smith <kavansmith82@gmail.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH] drm/msm/dsi: Fix TX buffer pin leak on command transfers
Message-ID: <as6giojrugjm3mftrurba767waiclzbdyc2rhnnpaqzlkimwa5@kkod74wmdmwv>
References: <20261126141942.335280-1-vz@kernel.org>
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
In-Reply-To: <20261126141942.335280-1-vz@kernel.org>
X-Proofpoint-ORIG-GUID: B5D1F20k-VivRPgCqcPbpgH4DykGoQn-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfX5TVd2KmmXKr6
 ZZRuZ8TLd0NbO1DJ1zp+hCA5n+J8gjOVWz6opNlo06mjg23p8SenRsr91FF3goeGNqtgwAYwl50
 cHrdsgQpVJBkISKkLwfVl+6+NycNkao=
X-Authority-Analysis: v=2.4 cv=IKqXmQvG c=1 sm=1 tr=0 ts=6b09e838 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=3kaI0MaazNZqiMSrzYAA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: B5D1F20k-VivRPgCqcPbpgH4DykGoQn-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA4MSBTYWx0ZWRfX1zhsrmtj6AZh
 lJjBxLaHNFiRapjyNUJy3lh70CKI2W9mSz1kUjmmE9IHrkugGURR1SEr9KqQcML8Z3+J6U63iuV
 3IhCwpy3CNcUaVH0Ivr5akFCvkSpgLklckz9q5ZMAzPJxuxHF3qmpkx+oaimIJBSCaI5Li79RB/
 3fRcoGvCyp7YPmCo8smATBD2hDiFzv5ucnEj+Q36ou9UCn8TLMaqCLZUOlHQ+fcR83s8J40mRrZ
 lDitpsQlXhcRuQGDMYOZNURicxfug+TcHDKJeiusnEspl4ywHhpw5sOEEIzE+AVs99yf3BYou7J
 nv3glUUik6fIirFEjoB6NB1usOufUqJod27qByDpGSQP5mzOLj5MSrXSCWaDQFlCWUagSzQY7eH
 VOfYTAY7ErGzHcMuyOWpH8tPt8JQJTGo+hOJPRWRa74Udr/rBWygakrdcfl9yy3Z6ti70IiL3J2
 eVoHn1UO46UkPqj428Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 bulkscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270081

On Thu, Nov 26, 2026 at 04:19:42PM +0200, Vladimir Zapolskiy wrote:
> The DSI 6G TX buffer is allocated by msm_gem_kernel_new(), which pins
> the buffer object in the KMS address space and returns its IOVA, but the
> returned IOVA is ignored. Instead dsi_dma_base_get_6g() calls
> msm_gem_get_and_pin_iova() on every DSI command transfer to get the TX
> buffer address, and the buffer is never unpinned after the transfer.
> 
> As a result the pin count of the TX buffer object grows with every
> transmitted DSI command, and when the buffer is freed by
> msm_gem_kernel_put(), which drops only the pin taken on allocation,
> the object is freed while still pinned:
> 
>   msm_obj->pin_count
>   WARNING: drivers/gpu/drm/msm/msm_gem.c:173 at update_lru_locked+0x90/0x98
>   Call trace:
>    update_lru_locked+0x90/0x98 (P)
>    put_pages+0x8c/0x104
>    msm_gem_free_object+0x1bc/0x244
>    drm_gem_object_free+0x1c/0x30
>    msm_gem_kernel_put+0xa4/0xb8
>    msm_dsi_tx_buf_free+0x2c/0x64
>    dsi_unbind+0x20/0x40
> 
> Save the IOVA returned on the TX buffer allocation and use it as the DMA
> base of command transfers without pinning the buffer again.
> 
> Fixes: 9fe041f6fdfe ("drm/msm: Add msm_gem_get_and_pin_iova()")
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
