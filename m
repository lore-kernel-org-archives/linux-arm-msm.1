Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6368C30C16D
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 20:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783110956; cv=none; b=PuqGZprXTqWWdyINW6Yr6fXtsWfIpBqz00sTb3YGQXTOu5aM6+TmCkp1ZRjX3NuK5YmfJb6ENbcS1jaIuzhhamHd2SkBeMAqhXVHW0ha+eSw7xo/H44Vug++eshF/gWjoCVe6DeZDGBcGKrGWw2I/PLq/vp2V4zyfmPbLjsMzc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783110956; c=relaxed/simple;
	bh=yGsij9VKWI7rB/vT0J8nK7LauF77nPjz0MJTy7VKUkY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R5mtOZvGoy+J7w5+NqqOaf/ptLNlfMeB/2KAGiVrDY3XF16v/T/Nu6GEKEE96sH4r1gtkZs61ZN7QFc8KeZmYCcYqeWOnsTSb6/Xz1ih0AFTz9GnQO+98pa5hT9XcnUJMCWXhNkY+iJIC8hA+0WI3Fjg/TMllPkkr67mcQML544=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kbXCX3Zf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rc7IlFYk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kbXCX3Zf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rc7IlFYk"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663KPbKs871895
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 20:35:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2d5kwEQJ4zj6pWZ0cwELlzSxpmKyMsiG0qTFS7qufTg=; b=kbXCX3ZfPE8xGbMt
	vMJtWU22XsCFV4p57+53pKeA3sF8erE5WGjuAIJ4v446eiEkXE9zyhh9NUiRUtAV
	vtfMB12w8Zz7nIM3aJN8gA/DmwzV0BKfCjhOp3EVC4ygnbJAzWsHakrDG4oyQqt+
	nG3cBLf8FbOA6iGXzcsCDQbwZYAI67JatbACMAOe+6vCX0AyEq7EJrxcz3AGLtfo
	qBoQg8XhoCRmU5wJTrTsMd1eqsCOXQpB9KeAyrASJwukltn14xq18TPfZY57Z0Bi
	b7pMwGhGFFb5tNuFjx1PGGYtj9SN/GmngMJfETIFQlcjhqyyIifDM1pqW3uDuvwz
	HJ+mog==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n3wb4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 20:35:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3810960140eso1490828a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 13:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783110953; x=1783715753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2d5kwEQJ4zj6pWZ0cwELlzSxpmKyMsiG0qTFS7qufTg=;
        b=Rc7IlFYkb9+8eZZY24ij04dvTj1us+7Ym8AQsXkT+3AHOdv39GWAXrtOoigyvZsZM2
         MQW8ypyjScl1zwIp81vpup2t+c6fHpOm96IW+OKx1tcMYZTgx9lyggr49VcTKkjJviUt
         XSc6v09Pr38WG3e0c1jAp6lAkcnh7E7uaRoQSzcvon1dGOlSJaOJgTN5iNEc13XRRdXG
         Z5ufD3hUdO3BtbemVfFP7JSGBejjrWufTtkEz5giM4tIEdLSIL/I0LNeZNxAN41d72pK
         hue7GXbsv+2o5J0gdQj6KU+sClnO8lyAnqSWSxdu1DCh1SqJ1DLve+rXKZk0SsfOXoQO
         evpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783110953; x=1783715753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2d5kwEQJ4zj6pWZ0cwELlzSxpmKyMsiG0qTFS7qufTg=;
        b=SjTFjLUpIs42f2E/kKzL8ggMZcs/dNQRdfXJ9pZAxCYGE5Oo4kXBEdW9QMLdGXMT+Y
         btHvYIkDfuXoJFTqEuz5kCT3M/hzsnjkOhrbUMIMiq7jHmQt5kGFBEWIYQIl6l90Jmlr
         4ECuThBvaYzq6jMDtq0qFAp2jsnyhepcePZMu0JBljpFXuAPTYuJqg2ECRt9zTmu0n/O
         mA/sHOAuq67CvBZGzRWfSvt+JxU2jEAFN2OsSDbUV+VSpitnLTmxlRDlko7htqMqMP5i
         sQORl1xdaYwQySJln2p0eG6oVUjHElvoIxoQVtjpTY1sgWzB5kbUoyaXuOPllQ8c61sM
         MvYA==
X-Forwarded-Encrypted: i=1; AHgh+RrG/D6CpMSnaukSUEtK0zBWubYfc8r+5LZ4g4TNPC90Ma4YiFcyEcDDRTgtrAiD+mq4b49c6hJiAKE83Ue7@vger.kernel.org
X-Gm-Message-State: AOJu0YxSKyu/rql4Ls5YHUefVblkxazQBwIFdwQT09VmyaWilGqI5QSM
	WmE1X61xJpbNTYfCI6JG2TuJrJuRTz6KfvgapAuiESeC5OGEAIzsakfCQ/03fcSbQO4+oJnxaoH
	XolLI+KPcP6VKwHW1B+ORhZIsGCqFOwq1UBPeMQBD1a5i4sEc0398cXnnhR6Pml8+scQY
