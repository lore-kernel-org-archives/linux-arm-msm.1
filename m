Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96216551994
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 12:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788956697; cv=none; b=B+STLOgrA68dCW/K72T+w/BvxR0VgbA55BSxYmGJUcUsA3bE0x09x+K58/2rm/plzTLfB+ERghDBF9i7zy+4rjLI73VE/YeFlpKiif+W7347XCEUTiBJ9dkcssfd/ue5syijmlBWIP2htm8Dkz15INl4gvGUFvxGttTMxX2Xz7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788956697; c=relaxed/simple;
	bh=P30myDYvP5LX+sAmrDp2DePMK7hRN57B5V+jKtsyPLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Azdc2ouqQyTriS4TZfa6Ze7aIvGKsnJMnIUolwoqyWArC/ZV9cZBtMnbSn6ImPL5Nyob1cehGnpNeZoZdjPXjqS/fNq7uiDKEaEAo3G7K5pHF96in/xv/UMHAxclYBFO+uAzobtUe2/Ylyhf5JU7BD4XJYMlMho5c0tdi4IRodo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D/N3z850; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NjtgfCU9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D/N3z850";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NjtgfCU9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BU2U22019009
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 12:24:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M8GaWE6c1jzrI5CvT8ixvf1oulBT68ZVay2UogHBWSI=; b=D/N3z850gHEsJKLg
	CnFFHMr+TkoyI/KBq1WbGAWTaN7wGyElwqOjw31QW8x1z+Fes7yumpjsQyJbpKtS
	ng/geayQGPU13dvRym5S7y6Uk3HW9BA24KijixMb5pwP/lAO8oOi6nNZi6HWebS9
	I/APsOvQBlD1bz2TjXGSNVd+kGQdcKOX8UXU0iZjLaWaykiN2WUuik/1KzvodTX1
	FM8CzCwKdy6Twti60JpQ4EGywiW/4A+PY3PS3U8pO7k+CZx6OT4jaECehbQmZG+c
	8O4YdvJp4tEWYVFwDdfWsA8vQbX4x1E8HoFsp3LlIxd4oE5iW0IAW3h63VAftDwq
	V45Egg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk62x8ahc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 12:24:54 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso6990993a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 05:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788956693; x=1789561493; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M8GaWE6c1jzrI5CvT8ixvf1oulBT68ZVay2UogHBWSI=;
        b=NjtgfCU9v+FPF2pIedj3dVmTZNh8Eu0mgLPpIp1HFkxUhvA7aSS8BH/YdURibQdUF3
         MS78/i4hrZwfXVc+e8G9ATLYq8+uxc3E769BCidG+SzeLCqyPYKDvywGnaK6ujRdP3lP
         Y9Yu1TMtBFoBEXqsoO/jpf6l03tj3/kgdBVcPOq5YJvCxUOZgZzxkXjA6P17WJnIJHvj
         tkmFsqlQLSCU3UKunSb1Dvb8A4G96877d/EcuDYyqtBa++E11kqoSUzYmKT6Mi08trfI
         DUpeZv26mAytiU59nH8Z0kjYxuQxteqrYhShhWQFJ1ZwHC493zQHb/fDlgHMaeZButLn
         pKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788956693; x=1789561493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M8GaWE6c1jzrI5CvT8ixvf1oulBT68ZVay2UogHBWSI=;
        b=DgNKQTRkDVK3AsVawU4a56IHePUfJM7k9yfwMj4VTbH9lFXhEe8YI8rr0asRm+TVGu
         qrMVBV4ldpVDjhU4wTofZJE4FISAPEMQkr0VlS0vvBxQxUTzEAKyMt6pS+j8T8OfZlYA
         HIahNxEes73GwKLHy3jy/LSUPUhuE+37WfRiR7ADskqDUTRdrnwuANdZGEZ8zrskQ8gY
         rpu9IsKpultGn356/w0+SG3vbio0vBIKCjYzmqXD8v+aX/dkuGriJw/MMAACPlqm0uZf
         9J5oUmOL+1m493AixeB1EYEXHODAj9cn1znkgrUvAP0Gc+/YVfcvtC/UxOPEW8NmXla1
         jN0w==
X-Forwarded-Encrypted: i=1; AKwUvBxt6Mlrdtuy6gF2K2rG6ezkXWMYGdETeEYbauAgzXgAGcGL2FdruAE5sZPatao2VVq6fy9HbaA2uhqSpVjO@vger.kernel.org
X-Gm-Message-State: AFuF++nwv2SAJkvDdiSMhr5ahA/BIQ2DBBpRv5Jd55+gX++ZlZJ3la5X
	ZaNKTORronS8WbHBeM8vY/Rucr2FKaLp/V5m8cTI4pjh2W4Oe9FBbzcYzlEYBhrtsRCjL+xRutA
	RJlzWqEtM8fWAKQQoq4FKV0k3dJIz87+PKQw/gZ1CPf/0LT49uPBSS/8xOUZb7fuZLh/NXcXbsO
	oF
