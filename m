Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F2D5208A9
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 12:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790684761; cv=none; b=CAdYL+4OBf4fftYP8z9f5aK0LtMGwJj/aI5eyyB52xfrRq9og7WET90lDaobOkq9Lyp3vq4NLLGjzUGHnOt8o23eao3HuOrLCXLl1sqQALQfeKoG3smlmTua8bNULQwKoPFa82sUL9yV3fiEEVGTOn5Iq5MK8ha4tsvlYVE2R28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790684761; c=relaxed/simple;
	bh=VB1fq1RKiKGVJL/jXTuCtxqg6mIar30rpelwiVPPn4s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T+jTCn/zv3FCSLmmrzk2c9D3CmpcIZOkZDevtJDWtIsqLYzvBWHXGEmml9aSoN84OxtJqBkIGSgzzWaKyfmw71DTsMS5MD9PSQy5z7ZtNkOoLoBFx5luDkjGaDOrMwupxWZ028nsTFT0zTH2TjsX2cqAyH/sUq5Ywe1YiDPknvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YMYVkWXT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aV7agCs4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YMYVkWXT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aV7agCs4"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCENhU119188
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 12:25:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Zd8H7pUQjwRPH2i35MnsVti9s3z6U0qbD41nLQ6bk4=; b=YMYVkWXTo2z2PNEj
	zV3iLKsbKemrzIx7Q1db+emmf7YZ/da6h04bH/qDFWcElGDBScFOptnChrONOtp8
	Y0mY6l+gd6S2d0gkffkthpZ/oe7A4KzcNZeksP0p0BORInYfGvMX8hinsUuNsii/
	Z8+EOzb21TDnDTBxJVWiPz3XzFJgU0c9H0eX2vriqfRcC1l0ZqDsLQirB/0FlGQX
	ooKlzWDmZQjy8Ws2l01Ffy2cmoc8pwzUwKmH7H1SAdr+lv34I+Dw70cBOzVWZTU+
	Ju8MtJNi4kNgqjyd/xJKyUQ82Nc3VfGz5hhll538nD1PkMsMwmdrWU1sK33bUtbz
	73gS1A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0144twj2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 12:25:57 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91235881828so85026386d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 05:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790684757; x=1791289557; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Zd8H7pUQjwRPH2i35MnsVti9s3z6U0qbD41nLQ6bk4=;
        b=aV7agCs4o59hCS/5z1sI8DYqtkRcYMqggkarIqiK+B2SNbuftD4Jkimfu27NXkct4m
         eUHOpqE6lxSgP36EzWm+L/DJ3EJy41LryhJJwVxGfZfqXixuYKpZxcr7jfFGEXuTdfO1
         Zh0GUpqIpRAUWH4dLG4pKZUPN4Ge5BASWOBGfTwAVsjPDfaN3Iwdi1Uv27sH1zQSD95U
         HcGwKBG38X/N4jA624JvQUbGxf+SUAfyHeF7bJDTcdBhQkxq9BpE2wEJwPL7Se0cICtj
         vVZRJjtIMR9xkxLGrpfdEM3C74/H78JlRkUj0+u7n2wcC7TKELv7wSfjTxuJc3pL6rKB
         bnKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790684757; x=1791289557;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5Zd8H7pUQjwRPH2i35MnsVti9s3z6U0qbD41nLQ6bk4=;
        b=L8qlEr1k5PfCyhSr+m9r5cyQxW4I/HPEr4LSKKWDnMEJ3HZD8lH/IlAoERku7gBQry
         sN+dOr8liE4cQTnlw6O6iNCCmpPKNZ3s8krqpvlj9tR77vpeRx8btC3kdy7Sg6j1Rvtf
         9pTr3bObZMRPqysJB9Nim54+rV0qCmdZ/yWCBIouzXwB+Ii3ERXuwFAhPHtgnxNAEaSk
         6DQ8JG0qq+8yyYqCYUqj3UvyajvHdc23211ELzNexxRPD/by7VE02cAumN4Aje8QlXOq
         or2JAE8YjnmkSq/EVRpnziKPr8IquhTA6VzdlDoO/Ri3gjUkA1NGzHb3F/qwfX28MwWh
         //NQ==
