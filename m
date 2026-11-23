Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795429542;
	b=MNXCzlF4lhw8z3XZeRDH+oeEQw45GpoJHgoVC7v2IuzqbfWCpVhkrprO+2TIls8EKaK0
	 ys6dGw7tAxrAU7/mkYqlpHkElkyVHwfJhZkubrEjsu8FWAhYClJQXPTePdHJRd5iBsEas
	 aPenXcx1BsgAAdCmx5G4StQlBVd37l9beZyDeobH+nRBNIx6boe4jQRZ430ueDCqhxKJD
	 ga+d4zTse1NxZyTbxQpoS+tXQz4cvNeXQ+JXi6ukyZWsO9FRfq2RKo1aF9Fa0VRDkfzKp
	 xKdhfzTAaf+fijqEDxgsOLRgZLN9JOFwAkoH6HchllbLv5fbrgx+ZX8ZEudAQbFx3GA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795429542;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=N2e8ps4JJNpepcw0ywOkVKQ7w3/5wYw/tpOQprpCQl0=;
	b=z0zPhAG0AbI1D4eZvZtr1pGiiSNKyxEHT018rO0XS7S+2TfvuGZaU9R1gGZLZZI/5uiK
	 jkAMbj/i76SlnfL4k5kJ05nZtZmGyJ5W5R4oRiPEPRMOsW7a67Ib5+6S02uzMaDEE1TeA
	 ArKhZmv6v5wLNBq7r5fUr9Z6JrZLy0rU6oU7wrHD6TcuRpUbdkwqOI+w9CDAvNPWWxFxa
	 zKnmj/YRg+3FGXjimjePiBsakpDZwxjh670HkpMuWGqhorF1fuG3Kinqe/2R1vC6PTMPY
	 0pGt7ySSMcWLcxSp9LczfwfYmxCUB8qPv0O24FCZp3LRwIfn7Ugv/R6o3sJq3+tUdkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="K/ne0YAD";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A9+YkpNs;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4211B606A69A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:25:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4211B606A69A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K/ne0YAD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A9+YkpNs
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9GZqg150171
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:25:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N2e8ps4JJNpepcw0ywOkVKQ7w3/5wYw/tpOQprpCQl0=; b=K/ne0YADjHipBOMZ
	09MFX+mU3kfu5RkHbTmdid8Lg6K4HetP/hxZXxzAuPi4W0dRY3DLa7rsZmLR2ERE
	a8uF5xkNBbxMMK/Jwy1c6ckjbi8rs4UjrAo4KCmaE/DiPcnL9wSPn257fTWot4SI
	5/H1Q3xOG3EroJMiTnHkXLmk3iZlrB/3z4OhdCtcWHGgR2Nvd8gOu7mAP7U+CDzk
	xqgJyUYBreB3Mdz9zxBhPSmyVPVEGcDQMJYRSrLC7o/xNVNwljkro9ybdVOlBaPu
	agB08qKosIZITVjww1BLG5pwGeyDbSyX30JfbARFcH7OjRdlXSK7YPrKSJRWJ7a5
	dA2wWQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34fk66w1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:25:40 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-9210bbc04abso65203236d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 02:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795429539; x=1796034339; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N2e8ps4JJNpepcw0ywOkVKQ7w3/5wYw/tpOQprpCQl0=;
        b=A9+YkpNsoC5tGy5F4RyLdncegq3f6j8Wtu/1c9fIjO0jpd/WQEUTshjWo24WaVlUsv
         e8lhj7aBBQOaazwWMPAF5tFkahC33fcETXdP74KIRgw0mk8u8KQ98JV/Lyr9z5CB7nPX
         yTQdp2xAb1LNLhxmZ7jrGlt9rIXfhWriFJVgUS+6Fo7i5tM/Ut1NkzEDp+XxC7DS6Arq
         JxKMCg67XfBifxRDI2ieq4dMwBTQ4WSOXoRh8kMeS+l5UPPCp8CBZUNx/T29xeFkBXJz
         jDQt+EOpEJqmwOYHIIfShibbLr6cjAFjLDx9nd2ooopIglcHB/ujKYr5PBj/po8NKovV
         T+XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795429539; x=1796034339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N2e8ps4JJNpepcw0ywOkVKQ7w3/5wYw/tpOQprpCQl0=;
        b=rn48VW389MGxPJBjwOAvGvO1qeTjMZuHQ6mU73HEVFi9bpdeppJMXp/T26mmchUAXx
         46eP3Y8IO129PV2Ebxr3N7mpUvolm63LiDpFIW/GZOyS5Lmt8kuxbxXmzxkxOz34se5U
         zdtp58OU9gD2zfqg5ttD/8Rwa/bXzKbi8u8Tk/ttlHd233e5ANLPzcGytO58rkfZHZPe
         PXcaNu84MfSwwCi9hfaK7e95RRV6xD5I9scEEZ+KZ1ilrO1p3PmA7t4RMwgbraZSvXgL
         qPuG1NJ7Eg6Cl4/qPZRhn0k58pVWlL53SBDyx/JA70nyDUyaJfFuYVeq/B6egJG+YBg9
         GPgA==
