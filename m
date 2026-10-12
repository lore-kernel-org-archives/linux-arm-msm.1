Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B4EE48D873
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 14:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791815802; cv=none; b=j6t0W10qSB/EVWSh58Y4FDfFo4i6XAwNbr2oVGxfotanLcwxu7W64Kfm34s4EL/iqhwbheW9FjY5FPjD9ySHZZ2UslgAg1B7zgsUVOoL642/Cp/vuSe6vtohMqiMjdfuCso/ewYRg0yVJcH2Gr9x8CL0BxzxYGtxcmhq0eJtS70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791815802; c=relaxed/simple;
	bh=zoBGOwxoePaGg4F6Bify2gdUtyE/3ZyTpQ8tOtBnw3s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MNWOQqeRwLqnY+90EO2h/j8LEvwAYaN6gR8S4q3s3RSl+txDuTsZlpDS9y2bsCQoY40qs+Ljq8GFwnW+BEVzxQUk3gURDNDgz6iAopcVt8D9v8mxmJqzUQJiDpfU+WLZdq/bgmI6+CgoW44TLsx1zs/X2qhHZAOhjJGpi7JI3z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=INGTTlaK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L5/LC9Kb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="INGTTlaK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L5/LC9Kb"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC07W41933170
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 14:36:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J9HMb+rbLJfcyQVlt0skqJmt
	qpokfqdjdof9s+dJvi8=; b=INGTTlaKgMcesmWieZ5+nkXVfzKBctT08I2hS1+2
	lrAfjshdJKeBapa44nzbbOQK+iIA7HCBxWG7HeVGPhMG+S+CtJ8BpiJOkiw7J/xR
	Cnbnnk0ynBhXsCo5nHSZO5sICr/dOsKCaQPOorI1LmIlykwa1bu/tDI86QxYUMee
	oTjT3N3DvWCHn5LGjoIzrAplCoX9cbFVQrCJzaxvlTF0pj7fLcEGEejbA1fIw0YU
	TrRYsefKmZ/aIhja8bFTxb4EfWGarC7VB4kSdBASJDKCMOP0uACKfeDTRgv0fSvU
	cS+uBNPtjRUiBW2aF8vjernE9mvzGV6Sut95H4MkvAu6VQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8qtkjnsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 14:36:40 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91430af782dso48428156d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791815800; x=1792420600; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J9HMb+rbLJfcyQVlt0skqJmtqpokfqdjdof9s+dJvi8=;
        b=L5/LC9Kbjtgw1xHuJ2UrBmuuD+a14WemJRjOKd4KK/GHySI0rNB9wdl6VXTRrff3C+
         q8qlKHaRN3rWw9mHqpBVuu4y0b2vrsNx+QVF+e3Syw+Qv2sMNQwlqUc8M02xXtSPDDan
         tXKY1ZsGwkJlErPu91ce0QRkp1gqXt6NqW0GzDxAczSA1HSCr9CdAzfRT5gWa24tmrUZ
         fAGe1k8xrXv0L1R2jo/l4r9ymky/aSpFl/keDr/R7k07jxzUtYv8e4h1nLe5zoYpWj8E
         zxO1YJkv5GynaVtpx5xLnjDUfuGRNMN3FjuIJzHGCC65m+3P0E4w3L4s6VZ13k7HG2S2
         u8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791815800; x=1792420600;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J9HMb+rbLJfcyQVlt0skqJmtqpokfqdjdof9s+dJvi8=;
        b=ZradqW2SNJPB2QknbKCmMrMf9l4g2gkc6K01ZxY5r3djGvkveQ5SG2INMzIxaGeSRt
         NL5uZGspDyAalwfButERAKCE3xU7j5jC9Tr51kPINgFjXP0As4Ezw+veifpOd0VDXw9z
         J+ZKfwcXdQx1PFrEpmBVEjgzUfqwgd2V3cVKTHBtG16vbyz7DrDvhcNwiTOHPTH3F6cR
         M5dI4bUqv7Yvm9zriTaxsUzVfoaWA7kutBlfdrjfw/bsKRISAUyDfbkaxAl2mL5ViTKd
         mEOnNq2GKOeS798HjZxq53CLKZ5mtMPHBQ0BuE/jqGRTkPDkjAPwBX7V/ISLbcJFi/eo
         HKVA==
X-Forwarded-Encrypted: i=1; AKwUvBxa6t6+Nl38WAnuN8vKxJIAflzhcsbTeMPUHwDacfcJtqMISOiStO/kZoUhfMrEeX6qo1OK9Mo756IiuOEO@vger.kernel.org
X-Gm-Message-State: AFq9FYJsRn/kSxl8CNLyx0K3icWQmi7X5YkwWZ71BahjTL3UTP9+tvNt
	xvFFYdC4MkO97qdCDkWwuJNyJzSBiPCRjaq/xQoHV6FQqrbMDQLnED71uYoINq0sMFkKSTAOvCK
	jm7F26rH9dynr86iG6HWfwWHDiH/UfTOMBrkmk87FYz8VgPLqko1xxIa3UFuev7CU7lHN
