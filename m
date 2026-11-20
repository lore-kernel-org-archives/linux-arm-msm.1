Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182218;
	b=gAulT4tnsTz1/0KMxfh4GpWQlArBJJrLoSw0ccesjm59llYy1FThxkCS2uMqz8w5N9mq
	 l6h6so/ks8gV7u59i7NeqILSmMJUNSDFre7UyezOaOkOdD9hs7AN3ec03bBc2ZtPkOI7T
	 2ALBD5+qoW39knDVBzQ+dcNWRGj603k1QnbkbJgXd6z9oxQWHX8Eqt4ybBpUlgtRpYzDx
	 0Mgf3vUKoIy792IJ9F8UMZkj0/wBIIV40dEdFcvTTj7wasL7G59w6ORAaScANKFEHR4Sj
	 obO4dgS9/6hN1LxU8CRuAVHz6RJtoFRAHVmPNwRTQZqUbH9pRnfnNT0XYeSTdDuy+uw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182218;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8tfQIoAmhbhI9PfFkSH+gD38a+UHNrkbahcyNoUO4os=;
	b=pmADMCSQiaxh8yJG7AZXxms85DvPcZeMgianXMi9dKlrtH2kPy1IhDKjbNsQZM7bDy1o
	 rAPxPgXYblsu1b6oY+Ec4HzcCQVUcqdGx4ZMW49sQkRBFURMcC6zO+z08ML40GOOVkwPC
	 2cwO5uctk77tSRy+sMQBwDSz1WjHDz5sbTuR3rVekDTjImsira5m0iMNuuK2xcne8yZyL
	 LXl6pdwSBIjTIxTPnV9KhjGD035P0Rj3V5PNGe4CDH11qdJw6bvK7FxACopeCpBplRsKe
	 RCcKfSRdU3eA7KAzBFN0vrDjFXFnzdG0jG5VdDkblkBI4eGXIubBinU+yJ97eEdcJsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EXt6C3VQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IN4u26fe;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B24360A380D
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:43:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B24360A380D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EXt6C3VQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IN4u26fe
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAjwjI2155219
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:43:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8tfQIoAmhbhI9PfFkSH+gD38a+UHNrkbahcyNoUO4os=; b=EXt6C3VQ2JcShR7T
	GVvfexU5Hiyo2njDSWXR6umb14gkkqVudyIg/z7liTj39vlPur6P673EpvYgfbLA
	LWTynnvFsGDvqiaRUUpCjyetduEDpW5XG9L/hqPOnUcJxpEMWSQCnq3yALzxGkPO
	8vTxI5nz2WdAMFybi03wUULzRClJLaUUeZpFSwVQ+lvWLfdfBxcucJi/giTunp6g
	Nb0iI++HuTV4+ZAMKJLE/xOFqiO3SEH0gLJUzNtsfDQDWX2MWzll4GDONQEt3sYf
	bfMJDqVehLWDoPkidDIDwg8LT5TXJ91fhQ0ZrzVT3Wgv2xqaquTYU1ff8aK0tafb
	SoLK6Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2f4yj5b9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:43:37 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-375bac6bd21so993549eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 05:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182216; x=1795787016; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8tfQIoAmhbhI9PfFkSH+gD38a+UHNrkbahcyNoUO4os=;
        b=IN4u26feLl12W2KkAR65NB7AaLjV5PdbGLD91mGgo+vp9+QDlZTq4+g6NJFhk5rA41
         FJ5D3FFvEN0C1Qu95sb2pwYnItxIxlGONa//825Rx/EO3Sady6uurTznm6LFk12MsYCw
         8zTvvgENJYisvU3T5Ww3+H/ZymG8HAzVzqjHWeuS5GjAld/cOTT0PvHw1qcktLOQeoRW
         +jce6eDdLKbWJHkQExcSTg2CweptetPM4NnTz67Y24xDDaujnF/RWajTCkk1fKGy/K8c
         pwKtLvnBRk1wRu+KuXHwRnn0OfdTEtdFZ5uADF7/eyrwQHT6rULmPiOUA7kN1Y5w/xz/
         WyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182216; x=1795787016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8tfQIoAmhbhI9PfFkSH+gD38a+UHNrkbahcyNoUO4os=;
        b=zsRZYft3M62EiBHWYXXD48M9aF55pb+JtKGMOB6XZyoUyc4WbAQYAk167OJjSsRBHk
         4ThfBqJxq1EVclZvv/hCDWtz845ZnsIhgUYoBD4Ql/waaSA7MkS8QyOi3JdCsvPCm5pP
         a8z1vr//FJROYNyZFDVofLYtUVCYdjbmV4QEOkZLztDXf7VTbZKa1chEIlShW+yNia6g
         Vf2v3WoTZ3oWzZq/ThaKL9sQtVj7151YT4n17ewhpu3A7JuZAtnChIx7SXhSU+kkVmeh
         69LrcAf+mVlBwgpgT7pc/1AJoZDcRuorIhvvvVEUIgiHLydqsZTntl2/ZjNIhokX6rPJ
         0MNw==
