Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328C83DA7F9
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 21:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791841972; cv=none; b=eSBfpc2+xOdWNsGcZumSnqcZn5miSil/S4tVG+Wk0kTAF1K9vTkNAZlAc7GuUbinMaeDQPylLFDsdVa8pL+LIsERDb6ac+/Omljsn+6/FYE5lAEqsKUglll1s2hmzo43xVX02lThweNh7tmdd8GwIdNTVYEXokpMm55Zn5Hksm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791841972; c=relaxed/simple;
	bh=FSZElpwBYQSj09X3AzLHfrnh9ZTvsevEVm+pj6gI1pg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kz0qVLqBJed8RilGhRf6j//PHipq9WuSLe6puRwkEJwgRCduN2+DwQp7p8bHoCPnsC38UV/pE3v7h+3zgSCkqunS0n6rRc4PrVDZDY7BpIUAR4LZqgznW9Yb12weV1mxqBH57EDNGBFSoKA6hOoW3rMPWqXXpgoIDpGpcxrwWcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DdAOuTmj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h0zDLo9V; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DdAOuTmj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h0zDLo9V"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CJNZ7E3656881
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 21:52:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=K+fv5z59h3BrsGh9ocdCXpDS
	hfQmJTPHUsOE2PlPFqM=; b=DdAOuTmjL52rL3XRAhWdcUSgGBfsa18vzPxlcXk9
	WxjTb2S5wwvYud+MgOIP5Gp5Tsa1RoaEahGC7erKxQftuVmFbRCwVNSqN3aEcyxb
	fRRLD9jLK55vY/4V8b9ocux97ItVdebIUuusF15Qi+sBp9wR/o+BH9KVWHXN3gVI
	NzZPx7ZESfGuKVBHvf7pschn6nTgI4cw5DnREAXLytJ7XyB1UH8YoC3XjWKE0rqI
	QUd4TafUL2BJRXDaf8OlFm33A3jO2x/xtNOv9ZNgRr/vhWajOii6fdUfjgw0xLgq
	sOHAZesQsNY9iXsm3U0Xl31B7ta1IYB3i+WqsTtMhmRXQQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sd1v5mp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 21:52:49 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91785bd637bso83659366d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 14:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791841969; x=1792446769; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K+fv5z59h3BrsGh9ocdCXpDShfQmJTPHUsOE2PlPFqM=;
        b=h0zDLo9V0buMGZOzcKtSp4mFIIJKep7hgErmpqw/a1alQODY0oU6wng3ZHPAVNJDwy
         DT+0JO6JrNOep4Wag/HlZElpQZcYlin1hHOY6LZDYDqNQrQD7MuJJmPoVJG9362E2R8R
         u0zZlkL1Ax6TzddaHYGDYUmAzGOrF1EZj+u/D7/H9wypRaSmc8rxli81bITE4XZKx/c8
         b3jCNZCybG1oqcS1l7DLVyRlu7mbaX/apjfh7KgWR6yB/rGxl9xs2ox+8mugVQBIfCQa
         OpalLAeoZEEuLWORqrh066aZi9zeUxoW4v/+YYtYPOv49WXQE37K1RWuKALYA3MNj45F
         1vSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791841969; x=1792446769;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K+fv5z59h3BrsGh9ocdCXpDShfQmJTPHUsOE2PlPFqM=;
        b=cWcKMw4Dx7ZFt0iqFjeGwu2rET9elR3EXEmuQ+ZK/y5sTtX2voMbfN5k/oyv9AAkFo
         fx2BtSdvagF8L8lF3afFlItUBNV24caUB8J5OQ2CVrcOXhdTrwzYAYGC+v977XZRqrz3
         YvXx+vzTEGCADLqxQ6UaQ573vWazhEbE4R2RsnJmddv1tJAsbrDKqudCAqEIjnMhtQla
         DVhw4pKaEC54mbLpiYYz+hdKhEuO2fhcazTmNUJ8anBadkuHFt0aZCUfVRNOt7JPAexL
         HOMMt/h/uQGXEUOBK2xNdE7FTBAOOmmjAVJHpVIUdl+EZg+4aNUJSKWYXtLycXMgtOh8
         jbYw==
X-Forwarded-Encrypted: i=1; AKwUvBxuWbPkTSS+64WgaxiVtxpm0dFhwPcFYHpk4Nu4TzrnIvYLyU7HFj5eFJtDmoutW/jC6Q0GbXQdutKIliEb@vger.kernel.org
X-Gm-Message-State: AFq9FYJPZAHlbLl1KZDDZGA3QglNlVKOZGHE4+7rjp9ep3KYX9sugt3R
	wf6rYK717daRnNLmDpQcu5MdhT1aiASIfeq7ZuqDDNC55udPqYR98A9ndVpa/8biL7KIalTWhth
	kq612igimuCNg9pz85tWs9Sbkz9eMwnS11pTMCNBin2+/1o4ir+kpd1s/rjLYMCfzg6WN
X-Gm-Gg: AYBFou0Xa6BeOVJMMyia//r8v3gRQeQOsamkL/X5gWBPDbscKW9cXIGIUm7iJTOuC3G
	lJh1ym89umZZuGS56IbOYWJSNidIE7gk/oHdGzFPcxjdsVBP0OnqM2BsVDNNCUnOopSg/McoauX
	xWH4bT3VuvtpK0N5cCVq35/Dy3EoU13G6f6TVg6VkJf0bk6Vo+isY2gWLTjba4767+CemGIKRRX
	FwAHFRAKbwX/wNe3FuXQN5tCaXng54aUrZB7xrRYb4Ak+7Hvf8upgnoEsPpsVEeXqy8gvQieePL
	eEoOx3do+W6PQ7d73N+JJTkey5R/fnKFMiSe2BT43FeoKIkjQbFLP4VSQCNRSjVOjsKc5IGmElA
	XyCe58pcmvLL4zoM6faTzZPM9IcOEjitSnvybNOF8Om3cBidgmT+pNmn+50HqoSfXvvuG7vW/wz
	lusFwr3OlpPgIW
