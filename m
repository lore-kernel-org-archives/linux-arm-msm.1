Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415775;
	b=VGO7b7an1HZV80geHKiP843nI6hyWGu7BTuqs9sDxYnaSgx+xe0iFBw/8vEjumNCpzVR
	 cPg4td9dMG29LDyDS7+d2SwvE1QmfHgjfbZWOVA+DEGMrqinFpoL7mnCnvKF2iclLXCXD
	 3a5A/AHa8a6DDTnNurjDyxpq+ZrSUnGhfmipAczeLh3nUAqXm5loWhPf+KDS9qNFiHb54
	 0P8MvEB7XulnQMlRhh/FtBxdTD1qw3Xz20EAYMguannX/gziICIunBCPiCb7Tzd2lQqXF
	 614TUHdhrskVE+V7iuGqY50cM9AOfFX75N+/yB37AMimMN5AffvRKMXRxRWxj5QIsjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415775;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PWoksvMhgq8Q/i4IjWr81D379zG5XlS6MeHSuWn+LKc=;
	b=bOWCUw0oDExLi8uBgt/qmtv5NiI92c64J+9iAXxCx3jDYf6zsrK1IsEyB/Skc+vqBDao
	 4NWzmXBth/iSEhR7J5r8vC4G2r8mogINtQCwajokb/gHxXg6VH9zM1UQ778vIrxIvOjt5
	 qcX8GXXDPoTruJK7CR6rRw2zZ7Bbb/9fYivJMiXY3SoHCjXo5+7G5Lv/tLo3GQu36PQ3a
	 V5tCm7ztRupDTp7WdZMDlqNBdF9GRirdKa7PPTAQnXzP82BWJnzASDvkL0/VFwhh83Fkt
	 OkymXbbUu8lWytJSKE/DCtyvkYH4qc3Bifu2i4pl38scyyB4vNllC86p1LYk33EJv+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GdP9hRrD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jwPDlX25;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56202606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 16:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56202606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GdP9hRrD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jwPDlX25
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF1Aol2115856
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 16:49:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PWoksvMhgq8Q/i4IjWr81D37
	9zG5XlS6MeHSuWn+LKc=; b=GdP9hRrDhJwlt6pncn4yrH4QKsDam2bDCxdssInM
	dDYn6PIXVSZb2oZ6Ac39K/7CddAfDqk3qO04WLaL3f91HNoHCHKqL7UI1cNizWVl
	rSz3dPCQGRmIt/PlvtpiZ+yQj8VirA5dPtN5Cff3roh8aHkdlri/S7ySOtCqBcIP
	t6Dys2b2kdGEmxx7VtjaxUFsu423unNPtkpKs0dALtOUoJ2zKuTsfnB7WaIH7Vqu
	xNIuy8iYUJZgPSQOKgytYwfmo5LVWetPBdlv0c1ajhLRGuPBCGHfSTX1ogQDrNlV
	Z+mzEdHFNOSSZD2PkKNW/TsdFWtKeVGZP9eAu6gUrNYrHg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawk4a3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 16:49:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-946038e22f5so799528785a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 08:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794415774; x=1795020574; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PWoksvMhgq8Q/i4IjWr81D379zG5XlS6MeHSuWn+LKc=;
        b=jwPDlX253kbmXBTRlwiqCMKF3u5uYMEB6wOKTC+1vWNZv0BbVpseUeFPqiH+/FomNa
         t7xB5/ohdJ2S8fBnv3vYfW0nGZZJZB6QP7D6VkIOT+f77krSkbol8W0So8vKgCQFy1ZC
         glkAOV1gRghlmwzRyrvn7Tb0Q3vA8/0b7TiqHbFBpJpICVBaqRqq+Z1SEokCKAQ/vFvf
         hms2qYymRu7L22qLrGD8c+yzjOmGfB/3Vp7IMBeKtRdsskBPiH4dzjJL/QMcTHdbkXqu
         PWoXxXGBRr+ETWUrYpm/3u7el/NYUIhnyo1AJlADNGN9kwR2RBiPI9/TXCk/+K/tiJPo
         oZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415774; x=1795020574;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PWoksvMhgq8Q/i4IjWr81D379zG5XlS6MeHSuWn+LKc=;
        b=KxHazGQvA1nbFCmI+O6AUfribVIjwVBJnpelKGd/OVdHu1AIdqAmFfaZVkFOv/uRAL
         NLQ9da2+uzxSE+bl9EyvFKxd+Z4iFMJKMeWRmGao58J730/0szH6CSitSRAUk6ufmcjr
         UHRwWRCK5Dn1CN9lytI6WKxBeeBB0HpYyoW+uEVNhDbMoqZbSoeVKHsBqYB696Mssn4B
         HXU79kl6MJ6GRYMSaqXMP6GpNJcbDLcDoe5sXgZ54++UaG+oySz9OVdB/BQ5nqj932kA
         g9B8JHnon3EihlljQXfkySbaJJXBK8U34V7OX3HxnLKNF8wy+mIYp9SGpMwZMPjIEQZB
         Wx5Q==
