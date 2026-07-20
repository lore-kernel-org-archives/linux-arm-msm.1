Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E2D3CBE80
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784534653; cv=none; b=bZ8YBOL6lF9yoBIz4Dmlfvqp9HAqhDnreU06LtPXZ3W9PcGUCCldzmpQzwu5gOCY/xQku8Oz0PYzbCq5qLCaRk9znD6/a3qGTL/HkhnhZpidi2kg9ctnSMxK17JCztoz+1DZ1crjkLzBOeXghNcrxrCQjQW0SRYJ8HkpGXD8AWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784534653; c=relaxed/simple;
	bh=KEpaGYLJg/HFUQ4VCnAAAa4/K+FU5Ww1paHM4mUD9UU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n44CDRiirO0yi/kh5ZdvIMF9RCKA/+p2UJGe6KPC1t+jhyKKJoMXkyMaKXqSEGTK/ZN7i0VZoEZyPzfbT4wBo+Bn0OnXX0hE8Lu+ItlhJLC+LFhmCgWCMn0NoupULSGCh9NVAUVy5qo7sXFRGouUswdomR4MELgzFW/1VhLuUSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ObLSV1L3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R0MBgJg1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ObLSV1L3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R0MBgJg1"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RSbd1520049
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:04:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9xHOUNHGElRK8fUN+Vx3VXwXih6zrlUor3vLrF9tWE0=; b=ObLSV1L3NZM0JoOV
	awyLlEcXYHGjLDaOAyMHUQbfwnzMIj3Mvbvw62/PIpyGgdcFMziZXLlQfouxi8gT
	kldrzxmleq3SkRrPABeDwZxstV6McS0Kh0kpS3n5NErEIn3l6CRIrWhnJuwgxiSv
	kFC4g+b6rpw6VTL1La2/iVkA+1Z5s8FVaneQ2dVzoSTAHU3swfI7hEjoivgHyzSU
	X6fA7AxmFB4k1CcU8KdWTfzhLw5yCHkzpAj55+20D67MYfWcvCq4P/UvhcE0YJ67
	rMl/FcK+GFAGMAx5cgaJViE+dYwX7S6dm091So0L9B2ikLjVSOaft+qJZAsYb2Ej
	bprGlw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2chn2md-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:04:10 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d137a68so261954421cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 01:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784534649; x=1785139449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9xHOUNHGElRK8fUN+Vx3VXwXih6zrlUor3vLrF9tWE0=;
        b=R0MBgJg1O0oE7tGvAhrTw7q33gbHFqotDedJwaZ/cycjQK5ig9XAdCDaiDAWExBVKz
         EQRHwMB+KeUmXzpoFzc+SsUz0vMXBwgUvPUd30MEQJ07UdPX8XX9DX1fXeoR8X8GkVqa
         otztwFr9ilXRj32ATW0auUo8Y5rkI1fwV7aSjkWTlO1U4hatGtLus8I0KgnsgJZyxG9p
         zO10xbyd7eTABlZXaYkxSnN43ThBF2hC8ptOVywMvvkNwN9ZwpTgXdci708DXLPp6CC7
         R5CSmHyzh0LL+psUBZRJN+hKerRFtszdI9C6Bnx5iVFwU1AaylxHeK/Sbbmrq3fjIf4p
         0Tcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784534649; x=1785139449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9xHOUNHGElRK8fUN+Vx3VXwXih6zrlUor3vLrF9tWE0=;
        b=VNIADlYsg4pWpb1nnObn4U0T9qkdNVE8upoECgsVciBcNkSv483p2uUAKNWljfLOPw
         vwt2gZVTQDznF182SGmNH8M+kev98yVgx7XVb2R2yQu4Ul71/DISubT3WMC0HANNxzWN
         0HcWsyxueRSOIn/GVzpGdt/vbTnTc9wYsGl9gJQBQQ/lHTVp50CieMOSP3PhKs4q/85I
         ZNR6iTbnwtPENrAlCc2xjv1XSTSnnqHb2FvipOyaZz7qUbHCV6fCeXc6SsGD8fUe6Azx
         aQbhWOnQxqz7fGxYaFBdZ2KNvHOClOw6Nm2FCQ6iAbWKHuqFEeYWBGVMTvDamSv9krtf
         0gEQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpa7zOzWoUUGOVldpKUZZAmLWABFF3qeCzGLfs7qVBuz8Q81BoVdOeVvqJb4BjIGx5rSt3ZaRq91CLHIinU@vger.kernel.org
X-Gm-Message-State: AOJu0YxX9s3PHFYu5DjTV4Ys9WjRTz+eO0x8gV8TbVuYYj5K9cwn1h5m
	K+JvR4HOveIJzKBZCL9KbWHtvd/3BJV2zI2E4rIwoCgC7OliAVMfdoVrr79JuSQVJyZp5KPwRxE
	Qul2Bx1gQD+FNHTs9leCWLhExSr9GD3TFCNaY+Jtn3DdMUNegKZMPOFgflwSWCSHiOnCC
