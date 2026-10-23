Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762819;
	b=0a7Gf+FlGMrHf8rEpKG0x9qT7mUsTLq0F4krHyAtJKh/kZIsPi5oBz7VnQkRBrXSRr1c
	 DtSl0P+pQHydOelk0sx4NkcMZRzGKQ13sQpPKk+iMfbV6fBkT0a5o9dcd39UWFHe+veFV
	 dgvw+opZCKuVJqQbuny0GPHGjuzNtYaP5eVRBs0XCzJSCO+sMoYN3h8qjQVW/gNne+F3M
	 kI/PCKDfziA6axIBPLU+iejfmqhGEFkei4UHozsxrzmyzMyihSRFXvf8nu2AsdzeHyE0Z
	 YsJqtKedhiRe260zrVX4FXTfGCFtzG3PqfMLZ9I0/+3yKrnJWm7V4mjVbOLDiuy/nlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762819;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=C+3I/2A1U+Gp7I1jsF91pZcgO5n0gv+qfSKmmUyDmWI=;
	b=vJkxtY/xXWpN5d1ceLDsxPucYiMuNRH6djuYS3NB57zLKECqAcM3q3XDLYb3yDPryPF8
	 U1qiScwzDAQV8gZyzoKl8Yn9lg0JgZLiBy1WbHf3KtI/wYea5ou2m5JnPKR929p11/ozG
	 +dbdKeUfawxQIYCOaD+va6/N680FMxlaangmuwviLyskKR1A/bMRnMsew9jK1/IfpmLls
	 D9XcO03qPsz2prdiojCQbTK96fatiyhBX1X7a1pCiE1e/yrzwtdRHWyMy6/3+wWeVSc2/
	 F4Y6ewuC9gJ18DsiTw7S1OuAgUfCVAmBcoxVLg49+Pm+/0TJmDaV7jrfY5JALMVCTLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zg3PiU9q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gxhrd3y3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAD2606A320
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 13:40:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BAD2606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zg3PiU9q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gxhrd3y3
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NCAVlR3821940
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 13:40:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C+3I/2A1U+Gp7I1jsF91pZcgO5n0gv+qfSKmmUyDmWI=; b=Zg3PiU9qK0tppPun
	NsspjomwNbA7Q3M2FEW8bViXiyhEwTBhewpJU1QOtdz/9Vq6N/xGDk179SBHhGYd
	z2b7OXKyxKFr9eY6lud2eagqwV7Pyq0x8dsik6CzOszsefGpWji4GLyWZgKJRJV+
	KisIhC+SwX63a/RXDx8Y2wdc06OSUXRopsrK5KdjEjtMBXIcojsdDwayUhphPCj1
	7Rp/YEUHPVgMXRxH/HoXb/RnRewYY31lJnnoUm7N6C2n3evmS+7VZ+K0BORCjalS
	VLG+hirHdGSM7O56TQcyyk7zdj6WSM0NLNPJ0qkux8AYn6kGpQZVVS+ZNvyJPext
	rUYD4Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hg7bw09x0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 13:40:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e92aad34aso180049485a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 06:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792762816; x=1793367616; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C+3I/2A1U+Gp7I1jsF91pZcgO5n0gv+qfSKmmUyDmWI=;
        b=Gxhrd3y3u6ezeHlcbTDCIvjHLJuxnNBavb8Oa4gRSAVvec4K3BAZS8195MIiXZ+2Sn
         fZ4usyrfYGssKVYzER9e2NT5MJyXzOyqQ8k/zWkuwjrTpHllESS02xsmxSUdjSUCitqU
         xMYdBWlslxZ/8z5Q3/hu3UQJvBcHfzMi1YKhakzeq4ACL2DB5gfvY+NR4mRCnJy6eDp7
         hmHeeHHUK7U1qnJWr+wlAooiW/R9euY5zFTN2tmTxsTGTSDXNvqASx11RpwRmtUohRdz
         vnEL68ZNZgWUAsPW9L2dqYzibHNWnYZ7HpKEtaRx75llZl/Qr2FEjn1L7hlwdB2YufoL
         bRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762816; x=1793367616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C+3I/2A1U+Gp7I1jsF91pZcgO5n0gv+qfSKmmUyDmWI=;
        b=hRnm/LxHjNtouIKuGdLDjnbH9k88RR2W7DySUfhhfejjKniGVNS/kmgaPQX/wRV3cU
         gY4KLRZnF4bvhQ5up163Ic/AKI9xLzGSW3a2ZCqVfCJ7Am3FugRHlhEmy/kkxsSE5jMX
         cq9+l3c5RYcoYAF/r+GA2WowKoNLSvwPzAt8U7juBZG4tuqmzRL9qW8UFta7BSP66mVE
         B7AWzZxoCfNOgb4MCV7OPqdtx4XfbzOs852l9Qhcgtigk5ctTSxhO4iuAlaPkdgAOlit
         TGKJwqgMPJIZ085C9xuR/d4b3IqIoTn3F481PfeBgWmXm8ElOkw/L+70yhqw07Mmim2W
         AY0Q==