X-Forwarded-Encrypted: i=1; AL+hErHpl/8d2RLWce57EINQf0WeDVNsNAY9VXwKW00o5pcK12pKvjhOf6eORDTdKxZ2FjeinkTwTXJbeo5VoK+E@vger.kernel.org
X-Gm-Message-State: APuU4Z+UbJzFMsF66TxskQwOOTnN77ksUslBHGTpu5QrU8TX6Qk8OJxj
	bKD6LLGCxGI3TpAMOTaPLFKQ9opfYwpy61zuIszdUAPYhiyjGFh5FNTt00+iQNQ0dLZrjMJ8ka4
	U37vnS9bWgEKlRaSzKYI6QiZ/sElsq1jxg7dqgqoOMtmEpnCLf86Z36S73MHR/7Htl6lt
X-Gm-Gg: AYBFou3h7hNhtSsziiZv61csGsILFnxB0qvU7Wt/sKLIblcxobmCKeoYTc8PtH+Jf1E
	V65SJnXLFhD0SjJBEuBBg7Bd8VIXqAhkrm6jz5uGkWQ8nbsuuBqmD4wSK29PiU/D3HKEtlsCQd6
	aODLtEwtnvt1kELT3E7WuKfSagKEJNjG7JrsnV9AHA/L3Hm27MZ1lPCf0yuLXJ7ljBRihWbq11I
	rUNDZ3PQw3H9uE+W5doS14J12kTl3n0KKrG7i962DxGScNVX9dR0DQLC+fIt/5674J/EXCVM8Xz
	H99xoA+0QF/b/aTP1kBbPtkJyR8MVxNaVrx/8ivNS1rH7nnTlXTE97UgvUUB3ErTUWmKZ4OHhgs
	1DnCOU/ey4QeVSHKJik+jvEp6EcxxSAJPJcD2g2bdXKyRdwpI+Se+lYr4Z5RfoCH8eciup+bE6o
	ynxOuqex56f7F/ydEVyTiwhbmqkvnotVGI3BPnJBVZaKdgeglRZ2KGqva6RQVQUw==
X-Received: by 2002:a05:620a:4409:b0:93f:3391:d5a1 with SMTP id af79cd13be357-947b00cbd05mr507383485a.75.1794415773606;
        Wed, 11 Nov 2026 08:49:33 -0800 (PST)
X-Received: by 2002:a05:620a:4409:b0:93f:3391:d5a1 with SMTP id af79cd13be357-947b00cbd05mr507377285a.75.1794415773092;
        Wed, 11 Nov 2026 08:49:33 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157baf5aasm1038678e87.48.2026.11.11.08.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:49:30 -0800 (PST)
