Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97754443E3F
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 16:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786983439; cv=none; b=sG/g7Zh48psXtl6dgYYJVWRXWXkd90pbgtmWn6jQ0EjWSBRIPt03OVQt9Pf2uvep7SuVDcVGUFdjLblGCY+h9+TQY7izdIzfn8vshnFQhMTgzgtVRgru5KfkunpvUC7nBeUyVCnISN1LnKKuhPlwQYKjMjWlyHEV9+d5sPQ2Dlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786983439; c=relaxed/simple;
	bh=q6ZulUkewvTtweiAHcMjYBKr7bdgqkM5bp4/CsEC1bs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hCOzFVVM3vZYsi3QMFRaCJI9FOcltjS2ThqkAiPcna5JfaN/h5+oqOkibHMeyjlTfd93JIn1PtQ5cQ18nPtHTZny6Kc9xREhMKc8CV09Dcq1Ws8JoO+NidnJ1mQruEGO8knoYZu0CP+IkguQa4OseIEVJWulll7BUDpnM6o6yvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gdPynoD5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BsdRUdlM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gdPynoD5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BsdRUdlM"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HFYeSU3790544
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 16:17:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KIalLVWFAC34M1QLdTBho6qDE8wma2UgEvTyc9q/JKY=; b=gdPynoD5V9dpNaz8
	ILwPFd5f1Ram6AmoteHzh8gFUCsK1QOnykji8KZXE098vd12IqHQENA+1BtZ04QB
	6p+CB+38rGCBoF4vWOakAPSuqPmk9iAjyJwjSuKE5n28D/rlft0MHDV/wAX0SbjK
	JmnUiKG4T8n3zGTgg65CAyMYjo8SI/i8Ub7IHFilri0fCuoBnLrL/LIlqMcdEUhF
	c+eO+kQB2VpWh5A6OltUbfImBVOYvBsFWXOAxu6JMVWsnZujKzlI63lY9hzueuUe
	9wWD/FddODVY0mt8DNPXMqJdlpLP3JuNYUE9TgrfXxwrFdCF4iGWKbvJgQrXQAXc
	bnbEMQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3y7ksrmn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 16:17:14 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so4754896a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 09:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786983434; x=1787588234; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KIalLVWFAC34M1QLdTBho6qDE8wma2UgEvTyc9q/JKY=;
        b=BsdRUdlMOM858xUfDs00smLOCGKOmtcL8XyVyfiABVmDWunp2ubK7GeeHbpMy5knMo
         OOlULs1NItsFNbL7x2GZP8vF+pmwlC+8MvTTinHwYrJ5xIQQS0x3MZ0E8R0KxUOhs0rh
         p3EZmve+OoScJFCah5MbQw2BQMA+214gIyzHvMCGdkb5A2IGVZUkBYvxEX0wc8VMLJKn
         9upMlZBsy79J7Uw6oYpCE7Xo8KlbrFsAhYHTG8CskfIpi0EFjMElVF9VdEm6ibPsj4PM
         4rq0JRjdCgPN+I9XHGVW8Gu2LXvy1rCD7d2J6Ij9nCVylbKW5s2AW1LsSdjaCxcvxV+G
         SmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786983434; x=1787588234;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KIalLVWFAC34M1QLdTBho6qDE8wma2UgEvTyc9q/JKY=;
        b=aaToLD88K81keT37vWfiedCBGjzo5idW+TV/tBVEzrJ1EmB3yZuN6d6YN/D5w9FYii
         5VAfEsH49NckgVXxGISZGZyaHVi0AlScimErlKySV3lKOG6Iy37tmNYHDTcmBlAPouDz
         lFFUg6ZDvbinZnkriOAlikurR6G4tRwum59MjMI2ExrMd/J39+z92KwZwfLDECtuBK8t
         zxBOd9zmwnQI/JWuCLhw4dHUnMobSIn6ZvNRzdhJwbFBrWi5RCfo0rVs451pnZfv/0Zb
         W9KWRmtSvyzz3lR1Jz61DwXoxAPoBfq/uWN+iAeXWN3v1FsDWyk9vxT9KxKrZfnoXx8w
         Tqkg==
X-Forwarded-Encrypted: i=1; AHgh+RpBmXlXenb3edDOuad4ogPB8J22YSuQBTIK4volEkhHdBNP2m1peJKAXTzXg5WcT8tn2R0EMaCF+G10sege@vger.kernel.org
X-Gm-Message-State: AOJu0YxloHCILoPesMKpag31eKjrj/2TeM4xNetixb2Se+pDTBF2Zib5
	CTitQEmV6U8cl2075pXGUG6tizKr58QTithEIwj1RvNSx1F/YhOQSNTN2xAapxxK/lVs7mLgrxv
	XVbyHcWS5az3OLkpWEHWydXjUf4ZeX9QS71Zv4ILesQ1SHSHu7q2Q5NkL3Ic+pi4TF56DTeTngX
	TX
