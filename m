Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EEB443AAF
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 08:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792137622; cv=none; b=ZZk9SQruLm/Er4u699TxGRnU8cqrPfoqYnHFUn6AX725dpB3G29Fnl/qCzmauSnlzTLBVyUhVTQKG+Gg06A6oXQVsXESWINqxXffxY9POmRR2NO5B+vwO3vYjtcxYmyEWfSzVFsUNv+Q9GN2NO46kZgu1reBPzgM77zyKgH2dFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792137622; c=relaxed/simple;
	bh=Omh/r/EkzbxDwK4u3Jsf7Qm/OF6SY/r+dH/xbsZP8xA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aa7lAuPzaVL7/K6dckJgegqKgnJS2CP/l76f0gUksrHG1I8xYsh5H2h7pO2zn9wc1c470gqPMcGYISen6alh+nuONgSgZFZsWF71ZZd4lhvGvQ9GBJ8Ot83y9pftP3VLh3IMpyUNVBTwzOfPthB7bbdHfotcm9uVpc0sh95gtqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=caal9e1B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hP9hUHie; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="caal9e1B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hP9hUHie"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G7lhwc1890806
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 08:00:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tFotLrkKB0thxNBZAni68bXXHHliGXu4ceaayS8YZzk=; b=caal9e1B9XQg3K7F
	oXeIJMMnfIeIEIelUGSMhQdDgiR/bmtVSI3+8ZZhaiRbllVCC/obZAyuQABrqL4n
	voE/hA54yDcthsjZ++3Ox2Jds5vLgywvM7gOTEQE3/M1zBlezGD9uDh4VEp4FSfK
	dNwSTsKuQlzrBxb0GS7yzZAj3PLINtiQVQ2JdKUZTE7NyKjX/p/T14xxHzl5opiN
	e545JtXU5jAeMyfBGHacAzjz++YF17GlrcZt/VIe2paKpFhMep/H124xigqR+cI3
	1nCnr2GPDpzONKDX1vgWpNzPxlkGb+r3csMGM6bw88Acd5DZ4d8mYfT8Q2aEq8xu
	7cd3Ug==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hba2619x0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 08:00:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93cbf2fd504so394918485a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 01:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792137619; x=1792742419; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tFotLrkKB0thxNBZAni68bXXHHliGXu4ceaayS8YZzk=;
        b=hP9hUHieeJJ+mezUo5GxrKAcSO52nl3lf6dYnFpZEcyNcgJaOsLXvcfliWb4xIPRh/
         nLPPXWyNUjpaS/7VvUiIGah1EvZkiX0gjel9YYoS946/81gjBHPR+uJEw7sBgTcz7wM8
         Lo/hphFHk8JrG+KZGVgPR7F9JEcHtVgxoHIoznjjdcKs4smdi17Ycn9Xa6GRrlxfg7S0
         kkm1HnZ9bnwULSkcoXvDYWVEhTN/BjrhJG3uLpapdXqExOmhfE5IIzd+0rgj7ey3OvqI
         a06LpmX2N8gzQt6Ix4yPRM9RCuhlHe2pt72ya9jUeMwCVRZ1OVpTWWs9iLOOPMOcBIov
         A2KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792137619; x=1792742419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tFotLrkKB0thxNBZAni68bXXHHliGXu4ceaayS8YZzk=;
        b=Ab4sWAsOsAu1gw8O6JwLVW766TsGSwwlLX6Ksl75VO/cPiU1x53SfzrCey1tuj/vB8
         +vGoZWX+O+nnZhZZt7fDFkfvEzXQVJmvuxJCBF0OmhQioXuD5vctUmp6Sjx5tn60n4Xh
         Rate01e+9VyTID0U8x1N3ch7+Wf1cJDvHFtAlhia994fUj2t/7oU3oudGCoJmnd5qMaA
         N4y7oadLJOqK4wgPrw2fTDUnGRr5t+5c5Hqsw4Arf44CDR1vL/awPk7CNQGi475Py3MH
         FpXaNfUyRXtRlb1iDu+E2TFBTZwUsWyPdHilgwhPahxQMlmZqvzitdh0d03pTrqYT9aR
         GD9Q==
