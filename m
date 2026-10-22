Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792675703;
	b=I42Mr3VjrDOkC+ciMeKX5iICJA4iqvK34l7EnZsWrGjNFDHfyYZ39xAoD+qYu4mQ6NCm
	 K8A0PjY6ppRVW5tTO+2RqjJklAloJ78exiuEj191YygQI+CiQygO81DbK8zlu+1CDdey+
	 FF3KgiKQy8n4qp/tNPfeQ/EC6Ka0JzqjEZHSyH1WeQGsBrsLAGZSrGAc5x5htp+EZghYC
	 wrkU9MGSKN4eziCxxf4Y75MxYtAhYn3DioDQpkkf8Bg2iEtCZ7wDflP/SmQp/ftOh5/PX
	 uWTdYIGSQMG/VCnrKiark+gVCJoVoVu3QH8pK66Yaxodht90NCQg3VqhfO+tSBPLcMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792675703;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=C+3I/2A1U+Gp7I1jsF91pZcgO5n0gv+qfSKmmUyDmWI=;
	b=IrB9U/i45m0ns5Qco7XcWjzl40ZIPgsVk/OU5LS493nYTo1/Fl0lHEFpzHFRE9zPSB0V
	 yN2qj+47v9tUEXIa2FEJshH96jDClTUkqNmprjlmTYNR9klqvGDYqPVnEvE6SCKMlhexk
	 10s0w8p9VwGV7AqsI0nQy9Zp8dErT86vHDNdDOCjJMMSpvCmK1+Pl1MAtpASADu6dZ5SV
	 nh9222FYVVYbaGFKxqxoO2AoxVdHTKIcRuK6z1+BmBX182Pe1c3aYfR70wmUw62mWUMXO
	 ZqZ1QlHdtFz3NfB3/qYDftHV2F590087JnRRrKttEf73pxegMt11be7w8uzuw7YV3fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M5DcHFsD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dpFWontg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202EB606A325
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 13:28:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 202EB606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M5DcHFsD;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dpFWontg
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MBSfjD032013
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 13:28:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C+3I/2A1U+Gp7I1jsF91pZcgO5n0gv+qfSKmmUyDmWI=; b=M5DcHFsDC+EL8Mkb
	k164l2UnqbYDeXD7sYFe3zZ1ZFexpDf4Kehgy8W1M7DowBtZHzqbQxiu480Df5Sr
	58G46/R9IeHvJl1xCQDw+lQEFSiFaBCWrZGOjjcFn7/5pQ2ihn0c8UReV6pqO2iA
	x2H3g1abdamEIN3kuDeOA1qZCqXJXIYC1rFrtDeXW3n2VMFAugKkF9I43I4MyQpE
	CJSxnmjwGLppgYdiFV9Zwf7JTeBgr8AO5Spg7GGlHd6xRXQ1yumdqUXugaHKhkis
	KtYypKgRDBTKLIkifLi2dUaYLJ7gTuaeQa3V1xwpUi39udR/DonlWwrjpe6a9ToA
	NS/aTA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93cbrjk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 13:28:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934956beec8so405300485a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 06:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792675700; x=1793280500; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C+3I/2A1U+Gp7I1jsF91pZcgO5n0gv+qfSKmmUyDmWI=;
        b=dpFWontgmqiIkrra+kSx7r4HSR7BSIc7f2afNWRss7sPU52Bbl1KOjuSSOdfv0BlgG
         f/vXioIssngLRT+7CwnnyOg3C102RTSGwwuU+fCDjhQ1jLoaRYnVDA6hIOo/BJZT2GPF
         hQhSIA3Ssaa4ommoKNzQ2STL6ee861zKXEIKhPUQNuQ6rLPF42o+Qr4x0t8FBoU5fbPC
         /Chd0dVRTo7B7e4U6DTsyFVArfxoHWwVR8a997ALSUCxLhO3CBl7WXmhBt6caz+j7fg4
         WX6M9d740o1UBpCk/Cyq07FdhKMfWi98sl2AIQe8f448ocAH0RlrTBtl5ChfsQBK8/6t
         KiVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792675700; x=1793280500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C+3I/2A1U+Gp7I1jsF91pZcgO5n0gv+qfSKmmUyDmWI=;
        b=PrONA2jaz1p2ufHuWYVmeLKyPx1ABEP9Jd3VbyS3pLxZg6bUZfrCahK3UbAY9aLOHk
         VzHwn59OYt+Qcb4JxU7bAf8z1EDAVXb7jhTNQq/ucevO1iEhi0nvMJMBdyxApZO0f6mi
         9mNtmeMx8r+hxV2Tkpvp7jBzKxvi9vcB8+3HQTswGNoRt2mFgrBmlEvHRSGw5dOf/tjn
         yYA4D+SeTkG15vzHn8cBpmlIu9wHOsp3+Kl51DgCguw92eD5xd/hUzJKf+3ooY1Mm2wf
         wfRtPeWndWQOqG/7HZd9DAdyEBa9McSDoVr6npG98Gp/T3cq6E9kNeqRcG5KzCEb+WHZ
         hQ4Q==
