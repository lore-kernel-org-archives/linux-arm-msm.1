Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC385434983
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 10:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791542206; cv=none; b=I661niGMpc3MoH6r9cycMMYW9QWymuUmgQc6SvjBpTqM1HKD2wo6xb9iJOLEvolIlngaj/2Prsi233EHS5GF/03DClbPSSs1MThrXb76lH2HLUO3JlIWOA9o6Oh+4Lp4VKXL9Vtm5A4U9Y7amCtb5ixYjFESZpfMVaubzC4hwWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791542206; c=relaxed/simple;
	bh=9kyv/RmQosGyDp9VxTpU4lmroLa4HPs6mFTgIA1kMzM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hJolddqJvj2eT8LfgsQaygJVlq5dIrJYhYenY/gak47AvbUTx7uf0uM1DRx5zuugNn+EMxBajvNAqn+OjNxwGDK7ni0Gw6oqWrihODfLXhT2yIsBdG8GSYcJ5RlXTzuvc5YqQmLMajlmbHQ7ohQ7LUqJodVVB17OILF13ofTYEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b9rkdaIu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g/OHibIH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b9rkdaIu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g/OHibIH"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KFga642355
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 10:36:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AtE/d8mRsSzaG79+2m8aJWMacLBckY8idc15SCnRGq0=; b=b9rkdaIux+ABQXxA
	AMoMbpQlAig3WRGgx6bG1mfA+IheKGvnAVSWNcGIzVzjfFvvmrNUKtKSX9IJJYsE
	H/wZlYi8rPGUNMCEIRX0zs4uj1uN9pyQny5sV86LdI7MoTCehTG12bbbrM3Om9Ff
	o58LDHQfjADVTmdurU1KYBRCGAaKQXufG7wfXvz8kzDOBYkHuodafE0Dyss/GXSh
	Bk1T1ci5yN+Jl7uBJjJi5f9XQr8eDPUeaO/nCMRWE/KgItILm3jov3vE+stHb0Qs
	XnaHMJbgGfPsBz94ZJSAmVhR/Ku33U2t+ztjqDgpiE/ONOZQ3XdoxJCWig3N9VhL
	5Rh7+Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxru5e4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 10:36:43 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc4fc935a11so4082786a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 03:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791542202; x=1792147002; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AtE/d8mRsSzaG79+2m8aJWMacLBckY8idc15SCnRGq0=;
        b=g/OHibIHYZe/lYkEnkZY+uIAzFTIX/VxUBp0jmgSjeuTfho1Gua4SIJPQTRoXKmF0g
         no/A175eoWcCOe7IkltWXrJfzYSQ3O6cDJiJ6VtlKa/SUEfpwADV5qsg9YQmnDEaPiBX
         0iLPKe2ZUuQpBJuqz69WAWQ6rizc2JswArDl3Z7Fw5hdA0NcwxwurQndoZ9LlzxbY4vy
         XafLxLLNBQZUVP35T7RWZwYbk1l0/rw2hfeqxw0KH8qG+egQBf1pqSJO+TZrKV09uLYZ
         WytlpvR0nrKlJhUVeQ5qLQNE3T+Vo8KhZfaAhZSRRZvAesX5oFVrlYIjpCQH3cGqiTQ+
         XyVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791542202; x=1792147002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AtE/d8mRsSzaG79+2m8aJWMacLBckY8idc15SCnRGq0=;
        b=t0FyF93z0idzWB9QTUjUBsFlsZorizOyGTtu8d4oHCmx5HnLlmmU9ZHw/xxztRUBTy
         edYIfkaHi3g8doHX5wOVq1nLWe4/gHf9QVPnxXbJ004FyMogIBcF7S4CoREVItqJGaZN
         ZM6+gVt/sWutyAcG/zn3UShXUpGExw3qO3yJqf0Zuz1JL6ubWGOGYeDnglgFie0dIHQF
         E5Ww8qxuwwbNMVDY51pLqT+wa1HTG7cPw4Jqpe/orZl/X6e2jhzHeIbmm4aMWD3VUDL2
         q1dApxd4p0AUfpOM5L161wc1zq4AsN+o2nIwHj67Ahky0hxN0ATur8wgpdyJRfo4oo7f
         bukw==
