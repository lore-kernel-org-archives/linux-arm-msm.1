Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5880F4825A1
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 09:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790327409; cv=none; b=rjps+ZZTgS4fmuCbCxYl5pLPCzROM/NnIXabePwCa9Pg/nSoZZy8VY4zes1WeO4PXadfZnrJcxja5w9wnNmFX7ki2mzXK+hEFAqIYo5IT8IDqEaeoPK5ogE29Nt+J1kXRO+s8mF7576EfEp9UUprRoUisHLO4Jv5u544r2AoQ1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790327409; c=relaxed/simple;
	bh=HmeR1l9JD8JvYgGsyzO5QvZGodxO5bhsmjCW69cOhmI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LD9r92l8fQNR4xhuqIms0rI/ZJFAfvZKcB6yfCZBLtmntaMb2eiIys4Ppdh8MFMmMALWrUVUJfdQka/ORVoa0MAfsi8osaAsBIk4nK47tqohea6FNGZoILuFWL87FxH25F8LentqEjqYVFtothsenZNFPhu3OZqk4V3hfygbO3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZbW5Beuk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EL8lhapE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZbW5Beuk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EL8lhapE"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YXRB1055791
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 09:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vjzv0biNUKG1BiKaowTeTkIFJcvCjq/9OvYidNdvtc8=; b=ZbW5BeukrFMoBP6g
	0797bv4FA0kh+w3/6w3sOgzaeSQHsjqjKeCybGrvbBbzqDXf00P/CI6G1zO+gJaB
	4pzlJ7o9+RMeHX1Z7RGYA5baoqOjWuoo1dj4QXnJkzv69CryAZotSy8S4ISXCUjs
	wxVlSXZ0na8dWnILEIcfYfcIufk6ZE9Y7lWSQRbEaBR43JYtKDGC9GQj79jr+eld
	5NzIZhOGQg06NNxzccnW93diBNqP6gd4N0eWBAptG65RcEGw67Utn5czlpCIWiqj
	te0oPMHaOVjfkbziqfWRd7nkH3L1HlVm1+g/V4n8LE1XwSqZuLNX6vJjToO+BrYf
	9Oc7bg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwce79s0d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 09:10:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a3f673221so194404285a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 02:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790327405; x=1790932205; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vjzv0biNUKG1BiKaowTeTkIFJcvCjq/9OvYidNdvtc8=;
        b=EL8lhapEWIuSfe09FX3B4DNnVCcj8i+hwAU2/9o2nEnteqrKQTtiXWCV1yDnUGGUXa
         UZ4ziSX7dYu8AlQh70AFs4piCD0m71fmWovo++DujITCr6UCPly3JME2MaGUWFczMCk7
         rO0XhYnNSH2dkPcGo9z9DET6BbtXTnq0/W8OaHX5hIzYcL7vnzZ+Z4rzL0KIM7XInXOi
         5zx8dEU98J7FgCgcTcZhGkUbHC+VwzdLggYOBvvS6+YjDHD3W7U8KmgvmOeB6Y1v5gAy
         KiPZSWnigvvYssp0C7d7T8S2mMl7/pX+4LNEMFS6+YFvxlqT4jg+rPXDhQdni2X2Ni0T
         9rJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790327405; x=1790932205;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vjzv0biNUKG1BiKaowTeTkIFJcvCjq/9OvYidNdvtc8=;
        b=K1699zqFL9bIiDCYFvVeiVVhaGzYYSnBLAF8GQFANk5OeNIcrEtYtij64CHwTf18oR
         3h+iT7uiezagdB/bfP0ASGHe8otFZNjLZQg0CLN+pZhk87EP5YGMwDD9LvOALmiUFAUz
         X12XIKlXJE40tIrNzbSXxBRrp8Bv4OQNCxVnUTFMVekq7GUj+oXE4lZUUashdXJbKfYV
         mwc5VHrUI2yDTPpQDpV6ZtopsLIENZR+LD1bcpqa3FHS60Z3SoaCepYJuSv4mSJx0GoA
         +0hLDh9o7p2fDkyMOP2AGRhNGuIGmRGz4MJIVfj8E4fBs4pIgph1SjONI5Y0eG6e3IYO
         li0Q==
