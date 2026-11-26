Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795670251;
	b=n1BgDQgWrhJsVh4+aQlcd6XzhnG9HIuZw/Wu+UH/hdLCqSTrpr/+i8YYcU1XEAOmsuKJ
	 lltOv2F8GzMT58HSrFJuACYa2hTF58auJ0rKQGbCw83tISAI3vgkFcC8GZ2igAh2H/Kom
	 FOs0D6AtEH/xFizdrJIX5Lz0S+Ay86tFqYca03Q/uvO+N8u7t4jT9qjZmryiVc0Xee0eg
	 zzPzwgnJKWhOaYDVSWaxDotO3XlqUzPBSf+9K3bF1KPR1uxsqitJDqop2YcqvcLsvWWZK
	 w9m5d24V+WTI3+awYOycYFbFui8uRiYuBbuwM1P0RJpr5kw/CfGnwvXEIcNwZCq8PoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795670251;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sScIlPjGf6pwCcf1w0bGUGMbyCWhp3/IW2P+c5YbTiw=;
	b=if1GBigWM/mQFXINCsOjhNKjAzMO6CsLOpEp8S9gZp67uCQnjOXKI0TbaEm5N5pMokbD
	 z9DfAVjClaYhSLFLM49W50QRLZ59VMbSKZhrnwlL9c6BJJdad8Uc0O3oYWrHTxZItIksC
	 ly+MAyck+DNau8y9tgqhY5mSf3gaf8gDFkWVjUCAZJDQUaTwdDWdLMd0r4voxlxXLbdzT
	 nTrX96U4Fwu5l5NldERk2/upCRW9E99zbRfmZpbDkwMRsZrjpxyBMjCNRsr1jvNZ6OrgE
	 FchIK3fgeyYTyJIOLkf4Kf/Uf+w60l0WWx44PxXZbp7Ks+M4S1m7nq36MFrYkpW07Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Rm/RtYZE";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jlYn4URt;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20B6606A335
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 05:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A20B6606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Rm/RtYZE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jlYn4URt
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ36hrO170335
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 05:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sScIlPjGf6pwCcf1w0bGUGMbyCWhp3/IW2P+c5YbTiw=; b=Rm/RtYZEpjvuXLUL
	2SOInYpg9jaNYYpXjpjDEjyUMmWsh5xdVqc4CdwLuMCHtiGGU6v5z74DbKbA0hg1
	e0L65yxNb1WvyCRp9o8sEBywgp6gDRY73GHcnVTSq5UojZ0cP4m8IVzTfc3MuGFR
	gmDoMwtQBfcc4ppoIENkkVDMXk9bQcTAJcQmhvlMJf4qW5Ynha0ypy6w+BsTnK1q
	IouLXzCzVD08SH/GZkAwDjVA2ctFPELMwAHbnUyV6cyH70kEQA7LULj9J0zWrcfS
	Q+0ANjtShAsIdvIi80BwKBv73pFTSNjDe8PJF77Tv3pfytFECZN4u8dIyFYdwY0E
	5UWqSw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vukv25e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 05:17:29 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b3ae17c536so6218290c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 21:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795670248; x=1796275048; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sScIlPjGf6pwCcf1w0bGUGMbyCWhp3/IW2P+c5YbTiw=;
        b=jlYn4URtshDY3NrautA1CDeIRPq3l4HOQZem72QF9qDgqiq9lCj4lHb3WjsQoFeMJF
         9yyWDlJAROQI8g/iOVZaNm8biPq8yqpqBbtjagodG9oFoZcuuFE85pB6G3J7Oh3BnNT3
         UExrAjmCgSH4HaCtO3pp4fvqTrWv/ZeXSqXSkwe4/fdvMD4YFJZTHzFBJBJnctz+N95N
         gS+aN+sCB5ugYEjaE+EwkkO5Uo0/gh8Rq4htsaRsl5ROO64R6WBJLUNy2a3oYr7OUSIU
         lpkdgLi7e2WAOhK3SI3nBph6ze4/mFNesfsrI7VaQtfDcZFP0cBAhYH11aspT0Zw5PQa
         E6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795670248; x=1796275048;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sScIlPjGf6pwCcf1w0bGUGMbyCWhp3/IW2P+c5YbTiw=;
        b=cFrrbJpxaSTSzp9tC4DZpBQlZd/+FAeH8DEkJzXMo7r+xMKVP/r8A+W6/W4kkiJ7sz
         0Jt0sX5G82iInhq3LuO9ehNk+lHqhR/Wj4ltUJe4AVRxcP7MyFgkgRmW1LmdiwyQkWSc
         xs6BBclSAVU3qiUnVFtGs0sVKOyk2CoMag5f+9Gx1t+VYiIjn8e9PlDtBSMzL6VN1tuS
         btII442y++U9uR8NRt5FKPtxjDZoH0NXNxuAc2hiGaQJDEXiNi5l6j9WiMl4Ng3W0Cqt
         UvtM0QNmQfUHsLDT/hBCABIUdjJ+9LTecnU4BhvqsNXIQjD5LX2Zr+atINm8JVgzHkV4
         8pcA==
