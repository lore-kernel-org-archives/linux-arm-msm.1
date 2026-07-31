Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6AD028CF5F
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 13:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785505061; cv=none; b=HEh2P889pc0M8tJETyoptfcra4GQMEZ7GZW5BQ+MlOn3GK55gbdwXwJNH4Fbvlrwqv+YXcEB8hLxms6ApEd5uM3qcJZCop5E5+JnDgyRk2HFmyHaGa5iusT1gN9AccUqgazLNvhRUx1UR8CJKFQ5za6evK7Mp5b3/3dHWqrPGzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785505061; c=relaxed/simple;
	bh=CtB+uThNQdElfPruLS88IkQN+8pYYvaNKgXpTjWm8dI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tfUR3+RHKhyz+3Hu3csX2/8BbbEUco39GzpYmI18g4MVBQ3arZKeYig0/mLCi8kBIFf14lliTIPDE93Dk1kI2Z5Yvb/q7/L0rbMXoRPEeGKUMQ24a+j1kDypSDSVgoeHKxQ01BLah9iM7dQhf1urKUdsNVxYLk1ZU35yv0b64Fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I00iG3zA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aYm76kXw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I00iG3zA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aYm76kXw"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VBctjg4185502
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 13:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1UHWdcuhd2ga8Vdy+j8u28yQ
	M6gZ2F4ymuOo6UaOwbs=; b=I00iG3zAd30bL2pPz5zBZVS5nLd1F5N+EP0CwfhL
	XyRMaLuqZE8Few53OAAtaL476uf3jPuBvCx69cFid7FAHMpJ1HG3QJXT648s2ofy
	KBksuOXUA+nHhQfCsPtuDnRWvN1SrIomk40y0QQ3eyyVPwlr+POodctKif6GvMW5
	jnfOp9cp02A3T+u7meseSkSwXUtWK+MUQIN43znGk05jgqxQMqVtKbc021aFTvXl
	gstk/le1toMTW3F2+CDTxF2aSVK3DvbXdHkrBohbAaK7cbJXxFzIYhifBkx1Ktyj
	BV00FG4U/lwmgFLZ5uNVWVfUE4Q9n7dPwkdUdHdpy9u5NQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru130fdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 13:37:35 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0408254aso25652531cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785505055; x=1786109855; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1UHWdcuhd2ga8Vdy+j8u28yQM6gZ2F4ymuOo6UaOwbs=;
        b=aYm76kXwaNBcss2iKXnEubJOXVm+aPlugrb6kNRXZ9HA5DK46iGbEBpA6k+Onjhfq/
         XVgR37XexpqVeet4UePZQC0fpmlS6bzHvXWGSky8heJVPKwXd8wmYjKAoWDTCyglUmSN
         CJr8o8IYoj/4srVddAeeZK2RiX1z83zWShroYIxeBAEELqUJxbFIBEpPQZ4MP9p0kN7U
         xBJLoFT9YlfUfIRG0cP6hVrsA5iLlMXZTd7GHrO+1Kih/QkjqI+mUSSshO7ew3C9F1Wq
         /YF2T+lxJezWdK58KTfHeiLLUMo8As2+nAOAfCrD46tW9ywtai6JA9Atby7ReJP2ZQ2y
         ozuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785505055; x=1786109855;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1UHWdcuhd2ga8Vdy+j8u28yQM6gZ2F4ymuOo6UaOwbs=;
        b=q0PfoF9a5BN3NH/70vA4S59LUJIej8z1fpu8L739PBYatlAJj0CbWf6PJKU77WuUA3
         +Kw7Os5WXbyJRlATfYdKBP/TVMbfGt9HUjbXcxy07rYFE8FDzxnCLKNW1FmHIhW/xrZx
         1JMvWC5LbWBxzWacmZRwtOmf8I3kZ2DajC70oGvxIhhj7TFb4qSlOv+LoWJmE7BZBMf7
         Vakb7UXA7dsGX8kmTJ9ojs20244NSk10C8YcgB6xZqCeIWM+xDMsvKEkwGcxuNl5ZgAQ
         nDB79jojbshCIhSPvSGjnB1An57lmXdBsmIthsvwRGf7QyXfSzUvfu63/ZQLuuVeIhdi
         QGSA==
X-Forwarded-Encrypted: i=1; AHgh+Rr2odpw9ikQR1QIPnregJY83xN/ZeNYqYxFLid65NefhkzxwNTScgiwvFlIT+/uRRa8qhzXQ7dQozUInOcC@vger.kernel.org
X-Gm-Message-State: AOJu0YxuK0LvAHTuMzvpI2+frMR0ig2Y4LLcwLczULpZ8ENsZnRzWsx/
	fq6YNLC33/C7O3Yud5pXu5iLlQ8/7Nch6SVUEzpx67Yl2kUmniga0kVEkmj6I6x2i6NWHKwSuw3
	VNPOLpUjT3/Z8skMiuvo9kLj5LF5gdq/k386w8+Mb4rADvk5UK1Oexh2ano/DBUO8ocSR
