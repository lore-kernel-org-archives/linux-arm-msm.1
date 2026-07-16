Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956E737E2E6
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784218721; cv=none; b=W2QU71rHn4WeBHTf22eGTY0HEZI1NlT7Em24UQRDLxcz2lvaB7Xk5ZzF7FVbC21zPPWMP3BQkT/deELfBGAkiJjW8m1oywASXPwdaaYSiFcotcLGagDFbPK/4osxYrRr68FPxob8LomS22gKeyqzJw/kdO6UERl2/7c905y/lp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784218721; c=relaxed/simple;
	bh=+a2PwVdZXIN3LhIMygJSk6N3n7PMH7uL5OC0qbZNTaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Snd4+q6alKNkcQabpoIMcQh4a6zchlNZHLe1UBeWrQZkf86usA7Qg7PjgbGNUU3dmORip6aJ/VQfSt2Sdg4tZjOO0g77vJlyODAyETeH5y0NN/b77r79/ajHS6SutT5StkArTxYKpQFvoqaSj1ojIXViVUWVJtkjvcZIuVjj7wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GYgQrQs5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jwinWmL0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GYgQrQs5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jwinWmL0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDKBih2947988
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:18:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bxz9ivOcsV3K3IoCDrb+Cf/SPwDvUEWG7a6NEPjdfs4=; b=GYgQrQs5ChdhQ7ok
	ReS1TaxAQ007HtFnLTqhwEoCVtxQ379eB+DhXh9+EyB3WcpPU8tjWydTQzd+WbsY
	oiOz6wf9BlGenF6QpKTBp8JUVF9NoDGQqQuTd9c0WQtE7aytueC2hYjZ0TSxsMfp
	Ozzxle9TRnByuUSVxKviwTCqzC5K7FDVPlYrgiBBroOrgoyzJSTp+ap8dP39G3TU
	1NXC+PRyxXiNTIHaT4LNz6d0jqJEx+ls3OwkWOlfWekpRFvkJDXWnT0BgQp5AcFC
	Jy4dP07WLACoVYkYxhQXOHrsm/d7UTtWSYKzoVrsdCwFil2gdAEukVqJpbl477qr
	6UfDZw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fen4wbf8c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:18:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1852a86fso77343621cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 09:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784218713; x=1784823513; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bxz9ivOcsV3K3IoCDrb+Cf/SPwDvUEWG7a6NEPjdfs4=;
        b=jwinWmL0nxCwQlr3+JBLMWqen3zzkqEYXZCFjRKXgf8HzsePXWKugihbD8SLNwZ7rD
         R6cGAri7eHBD+mA6/3ja3KGuDpMUQIqjsBRzlsqri/jFXRAWiGbqqPBTW84m9fEWfE0N
         oDY2QKocXSzz7TxSSe6d2By/gNeEVv9/LNxx7UicFKUjT3GboIbtqT3oGVeJ5OHRO6UZ
         ZdYK40WPEEtsmTpgF9A+HIxJhdJFoET5smc7DP2+sZyf4CzIliydf4Z4osBh7geeGin8
         Aw/elL4C1K4ljP8NLQMuxpQ0LqPjZtV8HIn4wHwrymI5usklAy4SRIDRN5SaBLH6P4vy
         8Kzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784218713; x=1784823513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bxz9ivOcsV3K3IoCDrb+Cf/SPwDvUEWG7a6NEPjdfs4=;
        b=faUIlhPV3MTYzImAIit21H6Ug/LJchrZo9mXqss/2ba5FkqEcIrHQz208MwoRQWI0Z
         LSr7A28RMOVekezNsmMM+LcSoC4AFCr+PXK5Wc13aGdIsrNHYS3sFXRO/EMWE7YlqKr7
         DQ8zui+7lmAPRdAasFIeOfvoIyExl2Q+RVEtaNH/v5mrJEStJF1VsZHAUX6qo6NsNDVU
         +1XezR1Sykzn+QrFbIfI0aR5bMNwE6AKZXuBVJgdsQSsyzrmvLum5HGxHepRAj4ABqv/
         Swzq6toMwPTQb2WcdaLLYstMbFvuUulF6bGMz0jyI9Zx4gDAJt8Za0Rj/XKC3XpCbYxb
         NcXg==
