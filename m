Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E08E3B6370
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 15:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789916505; cv=none; b=oFdDVmG8Mx1+wjR8j26c6v0nC8UGPh7jUd49B6WJOj55/OscAmJBwQUWDnu2BASrREnHOKMngIbO9vpfTZX8a8JN3bm7oK7ftRhHmadZEqdTaDiAdfXpn6oSBmt9TXZdFNpnb8PfniNA6TJWUCYF2xLX98iiGqhGyIK8vXLZ47I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789916505; c=relaxed/simple;
	bh=W8+dSW1VgSZF8q215iEdhBX5ykoFxgbgfDkuRRpiXGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lgwZbQZT2c1QWCVvpQLtzxBMamngY7VqVtp55IZViryWavQFF5gYU9dMHtDYXp4CHJqxj+AR0EU2PZR0WtUr8z5v7pWFqp5tQxp2gm4IRg7SkEvbQ4Qsw8PQ6N2PgeJpJaF4fSDCAhpVCHDL0SCZL6Tm0WpvVsDz5ZjfesOtV6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i1mNjvbu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EMyGazA6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i1mNjvbu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EMyGazA6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBo25F2189545
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 15:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zStCBOCZUCMVPqW0oCjGuFnFZLx+MrPRud3qOX6ra0Y=; b=i1mNjvbuWlpROKjp
	tl2Av4keFL0peAw2HFTxnLXUiLxn8mKQvgtfq0/h+3+3d4Vk7pFERuCXG/uQ5BaR
	A7zU0GdXT3bwjEWGr1pcGqXLKYpRZ+GcdkH2MPABg+Rx0ZY7J4Wg1q0PDEcyC8EG
	JK1kh8QGfXlaJsP4r4grrDyDDt5iqDUKm5ocneMQEcB/aEZyHpkG9SIWRs0X0BrH
	jAIi7ZuegxB9XjW6DheaqyiS1zT2Hev2RCKzur0xNLPd5FimQ8vZMRhPvh3DpB7n
	DXuoQYT7n1P67fAEfwlpe/j53r763hxQ3wr0MOm28pLM3mTDCrg8qVf2qaCnDjmM
	m6IGpg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshqfu9mp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 15:01:42 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97cb32961e3so1421639241.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 08:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789916501; x=1790521301; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zStCBOCZUCMVPqW0oCjGuFnFZLx+MrPRud3qOX6ra0Y=;
        b=EMyGazA6PHmSIRUjSY0TstEMEUj+lIk3nAjok22GZtMPEm6m5GpVYMcPiWu6X3wbAj
         IWFhMyETMF+oizEYIRZGLv41/aAW+INM87y5tA6lbfQGBdRHQNwhdB6+6YGLFJZt/H9s
         U23FfRdXCNy8knkHJ+wN6SRYJ6Hz3UOI2qYo9z/1i3xjD3H+XvaBvSjSReM6y3zqhqER
         uNUJeylpq5dk2tBExIbmyX4STKTT7Q4GmF+vsDv+AQYJhyxpiCTHA93Sr0SFGCN/NHqi
         T6gznZmfXqa96MWYxiTXhi4CqB/HWla2TwwF8MoaVZpQVZ/oclsuDgmY9zY9+vPomDWx
         w3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789916501; x=1790521301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zStCBOCZUCMVPqW0oCjGuFnFZLx+MrPRud3qOX6ra0Y=;
        b=ZyHtUQnig6ezRKrvKP94V9MWp/pL39NxJ+B752IHcNVJNOw7mzfSzh85sYeccilf/U
         2Iske9NByj4o6jETyTOsmXkR5i1u+r0Y0X3hLZtyuMD+MKBX8Ma8f1BGMOa/Fo8WEAcW
         okRnbfxqzgM728A3Q+i6WqJBpmND3PaGAn+9S1a7TXC7eyQi8qRan0JY7CRwyzAi1xDa
         leN547guxnb+cyx1Ma4h8pmoDr7b18FMTX827KKsDfurR0IuC631KvGcjtDj3OoQ6IJ5
         h4pUf1QvQ8M+uAfmEMKvCO7XA2eYEcWCHrpc2voNgq6xlWXYUp0RE00z87nwYYiUqTEt
         WOwg==
X-Forwarded-Encrypted: i=1; AKwUvByXuRVzhQc0J3Q3W/aKjhEQawB4VZhCVzYOKB3pGXwr09Thq3uPp4phVCQxb6VXsh0JMQoZxuql9AMwpvO8@vger.kernel.org
X-Gm-Message-State: AFuF++l76x0aMnQPRBqlw105D1otZaiaZd6TJecTbrghSCbP116IaR04
	goiOwvzqZh79kp6V0Vc1E+NI9JYzQTs5kj9/TdOA5h/0cLh4FK1HsZXjtCiHGFIl+gKiragF32X
	rWVyvHa/2AMZFChNjKKUuE87Z4EQyIOY5P+RlcGv6TBdG0jGr5uBqIEf2FNRaFTTsbLw0
