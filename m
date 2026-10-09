Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19B93DB33D
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 10:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791542196; cv=none; b=oOXfD1EQp4Q+vCVBYSBCCpHBhl4mgYGXWeuj5+pkcjYrOYkKwZgbanenni1KLkVsaXdyXiYO0hqkMuKwFbQUF3GRi22ePwv+R/qguNuGTGXau+7fxBjqD7C6lJx/avCUBhV8pFxSRbKhCGXQx8S1qGO+eJe04w5JFoIoxlIvdDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791542196; c=relaxed/simple;
	bh=r5vfQeN+w2+rs5PzLPqAbbwdW38watpgr2ZY3QnCi1M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PU13VcWaKhwsNNxBI1KQBWsnyxowt1NeNzzFfBQiSHqYV7qE7n4qg+fSJfwn7rFm0r9wUmtPfCfdsj3oEJiHiLb6vVMBmVOpAD78DDv2sjUycs38obwp0QfB3DZQg+gU4GXRdAL0gAur0FKDnpBSQMi7lNJl0avSnW+uSFsGmng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gImKhJCy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PUDTzWXF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gImKhJCy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PUDTzWXF"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KNAe1252498
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 10:36:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zoubIOEEzv1B19ts4zQ87qyfocZpDaFj8gRYk/9R1wE=; b=gImKhJCyBDjUFsTZ
	AnFL1vgRF0gmuT3DSjK9nqu9hvyWZZuCtBqd6ZaZyUN3AmoV0a6Fwuoc64kqXJmE
	C+ArL91s+euIJHbuZFAMIXCi9ujqDh6+igV41zeXxibkFdUCihzaendHhJEDYgNJ
	RKKDypu3i9Q+uAI07CxK7r6TajjioFVfDXDyxBJauNaFXkHdfneZblizyklRW5Dw
	woKlcT3a00E5c5lxgAgD5BEZeDHoiNs8s5sNaSphlbhEqWQCva5kYSvJCpC+yUVK
	LCK9tKwXpCXmbGJ8hOZR96YrRN0njQJMDXsdglUXKMf6CQDkOFQxndsGssZrlLXG
	MDatTw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6baj4b5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 10:36:34 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a4aa263a4aso6219313a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 03:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791542194; x=1792146994; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zoubIOEEzv1B19ts4zQ87qyfocZpDaFj8gRYk/9R1wE=;
        b=PUDTzWXFyRnF7b5JzjKYNdrZJO0FauaUoiak8bFwvbyIGAU4YoHm5+EJfjeyJ6AOzt
         GKiX1+/U8ycavV2LKQWp/ZmBn7viEXuutMYUsXgXrbOm10RE3ofa5T71y/wyg4nM+O2B
         GHfymbAooc6ULFpVzztdAI41DjeGDNHehiiMLbwuJbxMVvO1oZ+BaXLYqhBTebW8JGz6
         Rm4AN4pUKrH8gVWCAGTnUMCXCWFr7jJAOWNdxehd2Dpfqf7cXTcWzsAVMeWX2mHbdw6D
         tpFtBJoZxrmXnm/NvUaWEVvZA1BnzS/eo1WqltEi4ecTQoeKSoq54yj/kirZ3IQ0mvww
         jPZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791542194; x=1792146994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zoubIOEEzv1B19ts4zQ87qyfocZpDaFj8gRYk/9R1wE=;
        b=0qtjP+a3kIdO41SIQGYJ07pWd3rSm4odaBh3msXETmraRstgAsENW3fIu09yrYdOIJ
         5YaVzAreO2MwYYAwvRuZeL1z+ZAKEeQ3IZM4Z0L/IiAH/MuOKbKiK2JMNUA4xFzllt3H
         7tg6NxAPsF31l/4zSZy57V1rcMtUesXVD1ZbsOhdvmgcDaKHXPw8xuKlm0JG6iejs7tD
         jYHJMwWPt3LUhhXUNqMM5ZKG1pqooHJB1utg3IdQYtsMRWpSZ2Kz8HnPGihRhhr37J3d
         R5dVCWixsNxa3G8LWpDPwlwZrCoQoHgaOBUjcyFqIntzXROts+5UNCSetFgaN/ZGDhco
         AuBg==
X-Gm-Message-State: AFq9FYJjkOn0kQg6H9aAEvG3PfBJQE9B+j6PSA+6MxEJuis4Y2ANyze7
	b/lyPnbaQ6icF88GCsfJWu8vAopLkgVcTFhIhNBiyfUGOUGTKOfFzJ7CCG3n+/rUCjgfchj/mLs
	ClkPbHUrTzQYZfCb6BNBJlgcvgT0qzO8xHGigfV9hNBsUYL3Kus+6hxixSrc2ztHFNSae
X-Gm-Gg: AYBFou2FwUcsgkg6763o2iR6c1QbXNTWB1hAZhohWyj6cNboVxYFzLdOTdIkEOUOEbD
	3rz00mFkDuDom5pbEXZ6PPgndByL2wQgl2IEF3aIV9nfIpxXJhey0A+2dH+mZlhM+h74tz34ZWh
	iqTqSr83aVYqrSX5IEZuSQNZ0WPn6G+ISSyHFn2Oi4AB92N0yMT0GvR64my4pI8M8xDpZWQYsvs
	2ehUrRpluGNoUzC1UGfbhXF5NVRIMOlxXSPS8ueQh6p/oiCA4IaFHud9tRoOBWAU2DgyW26wXu0
	GX7cbw87KBIhcXnZ2d4kr46AU3Y1N4Wj9dd/yaZ1C+ILKISVhvEvsaqBc8CzK1wwbCQkxSEJJwA
	MRQ//CxetYoROMp7I6Ggr/Z+T
