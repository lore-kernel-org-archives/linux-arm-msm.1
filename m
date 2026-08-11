Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C4C47D926
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 21:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786484179; cv=none; b=JoB5OEjhTnr7EvSL5W5nnkzCln4SDOXuXEW8zL7cjBOEQyTIZdibrViUzmSjBlkymTP80b9ykQl++5rorD79jyma2dNRfFmp+k9LeKbm9hVy+nuVXtAQMNDqSFgquT00SUzUUwW0wNUTb43Rz/NuozQviyVcrByTVDaDcTEoiqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786484179; c=relaxed/simple;
	bh=5XbMsA2WEfWZ5PXFP+vN1bXOmWMnIkvRDYrvY8qwc8g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=G/xtYouZScvmCxxDgrwtM11GH6wy4hNaM+97Y1PZLsf3EQL7j1hXljhd7b0cWDM0cFbwmwX5m1gD8RFNe6itBPg/ZRM8qlHQEt26oImknntPdkXY2spjKyA6jpco11/SiEWXUQlw6UG2Y9i6BaCetCi0qZ6luRgNeYpIKW7SXbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E644s33K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AYN91NJC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E644s33K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AYN91NJC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BLQP7X1835797
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 21:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6pY1IYJCaWc
	Xc+Y4IVIbUdPUrvld+59aZISMpQApWk4=; b=E644s33K0sdUWRFqRX45eQ+iUAv
	mTrP84Zvuo4MhbJQj4X22VX+yzGEvUILRB52pfHSySNKdUBOHyR99MGY81rY3rlm
	O0zYjZvRIXK6lemHGhhaxj/Huysen28XBahpmvOl+ncpdziM8gXjeLUmAOYtrecn
	Gvw4KScum88TyS9i3oZcpDe/YU4Y+azzOOjL2NSUvTcs7lfpzYWbvqDgBjQZrw7x
	bJ+A++D7RkWamjh2sbHgYA/qft6+RWUi931Tw+9BmCz+BmyDAzzN4dilZmUZS6bY
	66eLaJkEfYgSgQr4J//dfhWhZGhZ/9LVvWzQ4WQ+YUA/ur3IOY7I/uAhsPA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g01nc2rmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 21:36:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce8a76df2dso1486405ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 14:36:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786484176; x=1787088976; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6pY1IYJCaWcXc+Y4IVIbUdPUrvld+59aZISMpQApWk4=;
        b=AYN91NJCmvsWlTRHF5ePxgEvbMpswHmWahAkVQ6f/Iw0UeMyXj13mqkRMZHEACapUa
         8IOfWGrqnMMkU2AN+5ke7JoroaRfdxnmAR0BR8MU2BlX9af12vXSzJoLrIGzIs3xiRhG
         km55c8yG/HiruPD+x4cAe0vWtoxTkfvZFXhnClIuFc/wUFp98HuKAjEDNpze45TcHCei
         PzdAD3gx1lKkZZ4zd3FqxKckrY01IyVCMFN7zQadu9AlDE0JU/92Bw8rttGD2p/8xeAg
         U02AypOHvgj4Xpr05TKtkWXkBFAWMnpeYc+3WrjrYgGn+pt/yGGb7/qwpSXSaunMnNzT
         SCjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786484176; x=1787088976;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6pY1IYJCaWcXc+Y4IVIbUdPUrvld+59aZISMpQApWk4=;
        b=h9qPIscvL/DLr34wJVknOgDIP3ap86fIJ8ruSp+F954FX8ipLG1MzTLx1FKYwXT3Ue
         ENW3thdsEFJwtGQXdAMFx8xANe4rk5iV/mlOWkVQtmy/uIXvfE65OAr4hue1d1wm/OSG
         tex7niGvTVY8w62deDWUd7aPUD3nMtG0XISZWaWpuC534dTbRks8tWE+fXyE/VIvlTkx
         9lERFD70a+khQlWkxQWOf6IqPgchvI1Vqg8HW8YnY0DmRb9DwS+bW1uRebUKf+M6y78W
         cEeQwamqwILT7TWmUeNQaUYHU1nDTt8Mxe1NlvJhMGD2ndeHAeLD9cl8EhNyDJrXBT5E
         uwUQ==
