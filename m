Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9C53822A5
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 02:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785292841; cv=none; b=i/Y2vu9UZB+7vJZbJGJu+o5GpiAxHQK5n8isooETPXf+SamyCZkuA4nrOR2GTBqTqDACQmkqoxXcctMA0enncbUjLpkR52gkm61tuCbQfhuCbMIADMi4iXNxMmDkcFzaDj/+93seVEhgD4iKdDJT467emKbqOXBjkqluXKYeAVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785292841; c=relaxed/simple;
	bh=rF6TUJT4fFt0Xh6pN9n6/C+QLa7/YYWjtH1j7RXIVW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mZ72E8vMMbFECKDO/675a+cyG4N+r80uTouURpkYYFF0UIR6+eiX7/WePp/fCIiG2IH4Drf2qxc7JsdFD78cxTHWipWmopByKEfv/EOXfbFh8EmGMER3IhCf+50xJz5v407+maI0zfvARVjJ8OKcoO2ou9GRLbfNL2YL5X61fRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AdYPvb0q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LYhbHu89; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AdYPvb0q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LYhbHu89"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T1Ht0X4026081
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 02:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uxOseqOHHMoW92yeA+PV0zd2OZ36bqpaz6UTnTsrYKg=; b=AdYPvb0q4HxmLa2c
	ruqUOGo/lK5l5/LWEQIgKH26nNLdjzrwKrk3osk4p9/WFP5KxiNhDf2B7SbTXOgc
	VgTF6Wu2xgqE8URtIRpv/AoDu+G/MPRKPZXE7V9F60cQQ/W5NY+QkBbuKdeX6VHr
	qjZaLi795jaDPEm5bJBhm4dGFPKxFbgWU4JVZSckmmqSv1eHCMNBvY5Syp4MSJ7Q
	nS6cKWOd9y6qhQhBwXUGqly5CPtSbMGusPEyfjIiclc4pDZNI700IrbONXTWGOXY
	+wSisnQS4sv+J7JB2/UrRnRyBcEmLttPf0HP6P10TdtttEkXcAnFwAhqXMr4LLuN
	EgGpaA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq0q0hu4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 02:40:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc98d6a88bso1165915ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 19:40:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785292838; x=1785897638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uxOseqOHHMoW92yeA+PV0zd2OZ36bqpaz6UTnTsrYKg=;
        b=LYhbHu89aWwre4ZaILbycYYbvAMCOTdAnr9j87qJ6WSxMaq08x3wNY6lac4M8QvMBq
         0je4cZLLavPe94QPx6R4hNznuUheHihQzxEbXs7ucdFdvQlj1rqggILUwe6i9RRMScKG
         xI4HVlng4qigTiV9aoACOqD7PX+ylDE5YLGwtsX81eHVg3Iz7T+mOCklCIyJ5hBrpLDu
         feWcFZNXw0ozp+IY/fkdYBF4r1G0VIRpb61bTpYvZ5X01VtydWM7X6Gz/rVKw4UT3bAK
         kY0ZmkuHMHBiqAZ2j7k+QzT6eXsZW4BMLhBG8dhrVY08GG2zfr5ziULAzdoZYehF8h81
         Y+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785292838; x=1785897638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uxOseqOHHMoW92yeA+PV0zd2OZ36bqpaz6UTnTsrYKg=;
        b=V2ntChie+KO7gc3+xpf9vyoEhIEnCmunzgBl3e1d5dI5a9usI+iiqix9T6eqEzU22Y
         FA+NGGUeDb000+btYX8XnJ4MOCUMsWyhk12NdW4EpYMbRR3NH4mv/LcASl808R1gdnyW
         pOPgpT3h8iIZ1pnfNHpADbzei1pqsEJK+TJATv6CAFBfTtqXi/sUJXBWFBrEtUjyJLDr
         VUBs6PwDkmg4Us0aP5dRLCzVtB+LNxIgglj61z4EpmsqIFLGKRIZzD/AD2ubMZEvXkId
         DP7RwKD8K/MHBxZa4wVC2gXRLybocl2R92tt+4Kr9xX7aE3IinatdkMRp+7tv2WaQzz3
         dj7A==
X-Forwarded-Encrypted: i=1; AHgh+RqE1mHQptcitQ8lIdeC9S6sA7hVsx4x9dhfuezsN3blsO0w/swFpv3MP7pKTTOntK9CuLtnF8aG6tlf3dbv@vger.kernel.org
X-Gm-Message-State: AOJu0YyKLaIXX6LqqP4jh+FGiZciV2p8O5ui1wnTVAtgmBdwDcEGQDmQ
	tFep6mAV7zYaqfXR5IP+TuXhX8LRP1mYmKA06SV8k16deRx1WrvLSvnU1o7z7y2v2TQ5vwsKRRP
	rFACqtyXe8V7K0nNzThQaWuNNFvUIZ/QmYW8zUzk4Zp/112DQC27PJ2roh3VQ7/O5mGgQ
