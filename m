Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C59C501F40
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 15:42:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788536571; cv=none; b=I7vBxR1OR0znpCi24WjMw8gKh/3kDswLhguzFGQGrxmPJhTwrvBhm+G/07X0tqvHByptMCxrvnjn/v0+pcX1HbkdvfBVPvvFfzihEnCvw/Ag6Ux9wuvbiz8vSSEI+yPm2QoXb7DqhGy0PpgyIJiaFT9pG1DNCnhyDrUxAluXrnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788536571; c=relaxed/simple;
	bh=ql+lzgCyBPEjEvO5d+fZjVYHAWX/V60lJU8VXvadKEE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Psp7ld9oD93lxtAcJcWW1RfG6gvUgHhownRIShXel5OVjJL5II77CbFR+sTmDP4vAIuw8KtY2yQrUuvJ8sSTWAAsz5xSek3V4TtiE0wrx8v7crFac+gm1o7d24RtUZgWVpFQKVhU8i5JnQX0MB2BBYo6y+rO6aUDpSnHunsXezY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G9rAaPex; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WuqIieRd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G9rAaPex";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WuqIieRd"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684EiJ542669624
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Sep 2026 15:42:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MINzBqJ4IAJHoJgZZ9M8ZzzajtUoGcKXgzz7x3DJbF4=; b=G9rAaPexNp2ooVdn
	uu2Vq/+Oz4C+BZX510p9D7XyPn4KqVMjoiW1jUVj/mbJoaUMqQdNg/QRJCYJ4O/C
	or6zcqwEhN9avQ8Rw0sZCTpg6y25VtPXxGo/T+41agBrJARpscxSVaGXzpHehtYe
	k+mjSsrOMzE3fO2myy4s87VM9bn+fNFfvmTu3bUCo1hEqLCjO6zonauA2K7ZFV0r
	hX8uBA1oxSnqb/AVTVg7dfL+7JdyFe9j24v9FhophxnS9SCQrDRUmJQsKjGEXFo1
	bxua11PLWeR8U6DwjTp84mqdvpVzAfVG61XhFQx5ydLz5wP795qx0QPeJqCzO599
	wibaoA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg00yr8gx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 15:42:38 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-980989f5030so362357241.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 08:42:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788536557; x=1789141357; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MINzBqJ4IAJHoJgZZ9M8ZzzajtUoGcKXgzz7x3DJbF4=;
        b=WuqIieRdKkssahH/ozo2uv2t9E7LSU3P7JWyxsoQyQtCErR+yPzvsFJs7nO7Tzslro
         m+k2bBIPnSgvO+LVDaHry17GFRw+Dp+jt42IHTVtvVhytTjA0tcMRDE6lql/UZSQtSo5
         mZwSZAYMYmxm7kCfdUc+rSh1pXSXxsgtOwrhuea49LGapC4yHmrwbsAxqvpSx/d1ZkSU
         UPnWf7v8Vsy9XDgetV/n/+UmqncQWIKJ8YLBfqEy2sUyqqNCNQ3enuPgqfxPOCTss1NB
         a0kcdoRh7ibftYrQcDyd3vI95tyZYfPETXfBprGDxJKYYS/D4zuUwEuUnqzhP+3il1co
         MFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788536557; x=1789141357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MINzBqJ4IAJHoJgZZ9M8ZzzajtUoGcKXgzz7x3DJbF4=;
        b=mDgFomdczWwncE8oDf5sWLENsEFUWTEL19IOcHBPqRiSLdQtM+FopzvgSbnQ2oVuJE
         AnoFZni2RIcuVeDML2vWCxdsKmeZY6kmnshPXlTyD7XTDNecXxBy5wsZv9N2olg9VLRA
         pDE+FwhKpAzmHr/GVUIWk8O5QGBohB+LAhjxva/NhKDHlWWywaNNMFxbmeXhIShuyOn0
         xp6d1ILV9Do3Z4xs/ZxEAHTXe7cMUMCQMKr/RqHxQH5XrgQ3CeA4ZmZZ/Y/y/mcGUdkW
         wlUzkAgXCZwsyo0B4TJHeiU1fMvxG1uyyu0wx5+ZQ7uGNuCXtzNlM5CvvRPI4LnVUtmL
         OH6w==