X-Gm-Gg: AfdE7clrLlCC3i6dzRttlH6iL/FCi6jGdkC0pkl193KszZ7ijlwUdmo3qybYPt6oOjq
	fyAQL0QTyehCVM4BPwLuZ/cN2phTqwsQt6roL7UcqVeYdVSnTY+1TzxwhytKGuE/bvL0M+CVyVi
	RqaNI+x14bYWHCEr8qaTVehVoZ2xax3mlEadkdaUNT/v3WP9by1b9p86NdTtY8EySFxkPeV6RPN
	foA/crIcY2/gff1ZrZhYboiSbuw/bFWHRwWuBB0Ush+qknSR+upANZzF0+ki5GZKVBAMafEBm0O
	gv9WKYdmxD1mQ249TUBwRInqz+GeBD4vdQQdo3YgbxF5Mcyvpv53QfG1CoMdrWGyYuasmpcd3X/
	ZdAGNKxEjajK0kENB0WYSoyUBAp9by5zre+8O/eRaWmkmi4+FUGq4V2JLQUQvI8eetREaRC/eKH
	y5lr9JgmT2Zbk/n2koEiOZoyoq2qUZsgVUqPgkxMOoTvXJvOzGpfk=
X-Received: by 2002:a05:622a:22aa:b0:516:e249:e30f with SMTP id d75a77b69052e-5213e876fdbmr126377551cf.42.1784534649566;
        Mon, 20 Jul 2026 01:04:09 -0700 (PDT)
X-Received: by 2002:a05:622a:22aa:b0:516:e249:e30f with SMTP id d75a77b69052e-5213e876fdbmr126377021cf.42.1784534648784;
        Mon, 20 Jul 2026 01:04:08 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e7000c3e2sm4256542a12.30.2026.07.20.01.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:04:08 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:04:03 +0200
Subject: [PATCH v5 01/11] Bluetooth: hci_qca: Add M.2 Bluetooth device
 support using pwrseq
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-monza-wireless-v5-1-69ec6743543c@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA4OCBTYWx0ZWRfX1lTrCUblLUd/
 kn/8NyxGRD+lgCCRNP0jlBx7lE8PA12fLyh+F6CTCLtMcQyM/uzuGRgdV2ugusbgCQGwrX9dBk7
 9ZRpgcycpQx/4t0h9dis/x0eNqOa3jQ=
X-Proofpoint-GUID: 3qOGO8P4FPZSY0-tLydYTurdN3dbMrZF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA4OCBTYWx0ZWRfX24zNUu/x42Qk
 U1T9BwSmdfR86P7mFbS/yXRiylmxPNX3q3zLtJheDsaNXRZujQXgs7AyV2e8GL2QjmcpNLDW8fC
 PAWt1L4ZVH67fEIFb2e0+ElX2Gbvg/CY0OTsF8HYu+1ZhR/i0XdeC5XFVVt3sr//iuStJpBSLte
 rEUoBk2Ap7reLDWQfc8NQhbB730sjJQyx9eOjWc5VDJZndympnljyp+182ESws7ptDDCBvd9XPO
 ROomhto3exe5z0PglHZWZ0bxBn07vW6McpBkF64x2o2JUW5pWPok8q7ZKddUh1nA/o0fcQsig0Q
 +Za1pJsyHqD+58ew14s8Vx7eTI/cpFqBFfbNwc0UasH8tYOMDoKGBpn6Po4pR9YYsIkjDSeJ9mG
 S95yJ1o0pIeo14QXWmnFEejFxBBqdYjT0ZYuNRh558kxshgrg021hzmOemJeWjTJSHz528Emu3b
 rVNMMZNcGA+GVosce+Q==
X-Authority-Analysis: v=2.4 cv=T5K8ifKQ c=1 sm=1 tr=0 ts=6a5dd67a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=14bN-6-z4zEjTU3E0XQA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 3qOGO8P4FPZSY0-tLydYTurdN3dbMrZF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200088

From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

Power supply to the M.2 Bluetooth device attached to the host using M.2
connector is controlled using the 'uart' pwrseq device. So add support for
getting the pwrseq device if the OF graph link is present. Once obtained,
the existing pwrseq APIs can be used to control the power supplies of the
M.2 card.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Tested-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 drivers/bluetooth/hci_qca.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 2444471956197bae62a1c4c3a776c5591780ec02..135c79e696aefe2b37ee7a7a668715360a1e2d75 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -26,6 +26,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_graph.h>
 #include <linux/acpi.h>
 #include <linux/platform_device.h>
 #include <linux/pwrseq/consumer.h>
@@ -2445,6 +2446,18 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+		/*
+		 * OF graph link is only present for BT devices attached through
+		 * the M.2 Key E connector.
+		 */
+		if (of_graph_is_present(dev_of_node(&serdev->ctrl->dev))) {
+			qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->ctrl->dev,
+								   "uart");
+			if (IS_ERR(qcadev->bt_power->pwrseq))
+				return PTR_ERR(qcadev->bt_power->pwrseq);
+			break;
+		}
+
 		if (!device_property_present(&serdev->dev, "enable-gpios")) {
 			/*
 			 * Backward compatibility with old DT sources. If the

-- 
2.34.1

