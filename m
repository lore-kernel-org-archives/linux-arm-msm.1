Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794468033;
	b=DxiYA14mhtaxaPJE5EBU552mZ8ph21501reGL+0kvKHLL9k+R11YBPd9l6tPQU+gORqy
	 5DHxQpFUkQaLCYoQ2rmibdDUVZ146nDURQXFXlpAYrGDZB+FEPr9CZEGhVr/DsuuWUeli
	 BpFUbJsbzcveS1cZZGoHxV78qaGdEJuO6MrE0lJhzTPcoCOHwFaW9nzey9sNjIs2zv8cD
	 qGm1+cLxZyZHbTnPwdvx91y2N++RJrboKJBqX7CgoUvSduY7os29z9muGZDj3+m/Jap26
	 IruECJrKhxyYdPAtVxdOsJ1jq/GAQxTDkgfEyeOHMhEOLbZhfjEvmc3djsdGB7nY6SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794468033;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WADlB89QNmzwJxrRLEaHqXVtl5b6bAp/OWZbUebu8cs=;
	b=H+L7oQvfA3a5rCUCUgWNH0Jhdh5SAo7kutvYT2tKY0y7V8yYCjeKV2HvwprSJkdOHXya
	 Z8/KqcGs5KQEKKbfDB7GIxJnNmzmgYA2wKfgRv7HG2b/ElWNcqd8dlTaAlmlJognpkySU
	 2tqFOB8r4RADSAhT+4SWfmqTcyIWYo9ea6KgSzojh065Xfo9v7n2u6IWyOdevgvC3mn5v
	 ojBmwdRXPxLuXooI134CdBV1petSGuzQJ+8Cq092XxCrrCRytKI1K6UwTi+RTz8u1ixxn
	 +oVlj7BWGkKrbk3LKBC+g+mTFkJYO38LrW/dk2PHRUrgLNZMHU5nlWRpe9tP8CZblYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="cJoa/K2j";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kbZHbGgY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1F7606A8A3
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 07:20:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1D1F7606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cJoa/K2j;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kbZHbGgY
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC5ndCL441531
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 07:20:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WADlB89QNmz
	wJxrRLEaHqXVtl5b6bAp/OWZbUebu8cs=; b=cJoa/K2jnnGUSfJMD2NFxQQiO1c
	zUAJQu2Mevi4ubNyvBBzNDXvMLCTZ9qd14149NTa8Bqb3VTzwslM1A29q7Pi0qUV
	XVpnQXoBkmmZoeq1JD6gYPCaNyIpI25Uem+Lwpyzoe0H379S4qMRrLAwVq/lIAfa
	O55Y5s2gzug26ew3zz8LSBByguGAAR1rSgnQXhneMS7d46sgU2JzDLDun3QLtttU
	yEFRDvkSJR+9p0RbIlZddxAQLb2RIx1BW+jAo3RNdJsOMK473a6lBuwhjWJszb0p
	gT25kq6rqEkK7f+DmLkHBm5oAbsuuliNSN0WYvlh7LOgO543QAeQRQDn9QA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw7nc0a7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 07:20:32 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdb8957b072so218374a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 23:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794468032; x=1795072832; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WADlB89QNmzwJxrRLEaHqXVtl5b6bAp/OWZbUebu8cs=;
        b=kbZHbGgY8gHfXCL4PGpGD8quekRwQpAvinmYlovL8yZDoVgm+DtTMHWzA0YtbGJ7FX
         wOXknPPTnfj8yEOFM6KkgLlfL1OkY9AAFxEJJ8ovYrx2aDZxOGfDcWRYwGriwvpBRXRC
         1DYGw+fP/OhINWSHjjWg65N2vYExqinSbMWRM0cK7E7O83qZotuAvaviNRuyoCEmHN5D
         VD652bZWjgDzsOV0rOBqhohiy9k+C908PZJjhpHNCuOo9FR0XRs/dvr4KE8XrgsuFPXj
         LcZVvwYpRZy6CqdnvbhaP8NyG9Z1hKAvcVLAP5lgFaxVu38apPGWe/zkSb6z2ykMpeeL
         KSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794468032; x=1795072832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WADlB89QNmzwJxrRLEaHqXVtl5b6bAp/OWZbUebu8cs=;
        b=nZylP4hncxlqTjSaAj9EyWpqfdLVfGpoe0bjoQcf2K5SczaKTeT1/Be48ZJjLZ/WG6
         C8PS3JIZL56ZVSTsJe818mdO5m428kN4/+cauPqRQMssj+47AhYaYXxK5LZxzI0o1mKr
         phPjBHEyo7XowaCxX6b6a7WJqSgM70fcTNYZ3+FfoQSSRS801tLSrXltOOhNvzSwGQ3r
         bpKoLlYYis/WSJmcq0DXUj1QLbGHnKpYKFxvXkSYSOBUdSsUFdD827Xtz4GBB2kROv1L
         TH53DB+Kqm0JwHoiAEI35EMWTkyc0mJPiHFtoCSO+ddnPt0di+4kyh7wcAavtEGClN5l
         EyUA==