X-Forwarded-Encrypted: i=1; AKwUvBy6N6DK1UdiNkrj+XYTfvjwO74DOzYl+S4hFIBiZTcUYqOrMQN4RfoI81vTr4FOcb9B6jmKgGvRXJg5hs34@vger.kernel.org
X-Gm-Message-State: AFuF++nv+xY7WznDpQ3gEujIzsR1wUxaAkoj8lsDmEgcTYLCU6WXOjmJ
	eGJ3O7uNuQ6dQuyVKRZwg79hVS8lx7I2f4KxRG0xH7ez8LHHE6BMqnlgrNECUoR2E91MaoQe6TE
	Q151Qce98ykO98QcWlDQPNt5F+Rhl1+qzry1boK2HJ/WJkyeoiFBxYDIrZXE1lCkMa5uG
X-Gm-Gg: AYBFou17Ffr1j2ZYrNVUVszCoZ5MHQUr7TCRAGcuULJtJBfVkqGgaWI54HsCZt5fLHX
	bddFZF5IMej9trg453dBLUwqVxRlyrMjM7VxZVG+5KKCH/iH8/l3HZLgitdSPV+GU2qsu2cee92
	inHtM6O+HvKD66l/C+o4SivrmU+bF7PA5k3QYjv47hfSbci8PWnp13u/d2qnmmrc+4YArKC0X0u
	5t+mrN2g71mkaFasUVx6RROV5FycXph7cEehdMc7FAnA9anfK3jbiLczfnpYnxm5tpSOTo1lw7m
	/jVkevPUXTN8hSs21uJxdO6nua/z9/+8j6WDXaEnz1mcMnxq02u4NMQDlLuDaXEnxLnnUWBhL5r
	fpKEOfCOAD1oSTC6KlD73qYTVabXWM4HpZ8ql9rrcsWAepZ6Xzuh/0U20nnACJ9NS/ClUByaWqB
	cZ+JLXdz+OjuF0WSpiGilx6mF6C2WTJ59b9weZee9vrQ5/7PVAQHs=
X-Received: by 2002:a05:620a:6018:b0:939:869:a8bb with SMTP id af79cd13be357-93c4735e449mr224787385a.14.1790327404651;
        Fri, 25 Sep 2026 02:10:04 -0700 (PDT)
X-Received: by 2002:a05:620a:6018:b0:939:869:a8bb with SMTP id af79cd13be357-93c4735e449mr224783385a.14.1790327404194;
        Fri, 25 Sep 2026 02:10:04 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:5c1f:3897:a4a1:99e1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a34a638sm5269890f8f.9.2026.09.25.02.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 02:10:03 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 11:09:54 +0200
Subject: [PATCH v10 7/9] arm64: dts: qcom: agatti: Add OPE node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-camss-isp-ope-v10-7-2622411034cb@oss.qualcomm.com>
References: <20260925-camss-isp-ope-v10-0-2622411034cb@oss.qualcomm.com>
In-Reply-To: <20260925-camss-isp-ope-v10-0-2622411034cb@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: l8y2Spmg9-UHZG90nu0AUWRrYIsP_Vnv
X-Proofpoint-ORIG-GUID: l8y2Spmg9-UHZG90nu0AUWRrYIsP_Vnv
X-Authority-Analysis: v=2.4 cv=NJFAaE6g c=1 sm=1 tr=0 ts=6ab63a6d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=1BEw5LmG3YzgyHxDt7YA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzNiBTYWx0ZWRfXwzzg3am+bhFt
 SVfM91C3xhikbVUvbSLH3Rr8cv29/NRnn7AYq0a8kH2VdpQCSVKOg+iI+ZAW6PZiXXOSFTyyWJy
 iKVrhfcdDDN2f1bjuO0omBtwj4obgGCxU6mp624K8CqrqSYBYQDBcNJRgt1NeCrMsHA8FmCGiYO
 ziqiOCoWg4MT4EfkPw2XNhFKBvCe2aewfYOxbazB7h7v8NWK7nORQYMjOlUJMrFrWofiwRQ6jOy
 21bqSJfy4X2AkiHzm7jRYNCLBx2Bm/ploKhmNhtBosxECh57AQTIJtoe1pRCNSsdbAAo47ahvxa
 RNeriDex5jmGDH3Z39yR9c7/+suxzcvP2DXV5TDnSetMNvuIxcJtrfg1vcLAMCZiiS+j36N/RTk
 elZq30MNbferSzi+df+0r1x6L4wgW9WpiTgdGHYggjul6sxT+NdPtiPJvQ0k04beVVuscmHm5Dx
 ZUZSdu6II/h++1lbaTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzNiBTYWx0ZWRfX2VlhSsNznRg4
 Yfx17tg5QbRapW5F5mEDgZLmp5oRkMXeVhPGPWkwmMFg3IgSmSHeE77AXin9vFDZI/0IiwzW3IN
 PDp8BCpxgHleFp1+++yPyP1YwfLk+QE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0
 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250036

