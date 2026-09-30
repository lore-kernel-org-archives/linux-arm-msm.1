Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8903D25C2
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 06:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790749924; cv=none; b=A5NNwjzDJre55dGzWp1J4Q0BJIOWd/AYZnfEM1ryRI7ey2iMjTtD5lDFvqvkR1cEWVj/Kkzhb9XTxMjyAD8QJhUBxCILisB9tVLfBsDboZr+pKSczIthHFuWy3gt6cnKf7ISK0Nd5HIpc0V3IV3xOAToUw3ycAJochfA05DMDio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790749924; c=relaxed/simple;
	bh=Hm7xkL/bJDYgV3jBTLLjQQp56rBzFkEvc8FRS2dyTOg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k83FOfDL/sb1VFqs27d9PcpVChCvXy3LZK0sqANKT7tL7wPnhyn61FvprZNtxvs4dsKHSp6T+zQiOk2wb0njALgyOvJCt5Tb3SPp7jJixTdu3XNwuPVFS2XL7BHcL6BrVzAK2pNQxt09NRnQIcMn4ajvfMc569fnmbt5DI+ILsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a0gZSMM8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z7eFhRla; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a0gZSMM8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z7eFhRla"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U2PHVU1522376
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 06:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bYGowZ5530CqbX2r836L/2+TQ0tTtjvGE5qOwk/Mrdo=; b=a0gZSMM8tpzyjhnu
	A4vgWDC6OBjtyg+eF9B/NEsDBta4SNubJ6xvQJaAiP14OVx/VhbJwKKa4aajN3fC
	14VTpw4+sHQDZ74zJms9XyyVoZ4sUCeuURDP6hodhyZemS+Sd/y4P7PbbpRIq4kd
	4Knt+mGTZh7A5y7nBTdZt472mtkYfLlBSpj4AyJ8z3zDm/oZ/syBgpPYyzkjk+hC
	I9DE/XfbhTRJzQAgGokMTzlUdSBNP0XEEFKKahqNJNb67OYWgNPWhUWsD+0HAoNG
	WviTyRLPMI4kHmllfYyEKRxwpXRe2kGwDakeClXkGmKSr+o5TCj5kDEDL9GAk7Su
	RmdQ/g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0smjgx1t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 06:31:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-313d1015161so1795097eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 23:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790749915; x=1791354715; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bYGowZ5530CqbX2r836L/2+TQ0tTtjvGE5qOwk/Mrdo=;
        b=Z7eFhRlaWn4hAgAD73HFG54zGAE601nr8UHN7N9d4wb53Mo/wbRp2QcCP/ifFKEWS8
         tQ/CbDzih8+I9caw+9rpR5cZVbGV6TnL1ufuc6XY0dfBLsONWyG+KrYlgjglLYDoEszZ
         d4yGodJdJuJkAbSYqddx44TK1vhdqf0oM1G+qjgPpa9vUG6ZTu4jpnpQ5zxwF+sarKM5
         sfJ4wzJYFkrbGCIDomzQv7X3tOQ2X7fliDEoB9vPq7TF97IBLjKoJANacfyea3/rSrk+
         YUYj3llx5Kwq1Y7ssDsWFtrp5W6vFxDOrtDX4T8PyxrETMWj2gqaGXl90nafwHyEUYT1
         7i3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790749915; x=1791354715;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bYGowZ5530CqbX2r836L/2+TQ0tTtjvGE5qOwk/Mrdo=;
        b=wILKEAladGkR+PgXPHsrmr/n1PZoSTYvh20KvGLuggXK4nzuhy7t+o06Y+SHKggCzZ
         Nja7ZCZRpsS/TP6Ey6nfv7jUxG8chLLoQaqrqoYjRFGIwWBJQIHI5O7V7sUq/Fg5M6xo
         9SiifD+5cfHpjOiIJtFN2THC1BXTV8P1ZURKdLn8L6e/L0gp2k3RLk1Lx7Tfh52kLHi2
         3wkIv2ZlV8Q4BD3nDhQ4nU032EJWqrhSohSsaVXUlI8Sp9hHbYCgxJYBFYb9Sss0z/Dg
         fcpDEDeI1rJqgq57iR2ZBmzlXVThsQizZrzzXPCmrucMHJBcEqVt2QLN1Nce7REofhsG
         CnZA==
X-Forwarded-Encrypted: i=1; AKwUvBz4UiCQQyH+3RZnfG/iYDjBNmbZujSaUfoC9owriTjmi0mrQNfDofrOZEw7rqq0Ovg+8Dw2UwbWkHnCqJsL@vger.kernel.org
X-Gm-Message-State: AFq9FYJuD4Z3zyy8nzjZJiFOfGi+w8L9TebR5HYJUlaU2SvucTTprVsZ
	Sv4mLafmM55EDMuf3a6WnlgB70k+4xxMMw0sQsp5wWNvb1redsmaTl4HddZwwjEm6OsoQohwQn+
	+JOHBNLdjU6i+4ry3+bt9WwjHi9QYp2PyZGmwp3qie4J5Wq0SQZLm0DgAvmRJoVwAO83k
