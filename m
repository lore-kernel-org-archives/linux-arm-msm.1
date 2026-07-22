Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC5E3932D3
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 09:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784713270; cv=none; b=LqwC9UQMZ1u/xmmI3SyeoPX5l8zszl2AzSiG3E+Mpo7nyPzY+ftXUlbHkiMakdXb7F9jR6YkeQVhmdoV1yYHPWwi1Gi96ZJuW/90n8xbnZq6Pmdx1z7kELeYW8A23qLMwB//WjAWVj1z7tEA2h2DKoVQkPdkXw4PMMlEQJ9RJNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784713270; c=relaxed/simple;
	bh=iT9YuFFXjgaBojfRJcbqgLtmmC8ZuRafDSnz64fUB74=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SYnRr3vRMsQYaKpKFlHEoNA89lwtnXE8DKkI5b2+oocdzeHi1cqyrSnb7/SaJKDyxvrkEl+ahxIBfKzHTxxVR7jD0UkWFVt3CiHLqjuXu4Sl+wT9hr2kUrKyXUlnQqOPnRMqhLVLJdJf9SBT22jOE4zFD8nGFNrswDeqq5uj2RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IHkqKVzw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UPyIbPJ5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IHkqKVzw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UPyIbPJ5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M8x5HW383754
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 09:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+TMfjx9N2KUMI8HVE7bQBC
	ezBkzM+oKRVtPJo93ryj0=; b=IHkqKVzwrCryF813z5quh/1DexJ+GNz3Wi5NF6
	lWcTC315/t92nXCRBTaAVEsPEJJMtJkU34taClcVEJ3TDTJkN/DgwTSgqe188THq
	KsnHnnhI1LNa5DYLqv2zZp1Th9HrftveZpXq/PgguGBGeyQJ4i4/NQbgSR6WDimH
	K2sdafiMKl3hK5X/enwEJY2ozOT9VpdDkYqzzQLIaotupZJw/ljee7IFKK+XxZVF
	ev0dt8yLRf/06MfvmEa1PTVLb4keUo/Ewxn8cZ8dLI+VVY4euzhpj+1nN4jxLils
	1Z5dUZobpFdbcFSkfJmpDAHwyh/HtHw3rroLkhg5PEzlTJ7w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjs928mnd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 09:41:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5174a23afcbso111537731cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 02:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784713267; x=1785318067; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+TMfjx9N2KUMI8HVE7bQBCezBkzM+oKRVtPJo93ryj0=;
        b=UPyIbPJ5QlDefTb5XRLvuc6HI9IwCB9uuz632RQSiio7P4Gy6phu21ll6yqIRvMjZZ
         NAA/FXpGV5d6e6eVAhiXvJV3L3F1nuzWUS6qt+Njc1WpDC9iX+1GVRTdttQaMFgYnHHk
         FS9hQ0edGmc6of39kx954IQpwqWmhrxVvRXsKZ3Fi0ygq0RPPWXPbJe+iPneGQtKcjVX
         D66WNS6CbQia6dbTM/2if8ph3KJkdVZmUItez4v9DtVqhtaRkDueCm+JRFgisD9qgoAS
         AZvaGD8l3RiyxzjVEufeo0FgqL5P0Q8wBrD6248AT5C1IoHD9+1fzixzsCnMjPIgSZAa
         PTIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784713267; x=1785318067;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+TMfjx9N2KUMI8HVE7bQBCezBkzM+oKRVtPJo93ryj0=;
        b=Ofpn747z9w+ajoRWkaOkKWIw98SlsfgJjPRJ5hjKzhyNk7f+o3LEkIKyHVlEfZ0TPd
         ClS/q89yfrKrq4pOZrgoXmcpltwKmhhlk37nnPgquOGvvsETF1uEpi0f6FOuklaUCJz2
         dNT4Qq3mJCREr2TTrN+9UThZuKyWJ+R22NiHZbIKpU1AOgCxcfcnkmMTPl5x6MfJRvDE
         sOlUGO8igjpKt4OXRGL+VPTjnWz0v/gfUGOvu4JII1yzql0sb09K9DvnrXpeV5RhpNKi
         l4Gr+jJfasowDs2QBqMt2EVS8c9R8pN/7oHBkYA9cGGZ+HnaoKtfRVkvTMec6LHaGUM7
         bLJw==
