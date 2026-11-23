Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442178;
	b=edS2ZZvkhxWZ9OQYgJbA8FBpVvR53lYa9r3RE2PHY8QzJDm4ayoag2ekOZaj3UyvyjAw
	 Cep2vlspb0d3v7CZoaQjahmOeXCZyMTlmtfF2IhRX0zBqBVnOSrc04N8ADNNLXuMC5tqD
	 oo+FkYkdOM3a3WDFu867yjxA18+GEWxWpW/tk3HvUgpPPv+LB34vmM61UIckgtTr8SX+P
	 2/6DuNtV8QbchKslWIc929ziFfchetcD4wOMcaymtrLCoZ8TUqVG/T53SNI6bYUqA683E
	 bRAa9QHmW0C2qfjNZtKeL91QBBr4ycxXG73hWQzOs9uLo3SUIZRcoBsCBTT2Ky3OMeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442178;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FamTb8O82PGX5MnAB27xX0tRtVKJz3smuGoSmmc0v10=;
	b=DORRDj82zL7L/V5whd9ZLdEiCqVH8em/FzmuPMPEM/cJIaeKNlnP7IW6FPQzjkciJil6
	 x18C6WMPtV1WnhfnD2dxYHSFAsUo0eN+QLexcP+zq6Ke/D5Dz7U4VPjspE396IsUs9Qca
	 ZkkWn79wj4WSBiSilMMwzhWHKwoNy0kTKOE3ZXeoA5GsmdfcPJXMyyNZ/aCMtQ+A7i2YF
	 ShKKkg0ORY8KA4wAEiAwaQJGBQmPXR5yz/z0eTsYtT9x67rczHDNulq25TM+c3ZhpMDXt
	 oHystwD9ijJkcbv84C/8vQh9PqQANVYyPzA0sdF637bJjjLS+PqYym9TekD5LPpVHRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YWRyANkg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=InFUBf6t;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE609606A33C
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 13:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE609606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YWRyANkg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=InFUBf6t
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDL00l1974270
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 13:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FamTb8O82PGX5MnAB27xX0tRtVKJz3smuGoSmmc0v10=; b=YWRyANkgd+upY9eN
	x8GYfyuWfYQNwlVOeyYaisbNxgEm7+4kDzlWs3+ljIdpEXcfNpfQGVAL3nDVaE7E
	DqlNrig6WW7QYXvCxB7uJqS2lvq9+CMiLP60JvassDtV0jcivDxciNgZqqJSletX
	Fi6rmOErx3+nMHPdHtvG2IWQJWWkY+AEvqprPOeAPe4t+xgQRwOHJG02H61ujdLg
	csPhpP69yqRQRlbIaiGlPGqS2AA4mxAWW5Cbxy1YIuMO9ACDFYP9L6hVeTibn53l
	YdIffD6gaJ09cVfAU5zNevjBRbNSdXkSp9EsKj09ZbMINMbhhxmeN3Y1Q78p/tX/
	xc/tsQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4m7urkke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 13:56:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9495dd0f07eso627734585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 05:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795442176; x=1796046976; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FamTb8O82PGX5MnAB27xX0tRtVKJz3smuGoSmmc0v10=;
        b=InFUBf6trzgIwBCnPI5YKA1Rv1Yi19wUes4p2rqeSsdb8KXhQc06JbHCDHDRwWu74B
         ZgBHg57GfioDTCiI+BxJQJ0cQxmDsghjK6KxtuPUQCSR3PiCc3lN8lv6JAbp3H5gBRTM
         g1cpvuLD4E4vPDxhbPpeshsFnbilA68N66mJn3SpjaqzSP9LdVFtlzi9OBoiGpR3CqVb
         JvkZAv8q1GZntudzAsyiC6/IiXWsnNA4XHkujJwYjkWnMFsPSdchvGhWRKoxXep01wEx
         rPLVSr4UONQL1sR6+yuYvZu+sn7wb9DoWrrErf7KKb7cs6gEtg5DS2TVVIKee/HxmDat
         /AOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442176; x=1796046976;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FamTb8O82PGX5MnAB27xX0tRtVKJz3smuGoSmmc0v10=;
        b=W+TjKNuvr6dPBxtjABqui2E7Hx9w6sIabMi7feNJQ6kesUrpA91I80JlGzWiemt9rH
         LD1yn6bGtTEs6hUt+4zKvEjqjKJnA5Xg3RUwRlNdb+21W/LrbthhLv4kDRHMhfl9tXBj
         bqUIOs5pXbra9wKm8Lu1+7QSEHkrY/wxPGFIHfdJXE66NjP5n7JNrdmEiFAS0FcoBolE
         rYuq9slCdY3xDYjycH32UOG+w1Z/RjkcCGwmYiqKXsQENRKzWLwMqF0zZt3P6MMUGzic
         CxQVFdEwXXb4q9dDEmWELtsQiOyDFz2UdK8g+ARBKkytnpZ0ye0RBzxJG81pLxDoiGhO
         1paQ==