X-Received: by 2002:a05:620a:25d2:b0:93e:d5c1:da49 with SMTP id af79cd13be357-93ed5c1dd35mr1101464885a.82.1791841968920;
        Mon, 12 Oct 2026 14:52:48 -0700 (PDT)
X-Received: by 2002:a05:620a:25d2:b0:93e:d5c1:da49 with SMTP id af79cd13be357-93ed5c1dd35mr1101460285a.82.1791841968289;
        Mon, 12 Oct 2026 14:52:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde91537sm3083268e87.16.2026.10.12.14.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:52:47 -0700 (PDT)
Date: Tue, 13 Oct 2026 00:52:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dragon@radxa.com, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 19/20] drm/msm/dp: Serialize video test state changes
Message-ID: <gcvermba6qq7jw7svx644fncfglqvwt3fpj72ew4habdq6gsn7@arxwbb4bdubb>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
 <20261009-msm-dp-hdr10-v2-19-1835d4966da3@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-msm-dp-hdr10-v2-19-1835d4966da3@radxa.com>
X-Proofpoint-ORIG-GUID: NqElthSuokjIEWsqsK72r94tCT4CIOIq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA4NyBTYWx0ZWRfX51oobUOJfYrA
 CC3+ggqsS86Sqqx7aIL8s4UuuQ6yHl8DJsSetx2fBMsHFP2znLiZW2+kg0dGTZyeTysNmwRF9tD
 34vR8gDHcJXCAZ4jxrs75ovu3yUn/FI=
X-Authority-Analysis: v=2.4 cv=QtHLTlyd c=1 sm=1 tr=0 ts=6acd56b1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=ksxQWNrZAAAA:8
 a=kznJ5srmxMGE6xClfzsA:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: NqElthSuokjIEWsqsK72r94tCT4CIOIq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA4NyBTYWx0ZWRfX4o03VMM2qeRd
 Eq3bWCUZdF1CKFF3I0fV7CAxvilOnFcFcslhpFpYtY4crkkojiqX9/okdsSyuQ4qYOAHIpCD+cm
 IyTvUwOeDC/nQRYVlFksh9T0MqBosel4TDXE/A3qnTCrQAD3cbFlfxoskYdYAY1I1NrGE1HnUAS
 jIKGUR94w0HYkENw7OeZM/KYwp7zT3BlR9e8KPGOshOaNPHv9yWLg07xpM5bzLkLSqGuCccPxcW
 1kXoh6eT4ICJq03+VcYGl76DZMVEOCrMP0Z5WAf2ZV9cPRgXAM77I6KK+YfHW3TrypkKNm1h3/m
 uQ9Jq/QFOY3OxUhefTw6QOLY498sKKbLFqrxRDnmP+jwVd2i8Qqk2F3E+YKdmbKHQRWS1oQC0RX
 DP0fSSP4q1pBu47huqgBIjuspIJQuJK/EeN5hDC3VH+d3p5qaEVPfEA22sE6d8e+KEIHn26AgxS
 kJD3etx1TB3/GrT9Oag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_06,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120087

On Fri, Oct 09, 2026 at 11:16:11AM +0800, Xilin Wu wrote:
> The debugfs test control writes video_test directly, racing HPD handling
> and mode programming. Reading the test flag and its requested depth in
> separate calls also allows those values to change between the reads.
> 

Fixes?

> Route test state access through the display and use plugged_lock for both
> HPD and debugfs updates. Hold the same lock while selecting the test depth
> and installing the mode. Pass the display instance to debugfs for access
> to its connector and the serialized test controls.
> 
> Preserve the existing SDR test behavior. The shared setter provides the
> entry point for rejecting incompatible tests when HDR is added.
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_debug.c   | 27 ++++++++++++++-------------
>  drivers/gpu/drm/msm/dp/dp_debug.h   |  8 +++++---
>  drivers/gpu/drm/msm/dp/dp_display.c | 34 ++++++++++++++++++++++------------
>  drivers/gpu/drm/msm/dp/dp_display.h |  2 +-
>  4 files changed, 42 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
> index 00fb1a7ba40e..c26b356f998a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_debug.c
> +++ b/drivers/gpu/drm/msm/dp/dp_debug.c
> @@ -21,7 +21,7 @@
>  struct msm_dp_debug_private {
>  	struct msm_dp_link *link;
>  	struct msm_dp_panel *panel;
> -	struct drm_connector *connector;
> +	struct msm_dp *dp;
>  };
>  
>  static int msm_dp_debug_show(struct seq_file *seq, void *p)
> @@ -89,7 +89,7 @@ DEFINE_SHOW_ATTRIBUTE(msm_dp_debug);
>  static int msm_dp_test_data_show(struct seq_file *m, void *data)
>  {
>  	const struct msm_dp_debug_private *debug = m->private;
> -	const struct drm_connector *connector = debug->connector;
> +	const struct drm_connector *connector = debug->dp->connector;

I really don't like this approach. My (eventual) goal is to remove the
stored connector.

>  	u32 bpc;
>  
>  	if (connector->status == connector_status_connected) {

-- 
With best wishes
Dmitry
