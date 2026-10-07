Received: from mta1.migadu.com (out-43.mta1.migadu.com [95.215.58.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EBF3DAADB
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 18:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791397398; cv=none; b=SZmgELihO9AmexKm1tje7Zz+1Z4snLLD+1Lk4xks+esZg+5DGAjhH2Jrn3ZYnm67uGpvzoW4wVMV9qoagVGYqthXO87G3eRYgP6SNftlRr+G784gXUKFeRCa8jNbeReYPhCIzPzjLx9/CkJI3AfeSo9yH/YhkD/a9g+JIdbBGIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791397398; c=relaxed/simple;
	bh=ZuqJGPivzyQPldomjJ54Uvxs57DlDb6F5vmgQqVbJA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IiRpx1w2M24gc6sqOGWBntPwlSiuVBP+frkYow+Zaa2kC5VKVMlEMNKgcnt5rPOoJdMzc+kWV/NZiBe4e42HVQJeEJBSGNfdw05A8ZZdj9YrNYZzuRDWtZCcwsoPsNiLQc9YInI83FRpwamP1xoZlULcN/5Mvn/Ya5Rz74v3V5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=KO4AdRpV; arc=none smtp.client-ip=95.215.58.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="KO4AdRpV"
X-Envelope-To: linux-arm-msm@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=ZuqJGPivzyQPldomjJ54Uvxs57DlDb6F5vmgQqVbJA0=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791397390; v=1; x=1792002190;
 b=KO4AdRpVJmEH7hxW/z6DosShInx317lJycHA0GLTjMgvKCgIY8M8d/ziTkl9CJRG7KWtSrhQ
 6z9UMLIpoKTxNDpEg3L8z3DsybEvs1IM2+PX2YL+X0krJ0YVv/gsjVGn9nCWABszqMplFOE8zy0
 w2ADdZXpKMNVXF08SB1M39qdbvuMyFcN7joXdiYQCgujAbzt5Jv41aKSv9IBZl4YJg73GOgFxf6
 L6KOD5NGLsKeR1EER+P17zhyvyBulRvtk20aNuQfEKDU9rD6dqtlxreCnm2LaoF5PRwoQC0CfyL
 8ckfYyf1ja0Unt+q0cITuDbGeXhl/StLIEFHuC6qb9h+A==
X-Envelope-To: linux-arm-msm@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id f07baa23c6938e94;
	Wed, 07 Oct 2026 18:23:09 +0000
X-Mizu-Trace-ID: f07baa23c6938e94
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Val Packett <val@packett.cool>,
	"Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com>,
	"Manivannan Sadhasivam" <mani@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: hamoa: add operating points for pcie4/5/6a
Date: Wed,  7 Oct 2026 15:22:48 -0300
Message-ID: <20261007182251.24119-1-val@packett.cool>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Similarly to pcie3, add operating-points-v2 tables for the controllers
used for Wi-Fi cards, cellular modems and SSDs on X1E laptops.

Signed-off-by: Val Packett <val@packett.cool>
---

I've had this in my tree for a few months, now that PCIe BW scaling work
is picking up[1] this seems more relevant than ever..

Hopefully I've trimmed down the table correctly for each controller :)
Tested with NVMe scaling patches[2] flipping the link between 2.5 and 16
GT/s quite frequently.

[1]: https://lore.kernel.org/all/20260819-bwscale-v5-1-6dea79786b37@oss.qualcomm.com/
[2]: https://lore.kernel.org/all/cover.1790222172.git.liaoxuan@hygon.cn/

Thanks,
~val

---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 213 +++++++++++++++++++++++++++-
 1 file changed, 210 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 48f47aa6ba3c..0ed2953a2121 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -3516,13 +3516,114 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 				      "link_down";
 
 			power-domains = <&gcc GCC_PCIE_6A_GDSC>;
-			required-opps = <&rpmhpd_opp_nom>;
 
 			eq-presets-8gts = /bits/ 16 <0x5555 0x5555 0x5555 0x5555>;
 			eq-presets-16gts = /bits/ 8 <0x55 0x55 0x55 0x55>;
 
+			operating-points-v2 = <&pcie6a_opp_table>;
+
 			status = "disabled";
 
+			pcie6a_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				/* 2.5GT/s x1 */
+				opp-2500000-1 {
+					opp-hz = /bits/ 64 <2500000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <250000 1>;
+					opp-level = <1>;
+				};
+
+				/* 2.5 GT/s x2 */
+				opp-5000000-1 {
+					opp-hz = /bits/ 64 <5000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <500000 1>;
+					opp-level = <1>;
+				};
+
+				/* 2.5 GT/s x4 */
+				opp-10000000-1 {
+					opp-hz = /bits/ 64 <10000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <1000000 1>;
+					opp-level = <1>;
+				};
+
+				/* 5 GT/s x1 */
+				opp-5000000-2 {
+					opp-hz = /bits/ 64 <5000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <500000 1>;
+					opp-level = <2>;
+				};
+
+				/* 5 GT/s x2 */
+				opp-10000000-2 {
+					opp-hz = /bits/ 64 <10000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <1000000 1>;
+					opp-level = <2>;
+				};
+
+				/* 5 GT/s x4 */
+				opp-20000000-2 {
+					opp-hz = /bits/ 64 <20000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <2000000 1>;
+					opp-level = <2>;
+				};
+
+				/* 8 GT/s x1 */
+				opp-8000000-3 {
+					opp-hz = /bits/ 64 <8000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+					opp-peak-kBps = <984500 1>;
+					opp-level = <3>;
+				};
+
+				/* 8 GT/s x2 */
+				opp-16000000-3 {
+					opp-hz = /bits/ 64 <16000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+					opp-peak-kBps = <1969000 1>;
+					opp-level = <3>;
+				};
+
+				/* 8 GT/s x4 */
+				opp-32000000-3 {
+					opp-hz = /bits/ 64 <32000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+					opp-peak-kBps = <3938000 1>;
+					opp-level = <3>;
+				};
+
+				/* 16 GT/s x1 */
+				opp-16000000-4 {
+					opp-hz = /bits/ 64 <16000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+					opp-peak-kBps = <1969000 1>;
+					opp-level = <4>;
+				};
+
+				/* 16 GT/s x2 */
+				opp-32000000-4 {
+					opp-hz = /bits/ 64 <32000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+					opp-peak-kBps = <3938000 1>;
+					opp-level = <4>;
+				};
+
+				/* 16 GT/s x4 */
+				opp-64000000-4 {
+					opp-hz = /bits/ 64 <64000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+					opp-peak-kBps = <7876000 1>;
+					opp-level = <4>;
+				};
+			};
+
 			pcie6a_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
@@ -3657,12 +3758,65 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 				      "link_down";
 
 			power-domains = <&gcc GCC_PCIE_5_GDSC>;
-			required-opps = <&rpmhpd_opp_nom>;
 
 			eq-presets-8gts = /bits/ 16 <0x5555 0x5555>;
 
+			operating-points-v2 = <&pcie5_opp_table>;
+
 			status = "disabled";
 
+			pcie5_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				/* 2.5GT/s x1 */
+				opp-2500000-1 {
+					opp-hz = /bits/ 64 <2500000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <250000 1>;
+					opp-level = <1>;
+				};
+
+				/* 2.5 GT/s x2 */
+				opp-5000000-1 {
+					opp-hz = /bits/ 64 <5000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <500000 1>;
+					opp-level = <1>;
+				};
+
+				/* 5 GT/s x1 */
+				opp-5000000-2 {
+					opp-hz = /bits/ 64 <5000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <500000 1>;
+					opp-level = <2>;
+				};
+
+				/* 5 GT/s x2 */
+				opp-10000000-2 {
+					opp-hz = /bits/ 64 <10000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <1000000 1>;
+					opp-level = <2>;
+				};
+
+				/* 8 GT/s x1 */
+				opp-8000000-3 {
+					opp-hz = /bits/ 64 <8000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+					opp-peak-kBps = <984500 1>;
+					opp-level = <3>;
+				};
+
+				/* 8 GT/s x2 */
+				opp-16000000-3 {
+					opp-hz = /bits/ 64 <16000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+					opp-peak-kBps = <1969000 1>;
+					opp-level = <3>;
+				};
+			};
+
 			pcie5_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
