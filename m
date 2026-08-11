Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A50E47DD66
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 21:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786484184; cv=none; b=onhK5UKQjKspZGXJHahq9GtqsKOgj2MMP1pGTZTLMcM5weiiQZ0u9Yu2wLFt5ziLm9uSS9s87vSAix2ib7PH5yAe+eJWQqRb9x5puxqb4vfLBOWdFHV4EZ1GYNhdPcwoExLV5iXhC7Etixs34IU9SsvTsTVbLamSz2xsdi6kGso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786484184; c=relaxed/simple;
	bh=602uqRnr/4geKPALzdHhfMzddrO/DsC20JeySJdmI44=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=avLD8yumK0q9UeGiHWlyDFmrYerE2E3NL9yfVOopQEKfHFw+YCzgartwXiT72Mdycd7T00eQraF4uMvibhb+/JOsxkUPSWxRMFqRPKbRUyN95mQwMiTtCtKWVzVrVNdT75ClsHa25sG01crsf59ib/hZYoDHFuQ2gLejOEShfa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RA+UN3Ej; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vetsi/w/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RA+UN3Ej";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vetsi/w/"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BLQDWF2159598
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 21:36:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=hXwC10xhOMC
	8RxzLAba8g0Ty+WY10fUP2dLzQKOuAJA=; b=RA+UN3Ejp4g0utR6+Sot670Glyo
	NQ2LXFol+LExIGf9P6yoniExXEPMEyPmzgHEsh6BqL2Wl2JTKeQ9wSkgOI/0TGAG
	YPAKKo8WE+96bLNbCDT7kDd6Ye3wdnlIVh89NT9nihMuPhz4/DUveInZMYqNGGRF
	6IZyR2/cZ6m5RFFF3cm0qyKFBWy+pEqdbwryOrO05femLhPFUUeyAITqdj7yHvOd
	y/MJWd2db5dZ7rLn79Ao4eCBj6G8QYuZPljHhVLEvwLx4jLV+o3c0rdExBkLtqxt
	OLW4orUvgeMDuj6Jrq0tSyISbo5bfsurh3d9wUUJwEwqDUcf85+yrZtQmTw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049et680-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 21:36:20 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb6433e9d4so291334a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 14:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786484180; x=1787088980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hXwC10xhOMC8RxzLAba8g0Ty+WY10fUP2dLzQKOuAJA=;
        b=Vetsi/w/tg9wMQbRfHkLwrQEJ1t0fM8/xCEq+/5e4NpSUvINVI5lOFwnahLaHXM5Th
         9tctHcAf1tV1IfBV44Kjnz8izG3vB3woGnLwHlezwJZTOQC6rhu7nfSdIs3d/cUb2lWO
         cBIXicBODczUCvgqJtRCEe7PFKZFuzwZ9393ZVmU3S0d03DW38AcXrqVQlD7/BYBOWpn
         Ft5CVPiljqyJ7ylHyhiATRpVfPNZVkPLF1C1BMCX1KiDI82rD22YeHX9+NC5bgIAKWGz
         PhlMID+0L3piFmp2icWahcQjwUK6Jb5Na0a+iUBJsZTYYOevb+i3IsNmMVsS50J0Wo+X
         VSDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786484180; x=1787088980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hXwC10xhOMC8RxzLAba8g0Ty+WY10fUP2dLzQKOuAJA=;
        b=AcQxAh16TLx2HjbQP8IKEFkbapj/KN85+8ngSRbol2EPpH412c+jLnGoYDXyLuCWm6
         pOU+JYaA3xhyzNNlutrl0rBL9Az0LGhE+5GT8krKOeAHs1mPj2F14icMA3gMC8XNQotx
         GbOThuw7ASYhw9ivNqZ8X3dNgdhOp7qrPZeo03Ke8UfNKicWBV+8XhwJyy/tXKHiFy8Y
         h8JkYCqq3qU9DVIYNXLXhey03tY0yeWsou0sDbrWnJCNG00UkApoi32/XV/XVIxD5roz
         X0lSCCu0cxcbAR1vWf2cR0WL7nU3pdQIcp2jmh2vu8acly4PEexoK5LPn9dACxtum86p
         LOdg==
X-Gm-Message-State: AOJu0YyNNNkU4xaqaTc17wMOBVCLNW2FeYDjM+NoHb/8n7no8xIrGh1x
	gagUbssNXbVWintkJEtzf+J+lmlQEDmMOS2U2f9wx63Lh+sVxx6V5PMzqs14XVncL9rCAZDTnnM
	s7VTjCVbJt7esrCcdLRI2A4/5Om5zJpXKQp00H83wdUhkHR3Rdh3knf3hgXTMmSGA46Er
