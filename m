Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2ADA3A3E6F
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 11:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784633741; cv=none; b=Geh/7vfq5/WTQAMuCY7JJpqmI3n/KadYqlDkZLRsulO8XkS0JZGIN58GUS+EsO8K4ilzyWedYRO7kBi9ja6CvnAzv8cxggD88a9CUfo4mHin4NdyXrWGNYlwlLX2Cd0mQf0PSJnaLyX6DRx1lMYHi7rOjxUZMHGe5mhSeGGln7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784633741; c=relaxed/simple;
	bh=kYCw7kFj1Ar/UWyK7td5eGwp0BpfpVW8O/ifsQNLcUc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IyUvmOBiNxdI52CmJkjif4cOFadrZLvIGYfYT8LVLve9jHtrdnMcZeqJV/UzgtjpgYnm8+WgWgmnjt97whCA9XNtumDOsMjipxTcOSiAxrVI4kRsgudhkB1Cnelx7+8mST8Ce7nRHfQi2tbKhj5Jr7QFIAKEkhJWbo/t2W8ooqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N7BW3Hp6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i9VKRJPF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N7BW3Hp6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i9VKRJPF"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LARTxV1455614
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 11:35:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=jRsxccGB4f3YCeySZ5zozK
	e+JJroaGspCDGGcBVYVdw=; b=N7BW3Hp66FiZCskxbZ//r3v8tyOKNznm0aYQ/R
	VbFb4X/Po0ayXjZtaE6x+a/8K2y1rxn8PIVcIRh/SruSM3mQw6wPuyrvlj6GYTPn
	8CCUoFA9eLGfG/yXMqdfRm6ksKqRhL/Jo79BnmF/sAhUpNwEHyur5NaUXO+QdpZ7
	/fEXLeQ3qiZUaAw64mRxxR1odL0EHvQCA2ijwe8NAkayF1oG2oRWVvC+9MZM8iYd
	XYnutqcHXJj6mMNTmjLFZIIyoCVSfe2EEkb4lQv+ph3DIrka6C0FNKRu1/SI6D5P
	jsbqZBEBDhRLfG8bVi5r7KngYeebygJapO+DsB+0+MEkh7hw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1duj10d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 11:35:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bff5c7035so120432891cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 04:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784633738; x=1785238538; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jRsxccGB4f3YCeySZ5zozKe+JJroaGspCDGGcBVYVdw=;
        b=i9VKRJPFyWrLWNIoR7h52bNDDxgwq6T3xO6pwQjT6UUAYqHL+lFeOtdZglmMKQwLIh
         0AnUKW/WEtWI3LmGk0UWa2BLUARSd3cFDe2KSjo/LhTazPTyggtvgjxXcIzteS9+7X+P
         NlSMJBshjlan4wIPstjGc9wEdwWw5NrH3CnW8EqIYXhHYEYJvOG36VVrhYztbB78HkCl
         UOK4YxsxanahYkcR+yd5yGXparUq/V0nPUl4yI9ouPJ4Usj5fTEGd2FfvIu3Qu1EOcUB
         5ARD5qOfhX326RSj6zDQN+gIqU4R4DXioTMrOhWcmbV2niNHK9NE0SrTdM0r1Qk/1oET
         WFCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784633738; x=1785238538;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jRsxccGB4f3YCeySZ5zozKe+JJroaGspCDGGcBVYVdw=;
        b=mefSvzML8ngO2Pyr7b0/nK36Cam4+/Q701NsWcc18ALIwhRdTulGzmTxaQlTYYpyOh
         R9nvuKrCT4vAycjyg9g+BMf5E4YLPq1uGS4iHauFdgBj3re8+HXQs/geUdGQ3LQfPeuU
         +BHJ4Sw0y1TbkLrjGGXVfQTnsVThMll/WPDYi+2eTub8Pr1dI3RCzmWvfq2RvVViwrTq
         BvM0H0UDaanRVj+cLbxiZYpNseQMJeSPMF9AbzSG1YvJkKFZDm9Al+EJHPvzK5HFeLf/
         DUt2q4S8nNc9EP//CJhQ4JbhgONe/x8Gi3+jJYaGniZO5iNKBg+0CogMFSOO7GpeED7e
         plWw==