X-Forwarded-Encrypted: i=1; AHgh+RqJwQSxq9EnA+5RJKJ/mAM7QymwjjSB1GijTFEwoe3ODKzietRNi0bysMeG/OKA0uFVkqP8QTRwfFXVVuV4@vger.kernel.org
X-Gm-Message-State: AOJu0Ywudos0Tm7+oQONw4XK84aoSkL5NACzYnBZkzUIUP1RVZZ32zsZ
	/ThX2VzARgH1Qx1b2rGsFOv0uvp0HjdaXXkZoeo68F48Rox3COWrF/M7ctqqpQHmsSC9m3ddcFI
	0k1cvRvbay7dBUiVDVXvMYYOBeQ74IrdE96w6InXZtYS1YyP7elH9ucbzNzWvJEAY1dsk
X-Gm-Gg: AfdE7ckqG0m99bL5es0BeJq+TCMvTFSwyh0vfLOPEB+0xdIz9hRUwWsC6CNd3XSu0wF
	u9iPsBpVoTBlBqnm7xVG8IbaNxDzbT1spvVwZdYDn1WFMmNoBOlLz32kCLs6Tm/pNlJxEMgRGqq
	gS/0k1flys9iV9O3BncK8Ykq25Ju77AelEIey3c/wCxQAuH2G1GqStwsRgya3C0SjAjJumcJuBI
	8N53wOYvRyqFr6PvM/tOgOMI6o30XMI86+YcunR2LEMXjZYnNu23ozXbjbAk/uzPL7jZ6EOZQbv
	RnX25gBnIoHdWdnkScRAtDjQxlpgh4FBgIXsprYHo3aCl4R4v10aSG8LXytavy+rXyNQYqCsCp6
	b7KgRwHnGnf1tZmiQ+g6XowbduTsd0ynN68AWPCzU1kQsPhafLhpVeFOp+tVS9IwumN3Ej/Vzqw
	Z17V//sDCmpyn0F2a4lgCbyVXtq3J7AmGS7cVl4y/ql3RqLDM1JsE=
X-Received: by 2002:ac8:7f13:0:b0:51c:7b12:5fde with SMTP id d75a77b69052e-51e42497dc8mr115017441cf.74.1784218713090;
        Thu, 16 Jul 2026 09:18:33 -0700 (PDT)
X-Received: by 2002:ac8:7f13:0:b0:51c:7b12:5fde with SMTP id d75a77b69052e-51e42497dc8mr115016901cf.74.1784218712393;
        Thu, 16 Jul 2026 09:18:32 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c168744bdddsm257262866b.48.2026.07.16.09.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:18:31 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 18:18:22 +0200
Subject: [PATCH v4 05/11] power: sequencing: qcom-wcn: Report power
 controllability
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-monza-wireless-v4-5-9b02e6f549d7@oss.qualcomm.com>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=PsejqQM3 c=1 sm=1 tr=0 ts=6a59045a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=QWuo0IUDA92h_ITipQ8A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: bbgoG1C6-QslXFwZdA8fP0_Ip77dKUYt
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE2NiBTYWx0ZWRfXxb8lYaNu8KfP
 AGm3pj1noSfZ3JdBMFKaMXGDwDaHuuaCl+/ap+lNpvGOCVu3eEtiv0zjklLDBmeGowFxQM4z/Hx
 BQkjmyWjNGUo7v2R3Tbzo7qK85fvKGo=
X-Proofpoint-ORIG-GUID: bbgoG1C6-QslXFwZdA8fP0_Ip77dKUYt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE2NiBTYWx0ZWRfX4FGUr2MNmrWR
 rJ2OYISQ3jAJ1zFWuhWCWV+Kv6C1yFAruXrqYZVDGjDdFrI5UPf8B7J16drOGIPFXhgSG0i/Kfo
 AAmbVBF0ysCc8uBjBqoTxQ7VuewIb+swFnFo34HHoi3pSefCq2tcm+kXFYe0JgWvSf59MJlHmxp
 yMqRjJ55UqkXtGweEY5//wTegmUAGuN+aHk0FEVy7TbFdCiM+UoVR5nCeG6yLNL8Zv4n/xlThtG
 xvd1GCBYfMmcDise9jWD/uDtm6MrXh3FH+FYVshjwwdzS20uJ4d50LAbKaSr9Tx4FNQUPssWB8d
 u9LkdRp7C13xlQGpt3i9zyh0RnMhBIB2xMeI2JfwpBdU07nNniH9eMzGlekPqf66u34XZAg6QGx
 F7OLp3uT+eZARg43iai2uuCe2Q/+7jWStaexlAQdSdJTw3TSqfQU5ulXG3Rul4AqQWJds/iylEO
 MpqSFGw5pfDD/yusoIA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160166

