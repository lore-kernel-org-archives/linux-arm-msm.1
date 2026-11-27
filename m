Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795781194;
	b=EB1tBzrkHKzcm2LtagMLod5k1BH3Ockj0coDIoxjVxlNcQxYFCJThxwohJ88vOA067tw
	 +T5GaK5yy1wqZY7HYoD+dlFqtS2CtNQ+TnBqNpj+FK7mrB3nk2YP+uj6ZUHy07YNfRKxy
	 /Zi1hTJv3hIStJv7y2ZC6wXRmEFK/PnjtcNzGcfultUNDW0DQVgZgGDIffo6JVVTKvFhg
	 tQK3rY8u8O8QiMpCO7t1xnO3XySEqnmqVNF6HMEY+dltyf69tSfydMpOi/xlgkSvP+Vm+
	 1G+ECLeDx0eVbCRW57ZvcwcwYR6y/wKuYpNzQEmuXfvbiqC2USRuky4BNYcimv+hmfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795781194;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FELi3FLt/Pi/OkzOMRJ8+hRRlAJ733i1PeWjERVJCog=;
	b=WXn1sWG0AP8fhETHu+UGwzJHjoAtovtqsJcFCLI7/E9jUYjW8vYDQr4ObBjeyHsyYBXX
	 VIaRZKmfKuQBc1DfUqQ3G2bgdyOSiK4+/WJ5I2VCOK8puhYaSkCL1bJXwxniQY/HUI6vb
	 /TVbaa4jLAry+c14JYPoHWsR4ruAoLA//IIlwL5/YI+rvyKK7fnpMfOFympfzQe4VVT97
	 J3GnSoVSFnj96ecZkLKTUvbAkQZrhner5d1p6OewoRRs7xpI8wxmRrMmFJ7NbsYGU22W/
	 fzTxYYtzOSGbFPf/XzE7KZqsoG0Xp+5HoMaOwI2h5/Mub0dA9DfF15ZhEUMwjIHKuSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E+Wy2cEE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=biOFgqye;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4245606A335
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4245606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E+Wy2cEE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=biOFgqye
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApACM2906439
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:06:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FELi3FLt/Pi/OkzOMRJ8+hRR
	lAJ733i1PeWjERVJCog=; b=E+Wy2cEEGp8cp9ec8ULDVVwt6zaET6LAMFhORq3/
	yfd67peeBurtHEtZgo52TiKmrOvoe6BVCBInWBPoKwApmXdisvXsEXYYW6rq/jMd
	kx6KQKyWZnD02QTRElFZgRnP5ubMkMFDepJawLPNrPemza5H4qunjxIvs8J/59Y3
	bTftW9LSA4ftxYqXvm3c74OQ1dXzYWD+RX6Wn7Yje1lCIjZX3rSvdpkRArqYump4
	Q1qnk5H6VHzoVwyM79CYICdIpcoQRlH3QrSWDtEsRfqnV7qX+nAnvC6olcMMJyCN
	JNe/jbVgU7HxNAf1lB0u4HwNHavdJFz5g7BQF42HHSvS8g==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf93drm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:06:32 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eab0467c89so8466432e0c.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 04:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795781191; x=1796385991; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FELi3FLt/Pi/OkzOMRJ8+hRRlAJ733i1PeWjERVJCog=;
        b=biOFgqyes6rdNtNL+EX3DLscZYqZEeElPupO9KqIN7mhBjdQ0Civ8C/Z/pDlNh3t+5
         0N/tAfVB1UFbQ9jjBPlP4zD30tOh/zkzH3usDaNhUvDL5qOgwfkDVGMLcSaR8pMP7sKV
         LlVSbndPqSOkyx3Pbtd51wEsJKG3KsrlepRWXMN7GWSFFSur9sKFYt34Hud2MfW2xVac
         afBwZDFTq+oR87Px8Pv2hFQG9/m8O0fjE8EbJLo689ZsuGAtwa7uE69Av2tVD/0YowBg
         e4RHKYMO7rnkkjlyesEMqnEoHa/yrWJeOM4paMYrM3crgGkEUtQk1z7BvMHleHOSyj8x
         jPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795781191; x=1796385991;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FELi3FLt/Pi/OkzOMRJ8+hRRlAJ733i1PeWjERVJCog=;
        b=2Yusboh/IqGhfm3A6RDZN8XSScGN4w6KCI+cYS5xPvA5xU4rX3iotvTrh5MWHZ97uY
         JI0QcTN870BehPX7+aCQ0XP1kcKL0HNF+B10f9L8X8De1E9AWYzKn7WsWaKIHXC+MF20
         c5oYZAhDCXcBhJLQlTWoJsgH7+iudH++sw0qA82Kt4WUgdUPSa6C/4Ryhpjv42eT/rWe
         +1pUgrCCkFZG34Dy+kCh11z07AKj0Mg9Pncz+HBIYvtswQGjzgyAUeiqict6T9hBTFl1
         GZeqxY+kZzahc/I4C2BHSg6X1p5izPRWRCGfY6BHKXNyOAjUVL6hnMZZDvQRV2bWRiN+
         5Njg==
