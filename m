Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D0513914FE
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 21:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789336779; cv=none; b=CfE+CjiP3U4XJs9QekHfuyhy8vdsJfbL1Q4NlLwxEYq1oCROKESjbhGEg8QLw0ferHsrYGP8H+BUIuJT2X5JK6tGQiHdpjZCa80pGs4ql3Ws3PWgKh/QfX/1d9auPaz9mdwzpFl0k55r5nH8ax4/a2sas01RPmIICS0zhahxjpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789336779; c=relaxed/simple;
	bh=F4CyhSRXsOKZ0xZf1afrsqQt9p9O5tstOdz0XZsat/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EErzsaKpfUgmLl6PghfcOEFfcwcuABpiNUAtf64NmavC3IsS0UAqeSFas3gaa2t00nXzq7t7Sz9U3+5dyS+mPtaC2vK/VMSFvCt+bolHF+W+89JFqcaargSkqK+ZEmGXBf9e1lfzb1x3SvGreXcDhcklbzWcgepDMrYUBSVS38M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QIv24318; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g1pVz9c/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QIv24318";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g1pVz9c/"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DJxdu72163771
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 21:59:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=C5HYUvgwnNyezi4DPkW8H3ba
	CzRfmbYpk5g0hHr8iEI=; b=QIv24318GDSw+I3oxP6aB1sILBiVgSXDetUkMeGz
	29IUAhrqAja6P2giZ3Zv0Ve4Mu61H6U21K770k/LlzaGoq7dZOOyVq79ih2rVxQN
	uRZhATZVBp6IXQiTRMb7ectV/fjyRSF7jufX67EINMhrDn+cuP166Q/uZBmfnoQI
	nmXcuE5xFMEWeuWr124W/FoIcU3gtkmua8aTEoBWO0n1JT2G9k13QWHFR7ak634o
	7YKK2YoQpJQ2mvy0IsuOtIIV38NqnZgyt7dbSZSxUl18gXld7KMVvVyOvwD1U5Uv
	cH77OFbPAdnlPQX7XavOKHeGRgB5l+8tdhig+dmysZEkUw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd48ep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 21:59:37 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-798c310ebb9so560027137.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 14:59:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789336776; x=1789941576; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C5HYUvgwnNyezi4DPkW8H3baCzRfmbYpk5g0hHr8iEI=;
        b=g1pVz9c/nMJRC49IuqlYjty7WJnNzWZIVcOA+CKlp2GGR+eJZzPEsG4X/eYbuTJj2f
         LXCfqaNb8DQFZt+y0C4Fsy4A7einoy1XikHzQCOYQJQJk4RYQpZnbkdLyr5x5iYsk6CX
         wWnn6HiVz591ByAcdMcdHLeHj6kujQbJxtBDxfooGb71sgUIfNzgub6IVDhGBA4gqel8
         kNEruj6AIWr7CccGVcXsdjnJ+RJyaYdUOdVH8VCqJpzGqsRoSiFHYXJX1ADdWd07c1pS
         fXnSST1Kc/N2bQy9c+1dIyaRbj3S1GUmFUiJj2SJfQTkFy7fT8DgBRhVG48SJsb/To7m
         c51Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789336776; x=1789941576;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C5HYUvgwnNyezi4DPkW8H3baCzRfmbYpk5g0hHr8iEI=;
        b=pr0LEf0kTEbSsJGuBjNM3LBb1nzLX2WR6ADKgHXqFMnOuXuQnk0JbNSN7Etkhp7uvX
         CuaQEq+p5sM8dm23iJKuqV2d16QfOO9PDFDj7HTawr5qTYu78I/7L2aVwQyztnTtZBDf
         t91b0HvUY2IUiWLoXQRdheQRC3lxAO7gZeWDnKn+mozfJtdqSkwxSzO0ohn4xR+opRzp
         rryfZpbfc/cgcilME/wzh49xg1dbTZW4AVR5cKom1yJGYLKrZREwlnC2Qye07ZvsE84W
         tbmeMSwlMfIjOPTkcMoK+z2XYwVPB4WvZJU91sZ+wgSXCoBu5gIOsIwdZRaCWA978ukX
         ID2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzNLbyFco8NgYvwVCMdFpa9TdIKnHJeKOUgoYJaxAPFWmH5DYXMMeen9GXBmfZP5lSAWtckJyzyQ1ts0XtG@vger.kernel.org
X-Gm-Message-State: AFuF++nE3qBY+7kIvMMGnIjGPWrdDOaBIB2/NrytHbXux4GClrui2czD
	PaUMS6wRH1lTigPq/e6dpteK+qpdHnghEhhSXqt5ytMACAn/oofXCOPRIUya3ycjcAyGJv7sjKv
	1rzUiyXQYnipfgG/JK+OdtWuXwAIHbNQTBCakIm4dV8Rks+Ru3oV6LG3aP+BhOcHIp1wk
