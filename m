Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445844B2031
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792401952; cv=none; b=jd3VbXUrbOdXwC0fMea4D/lW0KvzAb3FdJtK6jpcQ+1JjlrhI7yUOe5rATUBOUR2sj6iAFoYktGpf+68jNAnLWdr8nL2rp2k4RyI9yp1Fj233Ow4Hba3vYUPvJA8K/uZn7PX2lGeh889rNJuTMGFJ2mT2EV38soVST8cNWz+w18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792401952; c=relaxed/simple;
	bh=xu9UkqrTenBHBotGjSYb2DNRMD1vbtCWxZ556RehpDM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BaN0LuUDut9IuKON7vRUpTB8BBqWeRoY1KAx4/79n6lm/5ZcvPygLOireBo6QHPiJrugZ4qy4A7fM38Jmr16UzHwCPvbsNjdJPgFvsLiRs5WmuFfFzlunQ16p78Ss/EMCN/6wpUNNHshYRvKUfWQ8gvGDyd02I22uuXeM5rWPGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=panm/GZd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gRsA4Ekx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="panm/GZd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gRsA4Ekx"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8PIv52754637
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:25:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	blzspiWyOtJxzBS01q7zxMZsMueapA6Q28dKLw57dFI=; b=panm/GZdbtT6x+Qi
	0ORvhI6YQoIyiuFMc8jSiphQvHTV7s7VxWMfsERz2Ru68MCpv9EZG+AAQSpSTlN0
	twDyZtGH5ADlx04kB6yHqRqS76wZ2OayJMVSGFDyuEUEw+Yfq8DvhQfDWIvxJRh/
	Of32Z3oDyPrioZ4U0lMCvTywmPkd76MdpD1M/nmuh6xFq0lPIVsSRtvksf8ya7MX
	VZr1vGjoQUNZ74Okh7eAUxg6mVFEWYpotk1ZIKL8k0Cx+LGDRN/YI2ez9yGRMv6b
	k6tesKnDDA3XQXXgeENVyFC7D7ZO8SHaDvsDzwTB4BZVptwmK4QEnqnguoNy4+bs
	so5RFg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48gc77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:25:50 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so7872602c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 02:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792401949; x=1793006749; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=blzspiWyOtJxzBS01q7zxMZsMueapA6Q28dKLw57dFI=;
        b=gRsA4EkxJSj+NUA9AdF3e6j6eEK7RukKyU6eZ5byJ43t+ndQ7peDDU6qnO3J2AqZ5b
         hhPYvGJOVD3A1FlBVurGlSIswOifKBlzZ7vOhrgLxJJnR8v10Jljd0n1yeyCGrUQEGNX
         to2k/n5ygGbborgjO0mQnsPSw+X4s7mM9WskGX0iHzgRVG0LfJvvBr/LluA3fAvnPgh/
         KewN5k6iY33FtK//5g7pOeYc/FArHE2WcusWCkhr/fRfLRHlair5ASXWqBgvmINllDn9
         1FA8BYhOXK1YHHfVthvIaHMZGBepX131eTPAoLd4ejGi71yfj+boZvkrJ7dzEzCqA9+K
         TDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792401949; x=1793006749;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=blzspiWyOtJxzBS01q7zxMZsMueapA6Q28dKLw57dFI=;
        b=tANovWimL5wutAH6zfw62p3Ey+cQQoLmews8o3s4pD5eVZjbCsKRMC0MFDWl2DV5nk
         gt8d8lG8dlqSu0Bi/tj4H/2frHwi6LwMb9oAfnZuiYWw0HGrOTdcVlU2qg7Bi0iw9xL8
         VUmoYwbSVv5kvA9ViruBbj/cMdqkT/V/WoyAu8tfiX5mkwvwiM3U+yqHq2RIZdeHVVxM
         mPWGnn6D2vIlFEv/OuXrcRgSf71AcFddorP/1GYdLihn+VDPQ5qnJeeki/Y1Ip3YKMRF
         odPUNzYxyqFizOkwd0zT6vkwY6xTqlwxLm1CKVgjtSJFFLye2LUMY/xW7Xoz0nN6Zczt
         4q2g==
