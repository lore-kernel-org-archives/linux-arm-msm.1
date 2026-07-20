Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B68938D01B
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784534656; cv=none; b=fqxNTNslCD9uxRxPOM4YOYIUFwosexetdFd/mrNwoiXzSGNLo1AZH46/t03bViErIHqXo3Q4BrM+mANT5LwrFj+P7gzT9noKy9vooGNhIyRHaQ7Gvu+ZoaLF0cNYTcQboA8XQkWWaYhmw8Mh/aU863LnYsvekPkW7s5K+3KD4/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784534656; c=relaxed/simple;
	bh=SDP/HXgz4amfEH/BI3vkK16jvRVsmUt0sdawVFBJlw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jddnl/Zwk6wng5U8atO0/XygvfYuXsGvsl9Apukonew7bOviW+2N5yQ6HoHUQwhb+w4kZC1oRMfkKhjVqo/9P9JkssmYMVy1wg1vqjqSle9tlJUAdyKyXaSHliBRT6B+pTOffvYFOkQbbdsRXT2vy3v1lQOtLqxksHUB9qvdK7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DP8bfQ4F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DBnEHCUg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DP8bfQ4F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DBnEHCUg"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K7YEP02043817
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iPJCmDf+q7ppTTlm3G73k4uw7uFCawMqMX2beUHHwpo=; b=DP8bfQ4F8Oyslqhs
	QXVTuR+92NhVN5zgmwujS7NXAQS7ksKFNQrPsvRYL3ggqc0t23+kU6UM6CCTd6Fg
	z8KigQGW+fMZQOLmi7RPcIZweHYIFXq0kDiOX9PhGrW31/+Svnu1sVZIjLXbAgXo
	I+8lW0EyE8xVepBW58DVFx61EZntPyw2BOuyaeSFzWqPBzy6tuu1EkIigcd8lBJ6
	vOENIX64u/o1kdT+eFgJqGp6tIE0gLTkpj15fYz+0ysI/8b7RZEJ83GaewmBdsqm
	69KSsT43SApxdfhQXyMT3Yu/IXQo9Qqmu1+DoemOVsyuDWnRSCwJK12nkwDiIsbE
	kVGD0g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfdcg39m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:04:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1a97644aso264874951cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 01:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784534651; x=1785139451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iPJCmDf+q7ppTTlm3G73k4uw7uFCawMqMX2beUHHwpo=;
        b=DBnEHCUgkCUMj9FU+BS4eO1JAkBoDWkMlnNXb68m6RO3+jGWW2mHiNErIZndmxuq7L
         ZhOsWWeBeNEIdgyDmvbQEOGbfRI3ccQGg3CtnR4oZh9TCeWwdaNwBqmxaTTB3Wy4YoPp
         ImGaC/JQZhhqpA0gBJYAhKFDawj4BMCOv39dyMH3vYZc9M5Gg/71AYz8VgbEOl+Ffgg5
         pWMCwvVMaeyq/SnXUd9YsAkAQtt/fkfVNdsCg6Udxo72zAjNXnruMoW8fXDyuyE+8yJD
         pkK8nwQeETmpldDHoSWkxCnCg/qVV0xOPjb1MYmsBlFINP1feTxOVU+9wyU8dYwfDSan
         MMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784534651; x=1785139451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iPJCmDf+q7ppTTlm3G73k4uw7uFCawMqMX2beUHHwpo=;
        b=haI2mhRogxTslTsDpIe03wnQRZ/wE0lZmyxrTzQQmqrtp9OUsI/4+i53Yoeoye/juH
         jFa7tjinjSe/JHThoKOGMhBEFlXGArpFmWH+JECeeuvFY8SVykmGBGghgNLkKip/NxrM
         xCO1XkLD5322PnGVIVLON8vU3qYZ6//ENFt1tpjeeWgLixTgsqIUE/itIdchSIrEj/SP
         Ox6xijqWTmWqDxuS3slOs7lcBtq8TtES5tZNPsappd45pKzIs0lJubSDxydh95ePJjBy
         Du56eOlcrQgjj9VFw3XvoNv0uUmZ/mU5/dmA6FLGwu4z+sHTmBDtWduoMWKQjNM4el2s
         VRbg==
X-Forwarded-Encrypted: i=1; AHgh+Rp/SxxClMwK4TCCghPOyNR9yHrZnqe0YQXjlD680WEqFJk5JVAsWYj0IjKV5pD/hjqSDheGUYXPLGL1tY89@vger.kernel.org
X-Gm-Message-State: AOJu0YwNA9xcVt9PS722cglFCciuOq1wUqKy9mleDHxR1oLN7m37E0Jo
	2iQ6Umd28phURLSfTOsfYZpcAIMk4u3Lm0HV2gliXB0i1/vc2MKB4eqjJyEwWh8GydQIU9073R7
	ZP1dvb5G14ECtcU12cINsAA/K3hPgd08ATYDPtaYRd31uzg3SRaBehSe6CYSmq6MKYeGr
