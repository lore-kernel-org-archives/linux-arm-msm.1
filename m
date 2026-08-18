Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FB853A4508
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 03:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787023907; cv=none; b=GYcQXj1QNCQ4tO97jgboBoX4clsrYDok0Rxgum9u7aAPx2hhgsA0mdTsWcoXXleHtz4OKN+/KBJBAaMDOzWOi9DJf60x/R4jVLHq0U8viy/2pdXwp89waxmH/rUE4xLL+q7mWQ/TNUzoh0TRDMwjQuMFQxw8z1Ec1nfTGHci6sU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787023907; c=relaxed/simple;
	bh=kIDzJ8B3tLVH67CCuFXSh6BPkyDJbIix5oH5ciqrQAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bbIqxtSG+LZmHwdlA5Din9tbHqVCke/XQ9ah6ffyGcL89DpUBOWsQJK1kiubrNZ6ASR7DnwPAAOM4RHwDfxRQ/ZjvdiT6fFkK+u5vimAXa1mTD6yuzIREv6jMZYusy+yVC3NI3vSHAPwM/9SOMqQOsuFFB94fpTCqYJdGQuLzuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O0a7jmqd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gDuZpwL3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O0a7jmqd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gDuZpwL3"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HLkR8x398595
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 03:31:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n+O+aZ5N4bg+RGWDpZ5iVQeO
	w+4epR7Fbm6jiS4DyUc=; b=O0a7jmqdUKzE7fEym4TB84zrfkYrhZ8W2ryz4KKn
	6WZzHy4XZjdBMiylU1/rdVO6jztSvn70rfmM/KzR3SPwIBEqSSxmDw+9RdbO3z4O
	CAgY0eyVUQ4TJKRO4SHFerUi4BZAFeiDs3B0aJ2wODFrIei3/gR9KUfqHAn/MFXX
	zf1vIMqWDjgcTciq+QQQQGUyRyrfiBcAjBtND50LLZ7MT15IZInsjE1o18bBzI9m
	Xu4y/Ixmp57ci26+v0iBlsulzb+HJEQ0UMxyFskWd4fRZesqRYUTF8Jp6q8ndW8U
	UJ/q40YgQSl05jujtdO1UZNkGxvPD7I6hr8CWnEVXGIwSA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3y7kv585-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 03:31:41 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9368b4c5964so343276785a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 20:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787023901; x=1787628701; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n+O+aZ5N4bg+RGWDpZ5iVQeOw+4epR7Fbm6jiS4DyUc=;
        b=gDuZpwL3FVq9KownW+MKwJ8aY99H6g/cJ4Oadjh8Uu4Ujv+z8GkCreCei69T1BeJRe
         JdC3PncIX2m1b0ZM0gi9I+6l0QrC1Vz8NyejYOgJMtZAjcvTS98oYi/BfR4+g7mAcv5q
         H49NLchY16PqnlAcWXmhzpC+k8kCL4oKC4+9/9sO9m+5ABeXRn9TGYu0l6qfubfS0aaT
         Y1UMo1Atmy4tevxbll1Jy9A2tVvGn7wsnM7rq2/fVYbDfxCMIyuUoVr8kQl2Y9z4UQCp
         3toye6O9pr7JajYJzFuqG0T/8pigeaj3EcXJDNbZ3da7vpsq2AC/7L1Ava52wXb5h/8q
         2vAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787023901; x=1787628701;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n+O+aZ5N4bg+RGWDpZ5iVQeOw+4epR7Fbm6jiS4DyUc=;
        b=IK2vGaz8crBGA1gFCyqwORYs7LOK2w9rBISaMTvOzkX3UCVjqhC+4wLBI/R6nB+9kj
         HEy6sMVGNnj79VFJdtZaDOtPt5eSne2FtCmONPLpDffmhMQF+YPh+cDfQ0UMPfr+YU5F
         8x3dxl3+covZRP1MTZxJhuXudaZalRiFDGWyR97x0y/AfNzgaIhN7UUpuUCdcj8SzHsA
         nqJceYhQLTaTlf8nHbV0vtfhmVWfdlqXPiTWUbNvQU2P23hpLjqQ5lbIAoZV3DFzzU/j
         tFuZTxPjTmxwVS8pMN3vP2strVeZ3MnyutoKuuy/DyNr/po1nQLpHclY9TC3YxrTbHHJ
         f11g==
X-Forwarded-Encrypted: i=1; AHgh+Rq0OA5cGvwLe9kIKH1IuFeyzqrMM8jdc0TDqngrOwBgnKDQg/x/q+cwX0mZEaCwosxMBDaA45qvdl0CQ1dd@vger.kernel.org
X-Gm-Message-State: AOJu0YwROX0EoPwICOavx4H03yXmhPZk8q7ryuUMOKIiz52xzftbE02N
	H5uOdkSC9U3dukPUjreXfzPgzLs1Y1azaNmlJmUqT5VFImf42vwLs5P0skbowM/Cyd/UIzJ120n
	gqOIe+Zm6SqrN9lD7G0XOOiY9kXURYgnRK6Lo0E2e2KcSx0Siri1FBGOiTysSLU38v3CD
