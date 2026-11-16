Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794809661;
	b=lnE3vzVMKTZ1lCo6/2oidI+t6GowuumNJ5PBB2Qp0P5RGHSQz0Birp6Cvrh++Guc6N8P
	 JPdcF184XPdKgGa0Wp1vz4A0Y0dXjDYypq9HzxObp67rxdBov5Q9FyjXrv7tsRthY3AyL
	 I6jdTgj0eSeXb9BSmPmMYTvewFYZg8/a7H+eYz6jbBF+iRK72AAxkh046/f5GSAJ7artW
	 9RhjZGdxeOTjB3GFpwmE3IPGUIUtKl04hc4+1A2j+NGYvFOwcXWPV+YSsdWWas1Q2bpv+
	 GSAM3Ve9lj0nclUWDzk/lrkm9LMIoLNQ1zTi8r9dSK/nibtpVdge5/6hbaJtlw/s8xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794809661;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=;
	b=0AEA+pmLnT5O9ybBaw5XLrw+t5UfqWrjt7+z6OT80/1CLQRu5ibRKxYMy+ekhzcz+kC5
	 QLMorYJtq8RkvV5mGjUilpgBy+Xl+/m0ANprLQW4WuTAGIrpGgaBnyHsASBZqegz4d7K3
	 N4EiryHBhOgRiS5fdK3XVBJ9rDNQYRTmAELGmCr/E24ktiMreMNdIx6DsNoYmztfUmGnt
	 vJxUZZ9S6ax8GWM0T5z7PulNXmMUx/93/P4mCVmfqaX8O0s0H9vKAdLqooiF16qL4MRph
	 ThcFgIcFAxeHXfuc13T2VYdvCihbMxvYIHWKEeenqhgWYMD3nmr03YPy7woyjiK0Yjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J0wVNYO6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="RL6SSi/A";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B11606A32C
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 06:14:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8B11606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J0wVNYO6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RL6SSi/A
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5LFm22880003
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 06:14:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=; b=J0wVNYO6ILmcjvju
	7iC3wjRXx6HXaui59q8Puaam3pkqhlEF5zwa5AYDOyjyCEiFGLlhKrl9HPdz/iFG
	kj/H+ckuLBaeLmhWksYH010OK0UJ7u2wUEZ5d6C5WdJf9HK4Eu0pdioDPtJA1Yyg
	V+FZXJMssVqyRtmwoRH1YW8UR1yKiJ9ybXB8A4ZBMhNU94Zkv91mjF8W8PJjSWN5
	ylkrwYCcgr4gMA/H/CvIp+KGgDhWbeehIOpS76RBGPXpSB7B1n5ddo/K2XLgAY8i
	yO51/Ip2KLSNgj+BdAORyUMWLJE2+LSnlrNK53OidUYcNqFLzJXzPlD3/cJcrkJS
	fZvsJQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhj453gq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 06:14:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b18741aaf8so4942130a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 22:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794809659; x=1795414459; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=;
        b=RL6SSi/A2+TFzFy6N+ysBZg+J/XtOZFAoJksroGz9lXNIItVylW/0G0C/KMZvO1YGc
         4gvyio2fOU0kCF+ADt5H1fDsJiwy18U/Duaw4RAk8iXv38uOyCWT32IAhfXSDrGvZzcJ
         T8eatCQgDTOcXAPJTtpjZZNC1OoUsY1qMFDFmW1TEzd+DPnqHm/Byu2WZFuVNPCTqFer
         77nWCQRbETDiaFvgyC/JUea0ZWhdThS5j+tpo7Y3sJwIC7U0gcz8zQOZXP5Z8sQqJvdp
         yKZL2qzSoJhoYIgmf5dfMCtZJwFDCyu1pLNsx8nVRioh2RvbXazFC6H8G1JAnahk7fcx
         v/kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794809659; x=1795414459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8r5kPCHimu9UfRgTGrCITruJRz9iEK7qpnJ1StauFUA=;
        b=Bg/HUB5+4m4YLuN1dyjgr/j/e6aWYwZXZDrXJ1aBBU7zQB37LqxkCK4qyxgrCGChwH
         J5NnoB40K15pNtNUxRNS2gW4Vr/jFQACRh39Q/EsONwzKFJsptEGAL+W0y0FahMVmiF+
         dMS7zZMF6xBTog3eSFFjclCI8pyRnDYsvHc5xjblzU8wDa+cjENVzhyvPNqPIMla+mzv
         3aw8ggCG/MdkjbL2/5BXHk8VeDcudV4vhmt1qtIf4VbSagKkymPVeEXt+dnsHUvnbiEA
         IqhZHGrJ73O55M23tFcSAofRsTQ69dd6weqWfnxGbNIPburTm1WlgoA2J/wFK0TWt2f1
         2CUw==
X-Gm-Message-State: APuU4Z+Ab7O7ldeVqvz3+qvW68392Diz81R9FGP5dPDSf/PjfMTwxKX4
	8Dq9k0sJC8KSahFLbJSZQEHEz3TJyAqT6EzJIKdkTO9+zAp9KLTgyv5/shlGzUnzm3lYlHzUb9w
	e+49tE6+b2F5hBOexQUgc7ItHtRQS+QHL9l9mWCtkrBHqEd7Rj2xKTxX4Hve2wf5LKlj/b9TeOV
	4/
