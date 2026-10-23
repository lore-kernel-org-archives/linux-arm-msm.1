Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792762834;
	b=no6lss3+KyRmZ/flY1dbc5AVpaRNl0scrLnC85UCddaI6RKjarD5GN3vnrFmccOfo0Gt
	 jegytRy9Jdi+XI32fotxE4FN/i9LOtrrDorbuDrHLGRuZ7ow4i3yCRtYensjHybavYNSa
	 xoaw4Ug/i9BQfqBLeKGDdOpxew16NQQQ9ot+FeH5jy21fDNXJPPxRbWpRe4nDTplqVMZl
	 UfsP8xjGRfyfSx+LbrRayQYP+V6cuECvnSt/14klFYXdpaS3y3PAcDGxlpKo8qva3c/6c
	 1URnXylR+r3atRbUgVCKZ6oN0Ul62jcoJdnFITeObCO87P0suPAIb776URJsQ9o8LhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792762834;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=;
	b=AnqQ0g5o91wWdw7KFss8JPQW6IrW2crbnEfY+r6EYt4b6OuUqMW2DGXQbzU1lPr9B+VX
	 yAzf9YYF59X9xj/tdx3gUVX5md5HxZjZnfizZc2uMImkMSjmBtl9icOXk/vO1oCeG0Jkn
	 fjwBbBRTXJmHPNQ+WcpQy0xq6onOJwnxhifcEVxwWGXWJ/kKGsVw9Q/T8cV5N2tX+IINZ
	 PnDYDI02ABcmxaugVgLk4dix5AHD9fQdNrB/QZrFfSh3QbJopmlOT+0SMzDHtFyLhaHMi
	 EGlv5XCLeNxfI+tg4Cslj7MX+cRSA+uA73GczT1p6Qs3h4v0szRjzLSSEHXf2/LpS5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=poibAIZj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hiRjmTIG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D0D60A2611
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 13:40:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2D0D60A2611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=poibAIZj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hiRjmTIG
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAATIg3550517
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 13:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=; b=poibAIZjMsIdwMDV
	XD0Nb6ZGIrSar5g+ftoe7oeKR4r/ureliRS+fwtmnawiJ124haBPlC8VnHayoU1N
	P+JeiFeN3xPm7y8+gcXnNENnHMJrr/xtUeyzGXMpTmEdMwTQhyr0d2aI3MmuXaAU
	NBtFKojVwK1FFS92X8KqitmvSbY2xcZfHPhMk16BrldUGmALTTXYs6HaPbP0d7en
	bPpD2ylFczswpJvRbbZv8s/LmSdSc+unVFBJbmR8A67mOlzTdIKgzne428Q+mtmJ
	1LAIpPPnbJm1Xq2ZRL0XDKy9G7vIYgbuRsZidUDN0PR4Pij8xI9FnjlwehYDDLcs
	gNs3Tg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmrbvwa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 13:40:33 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c26012cd0so15448531cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 06:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792762832; x=1793367632; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=;
        b=hiRjmTIGfbYsWTl+OZcO+UiEfUDHbz0L72/2FJkAsOUSyDdnK3B2h8qu5OVO7jCXCk
         ee5VbOVervwWkxurV7c72j49HP5Yeb1ConVoF2MaSYQZCKxGtSOsd0GHWJQD44atfi44
         1a6Gfv5XQio1EpcAB0clOY0vwaa7QVHbewlioI5N8stQukjv6PUxlIPPMLoGPiQqmUKR
         HldNCZEC+8CNQ5yeAhQpGk21muZlh53g3ef2+7oeSkoU3nbK2YWeonvYMz73Z3RvR7+S
         UbB7XETFd8Sa9tquOpjAmFDTY75OLeuFv9SHWdSh2X282mJ+p1AiYvvuKa/qvp21hpBS
         e0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792762832; x=1793367632;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=31r1EaH4MCPxAQTq2cHbU5NR/uyIR6thPFjexZfrw6o=;
        b=T3r8/X+V90szL3YjrXuNWLUz4SV/mL+mdGSy3MR4HEfMVPC55Cak1Ysq5tgrSEdyOW
         izXdsgZyaNVDEc0QVrUEL5LBTHzNRBvx2qbp7M8KHvJrYY+RuEyTXqf0d3RqbKF5FO/G
         Z21R7dioCDLMK7hr6Gtae981zHQiuSZ3+BDkElSaSFK7jK4eMqXTAShrKXehf4RGeZAn
         NdCwIBWuG5Z9SWvdPUxEsJbRR55uyjd/4AdRo9xHvDbiD8SbxioZwJB0ryvv1B+1u5Gx
         6uuHEyldKkeR8uRNR3ZkYQF1hLPrHg+n3J6Oz6r5Xn1nh8Qd5rN4FTbp5G8q3rKU2M0d
         HLlw==
X-Forwarded-Encrypted: i=1; AKwUvBykMfl4jgk3Lfoetpj7nK+Sa0eJe2Xw7OGv9H4CFyicfSGqqkN9ybOfmSI3m8C9VrsuYFneDjf3jcx0ac5/@vger.kernel.org
X-Gm-Message-State: AFq9FYISsbqjvdkUDg3o1K9Mv/Ldj73BZtICrm95+6uD1sRa4vzf65aT
	v49Juh2FvDib4Oysn+KCwOwsr9lXD13wC5Vgk0Rn9DYwypDwMfMxB3PDsUztFwV3CwhOZdTAqc7
	wlJjdVaDi1ulwVWuSl+yGpmJ5+LsBdHfqwbk2xifS4jBRA4e2zoVyVz1P/INHu8+Y2Q5u