Add the Offline Processing Engine (OPE) device tree node for the
Agatti platform (QCM2290). The node describes the six register
regions (cdm, top, qos, pipeline, bus_read, bus_write), clocks,
interrupt, interconnects, IOMMU mappings, and OPP table.

OPE is a memory-to-memory block with no board-level dependencies, so
the node is left enabled for all Agatti boards.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 77 ++++++++++++++++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 397d61a8a27c2505833466bd349acc27ef4ffe0c..7746c58b5b1cb25206e72b888b7559cfe27553b9 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -2020,6 +2020,83 @@ port@1 {
 			};
 		};
 
+		isp_ope: isp@5c42000 {
+			compatible = "qcom,qcm2290-camss-ope";
+
+			reg = <0x0 0x5c42000 0x0 0x400>,
+			      <0x0 0x5c42400 0x0 0x200>,
+			      <0x0 0x5c42600 0x0 0x200>,
+			      <0x0 0x5c42800 0x0 0x4400>,
+			      <0x0 0x5c46c00 0x0 0x190>,
+			      <0x0 0x5c46d90 0x0 0xa00>;
+			reg-names = "cdm",
+				    "top",
+				    "qos",
+				    "pipeline",
+				    "bus_read",
+				    "bus_write";
+
+			clocks = <&gcc GCC_CAMSS_AXI_CLK>,
+				 <&gcc GCC_CAMSS_OPE_CLK>,
+				 <&gcc GCC_CAMSS_OPE_AHB_CLK>,
+				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
+				 <&gcc GCC_CAMSS_TOP_AHB_CLK>;
+			clock-names = "axi",
+				      "core",
+				      "iface",
+				      "nrt",
+				      "top";
+
+			interrupts = <GIC_SPI 209 IRQ_TYPE_EDGE_RISING>;
+
+			interconnects = <&bimc MASTER_APPSS_PROC RPM_ACTIVE_TAG
+					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
+					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
+					 &bimc SLAVE_EBI1 RPM_ALWAYS_TAG>;
+			interconnect-names = "config",
+					     "data";
+
+			iommus = <&apps_smmu 0x800 0x0>,
+				 <&apps_smmu 0x820 0x0>,
+				 <&apps_smmu 0x840 0x0>;
+
+			operating-points-v2 = <&ope_opp_table>;
+			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>,
+					<&rpmpd QCM2290_VDDCX>;
+			power-domain-names = "camss",
+					     "cx";
+
+			ope_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-19200000 {
+					opp-hz = /bits/ 64 <19200000>;
+					required-opps = <&rpmpd_opp_min_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					required-opps = <&rpmpd_opp_svs>;
+				};
+
+				opp-266600000 {
+					opp-hz = /bits/ 64 <266600000>;
+					required-opps = <&rpmpd_opp_svs_plus>;
+				};
+
+				opp-465000000 {
+					opp-hz = /bits/ 64 <465000000>;
+					required-opps = <&rpmpd_opp_nom>;
+				};
+
+				opp-580000000 {
+					opp-hz = /bits/ 64 <580000000>;
+					required-opps = <&rpmpd_opp_turbo>;
+					turbo-mode;
+				};
+			};
+		};
+
 		mdss: display-subsystem@5e00000 {
 			compatible = "qcom,qcm2290-mdss";
 			reg = <0x0 0x05e00000 0x0 0x1000>;

-- 
2.34.1

