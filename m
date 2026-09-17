Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAB84C4F5A
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789643632; cv=none; b=WQo3P02HGPysEIDoKHt7VzweuiGoxNsgsoCO21WURVgAC2P7hR2nQJPlxx/qQfj7kYv4F7bictf1USBKEobVgRNtI8UJwznS94QPKPociMnqbCSXn908KJnxNvdn6LbdXWMjuWnrpte2Y/5d/fWU6HIgA74qCE0z5H6jufqAmqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789643632; c=relaxed/simple;
	bh=QUu5ITDtHc8Ii7Zs3ZplM0M3E2yE5hAdCQIs0YkDlsQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=czg6ahARcu6JcBJeaCXM6dN//Z+wLigumXgOgvXyoqqaSgcm+wS7sFDt3amUp6en5ihftxSBrz4gNwDJBeTEwQOZiZghnhgdCl/iz6Ol0V11TD/17R2yxTy3mO5oENpgUDhVTMtvhYy7rDGuTHKucc4ipeLn85OswM2lTjxlYH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jiZuv3Gk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c79q8dNX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jiZuv3Gk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c79q8dNX"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZubH2211071
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:13:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9kQCeIkddaHgKq5hDHusu9
	orA0+/BEWygd1EJCMNODA=; b=jiZuv3Gkxfxn6l9/udf1beliF9IoaVJ2ySCaiM
	ZmLTF21E0AjOMnmQBvIry9I87Nup5uDCxbOVsbjpp33WLTKTowfNlSbUDKy2SSAP
	TvwkULPtSWq5VmBPl59g3TNJ2BPoM0B+xdCqWcZgCphnMelLvpXNGLElxVWcBa1t
	WS/f89xEUEX3vhgwhNMNfSM5ulQv30t6bgBcbAaQ29VuVrDtTQYOyivXTSwVjPKB
	R6ZwhClSDS7ZuXOSQZ5hqnTkdIbFyPevpMlOWTfQyLgCjMlX2lPVaKZ+FkWhtLGH
	2vpil7lZ8KusYQfsIidOBQXnpDv63R2oSPQxeeiKyhr4d1vQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gr79m20a8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 11:13:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398d0010cfaso1424157a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 04:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789643615; x=1790248415; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9kQCeIkddaHgKq5hDHusu9orA0+/BEWygd1EJCMNODA=;
        b=c79q8dNXVczzs/cVikO3yVrZ6YzoPyOMXIOBDyS1j64J75gnHUEBWVa3DiObroLE91
         I1Kan9Ab/n6gVV8LERK+UO/wBmAYSAI1BmoDw7P35o/VBO6vMpKWeUT9hjoHdIko+U5v
         bt6eP18kVXGyTijBC03hNfPCLlC5q+CN8oLbuDcc6yaCmEV8zO02LS9KhjXQz19dZ+W5
         2RWh3qIAfrleD980dUyx5cRk5sRcHH/QI1l3RRlyik4227fXOmIc2UC6pkzytfXyvM0E
         6IBeJIXLKVzTNIPTNlrjTIK6UhbX3eI0HgPpV4NGupc0I22+Wx0Ci9zwHDjZgQaUtQXw
         7Law==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789643615; x=1790248415;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9kQCeIkddaHgKq5hDHusu9orA0+/BEWygd1EJCMNODA=;
        b=d/7oc4c9YPvpYfUJfwe1UYI8kCX+rn0DjsUmj/b2LpyviExGukN8K81R3fI+2NNhsi
         idaZ0MMqZ4Eof0ImBH+It/ohs5tEgpmxNrVCobWrdA/vOKGwvYMu+mvpQktJ2nk7mrDL
         5SeF5QdUxCKeW7aFSHuHQeVrv/a3uXFQaBVhmwFrsGm3W54X80oxm3wyc+daIh+YV0IX
         WN0oTg4YCtyei2wF+6eSY3cLXPZo1AKCFwsgRw4KHJsV7VCioqzGPdEviG6s4AG21OIY
         XUuIX+RPIZZhPWSv2COWreayYjN99X+jZRGnFFn+xg6sD/dAF1D00W7PiqxDbrWkGsYo
         RvHg==