X-Forwarded-Encrypted: i=1; AKwUvBw/lzJECuuBBox4fKzSDNDtiwpTX2S5AzMwzSURVDGJ7bRBWHgz28LVGe5zR+ocWPOwYBen4QafoMAR80SF@vger.kernel.org
X-Gm-Message-State: AFuF++kz2A964n/xfmsTBDevPr1nS6Bk/HXL/s2FW6vesZte46qEGsjJ
	YAfFz6c7JqFNFL+fGQRW4qGuYFFgiqYEZ+ELgn/H7hjkcxZXHwNE7IeZ9fmDbp5CaT4AbmbcHgF
	bjWUbExh7lbbri+7CgSzIsT2nwOkaSPMQt/wge9ofk9ZAif+xGkHfoaZMPj6fM8IjsvH0
X-Gm-Gg: AYBFou1uCiodpa6/hs3FFMjY1eTL2lmwtWNxSKWgpAi+KP6oC0OI/moIA+EicSmyGtd
	Qp2JEP0HrJNNx6iqbw2XxmtIZ6uhY/zrNMFvprIuwKIe89a/JBwwoXg7+apPqkfHIb10HIlkMJB
	4h6DcdxIYjll9GgG7+9ZIg6Xzvq6R4bLHUKv2k+6fdUFArquTRAxvY9L97+33H207H+AN+DipqA
	pn8FEsQ7KT58wblJsp5mJO0cTM2Mjq87rMjmDqEM0637lHgyaTzp+pML+S185Uakxr4efT1gSmR
	2dsdCu3KUQy0NgTQbVOaAHrxjfIVOalRnvmPTlePgRTsqcAsKKsf/HLMSaQkqXsP+NjmMflCm8R
	BEWuFMAL8yJLd3YjvhdFkTM+qBTpVZW1T86uVxLhP9I+3wxjjpO7fP+03rovXYDua+F25WxGxYE
	hNHtIRfUDcKj7w298QIBsIzXxnVvylcnQx/6YKt3mWFJ5375kLOPM=
X-Received: by 2002:a05:6214:2528:b0:914:4c57:510e with SMTP id 6a1803df08f44-9144c577f72mr184412426d6.19.1790684756511;
        Tue, 29 Sep 2026 05:25:56 -0700 (PDT)
X-Received: by 2002:a05:6214:2528:b0:914:4c57:510e with SMTP id 6a1803df08f44-9144c577f72mr184411926d6.19.1790684756033;
        Tue, 29 Sep 2026 05:25:56 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5c1f:3897:a4a1:99e1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d302482sm9103956d6.12.2026.09.29.05.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 05:25:55 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 14:25:46 +0200
Subject: [PATCH v6 2/5] i2c: qcom-cci: Support per-mode CCI clock rates
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-cci-clk-fix-v6-2-62a268cccb0f@oss.qualcomm.com>
References: <20260929-cci-clk-fix-v6-0-62a268cccb0f@oss.qualcomm.com>
In-Reply-To: <20260929-cci-clk-fix-v6-0-62a268cccb0f@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, vladimir.zapolskiy@linaro.org,
        konradybcio@kernel.org, stephan.gerhold@linaro.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfX9NQ348alI3Lg
 UdMVfW1Rqd3znaLE4+drW9+m4XmjIR9eOovqNs6LniL4m0vcSXNuozD4lSG0oAxy3afnatax6QN
 1g0GpVmcD78dja0wKZTfjSh7/UNoTkLPH7uc4mOArxNh1uGlMHdxmpOHV8nlfSXZNryZMG6KaZv
 ieNIk5B/A3iBMNcpaWE/eO9l+VGTZTFu1s3yONFY8K3wTB9lz+DrgK6aCteI7h3edEJRRXxlro+
 HqG3F5XsUamjYrIT7jfy/JmsAgHwQKTk/B/n34B/xwN0Bx0FOHJM5LktkbK5mELVEpMyB4nX0qY
 v0wm+/lrZguswrpDbqlp7qSk+okyf5j0h6okFBlgDzTQCaiQ7l6/MCPLR/gpP1WF3bCVjiawvNu
 dhGd5C/vrQXH78RNFTs5/EmiEHSJS379DWJ9TJxTI1M+rf+ZKYG0emFgpIjVph5nd0xV4pPTo38
 zVgQ2AsB5964gwLWPTw==
