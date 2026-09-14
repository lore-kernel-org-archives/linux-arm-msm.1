Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4533742048D
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 09:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789379689; cv=none; b=jgDkWip24DgEz1g6g368ATAQ/f+EOdDout40yovOexVrwm+UArvoXp9yUpcRjmuEl+s4qdzDNbLOn+zG+A539Cy7UXKqj4K9pKWUo2USRuTsG+CH4qnXMKDJHajmM37PgNTZuscRg6Nm9xw3wcQe4jgt4Ya2FLErX0ytztqN4E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789379689; c=relaxed/simple;
	bh=QU6DSxRjEWunHWAevgigWKsFS/uH9Z0u6jHXsLYx6W4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bthCO/suy/C3irSTCNyBIog8B7+AhAbFyOA1zFR9lMYmRpQmIRYoXVC680g3w/cnQykWsM9EVVteCBXNoFbsAD1ryOXCE1iMjCUgOmAo5gqudHMy6u61bbZyRuOe0ZjNzG/s0IMuJBjzc8Kz3l0PJEDwJ6EbD7muVhzLdOG4NSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jKqz4b8i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H/6mHAFe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jKqz4b8i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H/6mHAFe"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9nM8b1332107
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 09:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kZs3n18M5pQ6twdBPBJdc/puB1jgYJ/1LO8e3cGMa9k=; b=jKqz4b8iqm5r0e6n
	zBnF7q6nGdQO3zVI8h6lCJkAHEuOb/sa5WnRZy+S4qnYY+rYn1o1ofdnZNCUDvPS
	XLHTiYCazyUcoqtcNby0oxu8EQ7zfEI4GlJ+HHvsYx/keqFkv6IGCdt7IRc7I0oN
	PG7QnGRK3FjyJ2W/wO3FXWVHhC3QpOd+ubSM5FPUzG4rpmM2etRaxvT/bO+dvOoO
	ygMVKpGlA5PMQGz8BPkYRteNz1NNoWjqAqdZNmjuwDC3nXNHaq+kggaZQ9LxJPx0
	eifS5UvLw5UisaPuhiez9grtwa45xnfBhRRo9e63QNkNHsODyKQKdu7FNBzwdyWa
	gOTGeQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeex81vd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 09:54:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so5437089a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 02:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789379687; x=1789984487; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kZs3n18M5pQ6twdBPBJdc/puB1jgYJ/1LO8e3cGMa9k=;
        b=H/6mHAFeA8NSKnWKSFHRNYy62QNbYhUexPTPc6jX57ekYuLj4CVv/shkjEbcZFAKFq
         w3taZnJ/3lpfZlGqPI/eSdJzyTr1bF392xNNu8xO7IpsRjGJ/kVWPXioPhxPjsLq2S4r
         j5QJD1OdNDS76nED/7Xl9zjxE2WoqoHRAqSYY3BfGmAONXgJADpNqX0l/v9/4aCL19kE
         /TPxkSFVepQ69tQCDQXwI4udNZMCC+KJzsYgJgloyJ5l0M7FW8LHwQmcXJErdgdffhqJ
         QCLE51O61c+JpyHfWvB+Px6OmoeKfi9rEB/Vmle/dNDPU3UX6mYjPtmS66+Qm6K4At8d
         eipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789379687; x=1789984487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kZs3n18M5pQ6twdBPBJdc/puB1jgYJ/1LO8e3cGMa9k=;
        b=PwnyLDr+/KbAG1XAD2EzvVZmUk/y/EOcfqUkRIz2dWCz+LjGZaHnYtILBnjZUPewr7
         TPUgNjKNnp0deL7sC3FVYu5bQFwPoUIBpsOKnVcmRelW3HL3sliicM5l+SVIYfjl0Jnm
         Z6fl02V9IvcRyqLzOX2w9Q/3k5ZfSxNczX9/YR6nzsL2Ism9fvwn2GMS6TJUhKD7Q2Mu
         MOMkr4CFFuV4kjcIcZrFcoXLvzqjvhh/R98LVxnZA3KFLlTSsw/LXL6mv1GpTJPd8Drr
         Xjsfe63yOG7EtC0/tjBOP8T5TY4YzCGjwTQVa8gpiNsIYBsksWenpwiROZgnh552BcO+
         I+HQ==
X-Gm-Message-State: AFuF++mM7NG3OfYnE4WjgLQWYUyneu8i3LfoElAYzvCrDiBknBuFsB8Z
	cxt8f0Z7Y+F5B0lTpArmJQXms4jZfHQX16wAjpMI2/piUlJzNEs92wo/zt6vDf5ykzkMciseLEM
	vphmjByVkOhWtpbMDWIUIKom29baK0vqxPe/9zEirVEP8QDxae4j3ewIckfaJJEk8cyrv
X-Gm-Gg: AYBFou2BqYJjDu3VPLum++bNd4kTzciywFVlwxAShNOobFr61+lU76bn0DcJ+2BDKXq
	osyOcnBkVKNfPB5VCH6+fW3a8auwHCTGgDowqYSx2zh2N+QdxVve7lMU0iWdh3H4tLdo21LGz3y
	m49/6odb1KzP5R9YYy+K1M2YqIR41oz5OuuvMRXcZlwn2wb01MwwiwROBceGjqi1eCsROgKsvvz
	T8tGqiQbKPA9/6V+Znc8KkvTrywZ7Ex45YfQPUYE86TTgyYK7V+2z4PSiHofCcsf9fjU6FZ+JJV
	fBWOhZw6WaxeZLd4uqK3G8f7EX/Qmzn1HJFpBrKPOIw4ji/ZoJouESDwqFV7ruJv+pH/dvgvWSC
	SdfxFNSwU6yLMhujCVnC7HrFjSaoV3VQoWwe7UbG6PbqjY6MpiMITQB2oTz8dipLBFs7BCRvvgq
	s=