X-Forwarded-Encrypted: i=1; AL+hErGWxtFYV52BuTTa06zM00nPm/HmKRj7Jb1YDmB/TP/SStU6o/hmWIaptPWkfoW8EhZD0L+np6y/XgZbTwpk@vger.kernel.org
X-Gm-Message-State: APuU4Z9Uias+3wHFgcuH4rambVx48792xwwXlAZh8lwGrZ3a+fACGFfK
	Z8AeFBBeqBv9DfS9AiQPiv6kPriJXvTR9h6CqENK2DDkCc1SIqYsom5b5mqIEEWy9aMNbld5J9w
	k577JDhdjdRaIIPMBWaA08mxL3xXPT+oTeTyw3wBBkvMd1fbNJzXT7qP1+nNq/cgQTr9J
X-Gm-Gg: AZFdTZfMvTQD9R9869epaeTiqxSG7C0gmC51fbHWezz80u2LNsmuLD/fCKAR2PmYJac
	06cgHPrYRuQBFOKs0LoZx6QEJ0SOieML/wAKt7cunVPXgRM87ZdANDbpTdMFAOJlqJX2V/PX6Gk
	imB2Yh9SVLLKaxHQiPicpxcDePSrgapUueBNqzqzkPs0a9i0+ZlkEPyewMI+awHzzTHSk01rYRj
	bBlnsvHao2PV2C+Rgm2DnDxzJCgeLWpBAavgs7jJAKjb26490/OX7pRO8uFnF3JBA7jYo9jrG5F
	ZIpNqTOrctp6PQQVwq+Gyp/410JuJ4owS5K1+3Fhh/Xwdrhn95lwV4AP+6Qjlff4ZAgAZS2sceO
	2svZAMaRLLdxshAEVnOW4Cc7S4EgjqA4qwLGt2WbmV1ACSUM9BDPGXVVKMtJVWwxsghCy2z1K7s
	kWApUq0MfaDFKQjIhhxBSfz5HpJ5u0VEntvsDQyoC8YDFm3OvhLyUsQAcaabbKcw==
X-Received: by 2002:a05:6122:32c8:b0:5eb:7686:48f5 with SMTP id 71dfb90a1353d-5ee8af0af4bmr14128016e0c.8.1795781190756;
        Fri, 27 Nov 2026 04:06:30 -0800 (PST)
X-Received: by 2002:a05:6122:32c8:b0:5eb:7686:48f5 with SMTP id 71dfb90a1353d-5ee8af0af4bmr14127954e0c.8.1795781190044;
        Fri, 27 Nov 2026 04:06:30 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd04451csm5860852e87.59.2026.11.27.04.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 04:06:28 -0800 (PST)
Date: Fri, 27 Nov 2026 14:06:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Michael Burch <me@michaelburch.net>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jun Nie <jun.nie@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] drm/msm/dpu: count the pending frame before kicking
 it off