X-Forwarded-Encrypted: i=1; AKwUvBwINHjYTJjbSeK+YvASwVRve1F43HRqhZH1PGTF3iz9AfMuWB/c8GznmyAG3sSoAMr7d8mLfy4VlE43BgIA@vger.kernel.org
X-Gm-Message-State: AFuF++nPkLIR6G52mdBYjkv6Euxf3qjtkrWIADTNvsonq2kZnQJpQ5QR
	XOkoxo/7KkaN4FD1kwcF2wthm0NOj2bbe3NU+mAsW6SChoTfaYeMiVr89bFK6me5A9RMyR2Zb4f
	YRJ+sN533ysVBbyierMHtlF+xMU4qIRPlAl5QmLwAASZRehBAEMKe9E6p0nfRpecwKkxi
X-Gm-Gg: AYBFou1L5D79dPo3bPOSdt115WYXhzrlBaLvmF+z7W1kbAQcOZkgeiu7OwIUakTD+Z0
	B3E6JMQWEnFTCUFZczkEI0uspEQQ70ohI6FvLMevuql1TKNRgiiZFl65p9tMETgLvxapLlSV0IB
	XnURWr5h9S4kCF3e9hz2AehpYVz1PXQ05wYUp73jzuAoUg6i+bIyONmgmTFNx2QD8fga8C6Is5i
	8hax2//JVVTdVVh3+EtUN8BQj7oXjDkAwt2lOOV0dfe0O4FzAG8a2xNcga2Y7DZafSreTaRChZK
	2Wvqjxp/ijMipiwm/FgDr2ph7g+I0v9mNhGrTtiJsOgZSuceij0NwaElU7mg6tpD1HiniFzJTSo
	mWfCkN1rFntZMtSU5P7Sh34fGlYmfNBN8VrZ/pWPUlTBK2yxjLIb3ZRuWettfIzXQRFAtjApuhu
	rGKokU8G7LuN3Nts/L/A8LOU1YhXxF9be9Ieq2707Udv6GAD5CL2U=
X-Received: by 2002:a05:6102:3e01:b0:785:c3dc:2f5d with SMTP id ada2fe7eead31-78a4aa13b57mr2612960137.9.1788536557184;
        Fri, 04 Sep 2026 08:42:37 -0700 (PDT)
X-Received: by 2002:a05:6102:3e01:b0:785:c3dc:2f5d with SMTP id ada2fe7eead31-78a4aa13b57mr2612933137.9.1788536556685;
        Fri, 04 Sep 2026 08:42:36 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:e90a:787f:72ea:b218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce5533ffbsm160668505e9.3.2026.09.04.08.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 08:42:35 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 04 Sep 2026 17:42:23 +0200
Subject: [PATCH v6 08/11] Bluetooth: hci_qca: Support QCA2066 on M.2
 connector via pwrseq
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-monza-wireless-v6-8-d8c5042b3efd@oss.qualcomm.com>
References: <20260904-monza-wireless-v6-0-d8c5042b3efd@oss.qualcomm.com>
In-Reply-To: <20260904-monza-wireless-v6-0-d8c5042b3efd@oss.qualcomm.com>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE0MyBTYWx0ZWRfX7R1cl0MiyULe
 FoiLHJgLmyNjU0HUXK72LcY/As1dPygksSOO/V5JM6OQTuwukmb2GR2brrHnIIGwm9TryrWsRVV
 Oq5FXXqO/Rh9mKw2n/gKNjAjNKTAwHE=
X-Authority-Analysis: v=2.4 cv=TP11jVla c=1 sm=1 tr=0 ts=6a9ae6ee cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=reVw4oyKNVL6WbIJD7YA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: g-ZvZvoftqJV0ZrF6WStKrNNMUlfX3Oy
X-Proofpoint-GUID: g-ZvZvoftqJV0ZrF6WStKrNNMUlfX3Oy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE0MyBTYWx0ZWRfX0WsIWx6r5E5+
 5Zm5x0C3CD1R3sIThL/HBNIsp9EBjc+M9U2fKF7fmR/pjyzijH18887KOpYLOKmuVWUolahbt49
 DMAuNZiZUP8bLpS25bwpFrMqHqDvjsOvgtNnBmGfa3sVtfAtg2f84lU23/p1H0FYU+EgAs9MZ0m
 NAqvDImEfPPTLCFEiKHa7mT1HkqAFE8fqg9du4fWqXZSU4l/Ly1SDg65Hl3gbbItBtSiKT15R5+
 BYcZxdCF672ZHd7cLgn7kR4XIOacxmi9/VCQT0lfpUhfjR1uPfdCuEd/3X87yVIqlHiykiKAfv+
 sfAPH5yEQGv8wFilFrMqLHmVpzWEpK0an/ik7eu74xST72vywo9kBuN78mcRHfxqOhS/lK0CPsQ
 VmY73gpJzuZzpWZcgiUxO0yw0wknoxvN7VVSnNS6oiaWh1Q06FH+IO+hJPJabpCOzJ3BTKv1OXf
 EX7GbI46iHhRC4pJoCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040143

