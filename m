Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794417376;
	b=j22DzT0C10Axk8ECebQn2zXj9TqIpqUnb6BFsjWe9GllJ9KFrmeLAcgjHPPsW+KbflzB
	 B2MwmeMACoWg8HIOyowj2SlcEYyDvZNur7Doe0vgMwWMQH2K6w7eM4L0uO4CngJi5Lxzc
	 U0Iym5JtEBlTNiwplj7zUk2PxebQiI6Og7pwgLCVH0b3Z3fKvPzF7hh1JsPyJ706kEwOm
	 gK4rt9x4Xxig3VtrAm7eLEwuABYecDlZOjv7wsX1vMz9Wvc7KO6pDzqBkt0QBWOOPch79
	 5/RKm+2AbbWqnjRXD1jCv1nSEYZMjNlUuanQfcudn5oLdSedFgT6ONYhdG3fJ9hNvkw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794417376;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Th56ue+92RWSYswc5X7s/HSv9lUd6z9Xku8GEtzh0/E=;
	b=OzTmSDBpKZI99rVaKG7AR8aOEVEIfTHQtRhRLF6xNrz8TCkdGNgpMVoy4a0jwoCBlhLD
	 iWcCQ97sNJ+8vOj+4DE1+8NSpxOra9nr7y9iF4D0cWSTDhxH05TgJeZ7/F3XyKmNoIFDc
	 W7hxahB+5zEekc2BCgKwvyvR74WFAp99PHuhPvFDkj3LelsqSCOBu80g6AvaV91WlCvoe
	 2g0tzbU0/C+u9/udIp3+ndEBm/lO9QtJYffjqb5LWi7fMOtieiRQMCyR4qFbzV5i8cr4L
	 oIxdAUOYZ2GgHMr0AZQ/jDFXkOzXsRqSnpy2a2qszRvMoM2VDSmWI3kJDxDF5hM6MlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hy6MTmRb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PX3nzkC8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681FC606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 681FC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Hy6MTmRb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PX3nzkC8
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF0I4L2651078
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:16:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Th56ue+92RWSYswc5X7s/HSv
	9lUd6z9Xku8GEtzh0/E=; b=Hy6MTmRbd8McWpfq/m56Uk8aIITPw4xR9+PTzOzo
	RQZDAT7vBRTF3ZIO87q7lj8P486dcCfMhPiSGO4ClB2JCxoBsVqLgIIX/8kt6OGd
	i54YuCzNcqKFiKNiKdTWpx7i7yWhTPjUvC+2kci/5/K/FXiBxrg+mHMuanHnvmVQ
	iOiX6D4W9fMXZy8h+v4BeS/Barz2fn9hK/3C8/xQ3c2F/1j3UvHeV6IzyRyUcC6z
	fWuufxZRR8P9on/Bh25Tn8miq+dG94/JkCW9FjXbzDvzPDTvBx2JxX7vXwrHBmA1
	2TtSOfVvB4WJgGBLskqnUROmv5IKlPQEtSWjlmMkNne+jQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnmbv0b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 17:16:15 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5eabb3a1bd8so3199336e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 09:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794417374; x=1795022174; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Th56ue+92RWSYswc5X7s/HSv9lUd6z9Xku8GEtzh0/E=;
        b=PX3nzkC806pZ7ijdmt0vhRiVXaZGyXbqu3gjmnsk+FommVT8DoTqQ2tlK6gm4StvoR
         J+BOpmXyJPCAOEQi+htnvcm5Lni/1VWMUVmUk4EFRCqLM5EJtNM+VjdPbREyuq2yuf5c
         VV5HSv9uvXsQC/WzrhSGNYTmUl9pgpOU7Zgq/Gdi0BzJLmmWivzSa7siWPXcx5aiTa1h
         BK6WJiIvIZpuT4EuQTeXZe1sSUkX4FC6Ru8qvHZMuM7oReXHKA8hFFcMIRalskU7PWaG
         ffMdsxr2wL5TyftgEpDyxWjJjWiSUtn+Y872uZhK8rS5kPBjcI6h3S0QfUyGBricBF5Z
         RhrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794417374; x=1795022174;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Th56ue+92RWSYswc5X7s/HSv9lUd6z9Xku8GEtzh0/E=;
        b=RNRLXAjgQHTI1OGUbWu5mIrrjOT5Xs8tCdlkcEE1Puph0C7/uow1tm+Cbqs/8hmROT
         jm7/GQp3iJ6PwvGM95xbD8Mt2gD79XE8H9oEzHSQEcSKUmrABFvquyRpxI31EymlGIhJ
         OGpV+ePiYuBMhMcglhhz0pjFxswkDhaFvVDW4yu6C74IoTROU5HcZPRDyA50Mc2LnyUe
         Vo3v8kJl7zOnkOU4KoKMO0FeQm1HMdvJbwry6hj+TW6ZO1NqtS5n1MBqlqLpBBxfSfL0
         veelEiNef9fbxHYws/dUG/NzW4Ex5TqIeHrqdYbcdwDKY6487gbchtq9lDkf3yDXBNTK
         Ej6g==
