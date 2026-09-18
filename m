Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13734B44BA
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789728012; cv=none; b=DMAZHIz66p5Zwdimfy0KX8PjWrH7LhdWGXRCtB7PDUB/2iRSAx1kCox2NYl/NM/t/hDEy+E7CYlQ52N8MP45N/UJp43bHNN1+Q6Hu/V4bANcu1rJdXSx58G/+CwJOnQ2LfoTyIlZ7Grz44iOe6Naw7eCDkToGJU5R7Zu6mCFSQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789728012; c=relaxed/simple;
	bh=X17ccHw+VbWj+Okmiex6XkU3F9Uxf+xlyknIrjgj49I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fuDTXHuqkoyet/+I1W9X0xUhUIgJTeIunewLLec8xBHV07lxbWcGyOOmm+wo5G8K89RJvs7oYMX9efvldO4sBZ2s7/ysx88PR5vkESA8Ewj97K5/mJcbKrLwBmIbHcGGphwFJqHnqx74Mguch6YADmGCKXQ7hhcVHyKj/Ld7efU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cAMqhrx1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WB80vLwi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cAMqhrx1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WB80vLwi"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9diAa3802063
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	91y9vS6cgne0toKjGomx+H9dmRQBOGswYip+3K3Ykrs=; b=cAMqhrx1jOolxKVX
	07KZYV/p+7qUx9y0NAUrpMAL3xcsATX9AOv0qAWm4k8XnPcZT5WuhSkMc2qruWg6
	s6Gg/5nZm5XyThU8NB9Z+SSh3QgMMz4HaH7XnrOqWWYum/oELPe4MVb9Wm+Pz3af
	LK7lif5FHAUTGdxg5ooRZVtGaRaSoLlSQ6TKJeFSoC+47mA/M8R2Tr9nG3dkQXLH
	soB4T5OaFRC4JuuwTMmiM60ap7D2qrou9UDmrKLWeL2rzaEqo2te21iSughBcrDd
	IAwICjuBu5losUlS5O2Ie8kwQXLrr7y3ZaxHzvjQ3/WJBMW4c1FwS4i+cNOCtqMl
	nQ3vMw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grq2ku4tf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:40:02 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c89704da8c7so786948a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 03:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789728001; x=1790332801; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=91y9vS6cgne0toKjGomx+H9dmRQBOGswYip+3K3Ykrs=;
        b=WB80vLwiQzC74lIqCJxJhGUG88SAKk1+hyzLUkZyO3igL1ITa8NcMXb3ZWO2H4Ke3d
         ZuXYF4p/Tav7VaNpB5Nk2FknFJDRZ5RNit95tBn++GR87z5oTOjHp11tnf5whnvwkgD7
         7tQZKP75P1ttLFa1OVbRZ9M7ikQfLM6YYH/BCiH+xFZW4x/jwTvc7enuKrWnr//jinOl
         n9/fMMupVgXUbEdM+EKtyDgpfeXXUaJnOGfT/waZPAyTgvtogJiwcjgtOFFaEYSvv7Zf
         Mc6ro1AKm4///M+xnZ4j2iMnhDnMwBAGOy2vYNPulGNi6O6e56T/GAbbADQNx9oJxpIK
         92Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789728001; x=1790332801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=91y9vS6cgne0toKjGomx+H9dmRQBOGswYip+3K3Ykrs=;
        b=azyFj4Kjj4bReOvK9sY/Y+uhLihJzIzX0zpCrVj/2Z94QLrmSrdJroQ6gw2cJNHUAc
         /CFpTQPSurt+RjxGhqEKHcSAxZppfal4CoQ567yG1rOafzCpDPfHLdpGdFppR9B1N6c8
         aXQN2GGFAI77VoWdrzUsqXkeTcbbCs5KqVnSN5/4GpxmSvnYhRnYWkk5G752JD00KU7B
         vkddJvCZGxv6XOGcQXnRxIhwsPw6P+s/eGQKJ87h4R8zi7E29k6fcya147aVbQpcNxk3
         gk+wWmUbNnEatD3g1KR9PaK9NqAPM6Ci8NR85a6ZZb8+9M/KWrKbaNR0u5B6Wh42StRR
         0OpA==
X-Gm-Message-State: AFuF++mhFpipcLcEIgf7mJ9AEVrAgnL6EEIFjLexxgfTxHypPCmv/dh5
	Bf8cRxES1VixNnuu9PfsdhYsjMZhLKS7/F83ZLlCJraZowWjEgXsP1rANNtW7atujS7lyUbwESC
	5InVtzT/e4PMotFN5qVmeXoWPlwQh5LnM5bj1NCan5JjLs2FXAasUHwq6tb/yy+1j9Umq
