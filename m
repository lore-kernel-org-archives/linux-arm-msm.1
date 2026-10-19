Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069EF4B2049
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792402774; cv=none; b=FnXWF/yH+qnRTXTbV8o0lI+4A/JT5Qzn3IuQX9b72NEfyiBfrVv+5FKBBVaqSVmTrfMffPdLkm8XBooHafvPp4/DABltMGBptyhtshNl53mRgL6tYAbmz6Kx1T3iDwnj87eag/2RU7s28yX2irEJu0vt0RNclisUPGKHm2KEfN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792402774; c=relaxed/simple;
	bh=DOxW57gGNe3KIgyfoStMcEagGHr/l7F1qoTzjRQFJ+o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AmUjKrx71ZTUxArDsmmxryQiuMk28CBQUgc93GIGC8LQREi0XZ5n2STJFDZuJ3Xl88prx3g961baL55FroCZIwaCnoK/Tez7mLC7rVie12z6nel+vWI1VHxMWVWqHX8o7hUoeW9AKe99pWyBFtP5S4zck4DYG4koFmQ3rLGX9T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B8bUtb8y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S3mIBztx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B8bUtb8y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S3mIBztx"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P7ZM1896617
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:39:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZVc5yK4aj2x
	++CU5m24PZHvPUSDXx2MOqUQkc7ptteQ=; b=B8bUtb8yOcXT4Rvr+GX1h00uv1J
	raA0AL6ql+gYYdcMea5sXpLT5RF4NFguA6Jqbp53jbkp8D3XZGyivL0O4lb/TPMQ
	wkx0sgeuocJChwq8+R/hDXicvG1vW4BK78WsFBC1rOI5fX4pcpc+1rGsipLS5DtN
	gZjvKEApw8U4z/CAXgYPEaXw6AHhNunbFJQl0mrQJL3VS2JH2HS6Ea11TB7gdoSa
	SGGoWGqVK3pTsfjY/KxJ4wjlyJZjEdEKpOHAkrowlwmEXsBQ7aA/3VcRFnSXs0DD
	lTs3PbWgsDtiYT88LhnsOZiuYgqAXQ/kH6TqiY2KezLYJ2OckQuekgGoQXA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdbvr97tv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:39:31 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac765fe43eso671097a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 02:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792402771; x=1793007571; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZVc5yK4aj2x++CU5m24PZHvPUSDXx2MOqUQkc7ptteQ=;
        b=S3mIBztx1nG3qpLNFjaYfXtYZeNs+pRGFaM4pcLFpfji2ANc716ZyVDPtEj/eOV0D9
         qBEk/biQDAZMPUazo+fl6NQOJdXNgRdKcJ8kK+IxRLW0VHLFKHu/QKjD8pPmr0qv2gLi
         t1BPTkAlKlwj7aaUUVptSov9CMCYKgZ0isvrvAobvC6KVbROTR5KziiVcR/EEv8PapeZ
         mj5FzmDWHLxWRG2Jk9wjE1ErdVo65cNDQbpIqsMAZ/HAacUIaynuFAfptPwxCXMjgp9W
         tdO8KpNa8HDSAiWVc9axHKPDDMbV67LjxxniBieaFX/IRXH/ZD8mn8m68u7BAKs+kYjJ
         Wjsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792402771; x=1793007571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZVc5yK4aj2x++CU5m24PZHvPUSDXx2MOqUQkc7ptteQ=;
        b=XayEebkYpTH8CasSafw7vC2hEEhD1gTD54kznts9o96f7YaJ0q4kDYAHlqV2OfQ9LW
         +GD998UGgFJ+yyJUBcstGY2Pic+tKpXPGBg+cgQVOnzAxb5lPiMrBiyvURSTS6fuFtMo
         wBtrjj6Kk6+18N7O7wDaf6YqeoSjh5LdpAFWeqDOI2gsHBlxOcjAWUrdAWvh+zzdaTr0
         qn/A+t8XmJAqnN7m3Bdx3+47KmX/d3DtPVw1xuO56TivIU+K0J4M0g45KX1zENexj2c/
         +66E42uq34lyUE1fBdY75VfZraVJGjvCiOtA71JlGDfepx3EhnJv7MJfF+UlhojSDatX
         C56Q==