X-Forwarded-Encrypted: i=1; AL+hErFfQF675LjJGY6s+kH3pErIuiMhWtUmsM8X+wa6LZaCipnfnby63NMZXS1F0OqcK3NiM61/giWu9RWa2qXm@vger.kernel.org
X-Gm-Message-State: APuU4Z/bkvYSt6Dbrh50O4gxk17lfEyAEXyIleHnjTK1guLPZ/z9zoHu
	Psx16gYmrx0kUYEmAcNqpjrZgXMFcncyT859yXk3PFxJZ1W5EqUs4y6b2rpxm/W2K189Fzsk7wU
	pZy/IZmNa8VmLe4Srllrf+3dfU3nVVRfXN9ekQLQ3xRWV81AaKs5cT+w9mROPVsqx9STU
X-Gm-Gg: AYBFou0z2/PFC6plq2pz3bMPHkKko2GASdsmp9J2hfep11oWprA1LmsvK2tjuwNAUo2
	HBKWKkmhfTbSYwAilmMwIS5UsY91JimPq4tX4DP2a9Q1oCyo+oZewqCzXiKp32+ZOx+j7bCqR9h
	ud0XbWxTvmuuzN4eW+0pxtrnr5EXJrvykfSZP93+GUJneOIwcWVlxJ4qVz7BQXPmrbk4HoGaxVE
	itD1cuZHifow1k/bq28Y2uTqaJoPs1IJaHmzhTDvzY03KVMcjT9v0HVKvn4WU70My65VRd/gmRo
	Q+2HoP1VIAL3+jxH1Q2UY6Z9hdbQg+41BYUzdhOSjSfSIvj0h3J4iSfEb/QFAC2QLzMOpbgG33b
	k2M7FpoY/agT0VsmRQAXRyEcDh8JzsZ52RNCzXjrsyRcvpBSPM3swtdpA1+ubSqTjzjSLq7LTAV
	B11Q==
X-Received: by 2002:a17:90b:4c51:b0:3a6:e61f:749d with SMTP id 98e67ed59e1d1-3b182de7309mr7512734a91.1.1794468031597;
        Wed, 11 Nov 2026 23:20:31 -0800 (PST)
X-Received: by 2002:a17:90b:4c51:b0:3a6:e61f:749d with SMTP id 98e67ed59e1d1-3b182de7309mr7512696a91.1.1794468031117;
        Wed, 11 Nov 2026 23:20:31 -0800 (PST)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c73e27sm3149185a91.9.2026.11.11.23.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 23:20:30 -0800 (PST)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>,
        Shuai Zhang <shuai.zhang@oss.qualcomm.com>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: [PATCH v4 2/3] power: sequencing: qcom-wcn: support SW_CTRL wake IRQ
Date: Thu, 12 Nov 2026 15:20:08 +0800
Message-ID: <20261112072009.3815276-3-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112072009.3815276-1-linghui.wu@oss.qualcomm.com>
References: <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
 <20261112072009.3815276-1-linghui.wu@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: sSBa_re2XppM2OxtbueatbW77GAT0bmY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAyOSBTYWx0ZWRfX5OkkmitNXZqS
 PUWeoYyJtcy7/B94A5LbIF4MLpAdTOmoXK4eDC6lk1PEVD9DIcf6SB7KWiAQ8LC8Anw+Lt3MSGT
 FiITT5WC3i9e/DECm8UGxkgTzRXh4r8=
X-Proofpoint-GUID: sSBa_re2XppM2OxtbueatbW77GAT0bmY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAyOSBTYWx0ZWRfX/kgB8iyJfyP/
 tVG3UgoEAZUBMqXYVShP+SNnvjgl+yyLuzgxnV/CobBlwvQbOJ9r8AoK9xcteqkyWRODI8A2AaD
 JB05muOEif4AS4Avl2CMuF4BBuxd5uogvFnuNA8GB6L2Zx0YqkMtQ5/8CHWCLXKOOXzPVcnI4ip
 7BrMDfY4XObaBj/aSsRkc+Z6OYQN6ugqVfFB4WyTP26xV8h+GlaMyJOfsVU17bmPtK7uMw1UmtE
 D+Xug21+Fx0Fd3AvAYHn94nBZznuxOo44eaC9Xgw21P/OStzcwW27pn7xFdqgxPCGY6/EZDBqR1
 VpcGZ7s+320RAVl0QHVDHLk0mrcIUR7qM6TeJ/qbonmljzK0xMsl8HWjzZ8TfE9KTeycOeyJnBx
 JViMucxde1Vw8FFCgz0jeCIfWi4FMij/su4FHvH0dg5ieeMeSQw5e1K+XYhkT6n8qiflcW8fX8S
 083oDgAAm4qXo1ZD10A==
X-Authority-Analysis: v=2.4 cv=A8b5rKWG c=1 sm=1 tr=0 ts=6af568c0 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=d3QjpUUrb7QHECHc-BAA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120029

Some WCN3990-family devices use SW_CTRL to signal that resources need to
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
index e51b655add01..26b436df9b93 100644
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
 
 	ctx = devm_kzalloc_obj(dev, *ctx);
@@ -525,6 +534,33 @@ static int pwrseq_qcom_wcn_probe(struct platform_device *pdev)
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

