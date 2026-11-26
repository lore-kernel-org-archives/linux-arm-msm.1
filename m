Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795674673;
	b=20GlBhU864o+7v0XANFM8vM11bJrQbgc5+FBuXjNXy1sJzAaPOHEiFvoxo4Zj9rzXqZO
	 4tkLNxpShNeVAhNtqwpL1kRubSfwAEQ2Vwa5gVgKFdF41QY3ZOg6wmGbaSw/VeeZeqZiB
	 8ORHlAxSV3qjqA3SsqGGecV+NxymL4w/RLaj+K75kQq27ASzKZxi+6hZGL23euCrRNphT
	 U/y7sEPTq5sd0/Zall0jJQVu56scny+oHDCDQV+BO+aCaHJwltnCYkhJ47P2bzuJpyxXA
	 lzhZnfdIILaKWyqE4bl9fxuioT/MwxSFWQfMxnaQ6lk/Da1rG5Xmy/TaCRDgPAdY3sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795674673;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=C5GGOc8oVOwQL1zracf4Aiccz2TVlZ/+5Eg07kzdJm8=;
	b=QFuOutSP/nNFVJtAOUyv+NcLClcNny5L72VSm2LpJkaAx7ZncA7uHWHf33wkht8TsAwa
	 yb7WfKcHRtLiyxDe1pZPmbPc0NjBXRW8I7tcG0i1Dl42g0RdgZDdCWOSgoPEfsPvx4vrm
	 7n6BvZnjCaQ/p1fjw/Y8+clefKhg7TiAijaWrA4Qe1QNvleeWkSFVgWCIetC8XhO8yAtL
	 VL5RZXc7JicLoKXBt92Du5xGO9nw7zCjhiRw4nhgleHx1auV+MssDZXmWs3Ym7Ff6dvoH
	 rP8p60/jlPyjRMKQNsUP64V4pdSfh789KEa1WU8au0ggr1s+dw42DilNxGTDEB781Qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o4VgiSc+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aI7Qi9dr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAB1606A332
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:31:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAAB1606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o4VgiSc+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aI7Qi9dr
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36Lcg1812795
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C5GGOc8oVOwQL1zracf4Aiccz2TVlZ/+5Eg07kzdJm8=; b=o4VgiSc+IjlJBprL
	P1sydzFuapof3HtAGtCTN12IU/F8MpSEk/tEuOel+FQ1pyS7Qs9I0WFKkTTZYW4g
	eb3q40OKbXW+Wa/scO1nAUfQZZOJIIFLuVjWyl6dQGcPG9S3GZ7NYsuAzm2lRx/O
	rUT2vtAISAOGdcX5b+VWVRosf64Vd8gx7qU6+1dVjF031GO2JQHka98WedSzhtac
	QalGctf2NGvDpkIe4eFmLXaKYvfPdOjhzuwWvN5pjL6qkJkzLOD0pTZjdW4nBGvl
	McE60gJxTkCqREBrnhYxtmy+GxPBMUxECOCRbFSlDCiFGjCO7uK5PZ+dY9fYf3P5
	/EttZw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ak00x2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:31:11 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2f04580de55so35877865ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 22:31:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795674670; x=1796279470; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C5GGOc8oVOwQL1zracf4Aiccz2TVlZ/+5Eg07kzdJm8=;
        b=aI7Qi9drNOBvlgG4WWelorQRMNNVCFpSO29PyOJP/KgHcfNqYJdGdHLeQT8QWRJIww
         Bt0Oo+91I0+JOPwhrwWCOCNV1GH5xIthBDNqvKKi3PyyCrdY+G9lxicUC+P5S+o/42YG
         xr1CHaCJyaYmrcPJ4BpRm6iEYoewKGJlqZx3DXaxBoC3F4otubwwbdJdk8RUzPT5u3jW
         GMpyCKAaAJeN38cD80sHqHX4QbBvaRSPSCc5HB0Msict+PtGOw0KpMBVKOY4dv9Zx9E3
         l4aipqg8MoKsdBxM1KHuTrhRtTvBEW99OpE+BAtJjM6t+6HH3q9sPytUH+9Y/sXPEAv7
         Fb+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795674670; x=1796279470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C5GGOc8oVOwQL1zracf4Aiccz2TVlZ/+5Eg07kzdJm8=;
        b=LEOUsVUBqIbFEfw0r+o+pe7bbaDBDGgof1fUDyukze6koIxiSw9wQIvBxXbWUm8cGf
         wB9dh2q9zXfSLl/QEKW5SDNp3ovjYFKhjsibR7eqqwvWK+2DEpcgSOtvYiC4pINlXVLN
         5duQKvr3+NUS0RARVsJZ2/kticQepCcyoe9Dj/iz2nh10+UI4o+WpDQFugTybYjrbBsQ
         TTU33usEvoOzyVO0Cs4h9JDlI2I4PiaI7ENnZb85I7NH7sGu6nKmua+/Xq528i76A7bg
         4Wbo+zJm1Z8OkQlvlcscGkAr8pei3C2eIqtMQ5bCatbSOB5iah7bFL63VIlNytEw1RUs
         q4UQ==
