Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780424;
	b=rr0gHVvFIVzE68H/VF7wFophK6IFeHFBg2LYqlIPZkRMQfxj8jWn2GuyLJOMOS+YpYQ+
	 MPy7zjNBD95WSq6oJCMl9giItXojyMFui6Qo2/yPG2LV3ALv95pmIjnt6P+FhSbETn7ou
	 APg/4x7j55f6lcmDv7shKFyOf7l/7mFOR3k4EUkT0zUtBF+Kac03Ut1YYhtl7FaHbEr7h
	 U8JHQBqz3RL7fM5Knu/pnfadH0RgY6BQFGjCXqHJRUnE5SpEkUYdEGbm3RwJKiaPzOaMq
	 YNQX/5r9RT6hlQMbxHNsEJLqHdrom4YbWl3hMAlBQIxx6rTghUJYaaQb49DCV6I3rPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780424;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=h1q6px63hWFp2BtBbqQNwKX16JMwBQoQCIz9pZSqqKo=;
	b=ojeDa3YPhr6AjfcCrL6LBHPBn63d2vIDSmjhMASogE5SiakR/pgfm5tGH5+POUV5LXeK
	 pKJCeNBiqvG8PU/koCFCTBHJk4b4n26n/gJtklLs3kQkpL9hmHH57zQKgR4Kt+Ygul77t
	 YykqMaF4Rh0kAM0yiq+Wu8jQw2d9nFDuejEYj4ltu3uU6ehjDrpWWfk89BZf756duOywC
	 NO3Y8gqzsE+HMn8BAcE9cr/ePAEajYCf3AOWDegb/7mluWs2zQhydI5cbIEwrzibWuw+Z
	 sG/KSzv1qUjFhx842v1h3Ir2GLHmOj0DV4RPhyN3tbsHj+wJf/Lx4B18W49NUKHIvCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YG0tSt4W;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AvfMj2Xh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649CF606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:53:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 649CF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YG0tSt4W;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AvfMj2Xh
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApSfp1560820
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:53:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=h1q6px63hWFp2BtBbqQNwKX1
	6JMwBQoQCIz9pZSqqKo=; b=YG0tSt4Wnt3sw/KXZyt5Sv1Nf8Fxpqws+IcIJj6m
	4whyWDwZ3D3WM4KVOMjhVDSNvWduLKsCRuwypiMqsU45hQyvxtpVYWnPN/igNdxE
	JBAwYmNe9Diyn5oBipi52RloGJk6oUoCpgW47tuAhLWKXcQXTS0LNwNu7AlghWnj
	Uw9/ig0D62O7daP2xAr3Y5SqFZPlZTuUa3K6eAwCPmZUJpZLxdUrnFKT1uxULLz2
	3OlrzIXA+6EejWi81i9QLJjyYWWFQrr7kRE/4NSZsHOQXsFrzJCG53XHU0wIz7sj
	+dsopKMPaHFFtjt/IXoJOFP/t+7knJ0HY5lAXwsTso0oPA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55ttpm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:53:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f26dd2165so1923251085a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 03:53:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795780421; x=1796385221; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h1q6px63hWFp2BtBbqQNwKX16JMwBQoQCIz9pZSqqKo=;
        b=AvfMj2Xhk8NSjNIDMLE9qsgzHq9Tk4Jv9cjLxcT7SJQHQkRDtYRWCAtMgrTRyMdF/8
         aZ58IzYmz0FT9ONS5D3UBFNDleSSMR7YP/zQ6LqjYfLN50Q3h5jhSIj0TuWBahENkNvR
         OEGTbitcwcwsv3D5gCElBntVLGmYJO7E+CfWxgjE2eklicQzIZOsZJInXA2PFocbZxXo
         LODh6CazWpICrNHHgoOma68eyR/Ne3/5e3SXnQDEeELKAHJHrxqkkpbfyINHbEKmpr+P
         cERSAtlN2M/0s3fF4zr25AyeQwbVdwkhUY0GtsKaDdQ9z9MBK/6QO4bwuw37T1OI2GBk
         0RCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780421; x=1796385221;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h1q6px63hWFp2BtBbqQNwKX16JMwBQoQCIz9pZSqqKo=;
        b=T1RSk9LUvCmwj6rTbuO+MkPlCBabiz9HN/8saNkopB9GwhmUtN8/3uxUpYzPrUHXuI
         FV51tNVv10QzWBVXIbowNa5ipugtEuwwcWk6U1b327OmLohPoTn5zU77iTXlMztk66Do
         GcbxvQwJaSWMGamGUdoPeVJVSZqw5yKHeXO9GR6xU4VOHkcDDt8tcIAJ5PRcGOFGHik+
         hw/iOtoeJV2sCSeLvOWLps+684+peHKLD7FZZxy9h1pw5F3Zd3CSgTduRiFjrmokJlTo
         mfhtEsOkTpOQlUSdBLitg5IpQNDLqmokcQuVgG+Oil22oA7byTjxxn7EIaQveOF/jPOC
         blSA==