X-Gm-Gg: AYBFou0UcC02HpYInFUlo1Gm6zoaZyVwHe7bPQPk0qsEdnlVy/l04S5i41VZMu1obR/
	0frLR/Hr/i1jEimoSin6DYphuqx8/b1SIPatO2ltQh/euFLurdafkjTAz8vLDITz2QPsm2p0T04
	e7UgjoTeLyhqQmFSGCChHBkZOwykfbNV1G6YiZyb2mesjIPiNkJ5vi/+Bl8Sj/hefwt/qS4XOVQ
	i2JXH1wHBVRGBP8TF3FuQKlczFob5LNpf1W1yHBjtN/s36mt1LPMEdVlcz2FZYWj0XLakzPmfuD
	WLpmEqPC3WO7Lu9fJOaam1vRq56Gkxh2/Mi8OE3pvL2TfMUTH8fVCy7oa6sR+A61s8bD75U+b4s
	ASnAsAMUN9O4eXuunkP9s0x34I0x8iNLTKGP4H+9SFWvbkTfQeUMNRPrCj0Xb8nbeX5ME7RaVxk
	XBYm/oAevUedVx
X-Received: by 2002:a05:6102:8027:b0:7a2:2068:6e37 with SMTP id ada2fe7eead31-7a55c28ccbemr3816297137.15.1789916501315;
        Sun, 20 Sep 2026 08:01:41 -0700 (PDT)
X-Received: by 2002:a05:6102:8027:b0:7a2:2068:6e37 with SMTP id ada2fe7eead31-7a55c28ccbemr3816245137.15.1789916500850;
        Sun, 20 Sep 2026 08:01:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a6163d7119sm4090061fa.30.2026.09.20.08.01.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 08:01:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 18:01:29 +0300
Subject: [PATCH v5 4/8] drm/bridge: pass extra events to the HPD callback
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-hpd-irq-events-v5-4-ff1de0090c72@oss.qualcomm.com>
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
        freedreno@lists.freedesktop.org,
        Francesco Dolcini <francesco.dolcini@toradex.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5637;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=W8+dSW1VgSZF8q215iEdhBX5ykoFxgbgfDkuRRpiXGs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr/VHeWln0CRT8ndJl7DO8mpwH8QQf9pokn6b4
 h6oSogFWHuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/1RwAKCRCLPIo+Aiko
 1QdFB/0dCly5ef1TT2JBJq7MbiOMvtgxWTs7fwcZmOHeIrtXQCDrDLrdsdkK9cUFFX8uIU/kxxe
 PFQMDQFdm4FVA3BGIf2LVEWspNgrvGSJaYE9cWglW7QkdD9YjP2Bogl/6qY53ZUQ9B0lsvyH3Tx
 c4A75hrKrpk2+hRKKqziW8w3HwY2lJwSJDDf7C9FTfrZ3oSUw+HZPI7HXBB3qrTS87hbdJA+/e+
 eOCHYDy8ju9wCEgcMI174ZpLPOr0wDE3aV2qONKItsWfZvG3LxkV92cledQd8HWrN5vwke/Cjn/
 5SNKSrKGv4g1wOJWZzq8p51qwhA3fFhQ7fiKRb67FwKIq8f8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX+hXDLvRziU7V
 5YXbt55eo3ItWQsdvbRgm5xseV/VrGnSpwR7n6bXBVvT9TVV6pP1y8DQ4lOglHeqETnCuGcMpHr
 DDnR2BA1fvQ14kVyB5v4O+YGCD8xAUok7bqd25q9UsmeW2mSeeJ2E4M2R0Rvtra5FOPumSTR1Yv
 DQJmE4R80yJIvgDPlBC8mJlMC5lIp0+2hbSiS9k4pjeZ8zrAmCjSnFI7CgU4wotXmKMyOnPWw16
 sszppwf19cMSz8cAJCgeqfS6PMC+dXgFhwa8hfrDfS82OHp57vjzBFl8Kc2aMDKfHjBMY7z6/W5
 PNY7zfmx1r0/F5bChiCamgFod7/HlIbCF98UmG3I45jqPaHnHClGP+j4deO8rsvySbjauhe94KG
 mx9BBrQKfkEUvnuKACvMETqm09sLa+exDnGohb9/hUIHh1SpoQeK8wUKKMReEl8kNKBGHwP4n0q
 Tk/cAQECQqoLBBM/LXg==
X-Proofpoint-GUID: 2OARFpPUUj59v45lo-LzU_BIQg9B8YrO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfXyDqGiZkS1Ae6
 wKuByw76QmwHvKIAry9NeMO07/2NNodiCq07M5VAmmR1JZByVVKz1+s7CnIPkW0K2kJXg5SnjgL
 097Xch+XrcmaChYtJFMrXUvFrW+CcD4=
X-Proofpoint-ORIG-GUID: 2OARFpPUUj59v45lo-LzU_BIQg9B8YrO
X-Authority-Analysis: v=2.4 cv=XegcX455 c=1 sm=1 tr=0 ts=6aaff556 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=m8ToADvmAAAA:8
 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=x0urvBsf9yKnxdYdiaoA:9
 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200219

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side.

