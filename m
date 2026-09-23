Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A23948122F
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790159297; cv=none; b=hTgvTGcoYlKc/kXkHvic9sy7/U9vV5NSQcwcNGw3X+8OXc9ctxGuM5bZbSQpjaWlZuRmIBeMz30pOUMbD51z+l43kfhU3jZlNnTI6Bfa5OKnqURA6iCzJ2YqXsdsLZGie+NFUjSMLVaS9ii9O29aVEBe/6NN8Tzo3Nl1N0buBNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790159297; c=relaxed/simple;
	bh=etG4BtQ4PSDzpX8S3EyHrzvH8j69HsSR41pJsFSCjgA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IikSpAcfcEFuLmygPphf9FNMZtL4hHnUtuyvOXerxkzKidGRc18qO9bil5079C4cCblAdKWqIsJzT9/Sas7KDQCLhLnA49l3u/XttLtrTG1Twi2CwFZODCqrM9QPGNrbeWNQItKyzbHUUgm5IlimLZi5opPBXc7+a70+pkTYFlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L5RKJwC0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aVxyJ2YO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L5RKJwC0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aVxyJ2YO"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA30Wk4087726
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:27:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KnHn/YYXznG5uBOCe2EMlfQgoUjuqbdlAiuXokE+3LQ=; b=L5RKJwC0TLyzGtO7
	9REQq5D8nIdeBlbiqJ6bNbcfxAZMRzNsdwS4haT1Z/wpvAu1KDCKj6d4tZ5dPUsc
	CH0gQbxjp2s3f++AsAm+O7WeSyaGQJpDN8UHxhAgBSlThLYaIQrCt6qGqV7lZXdd
	0APQp0Xl+t3tafsWJDafAdU/UAscOjn/C/WDGVI717wHZIj8SbjtyqTFWEuK3c6N
	D8iL7eaNDGyhwRUlHQ1ktdqeOTmWnDogG9UzD/ZiFqY1Eml1PyLrav7aId1NIz2c
	44fu/R/GWNpA4sSIlHIELpq7A0uOwEKrCh/EWmyNUodDANlRSp32iVdXjImQ9ie3
	ErHy1Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c3vpn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:27:56 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-32861f5448cso1433447eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 03:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790159275; x=1790764075; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KnHn/YYXznG5uBOCe2EMlfQgoUjuqbdlAiuXokE+3LQ=;
        b=aVxyJ2YO+3yFgmaeMKIXBBeRA7qHMIpEVncGMaC3YBod0hxdwguNZxXxUAh3MkTlHA
         k80raHNhPvx8cQBUbwj/Qsq5zs+TZbb5hRbzu3wR075BCFxJP6yGJf58AmyHIZumo8Ne
         O1I/Bxy6Rnvwmp1+Fkv4dXVFRoRSqt7JdN+Evg34B/7GxP71Jolkm911nqh8IyDHGRpp
         T4Oj8mMFySvI717VErnMhcAToWjzqZtOrgWgm7DyA6047FIcZQmZf7U84sdZYKOwciuH
         PqqxZ9l1oNMmMVHAXyfFtsoIOBPMDCIBZiJ45d9SAGeKGk03sVcPiiuAE5QP/d+brysU
         n9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790159275; x=1790764075;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KnHn/YYXznG5uBOCe2EMlfQgoUjuqbdlAiuXokE+3LQ=;
        b=lbBB7Zzap6Pwyt5MQgf6GaM27Tp5+P+2oer4KYMXR9vWXIsbrPf5pDVhatOq6JpXrQ
         StM+LtvFSoMP2FJcsq76EOw7zO7ojqBleSB4W62Y/Yi3/CcHZ6NaKPnKyOXIRBGnCWqF
         9rxSyZ/i9TjYUZcx8JTvzgz2vTx+CKiVqNgZSBAwvcfOA11Ww7FTrHdwsAxoIN4BmVm8
         PpQWX2QwsxkAAyMapaLD0+M2iZGyyWGq9mBG8ZfDuUZacG5JvBEiAG+i5oTFI0fcunYR
         fj+QY0+j0FQGTqiFyrYbzu8sTmayoqUIFL99l0dfBPG4LohI3DkW3ndGhaEiYjU6Yf1D
         N1dQ==