X-Gm-Message-State: AOJu0Yy47xclkdbbXbUQk64I08cINwEjXNh1430ZYYQpAsS37xqoV6rK
	aq5oiZOFjpZrRb9dAgOzjO6CMkwPZ1TYm4pmdUmLBfIM/sOfMqRPkd6bW4WJtjy/KdG12D0Vlpi
	2dsrSO8w4WSY9CYAqY5OKWhbG2kF6sXu3IHfAc8kQh4rJUEosxskkwxPIWDZzTj9QGd/HIs81f4
	aU
X-Gm-Gg: AR+sD1279+Ywm8DJM8uYcpvAcniKd05XIKkdBLCO+dHKKKjlFW7mLg7R7GhXWqkN1CN
	3jqSvXfRitMx7cerKpdBy9cL3s/UPFM8CJ/2bm+IvYBX+sY1/ezGrZiQnXQpZDEFgeEwZdyE9ka
	SIkMnX429IIaqb5Ey2OSO6G4oDU+JrZiUxM4mlSTTuaBNSlrtfrTscZ5a6PCrXqFeh76C7OMK03
	+oWIMpfAMJs0JSftM6Obtemo33kLGJhmAe+e6Jawl1p8ctJUt2Zoi20zghKmxGhRx7jNjDa8brc
	UjizqTbpT4S+zP0KBAoPRmBA7rbv5Ekmt9/q6ism2D9fBFK32pUwA0Dpnz1M6EZG0r4FV8nK64u
	dSUl7pRJN
X-Received: by 2002:a05:622a:2616:b0:51c:10aa:9ba with SMTP id d75a77b69052e-5213e48b0d0mr199588761cf.46.1784713267077;
        Wed, 22 Jul 2026 02:41:07 -0700 (PDT)
X-Received: by 2002:a05:622a:2616:b0:51c:10aa:9ba with SMTP id d75a77b69052e-5213e48b0d0mr199588441cf.46.1784713266353;
        Wed, 22 Jul 2026 02:41:06 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c6287csm4816398f8f.25.2026.07.22.02.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 02:41:05 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v2 0/2] dt-bindings: remoteproc: qcom,milos-pas: Fix ADSP
 bindings
Date: Wed, 22 Jul 2026 12:40:51 +0300
Message-Id: <20260722-dts-qcom-eliza-fix-adsp-binding-v2-0-e1e98ae15533@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACOQYGoC/42OTQqDMBCFryJZdySJ0EBXvUdxkT91iiaaUWkr3
 r3RXqCbgQ++995sjHxCT+xWbCz5FQljyCAvBbOdDq0HdJmZ5PLKlRTgZoLJxgF8jx8NDb5AOxr
 BYHAYWjBKCamzbSRnuWVMPjvnwqP+MS3m6e181B5GhzTH9D5fWMXh/b+2CuBQaW54pRvprbpHo
 nJadJ9DQ5kPq/d9/wJYu6Rv5wAAAA==
X-Change-ID: 20260721-dts-qcom-eliza-fix-adsp-binding-b7712a026b20
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1523;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=iT9YuFFXjgaBojfRJcbqgLtmmC8ZuRafDSnz64fUB74=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqYJAptOAuhCY4+JV213h4O5A0u94/AYytZh+WB
 PHETQiTW4CJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCamCQKQAKCRAbX0TJAJUV
 Vs//D/9EaPYbyhtgif2Xi7VYM2eVwslnWgzk6EMTjPWXKvCR0Ru1U8jn/HUANry4e9YFcBEcapB
 dynAmEzY+rdeVfdS1mzei0If43dxcAg8khYu9IIga1H1irYIJV5aRmq53fNPDEUEoLxc8p14XE3
 uM7v73PB+C58iFH6MRaz9Afv8VGky+LsMZAXHL1TwEGESx/SA4JEWNWRssc/jkyrhG/Ccyu1u/U
 F+GIaBUb6eF4d8qkEuxeD2bN4kyntW3orvAoDN6IOUtzPZ2bxrUg9XsBdVaYVgF0V8b2bdmDTA8
 bRRR36dMGDV9IwSFta2LrYvdyWaNkjgvLmyHQXVvr1DmJbPWVfTYkSGus8dHqngGABoPYBz/N2N
 v/6wn2wLigvsdvXqh22utTFyXIdXwclQbBuoBsByD5lnU26GDerVkohdMpcVS3PrM4BS+Eilbk5
 QYBvl43B8R6tQ3Op2SqmeGABJZtXIWXL1OETHKZhq9xauwIR8ff9KEnrRqKZd/gfcj9NckSjwBe
 NAl427ryIa7b281Fr5Wc9dL7AOmCWhOwLcDh33yXOF+2hySVN3+a7nm1azXHx20qcsHlmHHlHfM
 1hzWB+vK1pzq1BcsNKqCE7d4Mv1pOMlQ76J6zuRgQAqnJX2wS3pFfLKB1KNkHNz7XlWAbGyHKq/
 jgSofwDYrSoa7lg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA5MCBTYWx0ZWRfX2isAdoqAY9yT
 CmLXc7d2qHALT43AQfC3j5ywR/BNKl78I7QPK42o5uvUrcsJk2SIdVxbY4Q6raZ4fu8cVQ1Alcr
 gALA3R+9wYTWpQG1Ji9R3IuzD9F4h4c=
