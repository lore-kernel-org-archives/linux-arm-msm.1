Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794621680;
	b=UmjURdWfEovGhuYrXp+uUmKGOtIc5fWWvvXgRLXFElL576tRlrRnEyogPCjAqaEoSmD5
	 sqZ/AZvEmkGwW5bWpTb92RQ7voRzpoBIwhQaNtqguFjWvC3C/e779c8phxLzxALV2nF6+
	 WRMrh66Bbkh4MFRe0Dyx934VMG89JGbPv6oVK270s1BKVAiv0NEk5Aj4fZ89hRy/wV5Ct
	 W3AeHpxTvSNIisHdpeVN4zIg28tzvQK0AjvpqQs9gwyJKra+gg8oppEAUJCUZQ+xImsjO
	 eFQBXwrZTdwska0mG2C4Ay3PxtTKHAXcqtXGoKPq+OemiGXrvSe4l8GFHGdTEtC6QgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794621680;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=IvuVNeVnAijWURIP2f6FyFqznxRc4/b2a0oI9wlKPJA=;
	b=DdnMO6/iwT8BMQ6l1mO8I00PatQV7sFoSUwK00w8urlxS+mDSbQ5Q0AbA3HSqgpOK4fl
	 XgPOErAasa9a2jFEBWPHTLlZQY6TqMsYgb+m3Jmh9gXZnBqwUoSL4inFD+KTpex5sBLwF
	 PdH1R0hSRZkBFyO9yI5i3vv1wZANkW1fIrLdMr14qic2WKJ6GF0Wu/XAzS8kkM+i9ICe8
	 h1NkFDfB+bJS06rBdD10nwmDB6nHClQyes6bazBMAINmAsHV29M7OuMAZxCpqe25/A79w
	 XQqeev+o3bgcVqGA4ecS5xndtwgnam/Qbv2dUyRk2Ck5RJdGfXWif1frPDhY/VahlHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RnBEZk5t;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H10LznKh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECB7606A8BB
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 02:01:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ECB7606A8BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RnBEZk5t;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H10LznKh
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE20HV4072019
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 02:01:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IvuVNeVnAijWURIP2f6FyFqznxRc4/b2a0oI9wlKPJA=; b=RnBEZk5tijUDlM4m
	NLIIw3VVnwnpgiQUSi9DxfZZapBB49T+a/PeQZHNkBn07Bjf1NrA1+D4fBVVB2de
	Yyt46JOGyPdisT8VD6KrXMA111rEfPgrML6MxQ3zxQ3kwyv+ORmO/L+lgJ1pg2Yn
	v37k6Y2bKfoeBTrvUHbWBKgg0GxgUWTGC9vOgjwEa23WGo4XjkGnCX5ACeB/LiYG
	ZSCI68WRX/mKwrvShw6CZCIWldmGS1oDCkTp9SGmJqt7zfUNZX2FkU00zb5JHXN7
	meMHOh1khq8oAozGW/WdHhGe6knfjeVvHCnoulQCC7tQAsIh/EVJ5SSvKy6dy8MX
	5ioiVA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx662sthg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 02:01:17 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so2370886eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 18:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794621677; x=1795226477; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IvuVNeVnAijWURIP2f6FyFqznxRc4/b2a0oI9wlKPJA=;
        b=H10LznKhMirjtmPfeKXhuqx6cVugDvmWNEEDM+9ViOxi76SKeRzNJoWw1PBnOVdhJp
         1PoiteNwHfV+bNNzARAf65G+Zu4762xxREZNcBRYBFRLtiwCBiOrG71H6JKbHlvl/Vkq
         7vK43AyZtGGTiQ4bx/NRfKr+PcCeuMJHg1nQq3aKQHvrCP9K970cr96PFN3/3l58PUGu
         KB1/tHDAPgIsqZ7KVYtlkOjvaPYeLq3ic+a2Xvwqv30irnd1wfzPVo2OnqTHbjE5biap
         NkDTUSIZz856NGjc4EVGoBa9eoS+nAXgmlQgHR9wuV9VanAG87ebYr55pcINQAWbJyMP
         5QGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794621677; x=1795226477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IvuVNeVnAijWURIP2f6FyFqznxRc4/b2a0oI9wlKPJA=;
        b=Zg6DyF/iX9uwmHhz0csupr+XuAluFIi/dp0irKgXH8Z2TVxnlnF2mfuWJu7B1pbDNl
         2yQrbb+O+xDZrjE4YsxZ5QrkSOf+CpFfQ4NR9P8KFJvd3Yd6h9xdyJ8+Hv7vIbUKOF45
         C9bIU/mWan1+EjiRXw6pX1DOcfemQi/qL/n3i7Jb6lu0VtllYKa+TqvBVUdNy/3d+lc2
         UulHse+fE0zo/Ant3qm0XAHPaJ3oVSjn+e/kb3LVToTJYl2u1lCB3l1hwBh7W6kHpvi8
         i54yVw3Z8lHwHKevo4hImHcQKi66c94S/5RyAolWzCurh7f4LpPCPMPgQKsMcoW0gwlB
         b9Ew==
