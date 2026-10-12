Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B17443C11
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789824; cv=none; b=vAoPX2Ok3FlTyrRvGg0IkSPy6M7JXLpjSrom7MsyT3OAHbpQtAti8yQlQvHzn1fu+/LAzvN3lA/HjEnCC3vIUouhKlHwcUl3+rk5E5Xz3x5kE2QfjO8ZyG9e4+lLGz557q6zx1G0yf9MKpUhXk9bBJeHg+UKkh8o17xmCBwWR3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789824; c=relaxed/simple;
	bh=Fq6zNQXup7fVL9hxWN3AiqpOkiSjGOTDUA8QYPdXEZ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W6FbXIxTLB+5FR6ZZqecahiZwPFv6s+FV0RT7lIdjj1uvcQvRObNRXYGZWQaX2SLnykkkL6/+xc40SZbOJ3Tsr5Wt29jFajdXPYQ+lYOrLPO9uUZndyzPGrNW14HYirfnHwk+NwTtgyTiU8z7zUSgt7R2bO7ANZc4hInyVNcZ0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jvPuFMqM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ann/ZaCm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jvPuFMqM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ann/ZaCm"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C5Y6g71216046
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:23:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QYkllvOl+MxaLFWOW+IjD7cSlpy3IDud66Um038owAk=; b=jvPuFMqMEiSjo4gN
	77u7mxFb0NS3qYdLErE6QSXHtG3WZrl2u4nd/6VaKN2a7BCV1NTwMeuG2uJNpjSY
	0TUhnO1mFtodirtGxpFWEiJ0DizbWcAVIFncvAcEq6Smy8eazxIVI3cH7H2Ej2Zk
	2LGnUj5hw6Njw/87I7j43DXHAUGQFeuVLegzmKwdME3hBxbs/FF27BbNKb01rPU4
	5Jq3qS3Lqn3M4i8Hi1qOT0apQcEaMe1oClRuP1h7P8ESV77XOkv0K0BLlnqouCAW
	tw3jCWQgav4EQaJoDM9NuXc10Z1zDOPv2C87ucw1fA3b3sYKXmCHROzQ3lsQf1Mz
	qGxlRA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu0fcq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:23:41 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1665200f4c2so2264079c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 00:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791789821; x=1792394621; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QYkllvOl+MxaLFWOW+IjD7cSlpy3IDud66Um038owAk=;
        b=Ann/ZaCmUTjIjP8WTK8qdFbN35doWdYK/l31cWFwfpuGsDabCv7wmmB/rRDM0EXgos
         jmEjalXnYG5QiBO+2wbEljPkLAO2KC3KJZcflYA9ByPNXbeTfIm/fweHOML40pQRPE/C
         ESHBuzUqOkkT7DWFPd5NIzVl0ZjI0sIcpZtIlUNy3ei06t5NMy9ZOtLq8WeROBlTBbJW
         KWNjLcSqaIKvw/HRSuegcz73qrEjfJfZkXT2uflu5AuUpKuakMFod7tVolFCV07KY7+7
         BXju6O8wxjS4D/93iwZMeFEw2j4Z64SFxakyUONbMd3FEBCG6dmMH+MlUBKQn7I6YoCN
         OIdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789821; x=1792394621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QYkllvOl+MxaLFWOW+IjD7cSlpy3IDud66Um038owAk=;
        b=Md7Lj/cOt3v78etHmW96A6pNC/kQsGAH+cBDvc8FJ3GyJMlhunLLg3Md6Gglqew6dC
         3El0xTkEGkOqoadlIs8IB5tJsyX1X8PGVRUubxsxS4bO4Z/YYFSOI7i0tPONBEZhKnPZ
         eGU9fRCI8K2drU/Jol3ZkaN7xqEk2vPj0M1SzYNlsXDXL+nj9ubZHk4Ya0IRrwGLObol
         nk0ABT/2RF94xwqv33m08XC7Bff7r6O+J+pY+BAgwFNZCDu90gmv52gQLcmscH4iKvNE
         7qroRWMnMsjb1ylZJ6jiopch9Q7NOUuF58+e1lwil+4FbGQoM6bo6f3Zj+uS5nU3OFe9
         BWpg==
X-Gm-Message-State: AFq9FYLJGjccQf7+KyRoI0t56shX+ebnl77FUJOG26YwKiIVG+bj0cYb
	JQG+eE2q2VfeZNhfiL44oUrE0hZ2H5WxuB+8OLYHAYiEKx3zI4xgWgzbYgEmB/pGOVCbrg1R225
	OJ1fM8riYJPmKkgbrIp79XMXjfXm/kEkKX3TqJN0HrArH53s29Ab6S3RGeD6CvfN3wqgf
