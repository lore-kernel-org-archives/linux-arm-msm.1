Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674699;
	b=rPGEyrN33YYsSjbL7iv5IZBvW4SRqaYi5JhUBibRPzGfD3Y9oCY5Mece6V2+ryke5UfH
	 0g+SDyIYwNOjEGlkl8BF+7pMFL+dYJZLSyoQnfak99KSpTsgWNECqrU9SaC8LzSCRiaa6
	 aWRnKJvtEaao0dRPWf/yrR8gCVvg28XR1kn4m8D66CR0+xYN+cORd47JsKJnFim/BB+Sp
	 mcFtsn1Zy7FrLCbA17psM5DuWkPLHtQKioigfBD2oymnTcMZM50Cs4OYWLW5TSQ+QtDI+
	 hy5FSAlUd8VNx1vqdr+127sPG91vHRthRkvF3Gs1SdRWknZ5aPXNsn9KRnj8st4+e6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674699;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8N2yw0oLQ/TLTex0f5pxG2rL1Y8/RESC3ZsVZhW0BJM=;
	b=N0HEQO4HaiXOEjJXqz+iH81Wk9HAq2ss25mqVVVEqAGGmkTLu5f6kBmgwCTrZWcTXBeN
	 0h/ln+LnQTIHor4C6DMf/62yX9Ye938b6Mrf1+yKhVAGJ+tNnpg1DGTpRdslQJzC+ijxN
	 EZ/2v1RsBdKtSfThmzwJ1YMidBsQEQlbagJDN7D+9+ikunnOqCqENLjoUUqUgvcZZ8N7J
	 zPS+NT+bArSIuqIp5+jC2OFBZWQ7IHcpTzcQXVq25jPV9hLRv86ar7Bv6s9xCyQAxRlCO
	 EGdkUkBt2ZgMb89L0Y/aT7fJGOXpUmsiK/I1WEg8hX4Y071iUHAEu1WEQP/+e1w2hRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WVcKJHuh;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E9DR1bkP;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5AD606A333
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A5AD606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WVcKJHuh;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E9DR1bkP
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36gnS170329
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8N2yw0oLQ/TLTex0f5pxG2rL1Y8/RESC3ZsVZhW0BJM=; b=WVcKJHuh+DMfseRs
	QX1GtNjjKqiWQqxH1ODptt3bRovpf5U7YUhCcUy53PM2xp3uors1bODMEjuj1Km7
	IOGZD7gsSJqHKT03PLJqcBu3x5MHuMnPixl9050NeX6hGEjdIgblBRepvs+CT6pa
	H9H0JUCbHeJgwJJdRhdG1Ae2Qqu1b63vvZkEGEGzWm+WvzIPUpTvVTZSAkRqKbhk
	LZl94yjBr8AgTFdrork7PqLgatoznJtZl+Ys7xcS2VsjhPi0Fq/o5FnqGYTmIr28
	x8l0LziacoDyYR4pZkAGiMSA12f8q1B7qsZgj9vxKodI9qJMgRX5jqN3dtZqvNtS
	3WbE2Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vukv9g8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:31:37 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2f02c63901aso60165085ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 22:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795674696; x=1796279496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8N2yw0oLQ/TLTex0f5pxG2rL1Y8/RESC3ZsVZhW0BJM=;
        b=E9DR1bkPdAgRBkianl7v8+QS4vZNN7htIxO3jFvVhcPCrLt7Dk1n+gWUi2DEFr4WkG
         /xfPwDKGmD/dlQombb0iCvmXVn12uUkkM3uk8GSXpIao41XISg6titMOrpiszJr7Mfsk
         0OcUX4eTtOwmaS05vxwgrvLYKb6MPnKhPDZbKkO0T0vU9iJIsqym845Xodl8HnC5kgS1
         9V+GTiXtwmK/EQuXaUuP2y5We3LyEzYu2TpKkS80Y/Jd0CHpHCJblfEQCZVPV3e/PrFQ
         tqVHByFDEc/KPV5VKKeKRPa8EzY3/QQweX8gRUpiCYUP/d6Jo+XUGcLkQ+TX+I2jvWJH
         3QNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674696; x=1796279496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8N2yw0oLQ/TLTex0f5pxG2rL1Y8/RESC3ZsVZhW0BJM=;
        b=i2GI01zJ3ruMwG+UPS66uLYWo264y8vMAn6tWTKWx3jXyUADbGTpupmjfnO2FbAz1P
         aytU8l8tqEgTpZYZwGhuwkBC4f1wH2+OsKMx66PKHOQO7xfV6qtTHakhXVWKn4ap3QAe
         iZl+9pId8dO/GQv/AtIy3iv769OuPIP66isRSpkSuPWR/mSM68VDtuVkcCEyHg5IPE62
         3HOAGt5ERJhLVYEJzzmmLXe2Yriwl7Q+KCMF6oonPcD6I0WO0ly7G63oaim0dRb/smkA
         UkAjCqP8RVchvEpwiG7LGysgJ/rT83OIUIGhEdArbrcRFP3va8hrYvD2tPXbghZgVHPt
         9TSA==
