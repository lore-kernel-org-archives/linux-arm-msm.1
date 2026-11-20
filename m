Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182196;
	b=DQM1WYest3XWs9iE/LIb9zAFraTiYyguUkcd12QkZe9L56jJW0DBq56VMzDYbu1HZHmu
	 HhU7pl7zfIeUvS+tl5cgSRfMKs5xExISAN72tawaKuZbRxeI/6uuhlldGLURBbC/VgCuH
	 Ao6qOM65CR4Nl5nXRf2BzeYsMh0HYJE9KvKdz+lccSaYREGMeogDWxWllVLkh+bDYSBBo
	 ShdfUFspxxgXtMdSOn+l/8se+FkcAuCc0UZCbTYZhAIqgmC5vl6mxViA0TeZCPehn9a3M
	 xtqX9ES6rcI7vnzZEuudQEWlwqcxtpFHxBXmQ5K/fBT0xwzbSt4Iy3GaqV5ypNNX3RQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182196;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yN6UN+J+fpt8i2gGYSvl+iVIt/4RMXnGf/7L8R1bT+0=;
	b=K3MkeJAr4/GUDL7ucaF64K8MU0dDdEQw3QtbTatw7DnjLVgJ+L6kkdy5P6KEXn8MgSX/
	 fGF0X2N45JDU6oTd4e5FnBHo/qgKTOoZX5JfV1Kd1Zv9klydUz7pNvWsJI8bhU3awsfVD
	 tt9LDQPiidseZvZj7o+ppORx9V8GS518B5F1oF6h90yIg1qzPzfZQ8gEVAh+thU6tlVgs
	 ybBRq2xkjQqdn9F0XuwVH39GOxNegQ72r69yhBuW1idDSTSHNnyHqKQTWywyfxCc8E0e+
	 Zmjkxir99/139+NR6YJNYeVA1Bahm5bJi7VzpiRBxbR3S0c8fTdym/pBOFV3VYb5CXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WFsZ1PCY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E8I4cOHo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D5A606A325
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:43:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9D5A606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WFsZ1PCY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=E8I4cOHo
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk6hr3987232
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:43:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yN6UN+J+fpt8i2gGYSvl+iVIt/4RMXnGf/7L8R1bT+0=; b=WFsZ1PCYPHZwYXdX
	pxhYoFglf6/G/D2b3NNcvvzBLrRh5QxvC+BCLZMg9Vszi/5Eb7q7PEk58DZInPbC
	eyRUuDkYdMArQ38nEVLVcFLKZyItTbGKBvi5MuKF8gOn/OIYJAHGc4JiiRWkFHRS
	aM4gXpMCvmq/eny/ITWktSa/6eHTHwyzc6aAlps5g92HO8uLEzBXMcjdZJoXp+5K
	L6ngePj8ny/IdmwoenVRlrudlL2Pheq5IWqXBAWBChdmHg7E5TEhp1FX7fpFSZF6
	VbDiW8KGqt4PCeOoHRKCFFZdoLHWzMiRO51HZ5tQInjTu6x4wreHqZaUiHPwf8lD
	v9i7zQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2gu81pwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 13:43:15 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-38355b03cb8so855430eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 05:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795182194; x=1795786994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yN6UN+J+fpt8i2gGYSvl+iVIt/4RMXnGf/7L8R1bT+0=;
        b=E8I4cOHo+ohh5Mpg+B5MIPhQBXCTjpcyiTgMjkxxh/mc8lOTbR5NFrMIcInFCISONa
         uGuz501lE0bd3qIJLs1JZXIUBqr6dAD1EaXtkcMujwjZ8CBw/7U3byHcZ6iCoMF0j9Rc
         SR7D3ufVmXJz7pOrji0HSWMlhxYP9AiVLAsV0XV9AwcEg444d+wcuRkvdTJ4dprN4i4T
         3W2amCOW/zWSApZyPGGtG83hwW1Wy2Wxmt7X8WKuyFJlS75v7lEqZiW0lchy2+WtFpyV
         S0zvVbgbLlVaj3ozTCT+SjlF4P2gCEioSKcGaVZ5CM3Ivkwd1EbgvuhH+0CnIr9gTuE8
         9+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182194; x=1795786994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yN6UN+J+fpt8i2gGYSvl+iVIt/4RMXnGf/7L8R1bT+0=;
        b=u6RwpoNo3b79jw9t5LgCOWceirAl0iiTmUHEQpcFUdZ7b0uUkdD2psPLSkP8I9ayIa
         L/0jhQDPgknOHIGVr676E1VpO127VHvmSgzl5bUv6mT5G2j3WgY85Qm1gYIRbw7ZgMVC
         9R5QWbsdtr/a9r8Lo6uI01Yfay0YBMY4UxaGBC4Wx2GcrFAUH0gDeuGnvT5otaSmITJS
         JNEib067S6SXM6JOKiT0knjo8AIJpeJvwTDIyJN3dMPQqo6aEb4nV8c0wUGliB4NlNI2
         mxLjP+wM6+Bl7f9UHRbVzS7buuk0cbDuXZIcxkUTWcac0nL5q+HAsyOCWlXUsCWePSl/
         Xl6A==