X-Gm-Gg: AR+sD12dOphwSPQmJk/2SYeIRY2vGW51x/1m+nktNM9u//4mAJEQgCpBH1c0S07+sgR
	SbMuhurxaHtHoRb/QsNkAi+z9pbBfl2fJLeE2usfxowsT+QmwfgOz3o1ky7HS7+BLj5C4v3FgPT
	KKINCGyYkL7sICoeviXLLGQ8yEwIbezh6teTcaEBJoHyny6cUWtISfJQ3mv5cAWImUWSjtkifRL
	d0mixi3M7OEPCVDP4bsNaXY+iH/XKw/u+8kRct/J5Gp0vml42QSbrsZhHrdn9GifqyBh2kFlLSF
	79vdHq6hokYaOpsX7RzwIq5od85gclUNWywbFxmblkpYwAVSortiEULxQMpcLXQgpdjxjPAoEcJ
	2LglYc8W6Mc43sDZaDJHhdGGtXdkzMB4P7e0t2mpDYpy/5KKES7N+9D0N2aNx4RPpyBjl3rjFJv
	Y+GMzsO+ug7PJt1g==
X-Received: by 2002:a05:622a:305:b0:521:103d:9f98 with SMTP id d75a77b69052e-52b4ccd6226mr22722501cf.19.1785505055030;
        Fri, 31 Jul 2026 06:37:35 -0700 (PDT)
X-Received: by 2002:a05:622a:305:b0:521:103d:9f98 with SMTP id d75a77b69052e-52b4ccd6226mr22721811cf.19.1785505054447;
        Fri, 31 Jul 2026 06:37:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e2441ec2sm309349e87.43.2026.07.31.06.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 06:37:33 -0700 (PDT)
Date: Fri, 31 Jul 2026 16:37:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        sashiko-reviews@lists.linux.dev
Subject: Re: [PATCH v2 4/6] drm/msm: fbdev: Calculate buffer geometry with
 format helpers
Message-ID: <zufng4s4refvweovvogyq62zxl726npmzqh2sf474qmje2uwlt@qaavrkvos55m>
References: <20260618141249.151338-1-tzimmermann@suse.de>
 <20260618141249.151338-5-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618141249.151338-5-tzimmermann@suse.de>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDEwMyBTYWx0ZWRfX+QYHlz7CHEI5
 vJC17NDHlv520ctu58wNfyFPSPLnYScTqSzbjOFdswkoooV4CeuVj/wYk93B2XM0FGlEB2d+Oi9
 fiLDMAxXjGGsfRmZnGKC2vepQ6sw19A=
X-Proofpoint-GUID: -8barcWQYyd6JkMSq2RPOOPBvjXCDLgg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDEwMyBTYWx0ZWRfX/yJ4p2rmnSSS
 2ll+IBcuLPDE4pK1E5/V/KmsWfCX0AdzficXVKx7cjoyGMMh2uDuoSygj9/5wHvOzETXOWNVGpe
 skkw+53H6js+AyQkiWeqpBpeXfjukOGebOam91MRzbMoFzsx8Arn+6gD04OQUMDc6qisgpE+Wu/
 yDELKZo6abRUQD9T6mZ67fX78rGyB2iuXmogHnflupOrxSrQBEQIvlPqZIMg06FT5ifDLTv0nSx
 qphr4cHdxBefECkxITmbUrzAwTVaJuUFgCJud28qU0J+hkTX5FNHOHnOTxSRO5xZpzFKm34pAmP
 nkl0f7fI0gp8EKDrbF5zF0itLLXX9x5fIdQxzWSLzt77AtgdihLr9iDWt0FPeNDMS7+Q2/XcVQr
 qyllykVAYGxHTz8zk4YCeLguYBO02Ns2AdARJroYMm0c1FznAIuAiRKonaMgcamTJC0M+SPGj+8
 XXwYRF28fB0SH4J/b5w==
X-Proofpoint-ORIG-GUID: -8barcWQYyd6JkMSq2RPOOPBvjXCDLgg
X-Authority-Analysis: v=2.4 cv=CYI4Irrl c=1 sm=1 tr=0 ts=6a6ca51f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=yktShXf9RslwC1abtNAA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310103

On Thu, Jun 18, 2026 at 04:11:35PM +0200, Thomas Zimmermann wrote:
> Replace the geometry and size calculation in msm's fbdev emulation
> with DRM format helpers. This consists of a 4CC lookup from the fbdev
> parameters, format lookup, pitch calculation and size calculation.
> Then allocate the GEM buffer object for the framebuffer memory from
> the calculated size.
> 
> Explicitly align the size of the allocated GEM buffer object to full
> pages. The contained memory is the framebuffer memory as seen by fbdev.
> The page alignment is required for mmap.
> 
> v2:
> - clarify the page alignment of the buffer size (Dmitry)
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/msm/msm_drv.h   |  7 -------
>  drivers/gpu/drm/msm/msm_fbdev.c | 26 ++++++++++++--------------
>  2 files changed, 12 insertions(+), 21 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