X-Gm-Message-State: AFq9FYJ610qK49ddP2lS33PWr9ARFvjAny2kWoAqyXpTRWzfXCQLcb8k
	DGEFSNsVYGeiuKcnHXPaG2sRhbTlvVQDqx/TkvMoefD2WQ3Pk8+jnsdx4jUlDDRwhz0ddN1dPSd
	e22+0tDdXOQNxZTr69FFPWqvXxDURZ2tT/8VsZn8m7mebuYPpLpwGDdl4OSngrp+JCrO6
X-Gm-Gg: AYBFou3QRQ1phfVB7pcRkkWSDtBsmhYUOVu8JLNMWsbwxpJfYpEDIdIHuvxpDQnyfmQ
	tI8ECddLuVQQ+RB1NQqVaOpnqKBHNonictZbwnOrgawZ3sXJPFmUlvaSzjARGIpNS6c+lTOKyQr
	sbmd7OkMKnbwydVpqVGJQvOY0NTnVC8tI83Y8VEi6KXlmgUM3MSmzIMRf6voxHPZyXsw8RaP4iK
	obsgPMwrAxBLrFlAnkMgaM+iQ428Xe4QZwI4A4vhklJV5ZefrqkVEEV/WpsnOO9aG8S62Wzf4Lu
	YlGP5KkvUwIxNWyBci+LqqhECted/8PdbNhIq9rhKzgB5Mfo59qNOX/ARP9trRpRUNoK1bkxNwp
	FGwDCZj7+gSHzVrTNIGSSFYEO
X-Received: by 2002:a17:90b:4b92:b0:3a0:7d97:37c1 with SMTP id 98e67ed59e1d1-3ab3ac9fb13mr1430721a91.59.1791542202403;
        Fri, 09 Oct 2026 03:36:42 -0700 (PDT)
X-Received: by 2002:a17:90b:4b92:b0:3a0:7d97:37c1 with SMTP id 98e67ed59e1d1-3ab3ac9fb13mr1430676a91.59.1791542201800;
        Fri, 09 Oct 2026 03:36:41 -0700 (PDT)
