Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7BE3469F6
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 03:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785726943; cv=none; b=tjnDSjA73JHEpA5zkfMNBX1zB0zJ+Jct+HUxJsv4RBmfZnZ1m/G608ku3ES7NMpzeJGFvfo80TjQsuT6m8pwLCtDitT1tUj+RrT76lc5kE0gWDLrB2EDR4iES18su6drn12HMgTUWFq/mr4mbyN22yD39ffHGDBthgjqoEzuR78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785726943; c=relaxed/simple;
	bh=f8lOALFAxjQ2jaRYRc4yKyprEP9GFjCI3ftFRnd1wDg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PqIFVCZnEncF96nCjlEGEsptfutJYkc12JfhqFeP5f8i1QDLVlw66MW08VqktEwvTkz9ROnYaSIuJGOU8oEu88p5kTS6hzVnVnqgxfKoX0XyNsrLprLbtpfwU3K5pY5YfkuLS0lWAZU18WgaAof42Iv23C9mqUzI3yrYK3WHnK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EFR+hRqe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=esIkRTNT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EFR+hRqe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="esIkRTNT"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672LVYOV2941302
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 03:15:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7/Den6QuSom
	M3UQRJd3UfPRQXa9qYE/PHhFp+/XsXdQ=; b=EFR+hRqeLSG8hgqjGlCJBpZrPi7
	BsPJ1EQfG0prHmli8R8iUyQQSo9P/ZI9uBmus/7Gxz/PxHJ8pM5Apc6xZvpTY3Uj
	TYkUWauwRyqdWyhj/QtSZiOpjE4KSa4gQisgInRxjFTlWUwDuqV8P3eZPpL9FUAA
	u7omjWycfYHCGgShV62QFSFzMEtZRQ6K64eubGMmtqCONs7gjSve39hMCgVUGczn
	bOrLBM9zw0JDIRPNCVxmJRiIlaE2z/LJh2mQziJAxf348pYkBbJGuE0SjN0M2+ak
	FzKZEbXPYhEiAnwC9YIKtnsoMOuoNgvKV5yiJoele/pE2cTDJnbqOQ1kSIg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs911c84m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 03:15:40 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb7d6ba548eso3782395a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Aug 2026 20:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785726940; x=1786331740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7/Den6QuSomM3UQRJd3UfPRQXa9qYE/PHhFp+/XsXdQ=;
        b=esIkRTNT8yMhTEgDQP8wRF3Kw4qrFumpeFKoZpOBMeHBuxRtqXoLDBYb7AYM8EVg4y
         f3W5vHUIiUhurXz6wRE160U11nGg0572NcFJgkpKlTjDYgf+Z0lvLGGpXWDDG58J79ix
         O8An3wBnH0eFG1hzNYzQHfOhvcxavJrX4LGZpIfns1T9eq/SYNI20TRO2zw5klUydN8E
         FzYTGEV1LEqCjgpUt/KZ6Au6Pi/2mTBsTfm4lU/knrp7qq0ysvZ2/D0bjK3QVZozx2il
         /9GMS/B0Ww4XpKEm+6L2IGMCr3TWxCrSVenSw8xPwn6xkQhceOE9flwqmuwgDnDFK0Bv
         AKeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785726940; x=1786331740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7/Den6QuSomM3UQRJd3UfPRQXa9qYE/PHhFp+/XsXdQ=;
        b=QOEBJ37C7lcLdqxlc5l8yjIzIHH/Ynpa+Y/BDYvkhE8ANAcYOuPwmoFKz4HUoiYOQl
         DU4pn547ejv2LS8s/qyIN07xt2ujdmBqb4M1+VzTYcejjLg25rFKjfC3bQBvDKhRtbDW
         T4x7x1w4qqgZwlPC543LfErIvsNwEuTYScWQL9gPgsz1gGOJWkRMSOP0whCZNufUeQbv
         ONh3PFbrkdLNcKXtxCH1WTsoz+CCFCasFn2hwNV2YTP06rdsOumO/0PSabC7hFoEOWPH
         vcjFWs416gb8zJxzvwZ+gd9zMz1FXi5apZwystPcVzQlTj1EbVjF8sdCpS8OFWRPiMQ9
         1UgA==