X-Forwarded-Encrypted: i=1; AKwUvBwudRZU3s0pWAJHcHvko3hoFFbp5gH6CJVl3oIUlRyAh2YDVzPMQ2s9bItFpTNX7Neh8Y3J1PBYUqOUzjY/@vger.kernel.org
X-Gm-Message-State: AFuF++nxsGbZ4UD9uy8i510nYY+laemNLzWMqibqb4o7ie6GDJlliZ5e
	JN1YARU68CSTq51lbRVojCJzLah2rm6xQ5TbYZcCkdTE5mk7zsDFUOeU78VNYZdaoIthXuMaZmn
	bEpY6td4lNm+Y784d4QWpAz87fFRGaLFynyQCMfh84oZEzE9oDMv5VZdzmsOi5FYs/x6a
X-Gm-Gg: AYBFou1VBNSGByj7/ikBZBP45rawBGoQM2s1L2nnmT7sfxPy9cYVuzx133mowBfEhvp
	tI5BuF10vtblV/rAqxN8W5qv0AKJeTYz8z7Jezlk58SawVkATwQ1OsTNPVytufE9xhK/Bm8aTvh
	46ylSJqryge2JknnMIlIHYbAOxw9JAvzigmbu+kLNPbDGoqItIJTrov0IqloASOvcWIjlbq3gLC
	r35rxPv3OmNbkfsmUDW16ss21De+KhiP8oOPqD5W/LICu0RJJh56HxTKYEus0lKdu9KbF7YuzNR
	ZjVnv8TY7jdC9JcsKfGHanLOgZpa2d3GgF5XaLYCG4IYVewgafk51t2ca6bIWc4/sHiu6UIIljV
	o3aZzy/n/6eWGrKAyyI+7tc8=
X-Received: by 2002:a05:701b:2919:b0:144:c122:6cc7 with SMTP id a92af1059eb24-144f9193b3dmr2210120c88.33.1790159275231;
        Wed, 23 Sep 2026 03:27:55 -0700 (PDT)
X-Received: by 2002:a05:701b:2919:b0:144:c122:6cc7 with SMTP id a92af1059eb24-144f9193b3dmr2210108c88.33.1790159274610;
        Wed, 23 Sep 2026 03:27:54 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f98a288esm8766646c88.13.2026.09.23.03.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 03:27:54 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:55:54 +0530
Subject: [PATCH 14/15] arm64: dts: qcom: maili: Add GPU support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-hawi-gpu-v1-14-0c3c79a1a470@oss.qualcomm.com>
References: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-gpu-v1-0-0c3c79a1a470@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Akhil P Oommen <akhilpo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790159163; l=9922;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=YbDqye2yvDphoomeAbkXvJAQe2FIURd/yTiH/CKWuRA=;
 b=c4seMpP31QW30SERZ2dx5FiaFfOVT4rVDhg5PYtH69fzeJ99oSk5Io3hf84QrQ96m4rIE/Tfm
 LAFhVV2z+BFDJzQN5TK7Dod/gAxPhhOekOebh1E4XIgJ4U1UkPRVwhG
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfX7d7ZtmeSpaTo
 DvKNYQ3hR5ux7VWS5XVCDTi8QsU+mQfQwJBZd0K9a7zHrmonaVLSPNHqq4U+OfOuRECawMbdzw0
 86tpo/o5CUXWb+WDrgUdPtLbo0R2YEH8l66v/TnXiabhY31UVQRGtUC12Oqd7Kyq+OfOQ9qm7yP
 YEajM50BNOyQ4EfnuK8RJUeLPteeeZt3Rd0AG1e+giOLfXi5irY5QKpTWrVhvVry6D2Wb2DH/Vd
 hktxEKyQkvtsztujkJTqsckLA+GxG9rASTJemFhSGBcqMrt6s0f8cNexK2q6CwA6PB8+HS5yddZ
 C+9qCFeAkFJsLChHk+AguHfvA7+IEn80OyPBxaW5ZSIzQxWIDkv/arTXFo2gjpibS5KZpGc9eAi
 5XvOxh4IUQO+Am/wAGx4VuwzA5qYbZN6Y3WuCA8ZnN8OCGfyf4ydYAw918yIwDjOfydV4gTsZHh
 A2+uiFhM/KzWFS9L8Eg==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab3a9ac cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=KeQ0XDkze7PV3Olr-34A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: xhLOAkoJz_OcS7pu1oxpBlk2l9Xp_2kQ
X-Proofpoint-GUID: xhLOAkoJz_OcS7pu1oxpBlk2l9Xp_2kQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MSBTYWx0ZWRfXxLGxLQe3qSde
 ClNjpbsMqN3q+xxkmuENFXTr6xQlyBDFAzJLI3ihKxRMTSdeujYfKx+7KRqGUhT4qaO+zGHrR1C
 SbCRQEjiamDibBI5GqGrwilR2Kphj6o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230041

From: Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>

