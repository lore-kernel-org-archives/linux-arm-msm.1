Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A1424B28
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 00:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787184589; cv=none; b=MYHuvqe4QhNBlSn/bD5/kpWFcjiFSmaHFnkSW7xbBtW7wJFSkG+b5CcuFR9vSWCVPf7EyeW4AQOCfx40SVNUal01anbwvdxUqOWtR0eFDWUmv9qVgbJeqVWmb9X4Iv6QlmJ9x5tyjuP1oRlPH1X1ivsa/d4dpAooxZ0ttS2O6l8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787184589; c=relaxed/simple;
	bh=BbYV1T5PPR18+l+L6Swxv5tPta1L4nKglgRi0ktaiug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rwlzGfI1YNxCMNrvehldEO3x+c1sRtrg6Tv5Xuv1ul6WlVrUsdngYtXaj2rSurIU+PEu1prBNTTpWzPOoSeepefMe+K00q/6IQ1Al7hARU47tQjhgka5O98CvV/wtOSmhepr/hSqKJ05gJn9FWvUBnLPxsBJnsSjT8jP3CQPhKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H4oIyoFA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MUvU3+hQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H4oIyoFA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MUvU3+hQ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JL7W5B1438610
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 00:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ejd44ukcxUiyZAXHWEB4YLVE
	Zl69Ea/qBWPRf0vVCR0=; b=H4oIyoFALahghnD5E1fEcviw1MhC/RHsSwGfjqOz
	Ms1GGAXW1E0HTMNT0tS+WQAUZKZWGFXRLwHZ+ylwLA2h42yEErP9vSVvHX59JPc2
	3X2URwOnEFgI97QdwJPxO5X09SSkt/aJ4LvrMKyhqFWzJ022Y4F7TeUYwfBZ3B9E
	w/axFGtPvLBEAW7SkJFndcWIpy31bOaSzlJiqQppDAFp8d1X6VoTw50J4OEQQT/q
	5okALsT42zkI+N9EljmN9SVoTsU+raYuVBMpTkD14oDS0Ie0eJdYHQLB+YaC4aY2
	DEU9y6yjNX5XtRx8gGioLAJjrsyQU3+sP/F94F/226z5nA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5daa2q1u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 00:09:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936708f129aso144792485a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 17:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787184586; x=1787789386; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ejd44ukcxUiyZAXHWEB4YLVEZl69Ea/qBWPRf0vVCR0=;
        b=MUvU3+hQar4i7Qfjm4MNUMo5xKRk/gerwSQL0NddhYyojjoE0tzgQEIY3ucbme280Q
         QNjkVfQxrjVtWLalM3xjYiVC0xasp5aMXVRGFGqSnUkVI4ZT6bg9WM2TYnZd6MlMnH4Q
         RPvnkQdqtafMSWuBKNFTnuB3qSAvi+OH3jjHsZ5o9uSZVuwMHiXfp+xUdCe6bp1S9MTN
         WsgKQVQHypj4y1boq8E3TJhpVURRaddrPAFq1Jnvaujd4vD2IRPIt5EbEgxfeS8ZIK3A
         FTTHHBPVB5GmjSFsMd5Kv13hHUsot/OVDgl0V+l7tjemZr/B51hYZMUjBnCJ/ycuK6NT
         PIvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787184586; x=1787789386;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ejd44ukcxUiyZAXHWEB4YLVEZl69Ea/qBWPRf0vVCR0=;
        b=DHa1pvbKx8QMRJPUyT1WHnKyfY3yJXaf1wmgtgSi7O/GI/klYVSbpHabWev8M9EM6h
         45sZOG9jekWTd/5DndAlf9qKW8x1TlIuMCus2NRiAtR1blMbvB9zrHbdpafGpx7eOu5F
         6wO6LyWW1KspjgQCzSqASmU4XRQGKem31kTovJeetu0ZsY8rG5TM6fSE8T4O0+mAX7Lw
         w8CMt+2jzYTqJmyzSM+JDIeYNpRKzjOJ1kxDMWyEhsl1c3z6Gsk2NeX1u/ZuCSf+gC2Q
         PF3gx8BvVt5iZOTlbxaHcZkpPpjvDL+DxJsXEfQ0iOCL9DFbM0ibaEpcRhO1rF7qwqOn
         UMGw==
X-Forwarded-Encrypted: i=1; AHgh+RpI9yoiKp2ToXP1d235qcBIPGbw9+Mcw5SE+W3WUdtjiNYSS/Viz5ws0oe5LGvlG6uq7gMt1Di4I9AiNIg/@vger.kernel.org
X-Gm-Message-State: AOJu0YyKGnzFFOPHPewZJozXJ5QODZu/P6zGJhuec9m45hwCRDrGKGNR
	aOKs/vFmwQbOpC7f04fz7zkbnLHzY5m+dUlnSYCm3W0+ffelQq+JxMu16I2E7b/0d6eWp/kEuXK
	EM6RuF/6N7aviNPnimq1UDTHp1Htm9qYpzCYO6vK32MyIRurEd+pawzBIMLMQf3xqoi3D
