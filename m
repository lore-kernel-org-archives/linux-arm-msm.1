Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593624;
	b=LB5YYU7HPL+QK9ZUfcsceb6uoqSdAXeVoL3nhaZX4u+pY6D/lJAdGfg6s6no3hWc18Jr
	 SS83mzYYM3lZN7p2XCFnSyVzPlYcrHW5wfX2+5TDFVcQwhxxKpQBUPOihJRvYkNJJDVOk
	 tXG4mLspEwQkLwPXfbKiZFFpcN85t29SkES0GYITijde1Iayom+2gbttB+zionR5cPFOC
	 1/ShcZBMY65/4wCgW0WH+y+VhkVjTwtOfhBqBbX3ewbNZ6E4WIl1by2Ky82+FLIZ9Wf3m
	 rEY+ULwhMCeRbN+Iv/8aLPJ5HFZEYNrU5UzncsuYLhz+au/af4HjPS3hKX+l76cj6zA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593624;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yCyt8QuKQSzfVTIM3Gt81h9YIy3R5vaw0IDEwLD54kg=;
	b=u39eUNyX3wNu2WaYpTrf7xemmqvQ11Xsuj2LRuR/tpJtQyxsirDcMfwxhoGB2/4U1toj
	 8eZq+nxA+HXIOOobycOiVV97PjLPAeDNwsqFXtYpnO1Zzk81pne8jvuQvXra5WWVsdjS3
	 L1lKO8S25EyGuXfWSlDv+awIT3OBUrgecOeYJgbsSvBT7M6L8ADKh7UpQj0TRGv/2v22L
	 Zrft3tPkIQMErR9NWkbnvbov9Xv0ygtub+ETZ/oETZwNLEK9EM+OqvL+UamfyUVLC3oQ2
	 Z8lGdv7CQtSMJZES9m/Gk+pztNEDufL9l9TPS5ZJdzno9YT1NCPa6aXo+AqFhgV5T7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=fail reason="signature verification failed" header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GClp8dkT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D6F606A6A1
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:00:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20D6F606A6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GClp8dkT
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68l363261024
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yCyt8QuKQSz
	fVTIM3Gt81h9YIy3R5vaw0IDEwLD54kg=; b=GClp8dkTaBY5wRgsk/L3HvvvCWT
	wSFNdHL+Pb/So2Ayx0xeGl8m8hDfh2J+FmvatPtNYQIP6N47bhKYiwlpD80S+igV
	a4SxLkV8x9p+AJ6kHzzJL1YvqrMM7gMJlQMEdfm8xXmp/C8aFKGzGEQ+4Tldy3ds
	x7gGpOdBACaI4ZLfv7Kt/wqC9Lqpv3DSJ1ZVftS6diQVAUDCqpdctriQnTigVSz3
	byxYCqvDvHpfPlbaBQ3NDd2HpGPgladObe37jBaeAH8nVQ9vM4kizbq5GhYClrlS
	MftSx+Q8jZGhtwQYE+oP7ri+qH7QBQ2lc0upwfG9OjJnoMfR+x7vZ8YytSA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5egsb2fr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:00:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495af07676so863688085a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 00:00:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593622; x=1796198422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yCyt8QuKQSzfVTIM3Gt81h9YIy3R5vaw0IDEwLD54kg=;
        b=rXTIIekYeATzVgI6yUbOl8rjfGsWJEjQv3XxdkZMy4wj897C3IH8Ah7SBJ9zWAepC4
         P6c55CwV5bOMh6X7s1A7n3Gql6EWqkS7lz8UxYEtgvzpMLqzDayqOMbpxZEC6fD9joKB
         KuD+tdqSZ4ICptdxYrIi4ZgIQKNpK/rPl0XBsudeMFEXzC6A5+6etnuyzHlpMnhRuYbR
         YKXYU/0/mRszt4Y4y2wHV0uTx/ltb8cnFtuR2N5i/NNy0RVG4N57fZT7z08mnqCo3w35
         +TsxYvB/ZPEL+j/thuBQCPLE5cXm0mrSV17fuf6CMk79NrhaKGRO7cF6G23I/Yv2Lkca
         R0cw==
