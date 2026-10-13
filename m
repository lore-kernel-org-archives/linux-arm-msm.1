Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8E047CC8A
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887444; cv=none; b=tEf14wCk/2uxAgOCjU03NUcVhT9fZlfxJD5nn2a/qgKNG3uHWwHnDN1JqToVpsWf/gLZZeRZk1u1iMPcrZTvn4wIVRuEfqdNcUg5YjnSjVB/U4OxxL+Yv+TxGTZPhTOhoE9jQBpGrZ539w+vvy8rU4gnxUS8ciB5XS7O496V3MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887444; c=relaxed/simple;
	bh=9e6MEiIklGJfyndXhTPPr9nVDCPp6b5rGMxzkp0B7YM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UMAm6jZPwFEEl/Ez4/ikYiPgb1lIkup9wwY9kbWozhxD0Y2MjX4tM4Mk/AhUvi0SAybidosCJUgH7jlMmVJ1NJ/Vj2ta7UaOhvmEcFvc+PdNqIKwvf9s4aZpnrSf8jDnUKFXq2eK05NuyjPIFQiTl4Ylf5Q5lhtveDFGTu6koXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F9DDXyBx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fvRie19x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F9DDXyBx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fvRie19x"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D9tRh23475857
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:30:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vRfB3REly7l4Yt4+ScKAJ76g8z3HDR/+4IYPDuXkwL0=; b=F9DDXyBxTg4Q8Gsk
	f3hDD37cLqRM6RQHwVbJGGj/xPephT0QSlHtWSW87k0hRkr0djLTnqW823uAzb8E
	W+H7geety4BGl4qwat2G8Y/48YOxrgyyL4BwYHE78vfG28Pwu+t7ldZD3nXkrHad
	hmQaLt691wlCve/SUNVCEBKF3suRc8e2nq5KI71YC+vvhORrXvkoUdcE87L/a/tZ
	Btq4vyhw/X01Jrm7e6wDlC5QAL405C8CPCS3OjskN9IqmIMKbw/3kLP9ya9UPnzs
	2Fp0xMqr6Rvj20RY1sMBd102S1JlYDwzQjP65+01DPiUY6cvEj6qisiiXB1ISQpv
	B8rtvA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9d7j9j5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:30:41 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91b4bf686ceso99408596d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 03:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791887440; x=1792492240; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vRfB3REly7l4Yt4+ScKAJ76g8z3HDR/+4IYPDuXkwL0=;
        b=fvRie19xDM7GmsRc5Br30Gi5NRiRKi0VIvn9WlTfst/2/ufIXpKukZjjo6r0Q8eDv2
         7+MzBsv5JAGk8qtB/IRBi8+3XuDeNqN5ZgxTXpc83xDfVA9ZFSZ2UcwIxclB/jE9oJH1
         UYoyLUcCFk18yrOZ1Wl+A3Zu0DhFzUs/Lag8AQfuFDbaKh5p1QmjzywhqS+0D/ZfspnT
         OqeOiBbYiraos7S+r9qA8RYpOzOR345kp1rDj5Uz7vwP9pTE15AUZ+WzSQQPOpq7m8tk
         H5IUo4VfImUNa6tY7dbKgVVtIF6VmV0mACr6+oV2QPPvYcnY1+lGc1aDGpZ9aTfVswbg
         OwJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791887440; x=1792492240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vRfB3REly7l4Yt4+ScKAJ76g8z3HDR/+4IYPDuXkwL0=;
        b=kEcx8XUTnemnpSX5GvyXKN+elfwTfTWOqj7A5P7Z4UMA6ohXHu77jzkdietEL3KM4m
         uSKiP+xgBIpMfUeULm3azb0nDwljPNltYRwLxb027uZ5XFIVuZcGSqNlrMXbvwcSmgPu
         7PKo3vgI1jY48Vx8rNMr3IZ3tQzT2dQvBks8Jg66XgAYBkFPZdX44iP0nAhzl6X3b6g4
         nDXivcnghVGt4GeXHT2Mf4f5fWyFOdu973W3miHtPQJ/exX4+vfsOvkI12+AtU7wxQvz
         QGE8JICgUsaJlFIBll4t/uSsTgCwv76vvXObrg3NmWyZn96kBrYEKHG/g43LlVyHS2G5
         bsug==
X-Forwarded-Encrypted: i=1; AKwUvBzojUpyHOlsU0L20uo2wHh1DaXOivHjUZBgmcuiypVy6LusvVM3+mgBB0iHPGyNifc3ssrpWmt61O2mEYK+@vger.kernel.org
X-Gm-Message-State: AFq9FYI9rnCwCXqFBPoTD8TrHyk/OMeTh0Qn1dSwy2XKg2xgNuixNW0p
	wgVUJt6PlBCvrYEoOgbDK/CEaHAaTrE68F0xvQoPVj9oouiCgNpm/mV/TJHFVPrw35rpF1khpGd
	ncrXLjvhtHj/N91RdrBxLK3Txl79vwV4BV5JqrHQCtvv0KGe7GQWAMIE7NebGjwwcvsil
