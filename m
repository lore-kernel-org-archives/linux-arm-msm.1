Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D982241D63C
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 21:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786484184; cv=none; b=r6nhlHzMA5mmLvABfFqfPgTi4x0jCDDA4tz4XRj5Jn9cGX/31LkmWvWs4u/Hnu2cfpeUYvncj0oLoBqXVBEMh0ZH1DWjFPFS6FyaPFrNunbKtA0Go4vYUwOEggc0uiVCP1AQUybKPEy0TPql+7IK7aIC6tFO4Ouk3kHLraiL0MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786484184; c=relaxed/simple;
	bh=0L1Nlyhc9R2Fh9oy1Sf9Zo15aqLWpgRmbpV5WKoAi2I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HV6Q/SacMSj0VNZFNlfqmrEqeXY/eBXSWJjCH3LBzsfhOeNzfaS2Ka8b9Znta0Bb0dwqG0Nzft4fAQpNggHfued16VkN0R1zglBkAJR8sOEUyVEIfOb/EwAZbwc5BjchN0rE4HBKgm07MfA3zRhWvMWnJH31gMVQDol1QLvMIDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EzgfKZBR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e9e1Ol1w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EzgfKZBR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e9e1Ol1w"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BLQMAF592652
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 21:36:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pPQKRnqntZ3
	qOHUeBtj5RYbP4mgE0OmZLSFKwefcwXk=; b=EzgfKZBRlDxuuc9d/+o0KqsK9WN
	08XYGSYdUI4GIMxqsJ5DyiNW6Dlgu6Z0pvUvtU+z6OfR6vT+lIn69H8ET1VLWVGL
	xQIAFezDDOcbwWjNQnZV6L2CK1icUyn+Hit5XQGKI9wwI/0VX04ykfTOX64Mn3oD
	+jnJWcyF6XPPn9XWvNeKeTOOmm/IE+ddv9dK9BUKym0zoNU/suZ7faTswjIU+5Et
	R/yJ4ySJrUB0yTDOsGOKGM2gLNRR2MSsgurBG7zgOsWGr3g5Ssab9zfPH8a+RiR5
	F0a94g2NF0ea99NDWiGKeCaxjFIFB5WkzL0ZSdZjw+1hJSzE2ps9w5hk0Ww==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyxweufbg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 21:36:18 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38dde0df80bso518375a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 14:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786484177; x=1787088977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pPQKRnqntZ3qOHUeBtj5RYbP4mgE0OmZLSFKwefcwXk=;
        b=e9e1Ol1wM4FZ7LUtZnJb6FWBx59ADPFgOGew+KPMDerKDJdxaHGtbSKcAFIxlWNaw+
         vYesHpDMOE8azaEtekGjSBRGYSEpvX33Mcfj6VXcj9MTXDw7jNmb15sdxcwdBy/QSoRz
         D4gaax5sidPeRI164QZEmqd8l460k1mek2BwFgbG7IwxhJrXexDvnGlm+Rc66JKbCpf3
         ub+iIIThKREc+2KFfxDoxf0IgEVO/7gpxHmaspdc26QRbyHg1JwVCtyhjkC/OW7kmp40
         L0kkijers4VLq7b4xQ/GxKFMsrayzlOTZlgjh91Fs2m3RFavAVz3LHRa7SUaaiG1sFdv
         2tMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786484177; x=1787088977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pPQKRnqntZ3qOHUeBtj5RYbP4mgE0OmZLSFKwefcwXk=;
        b=GURDVyiNslJB0aDufFZRq4REIK7OOlm3IEGru3+ycbjUViqfVK0f6yYqg9u4Q4UjuU
         GyYCgwL2WEjtroO6tBNAF1dIzFR/g/aMYvf3iPvztr+Mj+8pxJX6fDFSg+f4xG20jSBx
         WLHIQFMWNIin3mUba4/a871gjDQozqK3U0THf4KvRo+Hjo+zvmq0X+0PHOE7/a8ItGVa
         5xIh5nCqi2HtZCf3mB8bO2UfUizVxliFydWU9TbGT7lV45fN8Anr5lOAMlxZ7tILcYK2
         VRK7BU6m5BBctb8DTZk2qpHszEtlHNjuMgOgzITSTr5KaqrUrrEmxRK9QipHThBJaqTs
         YeDQ==
X-Gm-Message-State: AOJu0Yzg6nx6mnVKUc4J+icjfjplbKGh9h1ADGesCBZ6XfrnlsAuvqK7
	l4GpuvUBzIQ5VODbbyzD8D/auGxbboNIPrQtutR3epUrI8TxaRo13kXJvAV0jUQ/5oGBHcBLtJh
	/4nNh9ZPQRP+Ic8CA5ornk37lfmbju3nqm3M2vqCHXNeHU3Dxom4+BZvkgGZI66+tdl/9