@@ -3796,12 +3950,65 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 				      "link_down";
 
 			power-domains = <&gcc GCC_PCIE_4_GDSC>;
-			required-opps = <&rpmhpd_opp_nom>;
 
 			eq-presets-8gts = /bits/ 16 <0x5555 0x5555>;
 
+			operating-points-v2 = <&pcie4_opp_table>;
+
 			status = "disabled";
 
+			pcie4_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				/* 2.5GT/s x1 */
+				opp-2500000-1 {
+					opp-hz = /bits/ 64 <2500000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <250000 1>;
+					opp-level = <1>;
+				};
+
+				/* 2.5 GT/s x2 */
+				opp-5000000-1 {
+					opp-hz = /bits/ 64 <5000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <500000 1>;
+					opp-level = <1>;
+				};
+
+				/* 5 GT/s x1 */
+				opp-5000000-2 {
+					opp-hz = /bits/ 64 <5000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <500000 1>;
+					opp-level = <2>;
+				};
+
+				/* 5 GT/s x2 */
+				opp-10000000-2 {
+					opp-hz = /bits/ 64 <10000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <1000000 1>;
+					opp-level = <2>;
+				};
+
+				/* 8 GT/s x1 */
+				opp-8000000-3 {
+					opp-hz = /bits/ 64 <8000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+					opp-peak-kBps = <984500 1>;
+					opp-level = <3>;
+				};
+
+				/* 8 GT/s x2 */
+				opp-16000000-3 {
+					opp-hz = /bits/ 64 <16000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+					opp-peak-kBps = <1969000 1>;
+					opp-level = <3>;
+				};
+			};
+
 			pcie4_port0: pcie@0 {
 				compatible = "pciclass,0604";
 				device_type = "pci";
-- 
2.55.0