X-Gm-Gg: AR+sD13BMa2kkj7pNPxiIlwp4payZb+ZK042w88QMA0PxagmpyEA/Yw9Wa6N8XMMDf4
	kTaTjD4kfdJ2HetkR0SFHwbdvUJjxcvm2kKWUsCyoOTn0t+pqEVSE306d/mzmkIS1CA1o97xmgQ
	iDJcOGae7YgQnXqZ/mpZ8yAAMl1EmL7tpEQB78WBztaHxv+AieXIXXKDFVkNkV5soYzzyIxmCT4
	er9TrgKEFajv6kiam9GvHK9Wz1uUW25vC/x60kxruR6HD3zJMUSUzMxSiH9oNBgPy6jPqsGDPUh
	DNce3Dy+jBXiJuAEifqv+TAeh3zmwvTgME0+Jc2O4uG0B6AkgMdzxpHzdpXu8RAJe8REctW9HVf
	gf4I73OwW3BU6nJjLBCBqsA7KTTredIiJNqaDeqGhNci/BoXAkF3oTw==
X-Received: by 2002:a05:6a20:9c13:b0:3cb:b3fc:510f with SMTP id adf61e73a8af0-3cc2ba66ab4mr8750749637.24.1786484180042;
        Tue, 11 Aug 2026 14:36:20 -0700 (PDT)
X-Received: by 2002:a05:6a20:9c13:b0:3cb:b3fc:510f with SMTP id adf61e73a8af0-3cc2ba66ab4mr8750694637.24.1786484179586;
        Tue, 11 Aug 2026 14:36:19 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf3c08163sm2713563eec.7.2026.08.11.14.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 14:36:19 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Peter Chen <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v6 7/9] usb: misc: qcom_eud: fix virtual attach/detach event handling
Date: Tue, 11 Aug 2026 14:36:08 -0700
Message-Id: <20260811213610.2956147-8-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
References: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE4MiBTYWx0ZWRfX+HtsZm1KViOH
 Dw9xQS5TJP8h8uNhHEp8KVhlyhpBc+0kA+AZvOQpzZi+KhmvTIMrLk3PAMT7RZmigw2XKqtFIOE
 M494/jv4/9vnrUyYhc39n6P8T8BGhZU=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a7b95d5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=oDIJ3hVRoRHbvujwG_AA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: kHJHa1DkLyi2m1JBeostKh-IBdKYhGkz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE4MiBTYWx0ZWRfX6QzIr69p7VMd
 3ycrdwSYhAKlENFlIeI6szoMk7l837CxM4CULdnPnnADGV3lhimSUUUao4pEYnR5amjyTNxn9nW
 l5aaNOKB66VUGx2jbjpq7lPNnvqmEpVN1RnT54q4uzvpAVdQi/gSRIlb1bFFiJiRMFQAQ1AuWlK
 7WFGTelOWB7Wu+yQYpfo7koU1jgNQ95xhFoaU0y7v4JxHnDPvl0T75vi6e2aHqb2XPdc8fLb9/T
 hCfQ0BJd733dQPQipylARD+BJNSxP0WAzY31IZmtqEFEpC1A69j6wF5XsXdMdoMph9BeC0ohnPe
 7mdzdi6m9PiHuq4UXlQQ17YL6/dtlmZulgX+sydu/vhzdYsO3Tp1q/KpFcYPh7/P5Pzq5CWobkt
 +lJbKdoP62uhwvGeQxK/XvofQ4bvuKurMP68OtjNgbM/Kmm/bwDResWtVaICTpkgd8l67rPmZSa
 iOj0xCACfDWyaphKKFQ==
X-Proofpoint-GUID: kHJHa1DkLyi2m1JBeostKh-IBdKYhGkz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110182

EUD provides virtual USB attach/detach events to simulate cable
plug/unplug while maintaining the physical debug connection. However,
the current implementation incorrectly sets the USB role to HOST on
virtual detach, which doesn't represent the disconnected state.

Fix the virtual detach handling by setting the USB role to NONE
instead of HOST, correctly representing the disconnected state.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index 538e070cc140..a02f3535956d 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -306,10 +306,26 @@ static irqreturn_t handle_eud_irq_thread(int irq, void *data)
 
 	path = chip->paths[chip->port_idx];
 
+	/*
+	 * EUD virtual attach/detach event handling for low power debugging:
+	 *
+	 * When EUD is enabled in debug mode, the device remains physically
+	 * connected to the PC throughout the debug session, keeping the USB
+	 * controller active. This prevents testing of low power scenarios that
+	 * require USB disconnection.
+	 *
+	 * EUD solves this by providing virtual USB attach/detach events while
+	 * maintaining the physical connection. These events are triggered from
+	 * the Host PC via the enumerated EUD control interface and delivered
+	 * to the EUD driver as interrupts.
+	 *
+	 * These notifications are forwarded to the USB controller through role
+	 * switch framework.
+	 */
 	if (chip->usb_attached)
 		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_DEVICE);
 	else
-		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_HOST);
+		ret = usb_role_switch_set_role(path->controller_sw, USB_ROLE_NONE);
 	if (ret)
 		dev_err(chip->dev, "failed to set role switch\n");
 
-- 
2.34.1

