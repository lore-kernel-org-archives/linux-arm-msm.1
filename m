Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC503CB8FC
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784534660; cv=none; b=qMY0osoqHzPxJ8DW1f9bZ9SoQCe8XKnwzofNsjoDRIBqnXyO3cPf+SSJKhq7cN2uhfqNQ5+MmyO0CkQmr60A2R65JWbSUXCshtVCdY/NcYYH3yXlSqGfh0xs/mNJ8w/K9FeGPoao4SGEqPlK6ZA3QegVSgNm4/zJBU/7Czctzcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784534660; c=relaxed/simple;
	bh=axJo0QsdmJg35RBqGTfo/6nxaHHL0FSyQ0xk2oeWY4I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kjYwu8iYllPN9l5BusULqi4IHjHzRxI3yoDVIBKf8+a+ERIrDwX5eHH7RCKRxwIqo083oZJX2mOzCzLzJRNmEl6VPYBeBiIdIxOubqmzYwDFnK8FK2Mn7b9cOXPdHJu/xECAt5SQZewbMCXOFpmpYSROYf/ECjA0YB9GMxs4Ofg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LkBRKcXu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HA2tbBSx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LkBRKcXu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HA2tbBSx"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RYM11506356
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:04:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fwGrtQXZOZLHM8CW5djIH+FZH0mzGoPJDhLtNrPv7hk=; b=LkBRKcXu8H23KcPB
	FChyV9A0qOOekp5KW04f7D3hfe6JJKYdDRnlgMNorJp0AjaaE1VOzPo35CC78jgR
	NJ5i58li77h6jGDrosvRwj/aLsyqXk8QR1aaXaBwyTQ0jpEYw1Q4cNN8VWiJO7Wi
	a3xuU/daZ9l/39xqB9iBglFYXl88QfFkn6vX/NlE5JXNvVTmrDMYuW+owOVi+C1D
	l3YRDEx1HuYWf4TtuRZ9mXYS96V+Zp9Njh481UIoNoURkBj7clRSTqVLt8kQctzJ
	SokBoDbiOH9tj50J5l+hqR9n+kPl1IiDVNrVoLmz9t6zWDStvDM2vreD07tpmxcM
	apvjfg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bvw313-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 08:04:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d137a68so261957681cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 01:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784534656; x=1785139456; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fwGrtQXZOZLHM8CW5djIH+FZH0mzGoPJDhLtNrPv7hk=;
        b=HA2tbBSxPI1TPSdVVZnU9Mftpz1IeFv0W71yaJzAnkbkghFnKQPcW+EPMM9Glnt23S
         /CWdQzEE6JCEwRQyP/opR0NLRQNInUUsI1RKhyLcxwBVCc06Mr0Kv87iN1BVcmWonLQh
         0nQVr2lh2Dkdbjsubb5M3U7Ey6FUAkkyYv3//BiXTZ2J42BXWeeRVgvYjxsMxNwnRo5h
         s31BW4UKDQ0cFeQEnkmqBShC0em8S2NFnsCxQqC22Ph4dzgZU5JB1Sxu032W9/G6ddz8
         4j6Y0KT74zjdyuc1lbtMk8dSNZMzMt6ev5PmS4stRXUV+QRL/LPNJ+m9hKUSr4ENKGh7
         7ZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784534656; x=1785139456;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fwGrtQXZOZLHM8CW5djIH+FZH0mzGoPJDhLtNrPv7hk=;
        b=GlEcltn/ahfg9197lVmfJc8GeB4N0236LeQ91DMlDodRiKEMneFkt5vkXqZqfJDn+8
         t7wuAul7Xgmtjzcam5Vip1PwL6993t85hmhEBACPo7Rd0aytR4pGONp/ioH9L1F7KwHA
         BYNrXwoAhWrUfh5gbYnkyilEhcinkM5Bc0yw/h9RBstA0RweBdpfQk1OcSpyH1SfktYO
         e946UTx4JYzcPZsYpDa6FJpbzLq0NxvXrbP8GLeBgo6ID6WDS4dcnNPZQINvsFt6O9mO
         ITYl501CFsOClw/apqmRxgTHhfW0uOfhinwfXxSOXzw+ovdHHyAUAQ68iwZ3GrsALG2E
         lFmQ==