X-Forwarded-Encrypted: i=1; AL+hErF/R2844+8+CM2MzAraxY7NqfC26YoUywpkny6CHIPCORV13ukInj0Qow3olmYO37LPKWpepNkDht9hYryz@vger.kernel.org
X-Gm-Message-State: APuU4Z/kmJav99egIqlE2flBSu+Cc9MVCiTmdgoMAxoVD00PVe+4InPl
	uw0B/Nwk0BFR6ov7xsya9i4oRHhG6pvg2do6nhxK1g8H2q8/CQQg83/Mi34wFX8SKHBhacKlBg1
	Gf/ynZGayC1OJMWV+nUeXSqK48+x+G+uwEe+Q+r2MiG3cjIMVMdvBbvoVHmC4U/xNF1fp
X-Gm-Gg: AZFdTZfmwrBhMf3FJSlB8bRRVv2Hn4OXyUs1wrox8qHg8bHlvAkEY/GdA2TCfq8z8Nq
	r/yFUPApVsZjHr0bqK3GTPQA7Roj6uuNXYo8nmu/aaiI92DlAPkdjRk+IGMFyluG9xw7stcA3L2
	+DaYqKCQoafGpNOruWVn8bRoAY8fvTITzwTPLPBwxCtJCzE5wqPdkfWZGn+AQAHdORZ8ihoNz13
	iaG2JFUYfEqtoCFq4q5q5Gx+ydLTxXDW7Haj/V0W5cyk/KJPA2CudSksi+baQoirGnQNIrNh3+a
	XOYFjJ5SXbp4iMVGp8BM67kdQCdAGos7dbLBtWyJlLwKYL4Jc6R+aFHmAAGHvBq9RfpMA0m3KUo
	J0b17BNh+CMDoQTM1cmRMnTpYTqDaBHjlw0Pujb5GrXxb1WcnFT7VIhaWRnnfaXfxUoHzdW7Ije
	Wwaf1kYNw71mfR9M/0p+iw5NNOaJ3dIgucvVXkqbOIawfNt/aXFE31s6xKnvSnYErw6GSa3UC+Z
	q+CdZW0i6WH8eYf2VRVIc2H3Yx2
X-Received: by 2002:a05:620a:45a2:b0:946:2a0:a11b with SMTP id af79cd13be357-949ba9cddeamr1951678885a.35.1795442176102;
        Mon, 23 Nov 2026 05:56:16 -0800 (PST)
X-Received: by 2002:a05:620a:45a2:b0:946:2a0:a11b with SMTP id af79cd13be357-949ba9cddeamr1951672085a.35.1795442175472;
        Mon, 23 Nov 2026 05:56:15 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c4353d6sm21724625f8f.56.2026.11.23.05.56.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:56:14 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 14:56:09 +0100
