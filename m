Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95BB4EC65C
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 21:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790717726; cv=none; b=MbrYw+CsKSWLiNDB9OemBk39kjLGTYX0uT33FGZZqegjumyBePaOptWDaFXHfYB+DYqffMxyG/ImFIf2WwMq/HGzuz/tnzHmH8SuswKSbtfWvCMIN7QS8yPwkLxl4WpzALiO+PCDC6UAeGx2qOwDyqIxKXj6hxBlOztRbekmarQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790717726; c=relaxed/simple;
	bh=0MKUhSbsp5faC5piKaIRV4wM0B9K/Hpf0LePl5dcI14=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=L6NtuOflwFz/Wdh0mBofuQqzKX58KXJfbvtQ7N0/Uj9UkpCAjkStfCpGAn3AET/9uMLaI0dmgGuZ+nBQnrta6thkW6d9VjACVMlVRDm8XfZM2qpmqb+Q9FHXZsrhhqALVfUKYAMUpGg0LqpO22cTR7yH2ZhLpDfk97KaH3mw06c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CeG+QuxD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CLgrTRb2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CeG+QuxD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CLgrTRb2"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68THeuE03842845
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 21:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=j/Lj3EzaynG
	KsIUEfNURXhZuM92QDUe3E615mrhbvag=; b=CeG+QuxDM1jFQKWzkYFarMrPbxZ
	ocjzJ+HlmcyINHuvV3Q+/mYyWr9qePCNdXlUqEaqS2wfEAZJ8uTNdMjWU2czmNhA
	aSesM30Ax84NdyjgZTC9gdbfRkqfik2hY9QPqoTQ8FTj+LYon477Rk5inkCFltQb
	xfYAVe3GKfIJoKbWAq9jqkaOdDp/+26QcVNngcx16UmgVuqJJSTiPNctxYzs3vVJ
	QJbDTuSUBGxkkBwzFvqhz2VoWz/VpcHgZdCMiFrD/gxy4gVDjLEcuk9fjD7DkFQI
	1gyUh+70quN/jBZY/Cgef1M24tjHthjb3m40ek3MFv+qwdXf7LYTe2wfhDA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0b0vb1y2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 21:35:22 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-349ffa249bdso3899824eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 14:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790717721; x=1791322521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j/Lj3EzaynGKsIUEfNURXhZuM92QDUe3E615mrhbvag=;
        b=CLgrTRb2qAzpLB9bt/QieqEmglp2kDOfkQWWaDkd2odssZOVC5Vm5o2tAy79qxCgpY
         gKe9Xd6MtVHlw5USj4nQpQ9t8aMbfAvmlJoEJv0xejj9ZfEVuZublyaFPk96gpJt4aEt
         Yw0OQalSZWtJeg0DL4/J9dmY33ePK85gl7bpA0UbVhQrCgyd6j0A2vOiw39vL6B5m9VA
         S/seqaTGJ2t+ik0jv00zNwgOs38NNVmVkou+A7t5A905YASfBVPhWVWVasUuRPa1mrib
         U6y4yteLtd/6ugZSrOoEVaI2rdXceR3gevS9Z0wdce7VYbbWjp3gOc4Kq8VE6ttfGX+C
         ocAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790717721; x=1791322521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j/Lj3EzaynGKsIUEfNURXhZuM92QDUe3E615mrhbvag=;
        b=AWKreUi83G5BCIALXtZke9toEpKJQGhHXiOAcfyccpsnAFYJ15T5tFFJUgmIbelWiY
         DVjPJ1NzjR5totPFzQIjB8CLf9X/QUZPvnXfkJajJL5631+fbBHTZ5O2sxLTGfw9CxbU
         fzaDloFmv00DsCwEtqXwtil4H4MB+VLtmN7AkjscJpyWYz5dt1yiiNH6f5MxqLcVZCVi
         9ywQTRKMEU3hw3m0lx5VRMTM/mVNOf5Cm0fZdWcr1Q9eyHtDgG0urUvSB5dGxmEzQKIG
         KVqDw4oRLM8g/kYktlPpfsBGMwT1cYlrLJJIiIDl90pSpgyobc0KevCiB1ehTp7kkOb2
         Mn5A==