X-Gm-Gg: AYBFou1wBK2/I7rSuFUV9Pozn2WrVGn/zV2y7Mn/golbw7IcZO5Z4hUm8fnM7m1xewo
	AUB+b3mi+6Eq1fOgb6ait3Va27b1RKc+9ZPr/JA4CyVLp4Xrix0oHQD2atIbg38yuqdSvGqDUGk
	MVa0Cdq6mMIONAefEqcyvEur0SIkOFO7iRBtJGS+CN9VPzX3X36g18Nf0pBfAu5CctgtTc5+i7+
	7mhT572u9mT4el8JI97Ehjx/Gf3/F3g82w25OjvYbj+kJuEX6Uo5ksxBDxtFfjJJiVOhiAiQgvf
	NukDdxP2lS6XzbOyDUwzxI7lmygpbdU0IPzq0kaBVeDLvAHfXjV5Ac7RcciVzX+bHyXF/5MWmGJ
	U2E82+Mfqyuhzr3TMhGUaTL10x7/mmaTmfn0=
X-Received: by 2002:a17:90b:2f46:b0:398:9c39:520f with SMTP id 98e67ed59e1d1-39b261e763dmr53754185a91.15.1788956693389;
        Wed, 09 Sep 2026 05:24:53 -0700 (PDT)
X-Received: by 2002:a17:90b:2f46:b0:398:9c39:520f with SMTP id 98e67ed59e1d1-39b261e763dmr53754098a91.15.1788956692758;
        Wed, 09 Sep 2026 05:24:52 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14324356931sm69372775c88.4.2026.09.09.05.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 05:24:52 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Wed, 09 Sep 2026 17:54:30 +0530
Subject: [PATCH v6 3/3] PCI: qcom: Implement shutdown() callback
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260909-shutdown-v6-3-62b7bd123236@oss.qualcomm.com>
References: <20260909-shutdown-v6-0-62b7bd123236@oss.qualcomm.com>
In-Reply-To: <20260909-shutdown-v6-0-62b7bd123236@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: konrad.dybcio@oss.qualcomm.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788956676; l=2842;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=aT5LRuU59fQW6FpsU0j1/exCccGHutFWHFIlybqEqY4=;
 b=SXim4fm4RML0CyHLzIdAdMqinp3fDHLsPlUmSiUal1UHaT3FY5arh1pNVlXkwjOhjgAxwigrM
 dOGlSVQVyuDA2AFpAl2grLFAe3mgJJqzJyl5w572P/og5jGTzxvqDdq
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEzOCBTYWx0ZWRfX4fmglfjq/HEa
 3YHE9dpKw1WJpRSyPHacNMLxgobjqbr88iEad2rRFaB0R/pZyeIZBwMO8wrT/yUiTAGW+sLpRm+
 W4Kz+QSXXFA/2NA70pz9gfDvSBujS94=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEzOCBTYWx0ZWRfXxUbG602BaUSx
 irtr2AQoGtiWqFUd1wLo3+TOZ15QdtlHfHxzX887Gqon8eBDHxThxkdzbBNs7Ehi9EYBWgmYpXp
 w3i/CeGRH7vFrjpuvvABDNZEWp7wI8ffbufiZCHqVrUT6Fg54G/pOmbrt+tZIR1ycmt/vm2Lelo
 BkfA3w9ZVKXZRcTlVuh5HZqjipn9UZ5CLuWAh3fFV+wzQWP5fi6hhwYWuwWbU/AUZrrZ9OjAAYi
 g37MAiFkvBpwVbDs6TmQd2/8GRSdnGHrwBjHc7EL2oSyOhVfYGqvzDmGaAH09SA2ZWF8wrbLK8L
 BaQKUgJRVWfnU/RSzx8i1Q0Vu84gG+PtzJC6gQo8w+FM5p1A02ek2/iQXnks54Xra42NIY3RIzM
 vQfPVkC7+Y86PWGK4KX7K/xK1GN3YjxaftpMbaYiwuJl+PTh67lWWOKOXNOLkkzwMKMe9TroX5R
 7QBQq9g33spmUpmHrVQ==
X-Authority-Analysis: v=2.4 cv=UeFhjqSN c=1 sm=1 tr=0 ts=6aa15016 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=kXhGf0cxdCgfIYue-YsA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: Oj4-4jOHFSxWoKw814lIe2KTSQd8QJde
X-Proofpoint-GUID: Oj4-4jOHFSxWoKw814lIe2KTSQd8QJde
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090138

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
index 2693a98d0b27..3133e2b2eda6 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1988,6 +1988,9 @@ static int qcom_pcie_ecam_host_init(struct pci_config_window *cfg)
 	pp->use_imsi_rx = true;
 	dw_pcie_msi_init(pp);
 
+	/* Stash pci so qcom_pcie_shutdown() can mask the MSI IRQ(s) later */
+	platform_set_drvdata(to_platform_device(dev), pci);
+
 	return devm_add_action_or_reset(dev, qcom_pci_free_msi, pp);
 }
 
@@ -2408,6 +2411,37 @@ static int qcom_pcie_probe(struct platform_device *pdev)
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
@@ -2598,5 +2632,6 @@ static struct platform_driver qcom_pcie_driver = {
 		.pm = &qcom_pcie_pm_ops,
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
+	.shutdown = qcom_pcie_shutdown,
 };
 builtin_platform_driver(qcom_pcie_driver);

-- 
2.34.1