X-Forwarded-Encrypted: i=1; AL+hErEZxiQTCoiz23VauqrnrhZhSETjo2luMFyA4yjyjWJ3trl2GkCQlghQ7wMwRvWENwJ1Ghmn+TiovmDPPQty@vger.kernel.org
X-Gm-Message-State: APuU4Z/re/Faeb/tjzT+MUtlCEhwg6aQ+i9eNUdePi4EtDkVx/sD54ik
	eZBHgQt9ouFzZgqvAX2btLcl454+ds1eOp31mi/J3UiS9WipKlETq/ROzSjuAOMGZnOAwk7MGdq
	O99mfhdcRuDnU97CaiJPGBb3s/9oYhfa3940MZuG1LRbgI4qPNxv9aRY4nOyDxYAq0HYH
X-Gm-Gg: AZFdTZcb6RrtwQtKCMIN/fH60pSwqUCUB5MUvMNwY48MW099Yl4aFco/WBiLXmga6sz
	4Aw2nV/aUj8qDqXZMFaZxoW0rNfu5hlY3gB3fB7/oxjeCGS2h7NtIiSMa670dTKlVRvmXbvDVmQ
	8TRqqO4LS+HSt0gm934swWJlDjY2btqD6NioLBW6Xy0LP1uAniBAZa+IeouX5Z8bbq7jZTqsBra
	ZBFIBuVyoz+hHAy1Ur5GjR5Bo2vanljuKkHzuOwTpZCLZzHSGQzUltUWjiYV604J95rnROTNTk6
	HqQ1iHw2hPbR1S5928r0bWdeENt/9a37WroeDBhIA/oiMQTetgAcwBCvSyA3uMqYNjC+QWSLA/c
	KOkwTguA+GChKWtYhin9MZccA4sCc/aL1OF4BFZdAf83/CArSQP4QBWAKp+0kIv6pMl1Bnsy/AN
	jT9SQwqPt0
X-Received: by 2002:a17:902:e807:b0:2ef:ee1b:8e52 with SMTP id d9443c01a7336-2f03f1a4a23mr203555015ad.32.1795674696233;
        Wed, 25 Nov 2026 22:31:36 -0800 (PST)
X-Received: by 2002:a17:902:e807:b0:2ef:ee1b:8e52 with SMTP id d9443c01a7336-2f03f1a4a23mr203554775ad.32.1795674695754;
        Wed, 25 Nov 2026 22:31:35 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f147a9esm97159715ad.72.2026.11.25.22.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:31:35 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:59:23 +0530
Subject: [PATCH v3 15/21] drm/msm/dcp: Integrate the DSI bridge with KMS
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
Message-Id: <20261126-jshekhar-v3-dcp-v3-15-f1e9d7505039@oss.qualcomm.com>
References: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
In-Reply-To: <20261126-jshekhar-v3-dcp-v3-0-f1e9d7505039@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>
Cc: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795674555; l=4768;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=oh3IUL02t6aGFSKjrhDtJnQnen66NES1sHfBcS8WaPU=;
 b=N14igswgNEGw3maGVWKUQECTJPPBwrV/pfLL6ppSPDeeeF2JKUeqOi2iZiZyuv3+nZcDAd7Ho
 B5Pkx92gRFMDOAvXD8ZVsLkVaHX1kGUGRH/zgUpkBJNqf72KpO8lrjd
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Authority-Analysis: v=2.4 cv=KfVHIgYD c=1 sm=1 tr=0 ts=6b07d249 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=_pBgebsfWxT5-yjw7VoA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: aNJ6p5nPbNSwKvIhAmCaHEQbaybe2TvX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX7mn34uI4aMkF
 0nEWVSgcSVWFcRbpVgTkXdx8xQEXIs61c3HJU6Yt7DaMm5MhQN1jYVPucAOWL9WkkFjlPrGcUh7
 gr6FIe1QHmh5/Sz9/jmpFQHzXPgJetw=
X-Proofpoint-GUID: aNJ6p5nPbNSwKvIhAmCaHEQbaybe2TvX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfXw9tYwtUlDEOt
 5ftJQ8Q5IsuDVMGKXBNVM4O7Tkr2nrowAXWE9Sd/HP7xd6jVAd2GQkY/DYBdNuRfNPq3iglftg3
 CzW4eebuj8sj8ciDLzO6avpnF0tvgInNYmX4Q4wTde+FGDaDDbypk1i5QEkupcZSTvXbWKDVneh
 9aT4TjJJN1hBoDj1QiszUYqg1Ys6AZYQa6m4udT/LHpTlNpfWw7IW/B3URKCTnfXbPvE9avdFQr
 y8MRKxgGjUtZOtAhlzhkPGwJ3Nhrl99sWhBPIo4Sg26B7qMe+idQTb1ZqWV6a6D47R0ajE+mkNv
 yfdgN3KfL/lSManMTxt1hW10ZmgK0Ioahjy8x8OHECO9y1BEySF7bXO27pFaGl3/6/XgwOWe0sS
 YGSNk+aN7b76AKlnbGg8IpGVTzZKfPdOsN7RcQ3p/GaTZoX+7JCLikzJJsHYqTw1lT5Siw3imsT
 1SDuhSWTvjuCUD4vxTg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260024

Connect the DCP DSI host and panel bridge to the DCP KMS
pipeline. Without bridge integration, DRM cannot create display
sessions, attach connectors, or run the bridge enable and disable
sequence for atomic commits.

Set up and tear down the bridge and CRTC relationship, pass panel
configuration through KMS, and connect bridge-backed display operations
to the DCP HFI commands.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dcp/dcp_crtc.c    | 21 ++++++++++++++++++
 drivers/gpu/drm/msm/dcp/dcp_dpu_kms.c | 40 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dcp/dcp_dpu_kms.h |  2 ++
 3 files changed, 63 insertions(+)

diff --git a/drivers/gpu/drm/msm/dcp/dcp_crtc.c b/drivers/gpu/drm/msm/dcp/dcp_crtc.c
index f58667ca458e..a79bf9189e74 100644
--- a/drivers/gpu/drm/msm/dcp/dcp_crtc.c
+++ b/drivers/gpu/drm/msm/dcp/dcp_crtc.c
@@ -24,6 +24,7 @@
 #include "dcp_drv.h"
 #include "dcp_hfi.h"
 #include "dcp_dpu_kms.h"
+#include "dcp_plane_state.h"
 
 #include "hfi/hfi_defs_display.h"
 #include "hfi/hfi_properties_display.h"
@@ -149,6 +150,12 @@ static void dcp_crtc_atomic_begin(struct drm_crtc *crtc,
 		return;
 	}
 
+	ret = dcp_dpu_kms_prepare_crtc_session(dcp_kms, crtc);
+	if (ret) {
+		cstate->hfi_error = ret;
+		return;
+	}
+
 	if (!dcp_crtc_get_session(crtc, &session_id)) {
 		cstate->hfi_error = -ENODEV;
 		return;
@@ -541,6 +548,9 @@ static int dcp_crtc_atomic_check(struct drm_crtc *crtc,
 		drm_atomic_get_new_crtc_state(state, crtc);
 	struct dcp_crtc_state *cstate = to_dcp_crtc_state(crtc_state);
 	u32 mixer_count;
+	struct drm_plane *plane;
+	const struct drm_plane_state *pstate;
+	bool needs_dirtyfb;
 	int ret;
 
 	drm_dbg_atomic(crtc->dev, "CRTC%u: atomic_check enable=%d active=%d mode=%s\n",
@@ -550,6 +560,8 @@ static int dcp_crtc_atomic_check(struct drm_crtc *crtc,
 	if (!crtc_state->enable || !crtc_state->active)
 		return 0;
 
+	needs_dirtyfb = dcp_dpu_kms_needs_dirtyfb(dcp_kms, crtc);
+
 	mixer_count = cstate->topology_mixer_count;
 	if (mixer_count < 1 || mixer_count > DCP_MAX_MIXERS) {
 		drm_dbg_atomic(crtc->dev,
@@ -572,6 +584,15 @@ static int dcp_crtc_atomic_check(struct drm_crtc *crtc,
 	}
 
 	dcp_crtc_aggregate_bw(crtc_state, true);
+	drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
+		struct dcp_plane_state *dcp_pstate;
+
+		if (!pstate->visible)
+			continue;
+
+		dcp_pstate = to_dcp_plane_state((struct drm_plane_state *)pstate);
+		dcp_pstate->needs_dirtyfb = needs_dirtyfb;
+	}
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/msm/dcp/dcp_dpu_kms.c b/drivers/gpu/drm/msm/dcp/dcp_dpu_kms.c
index 44b1c2200aee..61a4d8565359 100644
--- a/drivers/gpu/drm/msm/dcp/dcp_dpu_kms.c
+++ b/drivers/gpu/drm/msm/dcp/dcp_dpu_kms.c
@@ -7,6 +7,27 @@
 #include <drm/drm_crtc.h>
 
 #include "dcp_dpu_kms.h"
+#include "dcp_dsi_bridge.h"
+
+int dcp_dpu_kms_prepare_crtc_session(struct dcp_dpu_kms *dcp_kms,
+				     struct drm_crtc *crtc)
+{
+	u32 i;
+
+	for (i = 0; i < ARRAY_SIZE(dcp_kms->dsi_bridge); i++) {
+		struct dcp_dsi_bridge *bridge = dcp_kms->dsi_bridge[i];
+
+		if (!bridge)
+			continue;
+		if (dcp_dpu_kms_get_crtc(dcp_kms, bridge->fw_display_id) != crtc)
+			continue;
+
+		return dcp_dsi_bridge_prepare_session(bridge,
+						      &crtc->state->adjusted_mode);
+	}
+
+	return -ENODEV;
+}
 
 struct drm_crtc *dcp_dpu_kms_get_crtc(struct dcp_dpu_kms *dcp_kms,
 				      u32 display_id)
@@ -19,3 +40,22 @@ struct drm_crtc *dcp_dpu_kms_get_crtc(struct dcp_dpu_kms *dcp_kms,
 
 	return NULL;
 }
+
+bool dcp_dpu_kms_needs_dirtyfb(struct dcp_dpu_kms *dcp_kms,
+			       struct drm_crtc *crtc)
+{
+	u32 i;
+
+	for (i = 0; i < ARRAY_SIZE(dcp_kms->dsi_bridge); i++) {
+		struct dcp_dsi_bridge *bridge = dcp_kms->dsi_bridge[i];
+
+		if (!bridge ||
+		    dcp_dpu_kms_get_crtc(dcp_kms, bridge->fw_display_id) != crtc)
+			continue;
+
+		return bridge->dsi_device &&
+			!(bridge->dsi_device->mode_flags & MIPI_DSI_MODE_VIDEO);
+	}
+
+	return false;
+}
diff --git a/drivers/gpu/drm/msm/dcp/dcp_dpu_kms.h b/drivers/gpu/drm/msm/dcp/dcp_dpu_kms.h
index f8010fc5d32f..333567a78ad7 100644
--- a/drivers/gpu/drm/msm/dcp/dcp_dpu_kms.h
+++ b/drivers/gpu/drm/msm/dcp/dcp_dpu_kms.h
@@ -44,6 +44,8 @@ struct dcp_dpu_kms {
 #define to_dcp_dpu_kms(x) container_of(x, struct dcp_dpu_kms, base)
 struct drm_crtc *dcp_dpu_kms_get_crtc(struct dcp_dpu_kms *dcp_kms,
 				      u32 display_id);
+bool dcp_dpu_kms_needs_dirtyfb(struct dcp_dpu_kms *dcp_kms,
+			       struct drm_crtc *crtc);
 int dcp_dpu_kms_prepare_crtc_session(struct dcp_dpu_kms *dcp_kms,
 				     struct drm_crtc *crtc);
 

-- 
2.43.0