X-Forwarded-Encrypted: i=1; AL+hErHH/K6ZVR6IoPnMna0ff2uFXcQmQJXOG5KulrP291+wcq+sSRUpNzGzYiTKtfJREV28S3MzRFI8sBLY7CtF@vger.kernel.org
X-Gm-Message-State: APuU4Z8wveaLFLQvvh0JlITHbtUOO0u6HVvRNxGsr7Ua1tghMZcPlxAV
	bKXfMw/UzrykoiCEh2QMErj94dDxPokG/KOBbBLZI3nBd6Xk13VBIhYfMXyNYtC4AEXcoDvlbZN
	eu0puiqixMnlXOylo6Rt95BWW8MiJEb59gcd49eAiT9lmAz2Wd0kal04PKCVTZIfWw8wo
X-Gm-Gg: AYBFou1oD+EEc/iEKXcRSR600c4cPGWkOz8Fg75rcYMy/ttSvl4tuHjdvF41Tmth7e8
	eJRbhhUt26cw2Sl+0VjBPqTsOYcRcL6TA7WoOXDjaBdCj8At8KQGL1sHFcy325XjfXnOSpsj6qs
	bhW6r1FUd+bQS73axv6uE4IMzpGTnxtj6Yrh5kd6wamJxkNiCbbxRB1+zKbvB34+KNDSas0QqJt
	letH4FnLH1a6tRrbzk5x1tq0a+Xqm41n35YZKlfVhZsM1ASAvA5ZKQ6SMOEXGEtG7pmeec34tib
	jn3DKINahg/ZNTpiwHhs1DGzIG/b7tAkz0P5yGTJ6wnkAVHN5bWjS5fcNUQVMQ6MjIAAlyIZQ7H
	DJSnm2K3Rn9Yt/MHZZyOrxIlU1dmnKTCpFuol0LcEBdgTRR31phJlhpcLK8I37KjiZVvww8aLJm
	h8Q5Mr2VXnA+Haz25D8ojNMQP6xaPMj46iYuIbSI/KIu35UHh0Ie8m/VJPvWlchQ==
X-Received: by 2002:a05:6122:3287:b0:5ea:9a2c:27a8 with SMTP id 71dfb90a1353d-5ee1c43413fmr1408295e0c.14.1794417374527;
        Wed, 11 Nov 2026 09:16:14 -0800 (PST)
X-Received: by 2002:a05:6122:3287:b0:5ea:9a2c:27a8 with SMTP id 71dfb90a1353d-5ee1c43413fmr1408223e0c.14.1794417374012;
        Wed, 11 Nov 2026 09:16:14 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157ba56d5sm1031489e87.23.2026.11.11.09.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:16:12 -0800 (PST)
Date: Wed, 11 Nov 2026 19:16:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Joonhoe Kim <26rote@gmail.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, yongxing.mou@oss.qualcomm.com,
        val@packett.cool, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/msm/dp: hold one runtime PM reference per plugged
 state