X-Forwarded-Encrypted: i=1; AKwUvBxjTzx2xsRY8aFj5yn+883hbdhlL9yyaqHz2KYvaNrP012Nmm1OQlMY0c70Uzscf4UkvVnsTZTASHe8qCHy@vger.kernel.org
X-Gm-Message-State: AFq9FYKwsO0twySpy4BKUC7A5dy2g44hOhGBONZi9KTSM9FS4x8iDlcO
	7MskmxdT72LIj1w4jK3xY0rfji80A1/+14+RENvS1hxHEdIttHhI0tnAdXnhOcmV3M/7vvYcntV
	3qFfS/h3seYmkiJoeMOwF0PMBzq6jerEQSNfB5lUfyisbk3IjtJwR73kCulOJibFawyEh
X-Gm-Gg: AYBFou2MpTraIuiQbBYIowPyIKdR3Qz5bQ2w4NFcJIy/kdT42uAHt75qIE8xbCXUG1U
	kaVsSltVUQ2WVG/uW08SmRkOk7laFXdIkHHrsIB2e2eALOpp8h3oNN0IJH0VnuOsPr5m3pyheFO
	XzKxp57dvM+4+gK97g4VtBShnDbjtoNzzat9oi/e/OCvdC8OjrEdKhPRymyz8ELOjEn0zjbbKRh
	P19cY+OK7xZsaD0uabofvQBiE7Sa9TsouvXdOgoTJ36MzpOw9TDdGP1cTB+OuNuYtZeuBdgjnY2
	1QM5yAgbjM36zFFbCpp0dgAbH9qMgEk4i8ANed1lv5sN0pBEqoy+UE1WtDLou75eH31yhycgQeU
	cFcw6FERFyMo05iPa9F+zdw8Rp1Es
X-Received: by 2002:a17:90b:39ad:b0:3a6:e61f:749d with SMTP id 98e67ed59e1d1-3acee27aa63mr9790901a91.1.1792402770996;
        Mon, 19 Oct 2026 02:39:30 -0700 (PDT)
X-Received: by 2002:a17:90b:39ad:b0:3a6:e61f:749d with SMTP id 98e67ed59e1d1-3acee27aa63mr9790880a91.1.1792402770468;
        Mon, 19 Oct 2026 02:39:30 -0700 (PDT)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac94627250sm19758688a91.8.2026.10.19.02.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:39:30 -0700 (PDT)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: [PATCH v3 2/3] power: sequencing: qcom-wcn: support SW_CTRL wake
Date: Mon, 19 Oct 2026 17:39:10 +0800
Message-ID: <20261019093911.3199891-3-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
References: <20261014121910.1509541-1-linghui.wu@oss.qualcomm.com>
 <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzOCBTYWx0ZWRfXzKtNZl1MAHPX
 6TiRUynjDJKkm5es8VY3xbRlPlQ3qNdGMWxGc1FG5W/1RbJn/JN6oHzNF/sD6FD+b3YyyvIHMza
 Gb8xLhpvhXHuatktpYbJvzAgIYNHNxC/yNK+kIeCiBZTN/niKd3Vfo9+aaiNNGmjmiiDAu902Av
 6T+H9Nxb76EV8+Te41hQamBuiWMZAMpNDBjs0fTHwfVfA6ncMVacNJJOLKY8u+ZaRorlSKDK3UU
 BBJNQkrXewh03Q5UR2IdRk6PcuZR73dWoVcaiXAvahayISA+Azph/Y89n4t6/FmserGGs2XoFxl
 Smu201aaZ1y+lBr5EpDFrwU9CknQ0+C+XSwfAi3fEHiTbLBnpnVa5ry+itzWHmhoGrxU4xkYiLv
 jhvN7km0HMOlgtFNSJJ1u4kzcQwm5oeBwZhyDB2wUWvItem5P76ghAp19KuYIWodrlsX4VoCgo4
 rXWoWzwZQe0WPKEOL6g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzOCBTYWx0ZWRfX/e74QNgj+wy0
 /MW0+ZZIIzrktYdM4YUcu+wSltnjzgbdprH3VZCTdeoOIjTM4HUDBInm7ue1BHQNmZyyZCvbQDF
 p9BUEXNMrVckZJBAMuzWCdINqPhiKoI=
