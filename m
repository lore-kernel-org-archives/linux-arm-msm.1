Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A889497B7D
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 Oct 2026 19:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791141007; cv=none; b=oouEaBg2G6f+1+A7ejoWRgEjq2mkOTmcR4ViogkQW03w4CXEDUbmsKqQk0DqhTsfuAIfAm54AykzJ8EvQm3yMXoCnoT57bxHpercIrzRu5SzNIqIcmXmEDnFWSt7oJqvy+yhdGZuBA2sgF1x1QBqT3bGbLoTKUQkPlQSscvKPo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791141007; c=relaxed/simple;
	bh=+BFjDkLLGiM4Z4BilxjEIUHw5Q8uQiEcFlpgHQFk4iU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e/F1Lx2OqRGRKt3TkQArpp0EaXSf313lT6diRVE84etlIoQET+NzztqIGOiOJF2i67qB6W5meFbrxHKMBKPHsKpGdDy94I2lQM5J3xwxwY/bU34VAadC3Yzzq+PateltSaOukVuviISbVaX2hsOElNOQ/S2qM6u3+GcNVx6UUlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QpeB5qLj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WMVM9wwQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QpeB5qLj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WMVM9wwQ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 694IHQqL3672331
	for <linux-arm-msm@vger.kernel.org>; Sun, 4 Oct 2026 19:10:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J3rp9e5dLRcm3b9/yRcUca1yu8dnsEO/hPj3KPAyrCQ=; b=QpeB5qLj+BsZ0PG2
	h9rYqLXwrHtR+rZL51iB8LZ+gHAOHE3MzcDF7jQJDW65BKKeWoS2YvuJSqKgp+wh
	cxZbHbcnMx4aGXXlgxMKSZ2/NIn313OD9zcP8EaYsryi5IhZOq/PMPfswYRHZKAd
	IO944Nr+QA0ahhR/ltJUl3Co78AHD6thfVRH2Sa8aAhF7fCQi0iX2eoD6rRHhwpl
	W0bkpWbVEGmghoZ/jTPOZh+iPk4TrjPK5kxC/RzdP9poEprnivNmn6FRM3s42EVV
	/Xjs5NhoqmD32t2ouPi0Xk/Nf7bgUAJObGcpUx8FRH5F62YpjxeeWUX756b0SGs+
	wpr+FQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2t06ukwa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 04 Oct 2026 19:10:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53380b67cfdso25143611cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Oct 2026 12:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791141003; x=1791745803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J3rp9e5dLRcm3b9/yRcUca1yu8dnsEO/hPj3KPAyrCQ=;
        b=WMVM9wwQQUz9taHGJXysSlfN5CqcyKhsTGxO3Ya/FtDIiSgaWPxsawrplF0nmSQT6a
         E+D2WGdp2OekCOtPptsDZ4Nzz2ANuFnDTRgHF9SEr9i3VybCaRH+dPOpKkp2Qni22PUs
         SJK6C8DAXbF1v2iYfR40GcE2KsVCCEk97Yu4HvYkAGaC711nJJ6m4b1oWpr+0ncCFJcb
         SAwXHK2J9kx/TMsdXe1Zgh1b41Ykj6Biu3aBScLZMu6MXws6BsvQ2kve/QM5ZhyuPsxi
         VhvWfPEKjPR40HpzWbAKVSHoKRp6vLmsmKYw/2Jub0gUOTVYSremGjRCbu8K8dmEwllr
         lIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791141003; x=1791745803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J3rp9e5dLRcm3b9/yRcUca1yu8dnsEO/hPj3KPAyrCQ=;
        b=k4hy8Y1IUY7s5c0ExBZpn5ayrIRR/12ft/0eN7ADSo72O5Xbygyw+lvNsC/2HcPU8t
         l9ZzRiSUpn0EH+tjzYgDlGPllh7mrTTBHh0NEVfjg+wD/xXWMIne7dQNYyNNt5g38DOG
         83nA2syxWbs9ruNRW/Kjk52V5S3iSw/2jlFTAx9Go6gOsiNI4JxsgQl2gR71B4oVQA3N
         T9bUgFmpKCKevDhwjIGvmIz4zYDwcxyXo/W1JO9DhAENNS/vgqR5hpjxYQxhCROIuyLH
         0+clB0Et7InH//+Ukl6GJdi4SUdDl3GxJxzQMXj4cVO1s5e7MWKwqMZ8MnHjeSfKji88
         SiKg==
X-Forwarded-Encrypted: i=1; AKwUvBzkkV59yksczi1DRrHJQ7SnBuKTSWCbFPZwNUrCbbcyir1bSghPVz07AOrph6k3chWSIAaqse64f5MDIeVl@vger.kernel.org
X-Gm-Message-State: AFuF++mrUWGoXqRO0erUXFf/d9J0/5oGhRmQ/B/2lbUjm9lPPFasaRND
	/cCdgFsvt1xNgN1QLrvVt92zYFtnyPUwEOM/qaeSrx3gNP1FrjxGumIPdwMNuaCfRqmCJmYHzbR
	1xGb/WhvMhRz78ySKHamCC2iojUy/Wfd4aoUwDU97B/EUYf6wD/QunWsh4OxiT1NVJ0Rj
