Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780C537F010
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784218725; cv=none; b=gKXc7H8Exzpbjlovk6pHxgc1ZsyYvdBhbHKAzROwsHHqGVFYGro5UMLB4NG9u4IXdT+O/4yWRIc6OHesjZpY/gzYp6mT4hD1sdPrI/mu5mr7S8hNKhDcamopcVhZs2o2z7TRILFcGCj4lHlzyQxXJJUR+mzUzlMqc4uTragU1go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784218725; c=relaxed/simple;
	bh=xM69rdwj/4s4KU6DoN0jDrVsnH2NCoFH3DVoSAMRnTQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P7LVzmV8qOKGiVyaHaBhDwR49HwXEqrc8W+RskHaVVK+L6e9prgdCSAYZq3UZkx9LyDGr/5icHz1ekHnt2hkkiPl76YXwjQs6rwMlmPONv0NlzrRUbLTlonHkNlqPHaPh+AlQa1kKyXq42wUKYrAr+SDcAXPA0Pz2n2lPALtwQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UxjjV5cA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kdhottZX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UxjjV5cA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kdhottZX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDKPXI2960024
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iA2Yiw9uzbXh2h9O8pkl6U4Hyg4t6O2C/nSL7Zx+AZM=; b=UxjjV5cAYc4dm11p
	NTuTvZnrsFOqxPZILMOsJaFgQDrpoZYqim40h89ov7KLgMxLtsmx84PtEqDHsS4p
	yPkK2R00/3fnKa8bpxFqjLnYKESFx4ZsWq4LNefkhOYMm+IzYtUjTtn/N4qCA36I
	4zaBEq6R5wCGQ9llAKuZwcRRsNBvvI4Wa2iTAL47aEihx2W6oV2PuGVOOeN7Nb04
	kOsGcgArOHBz8nQXJ70cTp119vMJ08++1Fy8rv6gwnjDQXpMnW+/eXwG8pZotkOM
	Wo/HCysdfzirKxO6uvYQ+tcXFhw6AE/9jKb4hoENi7bmWn0erKneee1sIXz7JsaG
	NO3kjg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feym1905d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:18:38 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8f1e4e0eac1so89776406d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 09:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784218718; x=1784823518; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iA2Yiw9uzbXh2h9O8pkl6U4Hyg4t6O2C/nSL7Zx+AZM=;
        b=kdhottZXjKTZUFdtdCuB4QtiiTW9+OEYbzW4pK2VxER8kjttrXsJ+1pMYmcLtmj2q3
         fbRu6toNf8RNWnVb2yR57ga/JcZlxRDxoLWeq5ZpVs1D24NCbT7+Ch2oFMAXRs0Z1lVW
         F7WD4FqjMpzjDvp8bKH5rxxeweVLGY+O6R5qvmFL1i1DV6mE38GgrxABSypEwHUKoPN5
         sxrVZSSmi7gYFr6kUwB8c9bajZeojkOHAqocKp3tyXgwyPrxued4XuBtKLUkbzRnA8Jf
         GuOY3J59DUoouQU3/7wB9DCUZgAVGXdDzHXJ2X8S9bwPZ7HxnxXEBSIFZ/S/JQWUzuKb
         dcWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784218718; x=1784823518;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iA2Yiw9uzbXh2h9O8pkl6U4Hyg4t6O2C/nSL7Zx+AZM=;
        b=EPUXaFv3lmrtDFof3LtW3kQusSuYj09ObjqQzvAFmUsFOmFOKuuXVInkllWQKQnB2S
         6/ULKeQ6ctVGywDjoCf74koe6XoUDX3wPBdtBOiSYcWmY/bnscqr1xqntW73z0wPb9Bh
         2xcp50yDTr6AaxdmyU7XlGNruerTEnTwqSHYA+6QlQVT7KrlffYc521Bh/hIeFIKPRas
         N791W3mlYfdA+gFnm+nRnJKXEBuTDPXUntcyU0c1+zhIKgZL5da8r/8gsepW4Siin4I2
         BoYffbTtwk1ksQ8oqzJ3iqzDLLhC1FPuPJxcp99h3Rf9irVa7Yohgknfs0P09PcpdIpY
         dIrg==
