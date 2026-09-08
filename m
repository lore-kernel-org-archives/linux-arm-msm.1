Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4858A556BBA
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 15:29:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788881368; cv=none; b=XN/dCCxLrNqfkgTasF4Cbnw5jeT9D0p6mt/QD8fTBJdlZnb/rb9L/g/t1CBjZPPhBSIaFQ7+OSBVv+HZwq+saJedQdzqVMDA+pws/OE9JNhlctrb34SU35rdf7sSsrNvIUD3lDk76rlh7zowQ6nu9zjUfkWL2b3lDWlansInN5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788881368; c=relaxed/simple;
	bh=yr7zxykqaTEaqzdPRUQ5MNYO5+hsegnlEgHIOVDefkE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U9A/HIb7PNYNvK5O/keHA0mMt2DiQfkw8zsLd7nHXhdSBM6+uveUEfZe93gC8JHsjov114av8R9OhtU420tdGNhkjoQ9ho6NjEJEn0hcZF0bqyO1OfhvqiBOb9FQwJZlWuQpwrYB5bpqZxKc65258Vq7tcrrguCTY0D/UJPqOx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TaBj/npQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xoa6eIIG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TaBj/npQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xoa6eIIG"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688FOZwa2703994
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 15:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lRt8wHoXcNopaXjD+865R32+7CTYvwmYmsu8jeufAWE=; b=TaBj/npQq79CGR2t
	tmlokXHfSNPQDQM4VHilbhWH5DL+BJ3Wovl157JWOtF95T4k4249IIYZtIFG1UyX
	TQrSYSrayAFYNqGll6Kug5pzq/xiNIec5h7yJEqNEuWIe1acBpKyfMnOo2LfAOn4
	HmVoYympceVmwrBZvb1FEk9WOk69rCX28yLKbcu846qk4VSyOTkX91RIaNzI+ewe
	4haQ5/CoIcIY3+mTfahGq3wRfm2gbwI8LzyCg/LSgSqr7npKRznq34UHGlfqStgq
	lbvT9YObMM+YZhu/IUS+v/2yYnJdXPXPWH85UhSk2NBvcLpQ/80qSPgTmO+WMuGj
	0RG6eQ==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjatjjudf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 15:29:14 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97cc09260a3so4251307241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 08:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788881353; x=1789486153; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lRt8wHoXcNopaXjD+865R32+7CTYvwmYmsu8jeufAWE=;
        b=Xoa6eIIGg4l9r924fJwLj1igq/tHS6JRBaaD8EpYziSfrKy97hsTxtFP/ZuxTbDmYe
         JnrEm3b4KEQ+PLUmlv0k7OngeviHyMeXlEPn61rz6D2pxQNnKUrTCNhDr2tvXq5DuQIt
         pb6JFYW+ZlPZcUFFpvRTVNNx+PvSpCb+TX5ee1OvM4Ha5cVq7Napb4/P0cOl41raqP78
         xG+AyE8S3q57wFqAsQW4o42Oco3VNlP4N3PwMnVG5hj9CfCf/PQW8MulRaHEhfIGkkyp
         1AFFCBENXCEHHX5EExPlQKFQ+OTqVcFngmcuh0UvU1iz1/0bLHWRNkW5dfpQDnJ4JjBt
         2iQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788881353; x=1789486153;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lRt8wHoXcNopaXjD+865R32+7CTYvwmYmsu8jeufAWE=;
        b=VAyL1nVzjbYEWzqwaCWxro07SgWCGVbB+dOdC21a/5RbD73LqeNc46KAGa7B19UVkk
         au/vBN+wjsCu5kOiOwYzUNqHHMb2RtPVRU0PogM9rp/GJex3XaQDM4h8EDvA1caJYly7
         HhsrSvrBSfFx8aQNVP4PXH6/ifjPc64MSBmmaA++brwX/yNoVV/lLS58Ek7R47M4gUpm
         cL6RZFk/t0jbOC1bRld9hs3tXQQhOjV4EEidTZXblFIdc9rYgLmOoLiPMpjp/KUMdwsl
         CX2aiC4LeYNKxk6O9M1NEjjJ7FdP3A8P8I/rBg+KCFLRCnkNrgttfNAn5Zra3S3jBe01
         r+Ig==
