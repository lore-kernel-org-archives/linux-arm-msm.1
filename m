Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1AC3F166A
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 22:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253592; cv=none; b=QfbPmFJRsYBB/6OPL0s3dwx2S8XUcjpbw3+fSxsJnx7G6DHN9q8llWI658FmNSqGxtopDSmhKV/EWC0XBfeakQhYASzejrCK0TZCqhOFvU8cgvwiKh0K007Aua0D1yY8IzhKdxuTB3QNq7rxdmPQPUsionunVBaSvuA+VnlnZII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253592; c=relaxed/simple;
	bh=rVdkz760Q8fXyAseABchn8U5vS/oKnuFm6WPsfdcnjw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Nl3FkI9GFJmeiv4OmCXibs+cvNr9TcwS1pvnRhxtXqvABGsqTQ5qhqfl7oyrVbxxiGAksMt+cMmo7W2+0xp/CLRbFxhImBFKEpx1qNqm1eE65WDD30RCY2keuT8O3qt2InAZQd2NDZpv6qR2ur2LwAnUXKQoeJAlThXRUjTMPSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FjUhv9aM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YmLt1jfi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FjUhv9aM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YmLt1jfi"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CLoDC63673769
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 22:53:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rDAPLYVM6TG
	uQkdtNKjVBPeoUGkbJB4PVCw18G3tQWo=; b=FjUhv9aMxUr3gJZRDsLyJBt0pFU
	njR8VLiwl3f63i0mSFYgxVcr5qL/H2Ho5yMdjCdmzVJPmcG+BI4fduJT/u/SozjD
	OYRF9EmOsRYBWZW/zxEzPwXJJbS8H/cDoI7qVGvHMLmnLm8huY8gjJoO6oZX+Pn9
	xZCQn4HaUoRojN1Mp78Ux2jlLagkAKdLytiJOh4BfNCzqnaaGSL2RBxpiknPb/jY
	KxYAws89cWMF67xJqNDVPxrj+gIVdbl0Ngt4fAmM0n2il3mzdrf7UtOShCOLni4P
	qhcuGaOw1AhtSL6lO1F4ghTOt0dJerix7VxuHSUqBxFichBsYbHBW+hUvMQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd2365-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 22:53:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ea32e57e2so4176075a91.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 15:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789253588; x=1789858388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rDAPLYVM6TGuQkdtNKjVBPeoUGkbJB4PVCw18G3tQWo=;
        b=YmLt1jfiLIPdU8EpP9U9QUeG4ev/M/ORLzohNdXZwLHlqpScxhQT+l9DKddjwb1fuK
         2xPVe3eMvDFiJvjSqkuvaPuEayHUQ0SUbvzxbdoX/5IQF65IC25lnzubeCmsO9HdJMGq
         BlvaM/welgp0w4d/tViWeAoCMc5bQ2DIIDGdISfY3mhTyZBed6DGa1JAKpFcqDVFiTVO
         20YJ6PAefm6roXGpKfaXMM780dwn6BGB2hpjncNJ92iIv0RvZESHPyYl9gXuSErwt3Xa
         +qx7KhTrusvpjX3x2+mtZGs7K5tvEoXrtsXHh2JqAp4eyDrM8Z0DRXK04/2BGwiR9Ead
         uzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789253588; x=1789858388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rDAPLYVM6TGuQkdtNKjVBPeoUGkbJB4PVCw18G3tQWo=;
        b=nHLydqw85gpDATuSY1RETaQEDnHh58Q2gD0+y+vBhb7rqQzm7aWrIiZMCBHWwsWdv7
         lxBqNPjsHBEgiI5f1j33/lLtEXNO2WZLrHpz16QMuJC88DYuNJLOOGSsR2NRLpLdMTGb
         zXDC6Wupb8vx7ntxlE1W79hGw2KB8jBWp3VNLiC7By6E59ZNEyBPfV3MmGvQO/wJY8MF
         xKnotOENpAARgHacZVCQPFtwMS84ZfZadi5LVcgfHvWcxMaDioR1hXo/q1dWbRLZ1J8Z
         SMfpDjjSZ5rwhO8z54SeT7Wr+bcmyNrolU4mVFznjULB2DCXw421Lf2y9naBl/cjLW3t
         YYPA==
