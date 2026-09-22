Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA7A3F1640
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 04:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790051634; cv=none; b=lODbRWhn3Rsc5zrsYf84IqbUxbJQ2DXLZ1k9wCiXizPRqZSRTGmdmbVJbdvR4Nse3M7iCwiUlWNv98uEbLOSIF4xxgXZ/F5Tgm7Pd0li76CFfyJnSTh0ELQkpJfkZX+QpSHfgfwq5qy//a9jgXJJXsWEPwOzYwmLc5FPYfnh9PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790051634; c=relaxed/simple;
	bh=fUNMC3JGXhbiq9Y6lFVg/e1xZgyALQ51mRBs5zUcqVc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZBNmO5hLVj3VBm1cliSeW/11g7HZwfWwn9kmjowKcXZw2bAZYobzX3WZQu4Fw1suRADb6TyBUEohTfAI/Ywk8mT6TsmCo+M1cwQ/DGRviU9ZO1L+vEWnj3uP5I+6yRQwNT7Z6e3A03s7HjQTaON7vBwt7/5mIKOxyqPXyTyWBAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nk+TSupv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GGv9cpmU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nk+TSupv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GGv9cpmU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M2sIaN3675242
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 04:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TY60H3UdmFbtKd/s2I1ukfh4of0UVPIOC5ssJn5IVMw=; b=Nk+TSupvOCDlxZ5n
	cnZC6kQe3QxOZl4qJQ1LD07huOMERkD633M7pbX1ZW1sikDg28v5d6zWXl8F1Wzc
	KyP9sbhOy9RYiSmgSo1lHzrzPgFd81S4of6hLjIL/tcbNaWWZNgwRWzwqpay16gA
	aml8YFyKrWSuSTyCj7AzPhfpWh6OWSL2ubOtR4djfJudWuZ2Tb8VuLvEExcS1FmA
	AF+NNQzZCg2DQbxyCg47+Ttha5/igmYfuAEPxuXabMJJo3+bzQzOkAaLH7hV+Chz
	E0DPZpacfKkGx9g7aYvwfJVJZsroFUBrhocY2QGy9LfEe6McVEDa9vNQAHdmQNKD
	vd1KyQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guha5rac2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 04:33:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb687f82eso51159035ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 21:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790051628; x=1790656428; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TY60H3UdmFbtKd/s2I1ukfh4of0UVPIOC5ssJn5IVMw=;
        b=GGv9cpmUcI84qInG/N3c4mCvUkkBc2wO+Viu9YOtMi/aHOOJcRXZ79I5i0G2X4CPCt
         /23oJftOdYfAIf6kMASFy9Da4ZJuqULlZ0UHzA2UN7hY/DZxCdSV/+vm3BNF/9hPON9Z
         JHaQUNEHutGXqcC0ENY+mdxFAtWF93ZUE7QM3tsArhXk2BoNBRNqOaznvjXLYphr+EYZ
         xLiR0UubfJinpVN33GOxT3IxYAJ81cH9ntVPcqhMwOeKWCrgcXlKckoxwQWrMMLU97Kw
         43iC0br0GzXTGsy4W2bxZpXyrypur/n3kxq/MKnwksvaHT3myfhnzJNbjNufMJNH9P73
         LItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790051628; x=1790656428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TY60H3UdmFbtKd/s2I1ukfh4of0UVPIOC5ssJn5IVMw=;
        b=oQdeAZKR0hlaV0fdmPOGPeSdCTcDaJNrCMTo5c31w/XZ+X071WhlBzuQ4YpLhOlPr6
         WXPRyN4UhliQnv/yTAkkcxCEHbzc2P8ny2O9YtRURkyK/ZD1zx0TWeSDYlIsooygEalg
         rgzOZStFLH5VsR/KzdhvMlkJA1iO/llEVZjrzMRfMCK305SbAId3qViTkhxdzo1twao0
         L3UOa2nhYn2wEtwFibn2OhLoQIKf237pOIWSWB6HM1vJAa1hj27Vyfjh5gyQM36Kf683
         oZofq1zVs7A0U6pclbYOeW1U5hcjtYabSWy2Yvqcb4rallRrs1RppN/TKb2hRraWeul8
         IRXg==
X-Gm-Message-State: AFuF++l2NKa5h1Yhja48ytl6oFI41aL125Veps9a54sQ7Nd5IuIva8eY
	rhu/iMg/isk8dFGzuDirWIaZuXso/sbjCHnQ9JN+xCOIFQA4qgpiwuAlaOHxCmPJolq+uULLL8+
	M0k0devqMXy92kqZ6EGvTPBxcWb1t91Tqfx4NGqdi9r4EuP77ehLEwwSU2AwEaSHd1Pxc