X-Forwarded-Encrypted: i=1; AHgh+Rq+OWBWeK/UKka5dcMU73J2D7NodCe5kHLyjo8C9CeuSoAe0Av/UX5avo33cUGHHc5CvlBRXaSPNxOAgmel@vger.kernel.org
X-Gm-Message-State: AOJu0YzaNjU3N5fjVfYGimNU7SK+sRT9wmUUXAAznmYTOvBz/X9bRUW1
	kII1+a6nrbu4CITI9fllHwwaSuxnarVoetOAKTlPf5Ripc3E7NH6Lsiwm+4Fcb0bRtACmxAQ/lf
	iNlPHFxhCbyXlP3051ggYofUXALnLgGpYSpvXy7XKt/gj50bF+L5xnBezUGVBsmjKb4Bz
X-Gm-Gg: AfdE7cl87w1FtSssisdn801DNqa1TXWVd28yuE8ZdzwlZJM74zYXILyK4lavtwetXu4
	a4Bi4sUvC/kygbkD0/zb/nLBCV6hnjywveBUI4mTS5HJZ2PxkhfE+F89MyHehNErestiXWdoW8S
	VsAC8SSs7sEmdxpdQdhJQpp20Z5anRVFFPGkZSoVGNiKmAjbVpUJyCXREjZw7wFF9wvqjicvymU
	1lGCvkfUXwXOcD2TZ4/w2kkHy69MPBcjJFEqxi5Dg1KuKY9je7lgodxemkOM0FKENJf50gJ9Yow
	bjvaOsf4+U58GPDK7ruvZQsVzPy+2EFOEQ2a9vrz4TcwOYS9Zz38rUgfIiUqroOdq4qdAt2dnpJ
	vFmCaoOLyODEIg83xny85S2jmTULeqCQ66RseGPYCXgupWxNa6UtkggjBRKUawbSt18oeLWUThD
	fDWzCDSnERcqhLtSrxH3uFmu36rE7irN/IIv4XyB5MjGNwDtaAAaY=
X-Received: by 2002:a05:622a:4c0a:b0:51b:efe9:27c0 with SMTP id d75a77b69052e-51e42497dbcmr119476341cf.71.1784218716930;
        Thu, 16 Jul 2026 09:18:36 -0700 (PDT)
X-Received: by 2002:a05:622a:4c0a:b0:51b:efe9:27c0 with SMTP id d75a77b69052e-51e42497dbcmr119475821cf.71.1784218716229;
        Thu, 16 Jul 2026 09:18:36 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c168744bdddsm257262866b.48.2026.07.16.09.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:18:35 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 18:18:24 +0200
Subject: [PATCH v4 07/11] Bluetooth: hci_qca: Embed bt_power in struct
 qca_serdev
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-monza-wireless-v4-7-9b02e6f549d7@oss.qualcomm.com>
References: <20260716-monza-wireless-v4-0-9b02e6f549d7@oss.qualcomm.com>
In-Reply-To: <20260716-monza-wireless-v4-0-9b02e6f549d7@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=KPRqylFo c=1 sm=1 tr=0 ts=6a59045e cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=Z5-lucBUan0SmjtTDS4A:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE2NiBTYWx0ZWRfX2GUiwRm+H/pi
 HEVkBLcE9qZLZ3P6EFihexx1+bZv1B2wHK3mvnpmb2L4ZHboj+ExhpHmVWdxJenPNyOXI4Ba9XJ
 GwARGPyXo3LlNSCPNG9u3HOqr/hyxCTJhlydIc5x4fJ4DF05iuiH81a07R/AWSu7PfRj6PZelR9
 dYRplA91ybhFnqZCsU6GDxCtpME1EIMBZ+B+pqwNGkkbPFTx1zz6lqOBFM7/1tlzo3tVnCgFxSI
 na8g15W9/I0C9ix1OstJT9SliCmF8rO4iDPqFIBFS6q/HPSbko/1HQsTQgo22Vg9DZSV2DW5Pyt
 ZHsSDarH0G6f2iQzwIqxLgWThnSb0wkex9k82SNdlwOabZJJP4EKKYsfXHM4jIJCX2cvPtUj2O+
 yS8GNfYflGmHm44GQXPBZdyvPXgCDM/ZnW7mqMcwDXIlxDvAMCscaCaPCuZ4UJVTIsNgBDqFudT
 09b992SidaqzmK5uUTw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE2NiBTYWx0ZWRfX05JMCIeDhuQD
 dX5ajOQONivHmU5rwjMdE+LIG4OZ7f01uRnuwAaer5TxySL947S3ABJNOx8ktwjGwrQGkxnTK1Z
 Mti0XMoTtKnGezvvKpJ1ahTyW2Qtm8A=
