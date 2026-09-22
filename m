Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA634A3879
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 23:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790118392; cv=none; b=RGaJxjSDxucNaLrkexcLv66JJJFYZotk+8PP+c6bi+CuNy4vDSEExUcFuNH/D1aRo/hSI1RNSpM45NEn6mtCt5jfpyXobm3zEpxLKWvIdAkx2r3RQ8kxvSy5v9ZfczzMmO3T5MfvzFVTl127t1SvCtVcYtTigxoJ3W7HbBpdJcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790118392; c=relaxed/simple;
	bh=aty7Z/Y9RI7OG/uBa1GEkCBFpfThAMq7yCI3/NmJ/E8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QrrhWnHva+glU35qsf2ypheGX2JjyJH4wLT/aw/rab+khU1xua0zCq1ozL38ZOKNTw0eq/lodXNtUNoFIk10C67W5I5sxrGj51KEWtzaaE5Zo0OIzJiK0IpBBZIXAAJePBkrsOMcvQGuO38Cg/Zneia1x7q5qMV7dtI5TJuKxY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H7hHw41Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PP3sBhNv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H7hHw41Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PP3sBhNv"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MJD8gZ1166859
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 23:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wx6twfdZPOUQ4R6QejxIsDpWxo0kEzIP3eFbdU3743U=; b=H7hHw41ZGl1SSKB8
	ctf7h77J00sZpxQSYHmRVBABcbfxoIAM2DWjh8BZYJLXMpHL9Rm6BCGwbXU3X0f9
	5g9+F+Q/vBHvNg+AWWhOrBAV4RY5NkJ+17Wa1tdFP95+i41AyuUFmObxvxE9rpFC
	0tMLTOnh5a4y0MnSjn2X3zfGtqJdHQuAbBzY2R4Lmwwc47xpftkit1wvKJSGfUZX
	lgiDTbzQDM1dwEA6Ka40d06Ti5DbI77Xt+iZUoGOyAviCdTyKN3n788N6KRqX8EC
	uFNv7inTxT/Pe0MMQ2qFsb6mHaR21pXsv1LTH38bEMCe+j8Hx3Wk4pum0q/w3gnk
	OX4HlQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guymw10nf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 23:06:30 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-32ab0911226so330729eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 16:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790118390; x=1790723190; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wx6twfdZPOUQ4R6QejxIsDpWxo0kEzIP3eFbdU3743U=;
        b=PP3sBhNvDs+ux7eHXLRNSwFONJIKfwdBa6y8wH/T5sCyNwkhy2X6EGc7n7hFKtbqjB
         10wuUNZkIUHyhWyF5jw1UV/eUMNni44+J0QYGnmMBopmgFsov6U0/4c3sJwAt5i+gCgR
         G3ZBB5FxvYZdnIUoyDOqWACdCRcnuEAFnaFQEJLdN2lwLQRtHuPLtJyaVheqytqy9e28
         giYl0qKVajFG5sIGX6MQDuK0URSSrCQWHqzNFDeql08phx9BTtbJ0D+PHg3V//rB/I7F
         97QXCpLZiNkhrWcY+7bLvGwZ9c/8jmc5+DlOCh1cLv5tuD3Y4Gsre9ntHRvOO41jJMgl
         5ERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790118390; x=1790723190;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wx6twfdZPOUQ4R6QejxIsDpWxo0kEzIP3eFbdU3743U=;
        b=S9UnhTDAwQGJ62RVIlrHPgK8+1aIhlHFjALt8380mXdQJTH9J7JNaS5Ysr7szAuZvo
         lqbqQ2SLsTg1q8mYO6yEJKaZnpiLI3U0Rysd98BnCj3LQMYpTc46N8z9i76HBieEsLvD
         3Rc7bVK7nPJooyFsJZ1cQcq1eBuEK0cLdpKSQkYz3AtgV3akKdYwNHXfu4SnlopcIi3o
         UisCNCWYUZTGV0ltih8KUDq4kzPDOVZEi6/oCh+WwvgU32DAYneNa75uDu9pFapxFpj4
         AN3qHkZHpNZWl+4oIRzgLQvKXAzMJVzeCs3NI/cmFvBvwhCPg4IAx0tUfY32to91NqFF
         BlRA==
X-Forwarded-Encrypted: i=1; AKwUvByJ4jDzEbjvL7IsvLbaTGyvMhcix87UHAYKyDPJkdHcb6QIEbyHfIw3+PHAvZOskoT82laeSIq5ZE6JAewx@vger.kernel.org
X-Gm-Message-State: AFuF++kBjOxlzllPUhLGneZJHGJybDjx15uAsNlyEwX+O3sU3tXj4sLv
	NGkx5FeQxUPFy6iLpEVReB4yMrQk63dtvuobllVAWb5rGk6HyMT8nZnuSoF0sS4TmdhwdPOl98/
	X0thC/9xMA/jaSnaCpb08V1kgEBoWSYdyqh6Reb4xo0BsPXPczBx8NTEQG1zssBucvmQW