X-Received: by 2002:a17:90b:4a45:b0:3ab:2caf:c098 with SMTP id 98e67ed59e1d1-3ab3a32f5a5mr1404472a91.7.1791542194184;
        Fri, 09 Oct 2026 03:36:34 -0700 (PDT)
X-Received: by 2002:a17:90b:4a45:b0:3ab:2caf:c098 with SMTP id 98e67ed59e1d1-3ab3a32f5a5mr1404437a91.7.1791542193697;
        Fri, 09 Oct 2026 03:36:33 -0700 (PDT)
Received: from [10.213.101.15] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab371c32cesm2827285a91.16.2026.10.09.03.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 03:36:32 -0700 (PDT)
From: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 16:05:54 +0530
Subject: [PATCH v4 2/5] scsi: ufs: qcom: dt-bindings: Document Glymur UFS
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-glymur_ufs_qcb_enablement-v4-2-9a6ce83195b7@oss.qualcomm.com>
References: <20261009-glymur_ufs_qcb_enablement-v4-0-9a6ce83195b7@oss.qualcomm.com>
In-Reply-To: <20261009-glymur_ufs_qcb_enablement-v4-0-9a6ce83195b7@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@sandisk.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        gopikrishna.garmidi@oss.qualcomm.com, jagadeesh.kona@oss.qualcomm.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, nitin.rawat@oss.qualcomm.com,
        sibi.sankar@oss.qualcomm.com, Taniya Das <taniya.das@oss.qualcomm.com>,
        Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>,
        "Martin K. Petersen" <mkp@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791542167; l=1442;
 i=pradeep.pragallapati@oss.qualcomm.com; s=20260911;
 h=from:subject:message-id; bh=r5vfQeN+w2+rs5PzLPqAbbwdW38watpgr2ZY3QnCi1M=;
 b=fV4n40BYRpXRXe8RJVJkcWQ67GcGioRzd3CG/J8XZOMeDI96lgqJatsRvp3/LEec99e8phJTf
 xuRV1Xb9NTmC1gUk+7Mrjud2rp7Nnlj6hkUkAak405x2y20oK6iMmHm
X-Developer-Key: i=pradeep.pragallapati@oss.qualcomm.com; a=ed25519;
 pk=uyRUsge8nQMwf3iW/e/o0U8z9nWLCMm1MGKxEftztic=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0MiBTYWx0ZWRfXztuHizxgQLtG
 lKng50ye5oMm4DIdF6ygFo9AGJPZ6wp9VUjbFSOOcW6PmmkbHOchywLiVwsEmMiAf9XMgBpo0LN
 9DwaTu5yMtvnirCVHdLilP62Xif5vml70D2gGxpf2bSX0u3NwDn44+kGA8r6nsSdNpVuGfTvkft
 tbi3oE53BLeRRoTtNkCoVP64+A+oykGF95y86ze3AFzRKFVRz8TYNUE/V8jTRD9tQCuwBEuurZM
 AzEzXTcZAReu58YvW4aQmo5X2zU/I7YtbgPE3yJ/ON36O24w0IebWWe4v2eAz/qGub/Tklf6d5d
 iOOssCh/b9x7frFiz4b+3nDc59mf7smzneQjKQ/xeWcDd5DUbLXvZ4GL/uSyQbdlM92W4/OY2gN
 kPFbNJ5QLVmFLkW4AqGZmM1qZvJ4eXwg3T6/IOUdOtlxMx9JCyU6zYeuXgkW/A9j8r5TJxfoVhR
 zRQbhG+XsIvRUkCembQ==
X-Proofpoint-GUID: MEgTbQbN_4wnMoZR24Y3gLZEi3DQDZho
X-Authority-Analysis: v=2.4 cv=H/dOUOYi c=1 sm=1 tr=0 ts=6ac8c3b2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=M7MUb3q_Ox69Zn6kGXoA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: MEgTbQbN_4wnMoZR24Y3gLZEi3DQDZho
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0MiBTYWx0ZWRfX8OrEOIlmvhoZ
 w42vlFn0NIAtMfXxG0NjxDBES81FF830b9dC5oqgIYBFmyfAdgWRSI8ql3o3ej8E6A0x8HsZqLz
 QBQttbuWR5OCPIeMFDbuq+zH7alBkz8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090042

Document UFS Host Controller on Glymur SoC. Glymur UFSHC has a
multi-queue command (MCQ) register range in addition to the standard
one. So, both reg entries are required.

Acked-by: Martin K. Petersen <mkp@kernel.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Pradeep P V K <pradeep.pragallapati@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
index d03295806657..f132b1a9ebc2 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
@@ -16,6 +16,7 @@ select:
       contains:
         enum:
           - qcom,eliza-ufshc
+          - qcom,glymur-ufshc
           - qcom,hawi-ufshc
           - qcom,kaanapali-ufshc
           - qcom,maili-ufshc
@@ -30,6 +31,7 @@ properties:
     items:
       - enum:
           - qcom,eliza-ufshc
+          - qcom,glymur-ufshc
           - qcom,hawi-ufshc
           - qcom,kaanapali-ufshc
           - qcom,maili-ufshc
@@ -80,6 +82,7 @@ allOf:
           contains:
             enum:
               - qcom,eliza-ufshc
+              - qcom,glymur-ufshc
               - qcom,maili-ufshc
               - qcom,nord-ufshc
     then:

-- 
2.34.1