X-Gm-Message-State: AFq9FYLFdM29u7jTfexJjSueg3i/F0fftr+fBhNEa9T/mGFSD8a4+MDE
	a7jWf691RHP3gv1XZKCcP6b+e757uL4jadX5uGHGNYadbH/RNjmoRDq7qYKl65h6leVjx49s/4u
	zV2uf9Xlj+zMdpeDf7u8f1lyPd3e5oDbGi7xjvjdafOtO2XmQL/cYkcUr3Ch5mQBdflCd
X-Gm-Gg: AYBFou35LnTWGvEWJVM00GRaFkaPp0Oj4ibyTUnLh20QSdX6QIX/fZPPeEaBygHmI9/
	MI/SfejJD+3q2ySFg8nqQZU3MkEaAB0M85EJMlAWPQSrD2yt7yeFXzfFE2h3d398By4nD4AhpIV
	GA6gUpyID/mO0iIyYph9OgQXvyHPHD2ha82mWs59ZHu4DsURBoab7DbSmTJP10bg+/DEZK/PfRv
	cqkmk4g8GbjHZYM2jVNaLetO/qFzJFPbdW/64WjsH+HFjwAQjv/ngFLRD74ST90u34Urrl3i1q8
	A9b6jXe2b7TuNLFNjy+W3qx+dezeLndphTNXbDWTy5QPpUPn34Vz/o9m72RFJPvhbJBXuC77FV9
	1EUoSrKoWJTBT8Riji6JsvCoaWNeixQHckTj47TNmdoddd0ljhCXD
X-Received: by 2002:a05:7301:4245:b0:343:bcfc:fd1 with SMTP id 5a478bee46e88-34c67da0d8emr585643eec.39.1790717721292;
        Tue, 29 Sep 2026 14:35:21 -0700 (PDT)
X-Received: by 2002:a05:7301:4245:b0:343:bcfc:fd1 with SMTP id 5a478bee46e88-34c67da0d8emr585618eec.39.1790717720729;
        Tue, 29 Sep 2026 14:35:20 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c391e25e1sm1512570eec.30.2026.09.29.14.35.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 14:35:19 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@kernel.org>
