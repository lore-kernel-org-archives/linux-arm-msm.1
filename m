Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02613438A0
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 16:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789145269; cv=none; b=Vmj5LKbTOzkd3QykGW/m/ezyXmYTgHwUM9KJIdNVQV2zukmH1GR2xKknVmd0xUWDe3rq9XrOS+2LH3+JCIXZhvfmIdZFKpt750AiRwTv99Weh63S7bhjRsV22QHxyTOuWUwBkdcOmMCumhOksR0UWhJo1+uO+qx9Ou+2fSjiMJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789145269; c=relaxed/simple;
	bh=TsGyf/0y783xq7+CT1WADVEQsdtp8DeCVCTbK/xDt4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nvqcTf/zdyjndOxcQONfpsZQzVb4MZJIUr9aeYCPA0OSf79oTNwdJVtWNlStRNgmWP7W7a6xCzfnHvCp+F/GHPj6X6ebLHM8O0nrGSBYz1SFZvY7ecQx1uB0seMIMMJpwm8r1+6NfL0CqN1sKlOeWfYx5WNI01U86e0L+P2V8cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GkEmWbCI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GNBzZA2G; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GkEmWbCI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GNBzZA2G"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BEmFeW3780661
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 16:47:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u9CNAekAJivwXy7eYNCwSDqk/ML6zKzGhgflPEnIL3Q=; b=GkEmWbCIEyDS1e8j
	0YQt8hqxwrIfm5ryLxb40fjeXzP9DXEGNEZcnLcBoJq2Swc427AT98Iy3If5qLxi
	WHTiSZpzH+rCRPrjzo0ntsgvlYX5PVWgIps/gFVMvFZJhPVdEoUWAX+Hegj3c0it
	TtB6W0EkBbqKKaFswL/ggOpw0l990cK5u8lmJ/7gtGGjg+rL0HfmZAI+znQSNRfA
	k0sHCJPZ/KbzkanHNmkQoYFfP9jby0rgc7tcSadCj90Uz6b4XR0tJHNRbriC17d6
	v406MPK1YfT5pnmo0e5uV70quew9ubnOxcYcOozR7WNjSpH6GiHyvlRTudEIVZDG
	7X1elg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmcgfjh4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 16:47:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-396901263b6so2218625a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 09:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789145264; x=1789750064; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u9CNAekAJivwXy7eYNCwSDqk/ML6zKzGhgflPEnIL3Q=;
        b=GNBzZA2G398aPfxsgYxwbw4kZUVRl8TunrYz4QpPeXAxKbuM0gOXHw9aWbGpIoeGHH
         g3JW/d+A5jMz2A0hBPgV4Xp4Ahbh2kz9o+5NOkE5ceQrD+AlKQxmPKkIdz1Q9JJnLBCD
         UdyMhMhY9OD1Po8z9ChPLKWTWYSNfsYsB9ysEL+spq3NeAuPegWOFDIFxx4osqJpP5So
         gUVfbfefqdKQRRIgO3lcgC6tIl9ypyqyO7R9c28MZHjiqFxq6zZHpcTItuozeLyHZ1qj
         qegryVUdai95KeNWIgYJANgjhtChAU0OzlLttze3qW1XWPbh7jMzYgqWahVh0ErdkoRk
         QLYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789145264; x=1789750064;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u9CNAekAJivwXy7eYNCwSDqk/ML6zKzGhgflPEnIL3Q=;
        b=kJa8/Kb7tfyZv1t3K3bSenEEp/PIYX7R+IvrDeBamRZNrNTcprsDmagysxyOtrJcg4
         yIBGOGuMX9Zu82SOQPcXShtXSVtCu3qyMVx/ggbPIjN2nPdt2oezdMAsWJPv9Hed4J8z
         69ZHoGdxv/yJCC9LIKkScRNZ4Ea6HPxyda3xlZZprzVXdfxC8msEG2oEt24MbNEYN493
         /4tOvgv6XV3p2JcnrgqvoCe/jvwW3+Esnti3kqKeEi+M7nLv2fcQCg5uXY20LZlNpDLV
         rtgLvNQKcdD9OeMPBp+rYpdlGMuqVr/kJa4U1bbp0sr2r+vYs8RchFuE+baNBvP+Jpfg
         P8dQ==
X-Gm-Message-State: AFuF++kx9972s9lxvujGiOO0LibreBkQ7zpVH0o24KXGdjpnSdPzCjh4
	niqc/pTYr4Vr4RHKjqVzYcnRbTLN6iIrSqPov4kBZu9z2ZsC8Zk940hxf7foyvzHVcF011JkdS+
	G6VhZWWqRmdxHASl+bcmAVnvnPt2u29MoygW8TYzNq54997hWzyY2he32gt9ezYOfRxYK
X-Gm-Gg: AYBFou1upT4gpqrja4zKGCAHocufKXJsHQE3IDMmHIP7FP/RN3TxYM9tvS125QVJgIw
	ennkPpL1TBhd2+PIiN2JxQK02BHO5HrmS0Wv1M9ByPESRPksIK09R2vOYOfHrcg2HeZI0H9lVFU
	20zjGeydD3Z/R+N4cxg0OeQcG5WUAuqN1cftuPX8bGqx4qCvC47AFmPCd9m6cz/MQ4iHBjsKrVO
	F/VOJu0uGZT00k1an8xKf7bsHzlW5zflY57gkO5+FPIFfGT8r1X5JWdsMrdLcvkUNom+aldvTvG
	UG0QTrBtNcS9ZV3GrCfV+lZRjW8MylhQPZ9BfmRXz578H42Ar8KGvfDhbTXyulJr+A1NvLPevx4
	bFqcKNZ2RwG/tladkrVTvr/jEjg==
