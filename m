Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795780404;
	b=HLxc/WMGl200mCFLF9xHyCNfUldp0Xh1DkquH+FsgoGIZaHsJl1LbguE115fxuoc07mH
	 Gm2zD+bUri+H9NRcmmHsP6kKKQCAac1DGFu6naijnQ35LPrDLSNVHJw9ZtKrP/YAjH7ns
	 yGJrl4nA9Oab6pR3CI+wb5Lnj8lEtVdV1gqu/n5inigXTzS+mv3TKSzrVoJfhfx21vSVQ
	 ssIcGTJM9K8uVuqjqFKs6/9dFRHTvmP4hJRVlEDjSa1S+aOY6nobnA1dKPbda0DnzNajy
	 RRbiMmZqm6fGCkdRXMsFjNOIfDy/mVfig/6r9uxSKgyfdCOLEk6LXG0w4Dt9zYaI83Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795780404;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NvFCw+bmf8mxbl0IMnWpK6+ahat2YBHhwXRgKcWA70Y=;
	b=wnZ0JAd2maLE4LWb8om/cyawrSNvKTTcBzZk9x2g9kn5VnKYhXUCQzDP5yIk4Hq6GjGW
	 6IsYLUePYtnpRf+ktSF2J3lXp0WNBVdOQPOPWzZCJG2S+vgAsRKrDtIy56tJop55Gy7+s
	 2nEbi5/8FyziLz7wwruJkzKhsbPxsTdDRbXp7tR7TsFa/RPY11TfxMLqgPrQ/LBKvfGoP
	 uAU+/U8X5ArCknw12XPRLSN80+WTatN82V5s7Y9gl6GTlsvzRsDKBrxhHfMHmsoqyC8y/
	 YpCtIETVC3wT8hlvcLdSrivGF5mScZ/L4MsF79fIoH4wn22Um+lxxHDfcCDHDq/7WMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZSBRKhgI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NBIdvKXs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E88606A323
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:53:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9E88606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZSBRKhgI;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NBIdvKXs
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARAp6H62268588
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NvFCw+bmf8mxbl0IMnWpK6+a
	hat2YBHhwXRgKcWA70Y=; b=ZSBRKhgItTfJJ5eGZq+gQQci4hJVvlNYV9R5Peih
	CJ+cWDXcpQtM+zwe9+Fej0v6vNY4MN0/mF9WPnbMVHikU9mTIKbE7uTmf28gfaAu
	twH1UsP0rhrLzdHWgTjvDYpK+8/2R4FZJRDAtfkwbKyGE6jRGmML+dcC2CQ8lW2M
	vxp155bdXqRCYgXxBcXPcelss8Id5r1IHuLPkjjRqDZZOqmMCQeV9bORvLC6OHD/
	eRdsuO8rhM7zwHqpGmCcnHX+Gn8qT88h/ua4JAomxQ6OctC/HjGeUjH4BDdN9Of8
	brG0i7pBSKvCqOaHHurHjdhrn0+1iPqPWnBS/azfiiH56w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73uhhfck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:53:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94960131b4eso541007785a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 03:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795780402; x=1796385202; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NvFCw+bmf8mxbl0IMnWpK6+ahat2YBHhwXRgKcWA70Y=;
        b=NBIdvKXsJgGVTmOdP0szhH2cDIG1xaQMLTlsOQrmAFbX4FVXPH3scsD43tbEM0BKXi
         h0oE7zZQ6Gwn9mgZmrb/HANEZnMT/mzhIaMF1v4/9/QRYOatmDsxDDXc0l9Y0Qvprjy8
         Vj3ZZiFOvR1gOwmuB05GcIwsTOXI86jr5i9FvR5/E/SLzTxRi0VeAgcIZWp8cpmddy9n
         7m2j+krc28+/HZRw8aXo7QEU4NzeLVcP9KYmdZOrz1g7TJGJnwNjjUdgkYgfZ4II9SSa
         XBs2rNWvqNGfCuvOgdqb64nP/W1c95CRHYCX/+m1tyAn8Kx6sEDkxgdVoOsFY11nEEu+
         4QGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795780402; x=1796385202;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NvFCw+bmf8mxbl0IMnWpK6+ahat2YBHhwXRgKcWA70Y=;
        b=TBxJCghwhDR0UNM6cfPtHJgpov200MlcPO9r9ZcwG1UsEIc9gJKypdYxjzeJQQuIBU
         uoMExLL33TOgaxw5tRcbI4Q7c9BiI39NqgJltZm+ta4HtuA7Xtnk3CSgo6WtrCekEU1o
         8ix8AfKyrpaQpw4HQtGE93jIeZjZae3HFTDLUFAgD3cMZq3kt7HivwGvBAuht/TD5Wjp
         hew+4XV1GTeBbEqxKbyI1X1/LhJkgZOA5qYzQitByWAT/wCKRmkKIdbfggyM5W3WkGCC
         /aSKbRINPv/01s/yBuELnQWcaGmgaHYRqZIGIbOxbJmJc6kUF+Hj2yoGtEPn3uIjSgrQ
         M/hA==
