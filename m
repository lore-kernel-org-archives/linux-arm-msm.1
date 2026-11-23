Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454216;
	b=LclNcsy3p21i0VykX+ohyucVvzfcxROvUwOSzlsL6yJ5aNTpmytDU6QlfoXYffee+IWv
	 1Li1/qvHdeKfBVAFQkFh8P/nZj+66rcGI4Q6bthOFPF1cqUW44fDmkQJjZF8ChJ8pSfyi
	 aSPAnk9CFfWULpKsTLmYs4Dbv898e7wj8PHrQeyQSgElHbxo9u7b+4zoEYFN8SnZZmRdA
	 URE39YQZ2uZOyzVI8JHmn81Hxc7xDUbed9qDHLamWQHG/XspZ6JpObkcywIy3FHOE+mf9
	 H3++/v3+FM0GiEnTw0OxXWHQoie5M/MakXxspjBEjWqbH4Vakc55+s4vVULzpkLwFyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454216;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Bloh8Sr+BKUGi4RexmcOju0F2RgZoZ1UhmQVzdYmPAA=;
	b=RZARe9MCvf0tmfFUDFI5IjPOLyBOTKnynSYS6/CnTrfOfVJD+pAPU+c/rckpQiZIvwSN
	 yblKzJF8JxY1beFM4swPPNxdiAhh1xVFdkq575svpdQEG0oDS+hC76SQa4KHjz++DTA4s
	 x1jxxIN5lCmh4TLFueBaNWEq7TMU5ifRLe+7pTsCwRqdHqPtyTAJouTr6pylcVoWed23b
	 0FWDSSZbPbhTvjXd00L1l6ZAiEQ2OOWiMhHc0HycZsuIcguT/eCQeMC9HDltusz0RA6Cm
	 GQctIYzh7NmvjGUIe7X2w5/6Fk24bNk7KBgihMRaXFeNteInDSsJqtfQ10jk33fscRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZD80B9wf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j0QpHb5s;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8BC1606A684
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 17:16:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8BC1606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZD80B9wf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j0QpHb5s
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGpMH2768985
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 17:16:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bloh8Sr+BKUGi4RexmcOju0F2RgZoZ1UhmQVzdYmPAA=; b=ZD80B9wffNte2/z1
	eyQi8c5p1hbR/zbXbP2QD0dF/2iMLCrcCRdFvTnKO3BrZsr4XrWB51UVRTMb152s
	EBwTDNTNdvYdw6a7DLxW+I1ihTiIKeTGj5fTC01II7dRnF8Q+lgF2/nbVPKz39Ob
	plOj3ICJDgnIPmR0wyTUtZ2j9aUE1Blk+R9GUJQ0P17KrsKo+G3K4T1ejiULgSml
	GVmm4fNX0yWxYi4phfahqHl6cfpgXa6OsZrchpA2pIkBN00ahrigemxu0B0mZELu
	8F01RJimMNBpyyyQd57mktGola0/yxCsVh0wgXyjigjc7wtY6nY2H05hZNJaQ+/2
	kHU2bA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pagxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 17:16:55 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5eac42e83e0so649801e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 09:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795454214; x=1796059014; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bloh8Sr+BKUGi4RexmcOju0F2RgZoZ1UhmQVzdYmPAA=;
        b=j0QpHb5scUx4v/EdYIBqdlEQYDP2ft7q8OGpn7X5taIj1Z+K3Ymaevc0Z+VdxwXoYa
         Q+a9w0c3WN5f9JsWAuFWpyjsRW5tFbAJdtTnG6LyED4/eX4I7x/Yiy/yakgk3C/hICnj
         FpXnsyq4ZVeNpcdgQ8jph6H55zn+GbVc4tO+GNcJe+gwL8phPd9uFOXzJCHiBXLSLiTz
         7GMyTYtgKGnyM+aR1oh3bCgYbxeFcbzn/KhnT4rtT6kZwHdB8muCi23QJ8nVtTOwwYqP
         A6b7dO7XBHsWosw6+uP3W69lpSvLpCBIyLsrQ4dTFMNLATpWEFOntJ2AXGr1TBfTgr+y
         xvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454214; x=1796059014;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bloh8Sr+BKUGi4RexmcOju0F2RgZoZ1UhmQVzdYmPAA=;
        b=Drkr5kGBGtj4JF8o/cdJPL6n36yq/I+74awJwGDlzfJ1p+Zjwq6ikA03sC0fe2VwXp
         AkIokT9kWiQ6P91fiqZyceTA5nFQ9KTIABwFpYriiVH6ylf/aZWtbJsaw5lx9NO59W/3
         k6D+Ced3YFNbddHdTMMRk2sXKv61bGMv+d60CgXU85R1X8NzfogL5YIph9ElKCfU0W9l
         Pgr3OW+1goVVOtNDpySF1SwFfBeuZ8Vft85KZOYv9Gm7nA1AeITdgokEwVks7lMjhM6Q
         utvTey0vB4DPZU0rOKjUJksShE8MZK3TYgJ/TRvyU3+8Trt4PzxPZOkZNOlc9yWVX+7e
         MQNQ==