X-Forwarded-Encrypted: i=1; AL+hErGI5divwOD4W1ofnzsnWAFeuloDrU0YKSVk9GB9I5DLpJ0hw5VNS/aoaaSsJiDVrJNNWFk67CqvzRqh2APR@vger.kernel.org
X-Gm-Message-State: APuU4Z8CQuQzI81IK1ZXawbl17Ell95VdYK1vBGup4YOp/wHK/gISu/7
	1MFu3vtpUuEPNc7Da+t+yA/sH6wRZUy6go9Wx8SBK+hH7xvd+gP1dPJdvDVP+J3eVZprzgV5kPq
	MGJumVm7/3WKbVLOVrC03AWleg4F/Peww4FZiOopiXA4QZq1lZ15tI/IDOTCyWwq06+Em
X-Gm-Gg: AZFdTZdyi9DXvMtq4PGjr+/8hqUgJO/NmoIJIr2J/k/UNqxAItJXvahPqrkNJNNiFBO
	hnQr/iCgyso+TBcLsH7VPJUS2i/CNhBz9C5+YZ6hfv8BxJPUMiLWNqSl78q2wuOUgvi5k+6Svb+
	DUw2I3MMF1aZyMxv3aqrHmpe6pZZS3GDLUr2uQxcmR3n04i3YzgwgmO5skkaDnV0+5lKFzNMT/P
	hrUpZHUVUrUuiVS8yanxnWse3bYW/vtKEPjZvWbRYKixc3eICKUAtpw8AodhFIJZKL2HiaFdthY
	/KGTUS64jfmOYrCLATtk2JN1GlOtWsjNojwSUWBOj+zYO10zzWEwk1p8F5dRKJvBsS2OnVYC5Hy
	JPKi5L3E3+q06CFW5uaSIhbWzGaxXb2AV
X-Received: by 2002:a05:620a:1728:b0:949:8aca:f44f with SMTP id af79cd13be357-949ba7cbbedmr3167320485a.4.1795593616293;
        Wed, 25 Nov 2026 00:00:16 -0800 (PST)
X-Received: by 2002:a05:620a:1728:b0:949:8aca:f44f with SMTP id af79cd13be357-949ba7cbbedmr3167306185a.4.1795593615312;
        Wed, 25 Nov 2026 00:00:15 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm585912015e9.11.2026.11.25.00.00.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:00:14 -0800 (PST)
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
Subject: [PATCH v2 05/12] media: qcom: camss: Add per-port config to CSID configure_stream
Date: Wed, 25 Nov 2026 09:59:54 +0200
Message-Id: <20261125080001.2540101-6-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfX2vsiuDZGzLXY
 LVropUPPB/HtfHkHrwj0PsegXf1MhiBcDWHKgPeP7ZhZ1pWwkf/8L/iDNQG4HgOJ7+SEaYXIxwv
 2MoKDuGkihk1gAavw00goTUdRxvzjyJ5khAl7BJFc5ym+xxljU5RqncZc70rj11BIM5VimntB5B
 rsyY+BX4zlNdmu2fsS6/Dcroxz6ZLS7dtP/RFkW60/vHUOBI3b6Ieh3i/xXwVoz+h1cuQkZIBdP
 bFIMYfHqXvZ7apQf25SL6Ut/QNw4ILP9Bz0fzyMAUFpqzrxp/ijcogJ3ZxI7bml2BhQ50+hyuYc
 VY6d9GioZx/M/yBUjm/qPsgB7fH0z+Rt6OQ6+mDobqXVh51nRuiwwG2F/yyBqPRiie2cNlkOZT6
 CGX+wVcj6NrpFATpYTHCI4ncYhym2XtWdfJTZpgvLwN9RAw9rF5cmzGzPbBGsbYdOBVWhATZZEv
 GMKU29lc8Ry4xawKmqQ==
