Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4F34C225C
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789647976; cv=none; b=fJvn/5XDe4pLXjcZsQLd/1O3rTwEPsh4eGTiCPllFU9h3D9me9ETeeiK+Hv3FBmKZwMIG5K7scx78C3dLsadcyQdX79UBJZRppl5akqj86M30+oAn47m0KREORQ0FSPQJz7mmGshrbE5SzzUCoVc7yp2go4MtFEWhlwDO42f1t0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789647976; c=relaxed/simple;
	bh=RkBUL6/jMddtCCTowqenCks9K1tq4YvFsGserCe4sag=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NVISQolXGMhuL/6XzRhOJ6drDgmUf9CTNqQjE3oGGdpj1pU579n7w/wRoq1aXYeGbBstNxamHD4reMoXi2JYdFGpZ6Ix1K0G+0bvMe92OxWAQXv9gXvCpplrysQnfNZ1d5KW50Mgru3MFvU2HIeq9lVKDHg2SIQCwhO3ZVkVNBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nBVUPgXO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xw6aua43; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nBVUPgXO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xw6aua43"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68HC0IdU1853514
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:25:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7SANx4wNzNG98aGkj31a7bjIaWvNThQc/vMUPqa/fWc=; b=nBVUPgXOEdQnKRtd
	mvYfEWD/WE7PX9Da6bjUAnVtGtTCzz9/2hFs4X+zK0FLJAwFp1s6QKItGJLHBKuY
	U6JZauaWzz/CAR6WqIqTxvUtt0BSBY4jf8huA/+/rfDnSzWf5VOv+ldq/oWWYjtC
	5uSsQcJOEAUGTSsglk4vraJMEgoWBe34yufMrrA5ad6JsiI95msEBxudsYIo5DXL
	DlyZRKiwvbWrW0ntYPcZQxmzT4nQwIjyUiLFrpxIxM+VnolLN0AD0gumZpDoKZ4W
	mocQq29CFEfOES4I9hH9JE9IQOr6GGgd6ppCmebcHdzEwTuk2mC2J/uzv2XOX00Y
	ibi8fQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grfu403dw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 12:25:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e8fee6af3so1126137a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 05:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789647950; x=1790252750; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7SANx4wNzNG98aGkj31a7bjIaWvNThQc/vMUPqa/fWc=;
        b=Xw6aua43wZTYMwAX6HKC7L90Eja5qzrLeTpC/ys4LKtzLYxA6HnlcckATMtCe0c7Bx
         FMF/x+QLV8z0e189CCMpN9SHPFJCjc24bnk8FhtQR4XWUPijIa38JTQ0PYqxvGvoy+K+
         YkAi1fQVkw1qMThCCREC1cU83Xj4q5gJVnsdhPwHaYTu0eurbil11ohI+9c3y6F3Tcdx
         AElHgRc4x0SEYiXZfhcRlpYpO9U4X9BDwO7lhYc1brhaH2GLowKF9d6XOWLz3fjpP6f2
         hazprdWqubD8kiH8yshNDTjuFNCWbDJeb7ttrIq1A3dvk4k57+CjyoXZaLWS2+j7kbgk
         qP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789647950; x=1790252750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7SANx4wNzNG98aGkj31a7bjIaWvNThQc/vMUPqa/fWc=;
        b=e+41yWTub0tIXCL24CmHxxjUMPm7tdf6ezaUSjJLRVY7bepFK90iS9dqeO4maL1unB
         plQq9BeB6bCvcmA4zCuHt7BFypoT5gTzLlBh1DYK4nE5Q2WQrFaJaxrL8SmnX9IE3VjG
         eClMKkzqjU/oDJeORu+fa23PBmohNJ/uGcFWYTaAGDp44UojMHL31dXcRAkJ4BtQvYeD
         htQpEeQyRNORl106BQwsHB3y1s3yZgv3Xe78it5ckAWCyvxwuV2HWoijVBGm6Wvlef71
         6PLaomxStVRY0L23OOxjpKI6MbVMNIthZESvlNYsvfz42h/upBfc0ofOZ8U+YpehgE3n
         DojA==
X-Gm-Message-State: AFuF++mraW4sgls50k+klPylfP8/h9yylpsAUjVzlXFXkJe2/4ExHlns
	lUNRN54cW3mwzGqUDDFQdNh+p01HpZGx0yjm9DYRozgqxzg/dPf/5JhM8YgzQ8TuviU2qeAnigp
	DztKp9JeVO/I+DeCEM2rtkxz4oBLqyiXBZMeQxIRU0kb2PU5xjYaDM1xwoF7DEDEiknw3
