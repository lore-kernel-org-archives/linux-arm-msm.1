Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794015949;
	b=LffR6qEUJVK8WV5KIyhO2vzztuPxQ4dXbj3KxzAXOXzBrV+L1bmZdmemeKywCxhinQc0
	 +0tG1YbSskjd80rbt6UNRukaJ6DdA6sfYG2M2WjGK5fwr15mtPJjxvmXiHcodBwRZlto6
	 OZh9gRS4Nf3Kd9lCIA4bzhWpZwOxGmjQWf/1RFMYwuAtTWvtUkJ5zIIDhJbGnuiGy6+CO
	 YkImuAAlb497pLGPSUHmd8xI6TeMDBGwJAvu/5wp0ofUOPU4zr8GwvnFp8zJ1ADqjJ9+F
	 DLxar34QcRWgcy2XjfQQPYZewv99NYvLPgP3RsSGKEEAyuPqXlmKC0WVT9+cGQSFiPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794015949;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OfILyUi2gelVBNi9ApytLRHGkKs7JaiPDaFRGyT0JXI=;
	b=tZtyDDBz8npywIxoQbttkvTjZujxkcKl/W5IaLb+MNF927tRcV+Hm+Rj2scdLO7Ah5jm
	 qj2TcbCcTMlFKoknjPKsbyR315bLy0taqDJ6QHzgdR0582QdXvwYv5XA+ffG6gUOAJY8H
	 k0WWbS0udJ24v93+Pwwf/8teNm9pQx1BBjQ49fpC+9YJ7SDBDMnqDWi8CHP1kjPHdO1Ww
	 khMiQ8Pn3kmbOdxW4grbQwAbIKbJm3ZfKo/oBXWeAKMoZXBvW/mHgtiogpCJtlPFooZiH
	 R8lQ0D4ChwAQqsW5omaF6vcb19uDFn2lnRQkWBJuW+Q7Io9B2gkIpG/ZYCwzdOStN4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NQD+0YLu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D2MY17ql;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8340E6082BC5
	for <linux-arm-msm@vger.kernel.org>; Sat,  7 Nov 2026 01:45:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8340E6082BC5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NQD+0YLu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D2MY17ql
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A70gemf2321598
	for <linux-arm-msm@vger.kernel.org>; Sat, 7 Nov 2026 01:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OfILyUi2gelVBNi9ApytLRHGkKs7JaiPDaFRGyT0JXI=; b=NQD+0YLu0X2a5EDI
	f5v78EqmvuG7+7xvzJ4eW008tCK6ylnWOxykOzZZQ2Jdg0lDPUV1Gcteq2lPPHDV
	/sMGuC83QZpqydiKt2XoHH5FkJAYTxa9ae24aaB6MFaNYSqHnvp8AJebN7LMwV9J
	s+Bqu/Sis9zRsosBEpOIzXtY3HaHO+WUSgqlmxlK2qMYqj1UMnnE6Dm+f8dpX7fv
	FBtDuSfUAQLQI0hThh5Ek1uSG4PRJbG8MMU0DNK2YUaGz1JU4dREH/j3slSB8OzA
	S//kcKhpdugPuYaFQlrDjRtgja4jQZ3shjDNGwHsZAVFWPO54pVmOmcz1BdVMSci
	i4KQYw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsspf0402-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 01:45:48 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so2608170eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 17:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794015948; x=1794620748; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OfILyUi2gelVBNi9ApytLRHGkKs7JaiPDaFRGyT0JXI=;
        b=D2MY17qlh8fgfAEMJFlqwJDfZQRwCX/jZIqH0VPcCNENeeJK61nlUI7EyMnVcXANO5
         pXW1rg1nX42nOfkRiXXiSr45YHktbOSN4Ny9wLzuZXEuzzGe1s3oJyfp6Iofa2/2KrtV
         anCyKZUnqCrHaFVslCgZefkM5h2SfwwmE6L9lGoUiv+6Rv8hrjkjCGChInt7Sig3RIYp
         l28nyv08dzuavCGQE3cPohzKXU6ojLnaRo3HH7u4cTUysiEZIRNNjX9Bg8U2FDVPEO3q
         PoffO1kjKBhLxXGV1wgnjYo37RsQ9GImjbVCG9boJxslaCvC8ra1+2ByYyYqkNBo4yvH
         sqRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794015948; x=1794620748;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OfILyUi2gelVBNi9ApytLRHGkKs7JaiPDaFRGyT0JXI=;
        b=AmfmaPLDr8OJh5nU/yPk+amrLvYXPGCcCr7uN5bq/jX49B3NfYrKeecdtNSB+7MhXf
         q4TFW+chosGO/J9dP1GDZ5Yxp2jrKny64sv3+AvCT+75M1OFhm/xuxnNwF3Ma9pKuJr5
         vBaszV625Dfh1GEBeko4c8Pep1D0gxzI87y1XjEie7e8pq2GANRX5k2fxS8DZXiUQn+o
         XuLz+eKdCux2RkjmQ+CfnfcfWgPiQmbXLzJmppBFGJbfObjPbWYxgQ+hpz5nsYB1jzYL
         H8RzXTVFN1JPgndDcIhC36HGsPcf//S203Hs4wZYzb3Sn2t2mVbwRBJj7kjhpZQgRlN9
         8MbA==
