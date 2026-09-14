Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27ABA42902E
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 10:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789380763; cv=none; b=mQXtWtSQlxbQhCFjQHFAOA6n0K66Hf1YgVByRdrssxiZXi9KlosT5R/2meluYPKBOQv2GW/7oP9CTLzaz4y+rvhvm51i0siqbBJAHhglyDDfi/eOvACykH2s570soJVw2ivYrQ7vSYJ+jSHxUdnc54umTFlUfaSsIjwVeMmu/iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789380763; c=relaxed/simple;
	bh=xMKmHqMcglrB3TIoMDCTsttljBJ4YRnwsHlG80WRnOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mwrDFqwWj3h5smlwpw7BsZJTakLhWtOlSictnORBVgBPVElxyhonwwNJn36Tu7DRs7J0/zPhcK3DZ9GXIqKNC5E0dbsu/2peBeNdtMSDdBfizpqlF4aGF/xtXlkda8EuBLK+FnKh9Z+Lhu7b2cGMuqDiqAPxF8rzC6pqfq+GbCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DnFzaD1C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IamWcE7S; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DnFzaD1C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IamWcE7S"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9njA53731706
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 10:12:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vv4XagzbZdZ
	hSWJsSg+y0oxFZOrv+wkNDQPzcVNomso=; b=DnFzaD1CCSGYvCn1JIhbi2v2fuc
	+hwxu3uq1vzsfnmYE299KWK8S36Lb4H3cfTS2Wz9GW5AgUgLZ3HHfnRqDpgSUAN7
	He2/I10OznQPOZ2twJPoWl0yZFEuZoZVsaoaNPwRsHKYWYod66cgpSXra8Wug2Pd
	o8ghEZhdvzraH2o3bnGdurK5u46gPvgBulYjoQG3kDD+YJE5j2axXA3675ZdGTb9
	kUleZPQpE+7BylT6k95+USOBn5bDQqGAj51dttWd86vLEnYsgUsWnVHMoLTHASSb
	pTf6c79cZ0p341d4lG4aMkE4jLJE4hF7K9LwTHkgjHj5+rYmqgklsx/9Pig==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f0ejb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 10:12:39 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6b1b7932ec2so2731996eaf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 03:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789380759; x=1789985559; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vv4XagzbZdZhSWJsSg+y0oxFZOrv+wkNDQPzcVNomso=;
        b=IamWcE7S1f7FiIILEcWwX/OvH9CUk5bMTQ4aMUSjbBqd6GErDSdO5KYzj83G7lZHbv
         A7rzpLzunHUEoXdOhxgaAwPA4oXzlhBs4VqsznlUnGy1kDCin8QV/GhbK+clCB5I2GUw
         6WnKGSRVOMXnhaWZIlNQlyUSGZp0/Qt3WiV8QpKS0+0tA9IBbqJ7eAKUHjR/j1h+MM9a
         bibivVcNgcyX5jUCOUN3PQOcroatSkgtKTKlCrsBovq+ugR4lIkNmKwNPkdHKnxoSCBz
         sJJnj3mntN7ag08/DaozzzLxoipCN2ujgpYsD5MLWovfTEW8odAM19hCwlyS86cVCj+5
         4J0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789380759; x=1789985559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vv4XagzbZdZhSWJsSg+y0oxFZOrv+wkNDQPzcVNomso=;
        b=Qa5ZsVyUPfLI75/947F3gL4e1ycf2I3QYKjJ1FsN8kGuf44C1vlRLXenUJ9NnW534N
         WALZYz1DwUj4ip96MpRxb0tS1yhcKxqslkVnMTUymV2ipjC5BO6lq2sX7ERUm7l1NGJQ
         9PvqzSSDaRxzFbQ5eiq5nFc11zVlCFProd/phs9ALnJTQx8IZ2UfPOrZF3AHY99lX7dS
         5S7/8Z16Rdcn0/+5bAe/zdbxVtiSNnew9OVvq56a/MwqjUkZgRPdI4LzglFa7rufvRI1
         os7lWBr7xeI27b7hfxbFB2L+YkPRhVzrKmuWA/VxADMhRUzv6EmngcE6+Om2Pl/PdYLC
         Hwuw==
X-Forwarded-Encrypted: i=1; AKwUvBx+T7uSfzWw/LrNjteVNwNxqhD/HMbShk7oOFUah6lXzXd/nuwLVqWNHlOvwYHe/cVeUMZHM3cihwAk7U0S@vger.kernel.org
X-Gm-Message-State: AFuF++kycOyu4lRttT9EaSsxzuS6RcxYjz2HJZDxMd4+WE8SD/l0cTz3
	a40xWruubojm3VX6Ki9Ixp5YmQ2tBjf0q8+LnhGlmVUn0uIp/110I8dNL/BrjqC9dBF9ZPcwJhT
	OrRo8hmCVBOUVY9KaTKwYLI9VQ8w6CqKbqc7db2mG00X3/gIBua6vFeFdBHl9rfyMpG5fYlpE+x
	go
