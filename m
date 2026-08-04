Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B7138E100
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 13:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785849046; cv=none; b=M3cvTvCxbzPUll2TNoeDlpRNMKSh8nag0b/tt8sE5tFRAVB1P5Gtsr1pa0CBw2InKXAohfKk/SBWOQEdvrceeBE9tRk5pFR6P89D9sRF7SKOwE/an8f5dSGoS6y/UKl11AnvOVDBXhZNcksv4GhJEQsS7xzZTKDWtiy3xo374iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785849046; c=relaxed/simple;
	bh=gFRH7CXmJkXs0z91+LpyQOy87BWUCJy9mgzdjT6U6EA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tNJ9TBpwPzA9fmy0SalCVzXxnTkW1zI+2vJT9B1uNTZdIiwR4CoPknhaFEUQxYesJymAK/s7yfBZP8+ZjQQ3G89sJ+vjBDTeb6oyW6W75MBiN44REsUEOa5X2AiRhEHCDwW3Ge3WnfbGSP1JI6p8mbubts3b8WYcVKvadVJFs/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m0R7WbgP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EuX91nlz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m0R7WbgP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EuX91nlz"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 674CX52k3572407
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Aug 2026 13:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=U92DREcn/XIrZyp1jQCi8J62
	md6LueH/tnK1yoQ59vQ=; b=m0R7WbgPrBmcU10qkAgmdHUYigmldLllqmdhWMWP
	5ErLEM6lhFN90kMkDk/xrOI6a5EFvROFiqzzkaSrf5jyArLWQuJ6xvv1+UAQZF+O
	FJxEuGIBTF2W1dbsZvX7Y+9xZPvkGCpFHOeMU5DtDVVfWKHdyR8VOjyJB4cLFgBQ
	ewhnfTjdYULPyo8AX214VxGhuf1NSr9GOniCm4WnYpUlUHXSC71q97kGCtvYcu71
	jCXZLVGMG8/2MYdkloN+60vtW+s4vDvb3PtEJF7nKMHIW7zmmLwOlU80hfOTRSmL
	TPqCtUHxxijfY4VrY5WAg8HaTxcBDvsU3M2exhddK0u4/g==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fu2sykc16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 13:10:43 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-907a1e04111so60910836d6.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 06:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785849043; x=1786453843; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U92DREcn/XIrZyp1jQCi8J62md6LueH/tnK1yoQ59vQ=;
        b=EuX91nlzqgxnHvVL7h3DHZ1XKyjCZnUkSslW5oDPT77UuTOl16a9nMLDbYXsu1aOmu
         Fi6S+L8IwAm1zeQICHKa8QSzxFfe3cIiSY99SYsBhoaab22UE5/tqwanVY3sgqVowxiP
         /wfMJH26Eiov4h5EL98Jlx4n1BJb4suQK9pBGKwSB4sWq/o6mi56zOcrFJiyBgbr8usk
         qFwuoCzWxQN1sIIZvzvoty+yMUSdhqfOjxh8wAQBZ9ENBJhQiXSkZLvSK/YHOxa7CpKz
         /xu+zzEE0uC9KCtK1T9YdAzgY9xJ/WtU78rKcOhSQdAgPWpMcyIcrzj1hA9+x+QVSNf4
         slgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785849043; x=1786453843;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U92DREcn/XIrZyp1jQCi8J62md6LueH/tnK1yoQ59vQ=;
        b=DraQwI8iBuePWIIiwQJVGWOPPDaIWQ75YIFS8fkDIbhROlLq86PZNkqERAwJb685/v
         zuGWNMYCA5IwDBh2G6NNK+M6c4CQd7btofq3VtgOvVaeF1GIVBnBqnjs4XbU3BtzsvwB
         zGDpjxo4Ip7dzUl/yZpznwCGvqBBzyj2pqlZ105ojx60GSJWg9r4tY8/bF6xZHjn5M2E
         toAE7ECDIZOOo4fhUaLmt3ZcfV4J1D0WjFfSn6R6Ngp1HNR0m+M2UdltDpwm3u2of1cG
         psRcWWpVFtt94Zd4+1Xg3eslpl7EaZdnnCMXbr/6xN8bDPVj37Kcz7lUiI0VPlk0w+Ts
         y5+A==
X-Forwarded-Encrypted: i=1; AHgh+Rqzx4s/haOq9GkHRr2a6Gr3SxiMl5gLmxQO9Gogcs+ZR239R5HpIlfYYGQB7/vmIxD6lU5pAHvCuSSZfRJz@vger.kernel.org
X-Gm-Message-State: AOJu0YyT/xhZEV6JwP2yBOMTiS8nrnkmaEs002ID0A2mQvXK8wZFn38F
	bTE9HdvFwiZ8FY1SNyi1LwzEGoKOGr4GRbfL/+f6+Z250McwwbIP9zxo8bCgNcfbsVDZsDNWNMT
	wz+l77Wl6fJxFc9yKzVzvNNwrTpfSfpiO2fgdmNz0W6bqUquR8CVPAGXQmU46HVNR1w02