X-Proofpoint-GUID: w3abOf1b6m13xPAJKHnC71ZF-soqnunN
X-Authority-Analysis: v=2.4 cv=K/+3jCWI c=1 sm=1 tr=0 ts=6ad5e553 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=d3QjpUUrb7QHECHc-BAA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: w3abOf1b6m13xPAJKHnC71ZF-soqnunN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190038

Some WCN3990-family devices use SW_CTRL to signal that resources need
remain available while the application processor is suspended.

When the PMU is marked as a wakeup source, request the existing SW_CTRL
GPIO as an input, map it to an IRQ and register it as a dedicated wake
IRQ. The PM core then keeps the IRQ disabled during normal operation and
arms it for system suspend.

Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-qcom-wcn.c | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/power/sequencing/pwrseq-qcom-wcn.c b/drivers/power/sequencing/pwrseq-qcom-wcn.c
index 636dd7e63891..69b7eb565996 100644
--- a/drivers/power/sequencing/pwrseq-qcom-wcn.c
+++ b/drivers/power/sequencing/pwrseq-qcom-wcn.c
@@ -11,6 +11,8 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_wakeirq.h>
+#include <linux/pm_wakeup.h>
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <linux/pwrseq/provider.h>
@@ -484,11 +486,18 @@ static int pwrseq_qcom_wcn3990_match(struct pwrseq_device *pwrseq,
 	return pwrseq_qcom_wcn_match_regulator(pwrseq, dev, "vdd-1.8-xo-supply");
 }
 
+static void pwrseq_qcom_wcn_clear_wake_irq(void *data)
+{
+	dev_pm_clear_wake_irq(data);
+}
+
 static int pwrseq_qcom_wcn_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct pwrseq_qcom_wcn_ctx *ctx;
+	struct gpio_desc *swctrl_gpio;
 	struct pwrseq_config config;
+	int wake_irq;
 	int i, ret;
 
 	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
@@ -526,6 +535,33 @@ static int pwrseq_qcom_wcn_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ctx->bt_gpio),
 				     "Failed to get the Bluetooth enable GPIO\n");
 
+	if (device_property_read_bool(dev, "wakeup-source")) {
+		swctrl_gpio = devm_gpiod_get(dev, "swctrl", GPIOD_IN);
+		if (IS_ERR(swctrl_gpio))
+			return dev_err_probe(dev, PTR_ERR(swctrl_gpio),
+					     "Failed to get the SW_CTRL GPIO\n");
+
+		wake_irq = gpiod_to_irq(swctrl_gpio);
+		if (wake_irq < 0)
+			return dev_err_probe(dev, wake_irq,
+					     "Failed to get the SW_CTRL wake IRQ\n");
+
+		ret = devm_device_init_wakeup(dev);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to enable wakeup\n");
+
+		ret = dev_pm_set_dedicated_wake_irq(dev, wake_irq);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to set the SW_CTRL wake IRQ\n");
+
+		ret = devm_add_action_or_reset(dev,
+					       pwrseq_qcom_wcn_clear_wake_irq, dev);
+		if (ret)
+			return ret;
+	}
+
 	ctx->wlan_gpio = devm_gpiod_get_optional(dev, "wlan-enable",
 						 GPIOD_OUT_LOW);
 	if (IS_ERR(ctx->wlan_gpio))
-- 
2.43.0