X-Forwarded-Encrypted: i=1; AL+hErGM12JVVYAK6f/fXPsMQpsY6f21hfGBcW+/tbTmm42ZxvcQN6ZGPO8oLXr1CNk4PoZ/2g94W//mHymbPUHC@vger.kernel.org
X-Gm-Message-State: APuU4Z/3Af4Ml7xw1jwMb6D2GXsK8GaS2iFdKQjYkAOk9Z4VggWtO0HX
	YDyzUCzqxSbn2hdGiKa68TEA3YtjJa9vy/7+z2TuI44Vh6lifKBnJBi9EbztNVAiM66tfDrjj7M
	bgz5gJbi7H7vGr6/ofN4CW71Z1fwq9UsyvEq8wN2DCe4kRVe8MYQXfcMqFN46+8WaI4By
X-Gm-Gg: AZFdTZexD0lZw0GpFn065Jw9L7P5XZantSHiOQ/E8lGFy/5dWO7GU4lQdd+y3lutmMN
	R7cuCFXqcLYu468Kb/GDgcJKKIWGSXSG8V4adyAiwiofqHZG29RRDsSu9WclTItFfyDntenApLA
	pjV1ZLz43nJdO838hbapo/A/nz4qKp7kLbPDm+rGB64ZbTia4Nh82T+p/UYtFJZ59PHOmGYuLoX
	aB/pAFzrBefQx6fNJZsL3HjsZ+JcWiqsQsHnYt6Cr8Gx+H9kceP/xha2eddFt6l/S1c0vSVGXz+
	H8j1X0M/EejEWbBL1GkZbkFqsnllT58UaiofPPCx7hxq4uqgLsYwCXiyGnCozaPHrvOmqddAv/r
	e5H30rEFuehDCRuVLWY44E7GuaC4IiYupsO01RFfhwmEBWEJmxhpewsCYOA230VGyzl8G39fzp7
	noe8TLkzigkpZtPJRDaWVjIX+gRFNthqtk/R+xl/3LsYs1iot/UfcEPXK6vK4Gy5F56tYVNV9zN
	Ttmx8nLiFDKw16i4qu+ncnDwqK3
X-Received: by 2002:a05:6122:3b84:b0:5ea:e324:7c0c with SMTP id 71dfb90a1353d-5ee8af8d6fdmr6057196e0c.22.1795454213789;
        Mon, 23 Nov 2026 09:16:53 -0800 (PST)
X-Received: by 2002:a05:6122:3b84:b0:5ea:e324:7c0c with SMTP id 71dfb90a1353d-5ee8af8d6fdmr6057126e0c.22.1795454213243;
        Mon, 23 Nov 2026 09:16:53 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066e34esm205168235e9.3.2026.11.23.09.16.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:16:52 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 18:16:49 +0100
