Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07FC37C0EB
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784218715; cv=none; b=IKX0VOVbP/KZDab/ApFMwIgu7zQQFftU0EbCX2c3FiTei8GzOqxFkdGd4R8Jg7Uylilrjm2OWdHAANBXP5lrApimKlE80BRXMVWU/p9gGrudiLzLYemKhyYmEpf1US05NHvQwSpEmNGnEwrbDsxFAe1iFNUUKwaCCIdbL1qU8P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784218715; c=relaxed/simple;
	bh=KEpaGYLJg/HFUQ4VCnAAAa4/K+FU5Ww1paHM4mUD9UU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OX2ZOsyxumhk4MAeiY3o2CAvTdv97y4pL8yKDjNA8XULHc920OfLpxrnyLD4A6zcwCOykFzkFprvWdmtq53QmkL86pKaUGHxUj5ssGaBMwtUszljAbi8qx0yijXPTW+ZjvRL6yjFKMmleTFZ6CP4kNbMp+bYb2hOnirXiys3bc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jOXqOVLZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gAzxOuzu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jOXqOVLZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gAzxOuzu"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GFNdnc3006271
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:18:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9xHOUNHGElRK8fUN+Vx3VXwXih6zrlUor3vLrF9tWE0=; b=jOXqOVLZC6BBHj+3
	XLMie+g+71G9u/wYEPDYrJ3KKe4zYFaauBBV8N/SmJsnKitT5CT2VUecq1mcCWHd
	um/6RrZ6wvAw4iTGGChmed0ie0RpdXigKmiabE+7Lkp3RnzRArloONiBnbL/JLcl
	GBHQ+mtFO5m81hFdr8wH1JH88pDI+0FWeVHV/3A5AUvynHR6ULBhxjLxBwMhz5/H
	gScdlUkHFPFMBUToCkgWmH9i/dt8bwP311Qm4zuS2mGfMRxTPhOHAbYVJW5CSQXM
	VxCwHmYkPLvmDoPrVJ1v8iRkIE59KJJzcQ3eFWtBhNI3osy2GrpBfn0t8vrH/kyO
	zjl0gg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff1we87k6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:18:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bec738909so58676471cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 09:18:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784218706; x=1784823506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9xHOUNHGElRK8fUN+Vx3VXwXih6zrlUor3vLrF9tWE0=;
        b=gAzxOuzuXgVrE2WxsjQyQGxnU6sKbjC6yCuSrsXogOxf68BZwF+psvgBI4jMpa3tkk
         bvuIGIeGvOG2puIc7eJMjuSENfWZPmwaXwrufCDPEw7DWARmGw5nul7IFeVqUZ95VzaI
         dly4Uv3PiLOqlnMYaSBy02WwNRd5ab3CpCQiyCC9XCCn9AfvDe9CuBfkVhMv4TMVGOlq
         pk3n5EPID2ipOoAya3E0249bJhFVEG1ky0mAwDDKQgv5LI8hfCmi5750UdMlYmKG0qAP
         EAdGvRMGsIxzNCrEXJ8vXYOSLoopVScZPoSAOrRyGZADrtiK9uLMz2/U5f76OVrurn6C
         GkcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784218706; x=1784823506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9xHOUNHGElRK8fUN+Vx3VXwXih6zrlUor3vLrF9tWE0=;
        b=cVUqEKdDNapwbhp2IG4zpXJklmG1SejSomYThB3LKVqzQOWfrKh1kv4bJjAXDuG1Rh
         nxTS7OszFtmIR3/NNOVBb5C24Wtm9NrSBAkkhvlzsebs2aJ/l4V4uHVx+TlD6DxKcr8B
         i0q4UXrKI7wx5p+WARe5dIJPeoFBi7wcO3VVfwevsX80KOmneUWGnxfwCCOffAsCIJPQ
         zPQQqssm0Lnkurn3HSzV0ijFO3oDdsnIrbo3s1N2zIlNQU7stzQmgnj5XHGGQI/96Fhv
         6g/LxT6S1ct2SRG0VKsL/flejbqdbzZw4Yk1bc5quAtvh3FmPZwkxY4WV3wLfOiROefY
         RD5w==