X-Gm-Message-State: AOJu0Yzaj6Wkd3pBhX4vydEuFOxUP1PG1wP4W5Bmz11CR7ji+hv+5qVI
	IeQSpR1PKd+Vow6YovkYBgWgFKg4tBeLXCu00nmwq88z35bc1RieY99kFoiFr20895qzPZRTqlL
	eqej1sVR/38SVlA5RWJhHXLRmN8VLR9PhaBItDAyoADkMCIHEFStkJlCZS12E1rpojoaa
X-Gm-Gg: AfdE7ckR037TQFkRbsOiU/ZgWZLXJWv8bWdwtgr8npZAYjV/9s2UmOOJKHeFvhd0E+O
	MsjiFkqGgHkfCAYFlm2sZ54oUN7Uc+V4CTiPtP29wIXHz6o67OuPcnnjhQcVFNByY+ujq59dj/C
	G3+3CjYC3edVqngvTbRohWEwbvcpGmbWMnHeou1aG1yuW62hknkG9fbJp3Hk2YHcbJXVxpD6uj7
	5uYKPfn1AlVp407n+rzJIyINQeRCSkM0Wdy0JlifAxNFwW5U7qVxxfGSbL5927280nbSjP8J53A
	HGUyJDmCObIuUOeJHoMGVtzAYjxIsFenFfeMfOwFJYjcJL8BlRUQgRJCpMNjXiZref2lk3+go/Y
	MTJf37Niz
X-Received: by 2002:ac8:5844:0:b0:51c:100f:f91e with SMTP id d75a77b69052e-5213cdcd5b0mr165068371cf.72.1784633737971;
        Tue, 21 Jul 2026 04:35:37 -0700 (PDT)
X-Received: by 2002:ac8:5844:0:b0:51c:100f:f91e with SMTP id d75a77b69052e-5213cdcd5b0mr165068031cf.72.1784633737360;
        Tue, 21 Jul 2026 04:35:37 -0700 (PDT)
Received: from hackbox.lan ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653bfed7sm69798075e9.11.2026.07.21.04.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 04:35:36 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/2] dt-bindings: remoteproc: qcom,milos-pas: Fix ADSP
 bindings
