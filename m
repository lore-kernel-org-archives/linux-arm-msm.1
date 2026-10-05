Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C41147FAED
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 12:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791202913; cv=none; b=hFYtDgvY9MQCXY3p8VZ79qgfe1rRLZHGAUEKMVYsDYkDEwp1nhFJ2oHGeJ55mv2Ac0T5+lom5eFNIRmeqofhYyIUsduFOZ6xquNmfZFd4HtIYFrUcJiz1ONZRNkEFgQevQereyGhuhcazqHoNN/UroibcACVLaS4advY8BodnMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791202913; c=relaxed/simple;
	bh=ZaIFNr9aHwIPrZnhK4k7xdH5Zwawb4hhbdoA4X9T7a8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T2dFg7JlKL1XP7Pu+Oy+IQeGdkJiJjQObv1fK60esrX5NxLvzXtX8X/80/HVMFc7WeUxOepskA4GRmLxBdoOcq03A2xMJIqNJaPf3u0Bw/j+4mMzJL9CXpSMkfYj+yoxEI9+0tqI2OLHZ7+RBHtYR1HwVTR8k+22B4/V8wqPAME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K3XWhEj8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K4fwom09; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K3XWhEj8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K4fwom09"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695CFSIH1892678
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 12:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L9N0DSJJFJ/TfaSBM4+7KvNtrVX9fRfDuypNpenjY4w=; b=K3XWhEj8RDkIn/9N
	OvGZrk5C/JZna+JorcXCCv1X9b1/kWfE62IMZMxlOaOG0IVtFZ9GkdmndlLS7WEi
	9wKxpmcEgHypMqtNWrNETy0ZCzwtNhfBl9iAFchQHaFYVsaSs3MdPCFpGrXSbnJn
	MnP/iQSkaNkxwBHhh+XrKabpuxH0hLKG0fUE/uf2XlWql383KUpN2X/W0cEVzCb2
	Ff3C1M3SpP6WhxF/sBbsK0HkkphR+AI+4izJjkstmqMLfOccMp5R2yU18DaaFX5a
	A/mCkQRIHZvRueorLnXcA/E7wpFw6h7iThSNSp/qAIS7gI3kxSMeY0co6T62sH49
	Mt2Kvg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ssudsvq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 12:21:50 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7bf45388253so1521481137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 05:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791202909; x=1791807709; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L9N0DSJJFJ/TfaSBM4+7KvNtrVX9fRfDuypNpenjY4w=;
        b=K4fwom09QoSzU2NrQ1LcA5OnUgPSvXYjvRmvYJTNBLDHoAiYAuyo6XcRr0Fif7Zu3/
         DHkd84V6swEkmF6Ol8qPeSgxyFs1hfzGNDEs4QViDuHIJKXaFXn43tu0dBg5aBPUZPJL
         IHBGkoqmSkSziw6ZTecIWQMCt0sxB6VqHYozza9evTqLDzIjaK2ZnOQg85xDHGoRewKt
         UMs4iLvTO4PgW4S4HL4XnBPylld1wW6M/fBylteuk1g6PFCTS1HLDVK63sto0Loh6vRr
         Bzr7OSyZzk1j3Lt2aJHvpkFfTJZ7/4/IpamGZPUH+MR+BPlhuV1krCYZVP3D2a3cGCMi
         kljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791202909; x=1791807709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L9N0DSJJFJ/TfaSBM4+7KvNtrVX9fRfDuypNpenjY4w=;
        b=n5Lk3urILeJO82AlZ6/MPl4e7oORG2QdcX6b4/KI6TBX3EiYiawuBbZk6mciUSoa+g
         k/6oU0Fldy227KcWYEjaiCjSB7w36pE6Jj+RoAYJ+21jcJZ4f29iFQDXNzj8FiUDn2zM
         jdFb+qa9m5JVptE5Df6dxjqKdJp4LTxC5PKemH3p46k0AUZyzzpOw9BVIfYUqzmv2K/H
         s4umBQw8uOX5rTTR18hmuJJtNgjYjz+YGwDPXrBRZczzQtyON/PzU3wfZpjSZdT3SQta
         7wdRe7uKfqbuNGN7qjUFkung5Y51m5Jmr+4cKJdXQrNnjYRskWtedQWOqgbQAdk30/88
         4u4w==
X-Forwarded-Encrypted: i=1; AKwUvBwkgKvQYV6MVhLCoySEHsFoHKnWlV9Rnr47DYxgNlsJaXikmNCrtSolQGFCeyQ0bQClRlzDbSJ03tIckgGI@vger.kernel.org
X-Gm-Message-State: AFq9FYICaQFaBmAHhqHU+JedF0tdfEwjQVFtZ2AG/RxFek9NZFmUr4k/
	dlYB6YRGir7h0N09+11SBEm3vjZtoUdR3I7U5+7T8UNnuiOO4nUklDeDlz7t9bSnxLfF3ErZkIB
	r2F3nR2/QhgMetwOc39CTo4wsjkxOXjZCZv+OJomfGmNmNlEc6CRmoUFjJIljPyu28gPp
