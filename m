Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BD03C9EF1
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 15:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789916509; cv=none; b=FfN56tjaQIxwo59we6OFcPG2cqTDVsVn+mtPtEaFMSmFn4Y7shQT/72yOkj3q0tD1tm/bawEK7+IoRLYo5y9xQIpxdm84v5hJ2sWo6Vphnh5jIZsOq3xfHmZjXKIluGMJCDsccGrmIbLOS+Gyaw9a4HsP/eIW4vPEUeElK6grPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789916509; c=relaxed/simple;
	bh=LqgxKNIayCd11yT2swAvULzdCTzONMVvVLs923p01rQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=obIXBKd4yjtF7L9g00AZ2f6qjuvfCZAvtR5gaMisAXAJ+BcQflegb5+wm1TSn0Iq0575kdzx8tiZriEzyNc+3aFFgp3JY0LuDL4NDqGdvdmLuD6Q4zm72gRNCbrrHC3VOgRxplAfeuWq3QuSCnps1QBLP9QhXuorOuSlWMz5vHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fDwitiGU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V/6mgvXQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fDwitiGU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V/6mgvXQ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68KBo1GP2761246
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 15:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zILDMV5aJdTVWYsuq5jrS2SETL41wPGqdO9GUGkM2FE=; b=fDwitiGUAlmn+T3A
	wgOVHrwULnPTDg9jDbWTok799UNFv16tdbaqlNDnLjhMmTZ4b/rU7ICOL2q5n0ZH
	AEDkUcQGXBbvDcKLQBGELs3KXEfYcQzEHcH2eUYXfIpa5OTilkznskHsMWSSBgTV
	A+h/z9K45JMRA616ToMAoA6PfP3WOh1qYXSYGEZQztA+1MFiVP14eezAXuRPcUt5
	ZqlmlL03hNR6ZQgBZgua1syuym1OVKxvGp2EGHog1lVZ7YoxlL2UOtG8Qs4BT/G6
	JMqimxdRVwbv938mTFpEAiGczcn+pNEXuvnZE3zw8fAVJRae1FL+UYbzbs4NOc0/
	lkRxrQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gshd63b46-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 15:01:45 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-78580a6b2fbso675563137.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 08:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789916504; x=1790521304; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zILDMV5aJdTVWYsuq5jrS2SETL41wPGqdO9GUGkM2FE=;
        b=V/6mgvXQ1QZxS5W0XGvp+ODJ/PpEOySc/AHQSBGgcuIMsauVrBlcf52j9Cg4YCsY7H
         GBA/rMMgrPSPSkvv0TDWrUSd5QnCezn0S3NAs3AemdL76zuT0hkjT61rU14AzytYS1aH
         BNArtOKiMrSeOkZwWJ+NrxNQqF2myx7g6Wrvqc4pYivs8J3UiOVefMhkqRXRJ//6zi6F
         MOkBXpS9jSVtHSTfYeBBtnHk/tDymdeRrS9GmhL5FWAK7Or3TqTG9kJWY4DTB/OI7gPS
         DH0lkVPWx0zuAgd0eELk5PeZXjyIEZyFcZDKhWggr9QT7R8IsYRvcvvqroxzl3GegtYT
         9wAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789916504; x=1790521304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zILDMV5aJdTVWYsuq5jrS2SETL41wPGqdO9GUGkM2FE=;
        b=cexX1LKM2axgCFLCze7arZEpluToZrOQwx2qsIps+pEKrNvfMOJDFGhJJO51CzQ80D
         oEacNVbLvrs3Nv+it3S/AcO32Hoo8yCcI14UhNw1dIrMKp/B3A2ZR633Sm5HvP3duD9J
         C0D3JTsrUSO8RkK9O4z8lOvpCv17Pz+5rkqY6wbWtE7xLVeEP/0xagSfVS6zHBiYAaji
         zoAVBJZL+/nwmW/l3d3OWxOnn/pDpLcTwhstZiIgXrUumiOZKGOxaDRKxklsZyLk6bYV
         31a/FSNDlWjkUwKfXXA71/vf4nexMThOXM/KPSKGnlxg7FWD7hGWiy5OCocRphUDy2S5
         oGWA==
X-Forwarded-Encrypted: i=1; AKwUvBzdd4Z7kdgL+UriWOxpn2d/sL205eFzeA0S35McmS7ECgvYOuQgyBMdQZM9/D//Q5yPpgTIi9QnXYGquuHE@vger.kernel.org
X-Gm-Message-State: AFuF++l3NWee+4bQjNE7JfOnO7VKcHbj53Gea5eVvjjNNQqFuYlfzEJP
	j27WRnGg44Q6kc+qAFibyx+C9HiTf17l+YzKrjHCvPRaueHi5sDPxIETISfLGl212gLlou1KoWy
	3cPzvipCWxgWD3Jqrc9GAt7eOcbuYps+Ax6x+XqgDMmVA5GtBik/9GXcjJnGt6/aCJXze
