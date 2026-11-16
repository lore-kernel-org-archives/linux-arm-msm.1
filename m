Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819657;
	b=hF+cBCLf3ewQebToA+au1HGIlEYhqmLR8OoSKK4oD6Hd8tgFnqLDI45AENaBNYAUsboI
	 N88vtLmola7sb0ALxPVvZgVTMhubmq2mnSAYPN19Y+J1KG2BE8+7HiFNuwSBPkd5hDu18
	 +tddW04xfdBSa7yHs78BlFxExEbz9ipXqa7wAoalEPeHGknvPPUfjDu6x08qyxu+KVW/y
	 C1VpYUrltUO7uT1r+663c8xMlfIJpq99xBhDQacSx2T2XsQjmlGmdS9LvGvCyUncHDRxt
	 rrrkji0qOcQz0wM2W8WbTY/nhV6STDa0HBzyDvVU8N1C2eGy684znAWKjS68pzPAcEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819657;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=27K4feh3qym7raUaYT3JRfhq3pYm6YbJC7Kd12Fe6RM=;
	b=H3f8t7qVln1pvWmsCvkfuIIlAKmq73eQk/96dlPX+qLmVGdXt/ldrCqoKt6loW5c3M3+
	 UZTRU3uJUAOhbpvEuuts7uo33ZJz9pe7H85AlmNeyXMGg2pyLGMggSKL7TPdJGcLbmvYl
	 N7shbJDXYQI8B9MTDMLhfa8C81OYR+QxA9ZsFjcb69dKrv89kkMQ+MPnJ6rZHLEXhlHEj
	 +KqFDdW7CnFfek0RDtSyIeJ51Wj9vkTQQKUq3dfEjFeweNgCWQ28w0NhYfjDwSqQGp10K
	 KaYbHh0wDyviVjLwcQxCthZpSuP5l2CfGC2rQM6R0hHkX5KFzR1sUsQ7KjZugfbjo6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cuBHWLza;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dMfyRuuf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFDBB606A329
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 09:00:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFDBB606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cuBHWLza;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dMfyRuuf
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG8Tumi2650781
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 09:00:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	27K4feh3qym7raUaYT3JRfhq3pYm6YbJC7Kd12Fe6RM=; b=cuBHWLzab3S9cxil
	GCu+NrSE5S3uRepdZc7HL4WnbmISgetSMWzwctddIkA5FAcrvkOI3iX1eoKoXSd2
	g7uzdgCDkWaTG0YTXkfRpXF0UBUdx0bDhsqraqY6gjMpzPy3giTeA7y/OEhgswcL
	nwsM31/sMC1vgmjY4PcDa5s9zcSDkd9zJa0IdcoSzOjyFOi3ggnMd2rEBteBacm5
	iFuY7YRF2nNR66aJosdJQx5zm3y7qGEWtBauiyXvJ8I4WbUMbYS0CrriWfUaIjCt
	BtSGNICVZeL5FsqvRPo6j9fVLjsnEnDCXLcbT2E+IWI1OzauOVyvVodQi1btnuUA
	BPbejw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyxcf03m2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 09:00:47 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ae1d132d52so2554323a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 01:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794819647; x=1795424447; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=27K4feh3qym7raUaYT3JRfhq3pYm6YbJC7Kd12Fe6RM=;
        b=dMfyRuufJHLH5ntW7Dhy/WqrbG/w6yhOEwxWuoBirjBIHWUwDbsiF1THECRG7+jx0V
         8mjKmFgRguCoe5ILsZufW+D/r8C8ts5u0lztgTsx02ruTbReha0zRV7BEI9j8fWlOclP
         pb9CgbLp6jugPcWZtZjf7agQg+LGtR7Z80K+6Ff9QgX0riW0d1etkLu9X4fcTUnTv/Do
         ak5loPX3+uBEv2NP0IVYVxCAfT8meTRKmL3LfPU5BkLRBjMO4OiUsmQibbyVGnPgSwGN
         eCZBXE70Wv9lQoG5zX0WbOOBzsRbhzcYNZTbI0yZQdcCzMgnHG8+5ZaQAYmK1s5X3sah
         vl3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794819647; x=1795424447;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=27K4feh3qym7raUaYT3JRfhq3pYm6YbJC7Kd12Fe6RM=;
        b=VD593UUf4CYJQd4nS657n0VLYIBwGBDAEX0ANlMuyXcoOsglmiHQDJlz8V8XbfrQAS
         jolfjw4OsVUTpkPZj1Kub5tl8oV+z2Yctt4tZkznPxLcURcRa1Zdk1Fc98TDWepBKleo
         KPREclPQtostyN8aCZ0cNES7pTmP30DF9jgh4PAcCpwzXg2HRm7gQ2iUyalIaaLXsEHE
         wTH5VVdEbACwqOXtFpCwwEqHyIplx2XCpMVR70Qdo/uI20lUetOlvyytI5zfhxflS2cw
         OPIX2fX5gW+DcNQdEAXvAtUthsB9YJQwNOLfiyAxPDF0ZI0C0hfFYakoz27eB4VajXiL
         5Qlw==