Add the GPU and GMU nodes describing the register maps, interrupts,
clocks, power domains, IOMMU, interconnect paths and the OPP tables.
The GPU node is left disabled here and is enabled by the board
devicetrees.

Signed-off-by: Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/maili.dtsi | 309 ++++++++++++++++++++++++++++++++++++
 1 file changed, 309 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/maili.dtsi b/arch/arm64/boot/dts/qcom/maili.dtsi
index 886d307e536b..27558fbc307f 100644
--- a/arch/arm64/boot/dts/qcom/maili.dtsi
+++ b/arch/arm64/boot/dts/qcom/maili.dtsi
@@ -3776,6 +3776,250 @@ tcsrcc: clock-controller@3b13040 {
 			#reset-cells = <1>;
 		};
 
+		gpu: gpu@3d00000 {
+			compatible = "qcom,adreno-44041400", "qcom,adreno";
+			reg = <0x0 0x03d00000 0x0 0x6c000>,
+			      <0x0 0x03d9e000 0x0 0x2000>;
+			reg-names = "kgsl_3d0_reg_memory",
+				    "cx_mem";
+
+			interrupts = <GIC_ESPI 364 IRQ_TYPE_LEVEL_HIGH>;
+
+			iommus = <&adreno_smmu 0 0x0>,
+				 <&adreno_smmu 1 0x0>;
+
+			operating-points-v2 = <&gpu_opp_table>;
+
+			qcom,gmu = <&gmu>;
+			#cooling-cells = <2>;
+
+			nvmem-cells = <&gpu_speed_bin>;
+			nvmem-cell-names = "speed_bin";
+
+			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "gfx-mem";
+
+			status = "disabled";
+
+			gpu_zap_shader: zap-shader {
+				memory-region = <&gpu_microcode_mem>;
+			};
+
+			gpu_opp_table: opp-table {
+				compatible = "operating-points-v2-adreno",
+					     "operating-points-v2";
+
+				opp-1450000000 {
+					opp-hz = /bits/ 64 <1450000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L3_1>;
+					opp-peak-kBps = <20832031>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0x88295ffd>;
+				};
+
+				opp-1400000000 {
+					opp-hz = /bits/ 64 <1400000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L3_0>;
+					opp-peak-kBps = <20832031>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0x88295ffd>;
+				};
+
+				opp-1350000000 {
+					opp-hz = /bits/ 64 <1350000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L3>;
+					opp-peak-kBps = <20832031>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xa8295ffd>;
+				};
+
+				opp-1275000000 {
+					opp-hz = /bits/ 64 <1275000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1_1>;
+					opp-peak-kBps = <18671875>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xa82a5ffd>;
+				};
+
+				opp-1201000000 {
+					opp-hz = /bits/ 64 <1201000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1_0>;
+					opp-peak-kBps = <18671875>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xa82b5ffd>;
+				};
+
+				opp-1126000000 {
+					opp-hz = /bits/ 64 <1126000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+					opp-peak-kBps = <16500000>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xa82b5ffd>;
+				};
+
+				opp-1025000000 {
+					opp-hz = /bits/ 64 <1025000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+					opp-peak-kBps = <16500000>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xa82b5ffd>;
+				};
+
+				opp-951000000 {
+					opp-hz = /bits/ 64 <951000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM_L1>;
+					opp-peak-kBps = <12449218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xa82b5ffd>;
+				};
+
+				opp-843000000 {
+					opp-hz = /bits/ 64 <843000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_NOM>;
+					opp-peak-kBps = <12449218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xa82c5ffd>;
+				};
+
+				opp-801000000 {
+					opp-hz = /bits/ 64 <801000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2_0>;
+					opp-peak-kBps = <12449218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0x882d5ffd>;
+				};
+
+				opp-759000000 {
+					opp-hz = /bits/ 64 <759000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L2>;
+					opp-peak-kBps = <12449218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xa82d5ffd>;
+				};
+
+				opp-693000000 {
+					opp-hz = /bits/ 64 <693000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+					opp-peak-kBps = <12449218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0x882e5ffd>;
+				};
+
+				opp-636000000 {
+					opp-hz = /bits/ 64 <636000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
+					opp-peak-kBps = <10687500>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0x882f5ffd>;
+				};
+
+				opp-578000000 {
+					opp-hz = /bits/ 64 <578000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
+					opp-peak-kBps = <8171875>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xe02a5ffd>;
+				};
+
+				opp-539000000 {
+					opp-hz = /bits/ 64 <539000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L2>;
+					opp-peak-kBps = <8171875>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xc02c5ffd>;
+				};
+
+				opp-500000000 {
+					opp-hz = /bits/ 64 <500000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
+					opp-peak-kBps = <8171875>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xc02d5ffd>;
+				};
+
+				opp-461000000 {
+					opp-hz = /bits/ 64 <461000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L0>;
+					opp-peak-kBps = <8171875>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xc02e5ffd>;
+				};
+
+				opp-422000000 {
+					opp-hz = /bits/ 64 <422000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+					opp-peak-kBps = <6074218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xe82f5ffd>;
+				};
+
+				opp-390000000 {
+					opp-hz = /bits/ 64 <390000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
+					opp-peak-kBps = <6074218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xe82f5ffd>;
+				};
+
+				opp-357000000 {
+					opp-hz = /bits/ 64 <357000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0_0>;
+					opp-peak-kBps = <6074218>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xe82f5ffd>;
+				};
+
+				opp-325000000 {
+					opp-hz = /bits/ 64 <325000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
+					opp-peak-kBps = <5285156>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xe82f5ffd>;
+				};
+
+				opp-274000000 {
+					opp-hz = /bits/ 64 <274000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1_1>;
+					opp-peak-kBps = <5285156>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xe82f5ffd>;
+				};
+
+				opp-222000000 {
+					opp-hz = /bits/ 64 <222000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
+					opp-peak-kBps = <2136718>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xe82f5ffd>;
+				};
+
+				opp-190000000 {
+					opp-hz = /bits/ 64 <190000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2_1>;
+					opp-peak-kBps = <2136718>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xe82f5ffd>;
+				};
+
+				opp-157000000 {
+					opp-hz = /bits/ 64 <157000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D3>;
+					opp-peak-kBps = <2136718>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xe82f5ffd>;
+				};
+
+				opp-125000000 {
+					opp-hz = /bits/ 64 <125000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D3_0>;
+					opp-peak-kBps = <2136718>;
+					opp-supported-hw = <0x0f>;
+					qcom,opp-acd-level = <0xe82f5ffd>;
+				};
+			};
+		};
+
 		gxclkctl: clock-controller@3d64000 {
 			compatible = "qcom,maili-gxclkctl", "qcom,kaanapali-gxclkctl";
 			reg = <0x0 0x03d64000 0x0 0x6000>;
@@ -3787,6 +4031,71 @@ gxclkctl: clock-controller@3d64000 {
 			#power-domain-cells = <1>;
 		};
 
+		gmu: gmu@3d6c000 {
+			compatible = "qcom,adreno-gmu-845.0", "qcom,adreno-gmu";
+			reg = <0x0 0x03d6c000 0x0 0x32000>;
+			reg-names = "gmu";
+
+			interrupts = <GIC_ESPI 368 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_ESPI 369 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hfi", "gmu";
+
+			clocks = <&gpucc GPU_CC_CX_GMU_CLK>,
+				 <&gpucc GPU_CC_CXO_CLK>,
+				 <&gpucc GPU_CC_GPU_SMMU_VOTE_CLK>,
+				 <&gpucc GPU_CC_AHB_CLK>,
+				 <&gpucc GPU_CC_MXG_AHB_CLK>,
+				 <&gpucc GPU_CC_HUB_CX_INT_CLK>;
+			clock-names = "gmu",
+				      "cxo",
+				      "smmu_vote",
+				      "ahb",
+				      "mxg_ahb",
+				      "hub";
+
+			power-domains = <&gpucc GPU_CC_CX_GDSC>,
+					<&gxclkctl GX_CLKCTL_GX_GDSC>,
+					<&gpucc GPU_CC_MXG_GDSC>;
+			power-domain-names = "cx",
+					     "gx",
+					     "gmu_mx";
+
+			iommus = <&adreno_smmu 5 0x0>;
+
+			qcom,qmp = <&aoss_qmp>;
+
+			operating-points-v2 = <&gmu_opp_table>;
+
+			gmu_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-556000000 {
+					opp-hz = /bits/ 64 <556000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D3>;
+				};
+
+				opp-788000000 {
+					opp-hz = /bits/ 64 <788000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
+				};
+
+				opp-825000000 {
+					opp-hz = /bits/ 64 <825000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
+				};
+
+				opp-880000000 {
+					opp-hz = /bits/ 64 <880000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO>;
+				};
+
+				opp-917000000 {
+					opp-hz = /bits/ 64 <917000000>;
+					opp-level = <RPMH_REGULATOR_LEVEL_TURBO_L1>;
+				};
+			};
+		};
+
 		gpucc: clock-controller@3d90000 {
 			compatible = "qcom,maili-gpucc";
 			reg = <0x0 0x03d90000 0x0 0x9800>;

-- 
2.55.0