Subject: [PATCH v9 4/8] usb: misc: qcom_eud: add per-path role switch support
Date: Tue, 29 Sep 2026 14:35:09 -0700
Message-Id: <20260929213513.2401005-5-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: LUYP3PIMZyqdmUN_TGJmcHhnUTz3yVRU
X-Proofpoint-GUID: LUYP3PIMZyqdmUN_TGJmcHhnUTz3yVRU
X-Authority-Analysis: v=2.4 cv=Z+55j3RA c=1 sm=1 tr=0 ts=6abc2f1a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KEXfGuhMotGc95kIUyEA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4NiBTYWx0ZWRfXyRxNtyJcNv6t
 5Im1I8f01rlmKVy/J+zhoagxHTOkVqAmjZY1YAKHby2oO08kVnoKzmnR6GYzuyXrxD9gNqtN2B3
 sEtcZHg4uPY+jXDVGRXBUcVMvyUD0iw0Y26Xrvlcmse2MYTUz6QWM2X6JL7oTRUeDUPkChYpDiC
 1sRGAwAdJcL0ei2SP5+fYgR8Z08Yu2mSfM5EK+BsnXexHPZ4v1wL7a/HyC4i5rGDE0uUXlDzejA
 Ys6XrlfUQqQPcIIcOqavV79Fx4zYYHyYpT4/B3Dx/GBhIKvf/Y6Kgy0PNWEM4in7Hn4K8MamLWU
 WqfaO1+rPjv429ygNwnBMWocj5k63W3WWeZfuFYCzUL//SJh4kPilXptmh0Diy1bfqASOUXIyej
 Aokk2vxNQjSXVX0xqbYOkSjT7xQD6lxCWt+6O80C/WjyQFnA+77hPwYaO6+J225ev7/s+NlmB8j
 PFsxHGUN9zyqqYOM4pQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4NiBTYWx0ZWRfX+JJnSKBo9EPo
 9IAdIriSGjbFNumMOgXS/cyvtOJXsT45G7/JPRdFLMKXjHu8f5rrg1Anwgd91mwj9GVOHNLm+VM
 i8JzaTztNPjboy3RwssZBd7ivhQcHOQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290086

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
 drivers/usb/misc/qcom_eud.c | 107 +++++++++++++++++++++++++++++-------
 1 file changed, 88 insertions(+), 19 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index a3afa3bb9348..48e474bdf818 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -45,12 +45,16 @@ static const char * const eud_port_names[] = {
 struct eud_path {
 	struct eud_chip		*chip;
 	struct phy		*phy;
+	struct usb_role_switch	*controller_sw;
+	struct usb_role_switch	*eud_sw;
+	struct device_node	*np;
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
@@ -124,7 +128,7 @@ static int enable_eud(struct eud_chip *priv)
 	writel(EUD_INT_VBUS | EUD_INT_SAFE_MODE,
 			priv->base + EUD_REG_INT1_EN_MASK);
 
-	return usb_role_switch_set_role(priv->role_sw, USB_ROLE_DEVICE);
+	return 0;
 }
 
 static int disable_eud(struct eud_chip *priv)
@@ -271,12 +275,15 @@ static irqreturn_t handle_eud_irq(int irq, void *data)
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
 
@@ -287,17 +294,41 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
-static void eud_role_switch_release(void *data)
+static int eud_role_switch_set(struct usb_role_switch *sw, enum usb_role role)
 {
-	struct eud_chip *chip = data;
+	struct eud_path *path = usb_role_switch_get_drvdata(sw);
+	int ret;
+
+	/* curr_role tracks the role from EUD's point of view */
+	path->curr_role = role;
+
+	/* Forward the role request to the USB controller */
+	ret = usb_role_switch_set_role(path->controller_sw, role);
+	if (ret) {
+		dev_err(path->chip->dev, "failed to set role %s for port %u: %d\n",
+			usb_role_string(role), path->num, ret);
+		return ret;
+	}
 
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
+	of_node_put(path->np);
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
 
@@ -328,14 +359,61 @@ static int eud_init_path(struct eud_chip *chip, struct device_node *np)
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
+	/* No role switch needed for fixed role controllers */
+	if (!strcmp(dr_mode, "host")) {
+		path->curr_role = USB_ROLE_HOST;
+		of_node_put(controller_node);
+		return 0;
+	}
+
+	if (!strcmp(dr_mode, "peripheral")) {
+		path->curr_role = USB_ROLE_DEVICE;
+		of_node_put(controller_node);
+		return 0;
+	}
+
+	path->curr_role = USB_ROLE_NONE;
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
+	path->np = of_node_get(np);
+	role_sw_desc.fwnode = of_fwnode_handle(path->np);
+	role_sw_desc.set = eud_role_switch_set;
+	role_sw_desc.driver_data = path;
+	snprintf(path->name, sizeof(path->name), "eud-path%u", path_num);
+	role_sw_desc.name = path->name;
+
+	path->eud_sw = usb_role_switch_register(chip->dev, &role_sw_desc);
+	if (IS_ERR(path->eud_sw)) {
+		usb_role_switch_put(path->controller_sw);
+		of_node_put(path->np);
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
 
@@ -352,15 +430,6 @@ static int eud_probe(struct platform_device *pdev)
 
 	chip->dev = &pdev->dev;
 
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

