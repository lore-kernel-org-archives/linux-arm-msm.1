Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B3C3F8246
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 10:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786012486; cv=none; b=sXusjrMe8CxxbYXwTdDFFnf6iOSfb4bKwbGsHPV9xR/TIAEFOG32wgJbRM6sNlJKbhRQd8QZ/Ux7ll6DQxEm5S/rBGQzGGWXN93afLrnTjya24wwaxH7/oTlPwkID89Zj76DmLhP6w10ANJGP10yRKD6R4Hpzn6MPAWyV9xqO50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786012486; c=relaxed/simple;
	bh=ajWKSb18ow1K9X/7qdr7eRnazLDVnHG9HgkLtV6v9dI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gEZHgC7tXbZ2XcNXZkWtkHHp4g15kl+q63Vcc8KA+g3hhC9v5C+Ln8UhTJyo8HV+0atslifS3SKMTS7wAWqZqPJoxxZFKHLGQkU6Hs4AcRhBOOcfFDEHstQ/QhPtsu/4n03QrjdqhkXK/Zq54qm4QFdDzEyStvY616+YK//15H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kIUVcA4U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c1oCVS38; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kIUVcA4U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c1oCVS38"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nfB22724665
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 10:34:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0+DaEi9tZFH7+WbTZzJJhm6BRZ00c9mpRzL/KVHxRUA=; b=kIUVcA4U5LN0GORQ
	4c2QAL9bZIUlCdPy0vuK5NqcfVguc74Fu7TSad1DKqkpZnHTJPcatgLn4GRNew8m
	fE9Us1/QLcWbWxI+qV30l+/LoTeVvHW/JS478vl5To43+xfdyZadRRVHCYwP7ikL
	bYVVgfmy9YaOipko4t4vOR1g6FQetTC9vz4QfElTo/1B30D1DWWAolUNCWIC5x56
	2rthSH6OG+WmH9V8zQFomyMDkZqIWZDTxTtK+0ddOmFnS1zr8sDT2DWOPeZVyh4q
	lNwAyMAps3U6Gjif9FDg7zpJMEcR9EKKigmZqnAVAMiRkCYwvB3/1zGnzZnYZgLH
	UaT2gg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fv9dmkqv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 10:34:44 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8486ffba174so4490407b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 03:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786012484; x=1786617284; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0+DaEi9tZFH7+WbTZzJJhm6BRZ00c9mpRzL/KVHxRUA=;
        b=c1oCVS389fpADEMmpb5tFZJtZqStKH2I73z5YtRNl+r7uSJAayiAHwmMegzLbkVlKd
         DAYMOYFlGcSQ9G08RCOyL/4pxXlS88S4ZPDFeeBWPjPISUr2B7UcMHprTwRILJD289K9
         waqnwPew62Xmud0ZpI5xSCuWdwtlVgeJxO3ArZLlmfW4giKSqYzesCuOth0to5E2oR02
         taqLIqfZ5oTaUY1TA0T2obJ3miDNeig/c5f3oCGD7j/9xb0fIEV0UeI2etjds8a+t1eF
         8Oonm1MWHREBlYuA/PSGOJV0UfssPyAznEYgDfsktE++iRnjxbh3cww+dyPe0gnrv/3J
         vd8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786012484; x=1786617284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0+DaEi9tZFH7+WbTZzJJhm6BRZ00c9mpRzL/KVHxRUA=;
        b=rDfweLvj+d/ZPg5lCsP8pYn/j3KMycAr8Kr+tdATiBjrxyfC/w67uTI+0oGXzJr1EI
         KZMtl6IrbdFacogkTmrtjc5KHuP6n3ps5IYiQkkkV0zlfWRRGeMoycBUhnxZw0eH7vIl
         hXtEhxApT+6xu+1w2AcSAherwomivwen+nymrzVmbV9E7rBzSas/c/Pl1YVKJKBeWCsC
         6DW5bjLjZjlS2RorwJGTEhIwKLtu4Jjgda8dzGnxojzFgTNdNs9QJeun9+bOojhzrncA
         H3pQau+PA+Fac1y7so9/ztrdHQd/4CY132LKkDLFSiUtV+jOL5iDFMEdXWP8zkVAifjz
         PbvA==
X-Forwarded-Encrypted: i=1; AHgh+RodVIW1KePjbfYjpUMQKFT7SstT1UibQpNBJC3Yuy3bSro0X/QDfcEBfXk3hp/eW3vzn9NeO+j5e3Sv2ITU@vger.kernel.org
X-Gm-Message-State: AOJu0YwU3DxFnpvwPOVRVhj6uWIcWPK9ve0g29vapCA3E+Db84O0NvbW
	US85tZs281mavCfS62OsNRlQ89Fd3+KxhLHsjR2K53o0L0BETKt5FZhO6BqmnAm5Ah2W+B58S5c
	XO1hWvd8piknaX+epeJQI/uLV3IlyEBWdMkhuhpUhR/9JTQN/upPRf+TYaTh8nhN+vGT1
