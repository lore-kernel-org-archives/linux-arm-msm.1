Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F743FADF1
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 23:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791328666; cv=none; b=gD6h9x5R0qfO0mdme0CEZ6dHNvo9r9dq59+v6nSgvdrdO2U5nuCRzBf/Tie/gTyeRlu/wdodpyoHkX3WjT6mHz06Uin6vNNQHdwCgNyNB1ZR28Csmduz90cBsURiwEEiwM9T1nj3Vh4BZKIaLgkkmQoX1tW27hxrwvkpAq2GNLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791328666; c=relaxed/simple;
	bh=nq5GQBYmBcJJlF/OscucEwoi8ZcPaQT+jHDtLcec2DE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uNLUJy7vJB9pCFRUoDFIObLU2RKLOf4BsM/SDyHxWZD/fED0QT0auZB3/rdPs0FTkkLOXVmFGtb9OKWJ8gNhT8f1Gmb4yoHGg1BGvnvWWK99AFTyKQgB5GowkPSKG/FYeclevfqht4cm933HuxQxlq4mJBAG4IPwebVfsq6C3MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jly0s1r9 reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jly0s1r9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LePc72011404
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 22:41:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2OgK+5VU1xO
	ZNSYWMPQk+XRBlPXCnQKtpW8Z8IQjuNw=; b=jly0s1r9cd3jLFKrTs/c7KVxDli
	jKPs7g428Nkae12op/fl0lRnnjnozCnwQXGH3dbU27kp2pHDJGyPQXbrZQ46Sjjt
	J8TJDTrk5yDRlhVQ1uEWx3NpgYhRBXo369pw/IpIfgSmpRuoyQ+hiK5ekbq+i8Fe
	rfVi1dPpmJUEX8J2ecSfCpS7t63lwU/VsEv9+emhmBZznXu3E1O+qgKtZJ+uWJPV
	YS7HTxl63L4Xi7jr4+bmyBEk9mYNkbeLo0mELzgo3CcrhwfcQSVGc5RdZaX3rnHB
	MgznA/ozwcHU6Rs+NFN+sz4Uwr6TmhKtHO+MwZ5Qk+gw6KxDtB9Ab1aAyFA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xc9u1t6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 22:41:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a3f673221so865443685a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 15:41:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326487; x=1791931287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2OgK+5VU1xOZNSYWMPQk+XRBlPXCnQKtpW8Z8IQjuNw=;
        b=dl+/1Tf2SGcRVEWzSlieBrgW4XVAran8a6o5NPI3tf5/m2ZMDzTvNUF+5yRtJGEDvA
         S3guKOZOS2EdyLslBYiKifNiHCja2aKTvvMbsDOMzfgZXDcaV1WMtCswi5Kf3qmcHZDr
         /TjBFccOrBdDN694qwGr/IeAT5h/oHPkfycSTXIlYmLPSGUD7mflKnEn0jdEkMQh9636
         GFtIe3btjz8vfzgF/uQmGbjeuD9cHqgwjHucYXKpOjDPmm5NmVaMIibnV7Zt/oHqhmOU
         XqsJyRYrGiAk1tsDXcbDrwB+tU3Sd5dVt/uaITKn3QD8xIEX7np44MHTjnsPYrSh6+IR
         8zKQ==
X-Forwarded-Encrypted: i=1; AKwUvBx5ZOL+ccyJ69LF/swVG5alYHrFsb74V2y4q7m49XKg5q94IZhwJ+6KS4ko+BQsh+PsujLTgMSbM4KasXq7@vger.kernel.org
X-Gm-Message-State: AFuF++nVjqtGTxOQimAWS9hHuLruhm4MvXttPAgdPD6xebGlzZrYOeAP
	q7FeW6hddHJxEjpIdrB2eizt4ZZmvN6VhhzCw4EBPmJrsbRc6aHdK0h8hZHMuEVZ388YYfgBxqG
	TYXPF/87KRqNtu6gRNJPydypisx/ut3DlJgirJ43T59kTPIaBRKa13NYP/qVGMqcKzLE2blJ6wG
	egZCo=
X-Gm-Gg: AYBFou1ceiyzEE5Wpl8BJHcAVSIH/aS4KPriSeddW60bhh/Oi0ggWGgtut9Jd9uQjnj
	o3SJWTAYM38EIvaYQUB8QUa8u/e64SNAASvROb8JR4F6mLif3b9IqI0+VMYsxzmX+cQTHNTgsyh
	+autMk590n1WCdZ/OtM9+zb9jd9fgHvODGC6ORXC5YCjLm1lA+VIA/VBBAo9kKsBoRxRRH1A0dQ
	iWsA2XbOkwjlECakbW5VvRhLcpwkU2dCW1RpnMuhsPMDeOq8yHrHfjh/qO5GYvUAuKClASRzlpM
	cretZ14K+7OLYOlVAJCPHKO4Zrv1Jiff+uMg1g5KdEsXM6IMaA3XpcTkwe0=