X-Received: by 2002:a17:90b:1347:b0:38e:4cb:51f with SMTP id 98e67ed59e1d1-39d9bdaa4fdmr9801086a91.11.1789145264022;
        Fri, 11 Sep 2026 09:47:44 -0700 (PDT)
X-Received: by 2002:a17:90b:1347:b0:38e:4cb:51f with SMTP id 98e67ed59e1d1-39d9bdaa4fdmr9801015a91.11.1789145263440;
        Fri, 11 Sep 2026 09:47:43 -0700 (PDT)
Received: from [10.213.101.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39da64d4bdfsm944193a91.0.2026.09.11.09.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 09:47:43 -0700 (PDT)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 22:17:07 +0530
Subject: [PATCH 3/5] arm64: dts: qcom: glymur: Add UFS nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-glymur_ufs_qcb_enablement-v1-3-b9fc5e2ee99a@oss.qualcomm.com>
References: <20260911-glymur_ufs_qcb_enablement-v1-0-b9fc5e2ee99a@oss.qualcomm.com>
In-Reply-To: <20260911-glymur_ufs_qcb_enablement-v1-0-b9fc5e2ee99a@oss.qualcomm.com>
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
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789145236; l=4155;
 i=pradeep.pragallapati@oss.qualcomm.com; s=20260911;
 h=from:subject:message-id; bh=TsGyf/0y783xq7+CT1WADVEQsdtp8DeCVCTbK/xDt4U=;
 b=rXhR3qv7ys0Vr+ijLalC1MUZkf9fRkI+ELOA4vu1UeWL+rlK7/RItQyDZGlOgx10iE7rLoyY/
 Lq9xAS5Yw6YDb5svmBlXfV6LmKCiFcvvgrtmzNvfJMRKYSPiT1TA92b
X-Developer-Key: i=pradeep.pragallapati@oss.qualcomm.com; a=ed25519;
 pk=uyRUsge8nQMwf3iW/e/o0U8z9nWLCMm1MGKxEftztic=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIzNCBTYWx0ZWRfX0cahlgPLb7jp
 E/HsxFm59FKsfpVQsquMnj9IEyRBh9aR6KoNjOiAhaQi0yJJ3mliny1zgEwRCjB3ARqEbR/Saqb
 vQM77vcA6mrYkINlAAMsiI6WVP2Bhw8bjEEjG4dP766+pL3hvN+T+fLHDvyUtQxiO5hSKAQ6IOS
 MDwyZSexsFfEpdGSdzXEIn5l+Y/iR/neCO3jcQjC/pgdZXNy3xerxfE26m6LoFKu3btWgnj9XRR
 M3mAAUEgegq2iGEeT4j3Y+ylWQBVhNvuzJTvfnB5oyoG04knmmYUCdhe2VJl3VT+Oesypc9Xkfb
 nBftDf/4380T0/a24cQKdkfwCALKKWaEejjiB9Wp5ExW3pn7gGcsh53dSVPvf14LKsmjGFOM5hF
 oKCzTfr1tRMakx7oT3K7/Px8k3gUuYbQLpGFk7Wpk50/xy+3H4pUmzvUuhNMDu7qP9V3kYYow7H
 ln2imsj0VuWc/m/IjKA==
X-Proofpoint-GUID: 5RfJK0ec0KmIl6SZ_1qwkudPjo6kAIJL
X-Proofpoint-ORIG-GUID: 5RfJK0ec0KmIl6SZ_1qwkudPjo6kAIJL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIzNCBTYWx0ZWRfX+OSMhJbvWkj0
 dvYJyHohTiY/LOGpWw8ojlZtyhCBjN/98KzjXsflwiNg1USAe88ohzLbYZwOucVFJYgO3j7nU9n
 oQhZQxEcJpd92gEFERcWNQk2/P+yOFk=
X-Authority-Analysis: v=2.4 cv=ULtIjyfy c=1 sm=1 tr=0 ts=6aa430b1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=BFjdVMYQdvGAjPbYN-kA:9 a=5G4pU0lRd-HiNKXt:21
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110234

Add UFS PHY and UFS host controller nodes for Glymur SoC.

Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 114 ++++++++++++++++++++++++++++++++++-
 1 file changed, 111 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 624a9edd602c..7bbc804ed340 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -812,9 +812,9 @@ gcc: clock-controller@100000 {
 				 <0>,				/* QUSB4 1 PHY RX 1 */
 				 <0>,				/* QUSB4 2 PHY RX 0 */
 				 <0>,				/* QUSB4 2 PHY RX 1 */
-				 <0>,				/* UFS PHY RX Symbol 0 */
-				 <0>,				/* UFS PHY RX Symbol 1 */
-				 <0>,				/* UFS PHY TX Symbol 0 */
+				 <&ufs_mem_phy 0>,		/* UFS PHY RX Symbol 0 */
+				 <&ufs_mem_phy 1>,		/* UFS PHY RX Symbol 1 */
+				 <&ufs_mem_phy 2>,		/* UFS PHY TX Symbol 0 */
 				 <&usb_0_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
 				 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
 				 <&usb_2_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
@@ -4103,6 +4103,114 @@ rng: rng@10c3000 {
 			reg = <0x0 0x010c3000 0x0 0x1000>;
 		};
 
+		ufs_mem_phy: phy@1d80000 {
+			compatible = "qcom,glymur-qmp-ufs-phy";
+			reg = <0x0 0x01d80000 0x0 0x2000>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
+				 /* UFS and PCIE4 shares the same clkref on glymur */
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
+
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