X-Proofpoint-GUID: knQwxkKKeNvcWoPeCJrqAB3Z-X_fFu51
X-Proofpoint-ORIG-GUID: knQwxkKKeNvcWoPeCJrqAB3Z-X_fFu51
X-Authority-Analysis: v=2.4 cv=Zt54uN7G c=1 sm=1 tr=0 ts=6b069596 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=LTdo2yCfIfbF-FAaOukA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfX6zXMA8BazmZZ
 oISo7Qq13MGHWJzL7YmLJ9HIPVyuKO3eO5CP9rOIPPu+MhlZb9fDCItpbPRTXB0k2A6Tdtq/3uM
 NLH+Qx34PGQ0wmwdTMoMaddAfQUuRMw=
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

Add struct csid_port_config {vc, dt} and change csid_hw_ops's
configure_stream() to take a port_mask and a port_cfg array, replacing
the old single enable-only entry point. Bit(i) of port_mask selects
port i (pad - MSM_CSID_PAD_FIRST_SRC). The VC/DT to program for each
such port comes from csid->port_cfg[port], which the csid subdev
is guaranteed to populate for every port set in
port_mask.

configure_stream() remains the single entry point for configuring
CSID input streams, used by both the legacy (non-streams-API) path
and the future streams API, selected by streams_enable. The legacy
caller in csid subdevice populates csid->port_cfg[] from the
negotiated format (VC 0) before calling configure_stream(),
matching prior behaviour exactly.

configure_stream() is a single function pointer in struct
csid_hw_ops, shared by all six CSID backends (gen2, gen3, 340, 4-1,
4-7, 680), so its signature is updated for all of them in this same
commit. camss-csid-340.c and camss-csid-680.c replace their internal
csid->phy.en_vc loop condition with port_mask; camss-csid-4-1.c and
camss-csid-4-7.c are legacy-only, single-port backends and get a
purely mechanical signature update, with port_mask and port_cfg
unused.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-csid-340.c      |  5 +-
 .../platform/qcom/camss/camss-csid-4-1.c      |  3 +-
 .../platform/qcom/camss/camss-csid-4-7.c      |  3 +-
 .../platform/qcom/camss/camss-csid-680.c      |  7 +--
 .../platform/qcom/camss/camss-csid-gen2.c     | 54 +++++++++++++------
 .../platform/qcom/camss/camss-csid-gen3.c     | 34 ++++++------
 .../media/platform/qcom/camss/camss-csid.c    | 18 ++++++-
 .../media/platform/qcom/camss/camss-csid.h    | 21 +++++++-
 8 files changed, 103 insertions(+), 42 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
index 42ff629ce410..46fbc46102e4 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-340.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
@@ -146,14 +146,15 @@ static void __csid_configure_stream(struct csid_device *csid, u8 enable, u8 port
 	writel_relaxed(enable, csid->base + CSID_CTRL(iface));
 }
 
-static void csid_configure_streams(struct csid_device *csid, u8 enable)
+static void csid_configure_streams(struct csid_device *csid, u32 port_mask,
+				   const struct csid_port_config *port_cfg, u8 enable)
 {
 	int i;
 
 	__csid_configure_rx(csid, &csid->phy);
 
 	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
-		if (csid->phy.en_vc & BIT(i))
+		if (port_mask & BIT(i))
 			__csid_configure_stream(csid, !!enable, i, 0);
 	}
 }
diff --git a/drivers/media/platform/qcom/camss/camss-csid-4-1.c b/drivers/media/platform/qcom/camss/camss-csid-4-1.c
index 6998e1c52895..c3e00de326aa 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-4-1.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-4-1.c
@@ -44,7 +44,8 @@
 #define CAMSS_CSID_TG_DT_n_CGG_1(n)	(0x0b0 + 0xc * (n))
 #define CAMSS_CSID_TG_DT_n_CGG_2(n)	(0x0b4 + 0xc * (n))
 