X-Forwarded-Encrypted: i=1; AKwUvBzo3GP7K3L40wsgTVnZIX1hVhQkGtNd654arII7aegRK/OE+Tc00ytU3BN447tl0fdukQ4J20qEgUlL1EiZ@vger.kernel.org
X-Gm-Message-State: AFuF++kwnfFdt1ECmoKKE15lblNfnSCU6tN5Ah5NP1gGTIM8tQCXNd0O
	D2g+fR/Qlb7hp27bgm0uX2jPlpULpwPMTWA0bwmPJo24RDiP6iocFtFq2xj6+IXzasZGN3p/dDx
	PahlhaHLX63US3UPzZdVehDaMuuouEmlExGaNvBbbknHn3W0md3hMWKAr/PHoQJeUGJhIdB+yRr
	lm
X-Gm-Gg: AYBFou2n1ouosylFp8joKrOXntTau2KBQpMKOaXqM9CABqCJUByF//Gmh/XcaS5SnPp
	RS6Z5VHxzGt6MF7JNBYaplmALvNdVUD1YUUxFU3SX0EP3Azyayb2+d2IjqmvsdlpcWvSwRlPtsF
	wOvAlJbFuME42moTDzJyg0bmcoAaoIuPPan5U2Vj1xOdI3k3kkI4PvB2Cuxmx4CDe1YBV+mkFL5
	AQHPSjUMrQHXz87LdIVDrrFEYxrAvAvQFoHLzJGnR62ka8eYryHH67fx/M7tv+4oYKAxsP/6d/r
	vYKV6wWmLcsPZP1KF/Hl2+AKPwrkOypNmrcbyPuXqw4IYdYQWRyw1Bso8VKXbeY+UgwmsKk2CNg
	Ab17y59IuNnoJPjCVPA==
X-Received: by 2002:a17:90b:3bc8:b0:398:dcfe:968e with SMTP id 98e67ed59e1d1-39e1e504f3fmr21894841a91.20.1789643615489;
        Thu, 17 Sep 2026 04:13:35 -0700 (PDT)
X-Received: by 2002:a17:90b:3bc8:b0:398:dcfe:968e with SMTP id 98e67ed59e1d1-39e1e504f3fmr21894761a91.20.1789643615076;
        Thu, 17 Sep 2026 04:13:35 -0700 (PDT)
