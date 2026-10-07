Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0234D17BA
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 17:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791393228; cv=none; b=NwrNJEiq4k/iJ0D0u+2LfGZuO/mK3HQjF5lud8zBbCOSpI0bERXcLVuG8oC1O6Vf1+FTpPA3mIn8dNGNyjNxzn/j/84kW8NAhZpoiwLJiz6+TZT9EqeJWhGbFJz3j5w7+1dULK6itj/mUPAdOZSAJgbwlzH23YBcataKrAJIDw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791393228; c=relaxed/simple;
	bh=mQpcXGi6W0R5kfqzYup4R1patFpyBQf4cTe6pZfPMgE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hJJk3rZrzjtFdGpJNA+/MxsNCzdoNbMJ/Bg+BhoDVKyEPJFL80c3VMoyIomx1fxCBWgUh+zmXg0rRL9bEZi4yQ0Fx8KaFaPr7w5KZAauZDt902mriqFHYFp7sv1UvSvlQtB0fvD7QMHkcqY5FX/aiYMVu1Qd1y+PL0SH5YsVXiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JOrWObpp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jyVMNgWM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JOrWObpp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jyVMNgWM"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697EtNAh4135625
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 17:13:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NsUl3Havz/JIP4I1LoQMq0DuwUH1IupZVrtJEHCx2ms=; b=JOrWObppZXZlsI+8
	MLs4qBFM4tBBqFfIPaBz9QiQJY1OgdQltS3+CdL0KrdEJughBvYd2//gwKWXrHnQ
	eyWwPVtRr6RAoz9EfrbSDgWHuQqEc61zmQQWb2w4d6qpZzhg5XoL6HbZGP662t+p
	+9gcMyKmlOC/68QVJYLz0gWIUplmLbdqpHqosfnZcJcUnBK2rle3l7eDQIzRBqOm
	OSgoU9nju7mG/ut0Owuk+z4yVCdZFTUb5vt9iRaNDeGDYQFkChtI5X9IPiV2y2k9
	LVCGUF9j5WyOWyTXdwcsgDG5zgCMfaJ8rMrT+cN7cIeHtbHwjhfAh4aiFeTFKwdt
	ZQ2YOg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5mgr9jga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 17:13:45 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2dc7337e2a7so43398925ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 10:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791393225; x=1791998025; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NsUl3Havz/JIP4I1LoQMq0DuwUH1IupZVrtJEHCx2ms=;
        b=jyVMNgWMfmepbgwSTgJJBr/NcDM7qZo/psIMjshXn+LbI/xvk+5e7ypB+cwC6y37n8
         p2dsHgYwyEjI3rZoM6/PtglOp9APTeug347Gelr+3/YQX7zidBxJRHk7WS3Ey1Glffqn
         hdZ00PzzKTmSGqy08JnDJ04mF5CqgdfKmIY48rH8n8D+pVjg+BWGE1AThHjHbrkBG+wJ
         xB40Cpfqe+tsQxf+aIIhtJ8Ub0Z7ElRIoPa7EtDNqWCahpTGAMDnywgnbGNKCY2CYmHS
         9yTrbYQjvh9/3uunxp2bPQIlbC/n5D3rTEzvdu7w27tKNYzVSgbJCNtXNae9gKgM+zXt
         4K8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791393225; x=1791998025;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NsUl3Havz/JIP4I1LoQMq0DuwUH1IupZVrtJEHCx2ms=;
        b=zV7sP1qaqSz6oUgog2KWdn3aq+xwf4GIePtK2s+P26hifSSPghuY7fRfHbyQDAfwM0
         8+YZleLmCZmlQ+1Cwp1a0KpGADehkq65uf5PRnOZxsTG2+xWs9oeyeB9kuGZM50uQynS
         kGEyd1XqzzzGC6V6Oa7c0hkMruhFM6LirvuDd5myiwlRbzaEcYrc4si0cT+1fG+VMvV7
         gz4TTICEMpcz3K61XDwOESP6Cb+hsgtSHf8zysJoBO6prCq2p0cu+QLV7YcLSRwKSqVN
         V3oM0Q5M7akxlOzAdv9Pj05s/lZLRUC8H0b+7qLDPgo4c2SJQTUGiwFtD1ko1+KGk0Jk
         E+Gg==
X-Forwarded-Encrypted: i=1; AKwUvByEADPer9fpVWFBOc2mTchUDXybhKO/qx4WVr2doAa/YUazLOvaEhEk/zCHQVPNg8Fdqefq9kBfhCAUKLwx@vger.kernel.org
X-Gm-Message-State: AFq9FYKj6QvBPvKA7gGhuyoOXk5vxubsjk8XNKS7kZsvQ62jA/sG+LXj
	KK8u3lfTF5eGZEX7ZIrRibAKXEko/okehB3515wkCeFsME2BOkXt+Asp8jDW5515l3fIjSlOxun
	n2CgKtrydbC1fZHyJbVs7uRRHSGRhAC+1HrwasMuqw96R3A70sAhWSJee2QrtHd0LXEzl
