Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794416888;
	b=ffrW68Wqx/YGe7nEZ5Nt2br3UWUYR9rUXQ7AARu+FWGkxY4tuZWVbz1Gp8X5C3zkElMk
	 OhnEsANN+7CA+EYl4Wj7JdOdNHDyThwOPbCm5qcDgtKfkgT72jKwXIzPNERjVvqO09684
	 XRl7P28JVsBnVgCk9P51DxE3e2gU38qaV77Jg3++udiR6KsTvkcM6hcV92wH4PGjnzKqW
	 Gh9vVoJDvkzNr+41UvjftjSIv4d1+g32vv3Ezc8hSv9+JMqPleguEwn8qA0Q5T/1dJrnC
	 33S/aS+ivvuWDXmE0ZfIo8HP9N3c60E954+BceqNCtqZ6BDDKg5XwzJDNSDsoxbWDiA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794416888;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SxOyryHUbNQ1cfTF9VQJXNM+vPgoGOT43gQa9xsLuaw=;
	b=vzjBtnPb+sMCqURaMpoxfuuqaYtw48vdKPRgskGSfYebZVWFD5A54Xl5Wq4/vbnz1cXj
	 ABB48l8oVEMTZ0D+eoN7RdlTmQUYkn28HwVnM1WuOygEn0g9srAWuSMfKhZnyFaLYlmst
	 D7NHZrQB2FMpP4PUZl24nLowXrcqGmAU+ITWeDAufXrK8mZmPF/7MuJFv26/IZl/q9CN2
	 RchDEbw04VDNvx1RIoTE3PBvlGfnThFQO/h5rB5Ytx3t63DDCb/hdNb6GOG4sKTf+xsBg
	 ecO/JEkpfaF6zyedDW7OnxXt/THfVfQdzdz9W1X3SQ6MWT7HK3ZnLUk7c/Wt4DMpv9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=olqaZRkW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MepBTJ7W;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8EF606A339
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:08:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D8EF606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=olqaZRkW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MepBTJ7W
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF044l1665562
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:08:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SxOyryHUbNQ1cfTF9VQJXNM+
	vPgoGOT43gQa9xsLuaw=; b=olqaZRkWfFlPRoXowPqT2XFofvzN3neVvYgeoSBN
	Lxo20Iy4WVfIsO2uFubngpftOURpdv5pxZlHZzZUWx17E+TtF987HAPafaDt5UYE
	MqiSMwtvs04WOsgZFfpFisIvG5+yr0PEQF2xxc/OKv+zut9F3pmSG9PrqrDUL6sh
	gPDguZ94O4EPkcpn6RbEpA8r5X3LF9y5lQccmacDKiTFnnXgWiITYxBwrsblsRiS
	TLBORvlsAug49jzlqHMgQoXOigI7FFTxJOi2QxeraA3NEcB8FCnwOjHdhAswKkmX
	E+0snCgosVKnMiWyC6bq9qgE04sUAKoGOIyTYrZiMKfH3g==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvk7ptbv5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:08:07 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5ed100ed770so690600e0c.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 09:08:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794416886; x=1795021686; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SxOyryHUbNQ1cfTF9VQJXNM+vPgoGOT43gQa9xsLuaw=;
        b=MepBTJ7W1DQYmbe07tj9U7jkTuA2C0kMCVLVrzLpvH/dZRqiMulfg2X88rh/Gbiwvx
         9Wf/9DzP9/axnMbRBkKNbOyHcpJzMKeeHWuEe4gOIhQIDbcGXSzbwZN2Y/5bDEC9gttQ
         SvMXLEaoVaH4YFw84qeaD4x73NMzNNTqERSmi2YmJ3SeqpehhTEhr6hk5o5gwHQeb5AA
         k20B+w3k3ZoS4fcGazj5hisL2eeepCq9aHoo54NgsR75lWhbXxnG7I+gTKae1XPNeoT7
         Y3yH9m9OES3HWSw/WKPKA+hptzaSiNyd95jPomIvnsINjanOAZeP2VCZ9DAfj2S2JRKb
         bhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794416886; x=1795021686;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SxOyryHUbNQ1cfTF9VQJXNM+vPgoGOT43gQa9xsLuaw=;
        b=gtA+nndgnUZwJrb5DzT2SPLdVLhrfm5VufQfU7Ih8AHbCXlKY4iu9CgrnqYLWWcp3g
         /iuN4nENyKO0oY6XrVDZwwufRv0UGa6HVYnYPFBM4DdwSXJjf4Fgzy5bUvRtfQUd2qTN
         VxlkNeUh9A8HZkaobcpulN064Q9Oh7r216nLtN6B4eTAB3oWy6hlnT1dLCX9L9SGC9e6
         PjEngk2IEqzuZX1fUDhk25xtfQxA5HvER3Pr4Km16arueQpVtwrxxfZdmglKJQL74cSe
         cH73jHg4qTFwOYPTCAdQ2PxQ5DXgIo2O7+bl9KFEMJkAOaQtDV+8t9PFxWt1gSEY5Ri8
         KUVQ==
