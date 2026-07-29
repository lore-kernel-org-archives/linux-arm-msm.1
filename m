Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D25548380A
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785327974; cv=none; b=R+Z9BRqE9/cu5Qz+6p6jiqagal6KdKRCzmZDzgCyPwUhqMzTkCZ9x45H7wRKt5hEzvHj4HuJuxM87OBjWYRVOi6h+CbfJWgo9EprIKLlP8XDbmAMZSmC+xByLuX4r+IPedzdVA/RMgNLQhvb+jEGsHDRXb2fUhNyMkPt/SOAptE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785327974; c=relaxed/simple;
	bh=Zx31oD6GyEJA3YzYQdmeNawsiH358wsX6n0LkcGPRAU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fZVDFcveOpxHJHOeq+kpo3acgn8Z8txyAz88a9uXj8E22avLmgTWHBBBKZfU+d9drS01HOGGY/XtI1676R0Mo1bjfJ8yoqPkAcVdh3OxV70SFQXKg+8yvnHZQOjG7ET2Q6nlLN+OTFcYseXhYAaclRCiEQpfZ9WDKKXGKg/TYUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SU1X/H9l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OdHMHhCs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SU1X/H9l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OdHMHhCs"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TBt2MH1767493
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:26:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xqkTVMHLircUUeJl/l9K4o8h53AJUq28KjUtzbWeErg=; b=SU1X/H9lkkUv7FVN
	qssDRvQgNXTd8UrbVEreCEqyb7aMHvC6/MDAlIZvwcwcC/rrq0drunc6cjm6OIXk
	Bcy4oxL+hvMu6OeEU7r9fB7515Zjg4gyl/gqwxf4AGs8SiPVhGziQCuSjH2tWEn9
	PPbIzfwUiLhdTjhXKYRp1Z57XlUMFGAIbvTsGSZOl3d2/8x/2wQFSaju0pmBsCMB
	ghzO8NHhMIBEvjMKr7dGgLCOKb2l8x8mxrHr9HZGRtidd3LWOdPuTI0vnjG698ly
	nvCfrl6ZZoFirEauDX0VSiNHoQ5kxi5KxKgsFPR4yxo3gzHTW23yav3w/OVePU0B
	anxd/Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqh2kg3vj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 12:26:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5283fa0656dso26042191cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 05:26:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785327970; x=1785932770; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xqkTVMHLircUUeJl/l9K4o8h53AJUq28KjUtzbWeErg=;
        b=OdHMHhCsDcJ0IaOrqtFdAXzBlFxrv+jFlFcmQ9CoqL/XtPJTljRISV1a662YmBL8oS
         LJMeau9dRwzJb3sw6xBgJV84tjjU+BlqfS3tyUtj5KOKS3C1WEEj2amN7j/vcYyFu1Ho
         +H9btTQvXr/eARolajTjbeg8hZPupNG7H0lJuKAA1x/WmOVA/rpOx57VJBNxHnTd+3TD
         +ld0bxiIlhGyp4je1fYqIryskDJljc7lKY+qhEoGkv7C8Tf+0w9NjCLVScrK2yKdje93
         KJJ0QuCuKMt9k9pCBAd2Hdcx2FtE6KFOzKvBcij9m1wpNBdVVFjwpEz2b12yJ/cXi4Tj
         W+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785327970; x=1785932770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xqkTVMHLircUUeJl/l9K4o8h53AJUq28KjUtzbWeErg=;
        b=cSu4hdQAadxJ6vHInZ7SjhKbzsxEgkOTemPmjL8zPUfXWuRYEinDYRHkqp+v2W4Ycd
         7ZKavDAvwxYs9PCjmQs3h2eL/IUC3UvqwOiKNBXzgSWqX8z8XbLsSZZS6REfmG4RYKSb
         zEPiO4AvQMQMHTiUDYB6ZA+aXluGZ6Io7fTWVXXrKg2/W9P0zMIOYK9G2gfLtudUtwdw
         OYgzyRxOinlJ39jJ/rpY/lhSVJUWZGXJk0tKTjEufDyE9czxSIzFaM9CaC8f1mwbdbc7
         T4GmYLGvyo3YQRc/IseU4X7kJvjDBWJg+KAPYi82mAiYnyGNDormibxrLaWmD0EiDytm
         4WVQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro33jYEtRPEOSBl64KHeKfDBp9jC6L5x+7+yOWe+SmMplbrteSOgpo0WJYUj90yWxw4UBOPZmvtLa7MjKrV@vger.kernel.org