X-Forwarded-Encrypted: i=1; AL+hErFzRId37wMnxhM3vqRR6bCfTAYJZ1LfqfiK98yUhZZIWRI62lD0jesjE8GYn6tMLTC0o6WQPov1V19uJWzZ@vger.kernel.org
X-Gm-Message-State: APuU4Z+FCEQzBG7yx5SZW7XfcwFi0bNt926HFYl07UZvTi23C1lUbbF1
	TIpa2ZDzQqnge3aDrimY1mTcKeuD5c3m4ZxO8gcw9BAA6sNLAi8ldRDhDV0MFPLVlaPmfwRrtWt
	OfqIaxZUITcg0HL3+3q3ELoKYpdiMVbhBYjd2zNtTYk9iv8FO+/f03yx2BSrUG7fmJiqfx/auEu
	X0
X-Gm-Gg: AZFdTZdQkxmnMtge0z4CBKN2ngMF1uktahJuA822amkX7WobKBw/e//0OCNH6nbolOC
	taWMpDsl4fec/BKcVXK9R/GlbWhpQbf2AEStvUI94wYM8OIm8uatuB+GUwuDvfz63rLJzwXpy4N
	2qATHGJjeT5QdS9bJr47fox4gI5nYlMYI9YuaW4eeUInWgGBw3DTJk7whjnS7TviqhIhMYFnOIW
	q3nUa+OIorr9HFC4OCM2WT5gPeThkxQuwPTBOj2CTGpXkf44kd88jdciN28OJExYdIP/qai1aKo
	xgj7+u3GvgSENW+Pq+i32S5J6VWqc3f2cxXSCV9xnZzyM5x8MGiM/ROBVJ1AEd6YIzlkNPbyE4x
	eaenno6MTcIN74ydBfD6kUjAD8z1c+7nDiZIKb/qOFOofaP4pmpPLFoVKU6DliV/sy1Bns3Y90o
	j8njLuMR4=
X-Received: by 2002:a17:90a:d883:b0:3a4:b74a:795c with SMTP id 98e67ed59e1d1-3b1b09f3b50mr9345822a91.16.1794819646675;
        Mon, 16 Nov 2026 01:00:46 -0800 (PST)
X-Received: by 2002:a17:90a:d883:b0:3a4:b74a:795c with SMTP id 98e67ed59e1d1-3b1b09f3b50mr9345778a91.16.1794819646038;
        Mon, 16 Nov 2026 01:00:46 -0800 (PST)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1aeb3d2d4sm15916632a91.7.2026.11.16.01.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:00:45 -0800 (PST)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 14:29:46 +0530
