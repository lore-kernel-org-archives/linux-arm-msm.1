Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795790470;
	b=h53NLjB1nmmkXR3zpBbltLPjzwTYz+u5rJwbzJk9BEuN3MV08aKB7Q4KZoyUNPCtxgUJ
	 PLj6PQ4hCTOF4A2fZxmn1g4/0ho1B6jX1KxHThyKDPIkXw25oJnyOmr1V1EWonyskUalK
	 k8770+kI49j4CH9CSPR1UB3oOog1SsxTix2BEq40+God3SmDV2XScjK1ULmB1P3kGPTbe
	 3+bduJ8dabyEYV+zQ4z5Lg++PLusVMcVmkXIiarA4CGZ609TG7g9JoYeH4kmP+n+1igmN
	 xWqPd5zO7YELpPfrox3YH5HVoaoTpJ1VGQf3K+yRL+i/bfB4V8HkD3rGvFVHCsDW6Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795790470;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=cQrPmeNJla6MknwzStsoB43gW4Bhd7IUtxWsEgN5PGY=;
	b=YnvgoBJYGxvSnM/r0VrDA4X0rGbkn0tMf/yazOvQRiZeUXWBxSahSy7jRqqmEF02Mx2Q
	 eTfK+W2eHouKFQJUcjOMJgEzdC5egKquR73oU3f9J6yIn88uqBfM3oheR0nsr75AU9j5J
	 QUQeW6dghghuVSooQRlGXLI1bSrvY6NJ8yuCbWPBM227iWWmA0l/ReBcJCv4fK1/CbiNn
	 Si4D8ixC8W7xMoTk+MVWmllyOGDB6y7XNZNEPJRoWdmZx6BCZ+7VWA6RUa3Xr5r+7ZDyZ
	 0+NWUd+8deoQO3rHC+WND8qdRsFT8xeH1OvgZgO273KBckYwsfGxt/7I4BpMgWUGVqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hgNdX3u2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J2VlyVtq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16DD3606A69C
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 14:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16DD3606A69C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hgNdX3u2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=J2VlyVtq
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1gHe3321397
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 14:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cQrPmeNJla6MknwzStsoB43gW4Bhd7IUtxWsEgN5PGY=; b=hgNdX3u2YU/EMaza
	AbJzE8XdBraumYCE4WUnXKEElOyIqqLgUANYohccrXdvNw7sOD7njBDyLzKN7f3k
	HzWS3rf4w94gwoNBGu5AeG06jdc/+vA2oH3WndZNS8jq3xuPl12lk1AWrByda+Eo
	8f5HUd9UkPHNrF2R2/YIN69pWDaVgqFfQ9lbJvF+UHpcCPxWXIDhQRB8R4ZBEs55
	Sr4l99Au0uxzKri0Ir2Akgd9CzoOlzW/A+/P0WRTmpd5aLcOmrBtiU0kfZ2TXjGm
	IrMcy//UfS4M+igEz3Res6og9OLG944ZQf5yi3qfmUju27MoYU1JaVMrmlR6a7rB
	PDtQhQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6rf93yxn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 14:41:08 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-386df943355so1261096eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 06:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795790468; x=1796395268; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cQrPmeNJla6MknwzStsoB43gW4Bhd7IUtxWsEgN5PGY=;
        b=J2VlyVtqd52egO3nBHopjItviu89CVAAeL012+LYtZ/31IQwaxW/mjy1PgkWllZtuB
         Iio4D5VZMADguH5DDDj/KAMYhrsVBa/krpIjcfIYrBZ2lvYqMWpYZjv9fQAhNsQkeqcW
         yWyL7bb0N8kvbqeJCPZRADJXnLqnKAzU0C875X7DXoTd32Sd18Zr5DcaLr5vQx7wLaEN
         LVS4r4WMoQTYZPrhiytMZ8KJ2Yq4ItqhahRm5RIKeahphWmP7hy78NXc7+uAmm/o1kLM
         XCn/xd+0z5VL70NaA51c26+Xnyz+x6Rnalhe7JkcUppiRq5fkdCIA0Mr0dJhgd7XcmHK
         EZzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795790468; x=1796395268;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cQrPmeNJla6MknwzStsoB43gW4Bhd7IUtxWsEgN5PGY=;
        b=A9GlP0vtLzdOzfXSFsT5Xsqdo0aM3DIyHZhHRDUll/Y1ZiEt/57ukmarCQKXclOZz8
         Q2LBvgvWF7UGLMhPLzcpdWtG9F5S6f3pH0eIGFfOqFIpuFpH9Msonf7D/720CwuCm1cQ
         htU4TSiloxIrC+8gpxTYWk6sBok9/UunCvUtd0LL2Qyanpcd/9P2qHKAoEW2DoEVHgwc
         zKlX0/uocimnw7/XLYWkxllrMKA9JCuIx/a8bL4KtYbA09+D8oJooaPpQfKlbVYSx7wk
         0/6BCbgLdHeWOvne+1D6EqJ4sTOa/+6AKoNiZRj1PsPq6CjS/oW/Wzij2DnqApH1akKh
         sHmQ==