X-Gm-Message-State: AOJu0Yyaxax/DBKRchl8tRaJ0rzmZShqWFUjVfThyKhIO7Z/WH/AXRJO
	ywoonu+oSAG+jUY/o4uLSPqiMKuFkMjR1nkzM/e9PNLrNsH6/XWFk+zqcLvu74pDwc699UEAyW9
	aR9scnOWo7G0Jng5yNTHBPsvm4EmjRvG44SW3DHo5Xr9GqRWwtsMEwfIBmGGQxQydIvmn
X-Gm-Gg: AR+sD100vfgYt6+MqvZ6f8WA0ob4weBnLiSulmkMRdiH6q6qIEM3NL2NXsTijTMJy9t
	BTpJh5T6um5GrxNhAWsrudGCofpjoehgyaGPKUlzIprXo7WRioodCJNX1yHOBhfDQ5cOiinmJMi
	d6x9P3MQknOGF6rNCHN2DP1JWQ8wvSCmUrEP7CIfz2fDXpQ6dQjRTXgc/0uJfq8oftyYjMjVpRC
	xMlNQ56MLDxdPo7z4FKwbMG/E+4b81gF8+Z4mLy9y7hefn1tSn2sLemyh0hyS/Zb4xyJfRfB2zP
	fWHj5FRqByqsQU48RCsrTf0Ejs0YBP992KpCM8XEYgr0u/4Lss3TQ14HWMlPtA5BQ6q4M3t9Gyu
	ft5WX1XK+6rdHzPUXEZYiHKTBbyJeem9PASIeA+Sx+lGykSlA4SMc0g==
X-Received: by 2002:a05:6a20:5491:b0:3b3:1c7b:ffb with SMTP id adf61e73a8af0-3c92a7c8c79mr7841285637.34.1785726940038;
        Sun, 02 Aug 2026 20:15:40 -0700 (PDT)
X-Received: by 2002:a05:6a20:5491:b0:3b3:1c7b:ffb with SMTP id adf61e73a8af0-3c92a7c8c79mr7841259637.34.1785726939570;
        Sun, 02 Aug 2026 20:15:39 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c93dsm32585113eec.8.2026.08.02.20.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 20:15:38 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Peter Chen <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/9] usb: misc: qcom_eud: add per-path High-Speed PHY control
Date: Sun,  2 Aug 2026 20:15:28 -0700
Message-Id: <20260803031534.2942628-4-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
References: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDAyNCBTYWx0ZWRfX4Z4vOEPXkhBO
 sjR+HQjPT22XsoSWL0bVlkLZljBMibwBcG6quz6qYfkZIUTe++1ntxqRBinwRJv2EUZQq68RxPh
 rxzfgBhg2GGXe9bzSvz0l5aOJcxXo2g=
X-Authority-Analysis: v=2.4 cv=PvGjqQM3 c=1 sm=1 tr=0 ts=6a7007dc cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=OKkk4dbWoaB1VCfbt-4A:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: gPCJd9HsMc58-TqLZVqUS68n4H8ZsWCi
X-Proofpoint-ORIG-GUID: gPCJd9HsMc58-TqLZVqUS68n4H8ZsWCi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDAyNCBTYWx0ZWRfX7dZAJbXA2ao5
 xgwa8+N3B8Xl4QTbFP+9nlEo+A6+5Bfsh6fHsq8P2s4NF0uIjH/rsbLMmB1id1GBDEmcHz1mVOi
 VcP+VKbq6fTZqVkftv2R3wNbijfL1qQcuglDhF8/LIaLffwOqRszrX4Kv1pQmwuGtNe67QNJeJ/
 mGtsl2DwlV15hEoXJ7Cg7aJQw2QXxCnUP2KwWOXK+vDjrpbJ+JsRBMDm7C7wROXoH8kYIgCPlLv
 syj54uIR/KVy8fTxsII0D+0T6QJ6R17hksw5YnHENWXMMVrnAZblQ8xWQaNNvXfqZF5di5/XbDp
 OwG52Y50a1dxiue7k/sxXLk9MRP65kqCRHSFmh6/eWy6zJMUAOTfxw181QM2Exff/R/esfq9kvo
 HkUrAg+ilIgdHMc+eBu31y/RjFsfZxijMIejtVzpdOSdvSEqH77tioS4INgzVD34+QTezlFocfL
 ngHqA3Wo+VOWfID+qag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030024