X-Forwarded-Encrypted: i=1; AL+hErHbtLCQm5pqrD59f9r/kL++yRebFHtjG9/Lx/SfoDZy46uh0wGgiy5F3b3nih+5+MjATZeheooOeX2yBeWI@vger.kernel.org
X-Gm-Message-State: APuU4Z9DBW/EBFE4rd8UYVlidiAhK2EkI9itbpKuzTtFj4h+oJL9ZX40
	mcmWKy6lPiqPMhDoPS2dOZKLWKIG3bGcARi7b9JmUuaD5i2v5+IMP/DKGvFdrzq3x/AyFzn4qh/
	Iu4ql5z/T+DWCErxtl6fwqLiIakDfIQBkn8YQKLdhqqc8mjqX/srm2Z8y63Wnoo64niPdowU32t
	+G
X-Gm-Gg: AZFdTZc70jpl9cjJCwZehDW0gFV2QJ0nYlzoKFj3Ctg9uNLNqRa1BkOSAkrnj52pGVD
	lJ6mbb1exSM6dPQh2giS9iE2TzfMQRvocP/YInjY2M/kodNarfvKuaQ7OymXP+OrSLBwPwwFGzA
	ytnfQUNoJtwlLywDWOTtGlznM424ysxWsUe/MWiXq1Hiq5qr6ue3vbvBxoGUmgItUSgxQCG5isj
	4oq8dhDy1wLjXf3+O06OPovjHp2rChOKUujdYyL2ZQcMKs2SQxZws5YBzdKUrdUKbEcas2VuNoA
	8YVBMq+8A02mMxzmTPx1Pek/TsfUvfucf0aRzpwFiJC1LAnQEQsTCa1p9q0FGLY1gZgxThhAL+w
	xv8Wf/rodM5Gd7n9sZaTteEJwCMiqioce02wmwGPKlykAgCRu0z2YztFf/Vsj8c8M6MnDivGnwo
	hiSjw=
X-Received: by 2002:a05:7301:7187:b0:386:bd8:7abb with SMTP id 5a478bee46e88-3860bd889c6mr1578885eec.11.1795182215828;
        Fri, 20 Nov 2026 05:43:35 -0800 (PST)
X-Received: by 2002:a05:7301:7187:b0:386:bd8:7abb with SMTP id 5a478bee46e88-3860bd889c6mr1578832eec.11.1795182214992;
        Fri, 20 Nov 2026 05:43:34 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:34 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:44 +0530
Subject: [PATCH RESEND v4 13/20] arm64: dts: qcom: sm8550: Add GEM_NOC
 interconnect for adreno SMMU
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
Message-Id: <20261120-smmu_interconnect_addition-v4-13-be30526391d9@oss.qualcomm.com>
References: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
In-Reply-To: <20261120-smmu_interconnect_addition-v4-0-be30526391d9@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1041;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=n4/9ykaP1GAiqJF0FkMOaaqLHTN1pKjv/oqRYjt++ng=;
 b=726DhEZpUXUvkLPxl67ZyaCjxVgALzXfrEUAVeS40RGbSp26vuIM9fAEcFJifZWD60gu4TCqB
 n9AYxnZOgJaA2zhyZOUOVTdcErENn2P3TCPi4ghxJuXbnRzIXYESNkX
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Authority-Analysis: v=2.4 cv=Zs54uN7G c=1 sm=1 tr=0 ts=6b004e89 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=JoDS-ckYLr40ggPBIxEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX90vxjPgOnU3K
 EcY+YguShUS1nGTmhJBNPvCOZhNkeGjOEiwr2vQ68etL6VwPEjeeVgww+B5f38Gf4aDsY8iXpxS
 08nUzFXx4nYdQYVvky2xc/BOAi939WVOtaWcWEdegDZyCwppGHE+Sc1GyJOW/XXlJsYCJgypHo9
 jB58CYkYF715Nr+cSjqFnUNAR8qxON0HacvT6msTPuM6a/xXOPNFPy+3b0XfL4jmrr053JRakMv
 coL9zu/BvwOluqdHCKpMnhVXp+xTr34cO9g7KOtiuVtHx+QrLiYV7ra11T2XZZHR33bV12npuLr
 Fwej18Rzyn0JiCt/JxqUz+Nawoe1kEM7m6npjUS0n3xUPhsccZkkN4dM2O+T5idEjqBxU8ZbGvp
 B2PNcfbwXcI3zrWiGNhw12r5XAwbhHdLQ+HD269sX4hZNJWHw6MIMp+x8b8bULZClCEgYpnx2Cv
 p8RhUZV0VBOqfIlASaw==
X-Proofpoint-GUID: N3HG_ZzyuH4DKk4W4YvjQn2LUvjf6W-1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfXw07qGFfkaxVD
 8c1H27u7NXwJIHsrQUVZ9QIN9gTHLLJmfPPGm9FvoVuzH/8opv5KXc++v8LvgzEOubXfHU2Mg55
 AYoGqCVqVpZKSGKYOXrb+LCFGaYyVwg=
X-Proofpoint-ORIG-GUID: N3HG_ZzyuH4DKk4W4YvjQn2LUvjf6W-1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054

On SM8550 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index cf7d67faef92..1604d590d7f5 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3073,6 +3073,8 @@ adreno_smmu: iommu@3da0000 {
 				      "ahb";
 			power-domains = <&gpucc GPU_CC_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		ipa: ipa@3f40000 {

-- 
2.34.1