X-Forwarded-Encrypted: i=1; AKwUvByc/RG6ePoJ81LvQnzMKUqQVvUHs7QW1bgGXzln1TTOxrfqmgS0XWYRh82KirFxGrnsRZT9z7C4b9RhVvST@vger.kernel.org
X-Gm-Message-State: AFuF++nvlhckCnU91mWNLvlQGiZqsg1ZZg0Wlwci/SLmmPevX1U/2AKn
	bqgzOjT8MH9f76UNH4TAj9dBdYc8s++GvzZl9KDWu+jUO+urBtJwhWoeXmIKJy8oTkAOPLPCAXn
	H3WUeWQnAGYfe3MWpHyF/LfwZg9DXnnO8musRWM5cHHnYoe6XufOtePNO9yCarWCGsDZU
X-Gm-Gg: AYBFou37RPOYful+QzlHRMYmaCRbxz/Hevgq4qxkMPQktFi60IHkPd2ZnRON6oyrtTy
	5Vv2x8U1eErniwoyBLiBq+u1jSeYFs54GhL8bypk25jRFcObSvQZtU6odJGlHwVOL2NmF3dF9Zq
	WkTPfwXMuOcyIniwaqhe/MQGBpsQy+0QzJLZTaJMQ4jPHVYo7VzzCXvfXlRAg8d5kN9g2J9nRPY
	PumgnSPsvAUkhLb/JWvaDpnPKpzbHWukUjdRUmIdN8zCatsFMUKf/xt9D5vhpdlLA1YZHMiPvgu
	Jb9NJHsCoLPIxDJnHOpYwuawgD32w+wHo7iWX7KTyb5GgHc1kVkv2OFjsD7WOcOs1XexwQQCTr1
	CWxk6qDJRk9FTzA==
X-Received: by 2002:a67:f2d6:0:b0:78a:6488:b1e1 with SMTP id ada2fe7eead31-78a6488b3a8mr4358797137.12.1788881353129;
        Tue, 08 Sep 2026 08:29:13 -0700 (PDT)
X-Received: by 2002:a67:f2d6:0:b0:78a:6488:b1e1 with SMTP id ada2fe7eead31-78a6488b3a8mr4358758137.12.1788881352550;
        Tue, 08 Sep 2026 08:29:12 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee7febb4sm525231635e9.14.2026.09.08.08.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 08:29:11 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 17:28:37 +0200
Subject: [PATCH v4 4/5] PCI/pwrctrl: tc9563: Switch per-port reset to GPIO
 descriptor API
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-pci-tc9563-aux-v4-4-c7fc7778292b@oss.qualcomm.com>
References: <20260908-pci-tc9563-aux-v4-0-c7fc7778292b@oss.qualcomm.com>
In-Reply-To: <20260908-pci-tc9563-aux-v4-0-c7fc7778292b@oss.qualcomm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Walle <mwalle@kernel.org>
Cc: Alex Elder <elder@riscstar.com>, Daniel Thompson <daniel@riscstar.com>,
        Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2NyBTYWx0ZWRfXyOP5GME/2bfY
 Nw8gJCtpPxHLcD4NZGTM5aV2vU6DrF0GZEQ9q0JXNT48Zt1dkT+JUCTaSfII8s2xsppEdYJrK2W
 Q6e1zz0l+cR898sXlbWoj4Q9gOqVipo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2NyBTYWx0ZWRfXx30dOceEaRLQ
 1G0MyM7/QLfDwxiE7qFPGNKt8ARg6PPbytfqaNA9ob/6Zqcf4+Gff6/XOweZJ2hA1ZeJFxySlw4
 rXB2hCLYUvDaPItG57gj9jxxL+yb1dfqwCA4DhCuTuDKlYMqX1hOuDq4efJbjIgE/LU4HXnGmVe
 BeTWzcDrgQhjXZeKJ6VRK0dceD4XAgUitK8th+VL9ZvA4/dtRB738OXwt0abLgC12Cxtq6LQwzy
 Vl23jOr53H9rTJlYdxnIdEFFm+xO4Ry8CoJF/aE6Hl2UbG70ISzXzVlrjIWwBthqi7exDQ1Smmq
 za+bkC8T74lmJ8c1U0jpH0JCe8Ff0bBRmQr7qhNNed2YK0tVbXtapRoBwN5m+Qhzy/+g2Ohss2P
 6654mzFHtJZ6ugXyaF0RxpLCLV/dqQJvvFrWnDEv7M9e/2nP2gSGlnHRZvUk6UUhvDImmMWTv1Z
 4FtD4URPrHiLqCxqi0Q==