Received: from [10.213.101.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab371c32cesm2827285a91.16.2026.10.09.03.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 03:36:41 -0700 (PDT)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 16:05:55 +0530
Subject: [PATCH v4 3/5] arm64: dts: qcom: glymur: Add UFS nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-glymur_ufs_qcb_enablement-v4-3-9a6ce83195b7@oss.qualcomm.com>
References: <20261009-glymur_ufs_qcb_enablement-v4-0-9a6ce83195b7@oss.qualcomm.com>
In-Reply-To: <20261009-glymur_ufs_qcb_enablement-v4-0-9a6ce83195b7@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791542167; l=4407;
 i=pradeep.pragallapati@oss.qualcomm.com; s=20260911;
 h=from:subject:message-id; bh=9kyv/RmQosGyDp9VxTpU4lmroLa4HPs6mFTgIA1kMzM=;
 b=u8dC3+RZUfBlIhqIsXRGuNAz7pgI5v44WV2HH5GzVJ5YjkFfdWgwDNU33Cbk9BIdlR6mGtsYv
 oDUTtfQjz9nCsksKMopNgrudXZN7XogNF07Wzuk6bA1305CVVo/JEtF
X-Developer-Key: i=pradeep.pragallapati@oss.qualcomm.com; a=ed25519;
 pk=uyRUsge8nQMwf3iW/e/o0U8z9nWLCMm1MGKxEftztic=
X-Authority-Analysis: v=2.4 cv=E+1YNqdl c=1 sm=1 tr=0 ts=6ac8c3bb cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=7sHo3vQ6stv6frjssEUA:9 a=JqOrBNmfTE-P4NNt:21
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 7Ee_9PPKLel1Rxk2f0SWMVemKGd8GX1A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0MiBTYWx0ZWRfX8+Wr9jhQDF/Z
 +2NPDZ7ZgSr27aTUvgIa3jTjfiGtie9caZ0GmCogrz72cmwG7DGHxsMOjOIwjLhpgHcGj7mI/PX
 Z9dlBl7b0DNdxnRIC0ZRAxrOHn46DRu5B6HCVMUHIKsRyFC816pQW8+VO/dIww7s0PSDKzNGmhd
 xXDAN+M57HR0ZX1echr5lpWmHclgbESlFzNk2k974qk7zo3e0PTJaCdeHJrl+TcRbKArYpoUfkQ
 WXDG/AUORhGxHt84qxcwd4TQ7nIqxLyQc/4xLjUjsnLwUh7uyZ9Np+ceVt2wlKnJT2fSCP88jRE
 xGfu4sW7ABrz41Qc1+rSuQSnNChsHnVUvFKhG7vKo+gCXAAI2Z2cpybf++DFHwq+RxK4I4hJ2DO
 3/tQn2h0MbF1dcI+qqE9Njuujody24RXtwqnbWpEAbVK2gKr/WvSyzatfJacHyPxm1Mn2tIhX5B
 itiP3qFXhlxmijQ+S+Q==
X-Proofpoint-ORIG-GUID: 7Ee_9PPKLel1Rxk2f0SWMVemKGd8GX1A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0MiBTYWx0ZWRfXzW0v9H2ASuMw
 FWlomtF6w9BiUD/PRuinQqFKpoi09yLPZoUrWZJPJDMCSII3TmF+GgVOiR33dGvcEw9awXlE1zS
 vKo1gCpeQz0Jatp/GQrfYFGAVgBNkFc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090042

Add UFS PHY and UFS host controller nodes for Glymur SoC.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 125 ++++++++++++++++++++++++++++++++++-
 1 file changed, 122 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 65a398c0a992..49ef89b41aad 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -811,9 +811,9 @@ gcc: clock-controller@100000 {
 				 <0>,				/* QUSB4 1 PHY RX 1 */
 				 <0>,				/* QUSB4 2 PHY RX 0 */
 				 <0>,				/* QUSB4 2 PHY RX 1 */
-				 <0>,				/* UFS PHY RX Symbol 0 */
-				 <0>,				/* UFS PHY RX Symbol 1 */
-				 <0>,				/* UFS PHY TX Symbol 0 */
+				 <&ufs_mem_phy 0>,
+				 <&ufs_mem_phy 1>,
+				 <&ufs_mem_phy 2>,
 				 <&usb_0_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
 				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
 				 <&usb_2_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
@@ -4102,6 +4102,125 @@ rng: rng@10c3000 {
 			reg = <0x0 0x010c3000 0x0 0x1000>;
 		};
 
+		ufs_mem_phy: phy@1d80000 {
+			compatible = "qcom,glymur-qmp-ufs-phy";
+			reg = <0x0 0x01d80000 0x0 0x2000>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
+				 /* UFS and PCIE4 share the same clkref */
+				 <&tcsr TCSR_PCIE_4_CLKREF_EN>;
+
+			clock-names = "ref",
+				      "ref_aux",
+				      "qref";
+
+			resets = <&ufs_mem_hc 0>;
+			reset-names = "ufsphy";
+
+			#clock-cells = <1>;
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		ufs_mem_hc: ufshc@1d84000 {
+			compatible = "qcom,glymur-ufshc",
+				     "qcom,ufshc",
+				     "jedec,ufs-2.0";
+			reg = <0x0 0x01d84000 0x0 0x3000>,
+			      <0x0 0x01da0000 0x0 0x15000>;
+			reg-names = "std",
+				    "mcq";
+
+			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
+				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
+				 <&gcc GCC_UFS_PHY_AHB_CLK>,
+				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
+				 <&rpmhcc RPMH_LN_BB_CLK3>,
+				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
+				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
+				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
+			clock-names = "core_clk",
+				      "bus_aggr_clk",
+				      "iface_clk",
+				      "core_clk_unipro",
+				      "ref_clk",
+				      "tx_lane0_sync_clk",
+				      "rx_lane0_sync_clk",
+				      "rx_lane1_sync_clk";
+
+			operating-points-v2 = <&ufs_opp_table>;
+
+			resets = <&gcc GCC_UFS_PHY_BCR>;
+			reset-names = "rst";
+
+			interconnects = <&aggre2_noc MASTER_UFS_MEM QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_UFS_MEM_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "ufs-ddr",
+					     "cpu-ufs";
+
+			power-domains = <&gcc GCC_UFS_PHY_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
+
+			iommus = <&apps_smmu 0x460 0>;
+			dma-coherent;
+
+			msi-parent = <&gic_its 0x460>;
+			lanes-per-direction = <2>;
+
+			phys = <&ufs_mem_phy>;
+			phy-names = "ufsphy";
+
+			#reset-cells = <1>;
+
+			status = "disabled";
+
+			ufs_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <100000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-201500000 {
+					opp-hz = /bits/ 64 <201500000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <201500000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-403000000 {
+					opp-hz = /bits/ 64 <403000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <403000000>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>,
+						 /bits/ 64 <0>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
+		};
+
 		cryptobam: dma-controller@1dc4000 {
 			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
 			reg = <0x0 0x01dc4000 0x0 0x28000>;

-- 
2.34.1