X-Gm-Gg: AYBFou0ZkSbW3KqajS30NUvB8miuks1d0lQRNhQgLSPjvGTHbSNkQ/MiwZ6A5hUHl2+
	ksfOjgluweRkPKAU9RmoSnjHvuAkHJXNBLvnWXinj7+O6JZ7QW7PZitEyTOufuunKtjZyrQUM3a
	EzVqztdQ3tTpIH6BN4tJX8yMrh5qiby1nv5TtCw97ZgN5AUewIQI8QDek8loySVDxq/jMYB9yw4
	EpEHwrcNJtFgxjG5k1vicqabwB0tZVX6ge/VlG76tKeLaIYn+dbBT9/3/BkXfs4LXalN8yDAlD/
	bBelMNuRCW8HrBBU62Bco/rr5OklvukVVTttu15COks89zHXbnN5rAWXQFHYnE9gvfUednEOG7Q
	Gjibdnt2IsLVPvBMx1sOhFu4zmIrW4kAq3/Q=
X-Received: by 2002:a17:90b:578b:b0:39e:14db:4371 with SMTP id 98e67ed59e1d1-39e1e27a374mr14209750a91.1.1789647949695;
        Thu, 17 Sep 2026 05:25:49 -0700 (PDT)
X-Received: by 2002:a17:90b:578b:b0:39e:14db:4371 with SMTP id 98e67ed59e1d1-39e1e27a374mr14209696a91.1.1789647949211;
        Thu, 17 Sep 2026 05:25:49 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33bf5a6a175sm16380968eec.9.2026.09.17.05.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 05:25:48 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 17 Sep 2026 17:55:18 +0530
Subject: [PATCH v2 04/15] arm64: dts: qcom: sar2130p: Move PCIe phy and
 GPIOs to root port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-root_port_v2-v2-4-6272b7caae9a@oss.qualcomm.com>
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789647930; l=2610;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=RkBUL6/jMddtCCTowqenCks9K1tq4YvFsGserCe4sag=;
 b=YIRVOZ7erDCO41TihVXfvlrxWxWQsEZRgMtox8JK0pHgitPVoUkaCxQlg1usAgHl9fF5x4FbS
 AIZID9DrHk1CqllibBAzoleliZy1fdbmVbsFQxJCMT7m39SVyzJC4tQ
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: JL1Bl9dch9dQX-2bqHaAsSFqERvJGhYy
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfX5Vtymab2UE8e
 6a0UweMhqBn2AYwgYYvfArfnLQxoSUAInHomvcAit9P31BQ/tMx0RgEyosAwcj83GOdWb1E2s+R
 6o69iJlMpFEfNkDnhfW4940zSYpesWY=
X-Proofpoint-ORIG-GUID: JL1Bl9dch9dQX-2bqHaAsSFqERvJGhYy
X-Authority-Analysis: v=2.4 cv=LbipeTfi c=1 sm=1 tr=0 ts=6aabdc4f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=bvY3E1ByFFb03tV5gjAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDE3NCBTYWx0ZWRfXy58zY70d5SN8
 XqSJbFYVNdoXeFC3luDncCjaaUcrB2P99ZUS+ofNz03b9cIIMv4Tk5dgIXmZgrbeLbwqfZYovgI
 rbfP0UE5vph0jmmCc5bb8Kb/p5ndmTnFcvxHdO9zRC2DSET+eIm6TeP8tRybYwAFNjwrcArQGro
 E5NC1zc6b8dycjXaKA+rsPDGHsx/vcOnyM0qkTOQnZ8OymLoZohJXXI+xPaQhv8R7y3N9rRCly3
 S+a29qr/jzvyH34f6wJERU/LDPIZCmknh4fUpmrvm/Nyl1470fmPTPykTmEQyxyYyBmmOR26I/A
 RmFIe7fKu5SFVUDoCLDQtxkZ7DQrgCAUWYa5UVWEWBZK+2BY6sur7JgpoV0oYhUObxXrzJY92Dx
 joa35Nm87CVaQXM48IOcaT9EKE3Sw+u+hzfxqrulvcdKNKgh09PgQbQgPHsuPMVqVXT61NnTT4T
 pFuWhFpB/+D/aNge/Wg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609170174

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys and phy-names from the controller to
the existing pcieport0 and newly labeled pcie1_port0, allowing
board-level overrides. Move perst-gpios/wake-gpios from the &pcie0
controller override to &pcieport0 in the board file, renaming
perst-gpios to reset-gpios to match the binding used in the root
port context.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts |  6 +++---
 arch/arm64/boot/dts/qcom/sar2130p.dtsi         | 12 +++++-------
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts b/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
index 7469134f42b7..cc04eefdfcff 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
+++ b/arch/arm64/boot/dts/qcom/sar2130p-qar2130p.dts
@@ -357,9 +357,6 @@ &i2c10 {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 57 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -367,6 +364,9 @@ &pcie0 {
 };
 
 &pcieport0 {
+	reset-gpios = <&tlmm 55 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 57 GPIO_ACTIVE_LOW>;
+
 	wifi@0 {
 		compatible = "pci17cb,1107";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/sar2130p.dtsi b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
index a2d93fd68299..678ecda1c99a 100644
--- a/arch/arm64/boot/dts/qcom/sar2130p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sar2130p.dtsi
@@ -1337,9 +1337,6 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
 			pcieport0: pcie@0 {
@@ -1347,6 +1344,8 @@ pcieport0: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie0_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -1464,16 +1463,15 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie1_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