X-Gm-Gg: AYBFou34HX1Mg0WWagfwQaWnHQU8dPvUA9iOIinhr8hJBYdt5EyJu5fFzVYmCGE/POD
	VVxk9a/dMa930qWUZF8+6BoxDUapsFJd5gepAaMJ0CR/LucUloe56HBgWjuNmFe49pSPxvUMYcw
	ejV9PMQqF1aCTCxMw9NXIvJ9YBF4i3nf8gYd+be2MuQlSJHR171cMu1ggixGrVO5/8t/QGmc9Kz
	0ZG8G5g9vuJFr82BtG9GBE71wkSiKsaYzd8YUWFJWyQ5NoRsM70iDVQ7CeB2W8ArsskEeJUztnL
	sdPdQ506LS6wwZ31FO2AAxlH2OpZtpcPI864JeP51qLr7WFJ9apa8CGIlNywV8FJFUt4gvz6ueu
	lJ+mUxJyHZqlzcEv71SLSd+Qc6dKGIWBLsYRjVJV+E0doJrnEJfA6iF1wev1M7n6gf4E6gXl7e+
	WM01lNX2FiWzS3hOWK9YmNS0b79zjjkKtierfNLs95nZivdH36ebc=
X-Received: by 2002:a05:620a:2989:b0:93b:fde4:4923 with SMTP id af79cd13be357-93ebd2a0815mr1925320585a.63.1791887436801;
        Tue, 13 Oct 2026 03:30:36 -0700 (PDT)
X-Received: by 2002:a05:620a:2989:b0:93b:fde4:4923 with SMTP id af79cd13be357-93ebd2a0815mr1925306985a.63.1791887435261;
        Tue, 13 Oct 2026 03:30:35 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d108:3895:812b:662a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18be964dfsm349955115e9.7.2026.10.13.03.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:30:33 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:30:28 +0200
Subject: [PATCH v2 4/6] i2c: qcom-cci: Add burst write support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-cci-imp-v2-4-6873326b44a3@oss.qualcomm.com>
References: <20261013-cci-imp-v2-0-6873326b44a3@oss.qualcomm.com>
In-Reply-To: <20261013-cci-imp-v2-0-6873326b44a3@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: O7C1sI9EWaRcA5ZHFl1-eN2jOGZC1L4Z
X-Proofpoint-ORIG-GUID: O7C1sI9EWaRcA5ZHFl1-eN2jOGZC1L4Z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfXyoMRrx4oBni5
 wgWL5JH/egnT4hS+kKhfE5dFMfyUzoxexAbGfpUuUwQvXXAC2xqCMxxJrxHJWDEzGqECd4cFRFD
 BskLMK2Je/PVoINj7MLpIqoS4pqqoCo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MSBTYWx0ZWRfX2TlwjxtvEK7f
 Y2ioC3rbPhVbxWjUmBl6fFA9d7vjWlmSg+j4Ro/vvFtJxRHgRNQmIH4isOn390MXUTBjZZFTssK
 +ufX/yLqYSWY2koSQODderzxFpZ1oaZ2jC/60gzdaj8i3UXdIjl/RTomdU4x+6ksQ+CC49WJYsE
 tjcjuLHBoq5aqFHW94VXU3zKcrPXTx9lYcg9aQcxYtncSL0yuRrplEJgoPT2S2VN02FJSVNIGdd
 BiNEKe5t0Gd6WMvUD+/4oJypvnKDpLdUlSGHbdK/EoxW4/WeN3E79NcRLtRvoQcp/ijwMbbu8cx
 xXESrLhcKgPRFyam0rsE+129f9NmQulib0iEfkb1tBs2wjdVZIxoNbwYk2kv+8EtNAzUVoeiF0G
 cdESJLrH7Tcp4ZH//oseeC0JXvyH0IYCvltBcH99g1h6Mt7y01IYntNRylrG5Fey2NPGHBFUPCa
 oBjOszlEUYrihjjad5w==
X-Authority-Analysis: v=2.4 cv=PMGaavqC c=1 sm=1 tr=0 ts=6ace0851 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=uN0qKeaNodZ6YgCSxmEA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130041

A single CCI_I2C_WRITE command can only carry up to 11 bytes,
so every i2c write was capped at that size via i2c max_write
quirk.

CCI v1.2 introduces burst mode support, where consecutive
write commands (marked as burst) run back-to-back as a single
transfer.

Use this in cci_i2c_write() to allow longer writes across the
whole queue instead of a single command's payload, and raise
max_write_len accordingly for every CCI revision that supports
burst mode.

unlock/lock commands are required to ensure the commands for
a given transfer are executed atomically.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 44 +++++++++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 9 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 3bca29f1d2699375a0348b18a5a2e646a59fd94c..27bbd1e196f9c55c1af14168b83eb6e6d51c75ed 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -86,14 +86,24 @@
 #define NUM_QUEUES	2
 
 #define CCI_I2C_SET_PARAM	1