X-Forwarded-Encrypted: i=1; AL+hErGWzUP5HGVPdYnuGKix3SL8RG4AX2txf+MWqmP+MlASC0irYVIMvwuc1LWlQ3kQc6x1ZaD8oG23XL2eGaXg@vger.kernel.org
X-Gm-Message-State: APuU4Z/9eCiHTIt3YtWqgfe3QTHocx7zXdpiX+tX994IhPWlmaPDtKbL
	8AJL+/6nzJfiCoYLwz6CIKxj3I/8ofcJ6CsQ+0AlR36BuFQrrkXubV5MsKPJAvnVkNT/KtxicEL
	Oy7nNh+8dQz8qm9q7/JzquDEnnJ9NNeCePJo6cUSuQebT8LwSvZ5fFYTJEVART3CNhGEZ
X-Gm-Gg: AZFdTZcdPfuOk1l9PK61eQXMK+3u0EHxhfmJzzjZnNIGgoPQOeKS9CO1KcJ429nUzuq
	ZS9kcYjiTV19B3TntOQEVQXX8AzK7bu72Z+e3+9KuX9NVbO0DDj6R+q4B6Py3b8rTWHaVtxBkc4
	Xd4TY4VgintNyzC1d5loV8buP1hezi1fFOwr4IWyN77aG8CePU2YdQUxHIILpl07/WaQKqniWqU
	hFZwbmZ8SOIbcvv0lrGKT4X6ftVR3S29y9r7mYGzVM3dIlWUtrZleviMhLCTUB43hKtWaXwlKRz
	FbOYvWpBuIkZumlOTKxY74ad2q6wnRFpGPDj3f5fQ5wbQlH7ZAYBfmBtq7bOer2UUHcR9WZ9xw8
	6Z0ysWmKNfK4HypaLIIHdLC5BT8G0JXf1LZ0YadEGJY7CS1qnSRK1sKmrob9fTeBh7dLFKTltLs
	d8XwSdRw==
X-Received: by 2002:a05:7301:5098:b0:381:5fe2:a079 with SMTP id 5a478bee46e88-3856c6b010amr24691117eec.1.1795790467455;
        Fri, 27 Nov 2026 06:41:07 -0800 (PST)
X-Received: by 2002:a05:7301:5098:b0:381:5fe2:a079 with SMTP id 5a478bee46e88-3856c6b010amr24691082eec.1.1795790466715;
        Fri, 27 Nov 2026 06:41:06 -0800 (PST)
Received: from hu-msarkar-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm82970809eec.26.2026.11.27.06.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 06:41:06 -0800 (PST)
From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 20:10:49 +0530
Subject: [PATCH v2 1/2] PCI: qcom: Implement .reset_root_port() for
 firmware-managed controllers
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
Message-Id: <20261127-pcie-controller-reset-v2-1-17467b64f5f5@oss.qualcomm.com>
References: <20261127-pcie-controller-reset-v2-0-17467b64f5f5@oss.qualcomm.com>
In-Reply-To: <20261127-pcie-controller-reset-v2-0-17467b64f5f5@oss.qualcomm.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rama Krishna <rama.krishna@oss.qualcomm.com>,
        Nitesh Gupta <nitesh.gupta@oss.qualcomm.com>,
        Ayiluri Naga Rashmi <ayiluri.rashmi@oss.qualcomm.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795790457; l=2937;
 i=mrinmay.sarkar@oss.qualcomm.com; s=20250423; h=from:subject:message-id;
 bh=nTCJouOPtcRST+Npmv3BTg5gqJs09AaCB0vd/5YgXDY=;
 b=hk/C9j7skE13T+ziWxNra+8H8OVQfs20SUhjh+HIdAAH8vDVYQESC1zJqoVdW/Kq3CsW8II4S
 j7ii4X1KwaBCMhrcMMrlWbSCe7lWdzrMWgk2BH9t5pcN6ZrGUEBf187
X-Developer-Key: i=mrinmay.sarkar@oss.qualcomm.com; a=ed25519;
 pk=5D8s0BEkJAotPyAnJ6/qmJBFhCjti/zUi2OMYoferv4=