Message-ID: <kcjghu2lpoijzanqtdvd3zid6g4onyesvsouqnehepo6q7liws@af36abycxzzh>
References: <20261013172703.12273-1-me@michaelburch.net>
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
In-Reply-To: <20261013172703.12273-1-me@michaelburch.net>
X-Proofpoint-ORIG-GUID: q_pc0myZM8832tSPQG07nQ7P4kErHME_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0OCBTYWx0ZWRfX2P9hoLjzInjE
 nPSY26kigQ2/7sDaiYleObiE8xSbfkN/cMdEhWhcNOQ3Gxl9PgSg76jbuMTeyqBxAH0Cp337a7G
 Ghzy4JY6XvIylhk88UA1YfMoJxd2gP/0w82wh4UXELCFWn0P9BCljt5hgd2cBi35ICoyLtrLQJs
 vpVkmLrGj0ftR0fe5/EFOAsxrlBs2y+JWkYR6T3VK9gO3bI15hJbnONPZowzHxeaUintU9vS7Cb
 XzRcaw6fFw+/Y2qFiw+XYnm/QTVZflM2uUAsROVCMSgu8VCeynjftzB8sWb0zA2WFpKL7y6dFJe
 RRCcfBzse+MXdhlG2hcNGo4jrGgFjZLC/goxNgRxtF8+6DnYkoe/oAoD/tBCvixFzVaq+Y4fArR
 59i7hT4doboWlyxOLiTKIbRmNWPyXjJ07sKDQYYD8osQvZwflDrrkFhahyAV0iUwt2i8nEI+X4A
 B8x4WpD8WKQSQyogG8A==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b097248 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=OZ7Xlw-yAAAA:8 a=EUspDBNiAAAA:8 a=o7I13pbtrd0snOxpb2YA:9 a=CjuIK1q_8ugA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=qwMvOfr3u-Fs83Rmfh-C:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0OCBTYWx0ZWRfX71v67aUAAqNZ
 SwTBlgEeGGXjfg7gG5emVgBlOBJ0s/TNtDgMyR4Yoiiwry6xc4NfeIFUvE/oIN5S6Y4OUJos1Tc
 SvoHbfVbJEW+4I2othTPufWo0VFYmW4=
X-Proofpoint-GUID: q_pc0myZM8832tSPQG07nQ7P4kErHME_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270048

On Tue, Oct 13, 2026 at 12:27:00PM -0500, Michael Burch wrote:
> dpu_crtc_commit_kickoff() increments frame_pending only after
> dpu_encoder_kickoff() has sent the frame to the hardware. If the frame
> completes before the increment, dpu_crtc_frame_event_work() sees
> frame_pending == 0 and ignores the frame-done event. The increment that
> follows is never matched, so the count stays one too high until
> dpu_crtc_disable() resets it.
> 
> With frame_pending stuck at 1 or more:
> 
> - dpu_encoder_resource_control(FRAME_DONE) sees a pending count above 1
>   on every frame and never queues delayed_off_work. A video-mode encoder
>   therefore never reaches ENTER_IDLE and keeps its vsync interrupt
>   registered for as long as the display is on.
> - dpu_crtc_frame_event_work() never sees the count drop to zero, so
>   dpu_core_perf_crtc_release_bw() is never called.
> 
> On an X1E80100 laptop with a 120 Hz eDP panel this left the vsync
> interrupt firing 120 times a second on an idle desktop: 14,407 vblank
> callbacks against 21 commits in 120 s, with no vblank events requested
> by userspace. Every frame-done took the frame_event_more_pending path
> (591 of 591 in one trace) and the encoder never entered idle. After a
> suspend cycle reset the count, the same desktop showed 3 commits, 3
> frame_event_done, 3 encoder idle transitions and 25 MDSS interrupts in
> 60 s.
> 
> Until commit ad06972d5365 ("drm/msm/dpu: Reorder encoder kickoff for
> CWB") the increment came before the kickoff. Move it back: count the
> frame in each kickoff path just before its encoders are kicked off. A
> clone-mode commit that fails its encoder lookup is then never counted.
> 
> Fixes: ad06972d5365 ("drm/msm/dpu: Reorder encoder kickoff for CWB")
> Cc: stable@vger.kernel.org
> Assisted-by: Copilot:claude-opus-5.5
> Signed-off-by: Michael Burch <me@michaelburch.net>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