X-Gm-Gg: AYBFou1LWnXk+OzfAUai2pmxQ4fRuw8UA/oO4qx1CE67fGVC1YOrnvdB6/RRdtKwEJC
	yaHJBmhz1ClLsOUzi+xBCFLodJJJpOmOrpftCmKlOpnv/ClGXlYOka1L+5+q/F/oeFyHXR1/u5W
	Dq5eUDUvAzdMpZ9N0hk1cGoV3e3j0bbMfFwKd0GPgB4seb2shu+5bNAAb17N+BYa+rqtC2y7USP
	HZj9fYGV6aATB3ng/1eOmcdhK2cm0rSPQIw4/4nAhwCZvZXeF6pBoitrzLW/H0V7095RZkDpkQ+
	GpNzJEUT2q9j3u3lFWQgxRGzB1+RMN3+RjW2+pLeY+/VhBN8VcjNKc1Z5zK2JGs9f1Nl+FIUWcv
	Kto0F6l4Pz3RfMdTAn9YOb3noU9+eTyX6
X-Received: by 2002:a17:90b:4b88:b0:3a0:d7e4:c4bd with SMTP id 98e67ed59e1d1-3a8a1cae841mr2585820a91.60.1791393224932;
        Wed, 07 Oct 2026 10:13:44 -0700 (PDT)
X-Received: by 2002:a17:90b:4b88:b0:3a0:d7e4:c4bd with SMTP id 98e67ed59e1d1-3a8a1cae841mr2585791a91.60.1791393224375;
        Wed, 07 Oct 2026 10:13:44 -0700 (PDT)
Received: from hu-vkatoch-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3aa0cbccea3sm303304a91.15.2026.10.07.10.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 10:13:43 -0700 (PDT)
From: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 22:43:20 +0530
Subject: [PATCH v2 2/2] arm64: dts: qcom: glymur: add CDSP FastRPC extended
 context bank
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-extended-mapping-dts-v2-2-fa9e14900313@oss.qualcomm.com>
References: <20261007-extended-mapping-dts-v2-0-fa9e14900313@oss.qualcomm.com>
In-Reply-To: <20261007-extended-mapping-dts-v2-0-fa9e14900313@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Bharath Kumar <bkumar@qti.qualcomm.com>,
        Chenna Kesava Raju <chennak@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791393209; l=4403;
 i=vinayak.katoch@oss.qualcomm.com; s=20260609; h=from:subject:message-id;
 bh=mQpcXGi6W0R5kfqzYup4R1patFpyBQf4cTe6pZfPMgE=;
 b=+JhFhwQLx1mNEQlzPmBQIq+Z3CRZFH6RI+qbaDoEJXXMFhAnxt8/w0xoA6vSk09qtsdP1zq2n
 6lLIw6z9kt1CweQTqxhQGJ97X6DdWGYU/CwfQrscyJ2xAftm9PvJGkU
X-Developer-Key: i=vinayak.katoch@oss.qualcomm.com; a=ed25519;
 pk=UrGeKKxjIjpHZIjsbQKS/8rrVaP9KVGki69pFclCH08=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA2NyBTYWx0ZWRfXyw+rByrgWEZx
 prVOQla+e0PivwwpD2shwBgTWnQTU+9fvTzfPbQfagCmvuscPZpPEAzzHgmmwYQp/cH90gGzxZ3
 +A53POEGHa1AXF81IY/5jfBQnJtpUYc8M+mnqezzhOO1E3FQVhTAUvPihf8snpl8plMpbw9OevE
 gKSOaiikOdJdNBektENRJeZi2BzqJXKx3VQOcQ0U9MT3r23LRIzQ+9xXcxtGGVxeIH9qUbJcO3H
 ng51mMa1fUTiZQSWqIkotytRKji8GuQSvfvOKtUc5ejwckUJ9joHLeI1nPZGJfJUV2k0aKFaJFo
 iCRd+nkaMzcOgQQpG0SpUWpp1qyyMhYfY6jhrlVXId1Nu8Dni42Etfwt+YaFojUP9RQb3jyRmPH
 1UKI+DqhSTmvs7lWQ+UrJQzgBRmUiEdp5ayVWJoMnxzQZ+p+xlXFX6sAyJ4nd9hJAxpxc2e/d0i
 8UmppEn/ytSZ6HIdaWw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA2NyBTYWx0ZWRfX+q5LnBYusACs
 MneP89Ssj0WKBZ1HhiMVd9OajLnCgx1yeelz6Fr9Ab+xe6SACyiJJLwoBTQwzRLtbm7BxaHzjaE
 rYgt34AANQ3lmqGjAHp373+MqrQGxnE=