Subject: [PATCH v9 2/8] Bluetooth: hci_qca: Rename 'power_ctrl_enabled' to
 'bt_en_available'
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261123-monza-wireless-v9-2-450d7d764aea@oss.qualcomm.com>
References: <20261123-monza-wireless-v9-0-450d7d764aea@oss.qualcomm.com>
In-Reply-To: <20261123-monza-wireless-v9-0-450d7d764aea@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: Nwo-LI79_kU2jgx9PpUKJQywlT2u0Xza
X-Authority-Analysis: v=2.4 cv=KurYSmWN c=1 sm=1 tr=0 ts=6b044600 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=I95fhSNaEobLycDSJJAA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: Nwo-LI79_kU2jgx9PpUKJQywlT2u0Xza
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA1NSBTYWx0ZWRfX+0cJGjpcSYEF
 quJSc17Aq9iQF1kItMzdwmopb5+GJBp2Fkgj3UL9g5rseEZAAGWVFp2Au9Wq7KoCQM0dwgZ3dv0
 L+1E+A0bRLf1EeHNco7yFVVFtEe8Tog=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA1NSBTYWx0ZWRfX+DhuQlaPaO/1
 nHOre9T+Etlqmjw470unsSFPtIaepm4lYOPj0uMbml3D4rdUxdDtGKyo7etIsFZr6jgSJpiVQkj
 mq+SG14rFgSvB3LC4T6k17swsDxfInhoEYmqXzFNv66AseIT3/vHl2orkX2+HBSjej2CkUNRMFp
 o6Po8sXyLVCU+9vT8oQenNNbl4rVPFg+m4BQRv6H8ApPupSQ3sCC0/arV7l/7+WrADz3vK/7/mk
 X0GFSyB9GiwTauersTAuGY5VzzU2I0OortYUS5+hzTdMGrySOA2/knqDbxZLtVFigNZ+RnQObPR
 vwg0x2H6yfb//VCud6B9cH3kuneRcs/YJUEyBzuQ/L1gnhSF3wsuB697fceZJ2WQ2UKRkZde5Mk
 cfzdnZgRwgyrCP+9cUndfzv+ZyJvCcSBo4KYYj/IgT82R6VKmSAuJa3iTvnR/G5qDU65pLNPGz5
 htE7kOAQpMKXgXI5Jzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230055

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
index c4e42c9542adaddee17e256eb017902ef565025f..5544dff9d10b5064797d41294b126fbc229a8dd5 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2477,7 +2477,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	struct hci_dev *hdev;
 	const struct qca_device_data *data;
 	int err;
-	bool power_ctrl_enabled = true;
+	bool bt_en_available = true;
 
 	qcadev = devm_kzalloc(&serdev->dev, sizeof(*qcadev), GFP_KERNEL);
 	if (!qcadev)
@@ -2584,7 +2584,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		     data->soc_type == QCA_QCA2066 ||
 		     data->soc_type == QCA_WCN6855 ||
 		     data->soc_type == QCA_WCN7850))
-			power_ctrl_enabled = false;
+			bt_en_available = false;
 
 		qcadev->sw_ctrl = devm_gpiod_get_optional(&serdev->dev, "swctrl",
 					       GPIOD_IN);
@@ -2623,7 +2623,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		}
 
 		if (!qcadev->bt_en)
-			power_ctrl_enabled = false;
+			bt_en_available = false;
 
 		qcadev->susclk = devm_clk_get_optional_enabled_with_rate(
 					&serdev->dev, NULL, SUSCLK_RATE_32KHZ);
@@ -2641,7 +2641,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 
 	hdev = qcadev->serdev_hu.hdev;
 
-	if (power_ctrl_enabled) {
+	if (bt_en_available) {
 		hci_set_quirk(hdev, HCI_QUIRK_NON_PERSISTENT_SETUP);
 		hdev->shutdown = qca_hci_shutdown;
 	}

-- 
2.34.1

