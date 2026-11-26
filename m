Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670247;
	b=fOEshaJL0a5/vEFhMRHo4nF1dEE1oXLAS4w1bn7IrriaVl5yERqhVmQzyc8LQDtJ2pbj
	 gte33i0fcpgYZomBaYFgGRSHMbGtTBcY2yKLWiqmdXpVspv0BKc3DO8g6E7uWE2d+348L
	 Fuspnl1/gzyo38wc38Exdxe/3iGpmEOP3xsl4XfjXzMLGr/7Kcu3gE1QFHKMv/Ta8LcdH
	 jUkPT9aKXKDEFUsVgy+PVHYlwA1zoymwJCQaSLbYw1+mzuPpAGnbJdhyjQ3fRdpfvhUAO
	 a7RQzntvtzXUJH+5bRYcytZnUakDPhdbd3yeReNWUqUtZiP1g63xId1xhceM3bUDZXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670247;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=v7SZC9zJJd5Z+k+XKqU0PQUi4gNV89FyWD6yXGlbEqw=;
	b=iyZZB7QDzvr3a11wZ+/dQH6I/TGysxvAZu3iPY+C8sKyVSxTA3tPctmToZ3484tCtWH8
	 Fe006cGqo7rkJ4kudaV7Bx7lL4YrBP5+N/7iGF6psitHloURjIUf5uzcYPEElbsJ3RgM2
	 atNGpKBxnhcBfuWLD70V4jgLBti8cPAKPQOQGVxwyi/+GjP8mNta1ZmSZWr3shaotUmQj
	 N2q7QQhXTYDlnD6ZLqo4UvZVNuI1bgTiB9UwHNeJKvpEb/k9ZBE4bIpf2efWFmlaP7aYk
	 m9XSyaVunV2tTZZY4fIMuJffjilErsfhKoV0p++VyQQvcRvY7plOUAB1mxQp6S1dRcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mqTINcSo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eDhGKTg+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9305606A32D
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 05:17:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9305606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mqTINcSo;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eDhGKTg+
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ37SoG3731042
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 05:17:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v7SZC9zJJd5Z+k+XKqU0PQUi4gNV89FyWD6yXGlbEqw=; b=mqTINcSoBgaAg6xi
	opheCea+AQwN6rldH6rMOaf7b71LBJqjErTN9qHdCg3Kk2CgWBhUAxWvcm/4xjpt
	q1D3bvFL4p4oehx8G6ZWtijAzrs4xYYm0k4fOp42bu9NqaE4mUhHzz3JEXUx+e69
	Nf70EW9qnGaNKRi4HM9B+01+cDeAC4a5HaEaD0Kc2VcMSRzWdyCcYJU46sUQM9a0
	XsznMEO9Xu4KMJbMw3byfUdflPxYLv/beMsJ6rW37XZMRMuEFYPWZKmD5djr4Zkt
	VnjEjPOgNSOfKSC76TuBlJpBCc83GDQtslFVAXng+ZnN0FT7ZBKfP30jsXPIOlhw
	xTTArA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61arjssw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 05:17:25 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b592e9841bso258324c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 21:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795670245; x=1796275045; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=v7SZC9zJJd5Z+k+XKqU0PQUi4gNV89FyWD6yXGlbEqw=;
        b=eDhGKTg+Lr99zwFn7YY7VESj1n9kxEhZcjR2torV02odGKZjhBMz6axGxQ2QtYYqyA
         f8FZwI7X4dBTz5VxiXMGZR6Pm54Qel6Rfoe2gqW64DMA70OvaMNSFr5A+k8lHPG0kMV6
         bKvOaQ2oEzGA/edUQ9hAhNbOrEQlAhYQ+rZIYFDo0i6GSIP9t2C44jvSLT+gPPZI17Su
         6RwfHp+MfJweMmLVv+S7wIfxMf86Dr9y3LVrLa0cxG9wyy2sWRpLM0es9EitE8X7hbwg
         6hXjon1rHJzq2eb3ohFAUzy+jfbQonJwZAfR7uaFIVFSuIwLTDOpq+2wC/UF85pA/STx
         bShg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670245; x=1796275045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v7SZC9zJJd5Z+k+XKqU0PQUi4gNV89FyWD6yXGlbEqw=;
        b=RvPRCXP8fgENLMwSsPRwprkNLWyRVTUknsGrucMc+oxuzCQpLoApiv5XfD24XxtW3R
         JgAf1r/JbsQfQjCuMX20Fu6i84uWT5sL+mLRhnafsD/uPLba94mhXl7FQsX2xM2dbuzB
         ufSNlqMhkZ9zgUe3c6NJyD8JyBV+KMgDXueES9Rxv8oaLqC0DuNYubi8MqZgpTgX9eBn
         7aBNLeLqjJXTkVm3OeMD7NaeCi4lR1Zy/G/v42eBLGWIt1bJPWcr/kToTOm+4ru3oCc/
         fOH+qOa43zupUaVcspI+Ap7xXaNM39aPyTrnW8ATDUxyH5XHLhSlX+53K1hK16wJ1iTQ
         CMvQ==
