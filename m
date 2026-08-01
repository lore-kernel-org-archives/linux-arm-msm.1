Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3223CB8FD
	for <linux-arm-msm@vger.kernel.org>; Sat,  1 Aug 2026 20:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785615059; cv=none; b=nhWE/zIrKX1PBs2d5wrY1XCKDo2/Q7Tes420bj3gwSJQFExo5oevnjHjt5mCeFgqwdfr6BwtxMdUyOdYnWHb/E9jAQOEzy+LVbx7zBSZzCN5Ch3awmPpH4NCSn1DTiN8j+clPfH82B+48KVadlnGJNLHpc0XLbHM0kktIYdbKXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785615059; c=relaxed/simple;
	bh=wuSugMFw7du1ubNBPNbGxn5teYp92r0oIhUfiHjDrGE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DJcID+Uq/62KstfudZdeYxUG6lb7eV1sLg0NLHvn9rMgnpjEKgUBNdC681g+38LMg5dYq6Ss957SAsRwcOul3ZUOQ1inkFhUYtqZOFs+6K6wHBkUFcbQMRXhLPQACmhTO7UKwEMNZ5dpXa7STJEFUESNBYIYrbRPvgB0U75k6V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SIecqnx8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JqVe+qPw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SIecqnx8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JqVe+qPw"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 671J0Vkr4034468
	for <linux-arm-msm@vger.kernel.org>; Sat, 1 Aug 2026 20:10:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GDgHay8m77gRxkFUh/jBO+4KoNBLpLg4Twtd7EBouJg=; b=SIecqnx8OFicbM7O
	H+785y6Nxp+nbyPlF5OyahLynj3mReQz7YnxQ75sgA2PP4/7APPFMt8GlagrYUk/
	FzThOFSDvrxJX3dBc5QRlvVJ54Q86jBoO1jaHwtN8s0KIS+JvYs9Oqz/gtrsja7L
	hux5mWPnwcnVyVeCeqhLCS6Fmh6NL9Y2OFi7HozaYgd8hVty3aDMui1Z/lDGAW11
	ks9eemcWHPuAuNQx6IBsVhLpxr8bjvIyy1z6ZB++rDnQR7/yAjtki96DVOt5VUVX
	Xvfn+35cHbRv/rfDCA3g31k+Yr9K32Iu+CjhdTReucljDjMk3BB/XmscK39pX2yp
	xHut0g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8q51nm1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 20:10:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934956beec8so352312285a.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 01 Aug 2026 13:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785615056; x=1786219856; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GDgHay8m77gRxkFUh/jBO+4KoNBLpLg4Twtd7EBouJg=;
        b=JqVe+qPwKAB6/WtOmBziCBmiUyeM8n+ffN+GpTIKvIG+i7onSLjGb1/t/QNbq2l5/B
         wthvb7I9Dg4lxDJVP+LxTd7bRTyTjJMP5BKOwcOu7JZiCDbgty2aydUGt3NU4o9yYGb2
         iJI58vGEHyoqlOJ0ncPCEFVNqhm/oUpcOByHTnG49CSOCkTMgf2odhvvsujetveVpCvC
         vW5k9rkdfq/T4v2DCcK8OJ5Gw7Pa+SVSZho5t7HIvpDWbUNvJp63U2rVK5VfOeomSNs2
         uS7lCLDUylLF4uqKyeL0Jep5x8yANw/w4Y+3Ry2NkEIaZTd4fWPBsVC4GlTvFkNPw7/w
         vAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785615056; x=1786219856;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GDgHay8m77gRxkFUh/jBO+4KoNBLpLg4Twtd7EBouJg=;
        b=GMaYihXvtJyZ588gOO8lpBxuBxaOmgdCJzIBrme0utLoZBWphdKB5CihtmM1CR1084
         Ar46nRT3c6By8XV+yGBZrqJv03kPwvRrxq9hdGuNwuxNYJizbFBr1FBn7qFm1XbGVFVR
         3FGBK69UmyVUY06V0VO7CHsg8wsTESSG0lFZFtiy3nbdwPq74hFVTvJ3R9noqjuCTmcz
         GE2Aqhq+cj3gDJxAxhqQn7rTlEb/SFrQNQ5zc+9Zbt1J/5zVkr+42EYdMfWX2XxedQfo
         5cybSm09zjxbVR/D708LJDx6C/pg+XaDFtupXEH6Hj5S5nD87RpDtZEllCP8ACTiKTzz
         T7sg==