X-Forwarded-Encrypted: i=1; AL+hErElaT2JYvgHR3jlViFiYXkMEmJzeTNS6yf38xMMHsLXU/9nY5/AnqNZMWsiBp57IemEoEd4bd+rw72A896h@vger.kernel.org
X-Gm-Message-State: APuU4Z8BAqyjsQqHl2RClJadjNfjmi1wU1rHZ4Oyr0y66LvLx0Hn1aYD
	UNsX7xGXgMVtmVAe9L0hUdVUvZjDHLYKsaRCqc9BH7w4fqX+Y0OHn1I8cxauo20w/zAgQDseJ8C
	wWbUpp9yWF21iC/sNor9h0Gu0j58Cmpy+Ti+iVI/phEoS946VyC9GJmmbP76KCYl24hAq
X-Gm-Gg: AZFdTZdx8Nh+kTh6tEJldswwRe+IIYNuDKiqsdT2zxLjJQ4VI2n4L6fePOEMf9HPZ3g
	PFnEQO+ddXtGuXdW/c3hoDGEHmApCk+f5ALtV7XJBDpdO5i+xHMbMXKcuuJuXnMHQS+Eo0xJYIq
	ujpnVwfS1R4MIuUQrqxwQvqTLv1nyEfHJ1brL+wZjQiaKxrDsG2++Aq2qZn3IDzV44oM1S49zl1
	86eqJNi3gRfmxKCjHU6HqHbmVkpp0/5dCc8OSz1GCdOhodA9uScfbMMpWbfNG5VpfjpG39atpp5
	LciIKLh682VID2XlTtChVz8rqKDex8eaGNqW3cVMif1hRPQ+cPHwsVQz2ZDBRhOk/ezjTDq6MAt
	/35+3dxfsHpS0PWow60i04+xemUVB3TKE/ATLWmJ13bvMZqoU8LrtT9ceX6W/2dBrLiuPP3Bxt6
	TJy0W/YiqxLSEM6LPodiPP8UwkqyJe5wjjJaQxcgS+Paz93Zyn0vPfLorniLEER00CYgeEuoph3
	OblS8RLtcY5eeI2RJfjVQNLYySX
X-Received: by 2002:a05:620a:2856:b0:949:873d:3dbf with SMTP id af79cd13be357-949bab58cebmr1771946985a.59.1795429539494;
        Mon, 23 Nov 2026 02:25:39 -0800 (PST)
X-Received: by 2002:a05:620a:2856:b0:949:873d:3dbf with SMTP id af79cd13be357-949bab58cebmr1771945485a.59.1795429539029;
        Mon, 23 Nov 2026 02:25:39 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:58b4:dc38:81d5:3c3e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b09bsm634166845e9.4.2026.11.23.02.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:25:38 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 11:25:33 +0100