X-Gm-Message-State: AOJu0YxHLlvGIN0avxVkosAtcIMzu7ndAGM5JLpCD4XJAJrtITK7vhQe
	/Yu0zaNsLICCopUbYyRk0Zts7DJbCoWTWpgrn0hI3HJIWyLYTPd81X+UdwFJCYvOXfKAQONJcuL
	Z/1qhg8txvohU/sWuhWaSdcv1zxj3Cy/cdLD0aaYrenJehrjC1i41BqJhJPqNmSqctfWw
X-Gm-Gg: AR+sD12EFuDu9Vz4tMWJCFFhgJDC0nLROqQAiBg1bC38N6wnu0Ti4luHVX854HGymkq
	a9cq3XBN8OFCEupZuTC0732gAXekJwNptonPjb4rbvF2GEddi1PSkgCY+wHQajnPqj5m6ilqgEd
	/aFHsPX+xgZOMoGd2NnFTUIYTXynrgCmH6Y+Ubj2qtRr6f6AJ4l4Ihhnk68Vg/vyqr6yrZYJkOo
	jRleJHrUXvxxqpPd2GToQsnklvgB170YEs5V8ltfrBK6h8qwMHWoBamv1Sa5iUA5fjgaQOjF/bd
	3nUyu5VT/ppz2gyLzAHS/S+0WBTpiJEDlrhlBo5ntp3MvlBFJDy7+EMk7M+iMH0SQrlwbtWQ+5A
	Y+pRgL+TA+PZMEE/gLkoTeyKTapQy7rB4S5GHwytf9KDWu7J3eat6gEzW6Ja1NyRFC1+8y402mf
	tSwQXlOyu+cijOGNhkWPp+/LFEyuqCnoTJ1nLUEaieKp2+fOPc4HCa
X-Received: by 2002:a05:622a:134d:b0:50e:474a:47e1 with SMTP id d75a77b69052e-52b2ad2bf4dmr15754371cf.10.1785327970158;
        Wed, 29 Jul 2026 05:26:10 -0700 (PDT)
X-Received: by 2002:a05:622a:134d:b0:50e:474a:47e1 with SMTP id d75a77b69052e-52b2ad2bf4dmr15754061cf.10.1785327969686;
        Wed, 29 Jul 2026 05:26:09 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a050c5cf0bsm756343a12.23.2026.07.29.05.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 05:26:08 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 14:25:56 +0200
Subject: [PATCH v3 2/5] i2c: qcom-cci: Support per-mode CCI clock rates
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-cci-clk-fix-v3-2-f3c731d1596e@oss.qualcomm.com>
References: <20260729-cci-clk-fix-v3-0-f3c731d1596e@oss.qualcomm.com>
In-Reply-To: <20260729-cci-clk-fix-v3-0-f3c731d1596e@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, vladimir.zapolskiy@linaro.org,
        konradybcio@kernel.org, stephan.gerhold@linaro.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwMiBTYWx0ZWRfX9lORNHazWv5O
 XLlCK6DR7xsl1GEoChN/M2wvCFF40vVnBmM52MGAUy8fNrGPeNhb3pNh/1XhH5cSy5s7i2Aa7wu
 bFVb7Zpq0X7QWGZhJs/Ko2rmXGCROcBEpeVkE4SQ/O0/Rf8GMwEhDjHe9VP+krSY2jg68OyPs9r
 fmao0mOJm2S7zw7IsAe17nSTUreIUrUiwbA01xJI2bV8cSCYraVMpFdtwrt5gXCZNNZOvSfgpYF
 C3X3BBG4EIzeVxWdn7hGnv6i+zMtke1g/b5N1cZflxAgXyUvD1W3tsVQ+vGKr7hEL4qOApFFnoU
 hCHlPun8MqbJk+7ba/MXaZjW+vT8xQrAfJ98MpBO7pRk43GvsHeklILIbkO483VSQant37HxKMU
 UA7oRhMdymAM++z4e8WHmcpWD0s43baBvd0l0VI+BwhCu3F3nmmGXZyh8pjHkX3ruulgRZOBKNA
 0vD+AbsRgKwaAQdQglQ==