Subject: [PATCH 3/6] media: qcom: camss: csid-340: Report the hardware SOF
 timestamp
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
Message-Id: <20261123-camss-hw-ts-v1-3-7b62dda6d7a9@oss.qualcomm.com>
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
In-Reply-To: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX17HqA5IXzcMJ
 nD41SiqSojiOQU3HR6Adsxn9FmXf2lArK2IF3AV31VUalA1Om+OSgVR5/3tkxHuDjKs7Noat3Xu
 W3qCCJ+9T6j2gIgUPzXPu3wOtum3hdqYpElk82KB4A+BUBWKU1TMB7NpTG7Cjkri+WA0jtA8fcx
 3URkeNQ/sWpl6APhgobgg3Atgs0WnEyyaii9q9eIe7/5B5XQqECPkfpSwuIwbBNc5UnVYiReU0g
 1rnEJ0F3fa7LsXq6BrjYgdbl7rjFKnRE/MMK5kuMBhELzuPO3gW4LuEvzvlkzw54F5ZqoMigmm+
 L7X2aCfGROn+B3/bMQCYeiVkI/UtCBuNBSOyXvPYy8Yw7btJj+teugbBkPNqbhVL4nMHyfY019G
 L1bUOMkoxpic61mAHiHik5wIY3IZe24dlxS98PG7JX47a3TPB//eczSleo7qFt0qh3CkPqikyYT
 lo1C7lVWg9MgNAYAVMw==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b047507 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=_Zlc0IdfmvnlcCaxC1IA:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: JxcFkI6DsJooBfPN0cP596l8bi7G8yRm
X-Proofpoint-ORIG-GUID: JxcFkI6DsJooBfPN0cP596l8bi7G8yRm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX+Tbv4HqcqPOu
 OC5h3mIpClQ6P2vN2OtqmTT/02UmhxhVBC7Fci4xgR/dsg8k9i6+6C6LhSVRxMUR5+7htewPpuT
 lxM/g+YJCiPIYMmmalP1cR0ftp8ODuU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230068

The CSID latches the global timestamp counter at start-of-frame into a
per-interface register pair. That counter is the ARM architected
counter, so correlating it with CLOCK_MONOTONIC through
ktime_get_snapshot_id() turns the latched value into the time the frame
actually started, rather than the time the interrupt handler ran.

Measured on QCM2290 that removes around 36 us of delay, with ~8 us of
jitter, from the timestamp userspace sees on a 60 fps stream.

TIMESTAMP_EN is not at the same bit in the PIX and the RDI layouts of
CSID_CFG0, so replace the single define with one for each.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid-340.c | 37 +++++++++++++--
 drivers/media/platform/qcom/camss/camss-csid.c     | 54 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-csid.h     | 11 +++++
 3 files changed, 97 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers/media/platform/qcom/camss/camss-csid-340.c
index 5eef5f8846fbfec5afa1152f73a098fecd717fdf..ff21cd10a7e4373952938ab2e00af64e3014b509 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-340.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
@@ -49,7 +49,8 @@
 
 #define CSID_CFG0(iface)					(0x200 + 0x100 * (iface))
 #define		CSID_CFG0_BYTE_CNTR_EN			BIT(0)
-#define		CSID_CFG0_TIMESTAMP_EN			BIT(1)
+#define		CSID_CFG0_PIX_TIMESTAMP_EN		BIT(1)
+#define		CSID_CFG0_RDI_TIMESTAMP_EN		BIT(2)
 #define		CSID_CFG0_DECODE_FORMAT_MASK		GENMASK(15, 12)
 #define		CSID_CFG0_DECODE_FORMAT_NOP		CSID_CFG0_DECODE_FORMAT_MASK
 #define		CSID_CFG0_DT_MASK			GENMASK(21, 16)
@@ -61,6 +62,13 @@
 #define CSID_CTRL_HALT_AT_FRAME_BOUNDARY		0
 #define CSID_CTRL_RESUME_AT_FRAME_BOUNDARY		1
 
