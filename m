Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F1CC3264FF
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784659318; cv=none; b=bzwZz4tJFykDLf09ZgJsz5DJnoxBRAJHZXuLIfqoPOtXBdba5PPskKbQeEx3IiRO6JvuKUsbr8pQ7ORzxvHushVwvnOASvTAIqXn8K1PL9yBCRFa/4zBIO9z4nbgPUirMnMHQ5Sh4gYXdsgNBBvkgyAaTbEWbHmhT87i0pBLE4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784659318; c=relaxed/simple;
	bh=6Oqixlb8/6lS6VRVQak95K5Nd3RJy0yJbtEbD+8Rz2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s176qqZiNVxttuD+SKMs+t6Dtxph538UnhQE3cpX58QYvK7GIS9JeTmkvDbN4HPli3Q1kq8Y01QPeLZzNrW5kRcur5yyrkHPwR4NjkK9yk3nJ6XySrMp5CgtzKQAi1R3BygvZWcJpAxYWenc9k47W+sscn3Z3aaREfr0kzIqaVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S/croqKJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W8rNY6sP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S/croqKJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W8rNY6sP"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2YLu3439875
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:41:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+n/NFf65uT2dq8qZ8BzjRHqx
	r6jmGdLSwt4tjEC+VzQ=; b=S/croqKJB9y9nJR1fs48IjHwaX18RWz5LlqrAPbn
	RwTgpH5g3PmowiwedsSRnAaP68uE8cbZNAipKCnsmSm/7wNngiWcD7S13UvnhlQM
	EFHLnQy+XXSgeWs+uyH/ly58ahX9SFQPhyr0kQgrlb+E7wYeOz7XgnMtW7ynTgur
	A8MZNYriTzSdGl4ft/nVlnPvhcmHbdBBMhSo8jqiJ/sHLRc9s3xoobSVHdhtLNPX
	E6sxYQBSP3lHKbMCNMve4a64n8UBy3kwL5BzZPZtsueToApx/7gSYvzcMe8+tAj2
	ULV1z2ag9ad0+e9JHwtPVNZmmtkvcvrVSsl+HMJoBVePzQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6nstghr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 18:41:56 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfe3fa93bso237812761cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 11:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784659315; x=1785264115; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+n/NFf65uT2dq8qZ8BzjRHqxr6jmGdLSwt4tjEC+VzQ=;
        b=W8rNY6sPWXAAkXuYass5m82I6vaZ8jBToMhxY84GqejbeIzLevm2c1g+B4mQjGITWt
         rsLO63NkDcBytJXiGehBYXd/MMfubuDMAza39G3fnwIn52XxmM4t80yg16EGw1niQGKm
         8glvm1MYNzJQzXe9tfbcaTFlbYQsRI5MdMFSUPKAL2oZdZ+5tvFUgVX8jfaF+5cxUY3g
         AE8+g2bMLo2c5OJwUZbHResT3s9lmg6ptik7BSCjL5nu+tz6KgeYXAZsDTLT96vptnvV
         4f1mUPiWdukDc0BoacdBKwhgqMma+6n54qURYvpnwnIZUAbmiJqhdCrrDkzAjL2yWycQ
         Y5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784659315; x=1785264115;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+n/NFf65uT2dq8qZ8BzjRHqxr6jmGdLSwt4tjEC+VzQ=;
        b=WmHOcUv99pdd7vYeTGZiXWKMksD/ITvU1WgXmxum8EOUXPkZfJiOTZqUvFwTKUKqoA
         DUPaA9y1c5Eh1TtohRe9Txq/AIFjiNktc5p8XIN48KVh+XjrUGU+laSp4956lAjj74EG
         fPk7KwSQKZFWo8XVkAyW8HC/xkoLxruHFnpVLh/NVy9urZQDVdc5fknD/goj5DaxA+CW
         pcGXI5HoidRMZwTOywCWq2kM/q9J04BRpKPXZQUSI/2+BupUkGTYDnDFB8fA2+VRjx9d
         0XGgQNm0JouXdmCzv1xE4UrKPOvkS/uF1TL/aUvp6Bmq211Wu6XLeA/OMf/8eMtDcCTZ
         lLaA==
X-Forwarded-Encrypted: i=1; AHgh+Rom6VJ4EnJcVQyA5BIIcR04UyRcU02QhuFEG+ZN0ng4qlS9nDbF1ErKAkXY4UxRXFCTXObJbsW3g8JpTE/j@vger.kernel.org
X-Gm-Message-State: AOJu0YybQfMJI6O6Ysrzo+VJmwyVBt0YcWQfaotlbWOWzJQTIEAkN/yq
	uRqD7hxS6Qs+NJoa4HJWeAvCw2/tG46KuWjXNkWa1m9Av25j7v5QB5gwCDKarTOWAhSi5raZp2r
	kBVt1nby+9PShd6uRmmS99Nqqb/6lPNCDrY/6W9Msp48BBrMUXn95hRNjKA18fj5Nm48J