X-Gm-Gg: AR+sD12Z/+ZWOdWaAmcePtDSAe4KomhLE4TiKOAKzzszK9x5uixrAuPgBtR44Xy3G4M
	xV9lVjQgO3Xn0vQGlK0wJ0xSSiZ+fS8NlDbOmbTDR/QU9UzsyHVpE8+P6UlAmCgre4a2NdlwICM
	cWrIR1rC/Saj5VvevodH5VfBXGs2MlJ8dI9ghg36FGk98cjd0vWlohLzpf7ZhCg1xqZvbOo2tqj
	r9U5NW6n0BpK/cBrccjz1y2Cp2+o8ihq1E8i0BCWRNOTmMvjLyBmXPbv+4RT/OXGItAqNCT8zKp
	VRxuHlDdP8uQp1t8IYPu6BaBJJ/v+tZVgEg0G/gfnouXLyS2M3M0NxdWq8a0ZDnn4r5ir6+jqK1
	D089JivzJacE3IZtuor695fegAf+nkjetQ9vc2jBGhXdLfSeV/IW1R3c7JKpVcLgYQ9Ve7F6j4E
	ukoEqKEeHdPhYX
X-Received: by 2002:a05:620a:bd3:b0:92e:8a84:7041 with SMTP id af79cd13be357-93704adf65emr502915985a.8.1787023900852;
        Mon, 17 Aug 2026 20:31:40 -0700 (PDT)
X-Received: by 2002:a05:620a:bd3:b0:92e:8a84:7041 with SMTP id af79cd13be357-93704adf65emr502912485a.8.1787023900401;
        Mon, 17 Aug 2026 20:31:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46d00b5ffsm848954e87.67.2026.08.17.20.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 20:31:39 -0700 (PDT)
Date: Tue, 18 Aug 2026 06:31:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: display: msm: Allow two MDSS power
 domains
Message-ID: <5hksiunlpcuv6b6eu2tx5furtzhsmutlts25vi2t62totceedg@r6fagkhlflic>
References: <20260720-msm_gdsc2-v1-0-4687866d6cb0@oss.qualcomm.com>
 <20260720-msm_gdsc2-v1-1-4687866d6cb0@oss.qualcomm.com>
 <b36691d3-e996-4fc0-8955-25beeeecc385@oss.qualcomm.com>
 <ccab8aae-d980-423a-b39e-3ce2a7c82542@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ccab8aae-d980-423a-b39e-3ce2a7c82542@oss.qualcomm.com>
X-Proofpoint-GUID: BmYPohsC7PciWNeWSbjUoU_tTGttwKjs
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAyNCBTYWx0ZWRfX2AkaYkll/pxa
 U12tJV5GAmPhEnHPhLmkDvSlVSe9iEMGPzMB255bcL5jCrxhvUJEfum9+1J+h/Dsrad8GCR4hAr
 Ag0+mV+dLmM3LcnByIMozG92vFmKn2k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAyNCBTYWx0ZWRfXyADpX3Bp31/p
 1xUZh7Csvhwx4KTggxM9Bt9aPqwH1+tfjpHBmt/AXb68W/uNaT+wpUPc1RDcVS8BzWFedlD6hTM
 /83dD90zQrWH9gpjfs3zrAwprNOEEO5nK8c1/0SZF+5/TjJE0UM+oyZ7aBFulzifx+X8iwwJa1t
 4n5PepyhYKXRBkiUtjY0XHWPBtbuoMX/Q1z7gcyhN0QC9RjP6UEUxW2fyZac6h6dGmq8Jdn2Ldb
 H2OOCzdHajk8Y2iqRJPmJY7CX9EeJMP0hWJSTr9Fiv8vyS2wrwbPVi6iRRJ0UmPibF53/PzMnOu
 NLi9EmsCWVb+bkqFOOIWJGQw0rtMVEjza7UABXVqONcV+juAs6gMC6MJNRNn0/VysKIPmyXWJAr
 /iZV+YdJFKdFYBT7aHhx+n8DZ0bLPhtxWm6LMhq5uwxu4CJ2T6sV2UVmsTeTAXsJR7iTjZtqb/L
 4sXd5Iby4Ebgma2wt3g==
X-Authority-Analysis: v=2.4 cv=HYEkiCE8 c=1 sm=1 tr=0 ts=6a83d21d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=FzwJ3IxCXKmGzkSqTIsA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: BmYPohsC7PciWNeWSbjUoU_tTGttwKjs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180024

On Thu, Aug 13, 2026 at 03:44:53PM +0800, Yongxing Mou wrote:
> 
> 
> On 7/20/2026 4:49 PM, Konrad Dybcio wrote:
> > On 7/20/26 10:43 AM, Yongxing Mou wrote:
> > > Kaanapali (SM8750) and Glymur use two display power domains.
> > > CORE_GDSC powers the main display hardware while INT2_GDSC
> > > powers a subset of SSPP blocks.
> > 
> > Can they operate independently? Does INT2_GDSC need to be
> > powered on after CORE_GDSC?
> > 
> On Kaanapali, my understanding is that CORE_GDSC and INT2_GDSC should
> generally track the same state, except that INT2_GDSC may be powered down
> when SSPP1 (VIG2/VIG3/DMA5) is unused.
>    - CORE off, INT2 off
>     - CORE on,  INT2 off
>     - CORE on,  INT2 on

What will happen if CORE is off, but INT2 is on?

> > If so, perhaps changing the clock driver to make CORE a parent
> > of INT2 could be the simpler solution
> > 
> > Konrad
> That would still need DT and binding changes -- DPU has to reference
> INT2_GDSC directly to gate it independently, so it can't be hidden in the
> clock driver. The two GDSCs have independent GDSCR registers with no
> HW-enforced sequencing, so they appear to be peers rather than parent/child.

-- 
With best wishes
Dmitry
