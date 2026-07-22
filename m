Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82499313E0D
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784702193; cv=none; b=BHe/AvpEcXnuX9RXqhQdAGXOz0h8UPsuhikofoEELEHA0HV3htfY05h5m8cXRl5aSq7vFIoa/HSC60NOGCS2Ovsn3OFtwnXfcgnvY3jTP3FEkkcD1SyKjgQswfEqBNQVBFZenlWGiE59uGXK3FWB63+0LBdVdlFZenv5Ik9W5ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784702193; c=relaxed/simple;
	bh=g5zWr9M7trO4ZkcWkuzmoxKaNBkS8toEZhFm1G+4kKc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DPrrsh6oWxmH3JEihiWy7tvnd+ruIvkcFLM3y1laDlyQ6f7/w6MFHBHIkuI+jbM848vJuwNSnqKQeq0fod54NzIdzgaAPOci7CMr48nAXvYowvYrN8pZ+nJjd+XkhEf9LvQis5z5vCfmNiuLBirB9nkhjwKig0mrlUq/y9PfhbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=axgYQO/D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kRu3wAP8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="axgYQO/D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kRu3wAP8"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M548G44027826
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:36:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=JG2b+5eP8LBC7VH//lLOF3
	b2Ezw8Zppg2nAXqPwttGw=; b=axgYQO/DAbo83b9JFd1i3/i2dG2r7vkmUK8hrU
	zMIF+aqIqnEstI7+ObmpEYRYUcsQeI8qIL0CE+RIshTcfe56EEdliBg9up4ytpIN
	5fKcUTWLMbs8arVH98mpRY/kG+JVnx0VUy+T6ewJ+W5dM5S3L3oQ3OEJ75+hc8k4
	4qJLJyLiNMr3GcO0Y7w42XG0qoXtciIS1GU0dipXS4SdDCNbXY46jrEFSap6MMVk
	U3VWK7b91Ovy/nxahYB5f78CJcf6kNoC/zQvVuRaaFeBN1N6eF+lAhlkk2KDdSPN
	BcVFLuB+xVCfily6UzwO+r1z5BnylsGBy/6IWi/r0DU93khw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9bsbvg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:36:30 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5174a236220so223761841cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 23:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784702188; x=1785306988; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JG2b+5eP8LBC7VH//lLOF3b2Ezw8Zppg2nAXqPwttGw=;
        b=kRu3wAP86uvV17KhmO0K6srudeWCvTt5z6ArWgqFM0dY+jHJMYWLTeKWJ4QHw6fDNm
         UffKUnI51rmg1oeOpdv2odihTPDGQv3rx701DwtsJzNDaTFwAbNRbO0yg78x4X3jzhhm
         ewnWz6Y39n3kLVK+6f2Le2qEo5WdSJn67xQT2dDzFkDSeY98XN0hlUoUBiHnLwEvV6tD
         eocZI0doUIN0jkgnQdwO0BJ28llboD9d4n+Zt66iQUooUIAgSpsI77cBgFMdaMDULd4/
         BvckDaBBHLTgh5zuBW/GqEocgMDodD9zhh2p7s8wqifQIlbltf2d/+/9X1kRkykX+ZPC
         H1sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784702188; x=1785306988;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=JG2b+5eP8LBC7VH//lLOF3b2Ezw8Zppg2nAXqPwttGw=;
        b=Egym/lkpOKCegW+xstmZsfO1nf7yqLz/izxT7KWlpYD7viuA/KHd50y+y0Atp430Pw
         0Xcj3FDzwMbiJYa047o8dM/K0UwKpO24QevxchvueJrkhTZlvKVNf6PsZZbv9SHQf/nv
         vfGvsLoFcV0vibCxfF5FH1S50N1npMDYooZEeeMbkb0MEVUqa0ssCI4cMPVrNL/oGMcZ
         4ZR8NMfw2mHpFab5tJATaMj0WZ7PeL6w0D2zq0gve4L2YDDGbameCkey/JrqSXbo03Pk
         3zOyWRwuGe4uecFtCXgQ8XcZPGJlKJbTe6wI1MwxhsVJ/2d00HfwPygssQo90IIQFQVb
         t84w==
X-Gm-Message-State: AOJu0YxKvigkjaz1TLEcoOTqnSrLNKSv3ZY9WZYhrxIzzlriA6r/cm7K
	Htkh8hXENVScDJHfYpuT/kCkWTA+/VzT/Cg2u1o3P7o8mewsm43JlKuoQOtLudZbUg/M9vfKETU
	DjEHRNBQTlgskKg0W7nSJyzGJ88OU8u8vxk5hY1ZYi5wi1IDbVXRP/7p3NtNPvWuyzf98