X-Gm-Message-State: AFq9FYJRiM1VCRkor0xFxZidcN6HC9bMVzzXXSBpA79o0W064duFDvNW
	uEZrvhc0cpbMUhHoYRARKlh6Vwu3uxgHFSB3o8OIUuWJKD9XAQArvWokj4ydQmmGIqtMTugJ49j
	zS/qIx4UWybBlDkYcjlky1V9zvJO2g7M3CGdUyIG/YZehnYydAfBK1zMHGHDK6IhjWczK
X-Gm-Gg: AYBFou2HAE9YKVUSSd7IVVzXRDiJcQps162GImTuW9q2NBZnNhHHUs6nwBF6LXepQhA
	Ho/E/98uTOX37J6dt5R9Ve2Qv8SUrdZKlsID/za3LRQlCl2WZJTjUHp4S8VUZkLwxm8fZhvhLHb
	8DSDlpv0KDrQwqxeaeTkevKDZ6C6P4NeFuV86SGcMC2z2oDc69tj0jDzcejrihd0dfbqM09/Una
	gR46DYTJQ4RcrTK/PRi8vDidn4LktuQypEjjK6FlxnuMA1NF67D7zWGwF3LXzKF6vxOu2mahQDS
	vMsq2ZLruJFi7USAwBD3LzMrsoIqTv7ex1FTdoBviS1IAfWEEtGc07Hh7QpEY1XE+Dac81z36jW
	lIKU92PeKyT5T/A5avMeKNB7zLcBGdB97bw==
X-Received: by 2002:a05:7023:a47:10b0:15a:9834:73c9 with SMTP id a92af1059eb24-1851453f752mr10057384c88.40.1792401949029;
        Mon, 19 Oct 2026 02:25:49 -0700 (PDT)
X-Received: by 2002:a05:7023:a47:10b0:15a:9834:73c9 with SMTP id a92af1059eb24-1851453f752mr10057348c88.40.1792401948485;
        Mon, 19 Oct 2026 02:25:48 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831c4d4675sm26682584c88.21.2026.10.19.02.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:25:48 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:55:12 +0530
Subject: [PATCH v2 4/6] PCI: qcom-ep: Set initial interconnect bandwidth
 before enabling clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-monaco_ep-v2-4-852cb9f5d012@oss.qualcomm.com>
References: <20261019-monaco_ep-v2-0-852cb9f5d012@oss.qualcomm.com>
In-Reply-To: <20261019-monaco_ep-v2-0-852cb9f5d012@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792401919; l=2784;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=xu9UkqrTenBHBotGjSYb2DNRMD1vbtCWxZ556RehpDM=;
 b=PJQxjMnSel094yAn0e2lWNVF+PVM4h9M+bWwd/TcwqwOIgza0IZsozs407okf5hOHc2m5QVTq
 rV8A4Jq3L9sBZ5LDiJkc5QhbetIdnX1TnEWATH7F1iFnRrSPRMs/+hw
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNyBTYWx0ZWRfX3LUEI/K1USq/
 0owxVnj0wIdlg6HmlE7rMK8tk1eLRofcjkkn04klyKwdm5zC1dpPrd4cusoyUNyPqG+xGLBvj3n
 SnzOn0tbe2x8zAybYHYprgEDWi6tHqRFx63P417but2GhkmAeQ3ybyuTF5KRoiFFJ9S8aEtZ/i9
 gt8L6lMiB0YcdKYyXvyB1eVcX7QTvIkBdaj9agvHDIPF/e3Abwmg9hB18nZfxvdEZ+0uk8q8R7Z
 Gv6S0xIGp3KdsPEIrsyQCluvxgTXCeER/0Z2IuqQch3FGqRMc7BKA5MQke424if/4Rq5Qcdl0JR
 hxgJsRbw98CkpShxp9AU2PXeH0KXUjGtzBT/uncZoJsxjMAcxEK7Y3gXNx6biirafuSSTtJls5O
 vkX7Sgn/brQZs2PNeuz8v4h2Xk8HYn0TAv3KEif6UQQP6spCVICzlVi3W+lnKbf6OpHT628ElaK
 y+87cTTzYhbn/hsT0uA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNyBTYWx0ZWRfXwhEst8zyelQZ
 SmUQ5OFigVX8n/jVWOj3Vjl0bcvS5u4cjjgCiU9lKYws6Wkfw+qvDiRH5+sWV3hQmhWlS7zSQu5
 RLCyfHAUEpaN4oedDMjWD+BHtY2XIVs=