X-Forwarded-Encrypted: i=1; AL+hErEEV3NjVgR1UTbHipeHEzvkQiXSCtlAIuzuWPHg4MR/Y51ofS+8W3wO1xaJjzOrSzJYm4KXcozD8OHYQQPY@vger.kernel.org
X-Gm-Message-State: APuU4Z/q/JuSkXTb/LSvsFiPkTnrjIf/hnXdme72LXckzdB1+aRMpbsF
	bYRL5ll/U+9Qsxfah5Dn11tm5c0A4YEDag0D1Zj7qyLPuyqHYPq2NWvRvZTioWhZg1RewOHqsSk
	5GvMvk4kGLxFsFWwZddnHONBsULXaqEmn8SQZHt9rPr7PJ8ijqrd4U15L9AZxfI4OxetLW4Bz1a
	RD
X-Gm-Gg: AZFdTZcLggpL147VLqVCEZNfAXYuGED3jH8DrCH5sf4Y8kEJZBSsJ6R4k6UQSGgETIi
	VZGl3Oj1pNtpLd3447XbgSoPtVZFEsWETNBnSIXQYiZnIaCyjTmIgiFw8p8+OoUPkeXjOec6B7M
	R8Kn9ZS+K4wr7ifh6MZc/rPn3AU++Tqx7Za8tql/Aw+iP4gWideAv+FL9XGFz3xW4Hjn+eJO5is
	1s2d9PI9ZvPMNeqqBSRMcYlCSbOb+AzKwpZWG3u952QrXwSitAZDfWVM3W0+jAJ31tDqNGGdAmC
	zE1OwhtAB9olLX3zzhwth0PbFGMkFYCXa2JGPqRdm8uoyqK+jNfGwVw/E95sD+dXvZzglg2mgYX
	+dcPx3ZKzrgzV9ZBdjDOKHDeUD2F309/2WETosx+LyksTdv5VTTOb4IgPMlbs7T4eAooIWpyD5F
	Nzwi9d31IP
X-Received: by 2002:a05:7022:1103:b0:1b3:b3de:9232 with SMTP id a92af1059eb24-1b5568a15aamr17512707c88.9.1795670244392;
        Wed, 25 Nov 2026 21:17:24 -0800 (PST)
X-Received: by 2002:a05:7022:1103:b0:1b3:b3de:9232 with SMTP id a92af1059eb24-1b5568a15aamr17512680c88.9.1795670243786;
        Wed, 25 Nov 2026 21:17:23 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm52132934c88.13.2026.11.25.21.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:17:23 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 10:47:00 +0530