X-Forwarded-Encrypted: i=1; AL+hErFqWeg6Ln0ahTINiwt/THaC+8aclD6syOlR+M6Pi1SXFvFOQ3876O59LQW2j9Rl94CTY+U07A4fTgbp4XfP@vger.kernel.org
X-Gm-Message-State: APuU4Z8NbyYiCKelSi+fYd8mJdFWkbOE3ohjVvD0tAd/GdI7j7wFBp+K
	8dqkZOTRpR0a1+DFEZEXne5UOTq2UII/PnUYKkF1w32DtPnRL1dMkKwDprU+tGsLvWPQw8DEFqb
	jrFUr5NVCy47W5J5/tvWj71T0qEFfKpHib+Y51RV8oypngI308cF5sQ+sNiIrlrifmonLBeKMjp
	OS
X-Gm-Gg: AYBFou2TQWkb6ZtJWnHSfVJBfG1hjvWTpEKDZtYBomHiXQ0SCGzOpyrz/XPfkz2DCO+
	MwWZgB4f3d0BvYL2bo0GvOZR3QoBf/Nj0Jtw12pzEB7/VIcBxr2V9xQitqy4iHwnY+D0PFtcsUb
	5G5T/kRW8yX56IPQnF36pkWv0wIcTpSvsGt9arFiReort7LyM27UFikt3MPwem7ck03X4C8RUKD
	EZZfPzlp9ZqWiBcmwQDyoBWC9uuTLaxpMepN8OUz6jSZ7K6gewuRuNQskZYaqP2iAp/LV2k1fYi
	PSkowRS/e1XgzSQCZsvL/R3dMneB8mrU4e/5DV3pOd1Ou4tssYwpuJcICpLCdI2EccMaZWV5B/0
	f3D/MPU8Ua1rQhbvmBoXGLHkQ9Pt7orF2v4gGl8Ob3vHXzXa+gSqZ8yeJVdiBLZIU8yrGn1PcES
	ewMF57mx2fSuPhUhjeofJeCbdh5nCS+cN+y0mm1poacgg2zqeBNl0C039Tn9iUcw==
X-Received: by 2002:a05:6122:17a9:b0:5e9:731b:84f3 with SMTP id 71dfb90a1353d-5ee1c3fa04dmr1120657e0c.12.1794416882269;
        Wed, 11 Nov 2026 09:08:02 -0800 (PST)
X-Received: by 2002:a05:6122:17a9:b0:5e9:731b:84f3 with SMTP id 71dfb90a1353d-5ee1c3fa04dmr1120632e0c.12.1794416881748;
        Wed, 11 Nov 2026 09:08:01 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae09206aafsm12751441fa.9.2026.11.11.09.07.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:08:00 -0800 (PST)