EUD hardware can support multiple High-Speed USB paths, each routed
through its own PHY. The active path is selected in hardware via the
EUD_PORT_SEL register. As a High-Speed hub, EUD requires access to
the High-Speed PHY associated with the active path. To support this
multi-path capability, the driver must manage PHY resources on a
per-path basis, ensuring that the PHY for the currently selected
path is properly initialized and powered.

This patch restructures the driver to implement per-path PHY management.
The driver now powers the appropriate PHY based on the selected and
enabled UTMI path, ensuring correct operation when EUD is enabled.

Historically, EUD appeared to work on single-path systems because the
USB controller kept the PHY initialized. However, EUD is designed to
operate independently of the USB controller and therefore requires
explicit PHY control for proper operation.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
Reviewed-by: Peter Chen <peter.chen@kernel.org>
---
 Documentation/ABI/testing/sysfs-driver-eud |   3 +-
 drivers/usb/misc/qcom_eud.c                | 124 ++++++++++++++++++++-
 2 files changed, 125 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-driver-eud b/Documentation/ABI/testing/sysfs-driver-eud
index fb927a003596..f20b82b5a38a 100644
--- a/Documentation/ABI/testing/sysfs-driver-eud
+++ b/Documentation/ABI/testing/sysfs-driver-eud
@@ -20,7 +20,8 @@ Description:
 		  primary   - Primary USB port
 		  secondary - Secondary USB port
 
-		Writing any other value returns -EINVAL.
+		Writing any other value returns -EINVAL. Writing a port
+		not supported on the current platform returns -EOPNOTSUPP.
 
 		The attribute is writable only while EUD is disabled.
 		Writing it while EUD is enabled returns -EBUSY. Reading
diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 25a6a8f110ec..03d1c200658c 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -11,6 +11,8 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/sysfs.h>
@@ -39,26 +41,84 @@ static const char * const eud_port_names[] = {
 	"secondary",
 };
 
+struct eud_path {
+	struct eud_chip		*chip;
+	struct phy		*phy;
+	u8			num;
+};
+
 struct eud_chip {
 	struct device			*dev;
 	struct usb_role_switch		*role_sw;
 	void __iomem			*base;
+	struct eud_path			*paths[EUD_MAX_PORTS];
 	phys_addr_t			mode_mgr;
 	unsigned int			int_status;
 	int				irq;
 	bool				enabled;
 	bool				usb_attached;
+	bool				phy_enabled;
 	u8				port_idx;
 };
 
+static int eud_phy_enable(struct eud_chip *chip)
+{
+	struct phy *phy;
+	int ret;
+
+	if (chip->phy_enabled)
+		return 0;
+
+	phy = chip->paths[chip->port_idx]->phy;
+
+	ret = phy_init(phy);
+	if (ret) {
+		dev_err(chip->dev, "Failed to initialize USB2 PHY for port %u: %d\n",
+			chip->port_idx, ret);
+		return ret;
+	}
+
+	ret = phy_power_on(phy);
+	if (ret) {
+		dev_err(chip->dev, "Failed to power on USB2 PHY for port %u: %d\n",
+			chip->port_idx, ret);
+		phy_exit(phy);
+		return ret;
+	}
+
+	chip->phy_enabled = true;
+
+	return 0;
+}
+
+static void eud_phy_disable(struct eud_chip *chip)
+{
+	struct phy *phy;
+
+	if (!chip->phy_enabled)
+		return;
+
+	phy = chip->paths[chip->port_idx]->phy;
+
+	phy_power_off(phy);
+	phy_exit(phy);
+	chip->phy_enabled = false;
+}
+
 static int enable_eud(struct eud_chip *priv)
 {
 	int ret;
 
-	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
+	ret = eud_phy_enable(priv);
 	if (ret)
 		return ret;
 
+	ret = qcom_scm_io_writel(priv->mode_mgr + EUD_REG_EUD_EN2, 1);
+	if (ret) {
+		eud_phy_disable(priv);
+		return ret;
+	}
+
 	writel(EUD_ENABLE, priv->base + EUD_REG_CSR_EUD_EN);
 	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
 			priv->base + EUD_REG_INT1_EN_MASK);
