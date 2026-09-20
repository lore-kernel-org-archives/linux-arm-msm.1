Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFEB3AAF5B
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 15:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789916564; cv=none; b=qm1d08WE6uMiQX5MqLGSMgw6mepEe7oe5GczBEeXQlugpMFyYKmrWmYNaNibe7g9SlFO4EnAsuI2SCYgK6sY+yMYeflU0Srs9pTIWH0epESKc9JxfkP1nNzbCG3J6o9w7ceB9h81cSMN1jGDfhCXbKO3fT9b2YeKqrF4krxOtp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789916564; c=relaxed/simple;
	bh=bY5FhyMu3eZPaJc1ltLzH3W13KWzM9lAhGrC22j7pKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eQ61qDoaHYP1/ZUbzK+Tvk5EjYDoWWwu3N9EfOBThYEs1p1tcH6NirO4uFx+cYjd/Jz/I7JJKcF02NvLDY35+Tq1rUKwML30+p7GKjYvOUuZ9fH15G7gAY+WhZIuzkMAGGbppkl5sOVgSihRsxY9BrZ58zL6dmwBw1ce3PFL8Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LyhU/NIf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UF11s+UV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LyhU/NIf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UF11s+UV"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBo5R93271649
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 15:02:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=; b=LyhU/NIf6khqaz3X
	f2oMgJDFkUIx2VNz5QCZqmwTUJMGy1g2VGuy+Wa7qDxFAGlsE9RXPhiwx5BReQQj
	J8IcQf1B6LrThNm6c1DYOZCJZDP+hh5/P62LijFAbhdFvjHu27egGlxk/nf2Kyb6
	7NC0pAG1EDnjKuuY9+GxG+jDsCehoXoRSk4GGTDvCVjpMeJWckVMgxSHL0ZNj9nJ
	zmsoWAl3OS4X7vNRxGLbkmYVC5JcA4rpMJmhe0sdCQxhppVjQifaeLr78HIjAHXY
	y6zfaK08WIFaGiWEK8VCCsLoJzvHn0fOu2jsFZ22Qg+icvuZkh63AH5r5DvNlYhs
	AdYkuQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshbsbc9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 15:02:41 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-78830f4bebaso579008137.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 08:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789916561; x=1790521361; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
        b=UF11s+UVtfJELg9HLpeQDaqrOUEnBu3KXvmrgO9n0NxptYu5km7rRnK1iuOhrvNvGJ
         /UMBS9jYYI3ib9I8jrSJEGj577c4uRocYWrfRGxbgDJ0b05tzkkXdFm7DuzvhkmvKNYn
         7x5T4js88J9y56fgYX0dbTGxf4wG/7NiUW87pr1JGtjVGQwFGRn8d4fMKPFst5P3QUEO
         Vp7J+zR7IUFUfPFSbd4uR9sXD5j6/vaxP5GcTU7QGY3dDIXQ4A0HQTxJ1b9VKRMk+9Pr
         9G0t8Lsl9d0LV9ls74PJjC7zWy8FWc9OC+EjBY3usEaBgOY8UxGt5ScrY9GUiegHkY0s
         g1AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789916561; x=1790521361;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZeC773TKEYubASujmMTo4cYzyXvzJFRJKmRo+UPd0C4=;
        b=kYMwvcbEf0p4twFNqGLcyzedmAITajM+CidKudwRAJ65vzYZ/qkHrzSdg+JhZesFq3
         zhhrxgrrGkdwJF+EcqEHEC6Tm5jejIilflZgnjGSZLjOLvYuph/Od80ju4IlKKRI/cP2
         Z3qrcSOIT7K1RtEyxe2mqBjC061gh9AT8hvySieWgtFqNRFDIfqJQybA8HYaF1Gl5ZF4
         78lwnYnhAEA4Nx7N8rDeud6ThzBLU1x8MC5SX3WXHl0Y+eaRbjyKAVg55s4yko5R0hSq
         Byic7KUoJaF7Y99n72sDDDIpS9DBUEJxl3vd5/D1qAbhDyt4BgNBbduGD+fGgu0aDmi1
         Lkzw==
X-Forwarded-Encrypted: i=1; AKwUvBykBYEgd9+dwvoNfXMui3BpbZJp3BnjzuF5NK/a8QeEGt6MaK+Cbbg/CjNaV81Aowl2mGlrtif3HkN/KK6v@vger.kernel.org
X-Gm-Message-State: AFuF++l14LcMPp24GwBtuP45eVSgCXInWAEJA4alqwbIsu/cj4LMror7
	GZLKmmpJr3Uk2ukERfa33MTQ2NgIAnPcKP0v3n29Ugq5PKnNRVfvJFPk9fcp6s4TlHQ3VGxGEh6
	cDhN8GbLaM7VIbpIjN55/jIbYLmDBNMRVpGgYFMrAg9EugTjZX0bK8nmcmPz0rq2ECtUQ
X-Gm-Gg: AYBFou3i3KI0zLeyyVTt7VS2G+BDHlWKlLZpcA6rRZOami67sTMEqhtca290hlMlZcr
	T3M8Zo0GsxM+u7yMQVo89o6h9QEYxvVGEWiwtBKuUz4eTEU18ZvNso96PEN1QPTvPRXAKvfFzv0
	L3mLBGovCFeKbyLfPYDnqEZ+eMOXFAGysjGlpAUBWv0+qxc1H8oGie+tj/Pgmmp/+er0lqYHDnb
	rAQUc1tGvwx2/LcF97gIqIPja5rkyyPhQS89Qt/zYyaMTVYCksNXHFuWXQOI00VPuBRueQ8ToQx
	A/GQNNgdoKuaQUaLrztUaLYdwuGhUJp70lwyC3/tVJt2Un8hfXYuHZwIiO7rZEKt1U+H0tKUc6z
	Br7GCgmcm0e+uI7vrMQe4MB/BwHxdj4Wpg6oTJNlGxZEWHfLO/9cU85V3wWNZvRYUU84MM6kCk6
	4iugIW9gJlqnL8