X-Forwarded-Encrypted: i=1; AKwUvByAZk2FNYjYLaZWHXIf2ayp0ovc52x3/poBeHnDyHbTyT2tRczxkv1KkfhGjQYP3y3fTMY0R+Q8n+L0s6/h@vger.kernel.org
X-Gm-Message-State: AFq9FYIeOcNOqYG9Js8omhTX5tDz46bgknavG+1iUT69zlI0fTrEOrTy
	6w4wyjljPK9MBLmFPvyBjC/b8u+vwpQ0P9qx+i7goOnm+KN/rePD/yjnKp0Ox+kcDC2kQKSA00f
	raNQHgNkaByHhEVyVfPEBnrxeYR65QjZiQWsSEBCfrJyxst0TyjD/8RM8eb03MxaEZsauMVIFgQ
	t39Q3CfA==
X-Gm-Gg: AYBFou2M/t0n3ANqqsYvdLtufqQot4iDgNAouk5qKhpAkHoyyIG16mqiAdntZGzwFOD
	eGlMYCXB9Ys1zn4BD5YzjLZLsLwmhXZEgkC5adngo3iYa4wXvguGS4tFFIP7psU/1raQIzuPVic
	19mgEYFDXsmeVFWS5B99TB3gm4l9hGESCQ2mzn6UufUWJH0aHRwCaxHPWfcUI3kx5/sV6eM6EhP
	Y2Q9iAkFwUDbSMrkpNZFlieJKItLPnWzb8Cgq6ODXvy6wz9DZZ49qQZxD60DtxsQCK5S1px34aZ
	PDCB2MwZoUrRopkqPLaML0iqB7v09RJ5qLh8hTxq6rmzTE1S8vd+fIYzisImH9hsURRch3EZbiT
	BPLCwMU7zo3WqThpn6Q6VdhfiLr/DyGHUEbLQMYDVjstz+sQzAHtPjUyoEDKR6+zmt/NI51sMXd
	urTDz9XjG/PJqRHp6CFLj//lE9pto3f0t5mp2aYnjI4SvI76YqfUM=
X-Received: by 2002:a05:620a:1720:b0:93b:d7a3:45cf with SMTP id af79cd13be357-93ebd29005cmr3366277285a.56.1792137618934;
        Fri, 16 Oct 2026 01:00:18 -0700 (PDT)
X-Received: by 2002:a05:620a:1720:b0:93b:d7a3:45cf with SMTP id af79cd13be357-93ebd29005cmr3366272285a.56.1792137618284;
        Fri, 16 Oct 2026 01:00:18 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5402:5e0b:9ef0:9b5b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4c5942sm5471446f8f.16.2026.10.16.01.00.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 01:00:17 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:00:12 +0200
Subject: [PATCH v3 4/7] i2c: qcom-cci: Add burst write support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-cci-imp-v3-4-5ee7ec1ea1a1@oss.qualcomm.com>
References: <20261016-cci-imp-v3-0-5ee7ec1ea1a1@oss.qualcomm.com>
In-Reply-To: <20261016-cci-imp-v3-0-5ee7ec1ea1a1@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=bsHZl0ai c=1 sm=1 tr=0 ts=6ad1d994 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=Yp3SuMTfTe4RQKdpiVsA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzMSBTYWx0ZWRfX+4d2Uk/4yP7x
 GQ+FNIGDjoDQP6XIdasN/Y+cRo7JKQ/V861pet2pjnTFAPWeiumLMIgHYcNOn5PmdOnZqsEv774
 M4YX0uYwm5KotmErv28Zw598Y7u7tOfeu/AIhjOBcEyMPUzgVo3Ety1vgtbZWsZytX2xsEJ4GP0
 R3UGgDzGQFobhZJ0cKHQPKnfRMUg2bHR4P+/KCf7HLqxxA8L3JHPloTBbLCHsG8w6IyzMirnYDk
 HbTP/aTt3NM7VlnpRD4AhYRsxk7q4IvsstRCqyCU3hZImT0ZmBIdObl+Rc30liZz/xJvxpoO/t4
 nBXzZFAr/WqhsHT1R5O97osBPl5OfHp5lxWYMXw1U9cl6+7tXFbJ/5IysMEnQoCNzJMbM4wN2BL
 /8wGZqiYm4dGwZckLxEfGRMJ+nGdt7zgB5P2JfkmInCNq4sDzE+5xi2K1J+Sqt3zMhELdR5JiZ2
 r7gTYy816VFWDoR272A==