+#define CCI_I2C_LOCK		6
+#define CCI_I2C_UNLOCK		7
 #define CCI_I2C_REPORT		8
 #define CCI_I2C_WRITE		9
 #define CCI_I2C_READ		10
 
+#define CCI_I2C_REPORT_IRQ_EN	BIT(8)
+
 #define CCI_I2C_WRITE_WC	3
+#define CCI_I2C_WRITE_MAX_LEN	(CCI_I2C_WRITE_WC * sizeof(u32) - 1)
 #define CCI_I2C_WRITE_NWORDS(len) DIV_ROUND_UP((len) + 1, sizeof(u32))
+#define CCI_I2C_WRITE_BURST	0xf
+#define CCI_I2C_BURST_OVERHEAD	4 /* LOCK + SET_PARAM + UNLOCK + REPORT */
 
-#define CCI_I2C_REPORT_IRQ_EN	BIT(8)
+/* Largest write that can be bursted through a queue of @qsize words */
+#define CCI_I2C_BURST_MAX_LEN(qsize)					\
+	(((qsize) - CCI_I2C_BURST_OVERHEAD) / CCI_I2C_WRITE_WC *	\
+	 CCI_I2C_WRITE_MAX_LEN)
 
 enum {
 	I2C_MODE_STANDARD,
@@ -521,14 +531,15 @@ static int cci_i2c_read(struct cci *cci, u16 master,
 	return 0;
 }
 
-static void cci_i2c_load_write(u8 *buf, u16 len, void __iomem *loadq)
+static void cci_i2c_load_write(void __iomem *loadq, u8 *buf, u16 len, bool burst)
 {
 	u32 cmd[CCI_I2C_WRITE_WC] = { };
 
-	if (WARN_ON(len >= CCI_I2C_WRITE_WC * sizeof(u32)))
+	if (WARN_ON(len > CCI_I2C_WRITE_MAX_LEN ||
+		    (burst && len != CCI_I2C_WRITE_MAX_LEN)))
 		return;
 
-	cmd[0] = CCI_I2C_WRITE | len << 4;
+	cmd[0] = CCI_I2C_WRITE | (burst ? CCI_I2C_WRITE_BURST : len) << 4;
 	memcpy((u8 *)cmd + 1, buf, len);
 	iowrite32_rep(loadq, cmd, CCI_I2C_WRITE_NWORDS(len));
 }
@@ -537,9 +548,12 @@ static int cci_i2c_write(struct cci *cci, u16 master,
 			 u16 addr, u8 *buf, u16 len)
 {
 	void __iomem *loadq = cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, QUEUE_0);
+	bool burst = len > CCI_I2C_WRITE_MAX_LEN;
 	int ret;
 	u32 val;
 
+	dev_dbg(cci->dev, "master %d write: len=%u\n", master, len);
+
 	/*
 	 * Call validate queue to make sure queue is empty before starting.
 	 * This is to avoid overflow / underflow of queue.
@@ -548,10 +562,22 @@ static int cci_i2c_write(struct cci *cci, u16 master,
 	if (ret < 0)
 		return ret;
 
+	if (burst)
+		writel(CCI_I2C_LOCK, loadq);
+
 	val = CCI_I2C_SET_PARAM | (addr & 0x7f) << 4;
 	writel(val, loadq);
 
-	cci_i2c_load_write(buf, len, loadq);
+	do {
+		u16 to_write = min_t(u16, len, CCI_I2C_WRITE_MAX_LEN);
+
+		len -= to_write;
+		cci_i2c_load_write(loadq, buf, to_write, len > 0);
+		buf += to_write;
+	} while (len);
+
+	if (burst)
+		writel(CCI_I2C_UNLOCK, loadq);
 
 	val = CCI_I2C_REPORT | CCI_I2C_REPORT_IRQ_EN;
 	writel(val, loadq);
@@ -713,7 +739,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.max_mode = I2C_MODE_FAST_PLUS,
 		.queue_size = { 64, 16 },
 		.quirks = {
-			.max_write_len = 11,
+			.max_write_len = CCI_I2C_BURST_MAX_LEN(64),
 			.max_read_len = 12,
 		},
 	},
@@ -722,7 +748,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.max_mode = I2C_MODE_FAST_PLUS,
 		.queue_size = { 128, 32 },
 		.quirks = {
-			.max_write_len = 11,
+			.max_write_len = CCI_I2C_BURST_MAX_LEN(128),
 			.max_read_len = 12,
 		},
 	},
@@ -731,7 +757,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.max_mode = I2C_MODE_FAST_PLUS,
 		.queue_size = { 128, 32 },
 		.quirks = {
-			.max_write_len = 11,
+			.max_write_len = CCI_I2C_BURST_MAX_LEN(128),
 			.max_read_len = 12,
 		},
 	},
@@ -740,7 +766,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.max_mode = I2C_MODE_FAST_PLUS,
 		.queue_size = { 1024, 32 },
 		.quirks = {
-			.max_write_len = 11,
+			.max_write_len = CCI_I2C_BURST_MAX_LEN(1024),
 			.max_read_len = 12,
 		},
 	},

-- 
2.34.1