Message-ID: <oidwbklgq7mqjyvd5n3irj7uxarxhke4fdpmipp3kwx7uqo5qa@7t4pal4q7wki>
References: <20261024051952.2006-1-26rote@gmail.com>
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
In-Reply-To: <20261024051952.2006-1-26rote@gmail.com>
X-Proofpoint-ORIG-GUID: Y1KBUUYdiafVzcSV4RC3HKDYrdhBTB0G
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2OCBTYWx0ZWRfX86Q6uqMMv5PH
 iAovfadxLbLY1rVtdMqvIKfLNM6OJjpIr10q+5NVDGFyKexuy9hads38edKwhVN2wnD8KYUFpeN
 rI8tv7u5hgDT3VTr+K6dHrfi8O8fWbw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2OCBTYWx0ZWRfX4hQZv6TIDXiz
 0Pc8UG9OB3axRLXTpPIsEhgQ2o04S5cfz05ncFYzMV/JTx0zyddEmCHbMjTLAu074WcTTYHLQbN
 OC1GSStD5G0sjVnpFHlv4UpzwGvzQHokNVv81UbsxU3rkNINFEZGqyzjES5yDVrYtkuv9TpH+y1
 EX6sAcR5M5wi4CG/+i3fghF8jjuad+y0iWe5/7FPQeYTJaU4T0Dwcu+pGZGfQK/FqJwx5ujsUV2
 LqXEi2HBceS5ifbggpyAV2QTnQ9xgiUo8oTe0BzuNJxyymE5HfJE58+zj/z9PTPXTeiWcJrtsuB
 kMpoQHLBE26IDQF0GM1LTEiF8A8NM/ikCSQUVC4EkMUywh8AHJaygkU3Qgp0V9/CJ5amQRxzdEB
 MLOxJ5DKWsZN3yG4Bj2gt66v0FyCYFjpCKsaMsQEtZymsZvvCJ6fwX7o37fVJHHyElBztj5hSE4
 V4/+T6GrMt8bMQ0ichA==
X-Proofpoint-GUID: Y1KBUUYdiafVzcSV4RC3HKDYrdhBTB0G
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af4a2df cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=2vbH5c1cT-B6TzbzCmYA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110068

On Sat, Oct 24, 2026 at 02:19:52PM +0900, Joonhoe Kim wrote:
> msm_dp_bridge_detect() takes a runtime PM reference and keeps it when
> it leaves the sink plugged, so that the plugged state keeps the
> controller on. If the sink was plugged already, the plugged state holds
> a reference, and the new one is leaked. If the sink was plugged and
> detect() finds it gone, it drops only its own reference and clears the
> plugged state, so the unplug handler skips the put and the plugged
> state's reference is leaked as well.
> 
> detect() runs on every probe of the connector. When HPD comes from a
> later bridge, such as a USB-C connector, nothing else keeps the
> controller on, and the leaked references keep it and the MDSS core GDSC
> powered after the display is unplugged.
> 
> Hold the function's own reference for the duration of the call, take
> the plugged state's reference when detect() sets the plugged state and
> drop it when detect() clears it.
> 
> Fixes: 3ea2d1c3d154 ("drm/msm/dp: turn link_ready into plugged")
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>
> ---
> Depends on patch 6/9 of the IRQ_HPD series v8 [1], which stops the
> plug handler from taking extra references; only detect() is left here.
> Dmitry, feel free to fold this into that series if you prefer.
> 
> Tested on v7.3 with 6/9 of [1] and this patch on a Lenovo Y700 Gen 5
> (TB323FU) with a USB-C display: booting with the display connected,
> plug, unplug, quick replug and s2idle. The controller suspends after
> unplug.
> 
> Changes in v3:
> - Rebase on [1] and drop the plug handler part
> - Hold detect()'s own reference with PM_RUNTIME_ACQUIRE_IF_ENABLED()
>   and take or drop the plugged state's reference only when detect()
>   changes the plugged state [Val]
> - detect() now drops its last reference with pm_runtime_put() instead
>   of pm_runtime_put_sync()
> - Link to v2: https://lore.kernel.org/all/20261007155848.106-1-26rote@gmail.com/
> 
> [1] https://lore.kernel.org/all/20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com/
> 
>  drivers/gpu/drm/msm/dp/dp_display.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