X-Received: by 2002:a05:620a:444e:b0:93e:92b8:e373 with SMTP id af79cd13be357-93e9b2e7cf7mr78603285a.4.1791326486822;
        Tue, 06 Oct 2026 15:41:26 -0700 (PDT)
X-Received: by 2002:a05:620a:444e:b0:93e:92b8:e373 with SMTP id af79cd13be357-93e9b2e7cf7mr78596485a.4.1791326486167;
        Tue, 06 Oct 2026 15:41:26 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:25 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
Subject: [PATCH 31/45] media: qcom: camss: sa8775p: add IFE pad descriptors
Date: Wed,  7 Oct 2026 01:39:39 +0300
Message-Id: <20261006223953.3382273-32-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ctMOAF4i c=1 sm=1 tr=0 ts=6ac57917 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=WTs1eqox__SFtV2_NwcA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX9bsLH1vXT5zH
 LxCZGojhXoUClY8UNw6v+PNEeAxpxH/lQIIiMh0LnkNw1oWD4X4VqV29558AT3nIxTUDSFgyKoO
 YNwRDm83KITreKJjq6/cjnSX6YHB/So=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX9tkIb2J0HxkK
 UFla2I1GcOvrbHIN5RFZfcG1bpErWbDKb0E7qTwVWZuaAiUE4dr+XsDGRBNfN67ytCD89za11U/
 iqFIYuR7rgPH6DvhgQdtePZCds2FWJ6qqVxOyx2OPrwXbeObkP8gtYQr+bRaB48prBFXHiLHuJ9
 EJkwewyqKg3JdhDus71aZFkbiiH0rbiSotKJgcWiPfLxG94JKsX5Ytkb2TJ0i02YvmtBQErGdLT
 l2CiK3eARziYvpcT9CVZ5YWszdwc+1VXEqFXZ6IsTwmJPmTGy4XyiSETMfX6XdIU9eBGKtl543R
 SglD1xessb5ZbYDCBMbeFOpe4Oln/R8lWV6b3Cxv0kZeyCCokleDwatr2/BcLwYJGn6C9iOJVLx
 KDkd9PQcdhtxn/fp8wDhYccdkb7ICbUXzDmxtIDIr6kn78cUcYkDpex78AhLyW3ZSB2MoNC9t91
 kkEwjJGlC3srQ+3QAlw==
X-Proofpoint-ORIG-GUID: aO3AC_WKGCPhpi2Fwzu_DLk0YQ7k9tP_
X-Proofpoint-GUID: aO3AC_WKGCPhpi2Fwzu_DLk0YQ7k9tP_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Describe the SA8775P full and lite IFE pads and write masters.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-ife-pads.c      | 216 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-ife.h |   2 +
 2 files changed, 218 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-ife-pads.c b/drivers/media/platform/qcom/camss/camss-ife-pads.c
index 7a4e41c9660b..b1e6204ceb21 100644
--- a/drivers/media/platform/qcom/camss/camss-ife-pads.c
+++ b/drivers/media/platform/qcom/camss/camss-ife-pads.c
@@ -358,3 +358,219 @@ const struct ife_pads_descriptors ife_pads_v20x = {
 	.num_desc = ARRAY_SIZE(ife_pad_desc_v20x),
 	.desc = ife_pad_desc_v20x,
 };
