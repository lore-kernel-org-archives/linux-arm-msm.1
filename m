Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EACAD37C909
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784218715; cv=none; b=DLCeUbk4D00bRh94qsoPMMUptr7+u2xHd6+ja+pwKM+7Nq/6CqEFKjE4Cbho7iqDktnMKFuZDB/wS1xq5MnaJS0HHknFTVuyiS8qr1ZoZTciB7zcuDFW7ubKKiLQTJ0hdWFjHL9usfWjmPMacDy+/5PeBrdotBe9R4CMHfm7Rvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784218715; c=relaxed/simple;
	bh=SDP/HXgz4amfEH/BI3vkK16jvRVsmUt0sdawVFBJlw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SkY7Bon6NR2IBmO3RHmweFEXzOq3rD9i7AQRP+gpShi22v8DbW+yi6CoNbJgaAd99aBJtZxYs1WRf+a9elJqIAN0zM8sE35GRMCVPj9tyTAaXuviCsr77LYN03UuftPi2WHuj8/Z/tQbQZjRpo53FQuf4De4AMl4RWSmgCRGvbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AEdaw8EP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iOuJR0ng; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AEdaw8EP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iOuJR0ng"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDKPIo2735936
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iPJCmDf+q7ppTTlm3G73k4uw7uFCawMqMX2beUHHwpo=; b=AEdaw8EPUB0um5rn
	QvxNivBNe7znLZRvXMtDnqg4K7M/EeM7+28mptmwZ52lT68O4tU3NvYuFaD8TU0t
	cdk/W9RXG/4wbGVYUkPEetDFYJAdXBmPZd2dmkgdhyJQ/FzyuS96LvrErh3nrjAd
	89TVSLvm1TzuueCvM1fpvkzmEzfM+txsnLJfJHx5NN6jDU5KEUbo4U5kW0cGcRbi
	7IuIgQa/6a2/BAoELavwshaDfmXkU/yzFLxCoOFZ5QwlRqF9U+PTRyRYY+RzInoV
	3IqMsl80hi/DrQd6+HnhPJzJxeFlq5dBa29+d7Z2imRpaEQRJSaH5T29AaRfAF/g
	wqRG7A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fevkv1uf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:18:29 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8e97889ac8aso86688576d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 09:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784218708; x=1784823508; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iPJCmDf+q7ppTTlm3G73k4uw7uFCawMqMX2beUHHwpo=;
        b=iOuJR0ng3Wtog2Gw2u6eZPxhMyUMgJ50TUnmXRwqKVHWErn5PJzDUwOqvHlbfjc3KK
         u+SZRpCKEQeGdQH9px5Rqrdupj7MB6ZH9jFhad6jMd1/NHbJFVE4eG3LrnOjibG9tmgI
         9BHnMM6xKRZPUKQg4jrf04qK/aD/iZ1QFtUJaIm1FraQgtTnOFiSzntLx6UN0WAZTJGd
         sMznq6yF7mPSEwv1E6zQaRKbESx4UeSRuBuI6+QN6WSs/f6QYGnTHlEcUHCgViCryvey
         N4YvlH1V16nFcMQYyRHrx3kD7zyOrnpD67mH6/Jw+o0rhig3NDioa6MkbCIBWhOnAfUi
         oVPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784218708; x=1784823508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iPJCmDf+q7ppTTlm3G73k4uw7uFCawMqMX2beUHHwpo=;
        b=au7p+8UMoaqn6tOFOj/wuDD6oM5E8HzXFdlqJtdCOijwdUnrU6Oq70TmF8vBqS1pEJ
         RD9wYq5BCG38gLOYcIgj6Jou4kuTSnHUCz1sSUiucIdSLXBk2Mtnt71ACHpyPR73T1tc
         VY6y4cyVPqHz9JVZr14ONDyTe7wHZbBv+Vz8lCK9K3Nb1ache/RSUKRuORgUGMzyH3JQ
         sxBqmJDxKuAtkprFvgEhMNCw5jKeefINvmQu6enjy2ICqCLGhTIvidSntYm4jPrzJFK6
         GP4K0H9nxafgPwcYOUQiIMYm7/KA5nElkBT7kPGpwr4K/rpFoEH6aVzLJvptySvVDqmo
         Sp7Q==
X-Forwarded-Encrypted: i=1; AHgh+RqIxssxoysajdNDFKKAaFDnGxJnehOZwwGI6A4OvCxUYnU4hH5zDLNrMU18bUeTwX7lN/RzGUeVpY2VJ583@vger.kernel.org
X-Gm-Message-State: AOJu0YwpwAlhFQ1VUBM/m18TncNyOHgrh6oYo3NmeG3UWxlVCDg31gIR
	8yHyr7TpWotYgSE1iiAEYPjTYVEkIt7WF2sMWXOYUc6gBB8AOUPp4rYwSCLZB17kKvF4MMqFcYw
	9nJ2a3Hc9XL9c7EQP3teQt8bpfBKpTasF1Fz/5UACa1NbL41OCxR24VHitmjHf9qo5xCR
