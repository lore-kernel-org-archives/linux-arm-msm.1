Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780471;
	b=wYUf90pVdecb22Ywcs8rIQF3S7Ntk4EcgCNUaoeSPR9L+rA3FmwbNg+fQ7qFs/WtDKQz
	 nykd4wiG4YVrDkQ+h7+KTeZTudFb0W6WQjZtsacqRnxxfIyNPinOk+6+m7soFL3XhoJkM
	 1cv9aTXPf8ZMoAn1mBBz5UZ02O7lSPnQQFmMCKtsLQr60kpkeF3eLyoUbmwHPdXv5pW6Z
	 2C4HWoEgr1nnOIVHz1fo1039L0UQI/Al30JH7tupn3AVpUj8tohttdU/cADtfCQOcWhEW
	 uyIWclEUMWR6yINQ9wMuqcd3qd9hBNIlSQ7bo62IwHrWOLS/K/K4aZTIHL12k4BetFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780471;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jOb3V4s7GJf/HR8izcqd+kAEDQnH+4Otpm3L4J95xHI=;
	b=SKN6F9YfthROuePh9IomLKF+F7bPK+ew1cEfbs9ylxk+xLKdMEpy2/KlCP182xiQ5vIU
	 i51c3HNNgzWfL40RF/rZRPPmBo+sqSGyMheP3lWHq80nfvbUbRIwVGLmeg55x1SG18eKt
	 VB0hEhnJLcB04WJfcb7dzev2d0F/J0qHudiLUlkkeglRAPFJmffiWZk+2F8qfuyJvaLpx
	 e5t8YrvDXoegd2ZOtZmAlEFZlIx/oNBTtekbJjdgU0YPqufHXn3LPPOQAq3OU3c56FmoA
	 f/GUNEvNNw17bXtP9ttUZOw2+MQaO+vp+hGftKDUGAWfRztkl4UUdc96Yc2DX7N/SXg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dJK3jnfQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jO+mv+nP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5D4606A31F
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:54:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C5D4606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dJK3jnfQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jO+mv+nP
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApYoZ2058098
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:54:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jOb3V4s7GJf/HR8izcqd+kAE
	DQnH+4Otpm3L4J95xHI=; b=dJK3jnfQaGWKJX8QOPDGefiFFSusT1SYTSKJ5OHW
	OYl3DCnYWNVhy9EOmXFJLCdv8T7a8IRMFUhMrYcX9RyjRY39MXbLFVTh3ieeQ1oF
	+LVDE6a3hj5nTBJi7pBnHssZzHheidImR6x+xvZjtV8yJAU9J1chRZ9arDxcC7IW
	rTDhr/98OYT5PmnqYMOaKUSb6JcmJb7ouXYqMhm7E84Br6K0FWvBzrNNArcynm7h
	MPfDtNomKvDmu6I7h+UCxmaiOVrd7Bhizlsi2JTsW3zXB8ng0q/8hhltQ8wF72Dy
	Vtv9G8Mm/LYysGMnpe/gOTx5LkpvBbKlcJYWbzaDNPPuWw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gasa7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:54:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93909014c85so1453378085a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 03:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795780470; x=1796385270; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jOb3V4s7GJf/HR8izcqd+kAEDQnH+4Otpm3L4J95xHI=;
        b=jO+mv+nPvuJHOZNm693KHmUZ8WjKbPzlu9ttDnGmWlfmuuweIHK0m8J8GxMK7ZtvN6
         cLOPuF+RTY6B0SydqPedUWfeXBvBGAb0BT4TCUNknTu7ZmlwJ27vvVLkZMLabFsBw41K
         271B1g4YdZRED9lyOHBp0RMw70MK5kIflDrVNFUYon6grAQnNwTvMeoz4tPWDtAZSZA4
         ByxkIDvBtg86MMj2BredGkjYFY+LLj88ixlNSclV/AsT1BuCNv2bzsoEghYlSvUPwM5U
         DE2cC8J62iflivcRET1PfOl6CfUw/+ag9xWhGdO5R1NF8t+2sZicz714j30rJzg1Dh4x
         /a8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780470; x=1796385270;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jOb3V4s7GJf/HR8izcqd+kAEDQnH+4Otpm3L4J95xHI=;
        b=wkyvhJi+Ig4M9qikxDIGjxEN3t1gmwB1dlPHG+eO2VnxjwuTnZkShkpIYa9wpvnLOV
         LcfWxBDm98fSkXcBjXERO19BZMAgGCT1r4XrEHVN8wW9neBF4TS/IAFps7zjqh52K71T
         kJuGrI6ut6iYUPmJStWxsbWHkaa5PH/7iCdXhfdQL6aID9NeGWWbZ82jWkVLXlgSnp57
         SnvGwBx1ehrf0bKjvHkkHGcX8VtYKx7Rbb11/1wQ9DpkKqs9xECmLJKzgXrsxAhBQWCN
         Rbtb/Mw41dakOeskNqQLV5VqUIrxeCYeMiQYACGNkE+awQHL0an6HEdeZgaOgalBrAL/
         hdiA==