X-Received: by 2002:a05:6102:370c:b0:7a1:f7d2:e80c with SMTP id ada2fe7eead31-7a55ca8a2ffmr2385245137.20.1789916541209;
        Sun, 20 Sep 2026 08:02:21 -0700 (PDT)
X-Received: by 2002:a05:6102:370c:b0:7a1:f7d2:e80c with SMTP id ada2fe7eead31-7a55ca8a2ffmr2383773137.20.1789916512407;
        Sun, 20 Sep 2026 08:01:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a6163d7119sm4090061fa.30.2026.09.20.08.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 08:01:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 18:01:33 +0300
Subject: [PATCH v5 8/8] usb: typec: ucsi: huawei-gaokun: pass down HPD_IRQ
 events
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-hpd-irq-events-v5-8-ff1de0090c72@oss.qualcomm.com>
References: <20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com>
In-Reply-To: <20260920-hpd-irq-events-v5-0-ff1de0090c72@oss.qualcomm.com>
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
        Adrien Grassein <adrien.grassein@gmail.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
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
        Pengyu Luo <mitltlatltl@gmail.com>, Nikita Travkin <nikita@trvn.ru>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Francesco Dolcini <francesco@dolcini.it>,
        Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1516;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=bY5FhyMu3eZPaJc1ltLzH3W13KWzM9lAhGrC22j7pKg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr/VInUmy8zA1nzNuEwUoOY5JpzmI+vHj6DFGd
 p2t16GjXiyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/1SAAKCRCLPIo+Aiko
 1cByB/9kaXaz9ejico38hBPR/nrKnSJ2+GBGrC2HgOUCqVJYVBl+wD1iTcC0lJ1lI1rVVoFb7hl
 On3AdOhJDRB7INjnKzoO/CrkukNQF5hbG/cma2VXE4Wvc3IvWqmYsU2XXYzqzvF/P+iJeVE0Jf0
 EQp/vND7wTm9P84MwrqonVtf5jamrmZc3eVaT3GaV1v2rAkWRDCqWJlnB+G8FmTWc+B+ZxGGfhI
 v3WNe1aScNk+JZC43arleaguKrx55HU4VILKhUhERhcbTnG5cu20D9ZweEcwC/CL1hIBHoF3LdK
 iFd6uyPvdlFK5oHvM8QmmRcWseuO/xY+v5QAxeh6NfTfCBtw
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 5LVicQ_qv8LDDB4Oekc_EZLGWGS84605
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX9vTtum9NwJAh
 vl7W3XXUXGFdRhJ+FypXOM5Q5E3E23Kg4VaHv2hXsRDcdmpLsmWjXeKFIpje8edjwy5EHnoWFlr
 iHFwd5UkscZs2zUoklsktzArNNikUwqQQNd1kAYemw4LUWCA+f/WYLywe9rFek+QnYed82CzBuH
 8g3FUFEeERDketTvRuCEcppSpyPDcV+5/PAeStCUnP+FaUf9Lmgy6mUw/TvlG4lEZm/oHqrodTj
 tje+gYQaPFucsXrrOItPoqavWRmyXVMRVOg5zpSGAsi9viNNmKdSRkyw/So92MzUQ4mrefIgH/o
 Wptt09pS66VykWmvyzg/SZZ7CfMjqv8KWuS/YbhO8WroCJIMFYLtiyrLmYhFzLss6We26vdAZht
 Oc5Mex5onFu4KPTQTPgPSCAzfMODx0oN+LJXmXPeaICKwla47WzrwCtqA/e8NMwPrGOfZJWTImJ
 3zKsdpRDhpI0HxtkE5w==
X-Proofpoint-ORIG-GUID: 5LVicQ_qv8LDDB4Oekc_EZLGWGS84605
X-Authority-Analysis: v=2.4 cv=bPqDs/+Z c=1 sm=1 tr=0 ts=6aaff592 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=HJ0TMOZLSqZlwYNULgAA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX9TL7vDxAKmXy
 Ji0+t0xqu/AvqaTxNlKtncsqThaPvICVPuvtpJAA7No3GpVCLqBaS3+8S1XJhKCH9+yrInSLJsp
 o9qlimwrWwN6CtqvoE5J8rNwS29sVV0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200219

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Pass IRQ_HPD events from the EC to the HPD bridge, letting those
to be delivered to the DisplayPort driver.

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
index 57b37fca150c..cb0312e2b8dc 100644
--- a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
+++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
@@ -316,10 +316,13 @@ static void gaokun_ucsi_handle_usb_mode(struct gaokun_ucsi_port *port)
 
 	/* UCSI callback .connector_status() have set orientation */
 	if (port->bridge && port->svid == USB_TYPEC_DP_SID)
-		drm_aux_hpd_bridge_notify(&port->bridge->dev,
-					  port->hpd_state ?
-					  connector_status_connected :
-					  connector_status_disconnected);
+		drm_aux_hpd_bridge_notify_extra(&port->bridge->dev,
+						port->hpd_state ?
+						connector_status_connected :
+						connector_status_disconnected,
+						port->hpd_irq ?
+						DRM_CONNECTOR_DP_IRQ_HPD :
+						DRM_CONNECTOR_NO_EXTRA_STATUS);
 
 	gaokun_ec_ucsi_pan_ack(uec->ec, port->idx);
 }

-- 
2.47.3