+/*
+ * SOF timestamp of the most recent frame, a pair of registers holding a 56-bit
+ * counter value, the low 32 bits in the first and the high 24 in the second.
+ */
+#define CSID_TIMESTAMP_CURR0_SOF(iface)			(0x290 + 0x100 * (iface))
+#define CSID_TIMESTAMP_CURR1_SOF(iface)			(0x294 + 0x100 * (iface))
+
 enum csid_iface {
 	CSID_IFACE_PIX,
 	CSID_IFACE_RDI0,
@@ -108,6 +116,7 @@ static void __csid_configure_stream(struct csid_device *csid, u8 enable, u8 port
 								   input_format->code);
 	enum csid_iface iface = csid_port_iface_map[port];
 
+	u32 timestamp_en;
 	u8 dt_id;
 	u32 val;
 
@@ -125,17 +134,21 @@ static void __csid_configure_stream(struct csid_device *csid, u8 enable, u8 port
 	 */
 	dt_id = port & 0x03;
 
-	if (iface == CSID_IFACE_PIX)
+	if (iface == CSID_IFACE_PIX) {
 		val = FIELD_PREP(CSID_CFG0_DECODE_FORMAT_MASK, format->decode_format);
-	else /* RDI is raw, no decoding */
+		timestamp_en = CSID_CFG0_PIX_TIMESTAMP_EN;
+	} else {
+		/* RDI is raw, no decoding */
 		val = CSID_CFG0_DECODE_FORMAT_NOP;
+		timestamp_en = CSID_CFG0_RDI_TIMESTAMP_EN;
+	}
 
 	val |= FIELD_PREP(CSID_CFG0_DT_MASK, format->data_type);
 	val |= FIELD_PREP(CSID_CFG0_VC_MASK, vc);
 	val |= FIELD_PREP(CSID_CFG0_DTID_MASK, dt_id);
 
 	if (enable)
-		val |= CSID_CFG0_ENABLE;
+		val |= CSID_CFG0_ENABLE | timestamp_en;
 
 	dev_dbg(csid->camss->dev, "CSID%u: Stream %s (dt:0x%x df=0x%x port=%u vc=%u)\n",
 		csid->id, enable ? "enable" : "disable", format->data_type,
@@ -184,6 +197,20 @@ static int csid_reset(struct csid_device *csid)
 	return 0;
 }
 
+static u64 __csid_sof_timestamp(struct csid_device *csid, enum csid_iface iface)
+{
+	u32 lo, hi;
+
+	/*
+	 * The pair is latched on SOF rather than counting, so it can be read
+	 * one word at a time without tearing.
+	 */
+	lo = readl_relaxed(csid->base + CSID_TIMESTAMP_CURR0_SOF(iface));
+	hi = readl_relaxed(csid->base + CSID_TIMESTAMP_CURR1_SOF(iface));
+
+	return csid_timestamp_to_monotonic(csid, ((u64)hi << 32) | lo);
+}
+
 static irqreturn_t csid_isr(int irq, void *dev)
 {
 	struct csid_device *csid = dev;
@@ -207,7 +234,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
 		iface_val |= status;
 
 		if (status & CSID_IFACE_IRQ_INFO_INPUT_SOF)
-			csid_sof_event(csid, i, 0);
+			csid_sof_event(csid, i, __csid_sof_timestamp(csid, iface));
 	}
 
 	writel_relaxed(CSID_IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index bb89fe26ec2342487c3ba6357d37b6f188476d1e..c77fafdb9fe450aa3bd245144de353cd0edb44c6 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -8,14 +8,17 @@
  * Copyright (C) 2015-2018 Linaro Ltd.
  */
 #include <linux/clk.h>
+#include <linux/clocksource_ids.h>
 #include <linux/completion.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/math64.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
+#include <linux/timekeeping.h>
 #include <media/media-entity.h>
 #include <media/mipi-csi2.h>
 #include <media/v4l2-device.h>
@@ -37,6 +40,16 @@
 
 #define LANE_CFG_BITWIDTH 4
 
+/*
+ * The CSID latches the global timestamp counter on SOF and EOF. That counter is
+ * the ARM architected counter, 56 bit wide and ticking at 19.2 MHz.
+ */
+#define CSID_TIMESTAMP_WIDTH	56
+#define CSID_TIMESTAMP_MASK	GENMASK_ULL(CSID_TIMESTAMP_WIDTH - 1, 0)
+#define CSID_TIMESTAMP_NS_MUL	10000	/* NSEC_PER_SEC / 19.2 MHz, reduced */
+#define CSID_TIMESTAMP_NS_DIV	192
+#define CSID_TIMESTAMP_MAX_AGE_NS	(2 * NSEC_PER_MSEC)
+
 #define MSM_CSID_NAME "msm_csid"
 
 const char * const csid_testgen_modes[] = {
@@ -1370,6 +1383,47 @@ atomic_t *csid_get_sof_seq(struct media_pad *pad)
 	return &csid->sof_seq[pad->index - MSM_CSID_PAD_FIRST_SRC];
 }
 
+static u64 csid_timestamp_to_ns(u64 ticks)
+{
+	return mul_u64_u32_div(ticks, CSID_TIMESTAMP_NS_MUL, CSID_TIMESTAMP_NS_DIV);
+}
+
+u64 csid_timestamp_to_monotonic(struct csid_device *csid, u64 ticks)
+{
+	struct system_time_snapshot snap;
+	u64 delta, delta_ns, now;
+
+	ktime_get_snapshot_id(CLOCK_MONOTONIC, &snap);
+
+	/*
+	 * Translating requires reading the very counter the CSID latched from.
+	 * If timekeeping is driven by something else there is nothing to
+	 * correlate against, so let the caller fall back to IRQ time.
+	 */
+	if (!snap.valid || snap.cs_id != CSID_ARM_ARCH_COUNTER)
+		return 0;
+
+	/* How long ago, in counter ticks, the timestamp was latched */
+	delta = (snap.cycles - ticks) & CSID_TIMESTAMP_MASK;
+	delta_ns = csid_timestamp_to_ns(delta);
+	now = ktime_to_ns(snap.systime);
+
+	 /* Fall back rather than reporting a nonsensical timestamp. */
+	if (delta_ns > now) {
+		dev_warn_once(csid->camss->dev,
+			      "CSID%u: SOF timestamp predates CLOCK_MONOTONIC, ignoring\n",
+			      csid->id);
+		return 0;
+	}
+
+	if (delta_ns > CSID_TIMESTAMP_MAX_AGE_NS)
+		dev_warn_ratelimited(csid->camss->dev,
+				     "CSID%u: Too slow! SOF timestamp is %llu us old\n",
+				     csid->id, delta_ns / NSEC_PER_USEC);
+
+	return now - delta_ns;
+}
+
 void csid_sof_event(struct csid_device *csid, unsigned int id, u64 ts)
 {
 	struct timespec64 sof = ns_to_timespec64(ts);
diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/media/platform/qcom/camss/camss-csid.h
index 1fde67d16867a24be2a4f8940ed2d2a60f523ee6..4f55c72a44ca3a6cbd29861aa5c90cbab9ed5932 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.h
+++ b/drivers/media/platform/qcom/camss/camss-csid.h
@@ -261,6 +261,17 @@ u32 csid_hw_version(struct csid_device *csid);
 u32 csid_src_pad_code(struct csid_device *csid, u32 sink_code,
 		      unsigned int match_format_idx, u32 match_code);
 
+/*
+ * csid_timestamp_to_monotonic - Put a CSID timestamp on the CLOCK_MONOTONIC
+ *                               timebase
+ * @csid: CSID device
+ * @ticks: Counter value latched by the CSID
+ *
+ * Return the CLOCK_MONOTONIC time, in nanoseconds, at which @ticks was latched,
+ * or 0 if the counter cannot be correlated with CLOCK_MONOTONIC.
+ */
+u64 csid_timestamp_to_monotonic(struct csid_device *csid, u64 ticks);
+
 /*
  * csid_sof_event - Track SOF generate V4L2_EVENT_FRAME_SYNC
  * @csid: CSID device

-- 
2.34.1