@@ -75,6 +135,8 @@ static int disable_eud(struct eud_chip *priv)
 		return ret;
 
 	writel(0, priv->base + EUD_REG_CSR_EUD_EN);
+	eud_phy_disable(priv);
+
 	return 0;
 }
 
@@ -130,6 +192,10 @@ static ssize_t port_store(struct device *dev, struct device_attribute *attr,
 	if (port < 0)
 		return port;
 
+	/* Check if the corresponding path is available */
+	if (!chip->paths[port])
+		return -EOPNOTSUPP;
+
 	/* Port selection must be done before enabling EUD */
 	if (chip->enabled)
 		return -EBUSY;
@@ -227,8 +293,54 @@ static void eud_role_switch_release(void *data)
 	usb_role_switch_put(chip->role_sw);
 }
 
+static int eud_init_path(struct eud_chip *chip, struct device_node *np)
+{
+	struct device_node *controller_node;
+	struct eud_path *path;
+	u32 path_num;
+	int ret;
+
+	ret = of_property_read_u32(np, "reg", &path_num);
+	if (ret) {
+		/* Legacy DT uses 'ports' node without 'reg' property; treat as path 0 */
+		if (of_node_name_eq(np, "ports"))
+			path_num = 0;
+		else
+			return dev_err_probe(chip->dev, ret, "unexpected child node '%s'\n",
+					     np->name);
+	}
+
+	if (path_num >= EUD_MAX_PORTS)
+		return dev_err_probe(chip->dev, -EINVAL, "invalid path number: %u (max %d)\n",
+				     path_num, EUD_MAX_PORTS - 1);
+
+	path = devm_kzalloc(chip->dev, sizeof(*path), GFP_KERNEL);
+	if (!path)
+		return -ENOMEM;
+
+	path->chip = chip;
+	path->num = path_num;
+
+	controller_node = of_graph_get_remote_node(np, 0, -1);
+	if (!controller_node)
+		return dev_err_probe(chip->dev, -ENODEV,
+				     "failed to get controller node for path %u\n", path_num);
+
+	path->phy = devm_of_phy_get_by_index(chip->dev, controller_node, 0);
+	of_node_put(controller_node);
+
+	if (IS_ERR(path->phy))
+		return dev_err_probe(chip->dev, PTR_ERR(path->phy),
+				     "failed to get PHY for path %d\n", path_num);
+
+	chip->paths[path_num] = path;
+
+	return 0;
+}
+
 static int eud_probe(struct platform_device *pdev)
 {
+	struct device_node *np = pdev->dev.of_node;
 	struct eud_chip *chip;
 	struct resource *res;
 	int ret;
@@ -239,6 +351,16 @@ static int eud_probe(struct platform_device *pdev)
 
 	chip->dev = &pdev->dev;
 
+	for_each_child_of_node_scoped(np, child) {
+		ret = eud_init_path(chip, child);
+		if (ret)
+			return ret;
+	}
+
+	/* Primary path is mandatory. Secondary is optional */
+	if (!chip->paths[0])
+		return dev_err_probe(chip->dev, -ENODEV, "primary path not found\n");
+
 	chip->role_sw = usb_role_switch_get(&pdev->dev);
 	if (IS_ERR(chip->role_sw))
 		return dev_err_probe(chip->dev, PTR_ERR(chip->role_sw),
-- 
2.34.1

