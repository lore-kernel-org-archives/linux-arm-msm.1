Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41383499F08
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789390226; cv=none; b=AxT7AN9BXJjyaJGe6Kc1joXe1F39ZzKinQicS9zgSjcFpL5Zilr4f7unLnFOPTOyQCwu6K23ortd1O0ZmBUmpNpe9ivkmRhIHYzTc8v9uoohbI0yTiY0nd4uU6NAHWERT6OijK1eFSzYRoIv17Jr+NaG+RrVFqio/+A5WLhG1ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789390226; c=relaxed/simple;
	bh=zokKifpcWDTYAQ0OW5XV2QtUKjrgfCsVMCeLEN4vAAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UMbIWhvuu7ePsJjStqYHxI6P4lkFrb0vpFW1m+HARrMBHLyqb/ONRd1a4n4ks+iRxtxIn4ug6lxtdaXq3XUKvVKJ7LrKfgivKfUvXDu8iZWc9IpjveG2uYiJT2GL8gV7zhvgmPKzPv2U6ZSaTPQIaildLokDeFwGooPwUrIpMEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ceXaywzI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KXjWjJR2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ceXaywzI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KXjWjJR2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlw1s1460537
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VoEoiAR4xGAty5CIO9eeYSrddXDkp9VOnQQwHBV4Ckg=; b=ceXaywzIh6R1jIJP
	UFiNZsonKkg5zt1wexhmFMC5/jVxOYKpJbraPf6xkGVucuIyjVtfuTRTcobFs6T9
	ysJXr7hIxUdtrM/OkAvcBQtS3HKR4x7iQN85BfIxkq/xrza5g/OG91cIlN6cHrdR
	57DVCPJYc5gO1mpmgjkQgNchC6BF+lK0HqDoLQ9aCKpwRAvRi0mRY+LgXWGKIV9n
	nIrvBJV5Cuy9hscq2sSJUakn4z73TheeL1KJKxyWMy5y+1NGq80UZAy0cNPcLBLd
	lDO9XTcDnUCJpXcF9upp+AkPYWPaTEIPTRnSnsKQh6yx+w4Hi3yOWsAPb8w7qjG+
	d+nbXg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpeex8qsb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:50:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939f248907fso242149485a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789390221; x=1789995021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VoEoiAR4xGAty5CIO9eeYSrddXDkp9VOnQQwHBV4Ckg=;
        b=KXjWjJR2Y2avb4KMFFJ8xehP89QmLmWrJdJNxU3TGXTvHTxREnJx24htxAjRNlaHOG
         fHIa5ZB9cXlP9pglVrKsoSHYOmgCtFF9qMWeThOXjOaaJj9EfP1gESGb7WxPnvcLEm33
         wkdHaQmfbMjo5fq27rCG5eI121xw56hQt1d9uXfT3FmVbYHZKY7sH4+fRvn9L37n3+4S
         CiWIFy2RqFvwYV1P547XtMMYXlptx7yogMcYLVR+IlK47Zr297k9UpydG2+vHpoMAB5f
         k3khcERLoh4ilHuzyphpyYiiN5uTkbZb8kSChGgDql7xJs5AXxv9MRmpwwdeYMLOX/ZW
         wzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789390221; x=1789995021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VoEoiAR4xGAty5CIO9eeYSrddXDkp9VOnQQwHBV4Ckg=;
        b=FliPCkLN4Y2OnRSAXdOH77u1vVNVCzigywYn6JbgkXrhYNa9+Fyb0oBt2/Fzc+8XmO
         JOiS/DfKnIsHxjcMoegTI4weQJeJAiqJrULaUfTF1+xXI+RXBXI7jpNuPOJoIUPoUWyk
         b55UYVqINvLA3Is7bz171kw2EhgX6sPfjxtqlbQVNtZbVc7IQgOk7cKubhxlQ3MLwsxo
         18AHIb/6LKNxBBrRMlRL5oyAv2Ib3AS2vGT9UbT1zW6DLIpMi/raQyLZfK7OKjpbwnhr
         LlHBsBq2Gx2x/nC0+yCue5ZFbVa6mtR3Dn2Hbxrcg8dsvBTuLdobiurFUaW93YMhJby5
         YYZA==
X-Gm-Message-State: AFuF++lNoZ3sRg1dTER8NpLVFeCaao3iHMRnsWKua6Kpzylqq8H0wqgE
	31mSjjZ9o1MqHCww8RkQ6fb8XbB2zTGQtVxBJ2xypAR6xn5hKQd8WPEwpkjUBKkHkNIFjq7E2IY
	HnZZ5v0g8JjVyX1bZl3XIGyn+8HBb8XOu9j+WXYcocexNUBwr+Uz5iDidg0USwD/ukT2P
X-Gm-Gg: AYBFou3kV15V8Mey6r+2RqJn/zRr3cLNF8AUa+iLWTjZagam9RcmOCJQ8f5hxaGKQUB
	6bXnNWNJXu5AzIisz7hxRDLG2vjRfP+dx55ep4ZapycYf1j8p2hhGIFsHEySiY8gAdZGbdqPo5X
	cyX9eePbLxvaNAlWiJlCEC2lbZIikm/Xt5RXjKLNyQSe/qHtY29j8IpYxRlZF0td6w1KzjBuEEn
	4XsKmoEe8QQLdyvA64XfX6KikZCC1XpBC0Y4xLFgylJPaLzaKtaPvwRmW8vIaJmtW3UgED/Pkar
	8aASDWRJKk4EDzbg6Wz6r3w/5hZDA++6G7OaPtMZYTTaC1Q8uIRXyhw4uThRszo6U3VMerxmHh+
	0VpkgXBDF