X-Gm-Gg: AYBFou0DbZOBkbxG6fco3Ioo+kktp6xP6a4qgfZk8DaLgLv3+uu5e3lB8zE+oXXV7nt
	JvwPcXnT6qdK0U3SkLetYSYk/njaIAUOrR9TFa3nQwShiLzowvSO6zdcTX9Uy403WqXUChQefVy
	6NY4ZggLsNTU5TTwn0gjIcYt8ZV2ZTUJEHGlqOKulsM8BKbtUm5n9LItCibSb10iaqLatxo611R
	0ZHSI14wYRwGGrqFgT0JrmZIf6SpNUM4WOa/ZRyochoDFI9COKOJT8Cg70cXL6U4DnmhNAcdaUL
	HdVIHexvPunQUq7MEprYWB6KS+XANnyWtzDF+HTQy3R6TVNkjYxWegVEP1KeIEdvtj1KqUSdnVR
	Qay0X7SdoohGz3IojF5nARmqdvVVXeouvqoTBOIbaoSJgrZobPxh8TXmeX+K0rBuaBXlOhDJGrR
	+LnfPiXSbw/zEV
X-Received: by 2002:a05:620a:4514:b0:93f:35fc:524e with SMTP id af79cd13be357-93f6f7963e4mr426446885a.35.1792762831967;
        Fri, 23 Oct 2026 06:40:31 -0700 (PDT)
X-Received: by 2002:a05:620a:4514:b0:93f:35fc:524e with SMTP id af79cd13be357-93f6f7963e4mr426438285a.35.1792762831367;
        Fri, 23 Oct 2026 06:40:31 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac65ce14fcsm5309701fa.7.2026.10.23.06.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:40:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 16:39:48 +0300
Subject: [PATCH v7 8/9] soc: qcom: pmic-glink-altmode: pass down HPD_IRQ
 events
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
Message-Id: <20261023-hpd-irq-events-v7-8-57a3aea3f09e@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1477;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=jYsdop2BAded35utDpfgQd5r9JZyyy8UmHQPRLGSyhM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq22OscK9ARrM0xnQy9PIe02PuQJWITjFRTOxcw
 EIXvBeXIeuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCattjrAAKCRCLPIo+Aiko
 1SVnB/9eqhMlFfXEGL7sx5uXnIsBFG4ztodN0vHA/44YV7W7G1OooLgbsvOvIpeBP0kk5e5Xhco
 j1tEinkSJoggU0cxwS2Xc9lfcqEmcMxaUo+LdMPd6j4UyQPiOiKsO5lJfHqCDXACMtfwP3c5K77
 YVat0zINwIdZaWq981pjrXiShkMmW7ZQGmd8rt3No0CePmXgOdV+xTS/b79D3wsbb6tiSGUOg/3
 A9g26pbXGiiAGGY1vEM01YKIFcpTtym6NCRX66BMn4aN7mb99cUWHM4OWQDs4doSiyeDmJrMeKF
 MVvCWf8Tx3Bz7WNIMfMzZpHZlXLooV/h/qxj6hCGoxZBslSn
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: z9sQYr2ZbwauLCIzA87Cr3-DnI7SdJ1t
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfX9bnfotG+lT+l
 6Y7bxJQYTHOeIAI77LaKh4+ToMeGUEcTIhQ4xkwlkYq4s+5CSwqnXNfGphsyjDWuWzhskW4xUJl
 DKSSEicJcrJYB0KfIIUydE4ttTEVUIY=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adb63d1 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=Wdvqb4HS36tEXOME5F0A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MyBTYWx0ZWRfXy61/eZ0srZ3h
 XekSE+xKnqufVq7Smrox2ZRGtxcxIMgpgaV2QaovHuL08J2lSZBSoa3seG4dgJ24EOgWdJIfj19
 tUVb/1BCxzNF1vQ2zT90rCSKPASOAUf9yaXKWT0aexMKC7CcexTjVh+2HlR2hnhCiUFm3UoDEPG
 i7wLbaGDtkTgOpuhP1lqGlwAKqZ8QV8dFWA9KqN61Mx4/ApK1sUHpIt0y9rGwZt3GqkXsx5QDcZ
 JsWTCxec4hhQa3jHfPpc4S6rlJcv8TRlBU0DfQizMQTWGuKj5FQSnPF9ly48mNlA8sr8dRHyLTY
 v/fbC6eX0AjIbZBRn+ZN3CaiqXBYrN2tw8D31tibdpS34aBo1YJXI97AL/NSck/OiWw0iLUmhu6
 +iX5QIYFu1JKMY4wQFog/XuhTg6lqFjJpzkwMp08RyiSxRNlN2reAfgUD7o2CcjLCk7aTMxDRN5
 Kl7+VfoBFtV86wyisJw==
X-Proofpoint-ORIG-GUID: z9sQYr2ZbwauLCIzA87Cr3-DnI7SdJ1t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230053

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Pass IRQ_HPD events from the firmware to the HPD bridge, letting those
to be delivered to the DisplayPort driver.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Bjorn Andersson <andersson@kernel.org>
Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 13c434f8d03a..c463b23c99d3 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -374,7 +374,11 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
 		else
 			conn_status = connector_status_disconnected;
 
-		drm_aux_hpd_bridge_notify(&alt_port->bridge->dev, conn_status);
+		drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
+						conn_status,
+						alt_port->hpd_irq ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_TUNNELING) {
 		if (alt_port->svid == USB_TYPEC_TBT_SID)
 			pmic_glink_altmode_enable_tbt(altmode, alt_port);

-- 
2.47.3