X-Gm-Gg: AYBFou2gI4HQJMS339D2uYJ6eplTVS75diz0JTPhKdx+Xpa29PlZqm5SFJaZCzJ5qXl
	+y/r8wXm3PzU+GCP/0BUToN87O1LEfzPpZuBTWBtgIYgzVmTYdpOEdLnSlsKs8EaJxTO0NrQmKt
	u4ot3qMhF1fgSqktXfosThJCMwPuzk6Np0y6qGqLRaVDs03e7lxt5eAxNQ+Ab0atNKMf1DzgEdJ
	nZxUFpIw6EL/L9f7hcRAVBOPaTPSl40Zzd+zKVmBXWrL7CuwPxV3h+Ff8bjGFQStrfLMPvU5vOR
	sRqwoyf5gVySl53M1yUOEyfuvFWvugg4VpI9E7Eg55OM0nVCKL4AXcAZ4YHkGnvX2sMdbgb9Rjy
	nwkqQB0AFhCubBW9j9rtBd4rKQjWFYD7dKCEVgVuLCJXGv1v+VViNphntDlUoQXehTHhy03Uqtf
	5P8f5WuBSZI1l+A8wVa3wJXhye+D3pLYXyrauc8IbHwbVHBGMt3irxhu3HdDFkMdD4OWojag==
X-Received: by 2002:a05:6102:c15:b0:7be:3606:2248 with SMTP id ada2fe7eead31-7c0f55b1f6dmr2820757137.34.1791202909515;
        Mon, 05 Oct 2026 05:21:49 -0700 (PDT)
X-Received: by 2002:a05:6102:c15:b0:7be:3606:2248 with SMTP id ada2fe7eead31-7c0f55b1f6dmr2820742137.34.1791202909054;
        Mon, 05 Oct 2026 05:21:49 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027698f13sm324157425e9.1.2026.10.05.05.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 05:21:48 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 05 Oct 2026 14:21:32 +0200
Subject: [PATCH v7 2/8] Bluetooth: hci_qca: Rename 'power_ctrl_enabled' to
 'bt_en_available'
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-monza-wireless-v7-2-5a6de7662dcb@oss.qualcomm.com>
References: <20261005-monza-wireless-v7-0-5a6de7662dcb@oss.qualcomm.com>
In-Reply-To: <20261005-monza-wireless-v7-0-5a6de7662dcb@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfXz4TQSUPhdMkQ
 Kq3eE5TrOgFMm/FB8+8hRZ6Ziw+c6wZoQZ9YV2ph7ca4BWwbQipHPZPCzflNtelYU3CE8CZSKYy
 G2C5ErIjsDS9QZYSo+2OnS5fVs1s86U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDA0OCBTYWx0ZWRfX6vlz6eZdn8tP
 SwmlEY1JxtJUj0tICybfHpum3X6LauyasRo33+d0rU/DTSwblarOsXUVqe8J8hHxHeOLsUfabFZ
 o03jbwr8lApIZGH4J57kQQQa61l9vOTSy5KafinNaT/d8yTy9jHNKRTwgMBY/LvH0unJbhoVpij
 A6XqvFqiJqv0h0ZKCIfeaRKws2p6J/jDuCc7hp7BTHM7CCP/cpkBv9nNpEySOffxkOWcqQV661P
 Q7JcRlf8C7p7lrNhmL47KrWfq26DVjWqF8NIs/loTmZsT/shD35qRXjmyDUZNnM5xFkWnXToGb6
 k7tMa/rKArsaGdrbiwrTfg6z9zhxWiE3PFuw5T6mnnbyJPqDl+cW3Q8sLMLH9+8M4idqB7UxD7R
 URypqV5EX3bbDHtgxY9yAkN5kfIfexffQgLf8phbMo9MY066TqGVqS2ZlkjjsgB5npNaY1Z1i80
 qjS15uwtbxTDlkJXCkg==
X-Proofpoint-GUID: 244ZJnZ84mYIOqnAXi791ReV_qUVu6sX
X-Proofpoint-ORIG-GUID: 244ZJnZ84mYIOqnAXi791ReV_qUVu6sX
X-Authority-Analysis: v=2.4 cv=FryQbGrq c=1 sm=1 tr=0 ts=6ac3965e cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=zRh97aRZNhiOMYVz81Er1w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=wYtw_XDhO1ghKZOGarAA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050048

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
index e249fc6e44479142e25af4e37bc4e1bdba13cd98..f53f95601693dcd8356b4b825776317061050f1b 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -2402,7 +2402,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	struct hci_dev *hdev;
 	const struct qca_device_data *data;
 	int err;
-	bool power_ctrl_enabled = true;
+	bool bt_en_available = true;
 
 	qcadev = devm_kzalloc(&serdev->dev, sizeof(*qcadev), GFP_KERNEL);
 	if (!qcadev)
@@ -2510,7 +2510,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		    (data->soc_type == QCA_WCN6750 ||
 		     data->soc_type == QCA_WCN6855 ||
 		     data->soc_type == QCA_WCN7850))
-			power_ctrl_enabled = false;
+			bt_en_available = false;
 
 		qcadev->sw_ctrl = devm_gpiod_get_optional(&serdev->dev, "swctrl",
 					       GPIOD_IN);
@@ -2548,7 +2548,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		}
 
 		if (!qcadev->bt_en)
-			power_ctrl_enabled = false;
+			bt_en_available = false;
 
 		qcadev->susclk = devm_clk_get_optional_enabled_with_rate(
 					&serdev->dev, NULL, SUSCLK_RATE_32KHZ);
@@ -2566,7 +2566,7 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 
 	hdev = qcadev->serdev_hu.hdev;
 
-	if (power_ctrl_enabled) {
+	if (bt_en_available) {
 		hci_set_quirk(hdev, HCI_QUIRK_NON_PERSISTENT_SETUP);
 		hdev->shutdown = qca_hci_shutdown;
 	}

-- 
2.34.1