X-Gm-Gg: AR+sD10cZnvi0Sm7V76TCDqzZn9SRWEBWvVJuxu4fy9OwppaTx1JVFMCHGjCqWqacvp
	8VkgvXRqsgwQfwigXeJqUUQb83b+VLnWlVIcjRzD5ANC/cBBE/ODZiKV4wABmra6jNsw6hrmg8t
	25Y3tM0/g82PZPFknceXTW49LWgmnmlZ7TijpFbeF6uiYsf0PHFfe0F/wepG8DXruglcXMugQ9/
	c/+TAtADoe6PkJfUVMVQdi9V7kdEkE3qLJm+vbiA2v75MtlQu6oVxMBjVa4Jcbr6JRuMtNfu99m
	WFss0tLaJdybgdfFLYEBuw618JnqssSoXGayYo6nVpA6T56+S/5WX5/HFhmN6j2uJ21AeYD7l30
	xQ/NvMfQseodQfPx8vI5EFZ2eZNi76/365cG/69CXDBQTmecn8R0LKA==
X-Received: by 2002:a17:90b:1b05:b0:38e:4cb:51f with SMTP id 98e67ed59e1d1-393012c841dmr41872a91.11.1786484177119;
        Tue, 11 Aug 2026 14:36:17 -0700 (PDT)
X-Received: by 2002:a17:90b:1b05:b0:38e:4cb:51f with SMTP id 98e67ed59e1d1-393012c841dmr41827a91.11.1786484176504;
        Tue, 11 Aug 2026 14:36:16 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf3c08163sm2713563eec.7.2026.08.11.14.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 14:36:15 -0700 (PDT)
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
Subject: [PATCH v6 4/9] usb: misc: qcom_eud: add per-path role switch support
Date: Tue, 11 Aug 2026 14:36:05 -0700
Message-Id: <20260811213610.2956147-5-elson.serrao@oss.qualcomm.com>
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
X-Proofpoint-GUID: LN2r3yAwNf7FdU_ZDWdeI0ewGMDBbGHK
X-Authority-Analysis: v=2.4 cv=K8QS2SWI c=1 sm=1 tr=0 ts=6a7b95d4 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=7LOY1QleUuiESi-gyjEA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: LN2r3yAwNf7FdU_ZDWdeI0ewGMDBbGHK
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE4MiBTYWx0ZWRfX+/l2mBN1o9BK
 1pBzLKR63am6ibR4UhdcTk64aLfYmKt9dQ3WYF7MikkfvROChcqY/ab2iwK35Q6fiq5j45cPhoH
 wKmF6jjpw3EqNXlhuc1R09sHth4+/XE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE4MiBTYWx0ZWRfX3gjKmFZg82tm
 WhmcaUzAJKLHPHnqIbwA7usGnWwt6tbnQB3rzGm7uIN3PDJLam5pL6jR7BXqpOmWKdJ6MDCSrmy
 GPAl26X+IYSnx6x85ra1y/eONoa+VBbTXAjRc8Z/OBj3JwoPn4BcBFuZvLOMCJ0pSEHs/yQhrWO
 m52C3rMOvkMBIZWM4kH/xEp2kJdqvkQx98iEd3P4Nr9EuEH/Cn/WTPq2M5oH/Jc52tpdb29qwn7
 sogmLzhXNDGi/kNwNZYXOWkt8Pp11bfOi87vI+WTeleRN5rHAyHFSNmhskOd7QJzJbQRWdagUqm
 pPK3r4guRqRA5DP+BwkuW50Hk4KQBG3JBnDUMEdTwxvyh7gfB8aTtliaOvkAQzqgi7M6nYRByAA
 aeW9jDcK2VCnDQZ5kxaaRvCbnve+i6OLcwrc9LGBtNBO9CBpPB1OaQfvVZ12QjNYDfnd9PIYjSz
 9nDNZowjkFvLVNPnpNg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110182

The EUD hardware can support multiple High-Speed USB paths, each connected
to different USB controllers. The current implementation uses a single
chip-level role switch, which cannot properly handle multi-path
configurations where each path needs independent role management. Since
EUD is physically present between the USB connector and the controller,
it should also relay the role change requests from the connector.

Restructure the driver to support per-path role switches and remove the
chip-level role switch. Additionally, as EUD need not modify the USB
role upon enabling, remove the unnecessary role switch call from
enable_eud().

Reviewed-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 100 +++++++++++++++++++++++++++++-------
 1 file changed, 81 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 03d1c200658c..48a4441b0c9c 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -44,12 +44,15 @@ static const char * const eud_port_names[] = {
 struct eud_path {
 	struct eud_chip		*chip;
 	struct phy		*phy;
+	struct usb_role_switch	*controller_sw;
+	struct usb_role_switch	*eud_sw;
+	enum usb_role		curr_role;
+	char			name[16];
 	u8			num;
 };
 
 struct eud_chip {
 	struct device			*dev;
-	struct usb_role_switch		*role_sw;
 	void __iomem			*base;
 	struct eud_path			*paths[EUD_MAX_PORTS];
 	phys_addr_t			mode_mgr;
@@ -123,7 +126,7 @@ static int enable_eud(struct eud_chip *priv)
 	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
 			priv->base + EUD_REG_INT1_EN_MASK);
 
-	return usb_role_switch_set_role(priv->role_sw, USB_ROLE_DEVICE);
+	return 0;
 }
 
 static int disable_eud(struct eud_chip *priv)