X-Proofpoint-GUID: 2vIuUVUP6XDO8VCCn3bQh2WrOGVI5cvX
X-Proofpoint-ORIG-GUID: 2vIuUVUP6XDO8VCCn3bQh2WrOGVI5cvX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160166

'bt_power' is allocated dynamically only for a subset of SOC types, using a
switch on the SOC type that mirrors the one that follows it. This is about
to become pointless as the power sequencer path (used by M.2 modules) is
independent of the SOC type and needs 'bt_power' populated for any type.

Embed 'struct qca_power' directly in 'struct qca_serdev' instead of
allocating it separately. This drops the extra allocation and its dedicated
SOC-type switch, and removes the need for NULL checks on the pointer.

No functional change intended.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 72 ++++++++++++++++-----------------------------
 1 file changed, 26 insertions(+), 46 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 41e8c302abc2a820022d1783f1fad76b358ae67c..25c4387136245fca25e375951f960d7240116781 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -226,7 +226,7 @@ struct qca_serdev {
 	struct gpio_desc *sw_ctrl;
 	struct clk	 *susclk;
 	enum qca_btsoc_type btsoc_type;
-	struct qca_power *bt_power;
+	struct qca_power bt_power;
 	u32 init_speed;
 	u32 oper_speed;
 	bool bdaddr_property_broken;
@@ -1776,7 +1776,7 @@ static int qca_regulator_init(struct hci_uart *hu)
 	 */
 	qcadev = serdev_device_get_drvdata(hu->serdev);
 
-	if (!qcadev->bt_power->vregs_on) {
+	if (!qcadev->bt_power.vregs_on) {
 		serdev_device_close(hu->serdev);
 		ret = qca_regulator_enable(qcadev);
 		if (ret)
@@ -2242,7 +2242,7 @@ static void qca_power_off(struct hci_uart *hu)
 		return;
 
 	qcadev = serdev_device_get_drvdata(hu->serdev);
-	power = qcadev->bt_power;
+	power = &qcadev->bt_power;
 
 	switch (soc_type) {
 	case QCA_WCN3988:
@@ -2256,7 +2256,7 @@ static void qca_power_off(struct hci_uart *hu)
 		break;
 	}
 
-	if (power && power->pwrseq) {
+	if (power->pwrseq) {
 		pwrseq_power_off(power->pwrseq);
 		set_bit(QCA_BT_OFF, &qca->flags);
 		return;
@@ -2313,7 +2313,7 @@ static int qca_hci_shutdown(struct hci_dev *hdev)
 
 static int qca_regulator_enable(struct qca_serdev *qcadev)
 {
-	struct qca_power *power = qcadev->bt_power;
+	struct qca_power *power = &qcadev->bt_power;
 	int ret;
 
 	if (power->pwrseq)
@@ -2345,7 +2345,7 @@ static void qca_regulator_disable(struct qca_serdev *qcadev)
 	if (!qcadev)
 		return;
 
-	power = qcadev->bt_power;
+	power = &qcadev->bt_power;
 
 	/* Already disabled? */
 	if (!power->vregs_on)
@@ -2417,26 +2417,6 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	else
 		qcadev->btsoc_type = QCA_ROME;
 
-	switch (qcadev->btsoc_type) {
-	case QCA_QCA6390:
-	case QCA_WCN3950:
-	case QCA_WCN3988:
-	case QCA_WCN3990:
-	case QCA_WCN3991:
-	case QCA_WCN3998:
-	case QCA_WCN6750:
-	case QCA_WCN6855:
-	case QCA_WCN7850:
-		qcadev->bt_power = devm_kzalloc(&serdev->dev,
-						sizeof(struct qca_power),
-						GFP_KERNEL);
-		if (!qcadev->bt_power)
-			return -ENOMEM;
-		break;
-	default:
-		break;
-	}
-
 	switch (qcadev->btsoc_type) {
 	case QCA_WCN3950:
 	case QCA_WCN3988:
@@ -2451,10 +2431,10 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		 * the M.2 Key E connector.
 		 */
 		if (of_graph_is_present(dev_of_node(&serdev->ctrl->dev))) {
-			qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->ctrl->dev,
-								   "uart");
-			if (IS_ERR(qcadev->bt_power->pwrseq))
-				return PTR_ERR(qcadev->bt_power->pwrseq);
+			qcadev->bt_power.pwrseq = devm_pwrseq_get(&serdev->ctrl->dev,
+								  "uart");
+			if (IS_ERR(qcadev->bt_power.pwrseq))
+				return PTR_ERR(qcadev->bt_power.pwrseq);
 			break;
 		}
 
@@ -2465,8 +2445,8 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 			 * let's use the power sequencer. Otherwise, let's
 			 * drive everything ourselves.
 			 */
-			qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->dev,
-								   "bluetooth");
+			qcadev->bt_power.pwrseq = devm_pwrseq_get(&serdev->dev,
+								  "bluetooth");
 
 			/*
 			 * Some modules have BT_EN enabled via a hardware pull-up,
@@ -2474,21 +2454,21 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 			 * through the power sequence. In such cases, fall through
 			 * to follow the legacy flow.
 			 */
-			if (IS_ERR(qcadev->bt_power->pwrseq))
-				qcadev->bt_power->pwrseq = NULL;
+			if (IS_ERR(qcadev->bt_power.pwrseq))
+				qcadev->bt_power.pwrseq = NULL;
 			else
 				break;
 		}
 
-		qcadev->bt_power->dev = &serdev->dev;
-		err = qca_init_regulators(qcadev->bt_power, data->vregs,
+		qcadev->bt_power.dev = &serdev->dev;
+		err = qca_init_regulators(&qcadev->bt_power, data->vregs,
 					  data->num_vregs);
 		if (err) {
 			BT_ERR("Failed to init regulators:%d", err);
 			return err;
 		}
 
-		qcadev->bt_power->vregs_on = false;
+		qcadev->bt_power.vregs_on = false;
 
 		qcadev->bt_en = devm_gpiod_get_optional(&serdev->dev, "enable",
 					       GPIOD_OUT_LOW);
@@ -2522,10 +2502,10 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 
 	case QCA_QCA6390:
 		if (dev_of_node(&serdev->dev)) {
-			qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->dev,
-								   "bluetooth");
-			if (IS_ERR(qcadev->bt_power->pwrseq))
-				return PTR_ERR(qcadev->bt_power->pwrseq);
+			qcadev->bt_power.pwrseq = devm_pwrseq_get(&serdev->dev,
+								  "bluetooth");
+			if (IS_ERR(qcadev->bt_power.pwrseq))
+				return PTR_ERR(qcadev->bt_power.pwrseq);
 			break;
 		}
 		fallthrough;
@@ -2549,14 +2529,14 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		}
 	}
 
-	if (qcadev->bt_power->pwrseq) {
-		bt_en_available = pwrseq_is_controllable(qcadev->bt_power->pwrseq);
+	if (qcadev->bt_power.pwrseq) {
+		bt_en_available = pwrseq_is_controllable(qcadev->bt_power.pwrseq);
 		if (!bt_en_available) {
 			/* The host cannot gate the BT power individually.
 			 * Treat it as always-on and drop the pwrseq handle.
 			 */
-			pwrseq_power_on(qcadev->bt_power->pwrseq);
-			qcadev->bt_power->pwrseq = NULL;
+			pwrseq_power_on(qcadev->bt_power.pwrseq);
+			qcadev->bt_power.pwrseq = NULL;
 		}
 	}
 
@@ -2594,7 +2574,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 static void qca_serdev_remove(struct serdev_device *serdev)
 {
 	struct qca_serdev *qcadev = serdev_device_get_drvdata(serdev);
-	struct qca_power *power = qcadev->bt_power;
+	struct qca_power *power = &qcadev->bt_power;
 
 	switch (qcadev->btsoc_type) {
 	case QCA_WCN3988:

-- 
2.34.1