X-Gm-Gg: AYBFou2GKopWsx39ZJ8s8lhGVCmABdbtjLq61eFAfTeWz5gBGjGPu+EFpTuX/8/aw4M
	IOwP6QJxua18EWEiPGS9ZbJVBV65AYw40FE0vn6fYBZW9zPI4itLSiGmoowJtxkWtZ5pGpcOu2F
	FLtyQJi3K1nOYvTnG6ZKfrgycpYl/t+sTEgzoY0k+t1QfT7PGrDxtRCooLUqL7vM64oPynUJvPR
	f0MKVuBiWayOceTcFi+vgT+/aKnN+DOjnsC5u/56eLdxRKPPK0pWBbapKCftpi6wjrkvWsi3Tbt
	q/fiPukxM3WJds3FA8Hf1cKdn/uhPj8mOUQedV9jhQxebFYU60qhB5Mac6V5r/jXux6aMRR4pL2
	f8wQDKsiK49aeHCn4fPB0NN332J82RBQiIZ8NGLgNAerv5+lrDqwwsfev7cZ4s/vz7kuYiMQfkc
	YpA7HaYL9iu+iH+IzQ+BILclaD89iD
X-Received: by 2002:a05:7022:e884:b0:14f:b80a:33a5 with SMTP id a92af1059eb24-16a5d35f1cdmr18939893c88.28.1791789820873;
        Mon, 12 Oct 2026 00:23:40 -0700 (PDT)
X-Received: by 2002:a05:7022:e884:b0:14f:b80a:33a5 with SMTP id a92af1059eb24-16a5d35f1cdmr18939867c88.28.1791789820348;
        Mon, 12 Oct 2026 00:23:40 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becf08sm29748733c88.5.2026.10.12.00.23.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:23:40 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 12:53:08 +0530
Subject: [PATCH v7 08/11] arm64: dts: qcom: ipq5210: Enable the PWM block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-08-dts-v7-8-77bd3d68d850@oss.qualcomm.com>
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6acc8afd cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Z1SsOzVGKYioKmY9djYA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX2cU6ED4PzEPZ
 2YRlGrWkY0d3IWLQovsLAVJTQCwyDGB3J9CG11UwdVMlpR5j/piETyHjGMqoE/09ha7u8s0E7Hl
 bQIQmRsYw5Q4sdy7dLZlrwb+a2Q9AOenGsrozl41gIIb44FlK4kzo3Idr/Xndu8WZNXFgrVneVv
 mOTYrWqEOx7s4CTNxSPIzUUndBzcwH/FLqG5GKnohZnrMsatJUCZCArbvegZAuBqBKdcjznnkPT
 7xO5HvYJZcIjjFUhfMyptWFLyWR9kVhh3zxETvGvZ5uyLUF6aLLe4FousT17Oq1UzgXYNmIZK5P
 lWawcAO+a20onGX91oY/orCCkFYQoLy1RQe/TLAodvGq2ax8kKzKiHLLzQCw2eCVX7SGkOIGvXa
 iZljR4L1de9wEPXdVZcQbIlaBGCn3fmi7u1DlQ8F/pmWXyLaPIE0W4FnaEj0+ltsax/+w4szXHh
 kRw5Lii9w2aMiGBh0rA==
X-Proofpoint-ORIG-GUID: yLZs4l3XVfrWGcUK3K1vCgLrQDB1ialc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfXx0vxx5GFsMUv
 BqKVxEJI4X7y9vRHMiy0qkCZvNQUUfCGiCBARs97FsihJEXWqYktx6+GhVW/Pxu42/JebY+tEX2
 g2CjN1kVOqicspI7YyOHYbZSODhmH5o=
X-Proofpoint-GUID: yLZs4l3XVfrWGcUK3K1vCgLrQDB1ialc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120029

Describe and enable the PWM block on IPQ5210.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi               | 10 ++++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index 7f90a2632b07..0f7a8f2d886b 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -89,6 +89,13 @@ &pcie1_port0 {
 	reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
 };
 
+&pwm {
+	pinctrl-0 = <&pwm_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
 &qpic_bam {
 	status = "okay";
 };
@@ -160,6 +167,13 @@ pcie0_default_state: pcie0-default-state {
 		bias-pull-down;
 	};
 
+	pwm_default_state: pwm-default-state {
+		pins = "gpio11";
+		function = "pwm0";
+		drive-strength = <6>;
+		bias-pull-down;
+	};
+
 	qpic_snand_default_state: qpic-snand-default-state {
 		data-pins {
 			pins = "gpio0", "gpio1", "gpio2", "gpio3";
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 910196a23ca7..22ab99ca0903 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -398,6 +398,16 @@ tcsr: syscon@1937000 {
 			reg = <0x0 0x01937000 0x0 0x2b000>;
 		};
 
+		pwm: pwm@1941010 {
+			compatible = "qcom,ipq5210-pwm", "qcom,ipq6018-pwm";
+			reg = <0x0 0x01941010 0x0 0x20>;
+			clocks = <&gcc GCC_ADSS_PWM_CLK>;
+			assigned-clocks = <&gcc GCC_ADSS_PWM_CLK>;
+			assigned-clock-rates = <100000000>;
+			#pwm-cells = <3>;
+			status = "disabled";
+		};
+
 		qupv3: geniqup@1ac0000 {
 			compatible = "qcom,geni-se-qup";
 			reg = <0x0 0x01ac0000 0x0 0x2000>;

-- 
2.34.1