X-Gm-Gg: AR+sD11BPmdOuQJXAolNKXL4VZMPiJhcdhzpxaTBTfnxQQgnGkGxOZwAjZamw7EQSzg
	LwLPZen4L09yoob/KDTJYXzFG7mlzaY89C4EGYOWF33NZLvxZ6UIxodq8XmSqUYfd5LIV5lyYu/
	tCSPK9TxSQGRst87snwcCmIjcel5oaGMWFYwjN5jC80WV/+X9Tu1bSTUK739EJJGfh7oKr1qg6U
	1lcBMilgtOdX+4IZpJr0w+a+w51JeMkofLNqk0mETuiJGi108lJDkM00Oe/JwlhuTxT5t0pziKS
	hdrEDAJnQi1X9kF1lbF/evJ5TQ70xjDrZZuMfwzonZDKF5qBSDeq1SToW74T++yE1wzS92VMrXh
	WN+fiGap+4VHJfranwlPT+deHuCUuhBdZYA==
X-Received: by 2002:a05:6a00:2308:b0:84a:60a4:2651 with SMTP id d2e1a72fcca58-84fddfa84f0mr24531226b3a.6.1786983434299;
        Mon, 17 Aug 2026 09:17:14 -0700 (PDT)
X-Received: by 2002:a05:6a00:2308:b0:84a:60a4:2651 with SMTP id d2e1a72fcca58-84fddfa84f0mr24531167b3a.6.1786983433738;
        Mon, 17 Aug 2026 09:17:13 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851b6fc0fd9sm563035b3a.45.2026.08.17.09.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 09:17:13 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 21:46:53 +0530
Subject: [PATCH v2 2/2] spi: qcom-geni: Use GPIO to notify master of SPI
 target activity
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-use_gpio_to_notify_master_of_spi_target_activity-v2-2-94d1eff3175f@oss.qualcomm.com>
References: <20260817-use_gpio_to_notify_master_of_spi_target_activity-v2-0-94d1eff3175f@oss.qualcomm.com>
In-Reply-To: <20260817-use_gpio_to_notify_master_of_spi_target_activity-v2-0-94d1eff3175f@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: chandana.chiluveru@oss.qualcomm.com, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786983418; l=3922;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=q6ZulUkewvTtweiAHcMjYBKr7bdgqkM5bp4/CsEC1bs=;
 b=eF12KjYjAf7knaJPobteGNtq2TN+VdAiVkpmrhYSEJ4rhxzhmLy6OVkTuQB/J7QwIhRfxftQI
 boctXHS872jAGMyppYkYthvIsAydoPxlsx8zv41N2fcS16DVcPAMozP
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: 2nSRhm877RBCn03sSYiTxdekGuSnZlMD
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEyNSBTYWx0ZWRfXx+wosy4ESu9+
 oq25jeeKDdwiiSwaCFX1LokB2kpBmHhnfkKSA0olDLFdVyzlV9fySN2ihMPP1I6lCHHjYDPF215
 uYnQS5raRWBio8qyMv4SO0LNIdxou2w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEyNSBTYWx0ZWRfX5ZHWGgd/FGnl
 1rwokGAPL5UUMaA9xv7UQ2T4x5Atca7IqyNfD5vNLWLOsrRnq/juNKa4qC/HrxjpD7MsNKzNP32
 TJ2jBPO2AEeunbViR2AW0xu1j79y3W7lQkrb1eXykInCFPaqxpwMAq0IlCHYAEgxiuiloOcFWZA
 I8xVFDuTuX61KMsl7tQ6rMO0VpwGNkkm58pwlYX0M1nu+151oCsAfHakkU89lPJr7AqST4mcXt6
 uWqkeXWYZCiblaJWhtBvJa3h1SthEevJ3X2V3rlDe3yNXTauHscCrTzYZ496xy0wT5aYmz/E/zy
 gW4f0kaHGqJn7sCj2yrejhR++jRxsjINSmiEvYCr0IXTq0o7IvanwhE2//lLVD7CziqDVZbah1P
 jliGVM/EddHLRmhNe661OMEFx+T34AnfM5hl1Mm51TLdCM6a96YXDkKpSrkF+P0FjqgpqF5qYmE
 lXIw3atxXg8o8OjyIIA==