X-Gm-Gg: AYBFou0E+sUubmu73iYJUVPYLE6b+iByCLksfkNkFaAklLOn7XHV9m/B1KYqB70XJ/I
	0+4kLPJ4mtEec/eLlznxMsdW+NyQTA0w+05SnSmExXIES5wdD8iv+SfzYuQUatL+Eg363LB95ua
	2yAFl7KPy3nlrhI6xY8kG7vHgWGYG5i4+107jFHPUbYA7AFX1z8dq9XlRnLrZIo9cbrdmFsLCZB
	51Rqz9XuHZlAXH5XwUol2xlJVrrppODNcQiEgNN2tperiL5DsUOynwd1cZqWZFdE9lMsqoEVFWg
	Hd/fv7hVwOdhrB8jo9UgkQrT7UpgwvRN288fQcMil6T1QOLZxWnAR4aQGlr8zmEoyjzr+UCWsSL
	iM5dg2zx+F8JAUiqf3VAvCSUsqkQRG4qcunhCJSW7c+U7M9/RdBM=
X-Received: by 2002:a05:7300:8410:b0:34b:7892:4961 with SMTP id 5a478bee46e88-34cdbfc9dd0mr707840eec.22.1790749914449;
        Tue, 29 Sep 2026 23:31:54 -0700 (PDT)
X-Received: by 2002:a05:7300:8410:b0:34b:7892:4961 with SMTP id 5a478bee46e88-34cdbfc9dd0mr707806eec.22.1790749913775;
        Tue, 29 Sep 2026 23:31:53 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf572e976sm1503416eec.20.2026.09.29.23.31.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 23:31:53 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 23:31:23 -0700
Subject: [PATCH v2 1/5] dt-bindings: arm: qcom: Document Maili SoC and its
 reference board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-maili-dts-v2-1-965688646c4b@oss.qualcomm.com>
References: <20260929-maili-dts-v2-0-965688646c4b@oss.qualcomm.com>
In-Reply-To: <20260929-maili-dts-v2-0-965688646c4b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790749912; l=968;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=ZxDtWZxMUbC/u2Kxd2ljeOeNmhGjZXxpI+plpjWeHhQ=;
 b=/60bFbtG3BGukmfih2Q7zjaqyEUjxg8hCuc6lbpR0YQzJlDiv99VVI7qpImwwRgPT8ayp9e1D
 4gKhsP01ZWIA/R+TZskMXSyKNznO0m5o6ja3vBh437XOuZtD3Ian9VH
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyNSBTYWx0ZWRfX4ytlJA0/eiOi
 /49yoisZuE+58I+c3nq+B4FHGbxSn5x1T1/1ld+qIOZ/Jsgo4o87nzXXvpwCRdPuwopM2+9oiac
 FL5yg8bmJTTdI+s56B/ld1kXcxt4Onk=
X-Proofpoint-GUID: cs4ZiipG80KEv4tLtM123wgWLHzrEioF
X-Proofpoint-ORIG-GUID: cs4ZiipG80KEv4tLtM123wgWLHzrEioF
X-Authority-Analysis: v=2.4 cv=KfxHIgYD c=1 sm=1 tr=0 ts=6abcacdb cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=V7UrHcU1DTeTWre4HVwA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyNSBTYWx0ZWRfXxDnmJljmAp8Y
 50odKsTNJSx47uFvjllvXkfk0PKolAfwU4uqvaGWGnrlhA/2LfMsWfQk03eNG4h5VDtdhYsmVD1
 Eh9Upbfcja3NESs0t624W0MeQtwm7buoiZwKOfSfAl8tYMjnGyn4RW1X0XpjwGdzKnydbJsB1wF
 9xEEgTOVs898a2BBkJo7vzVIYzwv5wmBFZMaxFLNJJIdTfvSdfoIL0CC1TL5FP8x/ENVlkC7sIM
 gcvEJFcHmLfpR2jtXZsgMtylMa5gbgXSffseaNRfPpOC2WEvRWxB9cAMBH06fFxj6GM3GnpQgiY
 1BFokBaGPEtGJsSdM8ed3GgiS9Q4S6z7CEpgUcSeXShdpUmAmA7WuDA12MYDasieAOYCwdEAhQ/
 WyCV0QScXAK94xzPKrd1a4XEhwWbxYvbGWYM+JajUIpeQDnShzjecelDv3aTjhh6ITQRKOB76lU
 YllnO1t+UvNrfWNbveQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300025

From: Yijie Yang <yijie.yang@oss.qualcomm.com>

Document the Maili SoC binding and the board which use it.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 07ef7988b068..5d3518087923 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -194,6 +194,11 @@ properties:
               - qcom,mahua-crd
           - const: qcom,mahua
 
+      - items:
+          - enum:
+              - qcom,maili-mtp
+          - const: qcom,maili
+
       - description: Sierra Wireless MangOH Green with WP8548 Module
         items:
           - const: swir,mangoh-green-wp8548

-- 
2.34.1

