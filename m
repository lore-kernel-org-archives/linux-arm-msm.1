Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C62A1D9A70
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 06:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787033778; cv=none; b=Vnfvo/0SKZIrBhO6bAHwncAUnHIai04BYU2x+lregMG/oQlNfddJy7choqOfKC3HuLbAkA/1wIDsanRKbegU1wwfZqiQk+/QxSaRB3H8KJKU2FrrlocaeNl9B184s3RwFsquCRcYCO6aqPZcYOGB43b3cqzqHdrFk52ZeO0ZgAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787033778; c=relaxed/simple;
	bh=XE1u28cadef+wWyqDGEXPN2POnkaWjEm9e3dtilvYnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nFR4TLnb/JvHa9QAQwJEktA9jViHbD0C5WMRRy91gxHNyfuXN9DPoHLMDGUw25jzI1SSx6uh/I+qfLYGZ/WTVywNPGtEb96w4ttgSXdHbVlUh6MAB9JId6ujN9SOXCf8issO5bqqOBag0d02i39oUqtH8AiYqp2IhqmiBM7lSAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FqpsC2Nw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LUF0hNuY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FqpsC2Nw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LUF0hNuY"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I4bRvX3464888
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 06:16:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rracbgBVd/nZrkFuOOwe3Q35Ucj/QEAkd30Y/qa2kKs=; b=FqpsC2NwRkAO3PTQ
	Mx+N0l+Qr9bfRR9xIldfhKCLISgUJFF6gcNMOlFXtdQe3VIr3R+eMoX4CVHgOvj2
	Ck0lN51ZgK4zsg7wHgtTujNBN1fK/kvuum/8VHu2MmHDrchaQyyzAgKWaqRkleZb
	p+pRq7aMxSfHGNSxGj6SZomAzT1QLHoxBzW3wtFfKwVhSHkFk9khqt87AhGdYRWq
	nab71gmGWfCj6lZybQ4rsvjtW1NZykQovWSNBimcn/XzObzZ0kDQURljxmjB5LzG
	gUqbS/89A+XTpJvXYRCeq69VciKTgi0To3QbtOPEaq/qGM1dPC9JHb5BwdEtqHW6
	aEivlA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4611b283-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 06:16:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so76907725ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 23:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787033774; x=1787638574; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rracbgBVd/nZrkFuOOwe3Q35Ucj/QEAkd30Y/qa2kKs=;
        b=LUF0hNuYwisVT/+BTBveFzdHevrG4fImVffN+UdyIdNLG2KnhFDxnnS1Y5Xym3jRRB
         wKWj8TINGJpCPEA8akzwjDLDf7m48A772W4wDyyJXoZiO/SMqHDm6c//M1HNrZLk+xCi
         01RNoMTMSLMs4vM4kfR3fWNThgi/Htgkp1/6YunG1CiMetgQQYW3ft4GexVa+VXXpgfa
         0S1RywiSl72mz5HGskrIzYWDwTnp6H+MstZFHklHqw43mAk68ePgXW6VX9szSKlivXkd
         p67YX9+kHsQZKg+60ZInt+rTaIvjfuuuNxHFDQMVeVeU+1/zqwYEH29sVR6MxYIZKJA0
         9Dvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787033774; x=1787638574;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rracbgBVd/nZrkFuOOwe3Q35Ucj/QEAkd30Y/qa2kKs=;
        b=C0lLqzWCwmpwHtPep/VCz9euKc/umF0wQzyE+Qsjvr1U26jL/tGLI3+vWJmkpfrghD
         FXejl11MnVgANs7S1lHjIibu60XxQAioAPt3B4ljKGe/TNrimuon3/0vaU1mSl/sr0Fu
         6zTnUUGsRLzEjpQDRVUjPJlwQ89m8XWeMyMUiZfjtOLhXYEb9glMbtoW306xYg9lIuwj
         s1wRfS4GFDNcr3ZQ9QfojvloJuIFPBGAjH1y39bChojLU/o/GO/0eADVTBCHmT+/LpM+
         lD1UEmBIhqdw8of22McJ+xm96fPOQXGDLXQEuDQRrlj6W3OXZRjOJ9vVpg3z2+UXv788
         /iIA==
X-Forwarded-Encrypted: i=1; AHgh+RrVWQdLyHj/Kqw1eYZ0mrbxqAwDrBQ+4js55SISP0nmBixOv+U0H7o8EMkECFlEerwNk6bD1zC/B2HRW+Wk@vger.kernel.org
X-Gm-Message-State: AOJu0YyrVTmTn1FOuuCS13sYO+C7N0BCO8ABCxIC9BvEQj4AIgkSNeVF
	exSbYxzC/2O9alDnH8JYiTG1Cd5jtZfNlm8UauSLaRRTuOJeCtnLIy7hPnL0a7pCCEhG7NQ1z14
	cF3xUYDVK+FMfpdSnaxUOWruOttRWGgT1hd7QkBex7x9UgvPtHBtmra+yzUDMluDvHWH5