Date: Tue, 21 Jul 2026 14:35:06 +0300
Message-Id: <20260721-dts-qcom-eliza-fix-adsp-binding-v1-0-3a0b03af2ec7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGpZX2oC/yWNywrCQAwAf6XkbGA3Bxf8FfGwj7RGdFs3rYil/
 96ox4FhZgXlJqxw6lZo/BKVsRr4Qwf5GuvAKMUYyNHRBfJYZsVnHh/Id/lE7OWNseiESWqROmA
 KwVM0O5EDq0yNzfkdzpc/65JunOdvFrZtB7XDLuKDAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1213;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=kYCw7kFj1Ar/UWyK7td5eGwp0BpfpVW8O/ifsQNLcUc=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqX1mDYQA/o7XE1WO+jkEelvdyN6iq2SAcYDbdv
 wqKD3XVU2WJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCal9ZgwAKCRAbX0TJAJUV
 ViBeD/9gWRo24vvE5d0ryfEjYZ0UdIFgccFzkJ8azz6JX3vheOQUMc1VK14IcbLaRJ/rB+tG/2c
 QzLdLMqY2TGUYAFfAU5dcWqAxn7swa4n6u/spLitDauWqIuIKeYAjupKwhzfDYtWHTkHxlcE1OZ
 DnzfoybLE+pC7HUqut8n6THb/z12fZnY85xXMxD6HzhxrJAJNYHsjp2OIB3HsvobvQyUsoIOrxo
 gEzh3tIl6yRiNcgLNGqT5iHK8DAyBzw8Pfq5GpFaNMaheax6YOF28HconTJmG2f7CNTNQfNIF1H
 yesxQIRmFGHtkvInkhH9DeYUHifRzaJUEM3pN03LQ52HC5UV+uDNfG1Hf52vmBaTKKxshqXDJYw
 megzIvlkt7l5Ex9hfZvYuFwNEBPLsHXmpVHjDS0ShcU+e9mIndvJM47IrwjSHVpI+X5gWkdpYLG
 h+w89QjIPuiuoKtgxREYnhW/Tvdg7zbk+tBrKYfXyHMSS6JxVfWwqgGYUD/N4QU4GJ9RnUXpny+
 IvNaFbvYmVOCa/xb54xF0Ibli71kj4H0dd5OhkfmsSv4trG4oL3bsefRs3x73rEgyKv+MYtd3/I
 LCcFR3ueLJsoVCWrflNRnTCv4+xPdwf3iOaGCxmhbLguR3fgIiOgQzNE8OXIVNbl8n73ty6kjYr
 RoW2tVbzcXWdltA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: fIl5-yT47UScsD8Ss42yRjh6raELj6_F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEyMiBTYWx0ZWRfX9Asa+gawr7jj
 jnJq6Jvsbx/Wz1fiVQKCEu9xJ5xdOs5i2avRooAbVB/BAYYoC1a0HPE1ZF4cY3CfaDCi9qoD/bq
 llr6LI9X1x+zN9Wp4PAD6Y6YECoWtqmHkTpPINfttKknlswM5eBw4V5DOcIciaJukg9uPKjLdKK
 dFvTqyzbxHZ4kENyqkuc0LGXrqmszDENep/2DhNXVSSbhMD0f4wYO0nunoIIsRJzqzp0RljOadX
 9GrKBAyEa0RFcyVYsuw9hjjIBUEcSVXhp39Q2dunT2pL1uytrqQBiKt+3Z+z6xTCqy6oC2xwV0Z
 Pw70o9D6pLxzzlo5PQJddQu7EJ1+czRNtBZF95ZhIPjuBYLgrEIqv5W/UYxZs5rHtwLky5+nPav
 kbj57VJbgAy0505d3j9v5wRjsLwV6lrLJNvtJbEE5OkvliDL7uMIwMeg16BHPnYnUZ24KRh0FrR
 EnKKJ8eaGCsnTUwNt1w==
X-Authority-Analysis: v=2.4 cv=I9JVgtgg c=1 sm=1 tr=0 ts=6a5f598a cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mTG7cVE9mWrA2Tac5S4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: fIl5-yT47UScsD8Ss42yRjh6raELj6_F
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEyMiBTYWx0ZWRfXxyydEU2lkGpz
 RR+zG7YpQ5B/aOgC6/7l0xu6Yj1GTKAmyHiOskn+XjIg2xcWbHSWzhrr2e9XbV3vNph6fc6bZqa
 Bfr91Dq3m1pirkpe/4aWK97uDQKvf1M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210122

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
Abel Vesa (2):
      dt-bindings: remoteproc: qcom,milos-pas: Move Eliza ADSP to SM8550 schema
      arm64: dts: qcom: eliza: Add fallback compatible for ADSP remoteproc

 Documentation/devicetree/bindings/remoteproc/qcom,milos-pas.yaml  | 3 ---
 Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml | 3 +++
 arch/arm64/boot/dts/qcom/eliza.dtsi                               | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)
---
base-commit: 3fe08b9796f36ef437ab9328e7dd1e5ff2d66603
change-id: 20260721-dts-qcom-eliza-fix-adsp-binding-b7712a026b20

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