X-Proofpoint-ORIG-GUID: 2Cq7A_5rOkMmy9FhKNwQ4fLw9JbqVy-X
X-Authority-Analysis: v=2.4 cv=QrduG1yd c=1 sm=1 tr=0 ts=6aa029ca cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ee_2aqc6AAAA:8 a=Vto0WN7G90g_gJJAuHcA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=VOpmJXOdbJOWo2YY3GeN:22
X-Proofpoint-GUID: 2Cq7A_5rOkMmy9FhKNwQ4fLw9JbqVy-X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080167

Remove the local TC9563_GPIO_MASK and TC9563_GPIO_DEASSERT_BITS
definitions, which are no longer used after switching to the GPIO
descriptor API. Move TC9563_GPIO_CONFIG and TC9563_RESET_GPIO
definitions in tc9563.h header file.

Replace the direct regmap-based per-port reset logic in
assert_deassert_reset() with gpiod_direction_output() calls, falling
back to the legacy regmap approach only when no reset-gpios DT
property is present for a given port.

Add the reset GPIO pointer to struct tc9563_pwrctrl_cfg and introduce
tc9563_pwrctrl_parse_reset_line() to look up reset-gpios from each
PCI downstream port child node. The lookup is done lazily at the
beginning of power_on(), returning -EPROBE_DEFER until the GPIO chip
is registered.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c | 85 ++++++++++++++++++++++++++------
 include/linux/soc/qcom/tc9563.h          |  3 ++
 2 files changed, 73 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
index 3fb862105fa5..59bc0d77d3c4 100644
--- a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
+++ b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
@@ -26,9 +26,6 @@
 
 #include "../pci.h"
 
-#define TC9563_GPIO_CONFIG		0x801208
-#define TC9563_RESET_GPIO		0x801210
-
 #define TC9563_PORT_L0S_DELAY		0x82496c
 #define TC9563_PORT_L1_DELAY		0x824970
 
@@ -60,9 +57,6 @@
 #define TC9563_POWER_CONTROL		0x82b09c
 #define TC9563_POWER_CONTROL_OVREN	0x82b2c8
 
-#define TC9563_GPIO_MASK		0xfffffff3
-#define TC9563_GPIO_DEASSERT_BITS	0xc  /* Clear to deassert GPIO */
-
 #define TC9563_TX_MARGIN_MIN_UA		400000
 
 /*
@@ -88,6 +82,7 @@ struct tc9563_pwrctrl_cfg {
 	u8 nfts[2]; /* GEN1 & GEN2 */
 	bool disable_dfe;
 	bool disable_port;
+	struct gpio_desc *reset;
 };
 
 #define TC9563_PWRCTL_MAX_SUPPLY	6