X-Gm-Gg: AYBFou1Umo8nqwPyCicrqjYrn9aqxVR+JdzaU0Z63EyH6Fbyh40L/UQimuNl7+Cp5lH
	QUqJ9GXSRgQBo76EEU9MXxDYv51pNy0I5oGDhQ73AmfKOXZ1G7XwEutLvz3gjc9MeNGU8a7BmYC
	sThgOlrQpn3iRc1lQ20bJAa1pVAMZDkckLxkFTXv8bxBZLk6kDn7xyo56BRPsv2zQwRsIPMQyNe
	qG2AvbBHhtx0EbK2sxIF7Z61w/bA1Rpiug/S5E1egtBrTttAPTnt4i0/YzodgmFoSPxO/xnaUxy
	j6W2LY00cdSA21N5Pbpy6XfpnkH9HMr7Ja7H6XgdAv2nOt7wbLb99qZCQ2qTTv148kMGgixJKfY
	tOkOcux51gNfn6dqnezrF+H8/29WMPAJfGu6oQO4DULS1t0E3VDyk8IsXcJXEQ4R5dtPY5bkgjX
	17iMNOhKuTfiZy
X-Received: by 2002:a05:6102:869a:10b0:79a:62cf:2a50 with SMTP id ada2fe7eead31-79a62cf501emr764777137.7.1789336773894;
        Sun, 13 Sep 2026 14:59:33 -0700 (PDT)
X-Received: by 2002:a05:6102:869a:10b0:79a:62cf:2a50 with SMTP id ada2fe7eead31-79a62cf501emr764768137.7.1789336773560;
        Sun, 13 Sep 2026 14:59:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0457189sm1907495e87.25.2026.09.13.14.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 14:59:32 -0700 (PDT)
Date: Mon, 14 Sep 2026 00:59:30 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saim Shujah <saimzst@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: clear pending flush state before physical
 cleanup
Message-ID: <wyoltftfpoxowxs4g4uwa2vi2pnspubn4vw4l2y52bwrhcjvew@xh3og5yp7uaq>
References: <20260826182459.1506522-1-saimzst@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826182459.1506522-1-saimzst@gmail.com>
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa71cc9 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=r5cTPNi_baYN2tIuLokA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMxNCBTYWx0ZWRfXy7c8b27G/gd7
 oxEgL0oRuGmbWAiILcLIDrjnW2jArsc5q3AzgqdvwvtaV2ORcupOuSeVQZhroc7Acu3rSg+vn7c
 JBPRnV6ZtOxW4UKBYCZl/UtAbxd1Ys79j7gR+O/v/3LKbA/gfn+02eMFriNAQUfiJzOccOIwqmm
 tD4TJnImfgpXetNrVr4J1uUZw94EZNPGMQmltlIU4jLlA1cdNUfGJJPIXSmYhdoEdUaLEvnZF+J
 dt6WFw5wwe8uN/SA5Y9vgX1yRmpUfzjBeB5yxLxfJyjIjrWf2yWFDZ3dhrAqNoTqqzunYdHfj/3
 l5MEJKEUvZ1GWeSwISDxEGRcxGkWk0+zvQiWptb2Jin3ScqUKlhyVqxDLCVPMrynyU8PrlS0k+0
 X9qRd0Il87rTIRmJeGfqKzXgF/POSA5kA2XliSnadYoOCFO43ez5JCLdgWEGtPg+5bVQB576qjQ
 8bxYWQ+YO0483Yq4hiQ==
X-Proofpoint-ORIG-GUID: Xcufbib4X4I1pA1L2sg7CNyWwX4zSX-b
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMxNCBTYWx0ZWRfX3J9J3Pz7mes6
 06GqZPTfKNstEYRmd23WNwTEiA9SvVR5ibNGlaX4aO93emTXYKjm5roAFLnv+HVYk5jFRa1FW1l
 /+YvBWGSRAojizy8nVJkHGLLbm4mcJo=
X-Proofpoint-GUID: Xcufbib4X4I1pA1L2sg7CNyWwX4zSX-b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130314

On Wed, Aug 26, 2026 at 11:24:59PM +0500, Saim Shujah wrote:
> Hardware can consume an active-frame CTL flush while the cached software
> pending-flush mask retains the submitted bits. Video-mode disable stops the
> timing engine before physical cleanup, which then adds teardown bits to the
> stale cached mask.
> 
> The teardown trigger can replay source-pipe bits after timing
> stops, leaving one pending and preventing the first commit after re-enable.
> 
> Clear the cached pending-flush bookkeeping before constructing the teardown
> state. clear_pending_flush() updates software bookkeeping only; it does not
> write the hardware CTL_FLUSH register.
> 
> Fixes: 22cb02bc96ff ("drm/msm/disp/dpu: reset the datapath after timing engine disable")
> Cc: stable@vger.kernel.org
> Signed-off-by: Saim Shujah <saimzst@gmail.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 
-- 
With best wishes
Dmitry