X-Gm-Message-State: APuU4Z8ONhbsBQ6unVhLwNLJhXqU6Q1pmtI8PKfVeLhldIK3v5w17eQd
	tzs49dMWDUNtiOSQfzA7MfN49dTq3uGSx4B3001ZbJzLJbrN0K0oWvyFbQkOeEeqms2yrA2UbOq
	CjMZYg29Gz6Ceom9adXX3S1xTn/dQoP6MYMal2uPL8rvBr3txpMdqgdEK4u1333kdxTrl
X-Gm-Gg: AZFdTZcvkFbsoV+WDjKVHOQwJmY6C7OKxeJSac8SE5cl4pIFf1GZ4Zsz4YhjQaaUcg9
	efjDCCjazAwgdXrJXS2guVKnJS3WwS0s9Sv6WlEngSVzd/TeBUICkMfeDlCppLsfciMaZqy0MsW
	9B6IZCH0gOPVnoOazF8MT9ydL7WEmATig4dMZ1ily951yrmQkqE8gYCs+X1mF5V09irLWo/I1rK
	XOYBXAhd0DoW7DOsJoAwxvNYvAThy60JpJdLOntWvI20onCpDmaL2yN0OW7qGq2KQ0q+7bqYQNN
	AgXxNl01d6OkzQog/B6Udl7tOF6lUqEwxoQGQ9Ot3A5/D5/F7kmDJ5EQbOx1FiFdo8vFoP5k+zr
	23rB0zbmh3rO58SM8s5QroDa3xrYO8wIKTva75YZGu3IPLgn5+nZBfjsZgTEppCzrGrd4EcO/L2
	pNUGUKBAlu+PP78q/AHc/sQYkU6SWYPP7T6gFahj/ButCeI1/jjlACykHj6hIRwQ==
X-Received: by 2002:a05:620a:8001:b0:93f:2aa8:c555 with SMTP id af79cd13be357-949ba9fdb81mr3886112985a.57.1795780469720;
        Fri, 27 Nov 2026 03:54:29 -0800 (PST)
X-Received: by 2002:a05:620a:8001:b0:93f:2aa8:c555 with SMTP id af79cd13be357-949ba9fdb81mr3886107385a.57.1795780469175;
        Fri, 27 Nov 2026 03:54:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bcff8ba4sm6010373e87.15.2026.11.27.03.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:54:27 -0800 (PST)
Date: Fri, 27 Nov 2026 13:54:24 +0200
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
Subject: Re: [PATCH 2/3] drm/msm/dp: don't log an expected link-training
 fallback as errors