X-Proofpoint-GUID: 9t8lLZ2NVD37xRsHDdTaKxrS2mxfKbwN
X-Authority-Analysis: v=2.4 cv=Q4biJY2a c=1 sm=1 tr=0 ts=6a69f162 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=vNI37wWFbY7V_e8DPPQA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwMiBTYWx0ZWRfX4al24vEGVi8s
 wiSlX+Im1s06VFQ4e4vTlrW3jJtV3O5TSiH93VMVdDF7lnhVmd1wcv3/IZVa4X1zFwhOXet1jHG
 wsetAbHjf9vyVncVKoyvJVLV4XaUqDI=
X-Proofpoint-ORIG-GUID: 9t8lLZ2NVD37xRsHDdTaKxrS2mxfKbwN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290102

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
Tested-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-cci.c | 74 +++++++++++++++++++++++++++++++--------
 1 file changed, 59 insertions(+), 15 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
index 23cef922351ce44d71f1691cd7e4aab274fdd196..6fc2327db44acf016d008d0e268099494572774b 100644
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
 
 static int __maybe_unused cci_suspend(struct device *dev)
@@ -586,6 +625,11 @@ static int cci_probe(struct platform_device *pdev)
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
@@ -668,7 +712,7 @@ static const struct cci_data cci_v1_data = {
 		.max_write_len = 10,
 		.max_read_len = 12,
 	},
-	.params[I2C_MODE_STANDARD] = {
+	.params[CCI_CLK_RATE_19_2MHZ][I2C_MODE_STANDARD] = {
 		.thigh = 78,
 		.tlow = 114,
 		.tsu_sto = 28,
@@ -680,7 +724,7 @@ static const struct cci_data cci_v1_data = {
 		.trdhld = 6,
 		.tsp = 1
 	},
-	.params[I2C_MODE_FAST] = {
+	.params[CCI_CLK_RATE_19_2MHZ][I2C_MODE_FAST] = {
 		.thigh = 20,
 		.tlow = 28,
 		.tsu_sto = 21,
@@ -701,7 +745,7 @@ static const struct cci_data cci_v1_5_data = {
 		.max_write_len = 10,
 		.max_read_len = 12,
 	},
-	.params[I2C_MODE_STANDARD] = {
+	.params[CCI_CLK_RATE_19_2MHZ][I2C_MODE_STANDARD] = {
 		.thigh = 78,
 		.tlow = 114,
 		.tsu_sto = 28,
@@ -713,7 +757,7 @@ static const struct cci_data cci_v1_5_data = {
 		.trdhld = 6,
 		.tsp = 1
 	},
-	.params[I2C_MODE_FAST] = {
+	.params[CCI_CLK_RATE_19_2MHZ][I2C_MODE_FAST] = {
 		.thigh = 20,
 		.tlow = 28,
 		.tsu_sto = 21,
@@ -734,7 +778,7 @@ static const struct cci_data cci_v2_data = {
 		.max_write_len = 11,
 		.max_read_len = 12,
 	},
-	.params[I2C_MODE_STANDARD] = {
+	.params[CCI_CLK_RATE_37_5MHZ][I2C_MODE_STANDARD] = {
 		.thigh = 201,
 		.tlow = 174,
 		.tsu_sto = 204,
@@ -746,7 +790,7 @@ static const struct cci_data cci_v2_data = {
 		.trdhld = 6,
 		.tsp = 3
 	},
-	.params[I2C_MODE_FAST] = {
+	.params[CCI_CLK_RATE_37_5MHZ][I2C_MODE_FAST] = {
 		.thigh = 38,
 		.tlow = 56,
 		.tsu_sto = 40,
@@ -758,7 +802,7 @@ static const struct cci_data cci_v2_data = {
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