X-Forwarded-Encrypted: i=1; AL+hErFIP6lIUfvLKtpeSLpVdISH2EKkrfjKtw4aF5Eb9/B+IWseom1hwYvAmaSjcyrsrtZQlK2N6xShQ8RLhLGq@vger.kernel.org
X-Gm-Message-State: APuU4Z9XySwqZOYdp/viMjeyFApbkFQT2Rgzi/U7UILk57Y+GT8wd+TB
	0ZppolYYY+fajV2lGqMjZYcTEgA9UEDdnqaYU5X+gxP//GMo/WpyS/gssMlJCHagca7gXSTiHqm
	+y0Uijso2qTIPPo45tJgGW/dzP54EMQxQjeTEEo/jjUDglIICELh3fVY4jBv61rH3zvqP
X-Gm-Gg: AYBFou2t1i8svJpjQf23I3d2qOBAlmt9e+0sMXOwZ0r2FA91Z9nW8Np2eG9OHcePzuZ
	8q/uN95gJ4kUeqQr0FVGTh68TfOKNbjNcJlIkuYf/yAYkzAgV7p7riWQde1bWV1uYSPAobWo3Z8
	YY8g7KbataEdCFRwn1y7WZtky+IdebetvfD062+F5n2MfLHhjxooIvGuzh6jRpeCow3hi1nU9Mv
	W0dXlSSN2jAywLeyR9pUstDJCCLIoetiDQv35cd8vKME2MxsTQqdXtjAP1plC70NuYFHxXa3yfR
	vhtyK6zo/Q2TNH/etFgniCu45at+hC/4G1xlPqJzTJU8OAQc4EIJsO75eevIeiBCDNJxw26zgM1
	wQuzOM1oyjYWJx7u8iIt1d5Xt1fAkpTs6S0Ra1N0addVmXvcE6xpofGWZiYS2WX5D8aHWckvuFZ
	O6u30Llqk=
X-Received: by 2002:a05:7301:78c3:b0:36a:1f8:a56e with SMTP id 5a478bee46e88-36f760239e1mr5425944eec.23.1794015947786;
        Fri, 06 Nov 2026 17:45:47 -0800 (PST)
X-Received: by 2002:a05:7301:78c3:b0:36a:1f8:a56e with SMTP id 5a478bee46e88-36f760239e1mr5425890eec.23.1794015947123;
        Fri, 06 Nov 2026 17:45:47 -0800 (PST)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa651e6b1sm22861123eec.3.2026.11.06.17.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:45:46 -0800 (PST)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Sat, 07 Nov 2026 07:15:20 +0530
Subject: [PATCH v8 2/4] PCI: dwc: Force L2 link entry on shutdown/reboot
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
Message-Id: <20261107-shutdown-v8-2-bf607c6429b0@oss.qualcomm.com>
References: <20261107-shutdown-v8-0-bf607c6429b0@oss.qualcomm.com>
In-Reply-To: <20261107-shutdown-v8-0-bf607c6429b0@oss.qualcomm.com>
To: Jingoo Han <jingoohan1@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: konrad.dybcio@oss.qualcomm.com, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794015933; l=8264;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=YeAFc5lAkknI31xI9jDs4HF8TjuPPgMhlkrpRDpy/qU=;
 b=wDtadsY0hewz+L+6QqurEl7xDE93XllFEUjLEhZAayO8fTdSGSZEMhNKN1/zy+vQc52cYiCJF
 7ZhV29T7OWnAlwZyCS+1s7v8rYEEAe+8Uh8Tx9pbw9sgWQLzWxwOulh
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA3MDAwNiBTYWx0ZWRfXyF/ulaM9zl4W
 b3wp8j1zxLRCypUr/SJ57YYZixhSJ/+EPInv+xic6aAKgv+fl5/Zon3pDcDLuR5ktJKjgXeTu/i
 IcwUo9Y+oNk48c2W732l+ATW8FgcWX0=