Received: from [10.213.102.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c13f09408sm4182617eec.7.2026.09.17.04.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 04:13:34 -0700 (PDT)
From: Ayiluri Naga Rashmi <ayiluri.rashmi@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 16:43:28 +0530
Subject: [PATCH] PCI: qcom: Skip DWC MSI host initialization when msi-map
 is present
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-skipmsi_forlpi-v1-1-14a4932a4311@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFfLq2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDS0Nz3eLszILc4sz4tPyinIJM3RTLZBMLs0TDRAOTZCWgpoKi1LTMCrC
 B0bG1tQCYK7EmYAAAAA==
To: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>,
        Rama Krishna <rama.krishna@oss.qualcomm.com>,
        Nitesh Gupta <nitesh.gupta@oss.qualcomm.com>,
        Ayiluri Naga Rashmi <ayiluri.rashmi@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789643610; l=1576;
 i=ayiluri.rashmi@oss.qualcomm.com; s=20260908; h=from:subject:message-id;
 bh=QUu5ITDtHc8Ii7Zs3ZplM0M3E2yE5hAdCQIs0YkDlsQ=;
 b=n1CKNuBfoJyw5Axyahxof66zhzd8kkbyMzZSmkxQqn7DCBRSmNLfmijtb0TZmurHit2D/AgQF
 +eMSursPvKtAMaMmtzuYUAnH4eUwOHVp29FDnYJuNG4Xq65TfDWgNrZ
X-Developer-Key: i=ayiluri.rashmi@oss.qualcomm.com; a=ed25519;
 pk=1QirVYY/Jr5yksouJ2UVoj8WgvFV0DslFw8IxhxBIIQ=
X-Authority-Analysis: v=2.4 cv=Qf7zLcbv c=1 sm=1 tr=0 ts=6aabcb6a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=dUMTi_qJSBHAiAAREwIA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 0UTHCqL3HTLK7PBcSiKnEUHZvIMC5Tos
X-Proofpoint-ORIG-GUID: 0UTHCqL3HTLK7PBcSiKnEUHZvIMC5Tos
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE1NSBTYWx0ZWRfX6lX2U9289fiK
 nuEDIKpg6NtvYpWT7fTAh0v5DEUy2VAXJtRmI3cli9lh8Vny4rHbaK3fJg6/ES4FB7Wz0Er4b/Z
 JJKBm6cuxxH4SOqV+25K32apuzTga+zos5150c8OLTYJIqNbuSTlWtvrClhO2m0GqBVDVhMbIwa
 J5TySpXy4/C3IyMsS+KSUA6jUjp9eaDmjfDzcV5SU9JQEomnNWKM9GdvgYwk2jvwEUflviIAxvD
 GV+bfrmDgob11kTXbqfS9UNalhQ8LJLPeIKMf9+CZaZAeB8NKZEgY2kA9dLcvd6AFLvBhnZXXeS
 vcXRDtvIYsh2pY3lIu2CH4I5AqBT39fJpJaZvyFxEC+YT1iSfJtDsdP5MrgxoxtLK/C7NN9Z1rp
 sg1ldp29y2UFjyKVmwtr3PfhS6EBRlIcxRQhCtQ/w/0J92OePV7k02yYJ+YYjEz/aQZTNLGLELN
 KKZavK3WsqlE+VByXzQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE1NSBTYWx0ZWRfX1OfoUpKzr7md
 kztAYd3iExv+bWMJ/ZRmM6nQWpdmX/Mk681N9Tx6eTDDU6aq63NWK42nfpt11qo3tWKynZ+zfN3
 aKEtbOX5geMkwbQhhtRwcw15AwrmwE8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170155

qcom_pcie_ecam_host_init() unconditionally initializes the DesignWare
internal MSI controller and sets use_imsi_rx, irrespective of whether an
external MSI controller is described for the host bridge. When an msi-map
property is present, MSI interrupts are handled by the mapped external
MSI controller. Initializing the internal iMSI-RX domain in this case is
unnecessary.

Set use_imsi_rx based on the presence of msi-map and initialize the
DesignWare MSI host only when iMSI-RX is required.

Signed-off-by: Ayiluri Naga Rashmi <ayiluri.rashmi@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom.c b/drivers/pci/controller/dwc/pcie-qcom.c
index ee63a6ec99de..b65852c32a55 100644
--- a/drivers/pci/controller/dwc/pcie-qcom.c
+++ b/drivers/pci/controller/dwc/pcie-qcom.c
@@ -1981,11 +1981,13 @@ static int qcom_pcie_ecam_host_init(struct pci_config_window *cfg)
 	 */
 	raw_spin_lock_init(&pp->lock);
 
-	ret = dw_pcie_msi_host_init(pp);
-	if (ret)
-		return ret;
+	pp->use_imsi_rx = !pci_host_of_has_msi_map(dev);
+	if (pp->use_imsi_rx) {
+		ret = dw_pcie_msi_host_init(pp);
+		if (ret)
+			return ret;
+	}
 
-	pp->use_imsi_rx = true;
 	dw_pcie_msi_init(pp);
 
 	return devm_add_action_or_reset(dev, qcom_pci_free_msi, pp);

---
base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
change-id: 20260917-skipmsi_forlpi-d9c486a1a04c

Best regards,
-- 
Ayiluri Naga Rashmi <ayiluri.rashmi@oss.qualcomm.com>