X-Received: by 2002:a17:90a:d2cf:b0:398:9be8:ea69 with SMTP id 98e67ed59e1d1-39dec1426bamr4651563a91.22.1789379686833;
        Mon, 14 Sep 2026 02:54:46 -0700 (PDT)
X-Received: by 2002:a17:90a:d2cf:b0:398:9be8:ea69 with SMTP id 98e67ed59e1d1-39dec1426bamr4651497a91.22.1789379686334;
        Mon, 14 Sep 2026 02:54:46 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d94bafb3bsm20664313a91.1.2026.09.14.02.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:54:45 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:54:25 +0800
Subject: [PATCH 3/4] arm64: dts: qcom: eliza: Add iris video codec node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-add_iris_for_eliza-v1-3-e8ccd9b8cf7a@oss.qualcomm.com>
References: <20260914-add_iris_for_eliza-v1-0-e8ccd9b8cf7a@oss.qualcomm.com>
In-Reply-To: <20260914-add_iris_for_eliza-v1-0-e8ccd9b8cf7a@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789379665; l=3494;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=QU6DSxRjEWunHWAevgigWKsFS/uH9Z0u6jHXsLYx6W4=;
 b=zBLhplctgCAcoOe7FRxCtyfBa/oyBjq6g9Z0IYe5L9MtrLmJaNd9qDct74OJnaUKtQIPvIUGt
 uJ7riScJQHMD67yjPn3qcLObw/T0iQbh1O1ZlbZsl4aMUtuPM02TzF+
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE0MSBTYWx0ZWRfXzbA/wxX/+Izz
 MBGIwHyNN53Ny+PKZTLbqIFHMH29Oo33t4m+Rfe3EvAuhvoJMiI3mAvynzIG/jBmwnrH5whTnpO
 8ZCWvDrvFQ6JZREi47lcEafZ1zEeyy3mZYwLXMgGZWjjkYxhUcIaYZLI2cyAUCidETops10Eh9k
 gs2V3Ioc7DYEOMMyBLgZ/IpfGvLdmm70xtjC82I4/MKyNC35fdPsKHazJFxZ0AfBIqauz028QAV
 F2mSNyP7fZP+s382pJ7UzXLVqQ5n/Pe2KQE4mylexPVKK40Rmk1nw3isHMyxItMSgCHsO+MvOQ7
 UZhLjvSdQquQ4Yc1EneKy9Mncz4TiwW7aj/GNXyhQ0byCcgvUdUJf8rZ/oqkzvRlXV9YiMU+cph
 yxvchaVjJljYliyHVWLle5UIfK3RovMTw47lG/yXZVlK6tlejuDWD1hiMYTNXjETE3CyrH0INTg
 eCxRDDY+JKdYh2aMcTg==
X-Proofpoint-GUID: QUpMUjAeaAKQ0IlqVvW1V2_CaJjMtg_x
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE0MSBTYWx0ZWRfX4sKLeQ2Tdijy
 GvwLjGl2XRzc63wyCokozYKN51PuRGKk77jYwn6uPjCecPYF2EGQNWqaFRFYsWr6EAaJGJ59/F1
 K0HSNcRG09v2Hkxu3+4sF5th7Ec7ymg=
X-Proofpoint-ORIG-GUID: QUpMUjAeaAKQ0IlqVvW1V2_CaJjMtg_x
X-Authority-Analysis: v=2.4 cv=MsrHeGae c=1 sm=1 tr=0 ts=6aa7c467 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=lXaTmLNGT-RzeeOE_7oA:9 a=eQaGosDBtpkPWATo:21
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140141

Describe the Iris video codec hardware found in the Eliza SoC. The iris
node is placed at 0xaa00000 with VPU3.3 hardware capabilities. It uses
GCC_VIDEO_AXI0 for bus interface, and VIDEO_CC_MVS0C/MVS0 for core and
codec clocks respectively, along with SM8650-like AXI bus/XO/core reset
support.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 98 +++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index a8042291bd075893304a9ab7bbde84eee5547491..5ebd2aa0a520a7c3e08eaff03e3220469cb64f23 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -3357,6 +3357,104 @@ gpucc: clock-controller@3d90000 {
 			#power-domain-cells = <1>;
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,eliza-iris";
+			reg = <0 0xaa00000 0 0xf0000>;
+
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			power-domains = <&videocc VIDEO_CC_MVS0C_GDSC>,
+					<&videocc VIDEO_CC_MVS0_GDSC>,
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_CX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mxc",
+					     "mmcx";
+
+			operating-points-v2 = <&iris_opp_table>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO_MVP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			memory-region = <&video_mem>;
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&videocc VIDEO_CC_XO_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
+			reset-names = "bus",
+				      "xo",
+				      "core";
+
+			dma-coherent;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
+			status = "disabled";
+
+			non-pixel {
+				iommus = <&apps_smmu 0x1940 0x0>;
+				iommu-ranges = <0x25800000 0xba800000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x1947 0x0>;
+			};
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-192000000 {
+					opp-hz = /bits/ 64 <192000000>;
+					required-opps = <&rpmhpd_opp_low_svs_d1>,
+							<&rpmhpd_opp_low_svs_d1>;
+				};
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
+					required-opps = <&rpmhpd_opp_nom>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-533333333 {
+					opp-hz = /bits/ 64 <533333333>;
+					required-opps = <&rpmhpd_opp_turbo>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+			};
+		};
+
 		videocc: clock-controller@aaf0000 {
 			compatible = "qcom,eliza-videocc";
 			reg = <0x0 0xaaf0000 0x0 0x10000>;

-- 
2.43.0

