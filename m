Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793247597;
	b=dKgIdxomUwRu5ohA5IZ6Klx2v2eGWl1502baRGf102aUI4KklmJJrxYdPoXy4ZxhZf2d
	 /LVnXfhRTIE+eQGlCZJ0uXqOwxSwKcsOCfRu9XqsgawtyMB6qV+60pvzvvItVJ6lU2qbw
	 oQcF3QujqFJ2b8PQ6hnYsaj869PnGnqOzV7rTd1ADnXN+57C5RB3sOY0SsLZHUAgcQUHp
	 tqcVn2wzfLW9xDfoio7wCBiKCVti51N86P02JCwS9wk+HkrMhWa48Gyy7m+hK/hYgvOGP
	 My7nIF3kbA4/xWT+wD+vT+IcAEqMeFRg6xDuvvbdXQ1UmaO73GyDmQ0njXh2RCxjc3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793247597;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=N0sE5Rrg7254a4JIqn8LaORoch9C7DlP93N+XE8pi0A=;
	b=mct+XMRuygqrYAjPLSFNIJS5wnb8/N29broMMgH5wXhm1yREE9bnylpugTt6aejoa4Os
	 4i89/yxwgt74w9r8nyjmU0wBjRzebCj3/Hhlm2IgGzLOXh7sLskWWAFkJEjhP89QhJEvY
	 ugGu7oR52iIeYkejKynmfWloB0zdX/66RYg0QC5KXdBeNqZPlxetBj9UHMaVx4dDc8fP3
	 Q8hubRws/sNJqYkmNLLsocw39SZn5kI/Ed06yQggTJqDB0royt0pr+4+vxLzYEt/SF0jm
	 bo1OM+18c2IP6q9vIbGxSxSmg/lJ6zh1N92qwOHupGlPgV49X1KWCSZtKYuVjSpOJ/g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=csRlgcFV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JJ2s7U3b;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7462606A322
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 04:19:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7462606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=csRlgcFV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JJ2s7U3b
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T1jY3F3438164
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 04:19:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N0sE5Rrg7254a4JIqn8LaORoch9C7DlP93N+XE8pi0A=; b=csRlgcFVp6oRCFUv
	ilpTZi6shOn/BYJJZxxaZQLzR7aFV7C2PHBHVBe4Uu8oAHzI5dYDKHZFJPjLdVJE
	8zL8iPsX9CH8EKRqoLAOnbu3jQDtwE3NZku5ozovw01/UNiVW27b4Wjt1fVMlDCd
	JI2zRFFePIBdhUC7jC3xBdw+lYy2mkkIRjpfg/8MVrA4smMsEDRdvOuxeo8ZQ54K
	dLHNhjz7Warf5l2tcgicfllaq+JNXRW+1typGM/Rm1s55g7XB4BiHsA1o0fbB1Ts
	/ReeSzUvgcfcaPwMT6z7HDCvFSZT3qzfna38hQNgaVK/qRnDxrDFM2o7XUzhY2y9
	olWL8g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkpmc1sxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 04:19:55 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36637676140so2503285eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 21:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793247594; x=1793852394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N0sE5Rrg7254a4JIqn8LaORoch9C7DlP93N+XE8pi0A=;
        b=JJ2s7U3bBm5Y0i6SDhWKntjA9xDRAm+hgqmy1jG7lEOMYOOWIktCf9wfthujjtYc6S
         NbVCtFWlD32L/M3nW0OZMQBAaHqJdV5h7JRv28FvXpFXBlVCGjhmPYHjsVHenDBPpEQs
         mGjBSMt43/93Eb08BR8VMu2ED0NYpHDvNNgS/bmoMkxERPEiQHqA8A/vV1tlF3RfNWAU
         cPHI1JCn9RiI9rHuF21zA+9NAvFL3qgJirqxf5iu696rfbMMrztJsez/kp9SwOHqU87D
         MMCVC1tR6tHkmZdNV28vTM4EkthJQI48sOAJ76Ff3Bzar8DpeVBjO0tVwU8SBtyDVO5W
         NY2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793247594; x=1793852394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N0sE5Rrg7254a4JIqn8LaORoch9C7DlP93N+XE8pi0A=;
        b=IPySWZWaPTxbYXVuws8J6MlaQTjmdcP/ElnZW4ZjxRrqpMu/JXcBxx+O1IdVP5W4mX
         ehE4fPx1ADQij5u5Y4x1qsm2ERP8E71wLKiigRn54LQVPiELlGUSb0ZaV0cfrjsDtkCC
         oiODO8PrBkaAiHm7oa3noEQFjHqjrk37+SELuIN4+eP5W4Zy4Ma9TBhbDnJJ9kOkMleT
         KsJUrbr06cmuMwaBBE+fSByG+Jnq5j956AqDs8OLziAIOW8QwKzd83AfzlIiTyJxFXsl
         T95vPCPhV8JxFHweQAhor76iASBXrb0bXWZycpop7uXyKVuYvbSC8gRT0yAjvK3IndYN
         OyPg==
