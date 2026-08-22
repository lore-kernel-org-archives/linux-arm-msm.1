Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612BB33260B
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Aug 2026 08:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787386495; cv=none; b=l6pYgNs+UxB3ZBgjaOeMYMKvpOmDmQNmOSEIKGpedrCSU2WrGmoD/vCDE7HSMOm3UEbIm9AOhB5jq6kvAEdxcl/k8btCkY07G1NE3JkenSloCPtbA8UeNDVQX+DxsxtEIkBf8MWCe3IIaUlozhaHrzE1OdGhBlZ7rMEI1sA4sro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787386495; c=relaxed/simple;
	bh=NwoV6X1/sCk+C3qgTX/vNR+2rtvOD6AXAVFc/1wmbX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tS/7VhY9I85MiBKBoHdEln0D9ge3b+nEvHPiiboKpY1vkpKOkZDjftrqLfDQziZLkRotGTSL8hjVnpmhzsSewW5GEy9MYHPMvzcbRIJsBobMR1J6kEtW5GBAWbN+ZFn2GxIaIMMFEDJvd6HwixYKk6LBJmO/Dmv23ODbpq2MhRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eNrn7+di; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kBpo1XBo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eNrn7+di";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kBpo1XBo"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67M7xcvX1002256
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Aug 2026 08:14:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mx4sBpAlVY0obopBKg3ZT/Lp
	ye0sIJNAasEqA2Ugc7o=; b=eNrn7+di4s3qeYerXuAJLd2z1SRpdjjDhlzma7YV
	0EU6+EY53bGjMRFy2P1Aoq58jaoHyVX14ThqbKtzisuCw+7wqYh5JRI4xLmHuGFi
	4pelY3Agx9698p+AglQ5rlaMVZx2nPZ8J+OtjU2SXyubQb2/fIB/FWKopn8DST4N
	sx3Cum3MOQ5HbykL/UCTxLNlt4+1pOGh95Vw8vNaYtG94OAO0G57NrwTiH7mQoyP
	2ABKOV4hMBsttTb93WOM9AjX0c2XXLfxQGrbRK51gHeb99txNcv0zaPMN15splfi
	E+7NrXWZaLbOGQfc6dP+Ui6qhEf63Bx2C4uAtXirYB628g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g740a0j5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 22 Aug 2026 08:14:53 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a23afcbso25940031cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 22 Aug 2026 01:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787386492; x=1787991292; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mx4sBpAlVY0obopBKg3ZT/Lpye0sIJNAasEqA2Ugc7o=;
        b=kBpo1XBoajjKyFjBIzIi03TjHb6d+rURa56O0+MJJdo/6oO0jwqFGroyIvPMjDpMiN
         kKHx2Cyfwy4aW43Bp8LSZf3PGzqHIzqoWmCOhC0YdVXip4BE6Gq2rkneK/XGJnx4MdE+
         RvTqjs8pNk+Rb8DEwJEkbLSd1vbfOGR8jFLJ2GJG+8Jg46SYt152QECbtsHheeeahcbj
         elUdF9oT+F3khkvq7TisJ244TB4HHPyUY3XJTCVNJMJtRlrIqC3rW1s6Mft1OqwVvQeR
         Wr2CzRa+iqLFJE9rqky6t4CN2hEOIWaypi6jvJrV+Vrk72Avh5N9FuquAVZpErZ7aDJX
         pxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787386492; x=1787991292;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mx4sBpAlVY0obopBKg3ZT/Lpye0sIJNAasEqA2Ugc7o=;
        b=JXBDIHqGTv7yh0os5VWZHKyVZpXprph27jLcDsweLwMumihy5GEfousRNHlyM5iDfm
         jocJOcJEZIXMS+XITWNMu+VYQxY3CcmcbHbGlDr3JsvlIfF6lwTxa/aqz0cVIAM4Lkg2
         WVlDbe3qCoKw+rSgyYvTOii+ke7bK/y1gew/xer9b21Y4LBiYD+UE9xFTNYOC7+Yr9J7
         8+sTkzIeHPqf4wmmIFvHx8z5FwtSKJrCn24wbzooGvRi/7VAQf1XkBWMj4TBEo7Pd2fo
         +LoB2xlbUTamAxhTQMNXW3jhG3/iMWCI0iii5AFFuP4uIShR4VSgGmMdIncG9Wm8sM8c
         A++g==
X-Forwarded-Encrypted: i=1; AHgh+RrxWBQiO3OFbt3THO089A+/6ta/co4Oz27F01M3la3xrv1KdSWpz43FD+cfLuOkZN/GsOoUKNGbs3IrFg88@vger.kernel.org
X-Gm-Message-State: AFuF++klqsPHEti+pAnC9rEosyLDV789urfo0FJEQBZZ/5o7/cbbogL1
	tbBzYzIZmzpnq52v1fJ5nEf/zHEwp4qPKEgugSzd3Z493OashSRfWUPKLVTm4z+c/CxmJl/IIvS
	UdMQ82SQIwdWQ1FyRgikg6xPn7d77LOkgHGmQ0h/V3b74lYkYGy81uY4WvPWI4nXjnGdr
