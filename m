Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794015961;
	b=Z3BDCKWFSaya06rdowmjDn33lGaWmZXkuEU56skxrOQLQSqoB7fRKg6t7F0TYdKqO9ih
	 S8hDwM+5kMFuBCFtc79gx7vzZi1AKFEe7YaSqvu+Ff3peWniQZrbYl8chm5llFxH9FfhL
	 21kQsR6YJy8eAb17bqEsCAslShFJQHUBYL/oLaSAOXCKxR7txyfcGjA0e/IYVT52zM+aW
	 Az9pYMVZGfTcxdU9/AvSkSKaNbLJvUwW/rYah8kogPMcnXBESQIeFzaON2Aq/gIw+WZgc
	 Zifgy8sZI+Ur8VsDuWcDdYPDOCt+ZCzYa+0IDeuPADXdMcsrf9zVZ+PpyRmFoTgN8Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794015961;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KMNbb3rJ4gmMLXtZaN4598zNytchSh1teJ1n3udB1yM=;
	b=TpzIkrKNmML2RgW2RiOpxtPDO+EoU13djUYVv6Ye9grlW2ajMcrQNLYy2rPtneW5Ze2E
	 TfYOyPBZap+pPGNLxxwLPPEzsOQ66bkimSaaZpTKnLpvvLXn7hVSbPzr3PhBS7uSFlpcu
	 +rmjFCgQ53N3+9oxr2ai3vitmypNwc1tjzLHoHkwHpbHk3Cy5Cp9PvtmK72nK8g6yjsYe
	 bxr/sKWf3dDHwThXcwmVEuG8CpWfUVHcXzWS0TcW+jonDI/K0q73JdJQ9Y22QpINxuwsz
	 8T6VuvDniN35+Lu0Pf+gzZJEAu7s4ZSFADZmGNrHYqZI69/j8itgsJ9JHhEVJ5uCG9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZdJ3sFAb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eAPd3Sl8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F86606A334
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 01:46:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2F86606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZdJ3sFAb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eAPd3Sl8
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6MnojO1063672
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Nov 2026 01:46:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KMNbb3rJ4gmMLXtZaN4598zNytchSh1teJ1n3udB1yM=; b=ZdJ3sFAbH3yC+84h
	70jmoOJGECZQUFi0TiJNg5baGsmFiZLPfPl2KQ+T8tMaCOD4tBatSh8ZeEox7E5X
	YkwP2Jd7z0B5LGYi+0zgiXhrSLf3LMA25b9CtArmh/lMjJ8YLs5n0TxMIKK/jGG4
	LkvzWRQF9a/cGBC/AOfTo9+UM8R1papwsi9puvvfPR7aIEz/v019FPyeyWf35JkJ
	xxBCQt5Pi+bOvC3lLoTlc4YYKlvMSP+Bt4uLTbaJ/yTtzzGT6YtBPKVujOrLBbz/
	XGk1Zh5HDca0itJpzifO0vcFnOCfX23PbLrrdNl4n+PSXHWoeXIx6ps93LjenZ1J
	/AfBCA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmyv11y6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 01:45:59 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36d69ab3c2bso1609155eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 17:45:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794015959; x=1794620759; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KMNbb3rJ4gmMLXtZaN4598zNytchSh1teJ1n3udB1yM=;
        b=eAPd3Sl87xiDD2KsA50PV7Ot6bjF8vzj4eqcPsWilMaA2rNVfAWLEhFiaShFnSIoM4
         1+pylxAJGOwkuguEZ8ee7uVWCJWBna12cVU6YNPEJjozH34xJiWJFSP/tKCw8jfHyMHx
         yO/KD/76+v511Dq+KP1WtuJLeZ2M+fMKkBcL1WTl6kJ4J/+uDEBLus9xKE9DI383iIHv
         YPuN2D2ET25Q9/DHt2vZcVYNBqvhAkz1jSMjAml6nY6+DYqyuZ5AADL1qmpgmOqcaLPR
         72tFrZ//KrU/BPfazcBKH9Teu+U+NjL72ULvoPwrl9x3j5x0R3lwOM+Xbb9nknqbM75V
         2jSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794015959; x=1794620759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KMNbb3rJ4gmMLXtZaN4598zNytchSh1teJ1n3udB1yM=;
        b=eChEUW+BAuMH162EzvHOKjvMhYfvEIQ/pJyPhV6B2dxAR645mpTVfeJUC1rmfWXGmy
         rGHGi/LC45cGb2xHFWi2/XaLlUdCwcDdykZGxXZgwqbwYSI7+jubB7T5B42BLNbnofwo
         Ptr8KHPPi3++5bMurb//ebU5++Rb4xp9UQ7SsMD+aa5zQ4/Xd1W+NpMwDeqLVI2IxPsa
         RHzA+mWsMGpBrbdAKxfSPszaNjkHtQOgekl/Ak7aioh3V123NE6zJqQZDHV/l+qdSC4h
         m5jWteEit8O5+Q4Lqf7j4lX5YnTXL8LCODmfpulfP4+mEu8ic0QoQEYApYOdhe4QUc1I
         Zkug==