X-Gm-Gg: AfdE7cn03fxcI4YLyoaxc4W1KT+9ViMRf03reZUZLlqC/v2xs1nQxa7TrMtwiCyK3b4
	opFIvIAtYRsIkqYwR2136lBj3yMl8/IVEmNCtuvSY2IdWPqMpRdm7liD1/h2blyjJtA6Ra4tVdQ
	VXJG2TrMS8sdURIhqJOAxOebCoLuu7i8N0EovPHqskUaNgLjKzvxXzwP6O8CfgBfiGDY6ZhuCul
	b/MnsbIekhyXHKIi1Y9jJWzoqzqU+z90OkCi9yx+tpZ3MVc5DcfVzrspbL5lNx0B35YOnTtuEy7
	SAhORMVeYXX7SKFnE26yWzKpFR4jBbncjhgq9reQm7mMIntkMVyfgSK5uw5o968D30DaP05bSGa
	UszGAdshK7j0kzBD/4EZ7MChswacoFzlXXivD4t3aLYT3h+CzIhdWdesRfEfcJg02ip5/7E5q5Y
	W4AigWTG2BB8CAb+g75jlIZhzx8n8Zk+jaecHq9/82Jj6ZB7HyEjs=
X-Received: by 2002:a05:622a:2c8:b0:50d:e471:2d1e with SMTP id d75a77b69052e-51e4239fd84mr117366001cf.35.1784218708418;
        Thu, 16 Jul 2026 09:18:28 -0700 (PDT)
X-Received: by 2002:a05:622a:2c8:b0:50d:e471:2d1e with SMTP id d75a77b69052e-51e4239fd84mr117364701cf.35.1784218706689;
        Thu, 16 Jul 2026 09:18:26 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c168744bdddsm257262866b.48.2026.07.16.09.18.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:18:25 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 18:18:19 +0200
Subject: [PATCH v4 02/11] Bluetooth: hci_qca: Rename 'power_ctrl_enabled'
 to 'bt_en_available'
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-monza-wireless-v4-2-9b02e6f549d7@oss.qualcomm.com>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE2NiBTYWx0ZWRfX5IecIa1vHzO5
 BfKsKjXSkHI4mLL4t1zhQPaCLBJjhwYPImWCUaMtlNEOYLBA6IEP2EKbEfAj+KqmnBqhntMvzKP
 kSDFrarw1bz0oDoRMmdFbXG/csUQ1goSL5I1smsauyIDt1d+uKMma/5oXbMdz3n2yEsmupr8zDF
 ZQ1XmeaeAxn32Wg+vf3u9XrrBrCvOmtBXu9wGBRm1bH/7or1x5b8Iod+PnbAGbeMSYNyRTLaD1c
 49MYJGvN3MCszc/Jn6nVrunmXfb/aQDJnTKNrHNutW6hxSIJgz446jApxZc0e8OViOo+8DZlPxY
 wdfj2RydKQwVUV8ZArT+3DJNxlzgKiGnnQGCCgrVwEc29pN7M3F3BzKpaRAjn+ZdsXfNnVmSkqD
 AbFOtBdUF1DHx072lDwAhGOTaEh+g1Me2dn2c1Xe+ckHe6y3lbDhgnpm6R63sBHVGg01fVbhsqI
 4zdjD+Utes9m8JXJDrQ==
X-Authority-Analysis: v=2.4 cv=WrEb99fv c=1 sm=1 tr=0 ts=6a590455 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=wYtw_XDhO1ghKZOGarAA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: bvsSS3Sv9d1K54EPL1Tx-HSGrzZvaSUu
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE2NiBTYWx0ZWRfX1D7QopanlN/3
 qNYeXoSZfHXdMfHA7LfiWaCFpHAhLGtY57XYSh0zdV9vXtgcCQeFa8UPUmTopUttfAFJla+lHP5
 BhjX3POkeYIAOW18Kn0jFcU6ee9M4iQ=
X-Proofpoint-ORIG-GUID: bvsSS3Sv9d1K54EPL1Tx-HSGrzZvaSUu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160166

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

'power_ctrl_enabled' flag is used to indicate the availability of the BT_EN
GPIO in devicetree. But the naming causes confusion with the new pwrctrl
framework.

So rename it to 'bt_en_available' to make it clear and explicit.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Tested-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 135c79e696aefe2b37ee7a7a668715360a1e2d75..17f436484e1e74d1dd690ada22134315abb767c4 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2393,7 +2393,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	struct hci_dev *hdev;
 	const struct qca_device_data *data;
 	int err;
-	bool power_ctrl_enabled = true;
+	bool bt_en_available = true;
 
 	qcadev = devm_kzalloc(&serdev->dev, sizeof(*qcadev), GFP_KERNEL);
 	if (!qcadev)
@@ -2501,7 +2501,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		    (data->soc_type == QCA_WCN6750 ||
 		     data->soc_type == QCA_WCN6855 ||
 		     data->soc_type == QCA_WCN7850))
-			power_ctrl_enabled = false;
+			bt_en_available = false;
 
 		qcadev->sw_ctrl = devm_gpiod_get_optional(&serdev->dev, "swctrl",
 					       GPIOD_IN);
@@ -2539,7 +2539,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		}
 
 		if (!qcadev->bt_en)
-			power_ctrl_enabled = false;
+			bt_en_available = false;
 
 		qcadev->susclk = devm_clk_get_optional_enabled_with_rate(
 					&serdev->dev, NULL, SUSCLK_RATE_32KHZ);
@@ -2557,7 +2557,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 
 	hdev = qcadev->serdev_hu.hdev;
 
-	if (power_ctrl_enabled) {
+	if (bt_en_available) {
 		hci_set_quirk(hdev, HCI_QUIRK_NON_PERSISTENT_SETUP);
 		hdev->shutdown = qca_hci_shutdown;
 	}

-- 
2.34.1