X-Forwarded-Encrypted: i=1; AHgh+RrgwnZsGmWZkNdI7jCqlLrReDANFp+UI4nKrGztpaj05euUbu0LtsNnTFlMfb8KxFDmqfSpGDO1PCyvSZxh@vger.kernel.org
X-Gm-Message-State: AOJu0YyqL6YZ7jfArBFbK3hP2GtLm3mFbPblezL+u7aBiQTb/84ZwRh6
	/zC/1mxi9ny/4RuliqHz78nQJKFyXBkkMToLFOil/IdrjLhIk8jmE24UKw8w2vIfxgNHvCbq/J+
	OUqF1emlUqB2hSbhX3+9AWBZOI6b7oeBBKnzIt5dOJ9K0dgYCiq4H9yzHa0anDJRZvtum
X-Gm-Gg: AR+sD12FYfu82N7gRiwAYqebPs4JdhJg+gCh4O1rwDR//SLIaBCTarK0uAmcP1LIjO2
	yPMNOtKH0PP0u59zyqDFqH102CjSt2Slremt39XVlEaGNeahA5vEjFNZhBrnIAQlCtyGp3tUBAW
	O5YwA6XbGUoIQogcIgfZ+qmJPASiQbygqJD0JclpwjVNOC5Xt9xJEBUly7NowdjsoFDp+B87MWc
	7rfJ93rxtHyXvl8gjOvfa9qioKV+240j8cI524NRaA7KpEY1693RR9YGLt2qoDO40UlwhksvAm6
	BORCHsnibNl2T1B+TZ+cPcELZ97TbsJhtlfPharqxBtKNNfUiOVcLNhcGzDD/81LjHhSKuV53J1
	E3MY0mlbbT/IarK9PHWOitO5F7EhiZoVeH0uZ1HtRbSC5FA4slF51yk2VZldAvB6Hi8U0XGZ/C4
	X7ZHvz+/gLtJ1k3kYRj4dbRjtThRM+v8s9g5PSUolhHE81Dd4pTSw7
X-Received: by 2002:a05:622a:4888:b0:51c:1d0c:605f with SMTP id d75a77b69052e-52b5674c191mr108668251cf.20.1785615056142;
        Sat, 01 Aug 2026 13:10:56 -0700 (PDT)
X-Received: by 2002:a05:622a:4888:b0:51c:1d0c:605f with SMTP id d75a77b69052e-52b5674c191mr108667811cf.20.1785615055764;
        Sat, 01 Aug 2026 13:10:55 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd4537755sm358499066b.54.2026.08.01.13.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Aug 2026 13:10:53 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sat, 01 Aug 2026 22:10:44 +0200
Subject: [PATCH v4 2/5] i2c: qcom-cci: Support per-mode CCI clock rates
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-cci-clk-fix-v4-2-e1d80da54e01@oss.qualcomm.com>
References: <20260801-cci-clk-fix-v4-0-e1d80da54e01@oss.qualcomm.com>
In-Reply-To: <20260801-cci-clk-fix-v4-0-e1d80da54e01@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, vladimir.zapolskiy@linaro.org,
        konradybcio@kernel.org, stephan.gerhold@linaro.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAxMDE2MiBTYWx0ZWRfX2I3D+SFigYSl
 DqxOK+qqpMznWFjfBEOi1S9O5DCSaS6Ej3TCAAyNPDF1wG32N0N5p04ZRTalWSUfSA0CnsWexEU
 rDDozqmPGNq5+PfKU4qU1DSdQdHTTPk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAxMDE2MiBTYWx0ZWRfX6MPkfl0bsriO
 3AByTsOxatyaRU2oB0ibcYKY25nU8ajdN207viIcwU1Txm/pdZe8SkLa2ubet2a6OiiPswsAbuX
 LERsGIpDEyDvUmbF8mtcOMpGdFWEdFLoo8RqNHzq7Kz1jfXZRjYXOpU2tK1K4z2hRoSOizscWGr
 OM9qKq1jj0cs6yCJzh2gIiV6xKQXgE0K2RPXngrQNgC4fxqeS9WhLP2C8H9DZPUvMEc2PyEXm0u
 hutSvOAa6q4gihZNpSU7g9mJFuy7n300NDJNgyKboA8fjQ44lBaU6plgk+bYl33XsJqYIKqmNa9
 vYol9L/GCb2cFiE9lLcxo+Mgxv/18AjObJ13tTRIV86I7ffcJbILt/d18munf9J3SS9qLmCmVNl
 JTQNCvBddov6iLLiwzpQBo6J4AXgiTtJ/Hr0CRigvzispxuink+4q5rvM99kvvBTZEojxhjzhlT
 ty6LFCP6SF58SxCcCfw==
X-Proofpoint-GUID: E4mrNFztArnvXkxCN-TdPb9zNAG_CQZH
X-Authority-Analysis: v=2.4 cv=IYC3n2qa c=1 sm=1 tr=0 ts=6a6e52d0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=SSN5QVRp6N_zrvNS6moA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: E4mrNFztArnvXkxCN-TdPb9zNAG_CQZH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-01_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608010162

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