X-Forwarded-Encrypted: i=1; AL+hErEssLB20GOQ6qBchHA+G4Y2mab7J8Q/95Z/8OqXNw5YjdZhn9/cI2iZJ7rYJPMsZ+3b/dHt2Yi/YNgLcZc4@vger.kernel.org
X-Gm-Message-State: APuU4Z+FeFOvblYav2sdbRN8p+VKzjcjy4t4n6+3rgbUkeQP/n9gfLjp
	ZAcU3fHWn65hd9FcqAZn3UPIbD46nsKLuRpYO7d4XQUa8zinMB4cferZFAynJjI7F23hSbuOvQj
	63fpbYjFN/sfwitJxCtu46nbifbj8OBnIo/wKbcjjGrOTbvcZqUB39mNPANsY9RwGe9JX
X-Gm-Gg: AYBFou0j7IVYHaty3m95l/33B5mGzV+AoXZp5EbeBlhCSiGEBBKNQ7SiOiIAi4z4Nr+
	laPH8f05fz7SfBMYDqe0FalLR9aPXQl5u/wYUct9Jr23kvKNZ3ogVMTEKLUafOV/OnB3hjX8a9d
	FJ7q2B8fbSaECuYJz9IKwO6CWc54YwVJkQVVMeTCLfRosYJPIwT1W/lATt8XzkKsuyoT5o9Q2Pi
	FFoNQs/KKuIujrGMyPaYqGNvGvN7JCLcAkFPfF39CcVTQleTUm51MCXPmIZvtMElHmryadjtqIz
	yeHhe9+9nvLPEE0ZsNusnh8e/2hPVaGbr7EnZ4xZBrHb+hCwFD7LMLy1KcHFonW1MirExzOhEhD
	tXb65EDfzz+Cy2oe2CIhLVLtry87UeFS81Fd3rk7IK7L9cdV2Nuv6bSq6C3LD190xr6W3rToTu5
	21r6uAdFc=
X-Received: by 2002:a05:693c:8859:b0:35f:2bc:82d3 with SMTP id 5a478bee46e88-36f75a25e5bmr5793962eec.15.1794015959212;
        Fri, 06 Nov 2026 17:45:59 -0800 (PST)
X-Received: by 2002:a05:693c:8859:b0:35f:2bc:82d3 with SMTP id 5a478bee46e88-36f75a25e5bmr5793925eec.15.1794015958533;
        Fri, 06 Nov 2026 17:45:58 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651e6b1sm22861123eec.3.2026.11.06.17.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:45:56 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 07 Nov 2026 07:15:22 +0530