Date: Wed, 11 Nov 2026 19:07:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vivek Kumar <vk092kumar@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] drm/msm/dp: allow eDP sinks without DP_SINK_COUNT
Message-ID: <wuuyudiqxomceind5f6yox53db5w6y75rcnbgscxujvv4cmnya@iq5522yhs7o3>
References: <20261019051441.2835682-1-vk092kumar@gmail.com>
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
In-Reply-To: <20261019051441.2835682-1-vk092kumar@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2OCBTYWx0ZWRfX91o+NR5cQyGO
 Dgp/vf9/feoSL9hC+0N45Og3HvU04U4NsWPgCCex/HlVNItV98uJ6JrM06IWl1VmxZIO8u5wknL
 YonWNI8rSjpfNI5QqjlFOmiFYz0Pb5E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2OCBTYWx0ZWRfX5BogQz19mHfY
 iamqdZjvDyaI7ZdjoKYvUVOFAes867E4fghffPWLr7inqL80oitFBKk7ZX5neZ9aDLrdOjWKb7O
 r5uLEtBxFwnS+nvRnsguIiyJzkzcrnZK0UPFKntKJjMZxsIgM6FnN9YtNC/+HBoUy+bEmAP7QK7
 tO7xqhVXonbLbKMpxk5aStKHC5SRIraqMv76Iim8v+qc9oxHXBk6wvdsy5g/jvyUfYJkPIxL29X
 yBHA5WM0ET/0er3/QLAisFDJPjoHwTc9KiFL/FhfCk5qqJrB64svRZX/ngc9EUnv6uChI54pqKq
 CGdCfm/xschYrX+d1Hqw8PC6ystwBCouo3HPec/1SPGf13DrTMvW4Ag/OY77edURtc8iTelfThZ
 OPJm9t3KkNMUi/9shUSOQ9DKNEJTff6CFooWyh4Yr/B74Ixvx6nEkE9h1Jx8meInY6aqBDCkVjs
 9V5bKkG3ICfLwt2F4Mg==
X-Proofpoint-GUID: ap1eygAJ2I6EhGQMrZ__4jAdn0t6M1QT
X-Proofpoint-ORIG-GUID: ap1eygAJ2I6EhGQMrZ__4jAdn0t6M1QT
X-Authority-Analysis: v=2.4 cv=BpcIUoX5 c=1 sm=1 tr=0 ts=6af4a0f7 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=QhjrP75uP0Re7qhQPTAA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110068

On Mon, Oct 19, 2026 at 10:44:41AM +0530, Vivek Kumar wrote:
> Some eDP sinks, especially fixed-format eDP-to-HDMI bridge chips with
> no downstream AUX-capable panel behind them, do not report a non-zero
> DP_SINK_COUNT even though they participate normally in DPCD capability
> exchange and link training.
> 
> Treating sink_count == 0 as a permanent disconnect is valid for external
> DisplayPort, but it breaks eDP probe/enable paths in
> msm_dp_display_prepare_link().
> 
> Use drm_dp_read_sink_count_cap() in msm_dp_link_parse_sink_status_field()
> and set link->sink_count to 1 when the capability is not available.
> 
> In dp_panel.c, msm_dp_panel_read_link_caps() still reads DP_SINK_COUNT
> for branch devices. That read is left unchanged here: the sink on the
> tested board reports DPCD 1.4 and does not advertise a downstream port,
> so that path is not taken.
> 
> Signed-off-by: Vivek Kumar <vk092kumar@gmail.com>
> Assisted-by : LLM
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c |  6 ++++--
>  drivers/gpu/drm/msm/dp/dp_link.c    | 30 +++++++++++++++++++++--------
>  drivers/gpu/drm/msm/dp/dp_link.h    |  5 ++++-
>  drivers/gpu/drm/msm/dp/dp_panel.c   |  5 +++++
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  1 +
>  5 files changed, 36 insertions(+), 11 deletions(-)


Vivek please check the issues that Sashiko pointed out.
-- 
With best wishes
Dmitry