X-Forwarded-Encrypted: i=1; AL+hErECVxWtKvsmY+oam0es1txy932YM4I7bnSmCO4Kw05A3JoLHdv0f9rmDGUa4ZyK0MZPXAEwfVViyd4fLrzl@vger.kernel.org
X-Gm-Message-State: APuU4Z+1S5hMk28BPnGYra8RhEh0gy2nGDjDuYovGwyztLoH+j/y+8NL
	d27i98E4bDL7Ctza54ecGtHQJbbp6eWJdP+L3rM2hBNFoQC1w/OOSjCp/p9j/mUr/NnjVbUcuoz
	FJNnKqKQwmK9FYONdH6JBLHcSg3UK8qTiPJd0vwizExFN8gxmWZKemVOfT7zpR20mVCLa
X-Gm-Gg: AYBFou2e6cmP5juB3M/kSXar1mnaKVjfHyffCUojUcI2OWyPmALr3+Se6GNxlUeRFsG
	1QTy+CMVY51zqBowXKdXPgl3cGKT5YnejgsciIAP/mJxN0aFfKRX7+twDBzCInXoBz4qvKNfjql
	4ax5XGai9Z4KAsCNf6ZX1fCfpo7ZJloScCUprVu/z9BACQEMX0tQu9D9r3kOOi1o/zJBiaM9U1x
	w/9J6thST7Beyg4UXlaAabytEDvtUf09Yx6cqSr/NRIlR/UE66bRWWQvZS2JF3RYoxN7R1oEwZs
	hNbKEoLfFmzU3RPP2iBc4Lgkc8GBEiOAFvR5RoDBE7sbeowzCuVs/uQ6cFcC04Zb3Eh/MceBE+1
	ORKG0O+XLTrAj2sHogL9J0f8nar+T5yKTH91v0MjWYuTSO4vN1Dv0fqfEzM2653Y3KblITzZGEz
	3Y9jhfkY29
X-Received: by 2002:a05:7022:ed07:b0:1b2:588e:f89b with SMTP id a92af1059eb24-1b503169362mr4105659c88.47.1794621676334;
        Fri, 13 Nov 2026 18:01:16 -0800 (PST)
X-Received: by 2002:a05:7022:ed07:b0:1b2:588e:f89b with SMTP id a92af1059eb24-1b503169362mr4105627c88.47.1794621675559;
        Fri, 13 Nov 2026 18:01:15 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50316d9c2sm9952742c88.7.2026.11.13.18.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 18:01:15 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 07:30:54 +0530
Subject: [PATCH v9 4/4] PCI: qcom: Implement shutdown() callback
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
Message-Id: <20261114-shutdown-v9-4-5430c9f242ed@oss.qualcomm.com>
References: <20261114-shutdown-v9-0-5430c9f242ed@oss.qualcomm.com>
In-Reply-To: <20261114-shutdown-v9-0-5430c9f242ed@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: konrad.dybcio@oss.qualcomm.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794621655; l=3652;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=THWTFBYwq2lZQWgLvpr0AlF/FWIRcJOgtOn7/GBUACc=;
 b=Ju38qQrTI2vyg60ari8vmEap8HMp9kPUucQv+4rdG74A0mFYkoU4CwYRBokY1nZ4S0lGjGzKI
 jYtJlGjeNqvD1r08rt0/GOUEn4dt+GT67DwQDtJh7PcMqjdGR11lF1H
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: V6AIw9izxNHf3wthoOdbgiT7ZlwwU5sY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDAwNyBTYWx0ZWRfXxJFSg8OOiOe1
 +iUAio0kdqdNvLGhyKQPbPwNQ4rVou8Fsp2pvvn2DUxIvQi525MLxSeW7xNwyxQP+E9xqnrtaJv
 Ng18OjpIDpzUaaFIEndetdFQXpSyG9+HBLXZxgQp6xm42rMp/+ree/QY16r6/cxatDrAYKTPv9y
 ZjWspsgPAMYoadmZag24ALBNEPCABgNY/KAvcHglyFMLuAHFh3uSybuoQm//aptE+X2L04BphiW
 scv6I4vOFBXs2cYXg3xLippK9cr82sz0ZnhN+kEK4fNQIgJ7biyYuzJue5Wtxqp1yFszgZ74aWw
 CfzlkbglG1xx/wzA1ISj2YCTITx4A/9uK+87q/sIlzF0rD8/JIiDBBOFD7pY0OvWTEigH0Gc7cx
 sJy8qJOqBkMSvaZRMWMS0uHwdKnTJpmUWR43hRs8HNY3E8lx4QgqF3ZzUtF5XdlhLLVuOCsD9O3
 nW58V029cQk+lu52PUA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDAwNyBTYWx0ZWRfX4yZ9KMMEv52W
 IpWFSoBYoEk9qOpPIwoZ/DZanU8DLdWbg9bnscHHzad6pttDXJbfcyqmYc0QuGoAqrtD+TblqP0
 GFrUCrX5JCSbgL7v3qdVaYGb3SKicBQ=