X-Gm-Gg: AR+sD10TKjAIYO4NJQYgyjwaUDtVyg8HvfrvlF94RFJPKU7AQW2MK8oiLm0m+5LEQNg
	uhsVGwUEjYwzzt2lkVVovM6OklHkVb67VGJyRbtOPleGJjg1Re1klFO9Y8q+M8dMuvWwEzY2w7b
	BcDy5dCdJnsB92EPzNYJVhdQk7U9tmZC0wf+zBehu19ZY7qrOnuxeCvLbpCOQm2HqAFM5/d/4DE
	4B3qpSX8tsdcgo+iMmoPXpgI+q9i7IXNgEgNG3sVvuBPAr1ycSS16W9HkZ0aGJIYwhnRWjy8pgQ
	RQROikzDS9giFTiINfSzzXZf4dew1kpNaj9QrmF0kjD6qX3SMiNgNc3cmwK9aDZ99k/l2p2NauG
	TXzrXdJOhofkM4qkcfcq3VnCHuQ7cR2wAsVHMm3HWalKK8XFOKyDyinHz0rRsXPS2B/n3UJnLYb
	cGitvu0Ccqlr6n
X-Received: by 2002:ac8:584f:0:b0:52d:92c1:b7c2 with SMTP id d75a77b69052e-52df56eff97mr103304711cf.1.1787386492433;
        Sat, 22 Aug 2026 01:14:52 -0700 (PDT)
X-Received: by 2002:ac8:584f:0:b0:52d:92c1:b7c2 with SMTP id d75a77b69052e-52df56eff97mr103304411cf.1.1787386492043;
        Sat, 22 Aug 2026 01:14:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a1c2fab2edsm2941241fa.23.2026.08.22.01.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Aug 2026 01:14:50 -0700 (PDT)
Date: Sat, 22 Aug 2026 11:14:49 +0300
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
Subject: Re: [PATCH 54/70] drm/msm: dpu1: Convert to atomic_create_state
Message-ID: <n6eroabxsvokjidgu4ujzix7siiwvgvhsfxuuarwxvlr2yrtwf@2uzoraecxzrl>
References: <20260821-drm-no-more-crtc-reset-v1-0-fb793475c05a@kernel.org>
 <20260821-drm-no-more-crtc-reset-v1-54-fb793475c05a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260821-drm-no-more-crtc-reset-v1-54-fb793475c05a@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIyMDA2NSBTYWx0ZWRfX/6c6bF5Dte+3
 c7ANFU6ob9GWNmvi75VSN4xWVEeTn7jZb9eKgtrSfMShA1bsAnH52KDB6ZuIvtbYDBDjXuTalgu
 Y8Jh+Uq1RD1pklrG+P9EHU9xwsvcUgp9gH/zVPAHCM+B2GtTFNfvhTR7pY0TqHRkGZk+HyocEMd
 VLSIJlrfpRu3XWkWWeSxn7iC1o3eLldKHRuMYlAENoZLn3AFnZa+Id3KoBSKGLHDrUpLY4RPMMa
 NQIhK5VT4Hu56NEpoqgy0TkVIqZ0FC/dZu2IXDzuMYdgnpYR8kLOIHN/sCLZ56FOYqBr+sNtUHO
 r33ivOhVkvsCcb2oxZfTjiHuBtvJEKTRagTSTEHLIjB3bDamu7//6juWVctuhqsqWokBzW90YGA
 tJGLbUHjRiFCenU5en/LZBxSN/16S48trAio+MpVhNUkolivlR1lzJZehieZajhqsA4gj0cumNp
 W5dGvHZEuxJ+jUCw4/g==
X-Authority-Analysis: v=2.4 cv=HZgkiCE8 c=1 sm=1 tr=0 ts=6a895a7d cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=tVI0ZWmoAAAA:8 a=EUspDBNiAAAA:8 a=e5mUnYsNAAAA:8
 a=JUukOM_wEb1cdPDkkI0A:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: q9DqvtmBTXwAD-jjjhIBUQcG2gq1x6Oe
X-Proofpoint-GUID: q9DqvtmBTXwAD-jjjhIBUQcG2gq1x6Oe
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIyMDA2NSBTYWx0ZWRfXxJ7As23jo9LF
 8R8N/Sf3y2wGo7UbHuWQTtZ7Lm6jDs9qKRiM7vWo6LALR3GZL+arE6ODYJQimA2Cap9pLhBJjtc
 a+W3f7gJC3hOoQUqGhwKPuPnrfEu0JY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-22_03,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608220065

On Fri, Aug 21, 2026 at 04:39:30PM +0200, Maxime Ripard wrote:
> The dpu1 crtc implementation provides a custom reset hook. However,
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
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
