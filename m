Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBA6B48F82B
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 12:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788782648; cv=none; b=ZWEYHPSSXfn++eZ1DR42dg5WzUMaGt8bp9m0JpHPznRgK3zkZL6TXnuGFjtW3YPepbBKlO7auZjCBf3eEqJf8ZwXiG/dSeSfXJuY9bkab4jSNIx+dgUWzQOfekSRyqtKgEcKKPhCKUokRzoloOgZphLv3XfTiBZ1Zy2cc9rNQxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788782648; c=relaxed/simple;
	bh=WAzemNAMBlLHCy0LwRLtLcYV4tH22L1qXU3EjulLZFQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mGyk40s/r3yUXDM5VJABNx0/yII1BtrC6mII/md7jZ5TyGwzPyOgAYT34xXeFi5sD+6GJF2FVlhh5bszdssUMqzzV6/fMLKfi4RI+V1GHxW5Iy17gZ01mzmK/OEhbYUey7qzZ64d4rBe29tiz39+El89BUv+ZaszSPZ8Y9dID8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V0G2IQKi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U5wI79Ld; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V0G2IQKi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U5wI79Ld"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnEbh3863130
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 12:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DVWLuac2DwY39I6nVk6WwXTIYRO7n4Cw7TINDm6t1OA=; b=V0G2IQKitjbPpFxS
	SJ46EyVV/kWyfnM7OSrv4AR3EFHkEvE5wkW25KCrJlzejAmvzWFCr2TIchCirvLm
	gh+x7idC/G1ZMexwXC45mFh1MP6sZYqyhej5YrNmywEF5PpEbLZIXdzUUk3j21eZ
	mXGq1NXf9ZQ+/cK32IEleUGgh5IUN3rDME+KRI8Vos2wexzwnOEwEf86FA6uqdk/
	wo5OH/SurkT9nA6kFFNmM7EePoLyajwY/15rJspxR8P5L+vyE00h7Da5HFEgGdo6
	N8OPEZTzw9TRmbxFZOeULspj1l4MBAgHIW+G2UsMC6BZwbq3q0KwHktuXsLxjG/3
	nb41gw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghq66hpvn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 12:04:04 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1b80835d5so5068338a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 05:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788782644; x=1789387444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DVWLuac2DwY39I6nVk6WwXTIYRO7n4Cw7TINDm6t1OA=;
        b=U5wI79Ldz0DDbJdD/BEQIsYL8H3/2UjVpgJ1Q/N+cFfu5SCWmeO6wkGqFnn5p3k/k6
         2bn/i/mX+B8RBzHavMYa8OxeYZuZ1EXidMWvA8mSTYxoa6b+wz9xchHgJSU+8rmj4PHU
         fmr50wsM1t5W+0kveK9/LfkqSIU/SMhBnWf3iyeUJGjQz7nZbNeGgU+wkadqFiWGODQg
         NQN70KqsyeVhUB8EXZEnJZ0eEqUTj1rPMvgvVyl1Sm++ybz8JgZIAet5B8tNGIA5SS19
         eucd6IdBSq5JvUZcQjwETP3gZ/gnAhuOXSe23amEDMQksnmgGa3OUo8M7cdu+HDmTuE/
         A94Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788782644; x=1789387444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DVWLuac2DwY39I6nVk6WwXTIYRO7n4Cw7TINDm6t1OA=;
        b=CXsOWDaGl/ZbwluEZhxFIOQKcWNSGqRyJXHZlA0Bdv14oSAUn8gUUl4K1+34iBQNGJ
         mFhc3XM7bkqL8C+luMkGWB9GFyIAJYk2SHnNLHH8/fZs9+UDLLISXN8kV3DhCwH0BY9V
         kzk62BlrzC7Ck2cVzH9h/vj3vFhxl2UFTYfVa0o0nGPbGGlINbAFeIro+mQakCDFwRPf
         MbbCQFduM/2nTiH1C8ApDXbb57teEAvDK4yE/VczeqKgbz9xpofMZ9uYlcNK3Ajr3iUl
         ngtLzY7bmWTJNQE9dx656u8E6ysD68j4Mi4ux+SRmPUUjzjT9A8M5UZ1fRuxj4ROSPRp
         rwhQ==
X-Forwarded-Encrypted: i=1; AKwUvBy17+i3dIGH7ZbO2T87EKT9qe6PG8kohHagM4Madcu1me2Mz7W8h1ZWlWHGZXMyc7WtzECxkv+rC/Rw68Kx@vger.kernel.org
X-Gm-Message-State: AFuF++mEA9kcTa+MN1KBD8ZN+bocF5bwBGYHgboy1EM95dfxhRi2ipcn
	MvBgpS3YRP1wxlvaRLmNzNv160B5e7Of3e5tfJYxVYSNYyA/eB5tH3NVNTP3ppIzjv/5b71fDIv
	OxWFepmhvtxiu6neX2M5etQ2tMz03GWbG7yBTz5RZHDK+5JAiwY1PhSqNAEp7mONYB8rI