X-Gm-Message-State: APuU4Z9VFNoBYgFVGURlTifYsPiqIt8+mEW8jPxaXnBflssO5OByUVva
	alKxVMYFOqy1w1aqC9Yqyq+wWx1GVLQVo7RqcJgVUxQ1QLupHpFqy9CERgHy6v1BnfrHHaFDqaV
	XOyXVwWiy9OzdRhTqCXTFBqicut+HXz8TxtbefWHmvQIpwxNNc9PfLUY6bATw9YvrPDX6
X-Gm-Gg: AZFdTZdcRgwiXF1SJz/CcLQfmmhiYztx7408tWDqmgYAD5pk4oP+FXqaVs3cWoxQ+1b
	QiPHkqvgZ+UQGpLtLBLMyUKprfuN8lpwAARY0MnkT39mo65wuSyYISf26l/8Mb6piWXm7utW1G7
	4emACNx6cYld7LPushXfte5kiNdkNVb8DnCkLg4W5OwvRGfEf2McvuC387HO5hTtZt85PtIBWQ5
	vhw0T9b+Q7wSXfGNXI5RvumpRiqSUymMfZ+2dkQYGxpPj0cZWvK1Cp2SN3DzV6Ylg+C29W6Egw6
	lxgGcEchZ1KRN8Ri64cHxucPDLFFenSJsyDrBqoxpoZBjF3pYaq3RIEGUi9bMwqpWkEf60S8CtV
	O0d+aeT5YIQriDHhtAZlXB4CI0Y46vDfSSKOlxS9wKYq/JV/Yi0JayBSzTPPFAI2ALsRWAZe8QT
	MnArV4sSEKJuS4FPIKKfy/fljSs0TijQ04QQ1wFGVko7xGdagm/OJugMavNrlekA==
X-Received: by 2002:a05:620a:1d05:b0:93f:5445:c661 with SMTP id af79cd13be357-949bab4d2d5mr4286068685a.57.1795780401844;
        Fri, 27 Nov 2026 03:53:21 -0800 (PST)
X-Received: by 2002:a05:620a:1d05:b0:93f:5445:c661 with SMTP id af79cd13be357-949bab4d2d5mr4286064485a.57.1795780401434;
        Fri, 27 Nov 2026 03:53:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd081f29sm5910701e87.84.2026.11.27.03.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:53:20 -0800 (PST)
Date: Fri, 27 Nov 2026 13:53:18 +0200
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
Subject: Re: [PATCH 1/3] drm/msm/dp: don't gate link-training fallback on the
 controller's HPD block
Message-ID: <tldbqtuls37jgdkbqpi5ytizqhhxmzejbh3iujjg2coptvxgrh@klt2bt2gstza>
References: <20261005131432.22840-1-jean-francois.bobier@laposte.net>
 <20261005131432.22840-2-jean-francois.bobier@laposte.net>
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
In-Reply-To: <20261005131432.22840-2-jean-francois.bobier@laposte.net>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NyBTYWx0ZWRfX6uGeaefD+8T2
 jh5ouSWJy3usd5sXCuRtwpjpB//SqHOSlpULdUf1JAXS5PPM12odSFWtlqLDPHLjeg6ftgWl8x4
 P0wx0/A5QU3d44Pc6Ynck2KMaPfrkys=