X-Gm-Gg: AR+sD12NwOycgKz1k/Tl4aXWimZZym3kDMtoWxF2oJrm1Gs74q4Zqn9g1lp/qoOHHL/
	DLqMpx7fTpwsB9S0PVz9COQbQYQyMaaqjpmDZGU+txyHCXSC6ZFK80PiSLdEWF8k6uahDgmQbJX
	a3AbTkI4oHFeazYOtXQO/bs+h4dv9IjvUxes6mdovULyPCl5t7hgxtUafliZdqH0JN7udShXeQU
	2Bc3Rm94OIL5aqE30UCc3umjk880CVClCyXF5LYkZ6rhsoMNDZcHjrBO3Y2bLJ//4wXl7ZEFj/T
	MUrjacVh+xKS7VhQHQZ2AzfnLURsAAjq0DNayHwkgXbTMgNz3xhpLX+EGqqndOCm7UboYGPatma
	yX2ZwVw09bmVewWFofNtrPh/u1hWyaiViio8QRTUpvZAJOTRNZUI=
X-Received: by 2002:a17:902:ce89:b0:2c7:ef84:c58e with SMTP id d9443c01a7336-2d015a0f7c4mr44028495ad.1.1785292838428;
        Tue, 28 Jul 2026 19:40:38 -0700 (PDT)
X-Received: by 2002:a17:902:ce89:b0:2c7:ef84:c58e with SMTP id d9443c01a7336-2d015a0f7c4mr44028135ad.1.1785292837998;
        Tue, 28 Jul 2026 19:40:37 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504cc64c2sm4052694eec.19.2026.07.28.19.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:40:37 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 08:10:29 +0530
Subject: [PATCH v2 1/3] arm64: dts: qcom: monaco: Add compatible to the
 PCIe Root Port
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-b4-monaco-evk-m2-v1-v2-1-0548e1dab760@oss.qualcomm.com>
References: <20260729-b4-monaco-evk-m2-v1-v2-0-0548e1dab760@oss.qualcomm.com>
In-Reply-To: <20260729-b4-monaco-evk-m2-v1-v2-0-0548e1dab760@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAxOSBTYWx0ZWRfXxKv2RbpV4YRu
 4NyYiVdZJ2KXFTOELOOhvQlxTVz+3uQ31IrFRgEwrK53YC0dN+EVrdkP14hzTgOLAGRac2RQ1Se
 HeOo/D7FlNrfQ55uVL25UPeI5cSwTlPCNQEeFdamSQp31qCW2JwfRWfFJFmq2ZFY3f8kSJHW+/e
 jn2GVd2j4I+8puA/84nI4dxB0ygJDfSdj5ydg3/TzGnkOEdp/82Ly+ygxGC8tr9apLGya+dC9co
 5NdUJsLrBmNgsjv54dzSvPS5nQBgI9Q2jtftd6xFqhjYwk8PGwf2UIMHpR/UQKnNb/i+tYQtJOp
 OxhokHW4VbxbJ+/sLDkOWniU7LKX5MnEaFPJpj0F7wgxma3Jr/RLKyW+GDdV1S0TxdL7LiEZrRg
 V0uaPsSTKNoMbXemlkp0D/8qqF9GFdMzaiRfdEhK4SZSJGL+Ty62dX4NRM2DYyx2x2ItaE11bMI
 sVI7eyEVrj3HAWTwYeg==
X-Proofpoint-ORIG-GUID: WS9_duNKe7AxDUTI55VR2tZrM5LzxKNa
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAxOSBTYWx0ZWRfX/csLRMCBFPpj
 2/+HcAooF5Lj/LsVGXnUJ6m6J2eQltOLxbugAfh6W/0y4d4i8SC+D8UYSs5Zg81yqbgXMkPCh2Y
 b6vqXgqvD9E/P2deAJc095/J6lF0w5k=
X-Authority-Analysis: v=2.4 cv=VezH+lp9 c=1 sm=1 tr=0 ts=6a696827 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=s3JIKy7HVgEvE3Gl7h0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: WS9_duNKe7AxDUTI55VR2tZrM5LzxKNa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_01,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290019

Add 'compatible = "pciclass,0604"' to the pcieport0 node in monaco.dtsi
to allow the PCI subsystem to associate the DT node with the PCI-to-PCI
bridge device. This is required for downstream DT nodes (such as M.2
connectors described as graph endpoints of the Root Port) to be matched
to PCI devices.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 64fc0d592282..438ccf6eba64 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -2393,6 +2393,7 @@ opp-32000000 {
 			};
 
 			pcieport0: pcie@0 {
+				compatible = "pciclass,0604";
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;

-- 
2.34.1