X-Gm-Gg: AYBFou0y7LbcderDnZb+qjXBNd6p74V5vvjhyniI2Uo5JXV/KLj0s9X6RU+cME3WGeY
	2R9wQ5NKOFizn2shcUvusFedItQscsBo+JfHHB/7fzkggSr29N0huvYVds8M+nQWNcbgPPCiPMA
	SVR1VQS20ixdJo3UVAC4V6+byH7u2YvZOejXszUFbuNBuwvzelel6ykTXEB+nwxJLxnZGFfVcFW
	vXV4CWV4g3GDdTHUIEVUhQTuQtgUm4wvbh950t2wHwstfSk/uju9yqpiVpb4wN48aiY0XPas1vv
	Kv5j55LLmjD06Yo5Ncey+AhY9bL5F+nkLh78J4KEz6HOMuT+c+0Go3DrAMM0mZTGDM8hjxpnrKF
	spcBEd/Zoqs/FF+RIR0I0VaMw66fGaWFMC6meMs3mxFDQmE7T+Dq70wziaKI3/WlYpmcWW0SHLi
	LYhz1rcp+JpUmb
X-Received: by 2002:a05:6102:148e:b0:7a7:196a:84e6 with SMTP id ada2fe7eead31-7a7196a9b84mr1109491137.30.1789916504271;
        Sun, 20 Sep 2026 08:01:44 -0700 (PDT)
X-Received: by 2002:a05:6102:148e:b0:7a7:196a:84e6 with SMTP id ada2fe7eead31-7a7196a9b84mr1109380137.30.1789916503710;
        Sun, 20 Sep 2026 08:01:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a6163d7119sm4090061fa.30.2026.09.20.08.01.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 08:01:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 20 Sep 2026 18:01:30 +0300
Subject: [PATCH v5 5/8] drm/bridge: pass down IRQ_HPD to the drivers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260920-hpd-irq-events-v5-5-ff1de0090c72@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5130;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=LqgxKNIayCd11yT2swAvULzdCTzONMVvVLs923p01rQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqr/VH0X+ZgDiNdgzP7ztTorDWrfF/sYFMWjIJ+
 AFYEh8ij4KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaq/1RwAKCRCLPIo+Aiko
 1dpmB/92Rev8krCBc9OkmzcO4nICFFJMqs1wwor+LYDE1FIuzYroa9qKYU+ewIsPOeIt8K8t7Hp
 Gxp6nAMJTPtAjZdxhgkdecOWQfp4RIJhtTsa3ahM4r8zY5uuXzrEaGYJ+ZGNb6j8FtRUK8EgEiP
 hOpLZguncW4ZDHTzc3E02aMh1s5I/f7f2CCqHzJRxB+H5rYG4EXSBWER3OuELSZ2vqKLTcEqQeg
 y1KaNlpG72U/h2VtMdheehS2cDOllI4OKq/e3bBGrsryLHSF2rSVptWk/gJ9j+M8heIaZdyT4oT
 9ardZe07B+qSesrCWyyiQcefaFdPO9NmF0V/cmMAPR2I2+bi
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX0evjgWGDdbnq
 JCxcA1Dvl1oLsjyHmQvS3AFQAXMmIpp3rXMGaFm952rKcknzRDxh48fYN2taYtqy8ijplc/O6n6
 k10F9CtqBHamOg+7jFfMwSJto2PEb2ZaQ3MjIPkQW6htJALqnqH8hE+zqQli32LjLnQ1ExFC6fk
 g6RXSaDZD26SOF7v7uhAN0e+WEqUyAUTxDGUOAtfmUhZzIIY55YNav9V9tnigvnvSGct71itCkZ
 n1HjxcTtNwAV00egoHg7yYfTjiMemAKlfEJ/eVvXNtMrdW82YLuSbTU0NQWiovD7rrG734dcQsx
 ZFY+pe4IB4Oz762XrNqwGzuKBjacYIUx3XsucTXEIngz3CS1WVaBqN00iiBbwtR7/AubtNS4vYR
 7AdQv4s6ISQDnRuDiFqUS1mmZ+rTcdAscI/h1n2A63OpFzEvu2k0zi7xPQvGGnhD2l+bjdhIczZ
 wgQMlntlvnFjepyRZzg==