X-Proofpoint-ORIG-GUID: P6995FzjYJFZjG3vPvPr2SJ3xoXRUeu-
X-Proofpoint-GUID: P6995FzjYJFZjG3vPvPr2SJ3xoXRUeu-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA5MCBTYWx0ZWRfX2TLuIXD3U0jg
 OO6inY6Ml09jv1gURorCXLzxjnZaY1b4aXHh+nFc45rtxEgLorXnjTm5P5SaH9CFSCOL/ovrSoh
 P38J2SzjFTnn+KjUK8HekjGXrmLsgmZPkV1neQnQ3lRYZm56Hs2faVZuC+Xt+pgNGH/4S302hur
 PW3N5TWNEpblvkrzW2Nl0+1FJpqN9yNjZSKPtYUfcyyd2a3H+23OpVV1ulV/g+DTZVGI0xks4Q8
 68odMs7mvbGUb7p6XxY87X7vQepr/u7lgE2dD4T22j0lLNI0JP7y/erHGwDuO2m4nBhQGBvorpK
 h9Fsr/ltIVVY9s2XHD4k+pSXxUfe2+3DXH77j5ALZfMDfcNnB66WTDCPWVc8AJZ7e3fRYpMVJYx
 Ynb0JGphQ/cqgcXJdl0ALXiSM3kN8gACUDJOZi4JDeXme0zrJszR59mF31DAD6MgqT3Gr2NwVgv
 uSkn4h/aXdYYdINpu+w==
X-Authority-Analysis: v=2.4 cv=QahWeMbv c=1 sm=1 tr=0 ts=6a609034 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=mTG7cVE9mWrA2Tac5S4A:9
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220090

It has been pointed out [1] that, since the ADSP found on Eliza is
compatible with the ones from SM8750 class, they should be documented
in the SM8550 schema.

So move the compatible from Milos schema to the SM8550 one and then add
the fallback compatible to the node in the Eliza SoC DTSI.

This will also now be in line with the SM8550 driver match data which is
tied to the Eliza ADSP compatible in the driver.

[1] https://lore.kernel.org/all/20260721-benevolent-wonderful-kakapo-ca8c2c@quoll/

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Changes in v2:
- Rebased on next-20260721.
- Dropped the hunk for power-domains if clause, as Krzysztof suggested.
- Picked Krzysztof's and Dmitry's R-b tags for the devicetree patch.
- Link to v1: https://patch.msgid.link/20260721-dts-qcom-eliza-fix-adsp-binding-v1-0-3a0b03af2ec7@oss.qualcomm.com

---
Abel Vesa (2):
      dt-bindings: remoteproc: qcom,milos-pas: Move Eliza ADSP to SM8550 schema
      arm64: dts: qcom: eliza: Add fallback compatible for ADSP remoteproc

 Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml  | 3 ---
 Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 2 ++
 arch/arm64/boot/dts/qcom/eliza.dtsi                               | 2 +-
 3 files changed, 3 insertions(+), 4 deletions(-)
---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260721-dts-qcom-eliza-fix-adsp-binding-b7712a026b20

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