X-Gm-Gg: AfdE7clj7nc4Smzrbcyg4Iu8zUiY9pB0XEJqv9Q2N7EdH6ArKmdwiat+FR5SMlAxh+B
	QHBm1+bJyUOIU9z+PK8Wf5t+Iyt7oc8q43uaC2f/hL33BRV1oi7DQQrZqhiyuCIbwdNHQkABccs
	4TyQ1MaKG2JcSxQy5yVh8csbp/aJx5iHBFkLK+LwRK+p+3cD2A/W4lisZ8CnLEfewEBmjYas+DC
	kHtqjsOiE9HgYrvt2QswP260s9O27PgnIJnKOlrgz4VuyUWDF4EGonJY/rqPiyYXAu0+Glga7xS
	HfZQt1jYgamlBt/PVEjLYXD757QTYSRfS6qslD3SKsJ8+N1bP/Q9S2oCWDob4eIfGIDh2C9EVNw
	IgOK1iIr6CaL1fUbbsKy1vd1UZBG4IIS8X5CancfqGdZSXiGCJV+sxt0RIpEq0184CycqMCHAEz
	GwmZCUPHlwzB/Mow==
X-Received: by 2002:ac8:7f53:0:b0:51c:2633:9ddd with SMTP id d75a77b69052e-5213e081cf4mr191503771cf.41.1784659314870;
        Tue, 21 Jul 2026 11:41:54 -0700 (PDT)
X-Received: by 2002:ac8:7f53:0:b0:51c:2633:9ddd with SMTP id d75a77b69052e-5213e081cf4mr191502761cf.41.1784659313364;
        Tue, 21 Jul 2026 11:41:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9d4356dsm65884e87.56.2026.07.21.11.41.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:41:51 -0700 (PDT)
Date: Tue, 21 Jul 2026 21:41:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Fix DMA SSPP REC block offsets on DPU v13
Message-ID: <aqna6hzjorbpnnu5gcwsxkhhy4xstokoo5uzqwspr5saftyivf@2uxvuhwp2c2m>
References: <20260720-dpu-v13-dma-sspp-rec-fix-v1-1-10d69b4875e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-dpu-v13-dma-sspp-rec-fix-v1-1-10d69b4875e7@oss.qualcomm.com>
X-Proofpoint-GUID: 3KNdsin6W8UsWKdeZvDvkan-xJJIjVml
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE5NiBTYWx0ZWRfXx3jZ3wzp1kzT
 byd4fg0zYjtxFiXoJIRsh4M7It0AnsPV+Lc0kfvTDAZF4Yw+inDCuucO2ffFmGwpuPo3++hWafe
 qpetXWPDVUHNxZlD8kNUG3f3IGIG8hg=
X-Authority-Analysis: v=2.4 cv=ZJjnX37b c=1 sm=1 tr=0 ts=6a5fbd74 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Po1t57-fbbXoP4SbIj8A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 3KNdsin6W8UsWKdeZvDvkan-xJJIjVml
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE5NiBTYWx0ZWRfX3bDlD6pvTRyA
 dyfrYlhXkdwgh350MLPKeehI31stIkosnDmrRW51zEIfnKYclVe/EdRO6S60Z0+a5ig7Pdebjs3
 iwEAhEtBVLt+75HIFTizQXLkshDK4jdXCI222xOdtOzmEd3KFeRl4td1OvmxnR8QhkOWRkPVfFm
 UeXfU6Y3OFXfJ0dsrBfl7NJSxshdu29OapYPicZGfPq1HyM+mQpFpzDg7o9qOq2ENYbq9PwO99b
 0QLBgVvYzFjoo0ZgqEbQKi5W9TbmjAneP1Raofkq0jO9mXIF5cQjfLYXjorQbD0mAs4Fnq7ZWk5
 rosEYmfabwXBBXZaOsJcm8/gkuHS6tJ+QFTxZ7gFCi1sXiKMsJOTpQmSukU7SLOtanlHz+5Wh4T
 j2b5bSgA1vQ9TXMlHrItjt8O9RuaHccGkRIZKn5ZRPm5aqmsjcoPkCIhMCOg8dFdFgyqptPYY71
 KWjL+SBsLSPZjjwwR9A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210196

On Mon, Jul 20, 2026 at 03:56:08PM +0800, Yongxing Mou wrote:
> On DPU v13, the DMA SSPP REC0 and REC1 blocks are located at
> offsets 0x1000 and 0x3000 from the SSPP common base.
> 
> The existing DMA SSPP sub-block descriptor does not initialize
> sspp_rec0_blk and sspp_rec1_blk, causing REC register accesses
> to be performed at offset 0 instead of the corresponding REC
> block. As a result, DMA SSPP pipes are not programmed correctly
> and fail to produce output.
> 
> Introduce a DPU v13 specific DMA SSPP descriptor with the correct
> REC block offsets and use it for all DMA SSPPs in the Kaanapali
> catalog.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h | 12 ++++++------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c             | 12 ++++++++++++
>  2 files changed, 18 insertions(+), 6 deletions(-)

Fixes: 83fe2cd56b1d ("drm/msm/dpu: Add support for Kaanapali DPU")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