X-Gm-Gg: AR+sD10j4t/q4FoStn/cyZvE+t9fJhFe2u++EKseqg9lIe7X+GtEaCu4bVEXyfOrPTI
	XwBb0bdYBkmDSBCoET0+ZKjlp8vQUaKXQ2nL3XpXkzTCY8Hex2K53k2w7GmxsLto1TsdunFy24f
	a407aS8t9Frdg3NfG1YkKcrC/Qj4tqFYWwYpVisKJUNtFIIyZW3qsZh+9kLLY1XALCBMmwtriQw
	x5CwBb9yZaDlex873XPux96QLQuywmtDRw45+xtIjFn3G4yVKAY1yWHOTLPbOxPld73Wqi6yXRu
	0byCx3ShhRhz/OgBp6qNe3JGciyJxx1hxvbpcI8ecW2NypSA0fDtuGMjDIKttBUgYOD2qj2DC1z
	Z6MOVwlmSM5qoukfL/ocAvP/dWu0=
X-Received: by 2002:a05:622a:181d:b0:519:55c0:a1e5 with SMTP id d75a77b69052e-52b5666c0ebmr256188601cf.8.1785849042647;
        Tue, 04 Aug 2026 06:10:42 -0700 (PDT)
X-Received: by 2002:a05:622a:181d:b0:519:55c0:a1e5 with SMTP id d75a77b69052e-52b5666c0ebmr256187501cf.8.1785849042073;
        Tue, 04 Aug 2026 06:10:42 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52b4e7edd06sm82496911cf.2.2026.08.04.06.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 06:10:40 -0700 (PDT)
Date: Tue, 4 Aug 2026 18:40:29 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v14 3/9] remoteproc: qcom: add hexagon based WCSS secure
 PIL driver
Message-ID: <20260804131029.ol3zk5sbyfcmzh5t@hu-mojha-hyd.qualcomm.com>
References: <20260803-rproc-v14-0-a1f87b0b0ad2@oss.qualcomm.com>
 <20260803-rproc-v14-3-a1f87b0b0ad2@oss.qualcomm.com>
 <20260803124442.krqtw6si4ujsnuul@hu-mojha-hyd.qualcomm.com>
 <de961a11-71ab-4642-9ced-5b97f47d7110@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <de961a11-71ab-4642-9ced-5b97f47d7110@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=TIh1jVla c=1 sm=1 tr=0 ts=6a71e4d3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=f5OQM1LZqQncRT56GpgA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA0MDEwNSBTYWx0ZWRfX2XljyYwa73hb
 /YGjV9Hxt4MgAZ+3JMtY0hE6sRLmpDykW2/Ffju6AwnJ54SEk8EgDtlzROOWnBwyb/UWfWs1vD5
 FrqYwkd28JRsmeMzBMy3Fp3LTHn+iyk=
X-Proofpoint-ORIG-GUID: RkwbWG01fAz0eb6Q-bHlIl22UkI2U1sc
X-Proofpoint-GUID: RkwbWG01fAz0eb6Q-bHlIl22UkI2U1sc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA0MDEwNSBTYWx0ZWRfXwOy/FaQzWv4I
 DUrHZAzWkA8qL+htxVF3HdQERvdbcHp+aUih8/Ag6whhBFPo4Wp2CCLKZ+Tyrt3bchG5xlA494w
 peP10MpSbYL3MzxViP375Z06BFwFsgXeCrMg9kQg/DfhhT6U4Qkehf8Bb9Uv+/jwqTj/h9XkyjK
 zi3lTUlQcioXXaMs/SMWCPlbi8zev3mTVlV2vpw2kFoS3U01qP8tPBf1T9T9EzS8b+DvN5AIz01
 omtcN1xzJuf2FhNUSOiPUV1kz+GDNuCe/cITQZC8yTI2QKgZ1znL9d1UGH/ojU/qIDyT8CX86Kq
 xAvvMFQjAJrmbeQaAKdPahJfeoNx8AWRgwsgqLn1g5kPk17zOMbczMsJrNA2IjcP+nN0X4Pss5Q
 aPlO46KhOfgsD3qTgH7CGCiMWmJ6yfEO4fRlQczJv30xEzgJYLp87qwSeZpqUNq5hJqdRiVTVB4
 4UFFD+T0yYadz0G3+uA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-04_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608040105

On Tue, Aug 04, 2026 at 04:49:17PM +0530, Vignesh Viswanathan wrote:
> 
> 
> On 8/3/2026 6:14 PM, Mukesh Ojha wrote:
> > On Mon, Aug 03, 2026 at 04:16:09PM +0530, Varadarajan Narayanan wrote:
> >> From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
> >>
> >> Add support to bring up hexagon based WCSS using secure PIL. All IPQxxxx
> >> SoCs support secure Peripheral Image Loading (PIL).
> >>
> >> Secure PIL image is signed firmware image which only trusted software such
> >> as TrustZone (TZ) can authenticate and load. Linux kernel will send a
> >> Peripheral Authentication Service (PAS) request to TZ to authenticate and
> >> load the PIL images.
> >>
> >> In order to avoid overloading the existing WCSS driver or PAS driver, we
> >> came up with this new PAS based IPQ WCSS driver.
> > 
> > Can you tell why you need another driver if you are using the same PAS
> > method and it is using more of everything what PAS already
> > supports ?
> > 
> 
> Hi Mukesh,
> 
> We just use pas_auth_and_reset and pas_shutdown APIs and do not need
> the entire framework provided by the PAS driver for IPQ WCSS.

But you are using qcom_mdt_load() in wcss_sec_load(), which internally will
call pas_init and memset SMCs.

> 
> Also, feedback from Bjorn in [1] was to have separate driver
> instead of overloading existing WCSS driver.

That's a very old thread, 5 years is a long time. We can still revisit why
you need a separate driver. If you already have all the stuff required to
be a PAS driver, why not use that?

> 
> [1] https://lore.kernel.org/all/YFK1VpP74rQH2Z72@builder.lan/
>

-Mukesh
