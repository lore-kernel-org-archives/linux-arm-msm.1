Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208464E0B66
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 16:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784239; cv=none; b=EdI5O1AFNiK6uyVptM2JM5NejU6vy7GvpLEn8rfncZ0qq9VDs3JHsP6RH+zwsYh7MScwxi7V8+60x6RxFyYvNDVEpLk9CnRoiWu2+JI9WYxPRc8h2LD9Aybkk/WE2bPV9w6AqKqiUzVmlXmQOvlS+33ZVwV8LzAqOTMzDvpT134=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784239; c=relaxed/simple;
	bh=lqtpsWq3wo4si/QO8G3pKIJCGKQhQ4+/l/BkuckMCt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L19cz69B9Ijccsn10/1cxH2RSZBq4SeWxDKSIQuTIEFkccNvSz3IiMzcbiOYmZ2ZTx3QCCV/hYKAft/+MAgFguKTcYljtuTqOjRGYfIs2pE+5syL6AEHK4gihSYeSHp8xBZRnRkQfEuR9GGIrGHLc1H2Jm81CwEm3EBlcmNo4ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T9OBUABX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MLNDYPre; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T9OBUABX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MLNDYPre"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE08FH2970840
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 16:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Mw2NmiDzGrvm0Nc5TJoWz+Vm
	SYKEEwRfglbvsWyB/cQ=; b=T9OBUABXWxadqO2acfVmAO6Ln3+3dEoJPlZCgzAt
	yTnk+TPxblHPGXGaEtdrz+FpjA45cJfPr5xaXDhrdJEG72JptZdAGIVIbRMVmEAw
	JbeDcMh5Tupv1Aw3r4epR3AwtZHAV3lVBK7fFhsWVr1X5epPHYjyg4abarTL2Joc
	NozTbcICpwOdFRPTvGBgaMbOUq+Oj3Fw648kXEQK4UN0bqJTgjRWKNg9qSEb+u6m
	nJGlQ/Ypj2KQaq5j3kjaK/1WYkBWDK/RNSOIo09H3n/W4b2U+fRghjxUiKowNkou
	izxR9OA71idq7ireXNMUvcz/K7fUroVAcYxz+/2x6dG4Dw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rhekqv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 16:03:53 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7be858243a6so122330137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 09:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790784232; x=1791389032; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Mw2NmiDzGrvm0Nc5TJoWz+VmSYKEEwRfglbvsWyB/cQ=;
        b=MLNDYPre/8zrIiZrQJA4EUQEU3LBby8fyTn+yQUtHkB8ydgI5HRU+aQyWo9+HOKeF6
         goPTtKCUGZtws43o8/WqXO7NEwwzFmTM31Br/1e4jNoyxY13wjii6bngdeLF6JBKFhCW
         iooAcfhvxTPXRHwiIlBjdsueyKLJfP25HsN29nWWg/aTgmCUkg98+JypslDnbS7M/iz7
         7UmjPNg4DgwRVsXQFOo2vTo43o2vQd3SqDTBY91/+bfCf38MBiWDUWye1sOev/bbrlzz
         dl++MoRcAPeAjWw8i52cofD78KvmSBb6hBbTywJXWZQIMnnVxJcTSF8vE7WlWQ4ACz4u
         yIPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790784232; x=1791389032;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mw2NmiDzGrvm0Nc5TJoWz+VmSYKEEwRfglbvsWyB/cQ=;
        b=G74OIajp+iR5umcLIWVszwzqBhxmVmF3jftohqRoW08KtaSQZ4tAJ/x80LGS5rjz2T
         uGghou587fSeStV2QMvQ1z0CeI7tCowFicrooD3Ve+zjQS6sYJuyAH9OaaLzqMv7wIQN
         2Abu3+AqFVQbaGYqfbEEmLE16XtioiXexpWdRqVglgz0y0I4cGesMZG9c7kih/cjwNFf
         MgX/LL80NmqfqJ/edK1QEd7FKcSWmYFnektJHOaarSifmB8O8rblX6ykEZ2xJ94UZ9ZV
         +f4r2rSxVVgymZdLYEoNjrKCvUcR7lxz+jr5SOpmJn68n8T3VFUGIHpLkGd0z0zihEBi
         IQNg==
X-Forwarded-Encrypted: i=1; AKwUvBzfVQwAIis9e/+c9MBoUKJIP2uFOu6Ox9rLwopqGyBrIlcQFfJq0D+ANQ/9pE/MTLiDKNJ8t2hIUKk6DEiF@vger.kernel.org
X-Gm-Message-State: AFq9FYLb5RbowE07RX71YvM5J7WmeD46sDTcCqXnCPiLYlZIj2b384rZ
	TIrxYYjEir/oacZ8MdoSMtmS6zU29phGp4UG6Q506NUaA5kQ6dGd1X+1UApLVCuY4/XV04o59Qd
	m5omED/qpOlQRp/pPKNYJVx/b6d1lJ/TnpPtu8owDdejAXbsB3utDdrstlK2TuT4PW+PJ
