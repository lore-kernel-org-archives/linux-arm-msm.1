Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD28D47ACC3
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 10:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788258527; cv=none; b=NDqadNsM4LDLc/B6RZ8emfXRfhiFR497TLKCWV2NQMAxpYCyLs1iDIi6sowrmunuX/GNpc3zZbDomO+Vly+0S4OW7SN5uQvAcs7HPxHnEnTo0a3/OTer+MdEWe2qKslU0UNjUn2i0jCXi7zsr9KEsG/54wPc/pFUBT1ArGZWsss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788258527; c=relaxed/simple;
	bh=Lpf/ZwlDI+w5kSfuIzRiRRQ5wKeVd07lzqLdLM481UU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ivdy5koy8tEL73C5UsIEelo1WFNIDx8arUrFQdz4tWsRAEJDCF59shDntXrDsLAa4EtloLgYg5S4yy4Bxe7dTfqBsY++Lv2bgH2eRdduKN7JTMh1mYmSKiP7Wg+RBhuCY6I19Qb6ClDkaHioiSBzwTfwGk9zYHaerMRW4cy+5ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YxNodZtW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gSrVfduh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YxNodZtW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gSrVfduh"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJcng2141623
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 10:28:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9cTjmjn9lQpAlWcg2tEI3HZAf9kgXfovcrDlHVMdULM=; b=YxNodZtWZ5gPCRGa
	zia0bsdxU+6rzZCXzo+oOKwFvC3d1SX9PsM8nKkXvr4x3rbNDpF738OJ/cLDkIZZ
	fxIeCfbPZGqKiXrRNDb7v/cCrJYuUIEUlF9j/dXyfB2PV9A4huymwrspxb0gSGaV
	jSq5RlxUazIMCseFukme1qGGc4jb3Kjcg6bj1ethGwvoE8tGkEmPIRZUF0icqEVv
	lv7ft741qHqNoh7ddQGnnTYMI+Q83hs2HyiVCPFV3HLAOUMgjZ6b73AAQ/CltEnb
	jTpmQryux1Nmnaevana9t+/HWmaaJcAU3/hT6KolNBqUk66GbtZ/Ahi+bqZclbgC
	TTfD+w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdp8fssgb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 10:28:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936708f129aso603367785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 03:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788258524; x=1788863324; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9cTjmjn9lQpAlWcg2tEI3HZAf9kgXfovcrDlHVMdULM=;
        b=gSrVfduhkCQtty7HlXi/6vtZRM3T21geX4/DUMHui/mvk+c1POO0PCUWFQAQ7nd3On
         mSK6A2BgmibhgTor1tN1RNjklkNeE3qms7AwCl67MFYNPIzkXcjGnbeCl6mZOI+apZFD
         rYkWOD4PvbC6rN51/qm4NPTpaCDHmcPvvu2X8bhUxrsxEaKWgls85OV2aM3oan2Ri1SI
         0TSbohQuL5cXb+/HntmpGPIIeFIOEN8tswGeUA7tqtFQclu5wCMsBn7tEFFZ359WKKkS
         Q0eU/9WFw9iU5ZQ2v198UvLLfnDfnQcOgJbBvvWoA2CsiONq5e9ijeIF5fThBelbn5W7
         G25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788258524; x=1788863324;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9cTjmjn9lQpAlWcg2tEI3HZAf9kgXfovcrDlHVMdULM=;
        b=DwaGeHt/CAkvnt6waEQTQtqhY2SEv/r/T1/tXvnm8ti3TszkozA8sfGnTtoDvU2yXx
         SXOU6m07MA724CfGMGOudQr72WAmrfduxK8ziiaspDY3jkvg8NN4zh3EunYFZMUzQBWS
         l/ChTNyagARa7cozib65xVMdu05Zvgr7PeM3+Ojk419JV2dA30e36bZ0Fk4A2Qo11Tui
         S5ZZB98ybVOG10iApVsPkQz5rSIZJ7kpU9fnzBYDI/HE/AEVNykTp9ZZXAKNnBcyyhKW
         /ohhYkqbHO7PznJp4LPXWJINCET/jis5CZpyuNY4Cc+I/upYKmgjWLS9UpU9QjfJDuCW
         lUUw==