X-Gm-Gg: AYBFou336FwCP72qnPQN+B+VM8Ao4Qk9QjBM6EZuGCJpuyMswWhB9d42wOxDO5edbJI
	NMbHOxoQde/10Fy8DGkTCl7TCYQgb3yg3sd8n+XEnhxOKxZV6ps8ASfERz6cc3bBzkcQlm9aAlO
	rqCOaaKS+CZWYcqfpKGP7NfGNXWA2/zvEgdV8ooD7kVYe9G/d01LNMxqCwwk0Iwyz7iFE0n0r3E
	mLYGW2QGsgzuoyvguCzU9QewLW2fV04+4YPRjPWJ3k0uFTF3QqFPaoaT6sHSnP3my/LEObufOFc
	sLnno8xH09p9kzSJKmXhoxptnyonJRBaJBByHrqlhJYzclZz+tAm7/Fjb5upHvxiqaCj+Bssb0j
	phobbrkoUISYEJQrwPUsNzv6sRrTnmb8HFYFsySgmK03cwK7ANWPJZLv/EYMsQQJX7v+gcbeLWb
	KfsyuI3GnSGOG9CrJLB75TY8UjGCnbd4twZsHai7DAniclvcisVw==
X-Received: by 2002:ac8:598d:0:b0:535:2568:c7b7 with SMTP id d75a77b69052e-5352568ce3fmr40815131cf.9.1791141002890;
        Sun, 04 Oct 2026 12:10:02 -0700 (PDT)
X-Received: by 2002:ac8:598d:0:b0:535:2568:c7b7 with SMTP id d75a77b69052e-5352568ce3fmr40814881cf.9.1791141002482;
        Sun, 04 Oct 2026 12:10:02 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([37.169.59.74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394ca0f0sm176318385e9.1.2026.10.04.12.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 12:10:01 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sun, 04 Oct 2026 21:09:50 +0200
Subject: [PATCH 4/5] i2c: qcom-cci: Add burst write support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-cci-imp-v1-4-227d12cb4829@oss.qualcomm.com>
References: <20261004-cci-imp-v1-0-227d12cb4829@oss.qualcomm.com>
In-Reply-To: <20261004-cci-imp-v1-0-227d12cb4829@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=cf5HPXDM c=1 sm=1 tr=0 ts=6ac2a48b cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=1Gfya9YG+27Uq/30OuQ23A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=IknTBVmojEPKtAEnxLoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: wLqe-h2O-utDADMnq3uHWThyvw_wCCYj
X-Proofpoint-GUID: wLqe-h2O-utDADMnq3uHWThyvw_wCCYj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA0MDA3NiBTYWx0ZWRfX5933ZQDFarK5
 FLD01E2KinPHOoioabKhmLzZLaBqc4iKyYp+ZN1ZIzZVtkRu+BD5IAC4mNqtyp3E+EnwqHYHHir
 wXw1r/7l85DhqYKXNYIU2w78tflrheGfhQsQqB2/c7NQbvQnXNHv9OHAIm5T49btHsx5W79NqNr
 ykgYYS16VzchiE0c7m5nt+Q5lYy7UrjfeiBpHr+LRh/yDPAuTD9WNeyHdJqzqTCwoOnV0D4SUJf
 OpfFzKMBotRG9cfw63WUlpnDkLcDP0B5YGDRr6b/j6DXh28cvRQq7mLSbSsyT2qKsx2EUA+LE1Y
 U4fYXoCEBf0/etIBmkblunsXYZsjAf2ZEoboVPIBU9OZsZZ19aUZxgX9bcVOqoBFuqqG3pbgQXN
 7KxVxSvZfCkCX+OjKt9otxkk3c3TiVremy90BwMauHf3FBW/OObOobMex5twVZJ7rnPgmmAcQJc
 g6QDoNHLayLKLmsBDbA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA0MDA3NiBTYWx0ZWRfX7VFmU2oVp3cD
 7pkTVe4kxnnI/Nc1RZyRs6arVZDvHvSUgCKa7ppz0CRZ+OUtz4/83mIxs0ILh1vtDOfxQodqANa
 y3bj/35wLRKZztudcZlLRrrF7eLhNJA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-04_05,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610040076

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
index c0b39d419e296454a083d38ce302940875b8ad2b..9554d42e6b976ef33f6421a98209c2fb837e9698 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -85,14 +85,24 @@
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
@@ -520,14 +530,15 @@ static int cci_i2c_read(struct cci *cci, u16 master,
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
@@ -536,9 +547,12 @@ static int cci_i2c_write(struct cci *cci, u16 master,
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
@@ -547,10 +561,22 @@ static int cci_i2c_write(struct cci *cci, u16 master,
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
@@ -712,7 +738,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.max_mode = I2C_MODE_FAST_PLUS,
 		.queue_size = { 64, 16 },
 		.quirks = {
-			.max_write_len = 11,
+			.max_write_len = CCI_I2C_BURST_MAX_LEN(64),
 			.max_read_len = 12,
 		},
 	},
@@ -721,7 +747,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.max_mode = I2C_MODE_FAST_PLUS,
 		.queue_size = { 128, 32 },
 		.quirks = {
-			.max_write_len = 11,
+			.max_write_len = CCI_I2C_BURST_MAX_LEN(128),
 			.max_read_len = 12,
 		},
 	},
@@ -730,7 +756,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.max_mode = I2C_MODE_FAST_PLUS,
 		.queue_size = { 128, 32 },
 		.quirks = {
-			.max_write_len = 11,
+			.max_write_len = CCI_I2C_BURST_MAX_LEN(128),
 			.max_read_len = 12,
 		},
 	},
@@ -739,7 +765,7 @@ static const struct cci_data cci_hw_catalog[] = {
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