X-Proofpoint-ORIG-GUID: buwTNbCtTP-cDrDt1kqwRLszy9di9XxY
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad5e21e cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=kXhGf0cxdCgfIYue-YsA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: buwTNbCtTP-cDrDt1kqwRLszy9di9XxY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190037

Some Qualcomm platforms require the interconnect bandwidth constraints
to be set before enabling the interconnect clocks, otherwise some
clocks get stuck in the off state.

Move the icc_set_bw() call before clk_bulk_prepare_enable() so the
bandwidth vote is in place first.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 36 +++++++++++++++----------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index 56184e6ca6e6..6b5eaee84f8b 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -331,9 +331,23 @@ static int qcom_pcie_enable_resources(struct qcom_pcie_ep *pcie_ep)
 	struct dw_pcie *pci = &pcie_ep->pci;
 	int ret;
 
+	/*
+	 * Some Qualcomm platforms require interconnect bandwidth constraints
+	 * to be set before enabling interconnect clocks.
+	 *
+	 * Set an initial peak bandwidth corresponding to single-lane Gen 1
+	 * for the pcie-mem path.
+	 */
+	ret = icc_set_bw(pcie_ep->icc_mem, 0, QCOM_PCIE_LINK_SPEED_TO_BW(1));
+	if (ret) {
+		dev_err(pci->dev, "failed to set interconnect bandwidth: %d\n",
+			ret);
+		return ret;
+	}
+
 	ret = clk_bulk_prepare_enable(pcie_ep->num_clks, pcie_ep->clks);
 	if (ret)
-		return ret;
+		goto err_disable_icc;
 
 	ret = qcom_pcie_ep_core_reset(pcie_ep);
 	if (ret)
@@ -351,28 +365,14 @@ static int qcom_pcie_enable_resources(struct qcom_pcie_ep *pcie_ep)
 	if (ret)
 		goto err_phy_exit;
 
-	/*
-	 * Some Qualcomm platforms require interconnect bandwidth constraints
-	 * to be set before enabling interconnect clocks.
-	 *
-	 * Set an initial peak bandwidth corresponding to single-lane Gen 1
-	 * for the pcie-mem path.
-	 */
-	ret = icc_set_bw(pcie_ep->icc_mem, 0, QCOM_PCIE_LINK_SPEED_TO_BW(1));
-	if (ret) {
-		dev_err(pci->dev, "failed to set interconnect bandwidth: %d\n",
-			ret);
-		goto err_phy_off;
-	}
-
 	return 0;
 
-err_phy_off:
-	phy_power_off(pcie_ep->phy);
 err_phy_exit:
 	phy_exit(pcie_ep->phy);
 err_disable_clk:
 	clk_bulk_disable_unprepare(pcie_ep->num_clks, pcie_ep->clks);
+err_disable_icc:
+	icc_set_bw(pcie_ep->icc_mem, 0, 0);
 
 	return ret;
 }
@@ -387,10 +387,10 @@ static void qcom_pcie_disable_resources(struct qcom_pcie_ep *pcie_ep)
 	if (pcie_ep->cfg && pcie_ep->cfg->firmware_managed)
 		return;
 
-	icc_set_bw(pcie_ep->icc_mem, 0, 0);
 	phy_power_off(pcie_ep->phy);
 	phy_exit(pcie_ep->phy);
 	clk_bulk_disable_unprepare(pcie_ep->num_clks, pcie_ep->clks);
+	icc_set_bw(pcie_ep->icc_mem, 0, 0);
 }
 
 static int qcom_pcie_perst_deassert(struct dw_pcie *pci)

-- 
2.34.1