X-Authority-Analysis: v=2.4 cv=HYEkiCE8 c=1 sm=1 tr=0 ts=6a83340a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Fo9EMwYq_bmgDG0ZVhAA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 2nSRhm877RBCn03sSYiTxdekGuSnZlMD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 malwarescore=0
 spamscore=0 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170125

When operating in SPI target mode, the GENI controller relies on an
external GPIO to notify the SPI master about the target's active state.

Add support for an optional ready GPIO that is asserted when a target
transfer begins and deasserted when the transfer completes, is aborted,
or hits a timeout. This allows the target to explicitly signal its
availability to the master and ensures the GPIO is released in all error
and completion paths, preventing the master from observing a stale or
incorrect target-ready indication.

The ready GPIO is intentionally made optional and is requested only
when target mode is enabled. This preserves existing behaviour for
systems that do not require the signal and avoids regressions on
deployed platforms where the GPIO is already controlled from userspace.
Targets without a ready GPIO continue to operate unchanged by using
devm_gpiod_get_index_optional().

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi-geni-qcom.c | 25 +++++++++++++++++++++++--
 1 file changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-geni-qcom.c b/drivers/spi/spi-geni-qcom.c
index d262206ed663..5ebbeac70382 100644
--- a/drivers/spi/spi-geni-qcom.c
+++ b/drivers/spi/spi-geni-qcom.c
@@ -8,6 +8,7 @@
 #include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
 #include <linux/dma/qcom-gpi-dma.h>
+#include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/log2.h>
@@ -113,6 +114,7 @@ struct spi_geni_master {
 	struct dma_chan *rx;
 	int cur_xfer_mode;
 	const struct geni_spi_desc *dev_data;
+	struct gpio_desc *target_gpio;
 };
 
 static void spi_slv_setup(struct spi_geni_master *mas)
@@ -171,6 +173,9 @@ static void handle_se_timeout(struct spi_controller *spi)
 	xfer = mas->cur_xfer;
 	mas->cur_xfer = NULL;
 
+	if (spi->target && mas->target_gpio)
+		gpiod_set_value(mas->target_gpio, 0);
+
 	/* The controller doesn't support the Cancel commnand in target mode */
 	if (!spi->target) {
 		reinit_completion(&mas->cancel_done);
@@ -928,8 +933,12 @@ static int spi_geni_transfer_one(struct spi_controller *spi,
 	if (mas->cur_xfer_mode == GENI_SE_FIFO || mas->cur_xfer_mode == GENI_SE_DMA) {
 		ret = setup_se_xfer(xfer, mas, slv->mode, spi);
 		/* SPI framework expects +ve ret code to wait for transfer complete */
-		if (!ret)
+		if (!ret) {
+			if (spi->target && mas->target_gpio)
+				gpiod_set_value(mas->target_gpio, 1);
 			ret = 1;
+		}
+
 		return ret;
 	}
 	return setup_gsi_xfer(xfer, mas, slv, spi);
@@ -969,6 +978,8 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
 			if (mas->cur_xfer) {
 				spi_finalize_current_transfer(spi);
 				mas->cur_xfer = NULL;
+				if (spi->target && mas->target_gpio)
+					gpiod_set_value(mas->target_gpio, 0);
 				/*
 				 * If this happens, then a CMD_DONE came before all the
 				 * Tx buffer bytes were sent out. This is unusual, log
@@ -1012,6 +1023,8 @@ static irqreturn_t geni_spi_isr(int irq, void *data)
 		if (!mas->tx_rem_bytes && !mas->rx_rem_bytes && xfer) {
 			spi_finalize_current_transfer(spi);
 			mas->cur_xfer = NULL;
+			if (spi->target && mas->target_gpio)
+				gpiod_set_value(mas->target_gpio, 0);
 		}
 	}
 
@@ -1116,8 +1129,16 @@ static int spi_geni_probe(struct platform_device *pdev)
 	init_completion(&mas->rx_reset_done);
 	spin_lock_init(&mas->lock);
 
-	if (spi->target)
+	if (spi->target) {
 		spi->target_abort = spi_geni_target_abort;
+		mas->target_gpio = devm_gpiod_get_index_optional(dev, "ready", 0,
+								 GPIOD_OUT_LOW);
+		if (IS_ERR(mas->target_gpio)) {
+			dev_err(dev, "Failed to request GPIO: %ld\n",
+				PTR_ERR(mas->target_gpio));
+			mas->target_gpio = NULL;
+		}
+	}
 
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_set_autosuspend_delay(&pdev->dev, 250);

-- 
2.34.1