X-Gm-Gg: AYBFou0qavuNAd5Bj3noUID6+Bxd1ceyGloOIrCc3J9jPh83gLw21QMpxatYgilZTJy
	QE9BEMGe0Dw+C9f0U+l5nfnxkEGlIBoutOVLNhB3/kInKt9qhYyO0USHgrWnnO/IEvp7D3Z1xyj
	xXnFIlCeajvZVoXkAjHWnPX6QOwusQRtbI9+2gkKZ+Er0lTOTaoNyvfu9X4z5Z9tSREX8iGyLgj
	EMwMPxhgEAnX4ytrget8KxN8ugpOZBeAZvdpS2OWBTeQ4LO/0yawhlM4kdQWtQMntIKSUZx5poz
	bf2uu6+K1N6v6RlaAY4i/uBJ5jIsjIkwNIoqgf1OEOFOz6QXej1VSubjCb4CkPpDlp+iVDjw4vv
	JdLq8CiswtC3oBy1hMIQ5NznzMAEvdr3CO8+GM8QH++KfT8kfa4zEAOyXfncGK467neLThO8/gq
	v2dk1uMiydQJZq
X-Received: by 2002:a05:6102:162b:b0:7a7:196a:84e6 with SMTP id ada2fe7eead31-7be73e956b7mr418888137.30.1790784232371;
        Wed, 30 Sep 2026 09:03:52 -0700 (PDT)
X-Received: by 2002:a05:6102:162b:b0:7a7:196a:84e6 with SMTP id ada2fe7eead31-7be73e956b7mr418863137.30.1790784231690;
        Wed, 30 Sep 2026 09:03:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42faa832sm82205e87.14.2026.09.30.09.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 09:03:50 -0700 (PDT)
Date: Wed, 30 Sep 2026 19:03:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, Connor Abbott <cwabbott0@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm/dpu: Fix GAMMA LUT for sm8750 related DPUs
Message-ID: <hvd2zaz6zvhcalnjew7p2krbafpctx7hmsgnsbyrvvmh4vhe7z@pdomohlcb4vo>
References: <20260930152645.22194-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930152645.22194-1-robin.clark@oss.qualcomm.com>
X-Proofpoint-GUID: 2wz6ihwjlKcSl_puf8HFI0Enf7Wez4iI
X-Proofpoint-ORIG-GUID: 2wz6ihwjlKcSl_puf8HFI0Enf7Wez4iI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2MyBTYWx0ZWRfX9jIP8mjEl8mL
 bl7vcXbtrk0gmAIJWhpkyHZ1gBvhfhw2ZLBgZTzN9ORPL4GEBks9krSt+f9/towJqh1sJWyFjKg
 TGqE4OgF7cOf9J49h+StO6OKWTv86Mt8Ur65WZYHP3VeR4KtY/+kLyAoyu3B1rxsl/stBBLzUDd
 tHLz5wozlnNeetoKGMTG9NuzeKlwqdIS0OE8sCHPswf1eYK3QPge+VXo82MCiHkCunwuOi3ywbm
 81EFDIwDxRmRCHF+e5PSEx46lgKb05dAh/aS+hHEPBQusc7r1/ie2Qh1PgKO85koSMtdiMwGP4t
 /j34++lXFvdM3rUzKkIhmawqanWLGEcUrn43zqPAuetC1X5Zbkh2cDlf4kZy2Ekv5J/Ih5mdzR7
 MnqlNDd1PmWkjvqn+Ac9H/QbGiKU+b89ZRHzoAN68eeQj5Twod3l5bS2LE5AkzvgViT/2ddcnYD
 ZsOd2UztGPR0Z65MfHg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2MyBTYWx0ZWRfX3IoB70ViTmSG
 HnfVwu6tjfqSgqNM61rUaYdgItJJtxaJnbAYG1bg1m5Ryr6Ymvz0o6fdzEphlPyCsW7o6B8icl5
 79Lfox+BGX2LGFDraqP7Jp3wc+V695Q=
X-Authority-Analysis: v=2.4 cv=Tu1zFzXh c=1 sm=1 tr=0 ts=6abd32e9 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=wTaCxXlcGNsknM-wzUMA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300063

On Wed, Sep 30, 2026 at 08:26:43AM -0700, Rob Clark wrote:
> Add missing GC block.  Fixes GAMMA LUT on glymur/knp/etc.
> 
> Reported-by: Connor Abbott <cwabbott0@gmail.com>
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