X-Gm-Gg: AYBFou3VtKgSeDYYCxy0WEC3rCl/Ql6tNNjcyvp2p0O4lwheOyycypuv5DrdM42vIt0
	AFOmqOOcbR2iidTII5fZIaOSefGuwsv/bMuKi2xeWu59tn+Iuewus6ANspMdoL+tA7MvvhBD7JP
	JwSaNPfVLCh9tsZ2cC1O4gOvhNjtty+iLzaSRyIPNqyGl+yt3ZpkGor7D+ONLM5rR+SoOXXNE31
	AzI95ZLrbSEJlKdiKv4bAW+gXELBPrstWMypxPabHIuGxIHIUuhJm77bi018cd4YGP6xXrsHTYC
	GdyOxIIxG/SUbZvXSkKxHEJnTGA07Fm6xjEDQG8DgmKOIFLZlBuOPvwL0do3b86p7GsfUY3E7jg
	0iLJoDZJsznMLASspsYs8rZnhyg==
X-Received: by 2002:a05:6a21:9090:b0:3c3:b57b:627d with SMTP id adf61e73a8af0-3dd8c33a760mr4745927637.12.1789728001277;
        Fri, 18 Sep 2026 03:40:01 -0700 (PDT)
X-Received: by 2002:a05:6a21:9090:b0:3c3:b57b:627d with SMTP id adf61e73a8af0-3dd8c33a760mr4745861637.12.1789728000859;
        Fri, 18 Sep 2026 03:40:00 -0700 (PDT)
Received: from [10.213.101.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c286d98e7sm4020702eec.9.2026.09.18.03.39.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 03:40:00 -0700 (PDT)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 16:09:09 +0530
Subject: [PATCH v2 3/5] arm64: dts: qcom: glymur: Add UFS nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-glymur_ufs_qcb_enablement-v2-3-16619f7e36a6@oss.qualcomm.com>
References: <20260918-glymur_ufs_qcb_enablement-v2-0-16619f7e36a6@oss.qualcomm.com>
In-Reply-To: <20260918-glymur_ufs_qcb_enablement-v2-0-16619f7e36a6@oss.qualcomm.com>
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
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789727970; l=4407;
 i=pradeep.pragallapati@oss.qualcomm.com; s=20260911;
 h=from:subject:message-id; bh=X17ccHw+VbWj+Okmiex6XkU3F9Uxf+xlyknIrjgj49I=;
 b=eywfFGAb6dF7PysyGpiAKhEapuU/T6TygMc11WtLD7/nM4ti9htvj/EaHbnO1upJZ0lCjwTD1
 +YN1LA1d/x/BnHWAACNGlV2vDZTKWCatDkCYRpZxsTajzPGAHQ9XTfW
X-Developer-Key: i=pradeep.pragallapati@oss.qualcomm.com; a=ed25519;
 pk=uyRUsge8nQMwf3iW/e/o0U8z9nWLCMm1MGKxEftztic=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0OSBTYWx0ZWRfX4kW1NFWcB4Le
 +0WHb/fDGcjHDtI6dii3+aeRWgcaPuL9YyhO1v4y4rEpinhJ3roWCKYYmMo6+bq/h61HHwjR4q9
 +Snut7gxzSELSsNlO70KpqtWRr8e4IaEmRh/diulWSaap80njVVZjVydjNgIym89MDswvvozVGB
 SIs4aNZDhciTQ/iLN+4OSh5pLiLGsKq2GeYVYSFiPVNXnHwPP27TpbQHH2//b6ZQiA7kcxC6ITP
 uVd9soAHkwHtc/uwgIVwwZN3bRBwLJI4Fu2OpAtVsER4keM5q0rxmlW14ripjDKNhZFlqRKEWQg
 D+j8nBf8VQWIuOBx29UhSc7T82NRoHuNJB+GrOExhot4S4A+pCx88chyPkF+twjC+37rGIgiNLO
 dE8CmqyO3SNctIvos816guzJKRhjtO95KToecMS8s0+3mzI+E7hauhByBIMaKLV/pP+x8A/4NZ9
 fX5mWsYa4Z+F32myJww==
X-Proofpoint-GUID: 4HAO5Bn9rHP5OzDEYSgmD_wlsx-yV1Y4
X-Authority-Analysis: v=2.4 cv=bcD+w+PB c=1 sm=1 tr=0 ts=6aad1502 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=7sHo3vQ6stv6frjssEUA:9 a=JqOrBNmfTE-P4NNt:21
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0OSBTYWx0ZWRfX7P1+RyHoGyaY
 j65t4+ARHK7LkJxMF4Kh0UYyX8+yyZQHaIanBCyjawvoRyjkgBHiG0HgYeDKjco2jl4KVTxkAB/
 r0XH+eoGbW1RTnf//ShuTwylpLW0l8o=
X-Proofpoint-ORIG-GUID: 4HAO5Bn9rHP5OzDEYSgmD_wlsx-yV1Y4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180149

Add UFS PHY and UFS host controller nodes for Glymur SoC.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 125 ++++++++++++++++++++++++++++++++++-
 1 file changed, 122 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 624a9edd602c..b1d91903b0dc 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -812,9 +812,9 @@ gcc: clock-controller@100000 {
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
@@ -4103,6 +4103,125 @@ rng: rng@10c3000 {
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