X-Gm-Message-State: AOJu0YzsOD2aCWJrUL3zhKyj43e000KkmNOwB7yIQa9ERp8vS51VuVx6
	oLZXho7fkgPDaZADYuPb+jwm1YKp2u7U5RqQDG3SYVrAd2PC9wZx933viSSRB8r++aWDUAmFt9R
	g2or1buUKO4A7x39bUCDcyg/l64QqM7GlOu16xGHVd3OroKBX7d9ub+NXgvk/FQuWWfZO
X-Gm-Gg: AR+sD12wbNW8cMPZsJcRhL6Te+LoVXWb7K5o/VgV1CK9vhqWpEoSKnC95MRKH57wiZe
	2J9Lia45Azc3AG5oo/I0RI6L97zAibf8LVcKNErtZVTUK7PNsS1JRM2YEA0n2paK7iIs7Vfwt+k
	5Jp449uLiWpvJXqzLAPrUxSSjPi8y0TYlVORUQTkZuDGavujdQ2ZFSgqKv5Yy9EdcUHeDO/V7Io
	4JxaQ/ydr8awd5h7XLAtcslX4q8XQH/Yg9PMyvgTAptu+PWzhJol9EgdiK3jAmGE66G0JJaNu1U
	dmaZm6yZ5qm/gCqH1vpTbzKL9/M2CIahuNEX5U2J4i9gl1DxJ1r7B0DCuLImwthayBghji0ik89
	VKbYfOlJ8daxe2d0429xwJyBIHkJ6zC2MT36R1s8ZJ33bjcQiG69k2g==
X-Received: by 2002:a05:6a21:e90:b0:3bf:d0c8:2aa4 with SMTP id adf61e73a8af0-3cc2b7aa2famr8747893637.8.1786484175490;
        Tue, 11 Aug 2026 14:36:15 -0700 (PDT)
X-Received: by 2002:a05:6a21:e90:b0:3bf:d0c8:2aa4 with SMTP id adf61e73a8af0-3cc2b7aa2famr8747839637.8.1786484175051;
        Tue, 11 Aug 2026 14:36:15 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf3c08163sm2713563eec.7.2026.08.11.14.36.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 14:36:14 -0700 (PDT)
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
Subject: [PATCH v6 3/9] usb: misc: qcom_eud: add per-path High-Speed PHY control
Date: Tue, 11 Aug 2026 14:36:04 -0700
Message-Id: <20260811213610.2956147-4-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
References: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE4MiBTYWx0ZWRfX8W3usMgVyXCY
 VIHmQxPiPJYt4TIAj5HPZauZ6ao21WuZ1dbcYrP6vmco7HhP1idX/Tyk3kldVEI8Z66f0dugzDC
 EZKZdvZIge3IxuafKSFPHs/0pv8t0UQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE4MiBTYWx0ZWRfXws2zjOS1sP4h
 S9nZSAlteQChv83iwAla+BgdKBLtaV0Qa0QMjVC7w6ywQBgVmhPBPA986W1jIzx5i7+SMkbesH0
 8Uw4NENNXz5DDckYcFHOLJvH1IhtUIM92FZ6Q+Y5ahmjimfqgHnGp66JEpHV1qvAtF61+L9lEq1
 0xR0+FYD36/5Toj3TTrhPe+bCQs5G/J9CgNxZF2XmWheVYyM7Gz9xUmkZ68v6aiQWVsnxDqi4yr
 HyLDW+q9iSvV/TAAu/Gt7l/hMKZtZ1MGy2EbAehPlZZsyDnWmLJoQXcfxSQ94qyOxcD5RPRF5y+
 lAsHyYVPgWJ5U2675zqsiM0ndEviZ7nfePIwNmz5HuyPg3NWOhYG/YpoEUO2R/KZAQAc/4SNrrm
 2nq3LtSxgt8VdDyl8o+iB5jhYEPBJQJFlrdEp2RPXRYDOAEocaQkQ0PzlrVWojVczUcPIBzdaUM
 AeJ/SRc5AFEdrjhFywg==
X-Authority-Analysis: v=2.4 cv=RY6gzVtv c=1 sm=1 tr=0 ts=6a7b95d0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=OKkk4dbWoaB1VCfbt-4A:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: k6xrZydaXzUA76Z4Id36ryvn_t53syGA
X-Proofpoint-GUID: k6xrZydaXzUA76Z4Id36ryvn_t53syGA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110182

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

Reviewed-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
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