X-Authority-Analysis: v=2.4 cv=LJzz05W9 c=1 sm=1 tr=0 ts=6aee82cc cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=-MHXjDPJGaOMKVajueQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 7dC1FrEv1OfDwl0mKgfb5yVprAChf-UC
X-Proofpoint-ORIG-GUID: 7dC1FrEv1OfDwl0mKgfb5yVprAChf-UC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA3MDAwNiBTYWx0ZWRfX+6YnkXZTKCaH
 ry8gbPwq8uubTevWnkWxOE/qBEdzKT+wV3MVRhcg/y6/qdbiZHnI4FGjfLcG2s7nhjWTDvFCs2F
 7Bv7vRgXxMDZmYhFOf3FfG16Kk6seCue4i035fpRZ4/PVxlofq7I6GasxqzeTZWA36komezaNFC
 T+usFR+vnCJpt5OS+YAdhJ7S+ONaILTa6ljAFnSKzyQFnX38n/psfkmJaOi3d8R6VRvLANqVgfV
 jqoJnuQZDK7tbkjvrIe3h3JnmWFdyrcCRVm+Hx2lVwhDPBChzHrbToY8U8lFfBsBrxavWiUBBOY
 3gYwYTpu9c3/sNpLuyzG+Tld9y/5drtEKegKC1c7vh1K+EBYGMhF+gjWQ6dBUGT0r9Ko4KgBSYQ
 Hjuc2xkBGR8w0Yh1HQOYC9bqVGgJWvmkFDe4OYzShjJj401p9bSsXf/IohIT0R5/R89l5H5nf/5
 ZCqTxK6nujMCoKN6GWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_07,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611070006

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
 drivers/pci/controller/dwc/pcie-eswin.c           | 2 +-
 drivers/pci/controller/dwc/pcie-nxp-s32g.c        | 2 +-
 drivers/pci/controller/dwc/pcie-qcom.c            | 2 +-
 drivers/pci/controller/dwc/pcie-rcar-gen4.c       | 2 +-
 drivers/pci/controller/dwc/pcie-stm32.c           | 2 +-
 drivers/pci/controller/dwc/pcie-ultrarisc.c       | 2 +-
 10 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 83fbd998551d..1f2b942e8423 100644
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
index 1b298639165d..90e6e25fde73 100644
--- a/drivers/pci/controller/dwc/pcie-designware.h
+++ b/drivers/pci/controller/dwc/pcie-designware.h
@@ -860,7 +860,7 @@ static inline enum dw_pcie_ltssm dw_pcie_get_ltssm(struct dw_pcie *pci)
 const char *dw_pcie_ltssm_status_string(enum dw_pcie_ltssm ltssm);
 
 #ifdef CONFIG_PCIE_DW_HOST
-int dw_pcie_suspend_noirq(struct dw_pcie *pci);
+int dw_pcie_suspend_noirq(struct dw_pcie *pci, bool force);
 int dw_pcie_resume_noirq(struct dw_pcie *pci);
 void dw_handle_msi_irq(struct dw_pcie_rp *pp);
 void dw_pcie_msi_init(struct dw_pcie_rp *pp);
@@ -873,7 +873,7 @@ int dw_pcie_allocate_msi_domains(struct dw_pcie_rp *pp);
 void __iomem *dw_pcie_own_conf_map_bus(struct pci_bus *bus, unsigned int devfn,
 				       int where);
 #else
-static inline int dw_pcie_suspend_noirq(struct dw_pcie *pci)
+static inline int dw_pcie_suspend_noirq(struct dw_pcie *pci, bool force)
 {
 	return 0;
 }
diff --git a/drivers/pci/controller/dwc/pcie-eswin.c b/drivers/pci/controller/dwc/pcie-eswin.c
index 1bb44696057e..21d077172724 100644
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
index c62abfc7a446..d39753f0e724 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -2479,7 +2479,7 @@ static int qcom_pcie_suspend_noirq(struct device *dev)
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
index a0d328c0c09b..3d7af1ff327e 100644
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