X-Forwarded-Encrypted: i=1; AL+hErGkUN8EcBPSvn91M2AzS2j+wJPHnliPc0qk15+WYHOw9+YkUAFx8iIykoDMtGoYiqu3P8eQ5g5pzTAhhYWN@vger.kernel.org
X-Gm-Message-State: APuU4Z9kDfYYJxzuwQKaEi5gajRcsAwSedju3wBwjQdoFXwnf8fSJKZ0
	EXYFnkT8ZxY4TX83G2TTYv7luZImHcOTAO3L0/LJoqkobxO+cUmRuoU+NU6LwAlX/MVCCZue6x4
	1vGpa3wyuB9yfmq4xf/VaYpUI88jx9XvY/CZe0pmWBqsxg1e1V7sah3KwvtSV+xk9ZRvaC6BFy7
	VR
X-Gm-Gg: AZFdTZfRWzPhCDcJ3tDuIr6eIDvzjeytI8QhHM9egmE6JkfHqR3nKCoatRPjZXSJ0Mm
	tcrVLAoAJBQGlKeGREwExhRoUT7ZlWWWm9/4eFV8YN1fhew258VvTcltbhgEQjPBdPUpOGFE2Yz
	MUbAZ74pAItjwVlPWrDlh3ea1eHXsVSt84qpp+Hu6Wp2bIlSWpM+MunLYfht+HhpsH88rNshGIE
	CnfckOgRQ1e8n2yiCnoaiexyG1dN5cqK/RFYkPvPzhK3QM+h7NRc7UbZ5w/QEy8N7qMPp0XGSNP
	oXHaCYE7fy/rybxqf1IMwG+FAm6sfy5EwjiBUHEW816clmVNgrnZ3ToU075QlKYmSGAr6hz/YQQ
	tzFn/fI4CLTn0PDC+sH/1xzdh98UrXxFBjqF9t0pfqlCjCx2s415WlaMI7DVV5sHb+5VPfljjpq
	SEk7fVeaWm
X-Received: by 2002:a05:7022:f90b:b0:18d:5ef2:1644 with SMTP id a92af1059eb24-1b5568ebfaamr18385695c88.30.1795670248404;
        Wed, 25 Nov 2026 21:17:28 -0800 (PST)
X-Received: by 2002:a05:7022:f90b:b0:18d:5ef2:1644 with SMTP id a92af1059eb24-1b5568ebfaamr18385673c88.30.1795670247778;
        Wed, 25 Nov 2026 21:17:27 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm52132934c88.13.2026.11.25.21.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 21:17:27 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 10:47:01 +0530
Subject: [PATCH v10 3/4] PCI: dwc: Add dw_pcie_mask_msi() to mask chained
 MSI without freeing domain
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
Message-Id: <20261126-shutdown-v10-3-fed60d9687f2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795670232; l=3971;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=/vmyVk4dz+wXrRT6tQz+Km7L+PUDZ3c6yimuyC/uNnk=;
 b=DSp4U2tq4ELe6YeAKN/099kZfgoT4nSP8EpgbSa1lH7xnwsRV9dB+lZjvAaOBX75GJGGx8hyC
 gASrQKKPwmmBIq9m+XrMqYdU0tih5nIl0LpAsMDQ61zAk9bZtcm4sku
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Authority-Analysis: v=2.4 cv=KfVHIgYD c=1 sm=1 tr=0 ts=6b07c0e9 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=h4B-02p0z56_JbXvspoA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: 7xudNHNrJsiZG5H7ozwo8ApJKkk9g2LE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAxOSBTYWx0ZWRfX2bvGmomUHXG8
 AHSQzVy+f62pcggcRJg9biMMAQW320COfIBQXlfiq1NEgApEXML/qAcxkBq89KI3fMILtFSDltx
 nviteLCxrvKTEbhKye0YFVfuEmrVzPM=
X-Proofpoint-GUID: 7xudNHNrJsiZG5H7ozwo8ApJKkk9g2LE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAxOSBTYWx0ZWRfXy/GEIr745uU0
 tBGkIdaYPw79SC1MchJRuv5RpZxSOlIJQCGNM/X/HSMtD0GXiHhp6V+x3jSg3TQ/6F5wljXmfsQ
 gqTBIHB41gySM9JHJ2aAhcSxwj0rJQfUQhwtLdCZG5K+gSQM/ECJD3uMwLb3gzzp5tNPFkUyizB
 nnChANnv4TDirshWKtvMT1R1Ou8KEhqkNVYyax7DAx4VTofoYFbNj8ew3moMdPCAbOcta1bRzZ7
 7Xiy7wWSIGedcIcR6ysL7+1bU8me4aItjk0Gd/PvJn6cEk/1ST2tzbVIxQibROVq6Kj8CXW/x78
 qj+igfTuX8OKL7DBG+jHhwN6CwqP/YfM/hBgT3swPDTb9JACn7ZX4Et6uo90l+hsmETIEuDS1pR
 sJ14v7aHm4wCNn3+9+LFJ5jP6djJEX8RLyBjeNkBN2t27j8bTqsaL/YYfqYG3a+ztqQE6Kf2J7i
 m16CvaO9jCsB7nCr72w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_01,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260019