X-Gm-Gg: AZFdTZfm2r1BRqNuzgqQd3QqJWgfJHbh8XXkfLMAxXcsZZuH3XEHSUnu7jcZqeJ5Goe
	7g8dqR0Y0/pXGBT/pUKA7iBPaxAnTnZI/yZo4pHk19y0cuFC7koB+DrR9F6Dd2e/8ZBx9YZXqf2
	T46KC1z77teJL7Df4ej6v0NhLqwbzTzron8WPFQv5c+DzN0Rqp+UmtifLGfbh8nQqazuL8BUSCn
	IqlmcUXxquYk96wuqXpTUZ6Y0W6DNLwOcdvBsSPKELtH2VNKGDT9gvd6aCPhtfR172vBSvAuTV8
	BFtOPBt3pbNpldihzxLRwZ9RwGIrL/1KzvtWNLOEwhjuFEiaw4UxGn0Z/AOuK7jvLOIe1cGQkNQ
	8xwj5OaNAucnzCOZWYf4CXFGyvx6bIBhZUyjp8JpOQfCutvhHTrFMwHaKzJ9yEch8Q/9/
X-Received: by 2002:a17:90b:4a05:b0:3ac:9176:e81c with SMTP id 98e67ed59e1d1-3b1b0cdb2efmr8498351a91.46.1794809658931;
        Sun, 15 Nov 2026 22:14:18 -0800 (PST)
X-Received: by 2002:a17:90b:4a05:b0:3ac:9176:e81c with SMTP id 98e67ed59e1d1-3b1b0cdb2efmr8498331a91.46.1794809658504;
        Sun, 15 Nov 2026 22:14:18 -0800 (PST)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d0f497sm20229444a91.8.2026.11.15.22.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:14:18 -0800 (PST)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 11:43:24 +0530
Subject: [PATCH v5 6/7] dt-bindings: mfd: pm8008: Make interrupts optional
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-pm8010_i2c_support-v5-6-5626ba17c0fb@oss.qualcomm.com>
References: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
In-Reply-To: <20261116-pm8010_i2c_support-v5-0-5626ba17c0fb@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>,
        Christian Cortner <ccortner@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794809616; l=1342;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=G5Qx+ovkui52zHAz78X3034pPz4pJoesn9ej2vCUqhA=;
 b=rCBCJHon6H5ChuYqrvX1bQDSdX9GNWCh1H5WAFECl0RDZXP0CgRQUQ3kkFoyEGLLRo39/+QWn
 KsXwZ/an8HNDeRcgdRxSxyYX4yUXP8fcAu4l+ns60d2na82HAeTEBUH
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfX+BUqBV67TuKx
 2e0D4OmhcvPidrVsUXGJiH4k3ImdQF1/UYO2oWWqOg69XVBftbhFf1QfFExNInt4rpFFhUAOBcj
 ag0pwHEAnkfTUYLISbjvAnCwlSXbE9o6SeJtdhpeve3yzj6iu+uPO6cMVFdJQcAeyD3Io6DLw2A
 xGi5Vn19iRrvl0ptJQ9zDqnbH7WsD+QRlnvQ/7EsK0AfHZEsmE4vLJKc+q+SELu6Da378H6KcIN
 s2+DZw2QZ1Aqa/ozWV2hVuhxq69dGFsa9B2+y64n+osAsGSAz0ArxSskmnv9syONQqp2HzD3a/E
 H6HAsn8dkGoGe2/nR0R65U38iug4cPr6bRn8EgLHFUxow3N2RJ9oxvqXYSLbq0jUTFGu25dL/J2
 6CgOa36EG7Miw1hdR9p2QHyvfFKutYlbp9+nSLgqr0Tt2/a1as74G7JImfdzZ4d+TVe/IUW+Tde
 UR67uSznD6NElfcN/yQ==
X-Authority-Analysis: v=2.4 cv=av0nmiZV c=1 sm=1 tr=0 ts=6afa9f3b cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=Su-V-MYFMjrvs2extU4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: zVL93_zCIYOQ5t72rgG03Ty08OoQf_eT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyNCBTYWx0ZWRfX3rJobqTbAQkE
 MAxQtlnVuVYWOh611GXrHiLMMk/oqIjSv5KpjQ8DSXd654IyJZqmjvnawe1jwruqObniXBI37fj
 OK8CMLpnmWZzqmBo60mtcVu4kXEEJWE=
X-Proofpoint-ORIG-GUID: zVL93_zCIYOQ5t72rgG03Ty08OoQf_eT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160024

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Some designs integrate the PMIC with the interrupt pin left
unconnected, deliberately. That of course compromises some
functionality, but the core function of programming the voltage
regulators remains there.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Co-developed-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index 2701aa755f31..3c0febc8152b 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -90,7 +90,6 @@ properties:
 required:
   - compatible
   - reg
-  - interrupts
   - vdd-l1-l2-supply
   - vdd-l3-l4-supply
   - vdd-l5-supply
@@ -99,10 +98,11 @@ required:
   - gpio-controller
   - "#gpio-cells"
   - gpio-ranges
-  - interrupt-controller
-  - "#interrupt-cells"
   - "#thermal-sensor-cells"
 
+dependencies:
+  interrupt-controller: [ interrupts, "#interrupt-cells" ]
+
 additionalProperties: false
 
 examples:

-- 
2.43.0