Subject: [PATCH v8 2/8] Bluetooth: hci_qca: Rename 'power_ctrl_enabled' to
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
Message-Id: <20261123-monza-wireless-v8-2-a8b38604be6c@oss.qualcomm.com>
References: <20261123-monza-wireless-v8-0-a8b38604be6c@oss.qualcomm.com>
In-Reply-To: <20261123-monza-wireless-v8-0-a8b38604be6c@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: rJaMIYhZSvwhke8qCzVAuM42AkVLzrcA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MSBTYWx0ZWRfX7kmTF9XxAAO2
 /SvFLSnuygXYpCpaXJjn2o8ZPTF35DlvS17ff7LPfyvrvYee1CxBsUQ6TXrOG+R+A1qie84jq7j
 DKcKQ5k5QuEpaasoXjZSeJjlRa2ENu0nzsHEmONyz5J1kwlXQkOIp5uUH8PEWMvP3qrSjlvNj2u
 brq4Iu31htmTyq+qUdMhrzohbmVuqu2kBfyeSNl+ciPwu3VamUwlD4pjg/7GOe2xgUzU8gXiyaP
 eb7IdEeqbiOkd9byv8dKi2YLwapT/lBgmiDgoknXTAqZeX+8bp1UU018eYV9INt16D81hhb+ysb
 SPlFNvZjG+tKFNnoDbIRmf8TUJQhO0FfxoAuGO7Jp2S3TioDG9lPWvOu4T69u2GA07qAny2tZve
 IBM9zv1TNnKWZb0h0cEnn/TF6cJuG1W8Vsb6n5VcJjVf6rEOVopX3M8Vw3UnqKvqjrvirOEZGgs
 DtlpiUrLKj2hsN70ZXQ==
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6b0414a4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=wYtw_XDhO1ghKZOGarAA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MSBTYWx0ZWRfX0P6/zAHEnRrS
 +ssq6YFkvUzSK+p/4BXrtY39YKxCqFuMDGn91u/uId7t1wgN4JJryXCONi7vPba3CeBIcIfGhG6
 aa9YGXzfJB4UOWG0+/PG6ZjlhoAKGkA=
X-Proofpoint-GUID: rJaMIYhZSvwhke8qCzVAuM42AkVLzrcA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230041

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
index 998796ea618822298d7f956a00c6c50f14332363..3b2792a3639cfbd9ee7a781b6e4c26c660495391 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2477,7 +2477,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	struct hci_dev *hdev;
 	const struct qca_device_data *data;
 	int err;
-	bool power_ctrl_enabled = true;
+	bool bt_en_available = true;
 
 	qcadev = devm_kzalloc_obj(&serdev->dev, *qcadev);
 	if (!qcadev)
@@ -2583,7 +2583,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		     data->soc_type == QCA_QCA2066 ||
 		     data->soc_type == QCA_WCN6855 ||
 		     data->soc_type == QCA_WCN7850))
-			power_ctrl_enabled = false;
+			bt_en_available = false;
 
 		qcadev->sw_ctrl = devm_gpiod_get_optional(&serdev->dev, "swctrl",
 					       GPIOD_IN);
@@ -2622,7 +2622,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		}
 
 		if (!qcadev->bt_en)
-			power_ctrl_enabled = false;
+			bt_en_available = false;
 
 		qcadev->susclk = devm_clk_get_optional_enabled_with_rate(
 					&serdev->dev, NULL, SUSCLK_RATE_32KHZ);
@@ -2640,7 +2640,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 
 	hdev = qcadev->serdev_hu.hdev;
 
-	if (power_ctrl_enabled) {
+	if (bt_en_available) {
 		hci_set_quirk(hdev, HCI_QUIRK_NON_PERSISTENT_SETUP);
 		hdev->shutdown = qca_hci_shutdown;
 	}

-- 
2.34.1