X-Gm-Gg: AR+sD1027RZVdTtT6REpFNQCOE9EUHjFIa2uDo8s8AxDeLwlOgpf0HUlM56F0qSE4G9
	6NcHsemtwredw0Mit5iWMmQoCfCFrMvSCzxxv6hhiIWKAcZSXNrC0GeFfTXiTOUAiWzunl4qs4I
	Y17K37pQ46rkOneU2XEsQjLtR78A2uydC4w4xmoHWf8qWrgDL21jEVv+esmAD0bVal+Sa3/q3LX
	OXImbrKgMGwIonz3JqCagIb1I1IjYrwfp2ihEzCWvCHZNbjpHr/dCY5dXsMkLXiNyH7n2WPN3Wp
	GJ2Tfy2gUgh3dQQ14LSEaMnHynG+ub/epTA+U5IhBzpz2CVrn2TM/olpnPUCClfYJ7wmsopaQvr
	9lERz/3DMHOJIajMvyHM4l33RnFOs7iqH+vVJbGzQznQfLNZHAtNsMZbE8PRecCpLmVySiXXrqW
	7p+ekGqCiy+GWs
X-Received: by 2002:a05:620a:6408:b0:915:d443:e6e1 with SMTP id af79cd13be357-9371e301758mr848736385a.26.1787184585985;
        Wed, 19 Aug 2026 17:09:45 -0700 (PDT)
X-Received: by 2002:a05:620a:6408:b0:915:d443:e6e1 with SMTP id af79cd13be357-9371e301758mr848731885a.26.1787184585313;
        Wed, 19 Aug 2026 17:09:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a189ccd4d7sm9351001fa.1.2026.08.19.17.09.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 17:09:42 -0700 (PDT)
Date: Thu, 20 Aug 2026 03:09:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 01/16] clk: qcom: gcc-sm8250: Tie the CX power domain to
 controller
Message-ID: <cztm7jg7lhrccixixjd6dpogy4ky44e7kursf4akwux22vtyl5@xq6txg5qq4u3>
References: <20260819-qcom-tie-cx-to-gcc-v1-0-840034124e73@oss.qualcomm.com>
 <20260819-qcom-tie-cx-to-gcc-v1-1-840034124e73@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260819-qcom-tie-cx-to-gcc-v1-1-840034124e73@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=fv3sol4f c=1 sm=1 tr=0 ts=6a8645ca cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=9JxFHelw-nvN-s8SXg4A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: jYDZ9p6Jd2iIwY4dM752F3XsZ3_rl7QM
X-Proofpoint-ORIG-GUID: jYDZ9p6Jd2iIwY4dM752F3XsZ3_rl7QM
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDE4NCBTYWx0ZWRfXzK7g9/zEc5FA
 9UvwJaGzkgXKfcNSVY9ZTgnzCcO92qUmOkf3V0wo2zBfvAesovmt1msWo1cSz1T/I56B5dm91eX
 VuNDLYuLx/HTWhdR1Ai+nmBtXCeBt2A=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDE4NCBTYWx0ZWRfX1brqoPT7Fcs3
 7IWNdnkljadsBvd+3Yn+uuTqeYONWlJa0W9XCHeS+b2SeLkNwXK04DUl/s+1QOtLRaSVwIXYwY1
 VtXwqqISuetAM6/nMgDUK/Veb2dqndmJR6ybKLsHlPnDPSQ9Jqz0FWURrNPpG9RPS2huNA6YgwJ
 kHnuHuYKCCXazhCx6MycrtL2vPcNeik1VO8FILGInWzrhjcB2dWKbBFNf+CzV9bzfGMMT3wQ9j9
 4T1zMKxL7LFmQkHkEtMdEpxxt2ML+mF3oXtm4ZFf3mh2fW2x0e69dd/VB+d65xmxS2kKeZ/RbiD
 wa6Kb1iNaXBsnOVRu03f/MuBAcM5ET5L+jZr0MjvGvRBt8qY+1mG7cbDecMdhzN4B+HQz+/ADS8
 kP+UlE3bQPy6u+SXHZVrlHX06hNKvsVFZQM/PKm4ktzKt77JLisMPGVQSLegAhxqFj3TXRCkteO
 t+PAkTW7E0OiTEG7yZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190184

On Wed, Aug 19, 2026 at 03:51:46PM +0300, Abel Vesa wrote:
> Enable runtime PM for the controller so the common GCC probe path resumes
> the attached domain while registering clocks, resets and GDSCs.
> 
> This lets GDSC consumers propagate their votes through the GCC provider to
> the CX parent domain.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/gcc-sm8250.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