@@ -270,12 +273,15 @@ static irqreturn_t handle_eud_irq(int irq, void *data)
 static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 {
 	struct eud_chip *chip = data;
+	struct eud_path *path;
 	int ret;
 
+	path = chip->paths[chip->port_idx];
+
 	if (chip->usb_attached)
-		ret = usb_role_switch_set_role(chip->role_sw, USB_ROLE_DEVICE);
+		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
 	else
-		ret = usb_role_switch_set_role(chip->role_sw, USB_ROLE_HOST);
+		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_HOST);
 	if (ret)
 		dev_err(chip->dev, "failed to set role switch\n");
 
@@ -286,17 +292,39 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static void eud_role_switch_release(void *data)
+static int eud_role_switch_set(struct usb_role_switch *sw, enum usb_role role)
 {
-	struct eud_chip *chip = data;
+	struct eud_path *path = usb_role_switch_get_drvdata(sw);
+	int ret;
+
+	/* Forward the role request to the USB controller */
+	ret = usb_role_switch_set_role(path->controller_sw, role);
+	if (ret) {
+		dev_err(path->chip->dev, "failed to set role %s for port %u: %d\n",
+			usb_role_string(role), path->num, ret);
+		return ret;
+	}
+
+	path->curr_role = role;
 
-	usb_role_switch_put(chip->role_sw);
+	return 0;
+}
+
+static void eud_path_role_switch_release(void *data)
+{
+	struct eud_path *path = data;
+
+	usb_role_switch_unregister(path->eud_sw);
+	usb_role_switch_put(path->controller_sw);
 }
 
 static int eud_init_path(struct eud_chip *chip, struct device_node *np)
 {
+	struct usb_role_switch_desc role_sw_desc = {NULL};
+	struct usb_role_switch *sw;
 	struct device_node *controller_node;
 	struct eud_path *path;
+	const char *dr_mode = "";
 	u32 path_num;
 	int ret;
 
@@ -327,14 +355,57 @@ static int eud_init_path(struct eud_chip *chip, struct device_node *np)
 				     "failed to get controller node for path %u\n", path_num);
 
 	path->phy = devm_of_phy_get_by_index(chip->dev, controller_node, 0);
-	of_node_put(controller_node);
-
-	if (IS_ERR(path->phy))
+	if (IS_ERR(path->phy)) {
+		of_node_put(controller_node);
 		return dev_err_probe(chip->dev, PTR_ERR(path->phy),
 				     "failed to get PHY for path %d\n", path_num);
+	}
 
 	chip->paths[path_num] = path;
 
+	of_property_read_string(controller_node, "dr_mode", &dr_mode);
+
+	if (!strcmp(dr_mode, "host"))
+		path->curr_role = USB_ROLE_HOST;
+	else if (!strcmp(dr_mode, "peripheral"))
+		path->curr_role = USB_ROLE_DEVICE;
+	else
+		path->curr_role = USB_ROLE_NONE;
+
+	/* No role switch needed for fixed role controllers */
+	if (path->curr_role != USB_ROLE_NONE) {
+		of_node_put(controller_node);
+		return 0;
+	}
+
+	sw = usb_role_switch_find_by_fwnode(of_fwnode_handle(controller_node));
+	if (!sw) {
+		of_node_put(controller_node);
+		return dev_err_probe(chip->dev, -EPROBE_DEFER,
+				     "Failed to get controller role switch for path %d\n",
+				     path_num);
+	}
+	path->controller_sw = sw;
+
+	of_node_put(controller_node);
+
+	role_sw_desc.fwnode = of_fwnode_handle(np);
+	role_sw_desc.set = eud_role_switch_set;
+	role_sw_desc.driver_data = path;
+	snprintf(path->name, sizeof(path->name), "eud-path%u", path_num);
+	role_sw_desc.name = path->name;
+
+	path->eud_sw = usb_role_switch_register(chip->dev, &role_sw_desc);
+	if (IS_ERR(path->eud_sw)) {
+		usb_role_switch_put(path->controller_sw);
+		return dev_err_probe(chip->dev, PTR_ERR(path->eud_sw),
+				     "Failed to register EUD role switch for path %d\n", path_num);
+	}
+
+	ret = devm_add_action_or_reset(chip->dev, eud_path_role_switch_release, path);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 
@@ -361,15 +432,6 @@ static int eud_probe(struct platform_device *pdev)
 	if (!chip->paths[0])
 		return dev_err_probe(chip->dev, -ENODEV, "primary path not found\n");
 
-	chip->role_sw = usb_role_switch_get(&pdev->dev);
-	if (IS_ERR(chip->role_sw))
-		return dev_err_probe(chip->dev, PTR_ERR(chip->role_sw),
-					"failed to get role switch\n");
-
-	ret = devm_add_action_or_reset(chip->dev, eud_role_switch_release, chip);
-	if (ret)
-		return ret;
-
 	chip->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(chip->base))
 		return PTR_ERR(chip->base);
-- 
2.34.1

