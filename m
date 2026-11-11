Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794408102;
	b=noKxoxBwdonpHhY+6XWTjnfED3RDXEg8L0+JBtbOnkuUljm5FlAptpVwQga9BZporiX/
	 r1t3yNVpclG2BjdnBvl1Ukoa8K5rUBB3f1sCxx+MwY6E5BDZIIjQhk54nFrZXcUhe34V0
	 6Rv4lPJRbFh5//xdZ0PwD0k7fGLiRFC4rcPh2RC22C0xGxOw1P8HddQemCeAwBD46DtJ1
	 P/rOg57ZornCaXsDSvuqtRmsqITOKNY/fpCuItunbdthYxMhZ62Y6Ys5JMygMQJw71767
	 fMbK6UDreG5HvXYF4ypnjBAOvqqr3ZBvKvWT+Janl5vDgyYrMAe1dSunxrQkWLkwm6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794408102;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8+OTqyFIZNj/ZWYD70+Pj87lVYrEXWlE6vL0wA6fPK8=;
	b=EHkrzpxYGKLHJ/Uc1xe2EVBthauVBSdSbZRiKRSyy2AhyJsPYdL776+EQcGcbswtud9D
	 TOf0ZzK4/dYbKpq4rVPG6VGPFIUK/7dbx009VdIS75PF0XdIwVg1mQ3pIK0yBgt8NbLWe
	 eSYYxFg9tHyfzVexVOw/GPekb4C/UdHFQuidl5NfGLUT0d9SH+QYxBhfRXYe+rqdYM/eT
	 eiTfIwjxU+FFUUHeZbzvfND90Wac78lyoyyONF4b7R90S6V0eXemhTjBOu4UAr+fO5DGY
	 asv4H1rCiHnN0TD/6f04YSI2XK+pahl6xPoEos3ysB2mLxy0aSSZWPzynZvCQaTbOyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gkqcOOJG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="VDpv86D/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0320E606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0320E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gkqcOOJG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VDpv86D/
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABEJ5XT3198532
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8+OTqyFIZNj/ZWYD70+Pj87l
	VYrEXWlE6vL0wA6fPK8=; b=gkqcOOJGotekbX5HXwO4LsrSjuKCl2eipTR1QVn/
	IUnciLmv/akBpXvAMJa96jjJVWZfwxMRAwc71XXQKyGZIiGkfTjLh7+0tAhRt1di
	jk+WXfzHezA1lL4SHlRbkgbHdxjNf6REBRNrM2zP5D4JTjednuaW/mQwNCYKc9TM
	oMiit/f6uijQlKgsPymmf/EWPYv4OA6GnBwEEdvT8Dpd92C1iblOLiUr9pC78sO/
	ZlB2GKN/xW7yRUmIN/Vl9nIZ2St1vq++/BW5aS6FOF2O9V1pkTK99wbq5GChEK4G
	r4GZ972YegkzaPU3SbZIQ3kQoUnAlZ8btDCtr08Hb0u+Gg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvt1503cp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 14:41:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so681685185a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 06:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794408099; x=1795012899; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8+OTqyFIZNj/ZWYD70+Pj87lVYrEXWlE6vL0wA6fPK8=;
        b=VDpv86D/A0vMK5wRh6hNmAwWNTDvla08jM1xUUJVdmZQKIHLOMYwSSaMJ5UuOK3Zya
         YQJA+aywuVvVKv00Cn7lghxtygqxEJsnwWZ5NfZ2rfTtqzs5RL36QC01tlP5/Xn4H7EK
         NTevZsD14PoilmbIEzfiWjSJ47YGvaQr1u/udMJ1iH7XLeylBc0MbRHE1Zt0WginIb/h
         PVzDQc5PRitAHH8UVGlCbhWrRsNZxdGCynFY/13VGHMZA+51WNlMRderd2p3n+ny869C
         /N7CalEuiKbIpPisB6+wY6B+Z210zJ8YleMfvq5kQy7yWHlHbgTtlWybssLwx0x80hBU
         01sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794408099; x=1795012899;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8+OTqyFIZNj/ZWYD70+Pj87lVYrEXWlE6vL0wA6fPK8=;
        b=fwuICDHruPzSs1J5tmLJnlSoIRE2RwLvJwHoiVFwd9PE01eBwnlcs+4K7MYwsXdac4
         CVN6sArSCqqgsbi32wwgXGjdvjFj+3rg+0MF3Q9NmlNpmNOqhzkpsC6/KevZqEmHNycv
         kcf5m67Rz3xHU+4fxNTSnZwDWdFd0bufPGHB4MqjF8CKZO2qnWcvQuuLBq94gaG07HpR
         6hucoVmLvFrXFgVnFz/LIHP3cbfuRCOGDxZySNkC+4hTS0zKQWYlH8VTCB3SHOujESgE
         Pfdbyu1ty/addNWLYtFKVv0KWZGG65wrAuf0Hs0XEUzA3reB/J/yvvEJFsTPVSKCQW24
         /LoA==
X-Forwarded-Encrypted: i=1; AL+hErHcaaElJJ7Ca5NePCjXpmb12vZp1Chm7y/fhJsXh5dmPYi1Ltiq5c13esQnXfzhyVwnNRoLtvU7f+PlGbCz@vger.kernel.org
X-Gm-Message-State: APuU4Z+nZz69/2LcEyoR7WMMveDz3X2dGgREwPrtgIg+GkGW3VEf9L9s
	MHWz7Hahgg5/VsK379D0D8ididJrKUMYnBL/JKwyXd2/8tnY/A2eC3xmLL05gYBQuw8iiwym21v
	BBr6t1UZ1O4LgQ31qS7dgh1IaFq2XW5kSx9D2eRINtp7NeeNcT0OFC+O3WJ93vZQzE9xo