X-Gm-Message-State: APuU4Z9UjaJ2vhXxMboebLXjR0T3jsTGCFLKMMVeWKaqR+2LuW9Fs3wM
	HhwNC0BXj2fscm6YGU9OJ5cmOAj6hyGw8x3TNsTb2EegGqgSjyr6gWew725rurmj+6CVzex73Qa
	aJNWm1QjAdumQgKo8VkZZxZzNB7N4vYbPOx8DDrnBSqrL01t0SX1knxme/Uy5k4bPWHTg
X-Gm-Gg: AZFdTZdM/Kc9h0bdb65arhr66M4syzNkhJYcjHQJF+7/DhCf2YyPbTCQvjwnjTUleom
	kDwzWJdeIcgdKjTa0VD2SXmZWu1dqpn2qnrcpqyLGQZ6q/Oh/2xnSK+QrldphLIoC5SgcBjPaWa
	tjq+t00q4I80QqoFExeecVEgEpepyc8KWqi07gAEWKAdYjPu+CH6a/TTod750HzvHEQUOX1LC0v
	3g3ZXbG/tAY/n3KbXwFa+pRGG3q6RB/RxhUOtJBXOxHEoVtG34zJbKRiKyEIn7zFHhApx3QJa46
	+mKMk2NCK9sdw2M+H7LpDcYlDhHdkHR+HXeYZQYieazmHAUS44f0uWfL1BU7rihfHSENru7meYS
	VHgjTFVZ6IWy5ehCzyb8ZSSSxZvQ4ScWdUAfFSQfvdmGT2rq/Fos4BAksQq2o+SZSIwtbgGRhVC
	AdsGYbHKt6Dzb/xDVXaJSxLyesxeSRNxEXJqXXsN5DuOygaPbTw9b88lbp+fbfPg==
X-Received: by 2002:a05:620a:2b45:b0:949:a7d0:9fbd with SMTP id af79cd13be357-949ba9e2668mr4432219685a.41.1795780421538;
        Fri, 27 Nov 2026 03:53:41 -0800 (PST)
X-Received: by 2002:a05:620a:2b45:b0:949:a7d0:9fbd with SMTP id af79cd13be357-949ba9e2668mr4432214785a.41.1795780421031;
        Fri, 27 Nov 2026 03:53:41 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8055cf80sm64383021fa.36.2026.11.27.03.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:53:40 -0800 (PST)
Date: Fri, 27 Nov 2026 13:53:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jean-Francois Bobier <jean-francois.bobier@laposte.net>
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Saim Shujah <saimzst@gmail.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] drm/msm/dp: validate modes against the trained
 link, not the sink's claim
Message-ID: <bm5qadv5cuyfdeu3ggvwmme4q4rj5bsr6qur6zr66ciq2jv2fn@2vq6f57dyf2z>
References: <20261005131432.22840-4-jean-francois.bobier@laposte.net>
 <20261005155615.32923-1-jean-francois.bobier@laposte.net>
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
In-Reply-To: <20261005155615.32923-1-jean-francois.bobier@laposte.net>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NyBTYWx0ZWRfX8cr7io1l6htc
 7mzwNOQ0iBgovhV47uHfikS0NS5iaKkK3uy9eJRCmLzjgQUi6rtzTwDxSa4ctc+2joPGswK4bPU
 kUofdmaiZWYXYzGESGFmFzo6dD5bsQM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NyBTYWx0ZWRfX8wOnxj8wR8A3
 FJuvXFL+sfmt5A3HQAjX9dHIZA8IZ7v84jZvlCjRNojDDWU8W9GGNMd3AN6GVBKs98RCcRlozQ/
 seanz8aMasUKbzNjCjWsLm0sFHtdvBxbj1DFp+cJu0vcfPbA11iT7KvnhW8rrvJYFdcpICXlEBh
 sGXZcP89mCRQcVAuVi+7w3zMTOQ6nAOIY5SZE/YrLzg9JKjxvsniSEWYabAx4z8cJJqvVhzkiLh
 3kBNg9/T7TAKiKXsMImh1ytf9lHnH0VH1WMg5n67rA08wpeOdq1qn2MU2nLYmyBnCFivvCaWSWw
 2TOW5BZzhaSWeXpu+IoNBodzEACpc55+SSWBdMQoGiWbxQKtmAQvPiovPViA1QV3QDdGZPaqtLo
 UWNHZcehay/7qTyBKmPJQsRIfecDRRcG9WxbfWYBpufJVRz/VNkWV661NFm26bKtrBPJbYEuI4Z
 /1cQuCiTt4J2qyAXxNg==