dw_pcie_free_msi() detaches the chained MSI handler(s) and then removes
the MSI IRQ domain via irq_domain_remove(). That is correct for the
dw_pcie_host_deinit() teardown path, where PCI devices have already been
removed and no MSI mappings remain.

It is not safe to call from the shutdown()/reboot path. device_shutdown()
does not remove PCI devices or tear down their per-device child MSI
domains, so endpoint drivers that do not free their MSI vectors in a
shutdown callback leave live MSI descriptors parented to the domain.
Removing the domain there orphans those descriptors and leaves dangling
references to freed memory: during a subsequent kexec CPU teardown, IRQ
migration walks irq_data->parent_data and can dereference the freed
msi_irq_domain.

Add dw_pcie_mask_msi(), which clears the chained handler on the MSI
parent interrupt line(s) via irq_set_chained_handler_and_data(). That
masks the line(s) at the irqchip under desc->lock while leaving the IRQ
domain and the downstream MSI mappings intact. disable_irq() is not used
here: the parent lines are chained handlers, so the standard flow-handler
disabled-check never runs, and on irqchips without .irq_disable (e.g.
GIC) a lazy disable would leave the line unmasked and a late MSI could
still reach dw_handle_msi_irq() and touch unclocked DBI registers.

dw_pcie_free_msi() now reuses the helper, so it is exactly the shutdown
masking plus irq_domain_remove().

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-designware-host.c | 17 ++++++++++++++++-
 drivers/pci/controller/dwc/pcie-designware.h      |  4 ++++
 2 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
index 0837bb9e67e0..c81424e2f95c 100644
--- a/drivers/pci/controller/dwc/pcie-designware-host.c
+++ b/drivers/pci/controller/dwc/pcie-designware-host.c
@@ -227,7 +227,16 @@ int dw_pcie_allocate_msi_domains(struct dw_pcie_rp *pp)
 }
 EXPORT_SYMBOL_GPL(dw_pcie_allocate_msi_domains);
 
-void dw_pcie_free_msi(struct dw_pcie_rp *pp)
+/**
+ * dw_pcie_mask_msi - Detach and mask the chained MSI parent interrupt(s)
+ * @pp: DWC PCIe RP private data
+ *
+ * Detach the chained MSI handler(s), which masks the parent IRQ line(s),
+ * while leaving the MSI domain and downstream mappings intact (unlike
+ * dw_pcie_free_msi()). Safe for the shutdown() path, where PCI devices
+ * and their MSI descriptors are not removed.
+ */
+void dw_pcie_mask_msi(struct dw_pcie_rp *pp)
 {
 	u32 ctrl;
 
@@ -235,6 +244,12 @@ void dw_pcie_free_msi(struct dw_pcie_rp *pp)
 		if (pp->msi_irq[ctrl] > 0)
 			irq_set_chained_handler_and_data(pp->msi_irq[ctrl], NULL, NULL);
 	}
+}
+EXPORT_SYMBOL_GPL(dw_pcie_mask_msi);
+
+void dw_pcie_free_msi(struct dw_pcie_rp *pp)
+{
+	dw_pcie_mask_msi(pp);
 
 	irq_domain_remove(pp->msi_irq_domain);
 }
diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
index f774fc6d2a24..677e5423c5e4 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -908,6 +908,7 @@ void dw_handle_msi_irq(struct dw_pcie_rp *pp);
 void dw_pcie_msi_init(struct dw_pcie_rp *pp);
 int dw_pcie_msi_host_init(struct dw_pcie_rp *pp);
 void dw_pcie_free_msi(struct dw_pcie_rp *pp);
+void dw_pcie_mask_msi(struct dw_pcie_rp *pp);
 int dw_pcie_setup_rc(struct dw_pcie_rp *pp);
 int dw_pcie_host_init(struct dw_pcie_rp *pp);
 void dw_pcie_host_deinit(struct dw_pcie_rp *pp);
@@ -938,6 +939,9 @@ static inline int dw_pcie_msi_host_init(struct dw_pcie_rp *pp)
 static inline void dw_pcie_free_msi(struct dw_pcie_rp *pp)
 { }
 
+static inline void dw_pcie_mask_msi(struct dw_pcie_rp *pp)
+{ }
+
 static inline int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
 {
 	return 0;

-- 
2.34.1