The "bluetooth" and "wlan" targets drive the BT_EN and WLAN_EN GPIOs to
gate the respective functions. These GPIOs are optional, on some boards
they are hardwired to an always-on pull-up and not routed to a host GPIO.
In that case the corresponding enable/disable callbacks are no-ops, so the
consumer cannot gate or reset that function on its own.

Implement the .is_controllable() callback on the "bluetooth" and "wlan"
targets so that consumers can query this via the pwrseq API.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-qcom-wcn.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/power/sequencing/pwrseq-qcom-wcn.c b/drivers/power/sequencing/pwrseq-qcom-wcn.c
index b55b4317e21b626e050e022648147770ca7f386e..19b51c94653b7f8e7e1f5a2fe906c0cc1cd46aa8 100644
--- a/drivers/power/sequencing/pwrseq-qcom-wcn.c
+++ b/drivers/power/sequencing/pwrseq-qcom-wcn.c
@@ -184,6 +184,19 @@ static int pwrseq_qcom_wcn_bt_disable(struct pwrseq_device *pwrseq)
 	return 0;
 }
 
+static bool pwrseq_qcom_wcn_bt_is_controllable(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_qcom_wcn_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+
+	/*
+	 * The Bluetooth enable is driven through the BT_EN GPIO. When it is not
+	 * wired up (e.g. hardwired to an always-on pull-up), the enable/disable
+	 * callbacks are no-ops, so the host cannot gate the Bluetooth function
+	 * on its own.
+	 */
+	return !!ctx->bt_gpio;
+}
+
 static const struct pwrseq_unit_data pwrseq_qcom_wcn_bt_unit_data = {
 	.name = "bluetooth-enable",
 	.deps = pwrseq_qcom_wcn_unit_deps,
@@ -218,6 +231,19 @@ static int pwrseq_qcom_wcn_wlan_disable(struct pwrseq_device *pwrseq)
 	return 0;
 }
 
+static bool pwrseq_qcom_wcn_wlan_is_controllable(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_qcom_wcn_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+
+	/*
+	 * The WLAN enable is driven through the WLAN_EN GPIO. When it is not
+	 * wired up (e.g. hardwired to an always-on pull-up), the enable/disable
+	 * callbacks are no-ops, so the host cannot gate the WLAN function on
+	 * its own.
+	 */
+	return !!ctx->wlan_gpio;
+}
+
 static const struct pwrseq_unit_data pwrseq_qcom_wcn_wlan_unit_data = {
 	.name = "wlan-enable",
 	.deps = pwrseq_qcom_wcn_unit_deps,
@@ -258,12 +284,14 @@ static const struct pwrseq_target_data pwrseq_qcom_wcn_bt_target_data = {
 	.name = "bluetooth",
 	.unit = &pwrseq_qcom_wcn_bt_unit_data,
 	.post_enable = pwrseq_qcom_wcn_pwup_delay,
+	.is_controllable = pwrseq_qcom_wcn_bt_is_controllable,
 };
 
 static const struct pwrseq_target_data pwrseq_qcom_wcn_wlan_target_data = {
 	.name = "wlan",
 	.unit = &pwrseq_qcom_wcn_wlan_unit_data,
 	.post_enable = pwrseq_qcom_wcn_pwup_delay,
+	.is_controllable = pwrseq_qcom_wcn_wlan_is_controllable,
 };
 
 /* There are no separate BT and WLAN enablement pins */
@@ -281,12 +309,14 @@ static const struct pwrseq_target_data pwrseq_qcom_wcn6855_bt_target_data = {
 	.name = "bluetooth",
 	.unit = &pwrseq_qcom_wcn6855_bt_unit_data,
 	.post_enable = pwrseq_qcom_wcn6855_xo_clk_deassert,
+	.is_controllable = pwrseq_qcom_wcn_bt_is_controllable,
 };
 
 static const struct pwrseq_target_data pwrseq_qcom_wcn6855_wlan_target_data = {
 	.name = "wlan",
 	.unit = &pwrseq_qcom_wcn6855_wlan_unit_data,
 	.post_enable = pwrseq_qcom_wcn6855_xo_clk_deassert,
+	.is_controllable = pwrseq_qcom_wcn_wlan_is_controllable,
 };
 
 static const struct pwrseq_target_data *pwrseq_qcom_wcn_targets[] = {

-- 
2.34.1