X-Gm-Gg: AYBFou1SrUqOpl7kkGKeaYxjVC8zo12WSGaP3fdWtLWEDgUgCN+ghr28++zpPcavsm7
	oQt2GFX3TOV0EHdUNy1Cci29IWBW2g2c5C+co7riftiDfEOc0YO688uT4+dEVSF7Tx3Lr/cLURQ
	+oCd9ww9ecv3SE8+XAcgsDBifcIxQNh4CNwJgCgJv/gIW9hzzGdMN8VqdA4TVAokyLY8RNqsyzx
	U3aiJD1HyH0MdV8tF/uK/WiafITjdtv6spt88P0FdPUCuXfp/1hk6k+acyRHE/lQZ77PMAsFeqp
	ake+0I45d/JC40S2GzYbNOUtnomyddARu8x0jlMzDljDU74FdZPkAfqm9EuQ7H7bGkgG7kKgrjL
	mGZ67pQ3r+O88vN49PJe4MejqixryU84jwN5A4pLvGIX5EQ==
X-Received: by 2002:a05:6820:f00b:b0:6b1:445d:aaef with SMTP id 006d021491bc7-6c53f74ba04mr881778eaf.2.1789380759412;
        Mon, 14 Sep 2026 03:12:39 -0700 (PDT)
X-Received: by 2002:a05:6820:f00b:b0:6b1:445d:aaef with SMTP id 006d021491bc7-6c53f74ba04mr881758eaf.2.1789380759015;
        Mon, 14 Sep 2026 03:12:39 -0700 (PDT)
Received: from hu-liuxin-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4ed64fcsm29020697eec.16.2026.09.14.03.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:12:38 -0700 (PDT)
From: Xin Liu <xin.liu@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Yijie Yang <yijie.yang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, xin.liu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com,
        guodong.xu@oss.qualcomm.com
Subject: [PATCH v3 2/3] arm64: dts: qcom: hamoa-iot-evk: use on-board crystal for PS8830 retimers
Date: Mon, 14 Sep 2026 03:12:29 -0700
Message-ID: <20260914101233.981643-3-xin.liu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914101233.981643-1-xin.liu@oss.qualcomm.com>
References: <20260914101233.981643-1-xin.liu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: PQDzvgWiNgX0pCkvZkK6B661fT6nj-vR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE0NSBTYWx0ZWRfXwldBmc2h9cEX
 pMSIAxHlwhfiOw78a7RuXEG2uewKy5JIPtA76/3t048RZA+CoNIyxa5dSwFNA8GbI8mB8UpDqkC
 u2mLMSKhjceKoc2KuL97oMb85724y8I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE0NSBTYWx0ZWRfX/x1PlkBXI80y
 vy6gFFIxERJCJoaFXzz88QKERBQtyKAFjOww1A/jgFmQeW+qWaiBFWvAu2D9d11j4RXramC4OU/
 +Ax6PWHZ+jJR3uMXEHKEjcjW0QQWvXGqto108llWQTOF6AgJjMSq/YxKwtlibJMoyYxNmh3Cm01
 AfM1y35J11mTcBzvI9+qSwOAMUVU3NcLR8gdBaseTIpKearvZoSFj0YGTsMOkdoR7crvya/55Xv
 i9NeLRUtXSG9A9tn2dRRflQ6DmR0AZdkcPeHLE+RhmHBhX7SavM+RcwMseZInJEVb451DhSGK/i
 1BYjH29c4COARAlzjeEX22W2L1jvpmjJbq4q98TuA5NFS8NZYAz3cn4LTbv27emLN8u9BY++fcR
 F20JKRsD7geNAg+V2rYPEtnw3tOvjxNhTmWCb9E3Jl7BsJrU/8PiXJIQETOdjxJcsCTl9hlAAoZ
 n0hZAeAUvtSO9VAY1fA==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7c898 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=A6pafLX9Xm4MMD3TR8UA:9 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-GUID: PQDzvgWiNgX0pCkvZkK6B661fT6nj-vR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140145

On the Hamoa IoT EVK, each of the two existing PS8830 retimers has its
own 25 MHz crystal wired to the retimer's XI/XO pins. The reference
clock does not come from the PMIC, so the RPMH_RF_CLK4/5 references in
the retimer nodes are wrong: they keep those RF clocks enabled for
nothing and describe a connection that does not exist on the board.

Fixes: c11645afb0e2 ("arm64: dts: qcom: Add base HAMOA-IOT-EVK board")
Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
---
v3: New patch.
---
 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 776bded3a312..57c8ae2e7d4c 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -35,6 +35,18 @@ mcp2518fd_osc: clock-40000000 {
 			clock-frequency = <40000000>;
 			#clock-cells = <0>;
 		};
+
+		clk_rtmr1_xo: clock-rtmr1-xo {
+			compatible = "fixed-clock";
+			clock-frequency = <25000000>;
+			#clock-cells = <0>;
+		};
+
+		clk_rtmr2_xo: clock-rtmr2-xo {
+			compatible = "fixed-clock";
+			clock-frequency = <25000000>;
+			#clock-cells = <0>;
+		};
 	};
 
 	wcd938x: audio-codec {
@@ -699,7 +711,7 @@ typec-mux@8 {
 		compatible = "parade,ps8830";
 		reg = <0x08>;
 
-		clocks = <&rpmhcc RPMH_RF_CLK5>;
+		clocks = <&clk_rtmr2_xo>;
 
 		vdd-supply = <&vreg_rtmr2_1p15>;
 		vdd33-supply = <&vreg_rtmr2_3p3>;
@@ -814,7 +826,7 @@ typec-mux@8 {
 		compatible = "parade,ps8830";
 		reg = <0x8>;
 
-		clocks = <&rpmhcc RPMH_RF_CLK4>;
+		clocks = <&clk_rtmr1_xo>;
 
 		vdd-supply = <&vreg_rtmr1_1p15>;
 		vdd33-supply = <&vreg_rtmr1_3p3>;
-- 
2.43.0