+
+static const struct ife_pad_limits ife_vid_limits_v30x = {
+	.min_width	= 320,
+	.min_height	= 240,
+	.max_width	= 16384,
+	.max_height	= 16384,
+	.max_h_ratio	= 16,
+	.max_v_ratio	= 16,
+};
+
+static const struct ife_pad_limits ife_vid_limits_v41x = {
+	.min_width	= 16,
+	.min_height	= 16,
+	.max_width	= 16384,
+	.max_height	= 16384,
+	.max_h_ratio	= 64,
+	.max_v_ratio	= 64,
+};
+
+static const struct ife_pad_desc ife_lite_pad_desc_v30x[] = {
+	{
+		.pad_flags = MEDIA_PAD_FL_SINK,
+		.sup_fmts = {
+			.nformats = ARRAY_SIZE(ife_sink_fmts_v20x),
+			.formats = ife_sink_fmts_v20x,
+		},
+		.limits = &ife_vid_limits_v30x,
+	},
+	{
+		.pad_flags = MEDIA_PAD_FL_SOURCE,
+		.sup_fmts = {
+			.nformats = ARRAY_SIZE(ife_sink_fmts_v20x),
+			.formats = ife_sink_fmts_v20x,
+		},
+		.limits = &ife_vid_limits_v30x,
+		.video_name = "rdi0",
+		.link_flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.output = CAMSS_IFE_OUTPUT_RDI0,
+		.hw_pipe = CAMSS_IFE_HW_PIPE_RDI0,
+		.packing_fmt = 0x0,
+		.mode_config = BUSWR_CLIENT_CFG_MODE_FRAME_BASED,
+		.num_wms = 1,
+		.wm = { 0 },
+	},
+	{
+		.pad_flags = MEDIA_PAD_FL_SOURCE,
+		.sup_fmts = {
+			.nformats = ARRAY_SIZE(ife_sink_fmts_v20x),
+			.formats = ife_sink_fmts_v20x,
+		},
+		.limits = &ife_vid_limits_v30x,
+		.video_name = "rdi1",
+		.link_flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.output = CAMSS_IFE_OUTPUT_RDI1,
+		.hw_pipe = CAMSS_IFE_HW_PIPE_RDI1,
+		.packing_fmt = 0x0,
+		.mode_config = BUSWR_CLIENT_CFG_MODE_FRAME_BASED,
+		.num_wms = 1,
+		.wm = { 1 },
+	},
+	{
+		.pad_flags = MEDIA_PAD_FL_SOURCE,
+		.sup_fmts = {
+			.nformats = ARRAY_SIZE(ife_sink_fmts_v20x),
+			.formats = ife_sink_fmts_v20x,
+		},
+		.limits = &ife_vid_limits_v30x,
+		.video_name = "rdi2",
+		.link_flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.output = CAMSS_IFE_OUTPUT_RDI2,
+		.hw_pipe = CAMSS_IFE_HW_PIPE_RDI2,
+		.packing_fmt = 0x0,
+		.mode_config = BUSWR_CLIENT_CFG_MODE_FRAME_BASED,
+		.num_wms = 1,
+		.wm = { 2 },
+	},
+	{
+		.pad_flags = MEDIA_PAD_FL_SOURCE,
+		.sup_fmts = {
+			.nformats = ARRAY_SIZE(ife_sink_fmts_v20x),
+			.formats = ife_sink_fmts_v20x,
+		},
+		.limits = &ife_vid_limits_v30x,
+		.video_name = "rdi3",
+		.link_flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.output = CAMSS_IFE_OUTPUT_RDI3,
+		.hw_pipe = CAMSS_IFE_HW_PIPE_RDI3,
+		.packing_fmt = 0x0,
+		.mode_config = BUSWR_CLIENT_CFG_MODE_FRAME_BASED,
+		.num_wms = 1,
+		.wm = { 3 },
+	},
+};
+
+const struct ife_pads_descriptors ife_lite_pads_v30x = {
+	.num_desc = ARRAY_SIZE(ife_lite_pad_desc_v30x),
+	.desc = ife_lite_pad_desc_v30x,
+};
+
+static const struct ife_pad_desc ife_pad_desc_v41x[] = {
+	{
+		.pad_flags = MEDIA_PAD_FL_SINK,
+		.sup_fmts = {
+			.nformats = ARRAY_SIZE(ife_sink_fmts_v20x),
+			.formats = ife_sink_fmts_v20x,
+		},
+		.limits = &ife_vid_limits_v41x,
+	},
+	{
+		.pad_flags = MEDIA_PAD_FL_SOURCE,
+		.sup_fmts = {
+			.nformats = ARRAY_SIZE(ife_vid_pix_fmts_v20x),
+			.formats = ife_vid_pix_fmts_v20x,
+		},
+		.limits = &ife_vid_limits_v41x,
+		.video_name = "vid_full",
+		.link_flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.output = CAMSS_IFE_OUTPUT_VID_FULL,
+		.hw_pipe = CAMSS_IFE_HW_PIPE_PP,
+		.packing_fmt = 0x1,
+		.mode_config = BUSWR_CLIENT_CFG_MODE_LINE_BASED,
+		.num_wms = 2,
+		.wm = { 0, 1 },
+	},
+	{
+		.pad_flags = MEDIA_PAD_FL_SOURCE,
+		.sup_fmts = {
+			.nformats = ARRAY_SIZE(ife_vid_pix_fmts_v20x),
+			.formats = ife_vid_pix_fmts_v20x,
+		},
+		.limits = &ife_vid_limits_v41x,
+		.video_name = "disp_full",
+		.link_flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.output = CAMSS_IFE_OUTPUT_DISP_FULL,
+		.hw_pipe = CAMSS_IFE_HW_PIPE_PP,
+		.packing_fmt = 0x1,
+		.mode_config = BUSWR_CLIENT_CFG_MODE_LINE_BASED,
+		.num_wms = 2,
+		.wm = { 3, 4 },
+	},
+	{
+		.pad_flags = MEDIA_PAD_FL_SOURCE,
+		.sup_fmts = {
+			.nformats = ARRAY_SIZE(ife_sink_fmts_v20x),
+			.formats = ife_sink_fmts_v20x,
+		},
+		.limits = &ife_vid_limits_v41x,
+		.video_name = "rdi0",
+		.link_flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.output = CAMSS_IFE_OUTPUT_RDI0,
+		.hw_pipe = CAMSS_IFE_HW_PIPE_RDI0,
+		.packing_fmt = 0x0,
+		.mode_config = BUSWR_CLIENT_CFG_MODE_FRAME_BASED,
+		.num_wms = 1,
+		.wm = { 16 },
+	},
+	{
+		.pad_flags = MEDIA_PAD_FL_SOURCE,
+		.sup_fmts = {
+			.nformats = ARRAY_SIZE(ife_sink_fmts_v20x),
+			.formats = ife_sink_fmts_v20x,
+		},
+		.limits = &ife_vid_limits_v41x,
+		.video_name = "rdi1",
+		.link_flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.output = CAMSS_IFE_OUTPUT_RDI1,
+		.hw_pipe = CAMSS_IFE_HW_PIPE_RDI1,
+		.packing_fmt = 0x0,
+		.mode_config = BUSWR_CLIENT_CFG_MODE_FRAME_BASED,
+		.num_wms = 1,
+		.wm = { 17 },
+	},
+	{
+		.pad_flags = MEDIA_PAD_FL_SOURCE,
+		.sup_fmts = {
+			.nformats = ARRAY_SIZE(ife_sink_fmts_v20x),
+			.formats = ife_sink_fmts_v20x,
+		},
+		.limits = &ife_vid_limits_v41x,
+		.video_name = "rdi2",
+		.link_flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.output = CAMSS_IFE_OUTPUT_RDI2,
+		.hw_pipe = CAMSS_IFE_HW_PIPE_RDI2,
+		.packing_fmt = 0x0,
+		.mode_config = BUSWR_CLIENT_CFG_MODE_FRAME_BASED,
+		.num_wms = 1,
+		.wm = { 18 },
+	},
+	{
+		.pad_flags = MEDIA_PAD_FL_SINK,
+		.sup_fmts = {
+			.nformats = ARRAY_SIZE(ife_params_fmts_v20x),
+			.formats = ife_params_fmts_v20x,
+		},
+		.limits = &ife_meta_limits_v20x,
+		.video_name = "params",
+		.link_flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED,
+		.buf_type = V4L2_BUF_TYPE_META_OUTPUT,
+		.meta_dataformat = V4L2_META_FMT_QC_IFE_PARAMS,
+		.meta_buffersize = PAGE_ALIGN(v4l2_isp_buffer_size(CAMSS_IFE_PARAMS_MAX_PAYLOAD)),
+	},
+};
+
+const struct ife_pads_descriptors ife_pads_v41x = {
+	.num_desc = ARRAY_SIZE(ife_pad_desc_v41x),
+	.desc = ife_pad_desc_v41x,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-ife.h b/drivers/media/platform/qcom/camss/camss-ife.h
index eff4ab4bd1c9..0ca276203bbb 100644
--- a/drivers/media/platform/qcom/camss/camss-ife.h
+++ b/drivers/media/platform/qcom/camss/camss-ife.h
@@ -395,6 +395,7 @@ camss_ife_pipe_for_stream_id(int nstreams,
 			     u32 id);
 
 extern const struct ife_pads_descriptors ife_pads_v20x;
+extern const struct ife_pads_descriptors ife_pads_v41x;
 extern const struct ife_hw_top_ops ife_top_20x_ops;
 extern const struct ife_hw_top_ops ife_top_v41x_ops;
 extern const struct ife_hw_buswr_ops ife_buswr_20x_ops;
@@ -402,6 +403,7 @@ extern const struct ife_hw_buswr_ops ife_buswr_31x_ops;
 extern const struct camss_mod_ops ife_mod_v10x_ops;
 
 extern const struct ife_pads_descriptors ife_lite_pads_v20x;
+extern const struct ife_pads_descriptors ife_lite_pads_v30x;
 extern const struct ife_hw_top_ops ife_lite_top_10x_ops;
 extern const struct ife_hw_top_ops ife_lite_top_30x_ops;
 
-- 
2.34.1