X-Gm-Gg: AR+sD13NGoO2DFV9YJ2J2yEWUWX6KXDQWrnOLKzlfwM4mR5eQTE7xKnClj9eEjM6yHg
	7U5NFBgAeOs818L045SQmCQlyiqefVA5AI9n7Gm796FpWGrYATe9yElIBy4pz/2AVlUf8iJCRq+
	ZZ2T52FTyD4/t9nqqG20++wQ8WOuIpj9ScfFSRUbZc51KTBX2jXVPp+/TWtLl//XLF/ONDYocMn
	KiSZwduBXznIKOq0zRgCLra9QMUmDzwL+FMyOGrYtxGx9fiV9o4JeIlSHfngKHxt1ephYM8SWfK
	/QwAjxOmp6LoICTwKoOhvVPgT1ytW9CrsZ0y9F5a1NZcBe3410gUYCQnoJNcJ4kEd7avjQ5YYSH
	V1nqN9ioEx+7IUe7qDMHxz8hXg37qNtMOC+bJZBL8ebShGFk5Bj0=
X-Received: by 2002:a17:903:390d:b0:2d3:89fb:35fb with SMTP id d9443c01a7336-2d3b04c40a1mr365252245ad.0.1787033774194;
        Mon, 17 Aug 2026 23:16:14 -0700 (PDT)
X-Received: by 2002:a17:903:390d:b0:2d3:89fb:35fb with SMTP id d9443c01a7336-2d3b04c40a1mr365251525ad.0.1787033773782;
        Mon, 17 Aug 2026 23:16:13 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5bb499d7bsm13719685ad.3.2026.08.17.23.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 23:16:13 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 23:16:05 -0700
Subject: [PATCH v2 1/2] dt-bindings: phy: qcom,m31-eusb2-phy: Document M31
 eUSB2 PHY for Maili
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-maili-usb-v2-1-97d7317f64b3@oss.qualcomm.com>
References: <20260817-maili-usb-v2-0-97d7317f64b3@oss.qualcomm.com>
In-Reply-To: <20260817-maili-usb-v2-0-97d7317f64b3@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787033771; l=1041;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=Q7irTamYM4FsXhldCMcVyVUhkh1gcklQF6hPAW9V7xg=;
 b=0NuIALMLe1Vk604Sr4T+YtIZ8YOw57yJ+XICdl0Ugcl/jtfBUIzZ6LVfyC/OaiPb62Wqkh09G
 MVSAzVED7QdCxBxy+35J1bDfRRMTjWz5iF7/v/UfsDr9bHK8T/6QPI3
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-GUID: RH99BpPnoOtn9m41x-QYefm2OorJHGLg
X-Proofpoint-ORIG-GUID: RH99BpPnoOtn9m41x-QYefm2OorJHGLg
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA0NSBTYWx0ZWRfX/iIDSCN9pbe0
 thRxZMyLwTU2jWQP3guSQ9ex1lDp+KPxQw9IjWLHsM+uNRQDiJw9qrThh00O4/uvaBE9PNKr3BH
 zLgI5xsmBVoO+gaxIEg8o7YvTmPTOoE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA0NSBTYWx0ZWRfX2HMHS0E8A902
 Nc4F5uCOA8QTFWOj8JKDHiMzsM7U2/KO30g5mtkGYHMUY4AmH+GrDnFtgc7aC2toEmK7BP8wLjt
 L0KX8T42JfCx5RbZQdl18su8mGq8FEw7NunFHbXagFMk05pk1pzaweH7jLXAccmgGatIW07+EcR
 A2r2nlMfm6jWzXB9bbzH1Buw8iy+S644W9U98GqChMs2YYcE4wzmpKlVnF2awNw0ktiLy01wyoK
 nCmIgz9uvKjUx5VcXLsSAEFLpynuagXv5KNA9JLBSr7bWYR7mkwkLo1U9yG0jhoDLyq8dVFnjuD
 fnQsOZSSymGe1blEzw9kyfYRgG9VGYJNwJNqN2fqKd2ZpDSpIgebF5QJPyspE86RuUBte8hWvuW
 Oj040/TLRoe6ADmm17jlSZJzLUzbTYEmK5+OEPmGZ4fvBUH49yiMdycldf425f3OMyAtK2QdGzD
 Q4UVlrSAmM6ooz52lYA==
X-Authority-Analysis: v=2.4 cv=UslT8ewB c=1 sm=1 tr=0 ts=6a83f8af cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=-YzSTstMqKbG7k7xZsQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180045

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Document the M31 eUSB2 PHY for Maili which handles the USB2 path. Use
fallback to indicate the compatibility of the M31 eUSB2 PHY on Maili
with that on the SM8750.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
index c0e7e2963ce6..613fa5cfe9a7 100644
--- a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
@@ -21,6 +21,7 @@ properties:
               - qcom,glymur-m31-eusb2-phy
               - qcom,hawi-m31-eusb2-phy
               - qcom,kaanapali-m31-eusb2-phy
+              - qcom,maili-m31-eusb2-phy
           - const: qcom,sm8750-m31-eusb2-phy
       - const: qcom,sm8750-m31-eusb2-phy
 

-- 
2.34.1