X-Gm-Gg: AYBFou2frkW0gyDDABjDWVj0LwsjDU5XyZ3a89vNVc6jliO8S+9uV6JUBbkKAk63h9/
	DSRQf+ZPP54ZGzZl6kgndgWIkxbpaSgUmlFV7FsPTSH1++677GgLTc+JKEYfPmi8etGmHuGpDhM
	YfvoN0fDaVwizsPO3DdUMF39qMkayi0Xi2yG/XdYhN2bq+EAliZK03pmru87zvJKtjr1i97HHpp
	KsWDtYD/SyClTrN+oQSsO5A8xruBK2ulSmcL2B9eB0ugULYB6oI7BCMld6W6tYXZsuUfQnGCCU7
	giUFWLMISDm7K28BVnop5TlLJHMKkS5azI8f00Q0UKOjsyaUOH0Czimv1Ah5HHBKLwpkGy3ZwwT
	ztnu8IHvHxb70p1DsXWVhYRVgn0Cf6YrzkXc/oAEpbL26kzlQkQ==
X-Received: by 2002:a05:7022:4598:b0:144:eb3f:563a with SMTP id a92af1059eb24-144ef1b354bmr1572796c88.15.1790118389950;
        Tue, 22 Sep 2026 16:06:29 -0700 (PDT)
X-Received: by 2002:a05:7022:4598:b0:144:eb3f:563a with SMTP id a92af1059eb24-144ef1b354bmr1572757c88.15.1790118389393;
        Tue, 22 Sep 2026 16:06:29 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f983c5a1sm1737515c88.7.2026.09.22.16.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:06:28 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 16:06:19 -0700
Subject: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for SM8950
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-maili-socinfo-v1-1-a82bd7d4ca77@oss.qualcomm.com>
References: <20260922-maili-socinfo-v1-0-a82bd7d4ca77@oss.qualcomm.com>
In-Reply-To: <20260922-maili-socinfo-v1-0-a82bd7d4ca77@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790118387; l=692;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=aty7Z/Y9RI7OG/uBa1GEkCBFpfThAMq7yCI3/NmJ/E8=;
 b=Kk6nO+tNvqQsfP6nqeNXR4iW7cBFQ2lAF2z7kq52UTQAXnKDcSZsID4SaHzfBEikXaoIyFH6G
 EZbI/GdXHw6BTGeHV1PRrG5GFW2lp8sakCaCkOpveqJKS8w+OnYU99k
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwNCBTYWx0ZWRfXyzDpNwiCtDNU
 jDuubR0ywTYHhQj0HoFqNhEcQa2WNngYWBj5z/zgFh8KABftuj1cRdjaG0w3tkX42GOFTR5z441
 vo0xG6/J/UDuiMjGNjN/H9/meY8sMOp6UeOCeeRuCF29sOJNgU20BsAiZ55Sx9FvSPQBDiw0pps
 S8qdBW3yuhezJbg4z6QZ1BOstAmGXnf3AzEK7LbcO6T4JYtx7HPTywx7hILBw7Mm3O8Lgv0Vud+
 Ygf0ni4aHPWd7v9BrDOWzrlTdO7TiNMmTx47s5g7o2itq7qhZT7IqTK5C8AhnPyud6l5KUl5ZV2
 Yq1q2c3sgS+uigNso1XPRAXAf5sq13TsJH3lLNz8o7y7MFQOoFNoDyM1i122betauGENgba64SD
 MfhhQwtgm9pyg0E/SWu5KdGTBivoHK1Hpuff0VPV+bvcRmvwH6j542Jhzpbtx9rQE8WvkYQZjdm
 Ml9uTLC70Q/sw2Bcmsw==
X-Authority-Analysis: v=2.4 cv=feI4WEQF c=1 sm=1 tr=0 ts=6ab309f6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=w_sQKQHac_Z4O36FQ6sA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: nfdAiBbgz6312dOPZCJiLSHJ71_qsg-t
X-Proofpoint-ORIG-GUID: nfdAiBbgz6312dOPZCJiLSHJ71_qsg-t
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwNCBTYWx0ZWRfXxBJB6jwmNQgo
 0VzxT00fHx0suYGzquJQjn2WRT1/OInJ4r+/361bgcACHGfpOzgtAmVzZrCL74ceeRcqyitDkL/
 bC8xGkCLOPxp7emLYdykzdB4cXDUhWY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220304

Add the ID for the Qualcomm SM8950 SoC which represents the Maili
platform.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index b63e4a0b8e54..7509b489e974 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -303,6 +303,7 @@
 #define QCOM_ID_SA8797P			690
 #define QCOM_ID_CQ7790M			731
 #define QCOM_ID_CQ7790S			732
+#define QCOM_ID_SM8950			735
 #define QCOM_ID_CQ2390M			756
 #define QCOM_ID_CQ2390S			758
 #define QCOM_ID_IQ2390S			759

-- 
2.34.1