X-Forwarded-Encrypted: i=1; AKwUvBxneYWZBM5mC1FjHH2mFQmdlx+3YkVww3cizpRWPDzmI18S74qaHqArPrgm5SJyQXGCj9Vfkpu/Qk1OCQa8@vger.kernel.org
X-Gm-Message-State: AFq9FYI4GM56sBl8Ti/K0N4blAhCYjwfNn5SxcUzu4LFBxDjzlHe1rLH
	Cm6Onae5SVIX/vFV+fQbw/hth82AJtHRtoVuZfolbqGAvEkUuIyLU/tkQ5UV172OH+SJ69nQp+A
	XndjITsa1MXYIcy/MrvXJwz4o18GpHsBdoo4r39/GoOLO8A2hU6zuMS64q32xpv8+F+5u
X-Gm-Gg: AYBFou1MQ/kZCymAiKapFm+WfrZ4VYaaEPg+dHJAkZV9eQlQepmDN9HQYtIOfhaUWIc
	QkfDrGGOULoXl/xLaj7of7mzFxYyR2aq2No+ziXv6A7k2eALQOr+fyqnmjpM32/9C1vuVA5dyGa
	ist1Kgl5LMGeTypo/uJPOjgxUb1zl57gFWM9i/hCZ9sdT60XXp6ux/CAIYUmYQdXxMlT7Q+LjXC
	mExCQFyPwCCigLB1ilPTu8IJLaO4F1iiXdcqHGgkoMCRToC4qcfV8CdC1If4NU9b5GftTvIf+F8
	I3CUaFgSWUJj+j/3YdmkhURADPaG9SoGbSIoEgu9iKdMqJW3YqRLjdSqH6RbDb89Pa7c7mbrN+w
	g9+AQ+C1ov2oFZ4+iTeOTCKakixD/CDR4EEkF1UaAOr2WL40YAjRHiGJJ1+ryQM4tB5uqk0tdQg
	u0l81C8cCm/Lcb
X-Received: by 2002:a05:620a:470a:b0:93f:2d10:ea49 with SMTP id af79cd13be357-93f6f8151d0mr410841385a.45.1792762816434;
        Fri, 23 Oct 2026 06:40:16 -0700 (PDT)
X-Received: by 2002:a05:620a:470a:b0:93f:2d10:ea49 with SMTP id af79cd13be357-93f6f8151d0mr410834785a.45.1792762815720;
        Fri, 23 Oct 2026 06:40:15 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac65ce14fcsm5309701fa.7.2026.10.23.06.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:40:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:39:42 +0300
Subject: [PATCH v7 2/9] drm/connector: pass down IRQ_HPD to the drivers
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-hpd-irq-events-v7-2-57a3aea3f09e@oss.qualcomm.com>
References: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
In-Reply-To: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Francesco Dolcini <francesco@dolcini.it>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5315;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=EorsOQHW0H0nqzv28S1rGKOICW2UJpSufyghXnThB60=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq22Om//UNyL0fPhmHrD6nuKbi2vX3GDx0s1bTr
 hXsC6vJjfqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCattjpgAKCRCLPIo+Aiko
 1ZdYCACfUyt4MtbHR6/ige4IwYp4trmZXbGoAwMtHMMD/UUH5j+5B7lEYrOMjoRsyPM/XHGlOKd
 KrJ66djgMsBcMB7IPANZGY3FqaAwnvTYLklmj7WnOPSgu3roa0DyVJDTf9hG0yTfv5GKiDbQ8Pl
 KmhArrUvjAOC6NlZmE37M1IGxwF02butanpr3L5qsTjcuO3s71a6a/npS6k80fLUVrGMEYea2QV
 NWGFdXw/NUM92MRh8HK3KyD860qCSA+GJ+WtCnFR6Hy2D4nls1AdzWrq+d9Ww6UPkZMgFO7FyA3
 3SVzSOu0HVBdTqlWc59ycZoxM9LHd/p4JO2Ovjobd6LGAZ3h
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: ELtiOWP_bUIgXIgiyT2-D9r3tosHUM5T
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfXyZDIPF3WL0Yy
 EsLscMFotVwwcZMlcDX86gwYhTeXQ7P/pCaUaWYTtd9tX0BkjSpMH6YzwosEt67tmubeSxRWo5L
 19NwRfZre+MbZPNevU3GCtKwCPxi8v0=