X-Forwarded-Encrypted: i=1; AHgh+RqQZjYtABcijus+V9KlrKPUpCqc+V8XD8FDPvxCQ9TUvmNcrcmArXolH4K7l7VVOoSmAF9uDNEKwBVbCmVF@vger.kernel.org
X-Gm-Message-State: AFuF++mcd4eGF0taeBmymKNtS4+OgueW9y/1UYOJSahECLGgErRK7Nyh
	aUBkGCGAhisjqcqR86NE8PfJ6OWe4ZmJByjhK3+sWhIZfKFTO7D2OvJqXmsbDivuu4SjIZfVuC7
	2Mx5k4FN/eodjYAiy3eDhDqbW0rlTVCklb3SWorCK5DwDIXMIhrrHHF5EM4YCy3Yus/Zp
X-Gm-Gg: AR+sD10HFGN0HYJ3SWd/vyzW10OHxI7HZ/9lPeA3brJwN34Y3r+CKD/PGUJIQhK3bQ0
	cxwEDbaqjBbHUPd2uC0tgDSIbAu0xOYQfrol8RmudNYeCOaJLHfk4mpgP0PXmjINpXYH6xrPzpN
	WtBc1pTfwi7OIVjX34jDQBK6/x6YUN0Hb4xb2zWmW6b/8yKlCeHi06bOUaVIq3TpD5f9rE01wv3
	aGMZL2mlqC4Ins5Jb0u5PWmRlFG4X9S9VVpUf7eopPdgXX8vgeNqJQGqgg3BsRECFxBH4egXLxn
	1G9exMZvmr4shS7O0bsHXuBgKegCTzCFCDncm6Xi7+vI+FXJxsf53MaYPR1aNz2LLQR7+UXv3ZI
	kiL8ynh/S8/zwLQ==
X-Received: by 2002:a05:620a:6f06:b0:92e:fc42:2c19 with SMTP id af79cd13be357-93947ff98a6mr936893385a.11.1788258524122;
        Tue, 01 Sep 2026 03:28:44 -0700 (PDT)
X-Received: by 2002:a05:620a:6f06:b0:92e:fc42:2c19 with SMTP id af79cd13be357-93947ff98a6mr936887785a.11.1788258523641;
        Tue, 01 Sep 2026 03:28:43 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cdce0b425sm56300155e9.1.2026.09.01.03.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 03:28:42 -0700 (PDT)
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 12:27:56 +0200
Subject: [PATCH 4/5] PCI/pwrctrl: tc9563: switch per-port reset to GPIO
 descriptor API
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-pci-tc9563-aux-v1-4-dd9b80738e70@oss.qualcomm.com>
References: <20260901-pci-tc9563-aux-v1-0-dd9b80738e70@oss.qualcomm.com>
In-Reply-To: <20260901-pci-tc9563-aux-v1-0-dd9b80738e70@oss.qualcomm.com>
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
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: ai2-bhodquMkc2jJKRfU3jkPGwncDT2q
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5MSBTYWx0ZWRfXy7kb6eNV7qt2
 0kf4Mxn4kDaUasgF++0uJVaQM65AmNl8ut9YqTeelMKKKn+mpePEX5mJTXqzOEfDlu5Uw34QU1e
 4DYsqpNUkMAuyIG/Mg+4WNX57eKSPvM=