X-Forwarded-Encrypted: i=1; AKwUvByn07serB0JY1nKR7sWBHuD3vZRiu0j+mPWdB91bQzyn0Bz1TnL/g3/a9QUvC0EX4qe9KjIuwumIaWwuv5g@vger.kernel.org
X-Gm-Message-State: AFq9FYLpZA1uV/TbU/ysByX4QHa4FkzCtlSplUwOdZsGSlQ04P9Fu3r3
	fEqS1JpJTG/EL/fobAE6t85ZIhEEfjCLBYV3/2kQRqM/2P486Duxam0ofgPTjZ6RsBM+ucuC1pP
	iCxu1o1nvhgMdURL092ZLvgaeGJKBzf+UI55yAWjLvd3MZZHaO4bZLolnF28e/5zNe7MHEzh6U8
	EA
X-Gm-Gg: AYBFou12Yg3if4uDwZEfeMYFOM5Zzs/+MW2s3PV3+7K0tAWs7LOCTd399DVX4BfY/ib
	McrXnhLKvxpB/9u6Hq6WNzuKggX0ECpPZWlkdkpQaij2s14tgkbxxYkU/eIjyYhZQ0o/wBhxAyu
	jR+kmID1JSfZwsYA9pj9+VMep0xPnbzr79aT2drJ8TkZSOOm3gqGKFk8gy/3vIa3aezzF2W12uh
	GjXTCf4ZZRN1fIo7b88oc2SYqlkbVZB2TEtRMwe8bkM+dQ2iUSA0VSy9qtdPzRJhfNKfvE7qKf7
	S1aEBpf79EBze7e8Lho2tx40r6xoZEQrm4zZ/TbPIrfCDfg5M+xMqmDsav4by33VaW2NTyjF2UN
	MO6nXBKnOFbQOffbg0HikNw0296J4m5VvnHdNXqnohZlCX0sIHuHQIlLuR4tJ5WJGD+i1V6vRIL
	RCNFDuXUjqKkIY
X-Received: by 2002:a05:620a:6408:b0:939:6de9:4cff with SMTP id af79cd13be357-93f57f3d80amr951084885a.45.1792675700393;
        Thu, 22 Oct 2026 06:28:20 -0700 (PDT)
X-Received: by 2002:a05:620a:6408:b0:939:6de9:4cff with SMTP id af79cd13be357-93f57f3d80amr951079285a.45.1792675699899;
        Thu, 22 Oct 2026 06:28:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac4f6683edsm8762201fa.22.2026.10.22.06.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 06:28:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 16:27:57 +0300
Subject: [PATCH v6 2/9] drm/connector: pass down IRQ_HPD to the drivers
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
Message-Id: <20261022-hpd-irq-events-v6-2-337ea3ddaa62@oss.qualcomm.com>
References: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
In-Reply-To: <20261022-hpd-irq-events-v6-0-337ea3ddaa62@oss.qualcomm.com>
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
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ9Yt/hSzFpHE6ev+vJn//9zUP0H8ontkeSIVJ4sXfporv
 CZgVUNcJ6MxCwMjF4OsmCKLT0HL1JhNyWEfdkythxnEygQyhYGLUwAmwl3K/j+ENcuEteD7on9S
 j+81h/AWqFyzznIP3uBqN8nG8EjUrlnhk+bZ5s6ecU3jb3Xqp89vU2+yrGk3K19kb6LJIJ7qFcK
 idd0sL7tImefD4i8ybw8Lx+tqPv9YfTVsLZ9+0/TTprn7U4oLfyxKTyi+sdJlVb219rJXGus3nL
 kps1T8hEfTnPtWE03tv9pp5VzwZcnRbVvZN11mv3nJXUb+6+ue3eT/xpleUxq2l2ERc+vNrLqno
 uq+Mjyr9yguaLWZvYNZ/YxHQT6nkbtX2esXB9nNxB0POd0qb9Q5vvi9jKKO5/JNLkHf9p896G7N
 Uc3NbtyY/8v/sWnA3kNTv/FtXCX32+Kq1/tjn+wbdVRjAQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX9a0foeL9kfUp
 AGHrXAwARTluLCevyuANqE7AUZGgZqURsHwq17Tb9i1Q976Wm8nj9huCtbbExoNVg3pVpNk9ARQ
 pZ5i+a5kdwI/SIOxeIGjrvfhCTUBN6I=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ada0f75 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=DclysrjFOTLD0Guyi30A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Jnrpgvf3Kd46p-afFy-mwnnet6oMAcFZ
X-Proofpoint-ORIG-GUID: Jnrpgvf3Kd46p-afFy-mwnnet6oMAcFZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1MyBTYWx0ZWRfX0lrVm/vs6URg
 Pjy67VwG9c7eFsSU/R46bhugGQn6fn1Kg7NesW+ylYet9I5WaLYyDbLWyPwcYNMv2ThcvJOUFGO
 2dUjle2xQK/JXtzoMMmWDzzT8rzu2suLnSaCHGuaDesYLtEXrk6sDRaO5yWG98Cm7WFy8tpuWzS
 2pOljoCqOBopPkvjOv+Stlej++Ool9vfi1OkAlpFlmMECrmLRL2hTSaoJHR/Em4sh/IAKf2dfrd
 kMpe/apS6UFkdGb237S2rZOkbDfjJS199F3KM+gNqP9uBmcLtGt8b1Bzc+USFaKrvqP5P2GqCb9
 PXaBD2LIByfDHB3e+Kd7OUxoU66kabIospheeRj6IoiYrt7RnGtLAImV9K+iF/cJYMaXQXrXiuL
 Wk/LOEI09GtfbX6Hvl0DATF6tz5jUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220053

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