X-Gm-Gg: AYBFou0uD/VixJYGs9t02EVwGGV+I9Cfilt5B9IwQgLInWpSG7/ty0dpJ0s1OusoLpv
	xhXwTXCyCmynIHnLT9aSn91KvAcgC3MmWKAIBY76jDnMYgG7VKWP+eKKUoaLjQaOvLwXhvWONV+
	gWanZmkfoe8Iq/B54lYq6wOkqgOafNK+FrBIN9l9/0GJ4U1D/MRSVD6R1PccR1IO962idr2BiCj
	OWgf1Vv+X5NPh2l5oEFmMAFgocMvekQZF5UkzDaAOUGO8zdtKKP1b9ixbeCzz9q4egF02YnK7tz
	sNEcLQHEaAToNI19BmzuNzs0yFlWrjTDlKi5jAMEwP7GhT3L18zEebLuw3zzummIGl072xZ6/Za
	1bB9lwTA+j32MM1u4SlLXRzcQWSg9G8z+wg==
X-Received: by 2002:a05:6a21:15cf:b0:3cc:ec12:a788 with SMTP id adf61e73a8af0-3da39b57e15mr36356208637.4.1788782643585;
        Mon, 07 Sep 2026 05:04:03 -0700 (PDT)
X-Received: by 2002:a05:6a21:15cf:b0:3cc:ec12:a788 with SMTP id adf61e73a8af0-3da39b57e15mr36356089637.4.1788782642990;
        Mon, 07 Sep 2026 05:04:02 -0700 (PDT)
Received: from hu-kuldsing-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-333959d5f69sm26345960eec.0.2026.09.07.05.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 05:04:02 -0700 (PDT)
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 17:33:36 +0530
Subject: [PATCH v6 1/2] dt-bindings: crypto: Adjust Shikra compatible
 hierarchy
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-b4-shikra_crypto_changse-v6-1-0676f61894b3@oss.qualcomm.com>
References: <20260907-b4-shikra_crypto_changse-v6-0-0676f61894b3@oss.qualcomm.com>
In-Reply-To: <20260907-b4-shikra_crypto_changse-v6-0-0676f61894b3@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=QPhYgALL c=1 sm=1 tr=0 ts=6a9ea834 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=DcSQVDPtFCqqlbpqkFgA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: wNHMUqmPLzTeBnQhGllXIfULZGp2U4Qa
X-Proofpoint-ORIG-GUID: wNHMUqmPLzTeBnQhGllXIfULZGp2U4Qa
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEzMyBTYWx0ZWRfXwuWSWsCugbfC
 nlNFidNmm6e7xKogb4U5qABxwBln7YZv34I+7+ds6a4sEFAEVEbjgKsck3FcrPZpFrpp+6+VlPE
 H6LP8sMC/ytWpgYlmvjy5x2pIHS9JNc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEzMyBTYWx0ZWRfX2HSHbCGiHdw0
 sw5YqzkP4AU2t0SrCBP9ts2RdKNV0X4T/gJdXfjb0+Qf5D1f6WFkR3Hb5yqTHLjGWwFmZgcOqWm
 u4R25mQE8RvFcVorIaad/bhsxo4ROGRtsmkjbxzQBLk+nO4J3WNzVU9A7rlSIauOPp6KFG8Kmai
 Oz16en8V249EC10GJRlEujCwp6yNP0dW6HtVBAo70RW2IIrKTF5lg4nHYQ0s3yavETQOZ0pbC+f
 HW7Y9ERAjtR2gEdo7ngGe6Zloc6JWER47vO8C/Azul9IaMz7VoTqeEgNEUnBU9cYDRHufhgHR4z
 y4f1GxyE6zsaBJUl3T/MUX/TWA+XpBdd2J4c7puuwn5xpj5W1aUBf1HN2QVxqMYz/PjZ3nqB2UM
 S9L0zc3XViQQDpoRR+EB8V4N6n5I+t3/6pk7buFVS4kepcLcKMDV0WoVLSxgVPvW46HvITiZ/hS
 LoasJ5dEb93cQIrbMvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070133

Shikra reuses the same QCE integration as Agatti and should follow the
corresponding binding requirements too.

Move the Shikra compatible to the appropriate binding hierarchy
(matching qcom,qcm2290-qce) to reflect the underlying hardware
description.

Fixes: 45834ff95a6f ("dt-bindings: crypto: qcom-qce: Document the Shikra crypto engine")
Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/crypto/qcom-qce.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
index 5a653757ee75..fcf725bfa36b 100644
--- a/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
+++ b/Documentation/devicetree/bindings/crypto/qcom-qce.yaml
@@ -39,6 +39,7 @@ properties:
               - qcom,msm8996-qce
               - qcom,qcm2290-qce
               - qcom,sdm845-qce
+              - qcom,shikra-qce
               - qcom,sm6115-qce
           - const: qcom,ipq4019-qce
           - const: qcom,qce
@@ -54,7 +55,6 @@ properties:
               - qcom,qcs8300-qce
               - qcom,sa8775p-qce
               - qcom,sc7280-qce
-              - qcom,shikra-qce
               - qcom,sm6350-qce
               - qcom,sm8250-qce
               - qcom,sm8350-qce
@@ -133,6 +133,7 @@ allOf:
           contains:
             enum:
               - qcom,qcm2290-qce
+              - qcom,shikra-qce
               - qcom,sm6115-qce
     then:
       properties:

-- 
2.34.1