Bridge drivers report these events through the
drm_bridge_hpd_notify_extra(). Pass down the extra status to the HPD
callback, specified during the drm_bridge_hpd_enable(), letting
underlying drivers (e.g. drm_bridge_connector) to receive these events.

Acked-by: Francesco Dolcini <francesco.dolcini@toradex.com> # lt8912b
Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/chrontel-ch7033.c       | 3 ++-
 drivers/gpu/drm/bridge/lontium-lt8912b.c       | 3 ++-
 drivers/gpu/drm/bridge/ti-tfp410.c             | 3 ++-
 drivers/gpu/drm/display/drm_bridge_connector.c | 5 +++--
 drivers/gpu/drm/drm_bridge.c                   | 5 +++--
 include/drm/drm_bridge.h                       | 6 ++++--
 6 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
index 4bc64b2885f7..deb5d510a616 100644
--- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
+++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
@@ -258,7 +258,8 @@ static const struct drm_connector_helper_funcs ch7033_connector_helper_funcs = {
 	.best_encoder = ch7033_connector_best_encoder,
 };
 
-static void ch7033_hpd_event(void *arg, enum drm_connector_status status)
+static void ch7033_hpd_event(void *arg, enum drm_connector_status status,
+			     enum drm_connector_dp_event event)
 {
 	struct ch7033_priv *priv = arg;
 
diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index e347d04b7b2d..82f5232b4205 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -506,7 +506,8 @@ static int lt8912_attach_dsi(struct lt8912 *lt)
 	return 0;
 }
 
-static void lt8912_bridge_hpd_cb(void *data, enum drm_connector_status status)
+static void lt8912_bridge_hpd_cb(void *data, enum drm_connector_status status,
+				 enum drm_connector_dp_event event)
 {
 	struct lt8912 *lt = data;
 
diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index 629ff7095e87..03dbb449e0a7 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -110,7 +110,8 @@ static void tfp410_hpd_work_func(struct work_struct *work)
 		drm_helper_hpd_irq_event(dvi->bridge.dev);
 }
 
-static void tfp410_hpd_callback(void *arg, enum drm_connector_status status)
+static void tfp410_hpd_callback(void *arg, enum drm_connector_status status,
+				enum drm_connector_dp_event event)
 {
 	struct tfp410 *dvi = arg;
 
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index a51567d19550..f8aa2dd1cde7 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -171,9 +171,10 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
 }
 
 static void drm_bridge_connector_hpd_cb(void *cb_data,
-					enum drm_connector_status status)
+					enum drm_connector_status status,
+					enum drm_connector_dp_event event)
 {
-	drm_bridge_connector_handle_hpd(cb_data, status, DRM_CONNECTOR_NO_EXTRA_STATUS);
+	drm_bridge_connector_handle_hpd(cb_data, status, event);
 }
 
 static void drm_bridge_connector_oob_hotplug_event(struct drm_connector *connector,
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 58927e0d0191..34871e5b0328 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1549,7 +1549,8 @@ EXPORT_SYMBOL_GPL(drm_bridge_edid_read);
  */
 void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 			   void (*cb)(void *data,
-				      enum drm_connector_status status),
+				      enum drm_connector_status status,
+				      enum drm_connector_dp_event event),
 			   void *data)
 {
 	if (!(bridge->ops & DRM_BRIDGE_OP_HPD))
@@ -1625,7 +1626,7 @@ void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,
 {
 	mutex_lock(&bridge->hpd_mutex);
 	if (bridge->hpd_cb)
-		bridge->hpd_cb(bridge->hpd_data, status);
+		bridge->hpd_cb(bridge->hpd_data, status, event);
 	mutex_unlock(&bridge->hpd_mutex);
 }
 EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify_extra);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index d64a0ab02c90..ed9f77a2597a 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1158,7 +1158,8 @@ struct drm_bridge {
 	 * @hpd_cb: Hot plug detection callback, registered with
 	 * drm_bridge_hpd_enable().
 	 */
-	void (*hpd_cb)(void *data, enum drm_connector_status status);
+	void (*hpd_cb)(void *data, enum drm_connector_status status,
+		       enum drm_connector_dp_event event);
 	/**
 	 * @hpd_data: Private data passed to the Hot plug detection callback
 	 * @hpd_cb.
@@ -1467,7 +1468,8 @@ const struct drm_edid *drm_bridge_edid_read(struct drm_bridge *bridge,
 					    struct drm_connector *connector);
 void drm_bridge_hpd_enable(struct drm_bridge *bridge,
 			   void (*cb)(void *data,
-				      enum drm_connector_status status),
+				      enum drm_connector_status status,
+				      enum drm_connector_dp_event event),
 			   void *data);
 void drm_bridge_hpd_disable(struct drm_bridge *bridge);
 void drm_bridge_hpd_notify_extra(struct drm_bridge *bridge,

-- 
2.47.3