X-Authority-Analysis: v=2.4 cv=QdTzLcbv c=1 sm=1 tr=0 ts=6adb63c1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=DclysrjFOTLD0Guyi30A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: ELtiOWP_bUIgXIgiyT2-D9r3tosHUM5T
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX4ZDMQ9TlgSNJ
 IAocg8ZQtKJJlbB9whDAe8EqmdUnmC2RRoOJIYG3Gyudr+tEpoU0JcuFhi/Q4xCqQZNOF+ty8hi
 fRpr0apwtcToz0zxz2WYeVOmtmPs6/5tC+NN9czJIkFD9pnVf3oSmnwgUNdh5DVgz6/an35fVHt
 iM9+yPeiCs4MMbxkLlFXtY8n50KTkZdeDxUs/BCzpcRhRM8Np2IQbXacJaH4PC6siS4HWfmDu9C
 QaiSOW/F4Yq9Abrx5qXEFzupOY2XriWyWpNgPDGyamqnV07V6Pr8Yhg4tQY+3DmD9VLZsdGs4fb
 YP7T6Zqk8N+a8t1NaR5OO0tr6K5AQRJXXAHCyw9u8OTyEcGtqaCPnDz7FPfH/OA9vOr4Jy9LfPH
 8e7hh39CzyVGsclfKlL8CsmCaFXI2FAbwHX01U+wLom6H2ZVFyNi2HcXWvSG79mPt44scNbTIJ6
 +hD3BaTYCaPUNiz8XBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230053

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Extend drm_connector_funcs::oob_hotplug_event() to pass the
notifications about the IRQ_HPD events down to the individual drivers,
letting them handle those as required. Bridge core is converted in the
next step.

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 17 ++++++++++-------
 drivers/gpu/drm/drm_connector.c                |  2 +-
 drivers/gpu/drm/i915/display/intel_dp.c        |  3 ++-
 include/drm/drm_connector.h                    |  3 ++-
 4 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 81f3e26f6fdf..898273f60cf6 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -142,7 +142,8 @@ struct drm_bridge_connector {
  */
 
 static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
-					    enum drm_connector_status status)
+					    enum drm_connector_status status,
+					    enum drm_connector_dp_event event)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
@@ -155,7 +156,8 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 }
 
 static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bridge_connector,
-					    enum drm_connector_status status)
+					    enum drm_connector_status status,
+					    enum drm_connector_dp_event event)
 {
 	struct drm_connector *connector = &drm_bridge_connector->base;
 	struct drm_device *dev = connector->dev;
@@ -164,7 +166,7 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 	connector->status = status;
 	mutex_unlock(&dev->mode_config.mutex);
 
-	drm_bridge_connector_hpd_notify(connector, status);
+	drm_bridge_connector_hpd_notify(connector, status, event);
 
 	drm_kms_helper_connector_hotplug_event(connector);
 }
@@ -172,16 +174,17 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 static void drm_bridge_connector_hpd_cb(void *cb_data,
 					enum drm_connector_status status)
 {
-	drm_bridge_connector_handle_hpd(cb_data, status);
+	drm_bridge_connector_handle_hpd(cb_data, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
 }
 
 static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connector,
-						   enum drm_connector_status status)
+						   enum drm_connector_status status,
+						   enum drm_connector_dp_event event)
 {
 	struct drm_bridge_connector *bridge_connector =
 		to_drm_bridge_connector(connector);
 
-	drm_bridge_connector_handle_hpd(bridge_connector, status);
+	drm_bridge_connector_handle_hpd(bridge_connector, status, event);
 }
 
 static void drm_bridge_connector_enable_hpd(struct drm_connector *connector)
@@ -301,7 +304,7 @@ static int drm_bridge_connector_detect_ctx(struct drm_connector *connector,
 				return ret;
 		}
 
-		drm_bridge_connector_hpd_notify(connector, status);
+		drm_bridge_connector_hpd_notify(connector, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
 	} else {
 		switch (connector->connector_type) {
 		case DRM_MODE_CONNECTOR_DPI:
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index e3c8181df6bd..90e27d0b165c 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -3847,7 +3847,7 @@ void drm_connector_dp_oob_status(struct fwnode_handle *connector_fwnode,
 		return;
 
 	if (connector->funcs->oob_hotplug_event)
-		connector->funcs->oob_hotplug_event(connector, status);
+		connector->funcs->oob_hotplug_event(connector, status, event);
 
 	drm_connector_put(connector);
 }
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 0cd5e6b5034c..911c3b269279 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -6760,7 +6760,8 @@ static int intel_dp_connector_atomic_check(struct drm_connector *_connector,
 }
 
 static void intel_dp_oob_hotplug_event(struct drm_connector *_connector,
-				       enum drm_connector_status hpd_state)
+				       enum drm_connector_status hpd_state,
+				       enum drm_connector_dp_event event)
 {
 	struct intel_connector *connector = to_intel_connector(_connector);
 	struct intel_display *display = to_intel_display(connector);
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 4f65c97a89ae..39814f10fcd4 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1974,7 +1974,8 @@ struct drm_connector_funcs {
 	 * has been received from a source outside the display driver / device.
 	 */
 	void (*oob_hotplug_event)(struct drm_connector *connector,
-				  enum drm_connector_status status);
+				  enum drm_connector_status status,
+				  enum drm_connector_dp_event event);
 
 	/**
 	 * @debugfs_init:

-- 
2.47.3