X-Forwarded-Encrypted: i=1; AHgh+RrmlL7C9tOuQIQxfNrDFgRWh+WLGAlw0rXwUILrWvIvybhgj4vCgfvVdWasxNYuteFvL6H0sHK8za/BOmGI@vger.kernel.org
X-Gm-Message-State: AOJu0YwtZIgzBya+AdA7IMOCbh5RstECeM1UpOYp3nUmVK6bGjy+9GHt
	yIq0XfZrfK7Tiv7mGTdzxkLFTQZTKf5YrM779gJdhbriFUIS2g5GsrVr0UJZbMSrJwCePuIHiqJ
	AH0EFY8nWSdUAbS9l/LJD8d7HgMC7/hSJt2Hupwl6nB6HMviuy/BVAE0febkrJvCrVNKp
X-Gm-Gg: AfdE7clAecVyru93WxHMBT1rNSSXwnClib/CXESA0Dr5L0usOB+id9PkiVxiRxZD15f
	aBBgrwtQJYLnN8KOzkUOWheTLqJoC31YH23KCErfK64mqD2X3nC4xHAAyBDXnmT9ac3V1Cb3Ezw
	19gUCjvc4x6lIFCXORlT/ilhgPUw1paRf4GofoyreABB1B50rSQezyxl9rQg0KmVOUjeC8lVVVQ
	NefJiuP9CrUR0VllQe3xPC5hAKtlCdKpd14zG6y/1+bb8Z+B1f335bQkaY5LLBGIahxn5TZvlbR
	sjl2OUSvPRbuk8JWqObDpPL4HPNMs9ZOVUJgjgZbQCNOXqmzNkL10ciRBHNW1gsqRwX5fAnVoOQ
	Pk4gnmX/yXc59NHst0DkhBaiv+1nxn++Au+11nnuhxWoErS1R/H1cTcqPBLz6GNrclmO1Uzd6sZ
	5P395IlncaATV1Ft/kPwIMSyCVbMlT2dx78NFnSyhhWPQtWt5cR0o=
X-Received: by 2002:a05:622a:a888:b0:51c:43d8:8604 with SMTP id d75a77b69052e-51e42453df2mr108397871cf.51.1784218705259;
        Thu, 16 Jul 2026 09:18:25 -0700 (PDT)
X-Received: by 2002:a05:622a:a888:b0:51c:43d8:8604 with SMTP id d75a77b69052e-51e42453df2mr108397371cf.51.1784218704675;
        Thu, 16 Jul 2026 09:18:24 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c168744bdddsm257262866b.48.2026.07.16.09.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:18:23 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 18:18:18 +0200
Subject: [PATCH v4 01/11] Bluetooth: hci_qca: Add M.2 Bluetooth device
 support using pwrseq
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-monza-wireless-v4-1-9b02e6f549d7@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE2NiBTYWx0ZWRfX5/VNvxYvUiE6
 jptWd158KQoHqDX7k6gygevy7AZUveh7BbN5DVrKR+3ljukPN+S6aVS8rQlPJ5XlsSjYyImH8ze
 x6f53fBGhjiduCBvNNe3zquNSClJukpdG4R3UpOpRXn0ZaRnV0XUJLAFu5q+wL489JDFgtNflRX
 MNvIYpFGRp1fN4A1DIGTMKdCZEZu1FcCE/BDsvIFFEuRpaEZ23bY9gAVLC/QIuRmviy/al+jadz
 n6Ore6lcZ76srqhTLpJw8EX+LZ/IoXtOtVi8l/e+bg6/Fu7vV7qgstX8px2bAY0OTvAsQ5QmQDB
 TzlR/nPthILviA3JPEVWucEJd+jVvUSDGn7aEEmkpg9/4ou++YwG2gKafQjcZLDestG3lfyhdYg
 cwWWGkxulXhNc9o6oKfBx+a76qYfo7q6bIYvUyOEPCy/Yv9UHQVqw+GtS8tsriAAY4h2Mews0I4
 Im+JJelia+N00ZjHVIQ==
X-Authority-Analysis: v=2.4 cv=JJ8LdcKb c=1 sm=1 tr=0 ts=6a590455 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=14bN-6-z4zEjTU3E0XQA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE2NiBTYWx0ZWRfX4PFM0G0Gvr3t
 mUqmeP+4l3ckmNZZbFuiG9eZLXOPq6Tg4pXlgnb47ABuVOQWFgZxGBhQH4umUIFEauf01fNlxAv
 hgxQtJgT/zgoWnQ0g9EdxziQ4zoR9Ak=
X-Proofpoint-ORIG-GUID: 3-wW25md6eis-RLthnvOzFm4vMnldHCr
X-Proofpoint-GUID: 3-wW25md6eis-RLthnvOzFm4vMnldHCr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160166

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