X-Proofpoint-GUID: V6AIw9izxNHf3wthoOdbgiT7ZlwwU5sY
X-Authority-Analysis: v=2.4 cv=M/nYuCws c=1 sm=1 tr=0 ts=6af7c0ed cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gM652YqJFP5vwQx0TG8A:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140007

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

Stash a struct qcom_pcie in the platform drvdata in both the normal and
the firmware-managed (ECAM) probe paths, so shutdown() has a single
path and recovers everything it needs (Global IRQ, config, dw_pcie)
uniformly via platform_get_drvdata().

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index 532779295734..0f548c6ce6a8 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -2020,9 +2020,14 @@ static int qcom_pcie_ecam_host_init(struct pci_config_window *cfg)
 {
 	struct device *dev = cfg->parent;
 	struct dw_pcie_rp *pp;
+	struct qcom_pcie *pcie;
 	struct dw_pcie *pci;
 	int ret;
 
+	pcie = devm_kzalloc(dev, sizeof(*pcie), GFP_KERNEL);
+	if (!pcie)
+		return -ENOMEM;
+
 	pci = devm_kzalloc(dev, sizeof(*pci), GFP_KERNEL);
 	if (!pci)
 		return -ENOMEM;
@@ -2032,6 +2037,9 @@ static int qcom_pcie_ecam_host_init(struct pci_config_window *cfg)
 	pci->dbi_base = cfg->win;
 	pp->num_vectors = MSI_DEF_NUM_VECTORS;
 
+	pcie->pci = pci;
+	pcie->cfg = of_device_get_match_data(dev);
+
 	/*
 	 * dw_pcie_msi_host_init() is called directly here, bypassing
 	 * dw_pcie_host_init() where pp->lock is normally initialized.
@@ -2047,6 +2055,9 @@ static int qcom_pcie_ecam_host_init(struct pci_config_window *cfg)
 
 	dw_pcie_msi_init(pp);
 
+	/* Stash pcie so qcom_pcie_shutdown() can mask the MSI IRQ(s) later */
+	platform_set_drvdata(to_platform_device(dev), pcie);
+
 	return devm_add_action_or_reset(dev, qcom_pci_free_msi, pp);
 }
 
@@ -2467,6 +2478,24 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static void qcom_pcie_shutdown(struct platform_device *pdev)
+{
+	struct qcom_pcie *pcie = platform_get_drvdata(pdev);
+	struct dw_pcie *pci = pcie->pci;
+
+	if (pcie->global_irq)
+		disable_irq(pcie->global_irq);
+
+	if (pci->pp.use_imsi_rx)
+		dw_pcie_mask_msi(&pci->pp);
+
+	if (!pcie->cfg->firmware_managed && !pci->suspended)
+		dw_pcie_suspend_noirq(pci, true);
+
+	pm_runtime_put_sync(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+}
+
 static int qcom_pcie_suspend_noirq(struct device *dev)
 {
 	struct qcom_pcie *pcie;
@@ -2658,5 +2687,6 @@ static struct platform_driver qcom_pcie_driver = {
 		.pm = &qcom_pcie_pm_ops,
 		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
+	.shutdown = qcom_pcie_shutdown,
 };
 builtin_platform_driver(qcom_pcie_driver);

-- 
2.34.1