X-Gm-Gg: AR+sD13hWUfiPtdrCpiUdd9LO9cSer7DySXkyGOz+g/NOP7h355/kmnwksZ+XQmgq2E
	ZdBIqLb/dJb8InhUtozimDiD/sgHP7WbbEeQSgMc4L7STwYvLPMiXpazXjWKmLdEWBbkDey7eog
	n9+++YHWoyxA/vHUVSktJ7mYaKPADoxbC4/cHf/9LCDGualKIO53SrwFnX6Qw6moVBtoCcTx6iV
	NN3ja7unZO4xW43kouJ4pPs6srNVO4b55M2Ke1KLP2wDA4OnOXYFN4Lu9lgYYZAxbTPmOR6c17P
	KWGSgErK3+rFGo8sYCSXvlaM4g4Xv82zTenYXpzisM6kCZjd9TD3DhS4Gc6rgbAuCFmXv/RsZOG
	ZWANKf6B97GeIXEZ9whVycXj9
X-Received: by 2002:a05:6a00:a247:b0:845:4126:222b with SMTP id d2e1a72fcca58-84f2e00ea1amr17821002b3a.28.1786012483556;
        Thu, 06 Aug 2026 03:34:43 -0700 (PDT)
X-Received: by 2002:a05:6a00:a247:b0:845:4126:222b with SMTP id d2e1a72fcca58-84f2e00ea1amr17820877b3a.28.1786012483038;
        Thu, 06 Aug 2026 03:34:43 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45389e5bsm1141098b3a.1.2026.08.06.03.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:34:42 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 16:04:08 +0530
Subject: [PATCH v10 03/10] arm64: dts: qcom: milos: Add power-domains for
 camcc and videocc
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-eliza-mm-cc-v9-v10-3-6ba52dd14343@oss.qualcomm.com>
References: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
In-Reply-To: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Authority-Analysis: v=2.4 cv=TJR1jVla c=1 sm=1 tr=0 ts=6a746344 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=zrNp7rCLQDew2w7GYOsA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: C_mfp1OCWLP7rblgsFQKZFiNsoWosie2
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfXxLGSAZvw0VIn
 6JAArmXPCfPPRLhuuSdMbMWweROpbUMJsNI/rXTh+x3vYZPLkD3u+5iIZjCVrUGkWUicR45dL8F
 whLvBosS7RT/6UxbxGVoVH2K0qbpemc=
X-Proofpoint-ORIG-GUID: C_mfp1OCWLP7rblgsFQKZFiNsoWosie2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfXyp8Sd2Areksk
 d6IXgKLrb9DgScsLN7InENg4R8PPpAN6k34CQ2FJJ/MetXRlceNDck1b0CBMWJPmX3uLWWv56kC
 Aim9E+47PrVWjdQR58E3gd+5moJ5NlKorBMi2/xHdyhxPQ4DYXLb7U5QsgM3kec6pQDtaCR8739
 AmSqYZE0mh0ngYt3zzz+3+zcmGhwM448M7R1t3l68H3A/gjvCunx4X+kJoOpH3WpAZZlPs+PPzR
 JGllHL7HUNRgwkCMvZLExIUZvSo75STaqLRSb2LMure+vDN3qf29naJFBUXv4Z8kTZLsC4MFE9M
 RbyUB5VLrsKlC1Bxk7DGJHvtYhJdxHV4t4ClGFwZhho9H3sYyfZb3ZjrU9NyDGJc0fbNILX7Yr7
 DSWlV2CKmnBsGM85vIboFIQ0MZxs9GXgx43JP/BZy0KNWm0l8GB5eLnU2vtSWza8X8CrcCufbSD
 0iM1jARfjyyN0bhf7HQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060082

The Milos camera and video clock controllers operate on the CX and MX
power rails, and require these power domains along with their
associated performance state votes to be specified for accessing the
clock controller and its GDSC. Add the 'power-domains' and
'required-opps' properties to the camcc and videocc nodes.

Fixes: d9d59d105f98 ("arm64: dts: qcom: Add initial Milos dtsi")
Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/milos.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos.dtsi b/arch/arm64/boot/dts/qcom/milos.dtsi
index aad8bf6789162f5dcabbb7d4a8efe180f86d4b46..f3af1d759e09837de457522af47c74431e8d3fdc 100644
--- a/arch/arm64/boot/dts/qcom/milos.dtsi
+++ b/arch/arm64/boot/dts/qcom/milos.dtsi
@@ -1949,6 +1949,11 @@ videocc: clock-controller@aaf0000 {
 				 <&sleep_clk>,
 				 <&gcc GCC_VIDEO_AHB_CLK>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>,
+				<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+				<&rpmhpd_opp_low_svs>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
@@ -2031,6 +2036,11 @@ camcc: clock-controller@adb0000 {
 			interconnects = <&mmss_noc MASTER_CAMNOC_HF QCOM_ICC_TAG_ALWAYS
 					 &mmss_noc SLAVE_MNOC_HF_MEM_NOC QCOM_ICC_TAG_ALWAYS>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>,
+				<&rpmhpd RPMHPD_MX>;
+			required-opps = <&rpmhpd_opp_low_svs>,
+				<&rpmhpd_opp_low_svs>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.34.1