-static void csid_configure_stream(struct csid_device *csid, u8 enable)
+static void csid_configure_stream(struct csid_device *csid, u32 port_mask,
+				  const struct csid_port_config *port_cfg, u8 enable)
 {
 	struct csid_testgen_config *tg = &csid->testgen;
 	u32 val;
diff --git a/drivers/media/platform/qcom/camss/camss-csid-4-7.c b/drivers/media/platform/qcom/camss/camss-csid-4-7.c
index 66054d4872e6..2e8aea3ee545 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-4-7.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-4-7.c
@@ -43,7 +43,8 @@
 #define CAMSS_CSID_TG_DT_n_CGG_1(n)	(0x0b8 + 0xc * (n))
 #define CAMSS_CSID_TG_DT_n_CGG_2(n)	(0x0bc + 0xc * (n))
 
-static void csid_configure_stream(struct csid_device *csid, u8 enable)
+static void csid_configure_stream(struct csid_device *csid, u32 port_mask,
+				  const struct csid_port_config *port_cfg, u8 enable)
 {
 	struct csid_testgen_config *tg = &csid->testgen;
 	u32 sink_code = csid->fmt[MSM_CSID_PAD_SINK].code;
diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers/media/platform/qcom/camss/camss-csid-680.c
index 452640e72f6d..a864dcf7a1e8 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-680.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
@@ -310,15 +310,16 @@ static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable, u8 rdi
 	writel(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
 }
 
-static void csid_configure_stream(struct csid_device *csid, u8 enable)
+static void csid_configure_stream(struct csid_device *csid, u32 port_mask,
+				  const struct csid_port_config *port_cfg, u8 enable)
 {
 	int i;
 
 	__csid_configure_top(csid);
 
-	/* Loop through all enabled ports and configure a stream for each */
+	/* Loop through all ports set in port_mask and configure a stream for each */
 	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
-		if (csid->phy.en_vc & BIT(i)) {
+		if (port_mask & BIT(i)) {
 			__csid_configure_rdi_stream(csid, enable, i, 0);
 			__csid_configure_rx(csid, &csid->phy, 0);
 			__csid_configure_rdi_irq(csid, enable, i);
diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index a351ac4b9172..1ed7ca63907b 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -255,13 +255,8 @@ static void __csid_configure_testgen(struct csid_device *csid, u8 enable, u8 por
 	writel_relaxed(val, csid->base + CSID_TPG_CTRL);
 }
 
-static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
+static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc, u8 dt)
 {
-	/* Source pads matching RDI channels on hardware. Pad 1 -> RDI0, Pad 2 -> RDI1, etc. */
-	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + port];
-	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
-								   csid->res->formats->nformats,
-								   input_format->code);
 	u32 val;
 
 	/*
@@ -283,7 +278,7 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	val |= 1 << RDI_CFG0_TIMESTAMP_EN;
 	/* note: for non-RDI path, this should be format->decode_format */
 	val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
-	val |= format->data_type << RDI_CFG0_DATA_TYPE;
+	val |= dt << RDI_CFG0_DATA_TYPE;
 	val |= vc << RDI_CFG0_VIRTUAL_CHANNEL;
 	val |= dt_id << RDI_CFG0_DT_ID;
 	writel_relaxed(val, csid->base + CSID_RDI_CFG0(port));
@@ -334,22 +329,47 @@ static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable, u8 rdi
 	writel_relaxed(val, csid->base + CSID_CSI2_RDIN_IRQ_MASK(rdi));
 }
 
-static void csid_configure_stream(struct csid_device *csid, u8 enable)
+static void csid_configure_stream(struct csid_device *csid, u32 port_mask,
+				  const struct csid_port_config *port_cfg, u8 enable)
 {
 	struct csid_testgen_config *tg = &csid->testgen;
+	unsigned long mask = port_mask;
+	bool config_testgen = false;
 	u8 i;
 
-	/* Loop through all enabled ports and configure a stream for each */
-	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
-		if (csid->phy.en_vc & BIT(i)) {
-			if (tg->enabled)
-				__csid_configure_testgen(csid, enable, i, 0);
-
-			__csid_configure_rdi_stream(csid, enable, i, 0);
+	/*
+	 * Testgen has only one configuration for all ports.
+	 * The csid guarantees that the enabled_ports is set/cleared
+	 * after configure stream. !csid->enabled_ports is
+	 * on first enable, (port_mask == csid->enabled_ports) is
+	 * on last disable.
+	 */
+	if (!csid->enabled_ports || port_mask == csid->enabled_ports)
+		config_testgen = true;
+
+	for_each_set_bit(i, &mask, MSM_CSID_MAX_SRC_STREAMS) {
+		if (enable) {
+			if (tg->enabled && config_testgen) {
+				__csid_configure_testgen(csid, 1, i, port_cfg[i].vc);
+				config_testgen = false;
+			}
+			__csid_configure_rdi_stream(csid, 1, i, port_cfg[i].vc,
+						    port_cfg[i].dt);
 			__csid_configure_rx(csid, &csid->phy, 0);
-			__csid_configure_rdi_irq(csid, enable, i);
-			__csid_ctrl_rdi(csid, enable, i);
+			__csid_configure_rdi_irq(csid, 1, i);
+			__csid_ctrl_rdi(csid, 1, i);
+		} else {
+			__csid_ctrl_rdi(csid, 0, i);
+			__csid_configure_rdi_irq(csid, 0, i);
+
+			if (tg->enabled && config_testgen) {
+				__csid_configure_testgen(csid, 0, i, 0);
+				config_testgen = false;
+			}
+
+			__csid_configure_rdi_stream(csid, 0, i, 0, 0);
 		}
+	}
 }
 
 static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 231b53d3e44e..f270c17d041e 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -161,15 +161,11 @@ static void __csid_configure_wrapper(struct csid_device *csid)
 	writel(val, csid->camss->csid_wrapper_base + CSID_IO_PATH_CFG0(csid->id));
 }
 
-static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8 port, u8 vc)
+static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable,
+					u8 port, u8 vc, u8 dt)
 {
 	u32 val;
 	u8 lane_cnt = csid->phy.lane_cnt;
-	/* Source pads matching RDI channels on hardware. Pad 1 -> RDI0, Pad 2 -> RDI1, etc. */
-	struct v4l2_mbus_framefmt *input_format = &csid->fmt[MSM_CSID_PAD_FIRST_SRC + port];
-	const struct csid_format_info *format = csid_get_fmt_entry(csid->res->formats->formats,
-								   csid->res->formats->nformats,
-								   input_format->code);
 
 	if (!lane_cnt)
 		lane_cnt = 4;
@@ -193,7 +189,7 @@ static void __csid_configure_rdi_stream(struct csid_device *csid, u8 enable, u8
 	/* note: for non-RDI path, this should be format->decode_format */
 	val |= DECODE_FORMAT_PAYLOAD_ONLY << RDI_CFG0_DECODE_FORMAT;
 	val |= vc << RDI_CFG0_VC;
-	val |= format->data_type << RDI_CFG0_DT;
+	val |= dt << RDI_CFG0_DT;
 	val |= dt_id << RDI_CFG0_DT_ID;
 
 	writel(val, csid->base + CSID_RDI_CFG0(port));
@@ -242,20 +238,28 @@ static void __csid_configure_rdi_irq(struct csid_device *csid, u8 enable, u8 rdi
 	writel(val, csid->base + CSID_TOP_IRQ_MASK);
 }
 
-static void csid_configure_stream(struct csid_device *csid, u8 enable)
+static void csid_configure_stream(struct csid_device *csid, u32 port_mask,
+				  const struct csid_port_config *port_cfg, u8 enable)
 {
+	unsigned long mask = port_mask;
 	u8 i;
 
 	__csid_configure_wrapper(csid);
 
-	/* Loop through all enabled ports and configure a stream for each */
-	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
-		if (csid->phy.en_vc & BIT(i)) {
-			__csid_configure_rdi_stream(csid, enable, i, 0);
-			__csid_configure_rx(csid, &csid->phy, 0);
-			__csid_configure_rdi_irq(csid, enable, i);
-			__csid_ctrl_rdi(csid, enable, i);
+	/* Loop through all ports set in port_mask and configure a stream for each */
+	for_each_set_bit(i, &mask, MSM_CSID_MAX_SRC_STREAMS) {
+		u8 vc = 0, dt = 0;
+
+		if (enable) {
+			vc = port_cfg[i].vc;
+			dt = port_cfg[i].dt;
 		}
+
+		__csid_configure_rdi_stream(csid, enable, i, vc, dt);
+		__csid_configure_rx(csid, &csid->phy, 0);
+		__csid_configure_rdi_irq(csid, enable, i);
+		__csid_ctrl_rdi(csid, enable, i);
+	}
 }
 
 static int csid_configure_testgen_pattern(struct csid_device *csid, s32 val)
diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 0f819c34e760..2efaeef83606 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -783,7 +783,23 @@ static int csid_set_stream(struct v4l2_subdev *sd, int enable)
 		for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
 			atomic_set(&csid->sof_seq[i], -1);
 
-		csid->res->hw_ops->configure_stream(csid, enable);
+		for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
+			if (csid->phy.en_vc & BIT(i)) {
+				struct v4l2_mbus_framefmt *input_format =
+					&csid->fmt[MSM_CSID_PAD_FIRST_SRC + i];
+				const struct csid_format_info *format =
+					csid_get_fmt_entry(csid->res->formats->formats,
+							   csid->res->formats->nformats,
+							   input_format->code);
+
+				csid->port_cfg[i].vc = 0;
+				csid->port_cfg[i].dt = format->data_type;
+			}
+		}
+
+		csid->res->hw_ops->configure_stream(csid, csid->phy.en_vc, csid->port_cfg, enable);
+		csid->enabled_ports = enable ? csid->phy.en_vc : 0;
+
 		csid->phy.need_vc_update = false;
 	}
 
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 8edb258b0ae5..5f09beffa5f5 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -72,14 +72,29 @@ struct csid_phy_config {
 	u8 need_vc_update;
 };
 
+/*
+ * struct csid_port_config - Per-port CSI-2 virtual channel/data type
+ * @vc: Virtual channel
+ * @dt: Data type
+ */
+struct csid_port_config {
+	u8 vc;
+	u8 dt;
+};
+
 struct csid_device;
 
 struct csid_hw_ops {
 	/*
-	 * configure_stream - Configures and starts CSID input stream
+	 * configure_stream - Configure and start/stop CSID input streams
 	 * @csid: CSID device
+	 * @port_mask: bitmask of ports (bit i = port i) to configure
+	 * @port_cfg: per-port VC/DT, valid at every port position set in
+	 *	@port_mask. If @enable is 0, @port_cfg can be NULL.
+	 * @enable: 1 to enable the ports in @port_mask, 0 to disable them
 	 */
-	void (*configure_stream)(struct csid_device *csid, u8 enable);
+	void (*configure_stream)(struct csid_device *csid, u32 port_mask,
+				 const struct csid_port_config *port_cfg, u8 enable);
 
 	/*
 	 * configure_testgen_pattern - Validates and configures output pattern mode
@@ -170,6 +185,8 @@ struct csid_device {
 	const struct csid_subdev_resources *res;
 	atomic_t frame_sync_users;
 	atomic_t sof_seq[MSM_CSID_MAX_SRC_STREAMS];
+	struct csid_port_config port_cfg[MSM_CSID_MAX_SRC_STREAMS];
+	u32 enabled_ports;
 };
 
 struct camss_subdev_resources;
-- 
2.34.1