X-Gm-Gg: AR+sD11F9XqABZ9zEjBE68TiYT+oBpLDkXe5lgKpAtvP3q63sWQCx6Wnjk04+Mvz2V1
	QlSscZZG40p4XQmKevK1BBqVX5qq8H+vdV39IxbBXr1pfFJNGBirhH2ojQENQCQVjQHoRQNdINy
	y8/vXzvZd8NpmxIikG4gB6EkVjvExZuCU0VVuyzJBjTyJqpK8adPlJ5z/nf35s7tF3n4HDdlNds
	jAb+KPxQZ4dW1f7GXFMT1FXfLPCmi2adw1OFqu96IkXBnJ6MKKzQPLLIJ6W3gW+OGEMng1BizOv
	EGSOWxDspNcGCXHZLwENCedCEq/bMLaxwYUTEqsgA/Ls0CnxN4vKOt4uYtu+mQHwTp5H0A1l9MN
	ojoqfIKIqZWGv8ow8lfgo8+eCc6yk0mcWX5mJX1Ce2r7dJXwLwxACIQsXtYIKQ+ptFIX8a/8SxD
	2ppKJWZTSxKoKsHA==
X-Received: by 2002:a05:622a:4c8e:b0:51c:9ad:d77 with SMTP id d75a77b69052e-5213e082205mr201712641cf.51.1784702188248;
        Tue, 21 Jul 2026 23:36:28 -0700 (PDT)
X-Received: by 2002:a05:622a:4c8e:b0:51c:9ad:d77 with SMTP id d75a77b69052e-5213e082205mr201712341cf.51.1784702187807;
        Tue, 21 Jul 2026 23:36:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b8c6f6sm309696e87.4.2026.07.21.23.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:36:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 00/24] drm/msm: introduce the struct msm_display interface
Date: Wed, 22 Jul 2026 09:36:15 +0300
Message-Id: <20260722-drm-msm-display-interface-v1-0-368c10fe62fd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAN9kYGoC/y2NQQ6CMBBFr0JmbSM2gpGrGBbtdNAxtkCnGAzh7
 hZx+ZL/31tAKDIJNMUCkd4s3IcMp0MB+DDhTopdZtClrsuL1spFr7x45ViGl/koDoliZ5BUZRE
 Jz7a+ugryf4jU8fxz39qdZbJPwrQJ/4tI45SjaZ+BNUIKe+85NUXOHLdUoDlBu65fVwp3/60AA
 AA=
X-Change-ID: 20260722-drm-msm-display-interface-5bccec4b69d5
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5209;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=g5zWr9M7trO4ZkcWkuzmoxKaNBkS8toEZhFm1G+4kKc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqYGTmbP1b3GbMS2/NRkl/VAvyRSzGH+Rz1VjZM
 NoVGhlphyyJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamBk5gAKCRCLPIo+Aiko
 1ahtB/kBDCSTjdGegh4fTT5OexxU23T2bkgKDVfv6dtpCnuPhSe4V+JsfONoEZ3/edbEfTNj11J
 W1NBu0vdMpj0iB78txUGoW56l0ZDu81L7JDON2AhwrSzl+0k1SSSXrQVcJrd4K14SMzhsMkTSWW
 rw9RzV8AwTxlNZ3ppwxc+VeUFGa2z+1s5Fi9cJzuNw00rLfgGkyjp82XPRszqips1wvIJG4Evtj
 B7knmqGeR50EWfaPMg54B9ElCVFk9GOwNQYp5XrW1aLvg11NmDqRyKCZW8Olwnozk1WJvCc5AnT
 tF/7ttQ92T99yLohHQvmpa+RKTd/FunUFgOJxhA3CTS0Os9X
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: lfo3QMFeDebRtXF06l2MwUUW3s4i7SGs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfX9I4HFFEujr5U
 pnrMXhQI3Paehz1//xJKY7q/9UgtyRTUFMhSjhrnTCiEbUn9p99Bd4jhH3ekXqFP5OBE0TY0c99
 DfWPbxll6tW3fMsP61e7BVeFqU000eS9LOkZRdNxYl9eQyDWj+TeEVGtwxnOM8y/HoZC0dp8ot8
 hvD/w0cM4c/+2wDW2bXPdL3/NHUYkP3gBBX1hi/y2nIn8iHiVaM936eiASHHrCRoD5UlIdmmP4f
 ++GogBA6U27Z5qHrabDF55x9R6+KkRRslBGSaNJmDk8K4VcCzzEceKAZXQtbZ0dbe2H45Etmi5m
 y0Oy4dv+N11+3hibX0c1DyQbR/nHRoksOAkNtGGghiDwymBxIaXEkCa4d1D+zMIa16xD06zR+6j
 a9oOVItUzzBghnFHEUhWQIYAKhl8aF4aedkeVNiW430cwrv/C8u+asCjS2sQm7xVpEwzGn3C+7T
 E88Dl9ZXCP0TZolu2cg==
X-Proofpoint-GUID: lfo3QMFeDebRtXF06l2MwUUW3s4i7SGs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA2MCBTYWx0ZWRfXycmK5L88gaID
 8BylXDERmbZsmrimRw5CFXUvY2/Dn7B/As/SJX/wk/3Z+qQMtASLhCj7SFOpdd3yLzTkk/Cyd+z
 RGrmdrvUdt0G3UzdGHiDS1T7utAOcAw=
X-Authority-Analysis: v=2.4 cv=QK1YgALL c=1 sm=1 tr=0 ts=6a6064ee cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=0w9IUoAH-FZ3DHrqiPYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220060