X-Proofpoint-ORIG-GUID: NB42n14sTnPvfRPcFRA0rcfzgIBmWV3c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1OCBTYWx0ZWRfXyWdWacKDcmRg
 Vzo2baXVq4f0CdPsezzrois1+CVAZoaruJLEYB0Eyqzz0O/u7o9x8lmvBt5mlPMbPDgX+S0rdTH
 QU9U3bqG6l6F2029EvdZPFqcwtVC0S25brOSm1vyDdwGnVhRiWYqTWPdKfkqZGPipE++JHCeE0t
 cNYT1M4UR2uxyPgIC3cst1bqOgaA/mEP1NgIGcQDl+DEnChCUbMBrzbIX7INemcYzCiKhQgwgf6
 ncgSFArW5E5k/e2Sc5pH2dMgrQISfsEl5GBad0jx/kbonXPncyvTqHZabti/A8SqaZ9BkIDOMkh
 iFj0ShQlRy4/AN8HALj0NwDCBB+GHsqy6R6Q5KXmr4XNgB8KygAFCjwteIsyBLhwTKEBKm+gI7a
 863WiwiBflRxxwb2mcQfCRh21zwo/k73cMOUy4ouk4D0U5ra1HE0o/hGvgiLzk6XMYbGyEUNuC8
 MXEyiFZSoeRCWknOx+Q==
X-Authority-Analysis: v=2.4 cv=cpkOAF4i c=1 sm=1 tr=0 ts=6b099684 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=_Z1ICBCpGxnOzRxCLNAA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1OCBTYWx0ZWRfX+pizLIP/E6WT
 Pk8Jcr6ZsOCMrkbrYnSpb+YuQN+09MXNwD24mK8+XYcIB7pajgYu2e61bRAw06VSfVafu99wCx3
 SnHyWqmtk88G8fnQhXJ+UiPBgwMwk8k=
X-Proofpoint-GUID: NB42n14sTnPvfRPcFRA0rcfzgIBmWV3c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 phishscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270058

During PCIe recovery events, such as a fatal AER event or other
platform-specific PCIe failures, the controller may enter a state that
requires a full reset before normal link operation can be restored.

On firmware-managed PCIe controllers, Linux does not control the PHY,
clocks, resets, or LTSSM state directly. Instead, these resources are
managed by firmware through the power-domain framework.

Implement the reset_root_port() callback by performing a Runtime PM
power cycle of the controller. This allows firmware to reset and
reinitialize the hardware before bringing the controller back online.

Since controller state is lost across the power cycle, reinitialize the
DWC MSI configuration after resume.

The callback is only registered when CONFIG_PM_SLEEP is enabled, as the
required PM support is unavailable otherwise.

This enables Root Port reset and recovery support for firmware-managed
controllers.

Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index d903f10211c2..fe86b8fbc895 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1855,6 +1855,35 @@ static int qcom_pcie_set_max_opp(struct device *dev)
 	return ret;
 }
 
+/*
+ * Reset for firmware-managed controllers: power-cycle via runtime PM and
+ * reprogram DWC MSI registers on resume.
+ */
+static int qcom_pcie_fw_reset_root_port(struct pci_host_bridge *bridge,
+					struct pci_dev *pdev)
+{
+	struct pci_config_window *cfg = bridge->sysdata;
+	struct device *dev = bridge->dev.parent;
+	struct dw_pcie_rp *pp = cfg->priv;
+	int ret;
+
+	ret = pm_runtime_force_suspend(dev);
+	if (ret) {
+		dev_err(dev, "Failed to force runtime suspend for reset: %d\n", ret);
+		return ret;
+	}
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret) {
+		dev_err(dev, "Failed to force runtime resume after reset: %d\n", ret);
+		return ret;
+	}
+
+	dw_pcie_msi_init(pp);
+
+	return 0;
+}
+
 /*
  * Qcom PCIe controllers only support one Root Port per controller instance. So
  * this function ignores the 'pci_dev' associated with the Root Port and just
@@ -2031,6 +2060,8 @@ static int qcom_pcie_ecam_host_init(struct pci_config_window *cfg)
 
 	dw_pcie_msi_init(pp);
 
+	cfg->priv = pp;
+
 	return devm_add_action_or_reset(dev, qcom_pci_free_msi, pp);
 }
 
@@ -2292,6 +2323,8 @@ static int qcom_pcie_probe(struct platform_device *pdev)
 		bridge->sysdata = cfg;
 		bridge->ops = (struct pci_ops *)&pci_qcom_ecam_ops.pci_ops;
 		bridge->msi_domain = true;
+		if (IS_ENABLED(CONFIG_PM_SLEEP))
+			bridge->reset_root_port = qcom_pcie_fw_reset_root_port;
 
 		ret = pci_host_probe(bridge);
 		if (ret)

-- 
2.43.0