X-Forwarded-Encrypted: i=1; AKwUvBxbdA4i0DrpM6ZUeq/quJn1nFxb2tPqJ3a9RZRi//LbSMcDvLPl7VvP9SzfciHxu4lUS97mi9oAOiaAwMNg@vger.kernel.org
X-Gm-Message-State: AFq9FYIzXMiexQa1pH7sUM9LMLflXaiHKOXAhp5hhqLEgnv2uAnSLO6c
	AEPK7XzupRPEgJou1ZjVafXs6vqyU0pOxdi+cT/iVBiPM3KDWYR3roYMKbi0YsmSh80+vZFc2pV
	ejcrsRziPgDd3v3yE3+/cnEkKHNr4O+we36lbJn0RpEU2YxUqK7rKdDQp58w11sMQQtf2
X-Gm-Gg: AYBFou0ugoERSqUIhZK1qUwkFAJeOlfPv+kOncOrNk3kRbxuqaQN70m42SBzRwO7lcK
	AXgoifaxwow36v476HIOAj33eKZMiVq8OrXNUU+JrYjFkCsvV9RFuQM5E3qgMKmXLtj7AXEtS17
	eKxd9vrmGGDpHbeumg/pgTE29j5j3O7xIswLwNMJM7cYhm5fy2hyiUB4rMhY4lzDxkoX21BGNVz
	C4s201Gho0SdUUMdnvISIs5kqkVPRIVQ0Zo8znnBRO9qI6/MeFbd7fAfjadP+jEhyuUQaQ7LfbH
	Rq5RotujxF3/vCSOnGBdB1B+6dCrwlcWPPxj4U3JLj/iaMr1ifdChnH6A9BM0HL98QYEO7431lG
	iB72P5967IRRHKCanhQy1mEz+K3KKzS/C/QHWAV++AvkQ8tGZ5oNYnAvGD3vSgTOLc30qKP4UVm
	Hr0EEyLtQ=
X-Received: by 2002:a05:7300:fa19:b0:369:faa2:1fb2 with SMTP id 5a478bee46e88-36a2007c0c1mr6317760eec.8.1793247594412;
        Wed, 28 Oct 2026 21:19:54 -0700 (PDT)
X-Received: by 2002:a05:7300:fa19:b0:369:faa2:1fb2 with SMTP id 5a478bee46e88-36a2007c0c1mr6317722eec.8.1793247593833;
        Wed, 28 Oct 2026 21:19:53 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a237be80csm27504539eec.2.2026.10.28.21.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 21:19:53 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 09:49:29 +0530