Subject: [PATCH v8 4/4] PCI: qcom: Implement shutdown() callback
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
Message-Id: <20261107-shutdown-v8-4-bf607c6429b0@oss.qualcomm.com>
References: <20261107-shutdown-v8-0-bf607c6429b0@oss.qualcomm.com>
In-Reply-To: <20261107-shutdown-v8-0-bf607c6429b0@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: konrad.dybcio@oss.qualcomm.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794015933; l=3339;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=JmdrJ94XKia0WQjg0e57QQB8kLzW3inNONqx8lGBXPc=;
 b=917PJjZ5B/jW1tBkcC6BNjr1EG7m78SUtwkcA81Uk1hI4MbokabZNcx45AgfwPErtQcumeFaD
 DSWeUH1OEOVD5G5MfLTxaJNVQmhsOzRuDc5841/SWIuJUbHw+HbEVAz
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: 2d6ZgJYwAePIfWQxowEw7Tzcam2xcz-l
X-Authority-Analysis: v=2.4 cv=IdYSymqa c=1 sm=1 tr=0 ts=6aee82d7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gM652YqJFP5vwQx0TG8A:9
 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDAwNiBTYWx0ZWRfX9Sesv1PGTYTP
 739Vp8o/LFNv/X/wZSqejMC+xkS2nP7g/9fEybOuYA9OYgrH4ndv6RwBZGKK8cYD0bQh4FcSZ8Q
 rv5r0cv9HCvEtiv9tBsdKjuEjhDGR2s=
X-Proofpoint-GUID: 2d6ZgJYwAePIfWQxowEw7Tzcam2xcz-l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDAwNiBTYWx0ZWRfX8sw3aPL8GcZ5
 0m9C51m1JCzcWaawMNEJI2BO0pgK3irx02l2haPd6RWydoY/PvoMyCcGoutY39yKnZ37TfTAlOz
 hgnAmYNJMyB8mhkJfzwekQBrRaUnNqoQ/1n8+XzUTVIk8/azCN9aT7nbbIJf5S0GePv5faPVcHO
 dZna4gqegNOl7xGrn/fM1Wz/QTrz7GePy4QPOTqDX72jVspk2wxfMhdCPQLCKnTlG/df9Zr9ktf
 l87rOglmnVdLJZfGx4x8SD22f2sxo7/e0z5IKfAukWKBNoR7pdG1PIcJjiI9TXIS5XSh6qDxHTr
 /311tb2wh7FPcHL0MTeYnG3kv3iNsdCviVajMdZR05079SKiApaz9rstd+tjmpocz+d27s71IXJ
 4L2oUROlISYahMESMGNjsIYU4ZLlukkFLJsAqVeEq2jD4VUr0gC9w8PAPTVS2GntEi8T0yuBcAj
 cRz+xCusqdH7THwRC4A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611070006

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
reach a handler that touches now-unclocked PARF/DBI registers. Use
dw_pcie_mask_msi() rather than dw_pcie_free_msi() so the MSI IRQ domain
and the MSI mappings held by downstream devices (which device_shutdown()
does not remove) are left intact.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 41 ++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index d39753f0e724..c5b06db3b92a 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -2046,6 +2046,9 @@ static int qcom_pcie_ecam_host_init(struct pci_config_window *cfg)
 
 	dw_pcie_msi_init(pp);
 
+	/* Stash pci so qcom_pcie_shutdown() can mask the MSI IRQ(s) later */
+	platform_set_drvdata(to_platform_device(dev), pci);
+
 	return devm_add_action_or_reset(dev, qcom_pci_free_msi, pp);
 }
 
@@ -2466,6 +2469,43 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static void qcom_pcie_shutdown(struct platform_device *pdev)
+{
+	const struct qcom_pcie_cfg *pcie_cfg = of_device_get_match_data(&pdev->dev);
+	struct qcom_pcie *pcie = NULL;
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
+		dw_pcie_mask_msi(&pci->pp);
+
+	/*
+	 * In firmware-managed mode 'pcie' stays NULL and firmware owns the
+	 * link/clock teardown. Otherwise, skip if the controller is already
+	 * suspended (e.g. a prior resume failed), since dw_pcie_suspend_noirq()
+	 * would touch DBI registers with clocks/interconnects already off.
+	 */
+	if (pcie && !pcie->pci->suspended)
+		dw_pcie_suspend_noirq(pcie->pci, true);
+
+	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+}
+
 static int qcom_pcie_suspend_noirq(struct device *dev)
 {
 	struct qcom_pcie *pcie;
@@ -2657,5 +2697,6 @@ static struct platform_driver qcom_pcie_driver = {
 		.pm = &qcom_pcie_pm_ops,
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
+	.shutdown = qcom_pcie_shutdown,
 };
 builtin_platform_driver(qcom_pcie_driver);

-- 
2.34.1