X-Gm-Gg: AYBFou07n3LTS8e6DVBmyXjSdaLYO2cCGh6H8GST+mZXKZ5FFQJIYfx0307IBUP9EGD
	ncfnfoKF+9tby5hG248EUhV1p1V8JCSzu4JPbAZ4AlkfaF4jpGgsG6tRXBUO8k4UnEzN2Ggd3f8
	FBiS0nyd3GEVXavEaNIOe6hF54HjYvPaD74J3EceqfoKSeE2mCYKIMHsCzQvjLsrdIgWgT2jLZi
	JlNpCj/DMMwZbtLtOVfvJnTD64xCYt1qpuSc7wT3RD9O+us4Jwm2J3UXnxaLaJFa5Xgwx3sd3Ar
	VLN29Z8yytV3VG7vA55qZfWEcGML7vQiRAfcgEuZI8mYQk35zq4NnrzXTj3jhK8cxhv8TtXTdN3
	m15qZW9VAeO+nTFWom4A54hamTBXiWdfFjCHD/jSAIlnOoNeMa/1TMdEoA4nVAp6lWs1jizj7CA
	tSjBUaH7VkIVQPPPS5Kymv5eT/+GWea050TnI=
X-Received: by 2002:a17:903:1a4e:b0:2dd:c053:c20c with SMTP id d9443c01a7336-2df5b26c9e3mr13235675ad.40.1790051628299;
        Mon, 21 Sep 2026 21:33:48 -0700 (PDT)
X-Received: by 2002:a17:903:1a4e:b0:2dd:c053:c20c with SMTP id d9443c01a7336-2df5b26c9e3mr13235455ad.40.1790051627874;
        Mon, 21 Sep 2026 21:33:47 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e6129ad40sm1906375eec.12.2026.09.21.21.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 21:33:47 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 10:03:14 +0530
Subject: [PATCH v2 1/3] dt-bindings: arm: qcom,ids: add few more SOC IDs
 for IPQ5210 family
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-ipq52xx_new_ids-v2-1-4b1a0f3d04b2@oss.qualcomm.com>
References: <20260922-ipq52xx_new_ids-v2-0-4b1a0f3d04b2@oss.qualcomm.com>
In-Reply-To: <20260922-ipq52xx_new_ids-v2-0-4b1a0f3d04b2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: Opkvdco4o9bd9JgKJtp429ZVuEA0xEiA
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDA2MiBTYWx0ZWRfX75vFegFY80KD
 GUt4tIQ77SrUbihb20VBICkJv1IGCfVB6M1LdjxWB0GUsK9aE43fX811YzMnTeU3SFFeFuf7kNf
 AwlsUxB3KEP1a5fkeCRzSOGab2qeWHA=
X-Authority-Analysis: v=2.4 cv=U+4Hnuru c=1 sm=1 tr=0 ts=6ab2052d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Ieg599Pkg-FuY5gSfokA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: Opkvdco4o9bd9JgKJtp429ZVuEA0xEiA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDA2MiBTYWx0ZWRfXxfy2kv9kOhoq
 2v++WRuKJsRrO0eL6wIzVEYqhu+621v/dBfVdMEghvjIp24K3SGyACRS6HdSaCL+MIsXGa2FYdC
 myl7LTzsCyROvBItwGPB0oumW7nTF5O2036dif5tLk4mYywqMTRq+//byVHCRZjdAhUK3lR6iu5
 yNVIOgbiW0hFcm5cozbkvaf5mOGx9CRGFHEcBq0z9W9OukbvZSvLIXFb65DJmvi5RcbBUdgGemF
 pzSTL2GwD0YSd1sOwhCC8aSnOoJhYpGipuNK0HbnQrrvvYjCHShVZvB78OMp0riima+fK0frGGQ
 kGC+QIERiirZez+YCnkmIDpy+8t4AtcA8SdxSHpEFnr3gHX0g1tNo9qXkqvKTYb5rTEzvHpWjYu
 RNHK7R6zeeNJv7S1+aqxMmpuKKxIwPONdwiEkGjbrNxSj8XTEWEbWj/vKerHSbaTqtPOjlXmRWT
 +k62WcDJmuMA5Rcqz4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220062

QCF3211 and IPQ5211 are the new SoCs based on the IPQ5210 family. Add
the SoC IDs for the same.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index b63e4a0b8e54..f251d4c75612 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -317,6 +317,8 @@
 #define QCOM_ID_IPQ9630			779
 #define QCOM_ID_IPQ9640			780
 #define QCOM_ID_IPQ9670			781
+#define QCOM_ID_QCF3211			801
+#define QCOM_ID_IPQ5211			802
 
 /*
  * The board type and revision information, used by Qualcomm bootloaders and

-- 
2.34.1