X-Forwarded-Encrypted: i=1; AHgh+RpC+hAJysaU9ZgBnc+/FOQZ7YWoEpeRaeIuEYvchmGetzQuMrM+/wb9YHKIL+LG+gmuGzE6qI2THS9SZ8Rq@vger.kernel.org
X-Gm-Message-State: AOJu0YwFdvrie+919k1vtJ6ijhB1Y5eNqhSE4EC2Bchb8Fwx4tyEVDsj
	vf8SMvHCQx3QOB/1LnhcojbSipVTW0ge/95m2mlkYW/Kj+6NjsmigvDn5/oMfCal/gsg/ixzbNy
	VDNjWrZBp7M1jJp4YxYBdByYEcddca4VDJ7FkN9ihlMMw4cQ6xaOIwWwXATaqwrPwkGJgP1d3Mr
	d55H8=
X-Gm-Gg: AfdE7ckeFrmyBbcgSgwNW/WpqHXx9Z95AqCpbrb9W51Jhl5NnQdyOVBlVEtTL9pXQN7
	ap7rIvCxAlveSL915fGgMny8LjUpv/Oa7JBzg/gTy1lwBUbE72ex5o3vlM3T4a3Q9UmUTnEQ7x7
	sxE4zAwRZX3isuOB11aDAOzAuavLFCe7I0h3jjBqMoVlIoZl43UZJvyJwKFI45ppTaRKMexG1WT
	3Hve/QTe/L34WfjyW/CTa4aFO1ww0XgH6En0ANVgeyFZJLPv29eRacdsO9YaaCHWegIEyNad74u
	TqFBmIGPUQq8cqHvwBREnBl8LWsl6VMU9DPHPVY+5WLLOWyBO+VwWqnErAzR46BEw8kvQyq8BQc
	ZQ67rNnogMmbl5r9oaktzkFlyR82QZok6r/FtJyZjxEEWyrwslxY1dHBI77dHQWcyXrBp3rOY8b
	JePYJ2syMpIMdnVncWDFK3LJO0kuH8HXviSFzKrs3uuH6urtXLPnk=
X-Received: by 2002:a05:622a:7:b0:51c:d52:6049 with SMTP id d75a77b69052e-5213ced0406mr130529381cf.28.1784534656090;
        Mon, 20 Jul 2026 01:04:16 -0700 (PDT)
X-Received: by 2002:a05:622a:7:b0:51c:d52:6049 with SMTP id d75a77b69052e-5213ced0406mr130529061cf.28.1784534655488;
        Mon, 20 Jul 2026 01:04:15 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69e7000c3e2sm4256542a12.30.2026.07.20.01.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:04:14 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:04:06 +0200
Subject: [PATCH v5 04/11] power: sequencing: pcie-m2: Report power
 controllability
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-monza-wireless-v5-4-69ec6743543c@oss.qualcomm.com>
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
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: aYiT_oYAc5pJl9AbstUkiUQLsbFTtt1b
X-Authority-Analysis: v=2.4 cv=EcH4hvmC c=1 sm=1 tr=0 ts=6a5dd681 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Wval_j7vKiRkorSqWqkA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA4OCBTYWx0ZWRfX56e+AxBV7Tu3
 +52y0vKkbC4lOix1PwmilCrvBdD4RuZpyCbecuxRqtVP8m5fSmDgMSE3jW52u5CkTCapukzclwm
 ekw3Qls7vRwaczaXvu3QkUj9fgqeA2N3Cnwr+/PoErbi18Vm8qult6QVg3oEHQ0g5z2N57CwtE3
 K6SkY1r2ka+44/OdIeJ2jMdHsIijhHlEPkEgj6x/xWx7GviO7ERn9uAnn8r9EQ01gl+F0EBMZ1w
 PcVwGsyjmefrj/TjFb5UAzG7WhU0oMw4BIMDt7wr4kZsA7ekWOAfPMGDb4h3atsVwV/bvVUUvDW
 d3QkVUULP3MXmPPG/ToUEFPc6hlnESZHaCJIHxoGeKOJFtSx84RQElFu72CgC1cpHAcjpAoZxZm
 /nK0/tVwSUvEF25soRSMb+IS0WpciGmIDD8RHWSMH/CsbCtH8BVIm5cAaar0QGPR3FRacl8CRrT
 x+4PTfJVdNd2Rj9dLTw==
X-Proofpoint-ORIG-GUID: aYiT_oYAc5pJl9AbstUkiUQLsbFTtt1b
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA4OCBTYWx0ZWRfX54mHfkjP0FMs
 B1o9uh4fiG8tjM+o8fbyKoAjxmPtbbB170rJ5a9fsLiET3f/hEzc8XC3e7144FYgzmDmDK029Yg
 CwBFpQImwQV83CA7YHH8Iq1DLdbupCY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200088

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

