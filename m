Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E69637C923
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784218723; cv=none; b=ZxgQJHohxbMHILwAlcMmVjcM/SeB9RYjbORtamiDAs6mxwOiYGzUjwGODbRxQn9XuTegPSz9Nr0IYOkcLW/PUvCuWKSXjJHD9V/OgxWrsxXI4oBt0GGdGPT1lLRTuHbqR6uTIvwEVupcXppMCU6YijOy6PiPBaNtRGf0CaPblKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784218723; c=relaxed/simple;
	bh=axJo0QsdmJg35RBqGTfo/6nxaHHL0FSyQ0xk2oeWY4I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ee8kFQdj29khu5YbWWfk/9EEycqrxHY1oFVuPKu8tkrVSUC00zK/K6ObuocyGnJZwn5ePkBW4K2wsVavoIgDnqiP97+BE/JRpwN5JJdPb0BGzPunwf5yBFIdcBrDhpX2Bch5zhCbnC/7nksMdPClgjvM0m1Bv54tm3kAteNRFHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YZhImFcT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YBf1Tk4x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YZhImFcT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YBf1Tk4x"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJnvF2897295
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:18:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fwGrtQXZOZLHM8CW5djIH+FZH0mzGoPJDhLtNrPv7hk=; b=YZhImFcT5m2pF49g
	syOvP3NGIYqkDogY3x5jnadc1wR06vX/bkETO3PenWTUjQ+T6WwEd2ZM+IcXWgyO
	zV1UAP2Yrn+gT4ODEp+2KZmDDaQJzmtbERrwA8trGQ2hojdEqaXMbjwsph830Qu3
	plAVXxqn7AOsHEhpPkLlrrWd0g4yx5jgw2tBaWoQmDnQypSCxP0SzK1zwiH14tR6
	nutMMBFRLxuX2ZPwLopXt6oozxhblP+pc4Dubi0IwOCXAWKs67q94CnKWHjtu5rp
	gefAZiXvinNRiqrR2yGh4pDiAc5JqOShuyEJNwWNTqZpEbamiCjWs5NJj5p0W5eb
	/6qZPg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feve1syre-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 16:18:31 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1c7f135bso65090071cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 09:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784218711; x=1784823511; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fwGrtQXZOZLHM8CW5djIH+FZH0mzGoPJDhLtNrPv7hk=;
        b=YBf1Tk4xG3ILd3nGus6Wf2eXG3oC2UO75IFEuPuc7NptmKJSqI3m0YjFdLNmMCRdlq
         b13mDDFM7NVzR8T1xnnW7um61Rhuu4ReXL7azUQVpgeniHIuj/bx0pNaFHA+GGCKs9x/
         8zZXuIBkf/RmEUTl/fzOhYO4h6iWpyzUC+TaRuVNluUIzod6APSSBf33kMD5MQDAWIGv
         mkm9hVYIIEAHARAW6iEx1xBM9Ewuj2plBY+Nj+a1m1TTj07Y7qTsDbXGLeZnKDj5BTvX
         F9/Uq08CfKJOARcENDEK427uij+aEkZ+LdNhf1GdUtLQ/FxQ5okiW1TawHEfxzFFwlpu
         Yndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784218711; x=1784823511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fwGrtQXZOZLHM8CW5djIH+FZH0mzGoPJDhLtNrPv7hk=;
        b=q1aVeaD0TIvDQpdikWPZZyOyppYJTZ6RpF84VIEVAQZJQXMfdRwKR4S0qUVpTa0aoI
         p+LxxsGsDN4WeASJVYrIw4KsxDw3LpwZGQvIzS5FQU4u0u5RwVEPofTaxIJeW/jeQ3X4
         ++dKKfRZD+C5f62gogpPRkNlBilAi/qTEp0KP1EQboByikDicUveqtqiQq7g5pZglFTF
         GsEbyoooDj9JgtNAfrGmh5C5V4MbN9F+b9dgjncxU197eAKCA2ZpGp8hXBHH3ZwMU+at
         DOz+SSKafqY/wHuDFfK6c+Esqonu1QxpelDGc5k0KgPnXhM28CIhTFUmD3KZSckwhXFo
         bvtQ==