X-Forwarded-Encrypted: i=1; AL+hErGaWGu/fZDRh9dFUWnzvkwWktnePw294WOYp1Iqao0hTrsNO9PSewq+hM1tw2klIlossqv3YlINWMHSDtN+@vger.kernel.org
X-Gm-Message-State: APuU4Z95b5E+AeWV1whfEUtO2s2suXc3vSg08p5x8bDRlOkR9EWv263A
	TAMlqv32YSW5dpXUKaYEF4OZk9x3QeuPdP186qYXBnZ1sQV6QufQfNfnByu64vqjpzKoRWV+iXC
	1H9mq78PpKaI1vkjHSgjd0Yw9MIJ/kPzGTrSs3Gthzo0ttdbBIm9rFbd2fioaaypmLJn2JKhX/N
	PI
X-Gm-Gg: AYBFou15A0VKCwpDLHJt0BSi4wwaGjaqLdeJX8EW2G1WIxZNQp5AhUIkHvrQ1EylrBm
	3JOlDHICwp60Ti6bFl6kvUetokdUYF2qVFfFUoiW21Qlf7WrD0k7fkcmmWEzvxMhg2bipTD5mfk
	oA2RJl0gPjmeIcBwSGua8qdqeclBkDYmQqG41Ch9HdFvzWQWpDi0Z73NyEK8fUm5fNqPpPdNPl/
	XNEHYGFFjd3yMHfBV70CKeCb+EyCjdaITU/WXk7oWs/n9hlW06yfl48j9BGkaXcrzaI6Gix2F5W
	yv/lIoY6C9ao5fSF5FjP2yrNGULxojgy//LphDDQk+kRqbu+mWksnW1Z7UedcVJCA9FL+nlBLq3
	OzHiSX1SCsVy3VFxflPc/QmL6bFCdWkyKGkPGRaGZuKR/kqUlHMcp7EO9zO9JWjbHSGrtx63Asb
	64Oxs=
X-Received: by 2002:a05:693c:8955:10b0:36a:1008:5815 with SMTP id 5a478bee46e88-3856c6ab8e7mr2865617eec.5.1795182194236;
        Fri, 20 Nov 2026 05:43:14 -0800 (PST)
X-Received: by 2002:a05:693c:8955:10b0:36a:1008:5815 with SMTP id 5a478bee46e88-3856c6ab8e7mr2865573eec.5.1795182193563;
        Fri, 20 Nov 2026 05:43:13 -0800 (PST)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567da4f85sm9379222eec.27.2026.11.20.05.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:43:13 -0800 (PST)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 19:11:40 +0530
Subject: [PATCH RESEND v4 09/20] arm64: dts: qcom: sm8350: Add GEM_NOC
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
Message-Id: <20261120-smmu_interconnect_addition-v4-9-be30526391d9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795182138; l=1040;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=ifRBUNcG4S75b7wOEESAYY95LUktSUoyNzDBhGxm1EA=;
 b=Q8yu6sFl8SVM8dspFiUmMN5ffOmdMre6HaKrkUdqERV8yylmH+IBEB/LBKQmZQ2KgivVAqmFt
 gDOq6Ul9ShaBwk+4cp4/63XlFWnZijGOl+HjjqAQOCN+ti5Cre8mnYq
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX4LoPRCosoJXJ
 zUfAXEumYY6sZuALAhUZxrAFKinz61IU1EM7uXBy1xfzV8Zaob+ybpHWipSLMANrRJEOK8v+EgH
 XOZuaz35yyZ9Ooo66Lgf2DYSFGvLwKtEshasaHDBi56I+0qAaXBMpGhFR3edKtlwuLGM6wkMw/p
 KlHFnuje6//yDniWupFbkxxC+USdbEXMMkJsbEc9Qtn3P7cZoSg0LtjEw4nr5xmCbZF8z0kJDPD
 /qCU89Cbd2ya6tDVIS2eUztD7iqtWD4pCnhPwUNKFJDWnw6dZvo5kfrQmVeUgp2D2L4lpBLF1pB
 sb5vHYc9DekSri1KvWPJibuCngT8V095u8kkd0j66zZvV90MYCM/Z/UaGX7UrHP59d55a3YsXka
 IgGoDVQq/jEOpqwe45Nyi5//9W8RKacqU5zPNUCe5kwsKHoWYZYLyv2ZnkwjkTOu74diWcmDtIx
 9hA/m5UGzCUiVdSedHg==
X-Authority-Analysis: v=2.4 cv=bLeDs/+Z c=1 sm=1 tr=0 ts=6b004e73 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=tc1TWAvYerzeY2VvnAsA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: aQLvAcnPk0MR3cDT0jfJGdcE8oo3Yhyd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA1NCBTYWx0ZWRfX8zU5ieiZWw87
 NT0/2lK/Pufkdc44rvxq+28u2IAW/v7gWkQ47bJ+HVZ/WK8TJb1XGrSIeEqHh2rg2KRSDQlatFy
 8bOeE/10hLHjS/UBMt/I+CB3LpktaC8=
X-Proofpoint-GUID: aQLvAcnPk0MR3cDT0jfJGdcE8oo3Yhyd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200054

On SM8350 the Adreno SMMU GPU TCU is a separate hardware block with a
dedicated alm_gpu_tcu master port on GEM_NOC. Without an explicit
interconnect bandwidth vote, the GEM_NOC path to DDR can be left
unvoted during sleep/wakeup transitions, causing intermittent SMMU
register access failures.

Add the required interconnect to ensure reliable register access.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index 7b9966e8fd4d..4edcb06dbae8 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -2566,6 +2566,8 @@ adreno_smmu: iommu@3da0000 {
 
 			power-domains = <&gpucc GPU_CX_GDSC>;
 			dma-coherent;
+			interconnects = <&gem_noc MASTER_GPU_TCU QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
 		};
 
 		lpass_ag_noc: interconnect@3c40000 {

-- 
2.34.1