X-Authority-Analysis: v=2.4 cv=RMQmjIi+ c=1 sm=1 tr=0 ts=6aaff559 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=P5073aSicUuGdIvNCfYA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: -16E-xxLVCV3djSiVNFHfPbmL8xdS9jB
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIwMDIxOSBTYWx0ZWRfX6KizBxfYelvk
 jqLv+r51o+AV63BtrLoJxBM3A8OLrphmXNnA6hM0zFwUcAvgQ4MG/cVeL2FSCILlXibl1DriUNi
 HXL2KeaVYMgsA/Xlh64tLwUn9f+Q3Mc=
X-Proofpoint-GUID: -16E-xxLVCV3djSiVNFHfPbmL8xdS9jB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-20_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609200219

The DisplayPort standard defines a special kind of HPD events called
IRQ_HPD. These events are used to notify DP Source about the events on
the Sink side. Pass down the extra status to the bridge drivers via the
hpd_notify() callback, letting DP bridges to act accordingly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     | 3 ++-
 drivers/gpu/drm/display/drm_bridge_connector.c | 2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     | 3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c            | 3 ++-
 drivers/gpu/drm/msm/dp/dp_drm.h                | 3 ++-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            | 3 ++-
 include/drm/drm_bridge.h                       | 3 ++-
 7 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
index b3bb7f2cebb3..b1ffbab89a16 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
@@ -429,7 +429,8 @@ static const struct drm_edid *lt9611uxc_bridge_edid_read(struct drm_bridge *brid
 
 static void lt9611uxc_bridge_hpd_notify(struct drm_bridge *bridge,
 					struct drm_connector *connector,
-					enum drm_connector_status status)
+					enum drm_connector_status status,
+					enum drm_connector_dp_event event)
 {
 	const struct drm_edid *drm_edid;
 
diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index f8aa2dd1cde7..083d70017f02 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -150,7 +150,7 @@ static void drm_bridge_connector_hpd_notify(struct drm_connector *connector,
 	/* Notify all bridges in the pipeline of hotplug events. */
 	drm_for_each_bridge_in_chain(bridge_connector->encoder, bridge) {
 		if (bridge->funcs->hpd_notify)
-			bridge->funcs->hpd_notify(bridge, connector, status);
+			bridge->funcs->hpd_notify(bridge, connector, status, event);
 	}
 }
 
diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index c4355c5cc340..a637613ae2e1 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -323,7 +323,8 @@ static int meson_encoder_hdmi_atomic_check(struct drm_bridge *bridge,
 
 static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
 					  struct drm_connector *connector,
-					  enum drm_connector_status status)
+					  enum drm_connector_status status,
+					  enum drm_connector_dp_event event)
 {
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
 
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 4dcbd9b99d06..9308e373447c 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1540,7 +1540,8 @@ void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge)
 
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			      struct drm_connector *connector,
-			      enum drm_connector_status status)
+			      enum drm_connector_status status,
+			      enum drm_connector_dp_event event)
 {
 	struct msm_dp_bridge *msm_dp_bridge = to_dp_bridge(bridge);
 	struct msm_dp *msm_dp_display = msm_dp_bridge->msm_dp_display;
diff --git a/drivers/gpu/drm/msm/dp/dp_drm.h b/drivers/gpu/drm/msm/dp/dp_drm.h
index da412c788503..8f2f4201da60 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.h
+++ b/drivers/gpu/drm/msm/dp/dp_drm.h
@@ -31,6 +31,7 @@ void msm_dp_bridge_hpd_enable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_disable(struct drm_bridge *bridge);
 void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
 			      struct drm_connector *connector,
-			      enum drm_connector_status status);
+			      enum drm_connector_status status,
+			      enum drm_connector_dp_event event);
 
 #endif /* _DP_DRM_H_ */
diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index ea0d749265d1..47fb10628125 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -430,7 +430,8 @@ static void hdmi4_bridge_disable(struct drm_bridge *bridge,
 
 static void hdmi4_bridge_hpd_notify(struct drm_bridge *bridge,
 				    struct drm_connector *connector,
-				    enum drm_connector_status status)
+				    enum drm_connector_status status,
+				    enum drm_connector_dp_event event)
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index ed9f77a2597a..2b3cad4bedde 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -509,7 +509,8 @@ struct drm_bridge_funcs {
 	 */
 	void (*hpd_notify)(struct drm_bridge *bridge,
 			   struct drm_connector *connector,
-			   enum drm_connector_status status);
+			   enum drm_connector_status status,
+			   enum drm_connector_dp_event event);
 
 	/**
 	 * @hpd_enable:

-- 
2.47.3