X-Gm-Gg: AYBFou2hkitgtWUgyU9QW/vQO/N8OdtLxtfRQQ6QqkQa4iTfJvmU1zMmyTNRZyQY5cH
	pyw1OoN0A7AQ0zbUmbbLnWUksuDxtl7JyZB+L4WkCBNqRy20ipwqqcSz4x0sMTDQ4eRBtMsk/ML
	svFbrmzt2kLDzVG4BiBM2Bkmrfa90mb8VUg+TenPS8Yx+tWPykIEx+h6BKZrlBfe8cm7MY5R8qV
	NZ47FT439kskUyMrkz5E7VURL3hLuUJpcl2kVxNDWhb3wfudzqAmAoFJJ1xQkBwNu6SN+yhKiN7
	zsU9xGnqRu8MKNzA2rWoqT6qN4+FqwjBm360qYGx6W7oMvJyRtulSKaU+VoMnc/gYZDKyM7TPQr
	Ha2cJ7WOLXhqPAxSaBWTXqGMUSGvhkcPqCfiyL3V4u5kHYVOlSuiF1dMIr2h4I3rMOt2jI1Zqul
	y2qSb+Rl+W8OdF
X-Received: by 2002:a05:620a:2b9a:b0:939:a0f3:6aef with SMTP id af79cd13be357-93ebd1ba6eamr1634167185a.23.1791815799465;
        Mon, 12 Oct 2026 07:36:39 -0700 (PDT)
X-Received: by 2002:a05:620a:2b9a:b0:939:a0f3:6aef with SMTP id af79cd13be357-93ebd1ba6eamr1634164385a.23.1791815798995;
        Mon, 12 Oct 2026 07:36:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde36693sm2933145e87.3.2026.10.12.07.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:36:37 -0700 (PDT)
Date: Mon, 12 Oct 2026 17:36:35 +0300
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
Subject: Re: [PATCH v2 16/20] drm/msm/dp: Disable PSR for YUV420 streams
Message-ID: <oxdplbus736krf5p6ilqattox57iv5htwlof2otcgk62xgkxrh@wg2yt2iogwjr>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
 <20261009-msm-dp-hdr10-v2-16-1835d4966da3@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-msm-dp-hdr10-v2-16-1835d4966da3@radxa.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1OCBTYWx0ZWRfX9tCjy1w/m3EE
 cYMnU3vPilWW7HISh+4uk1+nn2IH2RqB0OSxo8MUPC/ocgqKnUz/Jh1IXPnwA3JvBSekHCVVydV
 xIxFKuGDvLnCg6s3zPQ6lPdRJHjRBOr9r7m+BGUm0OQMMeOqjk7O/aeg6pPUS8tVYoayynIe7T/
 a9SLRAW+hPNaU0PV7VLi06ZEZB4yhcMotNtChOYJ9GBXlzFE2YUO4FWkvaXVeC6hUBVEEuCRTiG
 q7uKOBxBQ/bsmIPzzHZpOls9qdfklWT6sx9KxtrvW/4HK2trjqEQb+va+mJOg+8w+b8vYSaYYS2
 ForOyA+3iLJKTaUDvXkgrS9dKqJUUwOKYA4/tao7JBOCGM/IhNzXafxRMPYdsP7fi6AU6tY4aBl
 yL5TNsos0SvO5EADGlfs6aitu1QlfwFaDKl/88UOybCkYX43CR/eHO5X5qCGsqU8IhKlV95R4M5
 SCPUoWPkTXACXumymnA==
X-Authority-Analysis: v=2.4 cv=c8U+0h9l c=1 sm=1 tr=0 ts=6accf078 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=ksxQWNrZAAAA:8
 a=q6X74nQK2RvUw6JQmdMA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1OCBTYWx0ZWRfX+ynFMDetTLDI
 ANujjfo7OcPCuk33roI/38GRtS/kN2FBXbLM1GzYNtQqVsCmPfmClOHxTUxwlrbnp/GgHgBkp/e
 aAgCwugQ8MeoyZS0IAkE18i3V+rFQDU=
X-Proofpoint-ORIG-GUID: TfBcx3cba-7BzpSKrP0-P0BFac_ctPim
X-Proofpoint-GUID: TfBcx3cba-7BzpSKrP0-P0BFac_ctPim
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120058

On Fri, Oct 09, 2026 at 11:16:08AM +0800, Xilin Wu wrote:
> YUV420 uses colorimetry VSC packets, which cannot share the automatic
> PSR packet generator. Do not advertise self-refresh eligibility for
> these streams while disabling PSR in the controller and sink.

I'd need to check if it's possible to handle both. Otherwise it looks
good.

> 
> Compute eligibility after the common atomic check and reject an
> incompatible self-refresh entry. Clear the automatic VSC generation bit
> for YUV420 and restore PSR configuration when returning to RGB.
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 19 ++++++++++++-------
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |  2 +-
>  drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
>  drivers/gpu/drm/msm/dp/dp_drm.c     | 16 ++++++++++++----
>  4 files changed, 27 insertions(+), 13 deletions(-)
> 

-- 
With best wishes
Dmitry