X-Proofpoint-ORIG-GUID: mybEanBjRnpN4B97iFUFxHM8suqIL20w
X-Proofpoint-GUID: mybEanBjRnpN4B97iFUFxHM8suqIL20w
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzMSBTYWx0ZWRfXyn/nJC5scPBu
 mVrsby8z8r1mfYqSlZtFtZp6YaJePhqUkffBidIXY3JJUDPOREJKc9mgw/5nX25VmpaSrARhvFs
 z+Edw0ev1IdBcgFADW6RmsoJuDKH0J8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160031

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
 drivers/i2c/busses/i2c-qcom-cci.c | 39 +++++++++++++++++++++++++++++++--------
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 7d2e214ac62c652ada122791c69306724425d0f6..bc4aa3c6431f385e07a74c67323674c183a31f97 100644
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
@@ -521,11 +531,11 @@ static int cci_i2c_read(struct cci *cci, u16 master,
 	return 0;
 }
 
-static void cci_i2c_load_write(u8 *buf, u16 len, void __iomem *loadq)
+static void cci_i2c_load_write(void __iomem *loadq, u8 *buf, u16 len, bool burst)
 {
 	u32 cmd[CCI_I2C_WRITE_WC] = { };
 
-	cmd[0] = CCI_I2C_WRITE | len << 4;
+	cmd[0] = CCI_I2C_WRITE | (burst ? CCI_I2C_WRITE_BURST : len) << 4;
 	memcpy((u8 *)cmd + 1, buf, len);
 	iowrite32_rep(loadq, cmd, CCI_I2C_WRITE_NWORDS(len));
 }
@@ -534,6 +544,7 @@ static int cci_i2c_write(struct cci *cci, u16 master,
 			 u16 addr, u8 *buf, u16 len)
 {
 	void __iomem *loadq = cci->base + CCI_I2C_Mm_Qn_LOAD_DATA(master, QUEUE_0);
+	bool burst = len > CCI_I2C_WRITE_MAX_LEN;
 	int ret;
 	u32 val;
 
@@ -551,10 +562,22 @@ static int cci_i2c_write(struct cci *cci, u16 master,
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
@@ -716,7 +739,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.max_mode = I2C_MODE_FAST_PLUS,
 		.queue_size = { 64, 16 },
 		.quirks = {
-			.max_write_len = 11,
+			.max_write_len = CCI_I2C_BURST_MAX_LEN(64),
 			.max_read_len = 12,
 		},
 	},
@@ -725,7 +748,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.max_mode = I2C_MODE_FAST_PLUS,
 		.queue_size = { 128, 32 },
 		.quirks = {
-			.max_write_len = 11,
+			.max_write_len = CCI_I2C_BURST_MAX_LEN(128),
 			.max_read_len = 12,
 		},
 	},
@@ -734,7 +757,7 @@ static const struct cci_data cci_hw_catalog[] = {
 		.max_mode = I2C_MODE_FAST_PLUS,
 		.queue_size = { 128, 32 },
 		.quirks = {
-			.max_write_len = 11,
+			.max_write_len = CCI_I2C_BURST_MAX_LEN(128),
 			.max_read_len = 12,
 		},
 	},
@@ -743,7 +766,7 @@ static const struct cci_data cci_hw_catalog[] = {
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