X-Forwarded-Encrypted: i=1; AL+hErEIzkGFLWBDBUpfzhQ8Xo5obiYLrGaeDPTbtb+1ZSoUPL/C+0/WwmOj7hmsh9rNLEXb6/7XkZGh47682Dhh@vger.kernel.org
X-Gm-Message-State: APuU4Z9pfknZNG3tt4pttzSAES9kTQWY6yPgq6bzdpRqtNJ3gpeUixrp
	tGYGppOxi0VE2/WVDBnpI0+gK/zY+2t2CE2UcH/ihCnmk5jjflaLtiXXTsRct5OESRbKGd1L7E2
	J/Has06olP4K1lZ3kWa2DvwB7SEpX8xdRVS4k8xYjVvRSetN64mMwUt+8Wl2JEvkYTUXu
X-Gm-Gg: AZFdTZdlL5vsl7dDUrzTb3ECy8X5CoSce4Isl05k0AsJmw+VTT00IjH31qrpVEIk/Ao
	WIOkWqDe0OtpH0907RN5CIVF7RAQI3vT7e7L9Ra3ehWxRuKkqGjq0GNcQa/r09nhlS36FoYUw9X
	RMzRskkQTW6FxTM9cdopTTvNOvoIiOZLkO8XtQaAvJwQuR4DCDGmP3so+Rh7DIKKavx2udB/Uqw
	Q7T+gkagUKjhrv8UmfO2RtQV3OrAr8gprIfid4BnYmapoETN/9FF5jgJi0OgKxUmIMmTp8/rqKM
	Ifp8PggQernmoxamYkpBscjXKYITdsfkAZmwfHkLgOv5NGR6K27ZQrDlAx1+h8nvX/KNiA2vwQ2
	LdI/+J6HlsCcU+4PZzR8gn7AbQI6WiOXeUIpfwyquaEvaRnOMnmbH3fVYrlRz5VOKxoiMW2M37w
	vYIQpZaMXy
X-Received: by 2002:a17:902:d2cf:b0:2dd:b6e7:ac1b with SMTP id d9443c01a7336-2f03ef3d3b0mr219979445ad.2.1795674670370;
        Wed, 25 Nov 2026 22:31:10 -0800 (PST)
X-Received: by 2002:a17:902:d2cf:b0:2dd:b6e7:ac1b with SMTP id d9443c01a7336-2f03ef3d3b0mr219979215ad.2.1795674669896;
        Wed, 25 Nov 2026 22:31:09 -0800 (PST)
Received: from hu-jshekhar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f147a9esm97159715ad.72.2026.11.25.22.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 22:31:09 -0800 (PST)
From: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:59:20 +0530
Subject: [PATCH v3 12/21] drm/msm/dcp: Route HFI display events
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
Message-Id: <20261126-jshekhar-v3-dcp-v3-12-f1e9d7505039@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795674555; l=2910;
 i=jayant.shekhar@oss.qualcomm.com; s=20260925; h=from:subject:message-id;
 bh=VWK4/UwyAvpFlPWiL66iknJDfq5LuqTWaIlitzv+KBg=;
 b=GxHdeYgBOWvxunhh4p7VwZl0lWR2ttSQn8vZyq1yzTIeaSYkODpAOAb/+gXaFjNy8v+Q30EUB
 /Zmw4bxHQArBfPx9XKKJNFWtDQSrtguJh8D4/Bx+2dIwA3sVIJb3w7/
X-Developer-Key: i=jayant.shekhar@oss.qualcomm.com; a=ed25519;
 pk=saYTwtCCpug4b0Hz0jHFoATgDtdhFVicwMzDJo2z5ZE=