X-Forwarded-Encrypted: i=1; AHgh+Roqh60BvNfZ96IXpbFyqeKwCr00aergitxp42Osovnz3+irDuJSGLL7EDur1z6w4g6tgaWyZT7AnrmhEC4g@vger.kernel.org
X-Gm-Message-State: AOJu0YzoBntVCFvLrOE/MUytAtxNWZCvqJY3OXW2ogDCurJDLZpiSJlV
	3lJ/UsTGnTqYcBKhACQEwvmc2wJS4lvrGgS76DPcMBfoXNm/KeD2xaho0iLgCwnuetnC7HC9S5P
	oPUfdseC1J/VNQU4FacSKiDkEuUL207I4wD7r9tn9/IPtpMoo372sMsCCvvjiPNgIyPHD
X-Gm-Gg: AfdE7ckmSDMkpJ5Ee35QRpmttGlP1fT1Xkr+iQ7TpYK6Gpgh+up2Lb5VtvGtP4g3BP/
	3pv4vnkGDnKrfVRTXqYL5QapkEK0TNVEr9x+lXNA7eHNagng7zOdHTz9hQq7H3sQhcVaD+hBr6W
	FSVP8GKQ8qAdr/CK/x/ZI7r9ipOH8FTgfjw2E63VlKckYiKpJeb7SayLn/pDo0EP33b94zewtHc
	u0CvswNKjcjdN8bhcyYthYwFJwBqgkBpC+2pZOfAcPraVnwExLcusvQ8cvucICmejGQ/+FwMAiO
	H6kf0grRecJuey+tRe5prab/sYkg2inWzVIbdbrGumEjrVuh/zTZMSTG2hLfVi9E0hjRdLE7pjR
	AoDM9KDcN6ht4CZdzMDsE7gaVcWja823wudAazcC6BD7/pGMhJDkqahWbwFXtrpKOI88Om0dqWv
	zj5UHaa70S5OOXBxa5jUr/SJNz6LlydmoNGpBtwwTLB+NZbq8CkLg=
X-Received: by 2002:a05:622a:248:b0:51c:257c:8166 with SMTP id d75a77b69052e-520bcdf04fdmr2656461cf.33.1784218711342;
        Thu, 16 Jul 2026 09:18:31 -0700 (PDT)
X-Received: by 2002:a05:622a:248:b0:51c:257c:8166 with SMTP id d75a77b69052e-520bcdf04fdmr2655801cf.33.1784218710638;
        Thu, 16 Jul 2026 09:18:30 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c168744bdddsm257262866b.48.2026.07.16.09.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:18:29 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 18:18:21 +0200
Subject: [PATCH v4 04/11] power: sequencing: pcie-m2: Report power
 controllability
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-monza-wireless-v4-4-9b02e6f549d7@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE2NiBTYWx0ZWRfXzZ3rDgA4EEg3
 JFxwggKK9MX6ofbda068B1dthsdqmEHUAYibgHxDE/bO8iKw3R3JmqxWttPQHaHYyfZAKUjsXCG
 AjEtJg7YQGj6BX4pQT7+DHQqO1c1ZO4WoST+XZvTqVOHVZjkMTdVQPTdDQwMRNTcFn4QdlkIxa7
 jbnbzdB9Eb/tXAJnzbHbMpmhwztC5eHW45SSefcGNbi5CLmx9U3fI2uZ/L/m3vXMZ8jtTs4eRBR
 t+1GyIY0e1/0L6jKPcuN1ApEWYFV32Q+zmQsqgJtedWTZ41QcjjsZ06fmK1r7fpG0yWYZQEDAkK
 u89c9nkPgSqJ3RTUQ1UwTDpc+1+L5dpGQj0OqEebPAEwVqPfvkc978iVCY6spqPyzUmfSmVKA2y
 DAWdp0FeIzEkUx8f2Vyo3iQF5SdGOzKxs6l+g9uxKNMEat0z7DpOUIbGPnNhGEvA7eG8tNsaPbp
 Wn9ibjSEtntb5r34Wvw==