X-Received: by 2002:a05:620a:170b:b0:92e:e559:fe6b with SMTP id af79cd13be357-93a297e904emr328331485a.7.1789390220921;
        Mon, 14 Sep 2026 05:50:20 -0700 (PDT)
X-Received: by 2002:a05:620a:170b:b0:92e:e559:fe6b with SMTP id af79cd13be357-93a297e904emr328322585a.7.1789390220145;
        Mon, 14 Sep 2026 05:50:20 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e6c566bdbsm242387555e9.11.2026.09.14.05.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 05:50:19 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 15:47:51 +0300
Subject: [PATCH v4 52/52] arm64: dts: qcom: talos: Add GCC CX power domain
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-qcom-tie-cx-to-gcc-v4-52-9d5a606ada33@oss.qualcomm.com>
References: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
In-Reply-To: <20260914-qcom-tie-cx-to-gcc-v4-0-9d5a606ada33@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=997;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=zokKifpcWDTYAQ0OW5XV2QtUKjrgfCsVMCeLEN4vAAE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqp+z+OmJx+PqFZf6u4EjFnsf8uru9IyGCiqaYO
 pVC5ZN5b/uJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfs/gAKCRAbX0TJAJUV
 VncdD/sHJiMHTA/yytuKmvV8g9Ltx3AmWpGo8uRqI6hppvjBnnbrhciliYWbGPcPF2GWEoJzVMl
 GJS7yXUqdhhF2KW/b+t8xXoj2wRBQhcjPYPmlDoqDt+K+/8KhMmLCIKYbNtncQ6bLQx5/s9kRiD
 6eZm/Wpt1iOpldSRc7OGOPtMiG5REfUWKo7I3RkB7SUpLddJlDAtEOvJHG+BC74mYLxR4lRZhsY
 yBvTKkgExgFlPENRPWx01KRgedmKlW3Pr3cT0nqBlDe4cV+GVZeVXGr38EVv5CmswCsWnzks6Nb
 9evnjhMm3Sk0dpvYv8Xu3pC5EVVoUpQjA9uATiv1rraC6P5y8vUn4Gm4ODfqCVzfF7kCktWVGIt
 y/TMCxGmqWZX+tlzJS9092g6J5zQ0feMsP+HHi108YKka6nXxrrfeVYorByE2Q6yUFBeY9ZP7iW
 EWbKpYWTtnWBLJPbZfebiPz3/E49tjIFj6IktqLX8YeAyKW9BPILpJA8A808oasnV0qW5tzS6V6
 c9rD4J1gajttpdDVgctcjg42HuhdK0Jw/tcvlUaj34NE3VRdcV6qOGe9xeHOXEXUyzLWw9AV1oK
 R3npk1PqmM+N1irkQfFkD33pJWAjdI5A75O2QRXGJxK5UDa4GJi1/Pzmpe2VAE46kpurYHv1djS
 /OX9p332JloHFFw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX48bqMuYG+F+8
 1O6pI07JcRiLMtPx5tX5h7j6fpeW8E3RHVgALSzJoP0BlQA1w27CmLwErlV4EHgkC/sdhOyMA55
 SVp+a7c2Hw9vsDuFzpNYmE5GBbmFj0u2OXsnZ4iI8AsTZIKoJzcNGYYI4UkjInO15SnJ5cgS+T1
 7GdSSvGlHuucYJeYMbR9CPpAgXrlJIUB6UNAa5gAwy8zQUnXrJ9Dt2HDFf+ALefQLDPJB3qUUQi
 SBXP4TPC3GRhWwpc6FhEphUmzIrMztT/GozNN3HkKf2if13gHAyqqVkciZ96mdab1mhv5Op+GOR
 xw9dvNJFNqH719uVi3PbrpFH6MSvvIJ3Gh9SqwQCWsx3+y95oQmKhVun+4EzFmJdhufGUXVDNQD
 QrgxK3cit80TRJhxXf+Dme/6xYZW7DQSyUB+G5Y+uO7KhR4b4N5MMHO0udrYKs4bkM8fa1s9Q1w
 wybiQheyRr22GGYLUrw==
X-Proofpoint-GUID: s6cfVKaw0WJyUzGHk05VVzFOEccGpvKN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE4MyBTYWx0ZWRfX7zdRpz7WDGZ3
 H+K9taZ5vT142QKll1tRzcA20mNkFxmm0R4/xGilYKllwx69UcrmmW1Tx0X3bX+v0h1QY8j5kOz
 AV1K88n/213x28jpkQBI+iTGpDQBJrw=
X-Proofpoint-ORIG-GUID: s6cfVKaw0WJyUzGHk05VVzFOEccGpvKN
X-Authority-Analysis: v=2.4 cv=MsrHeGae c=1 sm=1 tr=0 ts=6aa7ed8e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=dUfsX-4dSnU6X-0t-lkA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140183

The GCC GDSCs on QCS615 are backed by the RPMh CX power domain. Without
describing that parent domain, consumers of GCC-provided GDSCs can enable
their local domain without causing the required CX vote to be held.

Add the CX power-domain reference to the GCC node so votes from GCC GDSC
consumers can propagate to RPMh CX.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 531cf41b94dc..860673697f1a 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -705,6 +705,8 @@ gcc: clock-controller@100000 {
 				      "bi_tcxo_ao",
 				      "sleep_clk";
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.54.0