X-Gm-Gg: AfdE7ckxaXXYmhtHkeOqVusbTS4WlIMm8YfheOW/D5mp5tRQpP853plp3xloflzvYZ/
	5xmdwjQkXcyXbz6k01bx8k/kTPhbMwfcadOG5ad6rIrX/VCA1zVVRjYNUAIdfaRKOYnillEybJP
	kbshdQxry086ysWxDqFTKL7nTRNa4SMkqTEz8OtaNzH0Le2lDwb19Ru7Gy0+Jj1y+W1KGmR1QQS
	DPcpgNi1v7BCB1gJ4nEkt2oD5e7fPe7gPE1RBOKArO+RA327mkr+Iw6K8FEJSBrmPIfGDVSt5gB
	/GEYbfdwbtDiurqHkIz9L6KaL7b8oBCM4rk1WmGH50RT/QMAQ8hKqvOzSJJJJ/Jd3tRFQ9dSym0
	IMHC/T9weJu4GkFqMbxZpCawCQ56iTCHm1xq9WTDkmSsZ4fjDq0wq0nNmwrLRCyubHpXJkvnXKH
	MwTJArCJRJAr5XATSBJ4o5ZNmKaTz9x1Inr3a22+g9zPBLV/eNpTU=
X-Received: by 2002:ac8:7d0e:0:b0:50f:ba62:c328 with SMTP id d75a77b69052e-5213c5f3e7amr116482651cf.22.1784534651350;
        Mon, 20 Jul 2026 01:04:11 -0700 (PDT)
X-Received: by 2002:ac8:7d0e:0:b0:50f:ba62:c328 with SMTP id d75a77b69052e-5213c5f3e7amr116482201cf.22.1784534650828;
        Mon, 20 Jul 2026 01:04:10 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e7000c3e2sm4256542a12.30.2026.07.20.01.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:04:10 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:04:04 +0200
Subject: [PATCH v5 02/11] Bluetooth: hci_qca: Rename 'power_ctrl_enabled'
 to 'bt_en_available'
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-monza-wireless-v5-2-69ec6743543c@oss.qualcomm.com>
References: <20260720-monza-wireless-v5-0-69ec6743543c@oss.qualcomm.com>
In-Reply-To: <20260720-monza-wireless-v5-0-69ec6743543c@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: sNMBUZSGq01bpl5IBmijfRrvIppAxy3L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA4OCBTYWx0ZWRfX1laZIUwbL88W
 yKLk9XDTUK9WcaGsvDn9fK/FT13ipkIJHRlLVSyZrce3I8MilJw1OKyPKq7m6A6J1aNDnOJkmzb
 wp8v5gG864xSfCZb/nxhiVgfPFc/bvGRiq8RF+DDLaNk1WvLuRMnFtwgV1oSdNy5eQVjFQw5Ijo
 oiYp5IyMDBhgh211CyuuWX9ZiPADX/+XLX0brRbnW/MLviqVFwBhm2kWt84FNQ+RiXDWTjdWVdo
 xRiwGL1czagQFSdgHETdMB+ekdEpBzElhvd1KgcjRXT15uRTUqhRIlTk9cvevfUZFkRCRe2UPFs
 3H9oL1RpDkhh+e3HM3Fd0vP3FzEid7Xbo3NhSbg1HgUwivemJeWk/phlF7quy+e3/oww11nCuYP
 ycIOwSabeaoov8napJcW44imNG9qtAiPwk3edVlBw835OS9my476RuqoczIHUkVW9xfxI1mgYjW
 F5oT7m7WHuQajs+uFdA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA4OCBTYWx0ZWRfXzDtHNrLZEMT+
 6bAonWDTEH5UpiVb/zQ5HBV8WorZlhWr6DrlLRLI4FViGJ+MwBKGIZy2lIwJ+ZfsN4PGx8zVpW3
 37ENHEzHLSEIX1Pqd3U4hEJl2iDPml8=
X-Proofpoint-GUID: sNMBUZSGq01bpl5IBmijfRrvIppAxy3L
X-Authority-Analysis: v=2.4 cv=bv58wkai c=1 sm=1 tr=0 ts=6a5dd67c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=wYtw_XDhO1ghKZOGarAA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200088

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