X-Gm-Gg: AfdE7clje9anoXcV9OPM7g5rXwVsakMXuxQmtDvFo/lG4xnfL1dPSrSvh/ePZH5CyHY
	t1YNQUG99s6/o0WoWTwf0v36OZstuDR/Y3T8DyFhr5P6PjOVCVIsp7k0EgcOCIG1z/Lkjr9RDXB
	8qufbt2klN18dDRf1J2Y6IxKOoeLJRbqjQcsif8J8TJOmNNAQpKfEB93G9QE0LenUgNHngP6ETH
	ShY8bwBgGWidOjuxhlfZZte19wrKeQVkRIV4djTLSzBkgbbePv+xEoGmsodIcQJlWXkK5ePDUef
	8OOkQiDuRYWOR/lIQd3iGI0a40qlToa1Y5YcXc+pfkOVvgAGeL/kL+PjHF5+QU2YEnWQuPEqsIY
	aO8KJkYw2VbDyt8c/Q2bhYKTmUCy5i/xXUTE=
X-Received: by 2002:a17:90b:51:b0:37e:2053:348f with SMTP id 98e67ed59e1d1-3829f7e86c6mr859250a91.25.1783110953168;
        Fri, 03 Jul 2026 13:35:53 -0700 (PDT)
X-Received: by 2002:a17:90b:51:b0:37e:2053:348f with SMTP id 98e67ed59e1d1-3829f7e86c6mr859230a91.25.1783110952611;
        Fri, 03 Jul 2026 13:35:52 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0b7b9a8asm24815567eec.2.2026.07.03.13.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 13:35:52 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sat, 04 Jul 2026 02:04:30 +0530
Subject: [PATCH v4 4/9] arm64: dts: qcom: shikra: Add Adreno SMMU node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260704-shikra-gpu-v4-4-90cf1a52e539@oss.qualcomm.com>
References: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
In-Reply-To: <20260704-shikra-gpu-v4-0-90cf1a52e539@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783110907; l=1898;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=EYNcq3OFs2Ql/wREKtEM5ji0GMxwTnKnJ9RpGAjMe6E=;
 b=VV53sBo/O5fZ+NGsyhq4LtyFTf/b+WQ8uGjvE91A7dZXdXWNqRQAjopFaqZ2FFIMEKi2ZmO1b
 iWCZ4r056a9Aa6iGB0aED9govTFpDOH8j0BvDycAX5GdmmELVWBCWVb
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfX74uhw2n9l7YJ
 PvH0PbfbV2zDhmHC+pTMtUMPYoGzY86QIVaEXd42HqsWuvIPJtWhJmEfcOqnvGdXu3H1vyz8tTk
 Pnad9npyI5xf+CQ2obVDA5J8VvDFZMs=
X-Proofpoint-ORIG-GUID: 0Qw59FaQTk5z57BaK8dk_Lvw-aolJy2U
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a481d2a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=zTWU315qYGxAnKAOPQ0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 0Qw59FaQTk5z57BaK8dk_Lvw-aolJy2U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDIwOCBTYWx0ZWRfXw0QJMod8b14q
 Ac39yvvBTY4PykUox13R6qF6oH25So59MgjrIQwMh1igV/4a7rZmhK4kCCG1BwfEMv94VR/2rdw
 ckeBKgKRh6mORYhaEGVSeSQpiXx1nvkt22GnlfDQ1uX+F40ai+JdUEEujv3Tv1Kv/LIS+llMTmx
 CKlZmTH7Gq9uuvQGuvnYnu2Uzg03dEjzD6+Hymi4LcCpZof0JsMeTO5rB7BqN2FriNr0CtIRxWX
 gh+h1TdT6YjFoq20zD/NZvzPejDS4BNuGCKLdTVLHxbLqJAFd2XmRjWqXNupJ3dPoiGHTA3vqP3
 1Twd8AbhSQDkFlYAxe5gfuspbRbxv0CM5WObJ/+vUa1fXGQo1U+Cy9nW7ZZhL8ARTy1GVWQqltR
 9olBTCSOJ+Z/ArIlSO+XYdkrLcuCXR39mXuqDVYgEanjeshTtw8v4nSY+RY8MPojBVxgDNSizJQ
 bCxqXzQfPJxpWZKqPHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_04,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030208

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

Add the Adreno GPU IOMMU (adreno_smmu) node for the Shikra SoC.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra.dtsi | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
index be443b362576..bb11e832d9a6 100644
--- a/arch/arm64/boot/dts/qcom/shikra.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
@@ -2005,6 +2005,35 @@ gpucc: clock-controller@5990000 {
 			#power-domain-cells = <1>;
 		};
 
+		adreno_smmu: iommu@59a0000 {
+			compatible = "qcom,shikra-smmu-500", "qcom,adreno-smmu",
+				     "qcom,smmu-500", "arm,mmu-500";
+			reg = <0x0 0x059a0000 0x0 0x10000>;
+			#iommu-cells = <2>;
+			#global-interrupts = <1>;
+
+			interrupts = <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 167 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 168 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 169 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 172 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 173 IRQ_TYPE_LEVEL_HIGH 0>,
+				     <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH 0>;
+
+			clocks = <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
+				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
+				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
+				 <&gpucc GPU_CC_AHB_CLK>;
+			clock-names = "hlos",
+				      "bus",
+				      "iface",
+				      "ahb";
+
+			power-domains = <&gpucc GPU_CX_GDSC>;
+		};
+
 		dispcc: clock-controller@5f00000 {
 			compatible = "qcom,shikra-dispcc", "qcom,qcm2290-dispcc";
 			reg = <0x0 0x05f00000 0x0 0x20000>;

-- 
2.54.0