X-Authority-Analysis: v=2.4 cv=FJSOVOos c=1 sm=1 tr=0 ts=6abbae55 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=xxoTSpZZo30Qa_5IT24A:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: vgcPiDjgZPYPUInUyqGF-BpxSDOG86Kg
X-Proofpoint-GUID: vgcPiDjgZPYPUInUyqGF-BpxSDOG86Kg
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0OSBTYWx0ZWRfX0Ec1Nd6pAhqA
 w2A/10JLvQqG/qaZSftzliqFGZA31tc0kv47j41wXTx/KoMDzvd1XkgDjloChOxANso/6wFT2zg
 Jigc0f4VNwXWACVGBB/mqqqNXimg48Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290049

The CCI hw_params timing values (thigh, tlow, etc.) are expressed in
clock ticks and are only valid at the specific CCI clock rate they were
calibrated for. Different I2C modes may be calibrated for different
rates, and the single CCI clock is shared by all masters.

Turn the timing table into a two-dimensional [rate][mode] matrix so a
given rate can carry timing sets for each mode, and select the entry
matching the currently running clock rate at init time. The existing
per-variant values are moved under their calibrated rate (19.2 MHz for
v1/v1.5, 37.5 MHz for v2), no timing values are changed.

At this stage the driver only validates the running rate against the
table, the timings are only valid at the exact rate they were calibrated
for, so if the current rate has no matching entry for a master's mode,
fail initialization rather than program incorrect timings. A following
patch actively enforces the required rate so this becomes a safety net.

Suggested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 74 +++++++++++++++++++++++++++++++--------
 1 file changed, 59 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 0a216c4d08114f267c8441925e8811ca64f1a909..1092ce0371429ef64c7cc44cc23a42ba4c135af5 100644
--- a/drivers/i2c/busses/i2c-qcom-cci.c
+++ b/drivers/i2c/busses/i2c-qcom-cci.c
@@ -82,6 +82,13 @@ enum {
 	I2C_MODE_STANDARD,
 	I2C_MODE_FAST,
 	I2C_MODE_FAST_PLUS,
+	NUM_I2C_MODES,
+};
+
+enum {
+	CCI_CLK_RATE_19_2MHZ,
+	CCI_CLK_RATE_37_5MHZ,
+	NUM_CCI_CLK_RATES,
 };
 
 enum cci_i2c_queue_t {
@@ -117,7 +124,7 @@ struct cci_data {
 	unsigned int num_masters;
 	struct i2c_adapter_quirks quirks;
 	u16 queue_size[NUM_QUEUES];
-	struct hw_params params[3];
+	struct hw_params params[NUM_CCI_CLK_RATES][NUM_I2C_MODES];
 };
 
 struct cci {
@@ -127,6 +134,7 @@ struct cci {
 	const struct cci_data *data;
 	struct clk_bulk_data *clocks;
 	int nclocks;
+	struct clk *cci_clk;
 	struct cci_master master[NUM_MASTERS];
 };
 
@@ -225,7 +233,34 @@ static int cci_halt(struct cci *cci, u8 master_num)
 	return 0;
 }
 
-static void cci_init(struct cci *cci)
+static const unsigned long cci_clk_rates[NUM_CCI_CLK_RATES] = {
+	[CCI_CLK_RATE_19_2MHZ] = 19200000,
+	[CCI_CLK_RATE_37_5MHZ] = 37500000,
+};
+
+static int cci_clk_rate_idx(unsigned long rate)
+{
+	int i;
+
+	for (i = 0; i < NUM_CCI_CLK_RATES; i++)
+		if (cci_clk_rates[i] == rate)
+			return i;
+
+	return -EINVAL;
+}
+
+static const struct hw_params *cci_get_hw_params(struct cci *cci, int mode)
+{
+	unsigned long rate = clk_get_rate(cci->cci_clk);
+	int ri = cci_clk_rate_idx(rate);
+
+	if (ri >= 0 && cci->data->params[ri][mode].thigh)
+		return &cci->data->params[ri][mode];
+
+	return NULL;
+}
+
+static int cci_init(struct cci *cci)
 {
 	u32 val = CCI_IRQ_MASK_0_I2C_M0_RD_DONE |
 			CCI_IRQ_MASK_0_I2C_M0_Q0_REPORT |
@@ -249,7 +284,12 @@ static void cci_init(struct cci *cci)
 		if (!cci->master[i].cci)
 			continue;
 
-		hw = &cci->data->params[mode];
+		hw = cci_get_hw_params(cci, mode);
+		if (!hw) {
+			dev_err(cci->dev, "no timing for mode %d at CCI clock %lu Hz\n",
+				mode, clk_get_rate(cci->cci_clk));
+			return -EOPNOTSUPP;
+		}
 
 		val = hw->thigh << 16 | hw->tlow;
 		writel(val, cci->base + CCI_I2C_Mm_SCL_CTL(i));
@@ -266,6 +306,8 @@ static void cci_init(struct cci *cci)
 		val = hw->scl_stretch_en << 8 | hw->trdhld << 4 | hw->tsp;
 		writel(val, cci->base + CCI_I2C_Mm_MISC_CTL(i));
 	}
+
+	return 0;
 }
 
 static int cci_reset(struct cci *cci)