X-Proofpoint-ORIG-GUID: VaYVz4wwveGGXcQNiB1FboqRYCSRVvR8
X-Proofpoint-GUID: VaYVz4wwveGGXcQNiB1FboqRYCSRVvR8
X-Authority-Analysis: v=2.4 cv=BbBNQbt2 c=1 sm=1 tr=0 ts=6b096f33 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=AVbMHacnAAAA:8
 a=EUspDBNiAAAA:8 a=6AKRNlzo6MLLK9Xf-kYA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Z8w8RPyABVWp4NBWd0ke:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NyBTYWx0ZWRfX1yjXUE+0fckS
 z2phaTONRkH6kwoqMHtELQdqP0VU15/fLUFomnbArX9XrAApssefYPx6xTh/o2+NhvJY6/jls0K
 bgLvLD9Gy6zrPIfLUHW2rRc+9MtYMAjFaJtboCiKzAPFOOUx2CPjXDfoJxrrNfQvZs5prptV+RI
 ptNh9Bgjd6HO/Vz3cF0BQbAgTi2r3y9gG+c/zjBqykHqexhcmfOBvnU6GcnSLMyTnqiCjFiQfxA
 wCnf2btTsE1VswuknR0mrSPveuwfOATQXpHF9L7cIW8Om7Am9ew6KJnPSCH2Jo58HwLZhiDiCXE
 A4ci89dzNF7FweVqRH8B/R30yI58ZwvJwm/Dd4mqvE7SckMM2xLA6Lh2wufgviEh3xWqv1sLRGO
 NuIuWcNPdqLp6q9E+XkM9UVRA7oGUguvejB/6PtYjtCMNbFPkOJNEFiDo1SNrVBOVwZmgnWf5DI
 o5suDwZDERlbaHCmLSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270047

On Mon, Oct 05, 2026 at 03:14:30PM +0200, Jean-Francois Bobier wrote:
> msm_dp_ctrl_setup_main_link()'s retry loop is what implements DP link

Nit: msm_dp_ctrl_on_link()

> fallback: on a training failure it shifts the link rate down HBR3 -> HBR2
> -> HBR -> RBR and then, if clock recovery succeeded on at least half the
> lanes, reduces the lane count. Both failure branches guard that with
> 
> 	if (!msm_dp_aux_is_link_connected(ctrl->aux))
> 		break;
> 
> which reads REG_DP_DP_HPD_INT_STATUS, i.e. the DP controller's own HPD
> block. That is only meaningful when the block is wired to a real HPD
> signal.
> 
> On a USB-C port it is not. HPD arrives out of band: the Type-C port
> driver owns it and hands it over through a drm_dp_hpd_bridge, and the
> controller's HPD register reads DISCONNECTED for the entire time a sink
> is attached. msm_dp_bridge_hpd_notify() already shows this, logging the
> register beside the bridge's own verdict -- on sm8250 (OnePlus 8T) every
> attach reports
> 
> 	msm_dp_bridge_hpd_notify: type=10 link hpd_link_status=0x0, status=1
> 
> So the guard is always true, the loop always breaks on the first failed
> attempt, and the rate/lane fallback is dead on every Type-C DP board.
> msm_dp_ctrl_setup_main_link() then returns -ECONNRESET and the mode set

Nit: msm_dp_ctrl_on_link()

> fails outright.
> 
> The cost is real. With a 4K sink attached directly (4 DP lanes, no USB3),
> a board that can only carry two DP lanes to the connector trains lanes 0
> and 1 and never lanes 2 and 3:
> 
> 	v_level 3: DPCD 0x202 = 0x11 (lanes 0,1 CR_DONE)
> 	           DPCD 0x203 = 0x00 (lanes 2,3 nothing)
> 	link training #1 on phy 0 failed. ret=-11
> 	Failed link training (rc=-104)
> 
> A fallback to two lanes would have trained -- clock recovery was already
> good on exactly the lanes that remain, so
> msm_dp_ctrl_clock_recovery_any_ok() would have passed -- but it is never
> reached. The same sink works through a dock, because the Type-C alternate
> mode negotiates two DP lanes up front and the first attempt succeeds.
> 
> Use the DPCD read the loop already performs as the liveness test instead.
> It expresses the intent directly -- a sink that has gone away cannot
> answer AUX -- and it carries no assumption about where HPD comes from.
> drm_dp_dpcd_read_link_status() returns 0 on success and a negative errno
> on failure.
> 
> Signed-off-by: Jean-Francois Bobier <jean-francois.bobier@laposte.net>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 24 ++++++++++++++++--------
>  1 file changed, 16 insertions(+), 8 deletions(-)
> 

Fixes: 231a04fcc6cb ("drm/msm/dp: deinitialize mainlink if link training failed")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry
