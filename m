Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593617;
	b=Y8Eq+CfcLlknVcSuB1KmxnvZr7/8fxuCDrpVRiAgRpkmO4xVe9tz+lhq66jWYmI6h/Vq
	 TiDLI8pVZBKr1tvQxrwlk7hFnhpCnITBmBAyg+ycqMSHrhXAM8AZlg+MzqArU1ygLvvnF
	 Dj3ZUF5bhAdAJ4+0RQmg297RAvS/qxuUHfrS+cMsXzMap3UgwUudcz7uuO4tf1XBUjTmz
	 /cRBgG5Q07nsC+IlrMHRceeefynC63tZEr6YvaXDlJbagN6u6fkrW3aTUhX2jsL68+JCP
	 kpH0jx4FJok7QkR3EX+Kuil/Wu1yQZmcpqGUBBDWcjY4x/Da2HJWJqGANXTSBiSFqsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593617;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hADlrBrbVxL7sHIKyX9Ojx866T1cG9XUHCY966e5bRQ=;
	b=K79JMIZL1+SOsIOvWvP2oqk5slzi1HeGD9myCbsxIyGapVFxL8LIn7yijbbYvu6RDU/1
	 Qogioc17POrSazU3lkYcT+UY4XYhecLmsvpyjs318Fa78gekUUmRzLm2X7CHK8Bl1HVJs
	 XA/t1j+HtLxwEF/UQ0XlfCm/vKEg3iukUeLbKt1kp8WhREgmS+UJE0SQ3vhxQ0goBgyDs
	 EP9HmJmy/kYsQr5x7apo1dDt+eMKKzMEBCsSlDm81d0uCa/XtCfkC4JMCK5O2Kf6pZSlr
	 pA6lsn9M7+jMQPwsDl/jLguKHn5Jz0lUq5C8GD1A5zk9iz6v303oLswoUk15d6PZs+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=fail reason="signature verification failed" header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X0nytoAX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98D28606A6AF
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98D28606A6AF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X0nytoAX
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP691iO3261801
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hADlrBrbVxL
	7sHIKyX9Ojx866T1cG9XUHCY966e5bRQ=; b=X0nytoAXXq20wT/dV1kNtEXs0V2
	zzqRvSziTy6Ae95+raNXWq10F8Fiyy5UBpGrDo63YGCIDXH6b3yjv1GkTHktcwJ2
	VSSIEKzt0Xl0/G/CwlP2z+iTNe30Axihc445Ulg3c1A2XrFkLgoyw+4I52C2w+Nj
	doOn7+7ILH8cyZyJITAcuW/j5WGi+GOO2zVmtR/6FQCHMx2pOaTVFEkpVbDqMaQZ
	9dMGvH0iEoGpqt9ZeNnA6A9V/mWql8Dimkmnn73Y0jtS7wk6nLA8hkC1z8DC8TE2
	2CdeKHfBDvVaLafkZL2XlfvBB5AQ5eL6+uVeWsYYo3Fh5vscJOMUNALLhRw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5egsb2et-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:00:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-94967c6d4f4so594878385a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 00:00:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593615; x=1796198415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hADlrBrbVxL7sHIKyX9Ojx866T1cG9XUHCY966e5bRQ=;
        b=Jt/rxBnoBsLEIQJQCmO5MT3bI/zSaPPDIKtEvZaOgE52hzNJh4Oxg59jM4BYMHJ4/f
         uNuTsMdjWUB2IY9KUW8ZEoE13lDAzv7pY9v8TSb7fgGh/VUHUATTXEh5KC95FCMu1aIG
         hEloLXwCinelaDgefwyDJ9beeX7AAPWVClFxqbmpZJGqhaQ82weM+SPPT3Y9s15U1dUV
         F0Y9W8I37wgeVu9ep5h+Q6vcLcQasL8SMYk3mDVg+R2AP0g7zvZGWWuedsGCuLM3hUl0
         pC9hUivHyupWUNFCl9rlFQvCuNrAafXHOQgFOxSbSqtLntMV5uoOPuI8gF8W2VZYti8k
         +WSw==
X-Forwarded-Encrypted: i=1; AL+hErF/IztJK2xCdOjayWtdaM3yzKva8k8iLMkJXmVH8kynvkqUv7dYv95SiWmVCtgYnScyyGfXxWtpQsGKRvi6@vger.kernel.org
X-Gm-Message-State: APuU4Z+PL49teUTaG+l7unKi9/qHl3DtmFSRSPOdaRy6IVBYV57GyeIx
	IBcs/iTFRYFKSce2/EuHp9ObcGO5CXpFajVYJi2JGlhZn+XFx26FWgIFMThYNO4tX1Juc8hS/G9
	MJhmP+63DuWYtdyQtvCaCKoOP6NXLyu5PsJ90rE4s/nCOJVajeB2EahwqdFE7BZrKYA4d
X-Gm-Gg: AZFdTZdTW3xcluO7VY8GHUrWDFdza93+gr7CZvJeZ/aN1vGyUEoChkrwPj3mx4FqUCr
	aDpP6OGlliLXle8+svruaboHXYJcakR7rjANTT7iVMZ3swJGbTGS9z9zvx4Ba00qMQy9uSslDam
	dvNJ3EHqaIgXFOWual/6IeagS9mU/zRBg1nROWKrsLO8f8eLPx5odE53BNNrOTD+EzYeV+hHupx
	9IllCfASKUQ6nQg3Vf0fMjp0Jk8/zL1T9Yo1BF6ZPtvi1w4ounva9+DU5guvqsrRdgTlDvVqfdp
	aYghFUYOTJe5eb7nAkI8xxJ386zW7YNt+HAV8DDt3RJ7FxDGY8GARlTsrwZHSxByeqXpijVT0z6
	eKvZdBhGmFX5EsDLg0ITgwkPPS4o1pYnk
X-Received: by 2002:a05:620a:838a:b0:949:7427:5e7c with SMTP id af79cd13be357-949bac80de4mr2860524985a.81.1795593614161;
        Wed, 25 Nov 2026 00:00:14 -0800 (PST)
X-Received: by 2002:a05:620a:838a:b0:949:7427:5e7c with SMTP id af79cd13be357-949bac80de4mr2860517985a.81.1795593613557;
        Wed, 25 Nov 2026 00:00:13 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm585912015e9.11.2026.11.25.00.00.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:00:12 -0800 (PST)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH v2 04/12] media: qcom: camss: Add streams API support for CSIPHY
Date: Wed, 25 Nov 2026 09:59:53 +0200
Message-Id: <20261125080001.2540101-5-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfX4yWN6BctNgpl
 8jtFjlFiq5HFpa3hW6tw+0fQGGbEWmNiusf+vaRQNk5MqdrBHZgAixImTaAdeh8z7F26G9fglx2
 bBDoeES+RGMw7tJVS+MDTygZl2wAiMZry/gpHzIVC9kK6tNfh+NrxJDMhQOwS7HBZ88Rcw15NFk
 FN0zOgAUwtGhLIL/nSixRcQuxzDbdV/Pj3x11/6MetLRWHM7QOu4bWELHN82RlxycEF5wgS9/q3
 62IFvCl394x+9lcwPWHx49+5ONS9TLwVYeOxAfFWVHCjD+QxiZX0uaI23yjpV7m2V/wFCKMiCQ6
 SK28F++a5IRcMYyjgo+CW9E8z33rRPU3Fht9IoKN+sKs2nSwiWYE8FAg9HobXiy2ZfumghjPMRd
 4zMVMcYdld+mn9/k4ZoIq9FHS1RM0mkPDRR9LoPBPyT1/7acs5ox7qmQChV3N8U/iPWtYy5ZUBs
 wa1X3Hl2TdnCCzHd/Rw==
X-Proofpoint-GUID: xlbD6K0LCusrWOy28EzvNwm6pvkIPtis
X-Proofpoint-ORIG-GUID: xlbD6K0LCusrWOy28EzvNwm6pvkIPtis
X-Authority-Analysis: v=2.4 cv=Zt54uN7G c=1 sm=1 tr=0 ts=6b06958f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=ZovgdgjKAAAA:8
 a=CSZ2BPkJjCIGR7Ahi8IA:9 a=PEH46H7Ffwr30OY-TuGO:22 a=VOxKbm1zgHvARWIDjr3b:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfX/7/uwRdfoNTu
 UaIPPAGEwwVYMK3k+/W+uIXd9qGOroRUc/Wacb7ghvrkg18dXpRCbqDS2wkuOoknpFfn8VDBMew
 QP+kh+MeXNP4G9halw0OqTQRcqOP4LI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250031

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Implement the V4L2 subdev streams API (enable_streams/disable_streams,
set_routing) on CSIPHY, selected per SoC via the new streams_enable
field on struct camss_resources.

The shared D-PHY lanes are enabled once, on the transition to an
active state, and torn down once no sink stream is referenced by any
source pad any more. CSIPHY has no per-VC demux, so every route must
pass a sink stream straight through as the same source stream; a
multi-VC sensor is supported by userspace adding further routes via
.set_routing.

CSIPHY can be wired through either the legacy s_power/s_stream path
or the generic PHY framework (camss->legacy_phy); the streams-API
pad ops are shared between both, with enable/disable dispatching to
the matching backend.

Co-developed-by: Hitesh Patel <hitesh@ebytelogic.com>
Signed-off-by: Hitesh Patel <hitesh@ebytelogic.com>
Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-csiphy.c  | 249 +++++++++++++++++-
 .../media/platform/qcom/camss/camss-csiphy.h  |   1 +
 2 files changed, 244 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/media/platform/qcom/camss/camss-csiphy.c
index f99eea2ef228..41df8f1dad83 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
@@ -421,6 +421,129 @@ static int csiphy_set_stream(struct v4l2_subdev *sd, int enable)
 	return ret;
 }
 
+/*
+ * csiphy_streams_set_stream - Enable/disable streaming on CSIPHY module
+ * @sd: CSIPHY V4L2 subdevice
+ * @enable: Requested streaming state
+ *
+ * Dispatches to the legacy or generic PHY depending on how this
+ * CSIPHY instance is wired, mirroring msm_csiphy_register_entity().
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int csiphy_streams_set_stream(struct v4l2_subdev *sd, int enable)
+{
+	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
+
+	if (csiphy->camss->legacy_phy)
+		return csiphy_set_stream_legacy(sd, enable);
+
+	return csiphy_set_stream(sd, enable);
+}
+
+/*
+ * csiphy_pad_enable_streams - Enable one or more streams on the source pad
+ * @sd: CSIPHY V4L2 subdevice
+ * @state: V4L2 subdevice state
+ * @pad: Pad number
+ * @streams_mask: Bitmask of streams to enable
+ *
+ * The shared PHY lanes are enabled once, on the transition to an active
+ * state. The sink stream(s) are propagated upstream to the sensor only for
+ * streams which are inactive, so a stream that's already running is never
+ * redundantly re-propagated.
+ *
+ * CSIPHY is only ever linked to a single entity on its source pad, and that
+ * entity is responsible for only enabling a stream on this pad while it
+ * itself still needs it, so no cross-consumer refcounting is needed here.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int csiphy_pad_enable_streams(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state,
+				     u32 pad, u64 streams_mask)
+{
+	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
+	struct media_pad *remote_pad =
+		media_pad_remote_pad_first(&csiphy->pads[MSM_CSIPHY_PAD_SINK]);
+	u64 sink_streams, propagate_mask;
+	int ret;
+
+	if (!csiphy->enabled_streams) {
+		ret = csiphy_streams_set_stream(sd, 1);
+		if (ret)
+			return ret;
+	}
+
+	sink_streams = v4l2_subdev_state_xlate_streams(state, pad, MSM_CSIPHY_PAD_SINK,
+						       &streams_mask);
+
+	propagate_mask = sink_streams & ~csiphy->enabled_streams;
+	if (propagate_mask) {
+		struct v4l2_subdev *remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+
+		ret = v4l2_subdev_enable_streams(remote_sd, remote_pad->index, propagate_mask);
+		if (ret) {
+			if (!csiphy->enabled_streams)
+				csiphy_streams_set_stream(sd, 0);
+
+			return ret;
+		}
+	}
+	csiphy->enabled_streams |= sink_streams;
+
+	return 0;
+}
+
+/*
+ * csiphy_pad_disable_streams - Disable one or more streams on the source pad
+ * @sd: CSIPHY V4L2 subdevice
+ * @state: V4L2 subdevice state
+ * @pad: Pad number
+ * @streams_mask: Bitmask of streams to disable
+ *
+ * The shared PHY lanes, and the propagation to the sensor, are only torn
+ * down once no sink stream is referenced by any source pad any more.
+ *
+ * CSIPHY is only ever linked to a single entity on its source pad, and that
+ * entity is responsible for only disabling a stream on this pad once it no
+ * longer needs it, so no cross-consumer refcounting is needed here.
+ * If error occurs propagate the error but continue to disable the streams
+ * on best effort.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int csiphy_pad_disable_streams(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *state,
+				      u32 pad, u64 streams_mask)
+{
+	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
+	struct media_pad *remote_pad =
+		media_pad_remote_pad_first(&csiphy->pads[MSM_CSIPHY_PAD_SINK]);
+	u64 sink_streams;
+	int ret = 0;
+
+	sink_streams = v4l2_subdev_state_xlate_streams(state, pad, MSM_CSIPHY_PAD_SINK,
+						       &streams_mask);
+
+	csiphy->enabled_streams &= ~sink_streams;
+
+	if (!csiphy->enabled_streams)
+		ret = csiphy_streams_set_stream(sd, 0);
+
+	if (sink_streams) {
+		struct v4l2_subdev *remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+		int remote_ret;
+
+		remote_ret = v4l2_subdev_disable_streams(remote_sd, remote_pad->index,
+							 sink_streams);
+		if (!ret)
+			ret = remote_ret;
+	}
+
+	return ret;
+}
+
 /*
  * __csiphy_get_format - Get pointer to format structure
  * @csiphy: CSIPHY device
@@ -881,6 +1004,71 @@ static int csiphy_link_setup(struct media_entity *entity,
 	return 0;
 }
 
+static int csiphy_init_state(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state)
+{
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = MSM_CSIPHY_PAD_SINK,
+			.sink_stream = 0,
+			.source_pad = MSM_CSIPHY_PAD_SRC,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+	};
+	struct v4l2_subdev_krouting routing = {
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+
+	/*
+	 * CSIPHY has no per-VC demux, so every sink stream (VC) a
+	 * multi-stream sensor may drive must pass straight through as the
+	 * same source stream, or downstream link validation (e.g. against
+	 * CSID's multi-pad sink) will flag it as dangling. A multi-VC sensor
+	 * is supported by userspace adding further routes via .set_routing;
+	 * this default covers the common single-VC case.
+	 */
+	return v4l2_subdev_set_routing(sd, state, &routing);
+}
+
+/*
+ * csiphy_set_routing - Set routing for the CSIPHY subdev
+ * @sd: CSIPHY V4L2 subdevice
+ * @state: V4L2 subdevice state
+ * @which: Type of format state (V4L2_SUBDEV_FORMAT_ACTIVE or TRY)
+ * @routing: Routing table to set
+ *
+ * CSIPHY has no per-VC demux, so every route must pass a sink stream
+ * straight through as the same source stream.
+ *
+ * Return 0 on success or a negative error code otherwise
+ */
+static int csiphy_set_routing(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *state,
+			      enum v4l2_subdev_format_whence which,
+			      struct v4l2_subdev_krouting *routing)
+{
+	struct csiphy_device *csiphy = v4l2_get_subdevdata(sd);
+	unsigned int i;
+	int ret;
+
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE && csiphy->enabled_streams)
+		return -EBUSY;
+
+	for (i = 0; i < routing->num_routes; i++)
+		if (routing->routes[i].sink_stream != routing->routes[i].source_stream)
+			return -EINVAL;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_NO_STREAM_MIX |
+					   V4L2_SUBDEV_ROUTING_NO_N_TO_1);
+	if (ret)
+		return ret;
+
+	return v4l2_subdev_set_routing(sd, state, routing);
+}
+
 static const struct v4l2_subdev_core_ops csiphy_core_ops_legacy = {
 	.s_power = csiphy_set_power_legacy,
 };
@@ -911,10 +1099,40 @@ static const struct v4l2_subdev_ops csiphy_v4l2_ops = {
 	.pad = &csiphy_pad_ops,
 };
 
+static const struct v4l2_subdev_pad_ops csiphy_streams_pad_ops = {
+	.enum_mbus_code = csiphy_enum_mbus_code,
+	.enum_frame_size = csiphy_enum_frame_size,
+	.get_fmt = csiphy_get_format,
+	.set_fmt = csiphy_set_format,
+	.get_frame_desc = v4l2_subdev_get_frame_desc_passthrough,
+	.set_routing = csiphy_set_routing,
+	.enable_streams = csiphy_pad_enable_streams,
+	.disable_streams = csiphy_pad_disable_streams,
+};
+
+static const struct v4l2_subdev_video_ops csiphy_streams_video_ops = {
+	.s_stream = v4l2_subdev_s_stream_helper,
+};
+
+static const struct v4l2_subdev_ops csiphy_streams_v4l2_ops_legacy = {
+	.core = &csiphy_core_ops_legacy,
+	.pad = &csiphy_streams_pad_ops,
+	.video = &csiphy_streams_video_ops,
+};
+
+static const struct v4l2_subdev_ops csiphy_streams_v4l2_ops = {
+	.pad = &csiphy_streams_pad_ops,
+	.video = &csiphy_streams_video_ops,
+};
+
 static const struct v4l2_subdev_internal_ops csiphy_v4l2_internal_ops = {
 	.open = csiphy_init_formats,
 };
 
+static const struct v4l2_subdev_internal_ops csiphy_streams_internal_ops = {
+	.init_state = csiphy_init_state,
+};
+
 static const struct media_entity_operations csiphy_media_ops = {
 	.link_setup = csiphy_link_setup,
 	.link_validate = v4l2_subdev_link_validate,
@@ -934,15 +1152,21 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
 	struct media_pad *pads = csiphy->pads;
 	struct camss *camss = csiphy->camss;
 	struct device *dev = camss->dev;
+	bool streams_api = camss->res->streams_enable;
 	int ret;
 
-	if (camss->legacy_phy)
-		v4l2_subdev_init(sd, &csiphy_v4l2_ops_legacy);
+	if (streams_api)
+		v4l2_subdev_init(sd, camss->legacy_phy ? &csiphy_streams_v4l2_ops_legacy
+							: &csiphy_streams_v4l2_ops);
 	else
-		v4l2_subdev_init(sd, &csiphy_v4l2_ops);
+		v4l2_subdev_init(sd, camss->legacy_phy ? &csiphy_v4l2_ops_legacy
+							: &csiphy_v4l2_ops);
 
-	sd->internal_ops = &csiphy_v4l2_internal_ops;
+	sd->internal_ops = streams_api ? &csiphy_streams_internal_ops
+					: &csiphy_v4l2_internal_ops;
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	if (streams_api)
+		sd->flags |= V4L2_SUBDEV_FL_STREAMS;
 	snprintf(sd->name, ARRAY_SIZE(sd->name), "%s%d",
 		 MSM_CSIPHY_NAME, csiphy->id);
 	sd->grp_id = CSIPHY_GRP_ID;
@@ -965,10 +1189,18 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
 		return ret;
 	}
 
+	if (streams_api) {
+		ret = v4l2_subdev_init_finalize(sd);
+		if (ret) {
+			dev_err(dev, "Failed to finalize subdev: %d\n", ret);
+			goto media_entity_err;
+		}
+	}
+
 	ret = v4l2_device_register_subdev(v4l2_dev, sd);
 	if (ret < 0) {
 		dev_err(dev, "Failed to register subdev: %d\n", ret);
-		goto media_entity_err;
+		goto subdev_cleanup_err;
 	}
 
 	if (!IS_ERR(csiphy->phy)) {
@@ -976,12 +1208,15 @@ int msm_csiphy_register_entity(struct csiphy_device *csiphy,
 		if (ret) {
 			dev_err(dev, "%s init fail %d\n", csiphy->name, ret);
 			v4l2_device_unregister_subdev(sd);
-			goto media_entity_err;
+			goto subdev_cleanup_err;
 		}
 	}
 
 	return 0;
 
+subdev_cleanup_err:
+	if (streams_api)
+		v4l2_subdev_cleanup(sd);
 media_entity_err:
 	media_entity_cleanup(&sd->entity);
 	return ret;
@@ -996,5 +1231,7 @@ void msm_csiphy_unregister_entity(struct csiphy_device *csiphy)
 	if (!IS_ERR(csiphy->phy))
 		phy_exit(csiphy->phy);
 	v4l2_device_unregister_subdev(&csiphy->subdev);
+	if (csiphy->camss->res->streams_enable)
+		v4l2_subdev_cleanup(&csiphy->subdev);
 	media_entity_cleanup(&csiphy->subdev.entity);
 }
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 8c3319f2ca1c..cd15369d132e 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -118,6 +118,7 @@ struct csiphy_device {
 	struct v4l2_mbus_framefmt fmt[MSM_CSIPHY_PADS_NUM];
 	const struct csiphy_subdev_resources *res;
 	struct csiphy_device_regs *regs;
+	u64 enabled_streams;
 };
 
 struct camss_subdev_resources;
-- 
2.34.1