X-Authority-Analysis: v=2.4 cv=DvpmPm/+ c=1 sm=1 tr=0 ts=6a590457 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Wval_j7vKiRkorSqWqkA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: UuIgil17yFF5gsHINkP8rrtu1OOWyHEi
X-Proofpoint-ORIG-GUID: UuIgil17yFF5gsHINkP8rrtu1OOWyHEi
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE2NiBTYWx0ZWRfXymZdmcOh7e4H
 Ipf9DQswMqVXo6B9AjpklqGMC8vvFL8i4YbdZGh907tpkRKCg7U+Po5JlHds/2CaAobtRzHu+No
 m9j0XSnJEIElEKKfPIDLJyWTUHLDtVQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160166

The M.2 Key E connector gates/resets its functions through the
W_DISABLE1# (PCIe/WiFi) and W_DISABLE2# (Bluetooth) signals.
When a signal is not routed to a host GPIO, the corresponding
enable/disable callbacks are no-ops, so the consumer cannot gate
or reset that function on its own.

Implement the .is_controllable() callback on the "uart" and "pcie"
targets so that consumers can query this per instance (based on the
runtime presence of the W_DISABLE2#/W_DISABLE1# GPIOs) via
pwrseq_is_controllable().

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index e3ba9169144dabbf0c553c0a4302c3b511fcaaa1..8e4cb778e31f66aa171ad9831d4213e17d2e6145 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -84,6 +84,18 @@ static int pwrseq_pci_m2_e_uart_disable(struct pwrseq_device *pwrseq)
 	return gpiod_set_value_cansleep(ctx->w_disable2_gpio, 1);
 }
 
+static bool pwrseq_pci_m2_e_uart_is_controllable(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+
+	/*
+	 * The UART enable is driven through the W_DISABLE2# line. When it is not
+	 * wired up on this connector the enable/disable callbacks are no-ops, so
+	 * the host cannot gate the Bluetooth function on its own.
+	 */
+	return !!ctx->w_disable2_gpio;
+}
+
 static const struct pwrseq_unit_data pwrseq_pcie_m2_e_uart_unit_data = {
 	.name = "uart-enable",
 	.deps = pwrseq_pcie_m2_unit_deps,
@@ -105,6 +117,18 @@ static int pwrseq_pci_m2_e_pcie_disable(struct pwrseq_device *pwrseq)
 	return gpiod_set_value_cansleep(ctx->w_disable1_gpio, 1);
 }
 
+static bool pwrseq_pci_m2_e_pcie_is_controllable(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_pcie_m2_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+
+	/*
+	 * The PCIe/WiFi enable is driven through the W_DISABLE1# line. When it
+	 * is not wired up on this connector the enable/disable callbacks are
+	 * no-ops, so the host cannot gate the PCIe/WiFi function on its own.
+	 */
+	return !!ctx->w_disable1_gpio;
+}
+
 static const struct pwrseq_unit_data pwrseq_pcie_m2_e_pcie_unit_data = {
 	.name = "pcie-enable",
 	.deps = pwrseq_pcie_m2_unit_deps,
@@ -133,12 +157,14 @@ static const struct pwrseq_target_data pwrseq_pcie_m2_e_uart_target_data = {
 	.name = "uart",
 	.unit = &pwrseq_pcie_m2_e_uart_unit_data,
 	.post_enable = pwrseq_pcie_m2_e_pwup_delay,
+	.is_controllable = pwrseq_pci_m2_e_uart_is_controllable,
 };
 
 static const struct pwrseq_target_data pwrseq_pcie_m2_e_pcie_target_data = {
 	.name = "pcie",
 	.unit = &pwrseq_pcie_m2_e_pcie_unit_data,
 	.post_enable = pwrseq_pcie_m2_e_pwup_delay,
+	.is_controllable = pwrseq_pci_m2_e_pcie_is_controllable,
 };
 
 static const struct pwrseq_target_data pwrseq_pcie_m2_m_pcie_target_data = {

-- 
2.34.1