@@ -283,9 +325,7 @@ static int cci_reset(struct cci *cci)
 		return -ETIMEDOUT;
 	}
 
-	cci_init(cci);
-
-	return 0;
+	return cci_init(cci);
 }
 
 static int cci_run_queue(struct cci *cci, u8 master, u8 queue)
@@ -488,8 +528,7 @@ static int __maybe_unused cci_resume_runtime(struct device *dev)
 	if (ret)
 		return ret;
 
-	cci_init(cci);
-	return 0;
+	return cci_init(cci);
 }
 
 static const struct dev_pm_ops qcom_cci_pm = {
@@ -570,6 +609,11 @@ static int cci_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, -EINVAL, "not enough clocks in DT\n");
 	cci->nclocks = ret;
 
+	cci->cci_clk = devm_clk_get(dev, "cci");
+	if (IS_ERR(cci->cci_clk))
+		return dev_err_probe(dev, PTR_ERR(cci->cci_clk),
+				     "failed to get CCI clock\n");
+
 	ret = cci_enable_clocks(cci);
 	if (ret < 0)
 		return ret;
@@ -652,7 +696,7 @@ static const struct cci_data cci_v1_data = {
 		.max_write_len = 10,
 		.max_read_len = 12,
 	},
-	.params[I2C_MODE_STANDARD] = {
+	.params[CCI_CLK_RATE_19_2MHZ][I2C_MODE_STANDARD] = {
 		.thigh = 78,
 		.tlow = 114,
 		.tsu_sto = 28,
@@ -664,7 +708,7 @@ static const struct cci_data cci_v1_data = {
 		.trdhld = 6,
 		.tsp = 1
 	},
-	.params[I2C_MODE_FAST] = {
+	.params[CCI_CLK_RATE_19_2MHZ][I2C_MODE_FAST] = {
 		.thigh = 20,
 		.tlow = 28,
 		.tsu_sto = 21,
@@ -685,7 +729,7 @@ static const struct cci_data cci_v1_5_data = {
 		.max_write_len = 10,
 		.max_read_len = 12,
 	},
-	.params[I2C_MODE_STANDARD] = {
+	.params[CCI_CLK_RATE_19_2MHZ][I2C_MODE_STANDARD] = {
 		.thigh = 78,
 		.tlow = 114,
 		.tsu_sto = 28,
@@ -697,7 +741,7 @@ static const struct cci_data cci_v1_5_data = {
 		.trdhld = 6,
 		.tsp = 1
 	},
-	.params[I2C_MODE_FAST] = {
+	.params[CCI_CLK_RATE_19_2MHZ][I2C_MODE_FAST] = {
 		.thigh = 20,
 		.tlow = 28,
 		.tsu_sto = 21,
@@ -718,7 +762,7 @@ static const struct cci_data cci_v2_data = {
 		.max_write_len = 11,
 		.max_read_len = 12,
 	},
-	.params[I2C_MODE_STANDARD] = {
+	.params[CCI_CLK_RATE_37_5MHZ][I2C_MODE_STANDARD] = {
 		.thigh = 201,
 		.tlow = 174,
 		.tsu_sto = 204,
@@ -730,7 +774,7 @@ static const struct cci_data cci_v2_data = {
 		.trdhld = 6,
 		.tsp = 3
 	},
-	.params[I2C_MODE_FAST] = {
+	.params[CCI_CLK_RATE_37_5MHZ][I2C_MODE_FAST] = {
 		.thigh = 38,
 		.tlow = 56,
 		.tsu_sto = 40,
@@ -742,7 +786,7 @@ static const struct cci_data cci_v2_data = {
 		.trdhld = 6,
 		.tsp = 3
 	},
-	.params[I2C_MODE_FAST_PLUS] = {
+	.params[CCI_CLK_RATE_37_5MHZ][I2C_MODE_FAST_PLUS] = {
 		.thigh = 16,
 		.tlow = 22,
 		.tsu_sto = 17,

-- 
2.34.1