Subject: [PATCH v10 2/4] PCI: dwc: Force L2 link entry on shutdown/reboot
 without D3cold check
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
Message-Id: <20261126-shutdown-v10-2-fed60d9687f2@oss.qualcomm.com>
References: <20261126-shutdown-v10-0-fed60d9687f2@oss.qualcomm.com>
In-Reply-To: <20261126-shutdown-v10-0-fed60d9687f2@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: konrad.dybcio@oss.qualcomm.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795670232; l=8831;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=qbU4YfdzhryKir93LpnQ4Mk3Fg91dCUd9XMJWJuZ9eQ=;
 b=g74Fcj6teXiqcYjkhpsMCh8kgAPp3WNncjt9WQ+K9uzf5c1+5aKIb/1VDwmHngYztgeKbnMQY
 LJRCEzCMrB+Cp2pTzGXAPxE4CmC5o/hUbc1xNa6G0job2fBD4gxKv4N
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: ch1R0mA_5VPjVvPTTUpkDsqHbT2pyc5Y
X-Authority-Analysis: v=2.4 cv=OIOyTiaB c=1 sm=1 tr=0 ts=6b07c0e5 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=-MHXjDPJGaOMKVajueQA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: ch1R0mA_5VPjVvPTTUpkDsqHbT2pyc5Y
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAxOSBTYWx0ZWRfXyqVkZeHHaal7
 bqNEGvcVdfBtOBdbpQj45mC9Gq5N5wXxA1ZqAFm7S7RzDqYdZSbCEbsjwkgYd3pLzsEeRYvnhqY
 BtkB6FApZL9QhOiaNM+qe938dJ69SRc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAxOSBTYWx0ZWRfX7DJ3OQFg4LfZ
 yGpZAJGw+C1IkXNatDgkxrDRiFsKuXg/AuNXHH4equRDbJW0W0mLYmaDrhqd7Tak639+bbS0Emv
 mE5YEfsOmXtEzb+QsfmcBdOZTMaxye2FIbjElTZTGbWebDSTrID9+imN7y/SMjnCTmGIIckX0QY
 IW5xYENNlVyZme2CBhkD3JNtwe4GDlnjaWkGHReECvQpApfPjMS7yDWSuQqSB1aXYrb/dcVAr1w
 pzKm5B8/JG6GxEyHjZdROfzd12qmjJ/WSTFcRgltkvpe8qRuZ1c0TPCro5Oc9ZlLLyFCrWBFqR2
 SrjNMVliz5gsjthZImh/8hATabRuxp1HW/TeUIf6epLhXWuGtqqXTGTkOU5BBqebaPYS3z6th8H
 I0EwjIJYmj6AcT150WFJ+1PKPOzRCeCD1iI0AO+vmRJiOnf7eOnyVpzJliS7VxQvXxY9O0qfh1Q
 dMWh8PPumw5YLgMvxlQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260019

dw_pcie_suspend_noirq() normally calls pci_host_common_d3cold_possible()
to check whether every downstream endpoint can be put into D3cold before
bothering to move the link to L2. If no endpoint supports it, the
function returns early and leaves the link up.

Querying D3cold support during shutdown is actively harmful, not just
slow: pci_host_common_d3cold_possible() requires every active endpoint
to already be in PCI_D3hot, and returns false otherwise. If any endpoint
is still in D0 -- which is common, since endpoint drivers aren't
guaranteed to have suspended by the time the host's shutdown path runs
the check fails and dw_pcie_suspend_noirq() returns early without ever
moving the link to L2, leaving it up right up to the point where the
system cuts power/clocks to the controller.

Add a force parameter to dw_pcie_suspend_noirq() that callers set
explicitly to force this behavior, still call
pci_host_common_d3cold_possible() unconditionally, since it's also how
pme_capable gets set, but ignore its return value and force L2 entry
regardless when force is set.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pci-imx6.c             | 2 +-
 drivers/pci/controller/dwc/pci-layerscape.c       | 2 +-
 drivers/pci/controller/dwc/pcie-designware-host.c | 9 ++++-----
 drivers/pci/controller/dwc/pcie-designware.h      | 4 ++--
 drivers/pci/controller/dwc/pcie-dw-rockchip.c     | 2 +-
 drivers/pci/controller/dwc/pcie-eswin.c           | 2 +-
 drivers/pci/controller/dwc/pcie-nxp-s32g.c        | 2 +-
 drivers/pci/controller/dwc/pcie-qcom.c            | 2 +-
 drivers/pci/controller/dwc/pcie-rcar-gen4.c       | 2 +-
 drivers/pci/controller/dwc/pcie-stm32.c           | 2 +-
 drivers/pci/controller/dwc/pcie-ultrarisc.c       | 2 +-
 11 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 865438ffde87..5a410e89534f 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -1788,7 +1788,7 @@ static int imx_pcie_suspend_noirq(struct device *dev)
 		imx_pcie_assert_perst(imx_pcie, true);
 		imx_pcie->drvdata->enable_ref_clk(imx_pcie, false);
 	} else {
-		return dw_pcie_suspend_noirq(imx_pcie->pci);
+		return dw_pcie_suspend_noirq(imx_pcie->pci, false);
 	}
 
 	return 0;
diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
index 7c9fb3bef682..8481fe5a0bf0 100644
--- a/drivers/pci/controller/dwc/pci-layerscape.c
+++ b/drivers/pci/controller/dwc/pci-layerscape.c
@@ -370,7 +370,7 @@ static int ls_pcie_suspend_noirq(struct device *dev)
 	if (!pcie->drvdata->pm_support)
 		return 0;
 
-	return dw_pcie_suspend_noirq(pcie->pci);
+	return dw_pcie_suspend_noirq(pcie->pci, false);
 }
 
 static int ls_pcie_resume_noirq(struct device *dev)
diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index ab343ed53ba5..0837bb9e67e0 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -1229,23 +1229,22 @@ static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
 	return 0;
 }
 
-int dw_pcie_suspend_noirq(struct dw_pcie *pci)
+int dw_pcie_suspend_noirq(struct dw_pcie *pci, bool force)
 {
-	bool d3cold, pme_capable = false;
+	bool d3cold_possible, pme_capable = false;
 	int ret = 0;
 	u32 val;
 
 	if (!dw_pcie_link_up(pci))
 		goto stop_link;
 
-	d3cold = pci_host_common_d3cold_possible(pci->pp.bridge, &pme_capable);
-
 	/*
 	 * Enter L2 if D3cold is possible, or if the platform loses RC power
 	 * during suspend (in which case L2 entry is required to notify
 	 * endpoints before power loss, regardless of D3cold support).
 	 */
-	if (!d3cold && !pci->pp.suspend_poweroff)
+	d3cold_possible = pci_host_common_d3cold_possible(pci->pp.bridge, &pme_capable);
+	if (!d3cold_possible && !force && !pci->pp.suspend_poweroff)
 		return 0;
 
 	if (pci->pp.ops->pme_turn_off) {
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index 0ece9c433229..f774fc6d2a24 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -902,7 +902,7 @@ static inline enum dw_pcie_ltssm dw_pcie_get_ltssm(struct dw_pcie *pci)
 const char *dw_pcie_ltssm_status_string(enum dw_pcie_ltssm ltssm);
 
 #ifdef CONFIG_PCIE_DW_HOST
-int dw_pcie_suspend_noirq(struct dw_pcie *pci);
+int dw_pcie_suspend_noirq(struct dw_pcie *pci, bool force);
 int dw_pcie_resume_noirq(struct dw_pcie *pci);
 void dw_handle_msi_irq(struct dw_pcie_rp *pp);
 void dw_pcie_msi_init(struct dw_pcie_rp *pp);
@@ -915,7 +915,7 @@ int dw_pcie_allocate_msi_domains(struct dw_pcie_rp *pp);
 void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus, unsigned int devfn,
 				       int where);
 #else
-static inline int dw_pcie_suspend_noirq(struct dw_pcie *pci)
+static inline int dw_pcie_suspend_noirq(struct dw_pcie *pci, bool force)
 {
 	return 0;
 }
diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
index 1ce5f700b9cd..10c508f96ec5 100644
--- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
+++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
@@ -1047,7 +1047,7 @@ static int rockchip_pcie_suspend(struct device *dev)
 	if (rockchip->data->mode == DW_PCIE_EP_TYPE)
 		return 0;
 
-	ret = dw_pcie_suspend_noirq(pci);
+	ret = dw_pcie_suspend_noirq(pci, false);
 	if (ret)
 		return ret;
 
diff --git a/drivers/pci/controller/dwc/pcie-eswin.c b/drivers/pci/controller/dwc/pcie-eswin.c
index d08277e8cc69..04fe45e137b9 100644
--- a/drivers/pci/controller/dwc/pcie-eswin.c
+++ b/drivers/pci/controller/dwc/pcie-eswin.c
@@ -367,7 +367,7 @@ static int eswin_pcie_suspend_noirq(struct device *dev)
 {
 	struct eswin_pcie *pcie = dev_get_drvdata(dev);
 
-	return dw_pcie_suspend_noirq(&pcie->pci);
+	return dw_pcie_suspend_noirq(&pcie->pci, false);
 }
 
 static int eswin_pcie_resume_noirq(struct device *dev)
diff --git a/drivers/pci/controller/dwc/pcie-nxp-s32g.c b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
index 386e44dd0477..cb9cc9327d85 100644
--- a/drivers/pci/controller/dwc/pcie-nxp-s32g.c
+++ b/drivers/pci/controller/dwc/pcie-nxp-s32g.c
@@ -365,7 +365,7 @@ static int s32g_pcie_suspend_noirq(struct device *dev)
 	struct s32g_pcie *s32g_pp = dev_get_drvdata(dev);
 	struct dw_pcie *pci = &s32g_pp->pci;
 
-	return dw_pcie_suspend_noirq(pci);
+	return dw_pcie_suspend_noirq(pci, false);
 }
 
 static int s32g_pcie_resume_noirq(struct device *dev)
diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index a6a0e3ecd921..532779295734 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -2480,7 +2480,7 @@ static int qcom_pcie_suspend_noirq(struct device *dev)
 	if (!pcie)
 		return 0;
 
-	ret = dw_pcie_suspend_noirq(pcie->pci);
+	ret = dw_pcie_suspend_noirq(pcie->pci, false);
 	if (ret)
 		return ret;
 
diff --git a/drivers/pci/controller/dwc/pcie-rcar-gen4.c b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
index ba8e6b297674..e3807da316c8 100644
--- a/drivers/pci/controller/dwc/pcie-rcar-gen4.c
+++ b/drivers/pci/controller/dwc/pcie-rcar-gen4.c
@@ -1071,7 +1071,7 @@ static int rcar_gen4_pcie_suspend_noirq(struct device *dev)
 	if (rcar->drvdata->mode != DW_PCIE_RC_TYPE)
 		return 0;
 
-	return dw_pcie_suspend_noirq(&rcar->dw);
+	return dw_pcie_suspend_noirq(&rcar->dw, false);
 }
 
 static int rcar_gen4_pcie_resume_noirq(struct device *dev)
diff --git a/drivers/pci/controller/dwc/pcie-stm32.c b/drivers/pci/controller/dwc/pcie-stm32.c
index 349618ea5b9c..7b3a8c1b04a4 100644
--- a/drivers/pci/controller/dwc/pcie-stm32.c
+++ b/drivers/pci/controller/dwc/pcie-stm32.c
@@ -78,7 +78,7 @@ static int stm32_pcie_suspend_noirq(struct device *dev)
 	struct stm32_pcie *stm32_pcie = dev_get_drvdata(dev);
 	int ret;
 
-	ret = dw_pcie_suspend_noirq(&stm32_pcie->pci);
+	ret = dw_pcie_suspend_noirq(&stm32_pcie->pci, false);
 	if (ret)
 		return ret;
 
diff --git a/drivers/pci/controller/dwc/pcie-ultrarisc.c b/drivers/pci/controller/dwc/pcie-ultrarisc.c
index 514e08a12b5a..8cf8b81a0de1 100644
--- a/drivers/pci/controller/dwc/pcie-ultrarisc.c
+++ b/drivers/pci/controller/dwc/pcie-ultrarisc.c
@@ -187,7 +187,7 @@ static int ultrarisc_pcie_suspend_noirq(struct device *dev)
 	if (pci->suspended)
 		return 0;
 
-	ret = dw_pcie_suspend_noirq(pci);
+	ret = dw_pcie_suspend_noirq(pci, false);
 	if (ret)
 		return ret;
 

-- 
2.34.1