For QCA2066 (and other QCA chips) on M.2 connectors, the UART enable is
controlled by the W_DISABLE2# signal managed by the pcie-m2 power sequencer
rather than a dedicated BT enable GPIO.

When the serdev controller has an OF graph (indicating it is connected to
an M.2 connector), acquire the 'uart' pwrseq target from the connector's
power sequencer and use it to control BT power instead of the bt-enable
GPIO. This is factored out into qca_serdev_get_m2_pwrseq().

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 47 +++++++++++++++++++++++++++++++++++----------
 1 file changed, 37 insertions(+), 10 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 30586120c4a73a50a29af235b511c3ae97960e27..db0a968dfb00fa6f1abb86a3f6d1be89dfe80c6a 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1875,6 +1875,9 @@ static int qca_power_on(struct hci_dev *hdev)
 			/* Controller needs time to bootup. */
 			msleep(150);
 		}
+
+		if (qcadev->bt_power.pwrseq)
+			pwrseq_power_on(qcadev->bt_power.pwrseq);
 	}
 
 	clear_bit(QCA_BT_OFF, &qca->flags);
@@ -2390,6 +2393,34 @@ static int qca_init_regulators(struct qca_power *qca,
 	return 0;
 }
 
+static void qca_serdev_put_pwrseq(void *data)
+{
+	pwrseq_put(data);
+}
+
+static int qca_serdev_get_m2_pwrseq(struct qca_serdev *qcadev)
+{
+	struct serdev_device *serdev = qcadev->serdev_hu.serdev;
+	struct pwrseq_desc *pwrseq;
+
+	if (!of_graph_is_present(dev_of_node(&serdev->ctrl->dev)))
+		return 0;
+
+	/* The pwrseq is looked up on the serdev controller (which holds the
+	 * OF graph to the M.2 connector), but its lifetime must follow this
+	 * serdev consumer device, not the controller. So acquire it with the
+	 * non-devres pwrseq_get() and release it via a devres action bound to
+	 * &serdev->dev instead of using devm_pwrseq_get(&serdev->ctrl->dev).
+	 */
+	pwrseq = pwrseq_get(&serdev->ctrl->dev, "uart");
+	if (IS_ERR(pwrseq))
+		return PTR_ERR(pwrseq);
+
+	qcadev->bt_power.pwrseq = pwrseq;
+
+	return devm_add_action_or_reset(&serdev->dev, qca_serdev_put_pwrseq, pwrseq);
+}
+
 static int qca_serdev_probe(struct serdev_device *serdev)
 {
 	struct qca_serdev *qcadev;
@@ -2420,6 +2451,10 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	else
 		qcadev->btsoc_type = QCA_ROME;
 
+	err = qca_serdev_get_m2_pwrseq(qcadev);
+	if (err)
+		return err;
+
 	switch (qcadev->btsoc_type) {
 	case QCA_WCN3950:
 	case QCA_WCN3988:
@@ -2429,17 +2464,9 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
-		/*
-		 * OF graph link is only present for BT devices attached through
-		 * the M.2 Key E connector.
-		 */
-		if (of_graph_is_present(dev_of_node(&serdev->ctrl->dev))) {
-			qcadev->bt_power.pwrseq = devm_pwrseq_get(&serdev->ctrl->dev,
-								  "uart");
-			if (IS_ERR(qcadev->bt_power.pwrseq))
-				return PTR_ERR(qcadev->bt_power.pwrseq);
+		/* M.2 connector modules are powered by the pwrseq acquired above. */
+		if (qcadev->bt_power.pwrseq)
 			break;
-		}
 
 		if (!device_property_present(&serdev->dev, "enable-gpios")) {
 			/*

-- 
2.34.1