Date: Wed, 11 Nov 2026 18:49:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Arpit Saini <arpit.saini@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        mahadevan.p@oss.qualcomm.com, rajeevny@qti.qualcomm.com
Subject: Re: [PATCH] drm/msm/dsi: fix AHB clock staying enabled across suspend
Message-ID: <kncxteaifi4atoodx2wqkbxkwwaw2wttmxtxeh5plbl77idwva@fbknoze4ywbd>
References: <20261006-dsi-ahb-clk-suspend-fix-v1-1-67da848e1b0a@oss.qualcomm.com>
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
In-Reply-To: <20261006-dsi-ahb-clk-suspend-fix-v1-1-67da848e1b0a@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2NiBTYWx0ZWRfX5SM42AjJMv1H
 rkL61ZUPZzGLE72lgGtJfosw2X6WE6NuWNWbmY/gFMrZn/HaTcrOts4M97BF9HXDN2qfLc8O43T
 +ZV4oNSN3rJJ/seTA2T0iyTJOKO/pKE=
X-Proofpoint-ORIG-GUID: 1a3VgyOBWWEooRC8_Iz5ywYw8pjZofT3
X-Proofpoint-GUID: 1a3VgyOBWWEooRC8_Iz5ywYw8pjZofT3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2NiBTYWx0ZWRfX1lTttkBKAaCn
 P/t5EMwawC2ZhQ06t4kLep4xgz/IwBJS/Y7wECQU4OE5fQtz4E4PUY+cRaaEa0IoQgXe8sPkiqX
 zl8X2STQ1WTHt0vMOahLGiZPhWgIdCHhzGgFIo3pTR+kK+mjy22qWBNfg/4DWkFT6EY3AxhhGoq
 BPn8hG+ClCN+2c6dfrlFBLUrjrYAtUDbmg7+oj6LgYcWWbOjk8DA3Ip0j4zUDKqp+TnoYhaheyU
 hnEkgLeLDK8lUD5tV5Dsf/D/GQKVzYna0e3X55slPlWfBDTGobEHq/ZJP0TOM1FGI6lX1A9VKGI
 x4kvAsOxZjKeyM8szTuxwMrRTh/SbLZVGcaB0wyAALwvJN94qZ6BYKtOuRVEzqSBJj/s9ADSVgo
 gxukQVR+L8yKYXwZkoUpZCl4GhjttRDY0u+m1xKACNk0h9ri5SpPeVRkPdfYMA1Elo6zg3p1Kzx
 l5fHjy0nPWzoOfvt4Cg==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af49c9e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=nLvmRgGJZeXqCf0b28oA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110066

On Tue, Oct 06, 2026 at 06:43:53PM +0530, Arpit Saini wrote:
> pm_clk_suspend()/resume() only call clk_disable()/clk_enable() for the
> AHB ("iface") clock, never clk_unprepare(), so prepare_count never
> reaches 0. The clock (and its source) stays reported as enabled
> through s2idle suspend even though the display stack is fully
> suspended:
> 
>   disp_cc_mdss_ahb_clk [19200000] ->
>     disp_cc_mdss_ahb_clk_src [19200000] ->
>     bi_tcxo [19200000] -> xo-board [76800000]
>   disp_cc_mdss_ahb_clk_src [19200000] ->
>     bi_tcxo [19200000] -> xo-board [76800000]
> 
> Calling clk_prepare_enable()/clk_disable_unprepare() directly from the
> PHY's runtime_suspend/runtime_resume is not safe either, since it can
> deadlock against the PHY's own PLL clocks taking the global CCF
> prepare_lock during clk_prepare()/clk_unprepare().
> 
> Fix this by moving clk_prepare()/clk_unprepare() out of the runtime PM
> path. clk_enable()/clk_disable() (spinlock only) stay in
> runtime_suspend/runtime_resume. clk_prepare()/clk_unprepare() move to
> suspend_late/resume_early, avoiding the prepare_lock collision and
> actually dropping prepare_count to 0. DPM_FLAG_NO_DIRECT_COMPLETE
> ensures these hooks always run on sleep.
> 
> Fixes: 0b3ccb76b95b ("drm/msm/dsi: Fix 14nm DSI PHY PLL Lock issue")
> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 132 +++++++++++++++++++++++++++++++---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h |   4 ++
>  2 files changed, 127 insertions(+), 9 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