Subject: [PATCH v7 3/3] PCI: qcom: Implement shutdown() callback
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
Message-Id: <20261029-shutdown-v7-3-3fd7a76a6991@oss.qualcomm.com>
References: <20261029-shutdown-v7-0-3fd7a76a6991@oss.qualcomm.com>
In-Reply-To: <20261029-shutdown-v7-0-3fd7a76a6991@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: konrad.dybcio@oss.qualcomm.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793247578; l=2818;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=oSqbVmWhiEtExXZiinyFNkHgOXlRYhi51p3ejlcaIAA=;
 b=Ts0eOFTto477uTOtC/lVVj0fCHhKCK2lG1oWhXLuQiuur3YKnTRyW9W94Tb0b+oipIN2FzzPY
 A82yGkUW/uhCoTKna1oPJFYIQaHDHu+UlTlst5qWKyKzvo1B3+3O4c2
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=X4nHu2Te c=1 sm=1 tr=0 ts=6ae2c96b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=kXhGf0cxdCgfIYue-YsA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: E9ZgVJRCjDMDVhTKtpTU7If5ZjlFK5p6
X-Proofpoint-ORIG-GUID: E9ZgVJRCjDMDVhTKtpTU7If5ZjlFK5p6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAxNSBTYWx0ZWRfXzBvhD/xUvUL5
 DcwgDWbpJc3usOhf0R3GZ0nCsTXOtYPsnBuASXArReViCifQ5JAR7Ur1EQ/T+45H1tfVbK9Pwms
 08fXgB9jupJJ4G+T+GMIKYheW0n5GgYkPu2vAe9hGNiEE1r8bmxUmXc4fv+Kb7jhcrKIz9LzP/G
 r1oXcXnxGJOFgCo0Hs5tvCFzISKTQSFTNGFe01GlglI0+OugwKlUVmTUh+5ICL4nkBQ/1e6UA8e
 1G1Zwiczsv7ds1PoCw8bNcQcOWQkBhNVaPBDzLJH3RIaz3Tn9s+w2lMCrRP5bGxTBdClKlA6sVb
 ax//KTn7ABhl0W8zvWQNFTqsM+iLNA404ntLKybcIZTEkL8RyfaVPkTHdeqAqx3Xb8LLKNOuKKi
 AjvcXzHexPvvaBQdJT9ldfdyMqW20hNepQKKNndLcJ27HPe0/m4dsr22vH4hrPSc9UZbEgwnLMG
 ySgQxTnFm/ZArZzUc+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAxNSBTYWx0ZWRfX9+yr7dqCF8x6
 ZXrEFAnNIrtsdUgugI3z7fdA0/lkCEa6LRE1ZiBc0rJDcC1/39RgtDa8oQ4E6UxlFrXjKmzos+6
 jHxWKh38gL2xw5F/BJiJn6p1ZN7u1OM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290015

From: Manivannan Sadhasivam <mani@kernel.org>

PCIe host controllers should bring the link down cleanly before system
shutdown/reboot proceeds to remove power/clocks from the controller.
Without this, the link may still be up and endpoints still have
transactions in flight when power/clocks are cut, which can trip SMMU
translation faults or NoC protocol errors.

Reuse dw_pcie_suspend_noirq() in the shutdown path to force the link
into L2, putting it into D3cold.

device_shutdown() runs with interrupts enabled, unlike suspend_noirq().
Mask the chained MSI IRQ(s) and the Global IRQ before tearing down the
link and clocks/PHY, since a late/spurious interrupt could otherwise
reach a handler that touches now-unclocked PARF/DBI registers.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 35 ++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index a7835e8a51e0..423a90d6adfb 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -2031,6 +2031,9 @@ static int qcom_pcie_ecam_host_init(struct pci_config_window *cfg)
 
 	dw_pcie_msi_init(pp);
 
+	/* Stash pci so qcom_pcie_shutdown() can mask the MSI IRQ(s) later */
+	platform_set_drvdata(to_platform_device(dev), pci);
+
 	return devm_add_action_or_reset(dev, qcom_pci_free_msi, pp);
 }
 
@@ -2451,6 +2454,37 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static void qcom_pcie_shutdown(struct platform_device *pdev)
+{
+	const struct qcom_pcie_cfg *pcie_cfg = of_device_get_match_data(&pdev->dev);
+	struct qcom_pcie *pcie;
+	struct dw_pcie *pci;
+
+	if (pcie_cfg && pcie_cfg->firmware_managed) {
+		/*
+		 * Firmware owns the link teardown and clock/PHY shutdown in
+		 * this mode; Linux only owns the chained MSI IRQ(s), which
+		 * still need to be masked off before shutdown proceeds.
+		 */
+		pci = platform_get_drvdata(pdev);
+	} else {
+		pcie = platform_get_drvdata(pdev);
+		pci = pcie->pci;
+
+		if (pcie->global_irq)
+			disable_irq(pcie->global_irq);
+	}
+
+	if (pci->pp.use_imsi_rx)
+		dw_pcie_free_msi(&pci->pp);
+
+	if (pcie)
+		dw_pcie_suspend_noirq(pcie->pci, true);
+
+	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+}
+
 static int qcom_pcie_suspend_noirq(struct device *dev)
 {
 	struct qcom_pcie *pcie;
@@ -2641,5 +2675,6 @@ static struct platform_driver qcom_pcie_driver = {
 		.pm = &qcom_pcie_pm_ops,
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
+	.shutdown = qcom_pcie_shutdown,
 };
 builtin_platform_driver(qcom_pcie_driver);

-- 
2.34.1