Message-ID: <5pav6gzpp73wqwyewygyko3aj4lhy7jzcwzwfb7ro267xjmzib@drwkmrcselc2>
References: <20261005131432.22840-1-jean-francois.bobier@laposte.net>
 <20261005131432.22840-3-jean-francois.bobier@laposte.net>
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
In-Reply-To: <20261005131432.22840-3-jean-francois.bobier@laposte.net>
X-Proofpoint-ORIG-GUID: OjGQ8GyP_6tBJJVYvieDwRw9K-UnTIcX
X-Proofpoint-GUID: OjGQ8GyP_6tBJJVYvieDwRw9K-UnTIcX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NyBTYWx0ZWRfX11+bNmI21/yJ
 5s/O6bVaAqnIPTSxBOflFZnF8IiO/rYVZ3ZIvyylU83Nhs79Mze3Tg+qNca00PmJSlaD2uQnz15
 mO5A7nb1xzxYqKNPfwiSJUhrS9u+ijDvlCj5iXBWvJ4eLvHhm9eguhq/UQrEWPspZ/uKDf/0sJP
 7EGSBorfWFCN/bqpew20tlA0jsdu+FAlVbScbqPgDE0ByXDmFE6mcGScNWORUP9hLzniiDGKtiV
 Y77xTMovvOZG/LdKOGGgBTu+Kzo3rUvlTvaL41jsAQoJXcbMTSgl12CU6uUT1En6Semc7sX3Eyh
 UBv9J48gh7pPmEtlsFDwPrzXhRKDpkNOJDtQkMLg5LuSsNn5Cc3E9Z0flgXW8wJMzL02wm3mH/j
 LO9Ulj/hOcoyit8IQJcLNAUgn8H/p3EFBD+q7GUMcyR6zQb44XsDwadB0Z+ypenakiX4hCmB6Js
 JVmPER5E3HrP3j3v0xQ==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b096f76 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=AVbMHacnAAAA:8
 a=EUspDBNiAAAA:8 a=-PfVqtTFaXArj6z4HRoA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Z8w8RPyABVWp4NBWd0ke:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NyBTYWx0ZWRfXzntMQ0SugVpg
 86qSely4oSjVLbUh08ulZZMQHOMQbRrIEBwjN0i46d+m/CXkEyY4WqXtfwOJ2uKsRFwG0TR6UA9
 PSBEGZdux5ydDoVc8BsvqjowKiF+Dnc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270047

On Mon, Oct 05, 2026 at 03:14:31PM +0200, Jean-Francois Bobier wrote:
> msm_dp_ctrl_on_link() implements DP link fallback: it retries
> msm_dp_ctrl_setup_main_link() up to five times, stepping the link rate
> down HBR3 -> HBR2 -> HBR -> RBR and then reducing the lane count, and
> breaks as soon as training succeeds. Every step of that search is
> therefore expected to fail before the one that works.
> 
> Each failed attempt currently logs at error level, from four places:
> 
>   max v_level reached
>   link training #1 on phy %d failed. ret=%d
>   link training #2 on phy %d failed. ret=%d
>   link training on sink failed. ret=%d
> 
> A monitor that settles on two lanes after three attempts prints nine
> error lines on a completely successful attach -- which is how a cable
> that merely has two bad lanes looks identical in the log to a sink that
> never trains at all.
> 
> Nothing is lost by demoting them. When the retry loop really does
> exhaust itself, msm_dp_ctrl_on_link() returns the error and
> msm_dp_display_process_hpd_high() already reports it once, at error
> level, as "Failed link training (rc=%d)" -- which is the correct place,
> because it is the only one that knows the search is over.
> 
> Demote the per-attempt messages to drm_dbg_dp() so they remain available
> with drm.debug, and keep the final verdict where it is.
> 
> Also demote the unsolicited AUX interrupt message. msm_dp_aux_isr()
> returns IRQ_NONE when no AUX transaction is outstanding, which is the
> whole of the correct response for an interrupt that is not ours -- the
> AUX block shares its interrupt and sinks raise AUX status asynchronously
> around hotplug, so this fires twice on a normal DisplayPort attach.
> 
> Signed-off-by: Jean-Francois Bobier <jean-francois.bobier@laposte.net>
> ---
>  drivers/gpu/drm/msm/dp/dp_aux.c  |  9 ++++++++-
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 15 ++++++++++-----
>  2 files changed, 18 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