X-Gm-Gg: AYBFou3p/kKL5qH9xVgtiwWcbFpyp7DD6zDjKMfWYuopl4wNfmD2fjdqpOUNXshNJrG
	d9p29igzNO/7nPOTD7ga9FhhaeYYgA+I8UDMfOT06Q2L/YUoe6bTgMw7k7K7ySakpXrlEDeHGWv
	OFQJF01W1WeIXsWC7dRJVYqW5G7RJZFpXaDlEL38zpk7o1363YzKNKcCSqHCM2GJlBlrLvWnzIc
	6SbdDFh5z3nKYBFkdv0ozGAjWvTm11oaMrGj/k0JSCBElZob/sweyOGDEkRwzlwcB0TUtbJhOel
	nTL0EPDdddSBcb69Imv0xJ/UaLBRBG4mpSMreJnuUzjaVNwlpntPf2Xv57L1oLCynNg+EQIsiNP
	Yg7Pjx3WzyFFdylu4LA4RmiCpaIOfzkLKPcdYzo6lDpJ6S4E3plN3aKpEsZpuOnAqqADbsY6BWN
	ZieHDF4vgCBo473UxGX7n86o8okQpD2g7TaTnhyia2LjEjSIcba8v4mFfTWWdb/Q==
X-Received: by 2002:a05:620a:4544:b0:93c:9d56:a860 with SMTP id af79cd13be357-947affe689amr432824685a.19.1794408099352;
        Wed, 11 Nov 2026 06:41:39 -0800 (PST)
X-Received: by 2002:a05:620a:4544:b0:93c:9d56:a860 with SMTP id af79cd13be357-947affe689amr432816385a.19.1794408098527;
        Wed, 11 Nov 2026 06:41:38 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae0926c65fsm11020011fa.28.2026.11.11.06.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 06:41:37 -0800 (PST)
Date: Wed, 11 Nov 2026 16:41:35 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v8 02/29] drm/msm/dp: add support to send ACT packets for
 MST
Message-ID: <ebgbhztbeifcty7tlzwykvwcfrn3bwsktfyy63nu4ocvygnqnm@prggbz5tzmct>
References: <20261110-msm-dp-mst-v8-0-d040fb33db5f@oss.qualcomm.com>
 <20261110-msm-dp-mst-v8-2-d040fb33db5f@oss.qualcomm.com>
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
In-Reply-To: <20261110-msm-dp-mst-v8-2-d040fb33db5f@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1OCBTYWx0ZWRfX1ioi3shxq/od
 sgeRuLOqzIL670ruYOpT0IFSa54DKdHYIJMmG/UiXs3l3Ul5QeDVgxYWlRF+KLRkg3Xj5XNnAaD
 A7G1/D5aojJHm3nEODvYa31c/Mm52nA=
X-Authority-Analysis: v=2.4 cv=Yrya1IYX c=1 sm=1 tr=0 ts=6af47ea3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=CXPGfuEPe1jOflqu_poA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: _ti4-JepMIwr8e4J-kszaLxQftsJWbJb
X-Proofpoint-ORIG-GUID: _ti4-JepMIwr8e4J-kszaLxQftsJWbJb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1OCBTYWx0ZWRfX5DvYhBMNdOqy
 PXeR4gXZxxvQuMqx5LRr5RP68zq4TYxZnOu3vobWN7y6Ik2fVrrpVSYQsMPqMwGjRixpVp3On0t
 gqOZF8nVt/uJf8vISezTBq0cIZ/314h/6oREuOHru6TaRleFg8ssiQVmTedP1UsybpC7TzwfxUT
 /XRjsk8oBzXjoYlUX+nv6gnTZ/WTLpZjOKvbYEu5C1cRO/hHd3Fqrx9PZUmow6d+fWEeycjv4aN
 YalB11IL62fcvPOOU2cPopywwHJjKTOX9z7wbsEQzh9Oms6vDqxtkImxIZrHfOMTCP0tPV2w59e
 MunION69heuB7ZtAJNQ3uFNpMPdzOu2S76wCEWQbJ9K3QOcsWJNjNRa7G0wLh/ZvTbhY0LX3yVS
 JJ1jsx3Uirb8sBtcwVh+NhRjjAPUJu8E2v4G4W5kHmKcpd9L++TjGPPG/jIPgW0/UanNzjpzRCc
 iVGtvXqacm9nDhaf+Cw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_03,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110058

On Tue, Nov 10, 2026 at 12:54:23PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> Whenever virtual channel slot allocation changes, the DP
> source must send the action control trigger sequence to notify
> the sink about the same. This would be applicable during the
> start and stop of the pixel stream. Add the infrastructure
> to be able to send ACT packets for the DP controller when
> operating in MST mode.
> 
> Add REG_DP_MST_ACT, the ACT trigger register used by this sequence.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 44 ++++++++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  5 ++++-
>  drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
>  drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>  drivers/gpu/drm/msm/dp/dp_reg.h     |  1 +
>  5 files changed, 51 insertions(+), 3 deletions(-)
> 

Is Sashiko comment valid? Otherwise LGTM.

-- 
With best wishes
Dmitry