X-Gm-Message-State: AFuF++kTtmvhwC98vanDKjWYJkgvD/bVe/NR3mNjdrdGx7/XSoGsyG3b
	Xs9wT5FLT/EnJmPDCMi9D1eczoaVoF17hIqsMbF37fCWW9NYSj3jUepomzn0sbOmujrObmSbP3D
	cnyVtxwy4eqOXIMRLdw3XY/VZBWp3qS6PyNslrc4CucEZTsCykgWP4T5pvUGI+nYOi678
X-Gm-Gg: AYBFou2jg41/wB4hIs9R0PmyX/Vwzyr6Gl4wYObKnMp1GxlzoCzaFwHmXjc1IhxbbzU
	TQsyQESDOaQO6BW8FnIARazMy7UK7Q2r3mEaUZUdVdN/QoXlxHpF4TNwh0kLTgAtoC6lKTl53jJ
	Zp1gmyYKaXtwBVk3atrLp0jMNOtXLscQcx2Pp4lYlArc2irwIMT6YcHEnzytAkLtDnFjPdtVkAE
	vWsOcAKulBq7Rwn7x7JoKVNy54AQHH1itjfLcTQV9om2BKLmG7xe4ZozAcWcuz2RT9hCYQ+dOXL
	itUSEqcuCuQPwRHXQ2sAXRGZ0TrLiIJspOgQrKZwejAJTOKAXJW+YOxnT5YmPylQxsL+aeTPRqz
	1nWtllY+6C3LtlYGCYeiBYYLCipFdIHxxp9frk13bvAnheDCKAjoNtw==
X-Received: by 2002:a17:90b:5243:b0:398:c724:1bb1 with SMTP id 98e67ed59e1d1-39dbc0c3777mr9261918a91.8.1789253588201;
        Sat, 12 Sep 2026 15:53:08 -0700 (PDT)
X-Received: by 2002:a17:90b:5243:b0:398:c724:1bb1 with SMTP id 98e67ed59e1d1-39dbc0c3777mr9261887a91.8.1789253587789;
        Sat, 12 Sep 2026 15:53:07 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f5833fsm19741555eec.23.2026.09.12.15.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 15:53:07 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v8 3/8] usb: misc: qcom_eud: add per-path High-Speed PHY control
Date: Sat, 12 Sep 2026 15:52:56 -0700
Message-Id: <20260912225301.3396556-4-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
References: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa5d7d4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=OKkk4dbWoaB1VCfbt-4A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDMzNCBTYWx0ZWRfX6vWAD2qtolOr
 kfw3p6ipr1mTP9OB0XRiOpxHUE5rr/tdL1IVxMc/kunEQn408G5e9cS01WFdN84OF7QMA6/N7O6
 taVoPADsvunz1DDK92LAV6yrJ+J56hbNYVriphuWdLzpbOrUdHXlttj7CuEqphIjL7FQ5mVhQg5
 NFUZd1I6Rn5exuYTNuxpMRNLB1HYCazojcoe+eLg6ocd73HLRCtSBd5c9KMM9Xe1dNiDk4d82ZD
 YVX9DjJzWzm4H9kGGRv9LYpDp6mZV8v3fya/Hc1ZNOUaG+wZfhZiyeq37d+aaIrWQAzbbCP8RFs
 U98L5830wwJXAB2W6ntkf9X0DgWPJyP+eRjPam1G+Ffx/R5Dnrrn9r4FdqoyJLtfpRkZRKeAjlB
 6f2VXmoUfKIRDUgHob7NDgeqsT4U4dlMsfcVPmKkGrZYu0n4Atm6lW51OGSMWsGgI4FWmt9bkHG
 QKg3szun/6AqepeSY2A==
X-Proofpoint-ORIG-GUID: itsYLzyTWGUAEzwmASc7vzIEqup-zZkn
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDMzNCBTYWx0ZWRfX6/mzusMlXc7G
 uK+dTBqQ3JIjBiNRjuUdFrs/W0+x/Iv2cE1lUypDTPyll1RJbpRDRjW00sxzm4t3kigx+hFFj2N
 EqZ33lJNzI57jdE30BtuDsehf+CtmPA=
X-Proofpoint-GUID: itsYLzyTWGUAEzwmASc7vzIEqup-zZkn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609120334

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
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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
index d32d382a311e..70915af40ebe 100644
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
@@ -257,6 +369,16 @@ static int eud_probe(struct platform_device *pdev)
 		return -ENODEV;
 	chip->mode_mgr = res->start;
 
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
 	chip->irq = platform_get_irq(pdev, 0);
 	if (chip->irq < 0)
 		return chip->irq;
-- 
2.34.1