X-Authority-Analysis: v=2.4 cv=T4oZ3PKQ c=1 sm=1 tr=0 ts=6b07d22f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Qn8EL2Lg5JFZapOYTycA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 5JGiZbsgocgN53EQbdyoPuHKMUOtUJ0k
X-Proofpoint-GUID: 5JGiZbsgocgN53EQbdyoPuHKMUOtUJ0k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfX8UKKvC5zSUIS
 j5YSCzYa+8P2SoiMyAIGAPg4laibXg9zmZj1dA8lg0JWA/lgYsWPHzvHdJk1rdlbxACWXKZaDvj
 mpAQ/brdo9wDA5DGXbAcstKK9V/R9XKbOsjiG9Wi1PVlubFWk7VX0EQpUhtd8t1g6f59QqEfFVg
 4aPc2M8EGWYZEugMZhYf8vCLY6MfBpBi3zaTgCnOmvm13EBPwn6W+ASQ6Obulagc1DOgI+J2ctY
 c2NOYyYOMH4skr22isCOHzQyZd+QDrDZnEDT/LVe/oc3POVRxRGhfksdoWpNYaLazlRiTYd+gmw
 Hj2NBL72VLYVrmTghjGAgHXleYKvx53U7geCGg1i/JHS3ke7NjEzaoGy3ep3Z8v4gcuagMew+Tr
 fd4Ni42vK8dMVRKQJUYKLAoEbBSkIbbR1DvKIj+iRCRVKrYBdwtxUsS1QxvdK/yqrICsGjJOWtF
 dfLoBjnjisCxwCTRePA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAyNCBTYWx0ZWRfXzMvZAYyY7Z8B
 /vabe5tzNsrM1HJ2s2R0w4qMh1anX/QCb/ko58xy619ys8UQQZqrIlGyDFk57DvXcVI5MefHmHc
 xz7w8rzZimCC0Kpn2aIQsJP0b+3ONvA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260024

Route asynchronous display events from DCP firmware into the DRM CRTC
objects. Without this mapping, VSYNC and frame-scan completion cannot
drive DRM vblank and page-flip completion.

Match firmware display events to the corresponding CRTC session and
deliver VSYNC and frame-scan completion notifications through the
MSM DRM callbacks.

Assisted-by: LLM
Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dcp/dcp_hfi_core.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/msm/dcp/dcp_hfi_core.c b/drivers/gpu/drm/msm/dcp/dcp_hfi_core.c
index 1a1addd33877..3d0e15cae038 100644
--- a/drivers/gpu/drm/msm/dcp/dcp_hfi_core.c
+++ b/drivers/gpu/drm/msm/dcp/dcp_hfi_core.c
@@ -19,6 +19,7 @@
 #include "dcp_hfi.h"
 #include "dcp_hfi_priv.h"
 #include "dcp_drv.h"
+#include "dcp_crtc.h"
 #include "hfi/hfi_packet.h"
 #include "hfi/hfi_packer.h"
 #include "hfi/hfi_unpacker.h"
@@ -260,12 +261,41 @@ static void dcp_hfi_store_caps_payload(struct dcp_hfi *hfi,
 	dev_dbg(hfi->dev, "%s: stored %u bytes\n", name, n);
 }
 
+static void dcp_hfi_dispatch_frame_done(struct dcp_hfi *hfi,
+					const struct hfi_packet_info *pkt_info)
+{
+	const struct hfi_display_frame_event_data *frame = NULL;
+	u32 sequence_id = 0;
+	u64 timestamp_ns = 0;
+
+	if (pkt_info->payload_ptr &&
+	    pkt_info->payload_size >= sizeof(*frame)) {
+		frame = pkt_info->payload_ptr;
+		sequence_id = frame->bufferflip_index;
+		timestamp_ns = ((u64)frame->timestamp_hi << 32) |
+			       frame->timestamp_lo;
+	}
+	dcp_crtc_hfi_frame_done_cb(hfi->drv, pkt_info->id & 0xFFFF,
+				   sequence_id, timestamp_ns);
+}
+
 /* Route asynchronous events and capability packets before flag handling. */
 static bool dcp_hfi_dispatch_event(struct dcp_hfi *hfi,
 				   const struct hfi_packet_info *pkt_info)
 {
 	switch (pkt_info->cmd) {
 	case HFI_COMMAND_DISPLAY_EVENT_VSYNC: {
+		const struct hfi_display_vsync_data *vsync = NULL;
+		u64 timestamp_ns = 0;
+
+		if (pkt_info->payload_ptr &&
+		    pkt_info->payload_size >= sizeof(*vsync)) {
+			vsync = pkt_info->payload_ptr;
+			timestamp_ns = ((u64)vsync->timestamp_hi << 32) |
+				       vsync->timestamp_lo;
+		}
+		dcp_crtc_hfi_vblank_cb(hfi->drv, pkt_info->id & 0xFFFF,
+				       timestamp_ns);
 		return true;
 	}
 
@@ -273,6 +303,7 @@ static bool dcp_hfi_dispatch_event(struct dcp_hfi *hfi,
 		return true;
 
 	case HFI_COMMAND_DISPLAY_EVENT_FRAME_SCAN_COMPLETE:
+		dcp_hfi_dispatch_frame_done(hfi, pkt_info);
 		return true;
 
 	case HFI_COMMAND_DISPLAY_EVENT_HPD_STATUS:
@@ -950,6 +981,9 @@ int dcp_hfi_init(struct dcp_drv *drv,
 	struct dcp_hfi *hfi;
 	int i, ret;
 
+	if (!dma_dev)
+		return -ENODEV;
+
 	hfi = devm_kzalloc(&vdev->dev, sizeof(*hfi), GFP_KERNEL);
 	if (!hfi)
 		return -ENOMEM;

-- 
2.43.0