X-Proofpoint-ORIG-GUID: ai2-bhodquMkc2jJKRfU3jkPGwncDT2q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5MSBTYWx0ZWRfX+05VtVb/iq/a
 GoeOKdCWkaLJUtTbbIe0xrr6kczC+H8GdkOZeLUcKc8qFC237PMddjk2OpFmwZoT2tSrOelhC8E
 ojlo7Ij7+i6PpOFXyrzDR8ByCjxLgzfMnLgR+OPhVGA7TnVgHTJ7HR/hH8HyELuKXDJzcQ2xrUI
 PBMLK8SNj5ONDC8WlFpUaPYbeGRgyFky0mWau9UVbnon9vfosBCpBWjJ2p8POsJ41faXdDADPZT
 ezp7e6oBeiYl5Ys/20QsmWEAXK1WHims+LZAdyLX355/IkgAtPuPHxpnr9P2fcWrtuxLeLwZb65
 Ki7NfNaZLYSvpJd51kAPp0Dgi9pWbHrECoHpJzTPoyNEYGQ2BtNNs8brXOrzLYuyHmLFAgLcplW
 ZbR30J5ZQhL4U2uHL0Anno4HNKtelQiBx318FiL58d3VVTxMFFLy9MPM6H41hdAw/klHvI9Wfaq
 wM07XaaL6weLzwO2YvA==
X-Authority-Analysis: v=2.4 cv=BPWDalQG c=1 sm=1 tr=0 ts=6a96a8dc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=viGhCAv9QodxNsH3n2EA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010091

Remove the local TC9563_GPIO_MASK and TC9563_GPIO_DEASSERT_BITS
definitions, which are no longer used after switching to the GPIO
descriptor API.

Replace the direct regmap-based per-port reset logic in
assert_deassert_reset() with gpiod_direction_output() calls, falling
back to the legacy regmap approach only when no reset-gpios DT
property is present for a given port.

Add the reset GPIO pointer to struct tc9563_pwrctrl_cfg and introduce
tc9563_pwrctrl_parse_reset_line() to look up reset-gpios from each
PCI downstream port child node. The lookup is done lazily at the
beginning of power_on(), returning -EPROBE_DEFER until the GPIO chip
is registered.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
---
 drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c | 85 +++++++++++++++++++++++++++-----
 1 file changed, 73 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
index ee9c26b8f5cb..ff84f4ef7878 100644
--- a/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
+++ b/drivers/pci/pwrctrl/pci-pwrctrl-tc9563.c
@@ -57,9 +57,6 @@
 #define TC9563_POWER_CONTROL		0x82b09c
 #define TC9563_POWER_CONTROL_OVREN	0x82b2c8
 
-#define TC9563_GPIO_MASK		0xfffffff3
-#define TC9563_GPIO_DEASSERT_BITS	0xc  /* Clear to deassert GPIO */
-
 #define TC9563_TX_MARGIN_MIN_UA		400000
 
 /*
@@ -85,6 +82,7 @@ struct tc9563_pwrctrl_cfg {
 	u8 nfts[2]; /* GEN1 & GEN2 */
 	bool disable_dfe;
 	bool disable_port;
+	struct gpio_desc *reset;
 };
 
 #define TC9563_PWRCTL_MAX_SUPPLY	6
@@ -349,16 +347,40 @@ static int tc9563_pwrctrl_set_nfts(struct tc9563_pwrctrl *tc9563,
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
@@ -393,6 +415,41 @@ static int tc9563_pwrctrl_parse_device_dt(struct device_node *node,
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
+		if (!of_node_is_type(child, "pci"))
+			continue;
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
@@ -478,6 +535,10 @@ static int tc9563_pwrctrl_power_on(struct pci_pwrctrl *pwrctrl)
 	struct tc9563_pwrctrl_cfg *cfg;
 	int ret, i;
 
+	ret = tc9563_pwrctrl_parse_reset_line(tc9563);
+	if (ret)
+		return ret;
+
 	ret = regulator_bulk_enable(ARRAY_SIZE(tc9563->supplies),
 				    tc9563->supplies);
 	if (ret < 0)

-- 
2.55.0