X-Proofpoint-ORIG-GUID: L1EjbnxRMUnZJzbe7nj_OIn-tuttIINM
X-Proofpoint-GUID: L1EjbnxRMUnZJzbe7nj_OIn-tuttIINM
X-Authority-Analysis: v=2.4 cv=OYkNnRTY c=1 sm=1 tr=0 ts=6ac67dc9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Eg_51P1V4iClgTwtoi0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070067

Wire up compute-cb@12 as the dedicated extended IOVA context bank by
adding iommu-ranges = <0x4 0x0 0xfc 0x0>, restricting allocations to
the [16 GiB, ~1 TiB) window. This allows large CDSP buffers to be
mapped beyond the standard 34-bit limit.

Bump #address-cells and #size-cells to <2> on the fastrpc and glink
ancestor nodes to accommodate 64-bit iommu-ranges values, and update
all compute-cb reg entries to the four-cell format accordingly.

Signed-off-by: Vinayak Katoch <vinayak.katoch@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 65a398c0a992..556867fbf197 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -8462,6 +8462,8 @@ remoteproc_cdsp: remoteproc@32300000 {
 			qcom,qmp = <&aoss_qmp>;
 			qcom,smem-states = <&smp2p_cdsp_out 0>;
 			qcom,smem-state-names = "stop";
+			#address-cells = <2>;
+			#size-cells = <2>;
 
 			status = "disabled";
 
@@ -8473,17 +8475,19 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 						IPCC_MPROC_SIGNAL_GLINK_QMP>;
 				qcom,remote-pid = <5>;
 				label = "cdsp";
+				#address-cells = <2>;
+				#size-cells = <2>;
 
 				fastrpc {
 					compatible = "qcom,glymur-fastrpc", "qcom,kaanapali-fastrpc";
 					qcom,glink-channels = "fastrpcglink-apps-dsp";
 					label = "cdsp";
-					#address-cells = <1>;
-					#size-cells = <0>;
+					#address-cells = <2>;
+					#size-cells = <2>;
 
 					compute-cb@1 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <1>;
+						reg = <0x0 0x1 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x2401 0x440>,
 							 <&apps_smmu 0x1961 0x0>,
@@ -8493,7 +8497,7 @@ compute-cb@1 {
 
 					compute-cb@2 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <2>;
+						reg = <0x0 0x2 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x2402 0x440>,
 							 <&apps_smmu 0x1962 0x0>,
@@ -8503,7 +8507,7 @@ compute-cb@2 {
 
 					compute-cb@3 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <3>;
+						reg = <0x0 0x3 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x2403 0x440>,
 							 <&apps_smmu 0x1963 0x0>,
@@ -8513,7 +8517,7 @@ compute-cb@3 {
 
 					compute-cb@4 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <4>;
+						reg = <0x0 0x4 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x2404 0x440>,
 							 <&apps_smmu 0x1964 0x0>,
@@ -8523,7 +8527,7 @@ compute-cb@4 {
 
 					compute-cb@5 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <5>;
+						reg = <0x0 0x5 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x2405 0x440>,
 							 <&apps_smmu 0x1965 0x0>,
@@ -8533,7 +8537,7 @@ compute-cb@5 {
 
 					compute-cb@6 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <6>;
+						reg = <0x0 0x6 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x2406 0x440>,
 							 <&apps_smmu 0x1966 0x0>,
@@ -8543,7 +8547,7 @@ compute-cb@6 {
 
 					compute-cb@7 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <7>;
+						reg = <0x0 0x7 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x2407 0x440>,
 							 <&apps_smmu 0x1967 0x0>,
@@ -8553,7 +8557,7 @@ compute-cb@7 {
 
 					compute-cb@8 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <8>;
+						reg = <0x0 0x8 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x2408 0x440>,
 							 <&apps_smmu 0x1968 0x0>,
@@ -8565,7 +8569,7 @@ compute-cb@8 {
 
 					compute-cb@10 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <10>;
+						reg = <0x0 0xa 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x240c 0x440>,
 							 <&apps_smmu 0x196c 0x0>,
@@ -8575,7 +8579,7 @@ compute-cb@10 {
 
 					compute-cb@11 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <11>;
+						reg = <0x0 0xb 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x240d 0x440>,
 							 <&apps_smmu 0x196d 0x0>,
@@ -8585,11 +8589,12 @@ compute-cb@11 {
 
 					compute-cb@12 {
 						compatible = "qcom,fastrpc-compute-cb";
-						reg = <12>;
+						reg = <0x0 0xc 0x0 0x0>;
 
 						iommus = <&apps_smmu 0x240e 0x440>,
 							 <&apps_smmu 0x196e 0x0>,
 							 <&apps_smmu 0x19ce 0x0>;
+						iommu-ranges = <0x4 0x0 0xfc 0x0>;
 						dma-coherent;
 					};
 				};

-- 
2.34.1