@@ -354,16 +349,40 @@ static int tc9563_pwrctrl_set_nfts(struct tc9563_pwrctrl *tc9563,
 static int tc9563_pwrctrl_assert_deassert_reset(struct tc9563_pwrctrl *tc9563,
 						bool deassert)
 {
-	int ret, val;
-
-	ret = regmap_write(tc9563->regmap, TC9563_GPIO_CONFIG,
-			   TC9563_GPIO_MASK);
-	if (ret)
-		return ret;
-
-	val = deassert ? TC9563_GPIO_DEASSERT_BITS : 0;
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(tc9563->cfg); i++) {
+		int err;
+
+		if (tc9563->cfg[i].reset) {
+			err = gpiod_direction_output(tc9563->cfg[i].reset,
+						     !deassert);
+			if (err)
+				return err;
+		} else {
+			/* Fallback: legacy DTS without reset-gpios */
+			switch (i) {
+			case TC9563_DSP1:
+			case TC9563_DSP2:
+				err = regmap_clear_bits(tc9563->regmap,
+							TC9563_GPIO_CONFIG,
+							BIT(i + 1));
+				if (err)
+					return err;
+
+				err = regmap_assign_bits(tc9563->regmap,
+							 TC9563_RESET_GPIO,
+							 BIT(i + 1), deassert);
+				if (err)
+					return err;
+				break;
+			default:
+				break;
+			}
+		}
+	}
 
-	return regmap_write(tc9563->regmap, TC9563_RESET_GPIO, val);
+	return 0;
 }
 
 static int tc9563_pwrctrl_parse_device_dt(struct device_node *node,
@@ -398,6 +417,38 @@ static int tc9563_pwrctrl_parse_device_dt(struct device_node *node,
 	return 0;
 }
 
+static int tc9563_pwrctrl_parse_reset_line(struct tc9563_pwrctrl *tc9563)
+{
+	enum tc9563_pwrctrl_ports port = TC9563_USP;
+	struct device *dev = tc9563->pwrctrl.dev;
+	struct device_node *node = dev->of_node;
+
+	for_each_child_of_node_scoped(node, child) {
+		struct tc9563_pwrctrl_cfg *cfg;
+
+		if (++port >= TC9563_MAX)
+			break;
+
+		cfg = &tc9563->cfg[port];
+		if (cfg->reset) /* Already discovered */
+			continue;
+
+		cfg->reset = devm_fwnode_gpiod_get(dev, of_fwnode_handle(child),
+						   "reset", GPIOD_ASIS,
+						   NULL);
+		if (IS_ERR(cfg->reset)) {
+			int err = PTR_ERR(cfg->reset);
+
+			cfg->reset = NULL;
+			if (err != -ENOENT)
+				return dev_err_probe(dev, err,
+						     "failed to get reset\n");
+		}
+	}
+
+	return 0;
+}
+
 static void tc9563_pwrctrl_adev_release(struct device *dev)
 {
 	struct auxiliary_device *adev = to_auxiliary_dev(dev);
@@ -489,6 +540,10 @@ static int tc9563_pwrctrl_power_on(struct pci_pwrctrl *pwrctrl)
 	struct tc9563_pwrctrl_cfg *cfg;
 	int ret, i;
 
+	ret = tc9563_pwrctrl_parse_reset_line(tc9563);
+	if (ret)
+		return ret;
+
 	ret = regulator_bulk_enable(ARRAY_SIZE(tc9563->supplies),
 				    tc9563->supplies);
 	if (ret < 0)
diff --git a/include/linux/soc/qcom/tc9563.h b/include/linux/soc/qcom/tc9563.h
index 0dfd25747b9a..086f37a40d80 100644
--- a/include/linux/soc/qcom/tc9563.h
+++ b/include/linux/soc/qcom/tc9563.h
@@ -13,4 +13,7 @@
 #define TC9563_GPIO_EN0_OFFSET		0x801208
 #define TC9563_GPIO_OUT0_OFFSET		0x801210
 
+#define TC9563_GPIO_CONFIG		TC9563_GPIO_EN0_OFFSET
+#define TC9563_RESET_GPIO		TC9563_GPIO_OUT0_OFFSET
+
 #endif /* __QCOM_TC9563_H */

-- 
2.55.0