X-Proofpoint-ORIG-GUID: 8RHMerlLqL-0dAHo0__HCWWv-ebPh7SO
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b096f46 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=AVbMHacnAAAA:8
 a=EUspDBNiAAAA:8 a=SNIH7UutgQ7Xh_Ke57cA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Z8w8RPyABVWp4NBWd0ke:22
X-Proofpoint-GUID: 8RHMerlLqL-0dAHo0__HCWWv-ebPh7SO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270047

On Mon, Oct 05, 2026 at 05:56:15PM +0200, Jean-Francois Bobier wrote:
> msm_dp_display_mode_valid() sizes every mode against
> panel->link_info, which is what the sink advertises in DPCD. That is not
> necessarily what the link carries. msm_dp_ctrl_on_link() walks the rate
> down HBR3 -> HBR2 -> HBR -> RBR and then reduces the lane count until
> training succeeds, so a cable with two unusable lanes trains at half the
> bandwidth the sink claims.
> 
> The validator does not know that, so it keeps advertising modes sized for
> the sink's maximum. Userspace picks one, training "succeeds" at the
> reduced parameters, the mode does not fit in them, and the sink shows a
> black screen -- with nothing in the log to explain it, because from the
> driver's point of view everything worked.
> 
> Observed on an sm8250 phone with a 4K monitor whose cable only carries
> two lanes: the connector offers 3840x2160, the link trains at 2 lanes
> HBR2 (8.6 Gbps after 8b/10b against the 12.5 Gbps the mode needs at 24
> bpp, more at 30), and the screen stays black until the user picks
> 2560x1440 by hand.
> 
> link->link_params holds the trained values, but is only meaningful for
> the sink that produced them. msm_dp_hpd_unplug_handle() now clears it on
> disconnect, and msm_dp_ctrl_on_link() resets it to the new sink's own
> maximum before training, so taking the lower of link_params and
> link_info is accurate once a sink has been trained and a safe no-op
> before that -- never the previous sink's leftover values.
> 
> This does not by itself make userspace re-probe after a fallback -- that
> needs the link-status property, which cannot be set from
> msm_dp_bridge_atomic_enable() because the modeset locks are held, and is
> the deferred work the existing TODO there refers to. What it does ensure
> is that any probe after a fallback offers only modes the link can
> actually drive.
> 
> Also log the rejection at debug level; a mode silently disappearing from
> the list is otherwise hard to account for.
> 
> Signed-off-by: Jean-Francois Bobier <jean-francois.bobier@laposte.net>
> ---
> Changes in v2:
> - Clear link_params on disconnect in msm_dp_hpd_unplug_handle(), and
>   updated the comment in mode_valid() to say so. v1 reset link_params to
>   the sink's maximum at the start of training, but never on disconnect,
>   so mode_valid() for a freshly plugged sink -- which runs during EDID
>   read, before that sink's own link has ever been trained -- could size
>   its modes against whatever the *previous* sink's link had trained
>   down to. The num_lanes/rate == 0 guard already in v1's mode_valid()
>   now does what it was presumably meant to do from the start: treat
>   "not yet trained for this sink" as "don't restrict," rather than
>   "not yet trained since driver load."
> - Caught by this list's automated review on v1, not by hand -- credit
>   where it's due.
> 
>  drivers/gpu/drm/msm/dp/dp_display.c | 53 +++++++++++++++++++++++++++--
>  1 file changed, 51 insertions(+), 2 deletions(-)
> 

Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support"
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

)

-- 
With best wishes
Dmitry