Subject: [PATCH v3 2/2] arm64: dts: qcom: shikra: Correct QCE node
 configuration
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-shikra_qce_fix-v3-2-9ae31470ef48@oss.qualcomm.com>
References: <20261116-shikra_qce_fix-v3-0-9ae31470ef48@oss.qualcomm.com>
In-Reply-To: <20261116-shikra_qce_fix-v3-0-9ae31470ef48@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAzNSBTYWx0ZWRfX0HWwDcjO+C/l
 1uG6HTjhmABMrColdWyWduL2zY3NZjvmhxXguFKNiBJKRThyql7WV3uvw5THPGCZ50rwbO8EeNn
 n7GZK2XVv2jYgPfIdnLCcLdngzXM5KF7WVZlHBOvXfsvrJqhpTVJnv0Z4j73+78g0HOU/hBzFPg
 Cong28oi2pqWvUe3oLuBXZXnbBbKnS/KUK5F0mPDqSdVfJ+yMUXaw7hnPbR9+1IgQrvKOAvfmDm
 59lwkBarLyfmR+GNPY+l/oXmHXfII24XDSO3cuYilmZ7uGAF1G4dlzboObvSFrw1tlkM1IQqS+r
 g2KdVgt/xSSKP+/sUZ0Y6PNA1gvWnCYf+1r4jexDxdkM+W5BoLBGjXATBHl3xvlwJi9bOovIJzS
 Qzgp509BINLd/M8pmAibIY+wHJEHyJK+MdGUSe1iAbu3uOCKyxotT8Nc9puKOT8chYWar/9CHCe
 LApxRggNvB9XRVRRxLQ==
X-Authority-Analysis: v=2.4 cv=RtZQvymK c=1 sm=1 tr=0 ts=6afac63f cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=edzx39f0doCTOIfZxx8A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAzNSBTYWx0ZWRfX/yWaIC9XHnI9
 8KczDylCKuv+7xzpp5GnSL3C/2VYpyuvzPF63zyNKLtpFAU3LF+LUtAptzCZblvEFdi5EgnsQPF
 belLrZkNOCl27rttWGoo+W09jnFjzeI=
X-Proofpoint-ORIG-GUID: V3ZT7bwf7WNsqXGZKO_1XGU1myQMZmWT
X-Proofpoint-GUID: V3ZT7bwf7WNsqXGZKO_1XGU1myQMZmWT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160035

Shikra QCE requires an explicit core clock, which is missing from the
current configuration. Adjust fallback compatible to "qcom,ipq4019-qce"
and specify core clock to match updated binding description.
The crypto interconnect path is already described by SCM node, which
votes for MASTER_CRYPTO_CORE0. Drop the duplicate interconnect vote from
the QCE node.

Cryptobam is controlled remotely and its clocks are therefore managed by
remote crypto subsystem.

Fixes: 099cd05d200b ("arm64: dts: qcom: shikra: Add ICE, TRNG and QCE nodes")
Tested-by: Wenjia Zhang <wenjia.zhang@oss.qualcomm.com> #on shikra device
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index 0a95ad5a5582..d5f0ef863173 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -1208,7 +1208,7 @@ cryptobam: dma-controller@1b04000 {
 		};
 
 		crypto: crypto@1b3a000 {
-			compatible = "qcom,shikra-qce", "qcom,sm8150-qce", "qcom,qce";
+			compatible = "qcom,shikra-qce", "qcom,ipq4019-qce", "qcom,qce";
 			reg = <0x0 0x01b3a000 0x0 0x6000>;
 			dmas = <&cryptobam 4>, <&cryptobam 5>;
 			dma-names = "rx", "tx";
@@ -1219,9 +1219,8 @@ crypto: crypto@1b3a000 {
 				 <&apps_smmu 0x96 0x0011>,
 				 <&apps_smmu 0x98 0x0001>,
 				 <&apps_smmu 0x9f 0x0>;
-			interconnects = <&system_noc MASTER_CRYPTO_CORE0 0
-					 &mc_virt SLAVE_EBI_CH0 0>;
-			interconnect-names = "memory";
+			clocks = <&rpmcc RPM_SMD_CE1_CLK>;
+			clock-names = "core";
 		};
 
 		qfprom: efuse@1b44000 {

-- 
2.34.1