The msm KMS core and its DPU/MDP5/MDP4 backends reach into the concrete
DSI, DP and HDMI sub-blocks all over the place. Connector creation is
open-coded in each backend and in each sub-block, the bonded-DSI dispatch
is duplicated three times with subtle variations, and every cross-module
query (command mode, wide bus, DSC config, tear-check source, peripheral
flush, snapshot, ...) is a type-specific msm_dsi_*()/msm_dp_*()/
msm_hdmi_*() helper reached through an interface-type switch. In the
other direction the sub-blocks cache drm_connector pointers that the core
has to hand back to them, coupling each sub-block to a connector it does
not own.

Refactor the MSM display / encoder interface. Introduce a small struct
msm_display interface, embedded in struct msm_dsi, struct msm_dp and
struct hdmi, and fold the per-sub-block operations into it one callback
at a time: modeset_init(), snapshot(), the wide-bus / command-mode / DSC
/ TE-source / peripheral-flush / bonded / encoder queries. Once every
cross-module call goes through the interface, struct msm_kms can store
the sub-blocks as struct msm_display pointers and drop the concrete
accessors entirely.

On top of that, move connector creation into common code: each backend
now only builds the (genuinely backend-specific) encoder and attaches the
bridge chain, and a shared msm_kms_init_connectors() walks the encoders
once the bridges are in place and creates a bridge connector for each.
The last DisplayPort-specific bit, attaching the DP subconnector
property, is generalised into drm_bridge_connector_init() so it is
applied to any DisplayPort bridge connector rather than open-coded in
msm.

The series incorporates two patches by Yongxing Mou from [1], one patch
is added as is, another one has minor fix.

[1] https://lore.kernel.org/dri-devel/20260720-dp_mstclean-v8-0-bea261bf4e7d@oss.qualcomm.com/

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (22):
      drm/msm/dp: reject YUV420-only modes without VSC SDP support
      drm/msm/dp: drop the always-true yuv_supported argument
      drm/msm: create the display connectors from common code
      drm/msm: introduce the struct msm_display interface
      drm/msm: route the display snapshot through the msm_display interface
      drm/msm/hdmi: capture the HDMI registers in the display snapshot
      drm/msm: add the wide_bus_enabled callback to msm_display
      drm/msm: add the needs_periph_flush callback to msm_display
      drm/msm: add the is_cmd_mode callback to msm_display
      drm/msm: add the get_dsc_config callback to msm_display
      drm/msm: add the get_te_source callback to msm_display
      drm/msm: add is_bonded and needs_encoder callbacks to msm_display
      drm/msm/hdmi: use dev_get_drvdata() in msm_hdmi_unbind()
      drm/msm: store the display sub-blocks as struct msm_display
      drm/msm/dp: do not reject wide-bus modes while a YUV420 mode is active
      drm/msm/hdmi: cache is_hdmi instead of storing the connector
      drm/msm/dp: drop redundant panel->connector
      drm/msm/dp: use drm_display_info in mode_valid callbacks
      drm/msm/dp: guard subconnector setup on the connector type
      drm/msm/dp: stop storing the connector in struct msm_dp
      drm/msm: create the bridge connectors from common code
      drm/bridge-connector: attach the DP subconnector property

Yongxing Mou (2):
      drm/msm/dp: remove cached drm_edid from panel
      drm/msm/dp: drop deprecated .mode_set() and use .atomic_pre_enable

 drivers/gpu/drm/display/drm_bridge_connector.c    |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c       |  64 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           |  52 +---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c          |  26 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c          |  11 +-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c |  19 +-
 drivers/gpu/drm/msm/dp/dp_display.c               | 353 +++++++++++++---------
 drivers/gpu/drm/msm/dp/dp_display.h               |   7 +-
 drivers/gpu/drm/msm/dp/dp_drm.c                   |  30 +-
 drivers/gpu/drm/msm/dp/dp_drm.h                   |  10 +-
 drivers/gpu/drm/msm/dp/dp_panel.c                 |  62 +---
 drivers/gpu/drm/msm/dp/dp_panel.h                 |  15 +-
 drivers/gpu/drm/msm/dsi/dsi.c                     |  71 ++++-
 drivers/gpu/drm/msm/dsi/dsi.h                     |   8 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c             |  18 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c                   | 101 +++++--
 drivers/gpu/drm/msm/hdmi/hdmi.h                   |   7 +-
 drivers/gpu/drm/msm/hdmi/hdmi_audio.c             |   2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c            |  16 +-
 drivers/gpu/drm/msm/msm_drv.h                     | 135 +++------
 drivers/gpu/drm/msm/msm_kms.c                     |  90 ++++++
 drivers/gpu/drm/msm/msm_kms.h                     |   9 +-
 22 files changed, 636 insertions(+), 474 deletions(-)
---
base-commit: b2128290c29902315e632ea59e0504d6bc9e9b42
change-id: 20260722-drm-msm-display-interface-5bccec4b69d5

Best regards,
--  
With best wishes
Dmitry

