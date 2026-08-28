Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C25144E64F
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920698; cv=none; b=kdoXeI/JF38ZreprRDcDlS+WXfYt3wEmoqJ3rR0Oas1Yur5hWq/RWGXZgO+8wDuU6YJ2ncNcseW91U9JWv+1eK3Gsjig0TIGgMc6hfsks3WaLxgAp2zjvTsAYN91bWUnzBxQRPIbnjms0XLvdQMWnNuwFeQs9qYVSbfNxAfKf3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920698; c=relaxed/simple;
	bh=CkKPK/p80axXy9nCW+CzdFHZccFX589EAIYQWRY16pU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pNmmSOLByCOGStL+z8UsuliqMKOMTDhRXK/dTWlCt4Jwc5R3DUJPa+n6g99AFukrofHnEeNC2g0MQ7LGEZVTYgnWJifkU55LaEJ1d2L4tfhjGDG8Wonzl7AnOXsuQputxIY6q3ZA3g+nqN08ApN1Y4LL5fkEK5jAtfq1vslsgjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IVfYNOOT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y/PUryiT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IVfYNOOT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y/PUryiT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA7IY82167554
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:38:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YKHsk+IpTY4zNYFA3IOxF6o7nDRhJYsjZS8bAhtdGEk=; b=IVfYNOOT4R70G3Vl
	Q2eSn6P/pQPjZ44hsTyhDkeAS5E8QRuJMG+4Lzsc5Q/FCZCbwF2bOa+0+QuJ9et3
	8UMAfAirjxY4C8zElyT7+LaMri4HLsQm7RbBF+8kLpKEP+OPmpgJcSioGjK8AmWG
	wpGsweJXp3eTMPReFOwlPrW5ToyCDobgXluUo+JwPwP29lTXrL0kXNiRtAbcJ00T
	QrQ/eZDWhUF0N4XMZU+pI8pQyN1KX/s5YOo0sZK8Y3w1ZPCm50XUfO273nF5ufGF
	bEiNNRE9fPDwJm1tPrVXWk8o94yZ9Yv8GqdqgDVuKIi0q7JOakVxe8vj7LBHJlYQ
	JnhWqw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb6h0108k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 12:38:02 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-90a91f4c6f1so8699456d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 05:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787920682; x=1788525482; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YKHsk+IpTY4zNYFA3IOxF6o7nDRhJYsjZS8bAhtdGEk=;
        b=Y/PUryiT6SetSH/dwGWgGmUxZ4FP9diURFaq1JrHg6Uzp5Xnvf2sqFfeKhAPuW7rxY
         T5sJ+Ci2YN4P4mTFLTDf9OeDf1YkDFx7jJHVftFDaFKCY6SV7MQUyyENE1Knaf/kjZFE
         +QtgrKnZJMnj1sXUlyY4xaYe5HSCpe012iTKyKMVucjR9cz8y6nU+FQ8xEqr6l7LWVJT
         xYkmDoo0VK2hVffRvCJ3Fukrq2CPbLllD8cDvZvmyFw5csjcOxmEbzPY665njXMcVvSo
         tc8cppfiGeXWdUkOklIp/N1tYHjntpyisJGexiChUjeVxd0f4Re7znIvVFI23jQL3Fh5
         rIxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787920682; x=1788525482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YKHsk+IpTY4zNYFA3IOxF6o7nDRhJYsjZS8bAhtdGEk=;
        b=iLcNevWdMtdiaR3OWdOkqfb8KBwliQ1ZXVd6b5SkHSK4uzlTtDXKHWzipsVu7arQYl
         DnphQBSMCp8a47yttXxgDHzt74j0w551Sh/zmfIg3bUaIbcS12lECiMtGOxWzcyXB70S
         aVG0pBcK0biXh4k49bDjCZZfq7/R5snM6eHi0QhVvGPe2fdKoHUZWB6uMYCnycE92xVs
         c5NJHBDZpoqe6gGjsPQgX6osjikG577IEt639SiuE/1+NbT8qWCNtRjs4XTzdFhbPKA9
         CJvAWtGyNixYiLgDHaGsGrazWQdmqWIgSPnPU72O2PSu/LynF4AlDRWg/wXTINh34yZF
         hZug==
X-Forwarded-Encrypted: i=1; AHgh+RqYhBW5rJoeTQ6uuPjKWxjQQsAUBnUUuW/dUlsOzqJydp3IFUrt8wIS/E3kEZ5It+qsEw8anyU3VoqCH+DF@vger.kernel.org
X-Gm-Message-State: AFuF++nw+oNi4tNJY/LhWVQzh/4QPMOrQ2OpXuVp0J2iK1h1jB9kAbu7
	uoap8LPtiy1QVFGvg3tiFjKjgIzEHfC5jbxrnNGuxWQaz18YfvFcYAeZJMDM6TeXTq8mNRYjYM+
	O4jmI4A6op1zKta8VJ2LcpiQo/ZjrFIJ451ozMYz4kastB1II0yOH79OWDhVbpfx1XRzw
X-Gm-Gg: AR+sD12Lhgb9IYN9w1DyZkzFbzeeZQDkX3M+/A+d3fdPVwqpIv4N7HhDARPkbSH8eEK
	ano5l7QYQN/admQ2W2TE+E0X5C8XscCXmlx/jcRrc5LhGdzDx+e7D6OA+7i0BfAzPpeOU1Glld8
	7uUKd5syfyBE25WX/pgIhSZRoNupSRkJv+sF6Z1PnwcZlPEg8/smWVCcwaTVnELAltw+Z7nQ/4F
	uf1grJ4E9OSiuSBJkPLo3vAu7Zdj8tQ8n7PTF1Ntn+30nOx+pWG41fTXGgDYRJZo5PTZHNd+w4O
	8ZcIRJel/bn0w/H8VXpvjMwptVi0R6Y/6f1RGkxZmoENfPVr9VDZIhgEkEiIbGSKtqfVBtWo/7D
	/8m6jGdE=
X-Received: by 2002:ac8:5cd5:0:b0:517:906b:c043 with SMTP id d75a77b69052e-52fb965f4d1mr85965631cf.36.1787920681805;
        Fri, 28 Aug 2026 05:38:01 -0700 (PDT)
X-Received: by 2002:ac8:5cd5:0:b0:517:906b:c043 with SMTP id d75a77b69052e-52fb965f4d1mr85964691cf.36.1787920681188;
        Fri, 28 Aug 2026 05:38:01 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b92671c0esm39338965e9.2.2026.08.28.05.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 05:38:00 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:37:26 +0300
Subject: [PATCH 07/11] arm64: dts: qcom: lemans: Disable Inline Crypto
 Engine by default
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-b4-dts-qcom-disable-ice-by-default-v1-7-1d6e0c2f5a69@oss.qualcomm.com>
References: <20260828-b4-dts-qcom-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com>
In-Reply-To: <20260828-b4-dts-qcom-disable-ice-by-default-v1-0-1d6e0c2f5a69@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1953;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=CkKPK/p80axXy9nCW+CzdFHZccFX589EAIYQWRY16pU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqkYEQ0vsFwo4ehIIwG2Ifp026YpUgv+sVhAPgj
 RVSSHS/9EyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapGBEAAKCRAbX0TJAJUV
 VrB5EAC97Ng1U3/XWy18CIk9qjnq5VBey6z+/AtYXdePrrbTI8HZipZmuLx/PRn2EscJMVL+W2p
 X5JBfGg1rT1tA5b8TcBMn4eONdAh4GVPyFqEeBia00FPlxvCMQMla6PpLBz8QJCnv40d/hKaEqG
 Vp73ml5N9tBLIrw6FhFbKo25tUs1sA2a2f6BdY+KG0yCf7gvYlB6JArdm7LqSns1JYOK0pCbGxK
 xbMxlrBfbiCtNjGZPWfBsJ/RPvvDR8j3SsaeK4bymImDnsXFtvaciUPhwDzsTYzB7PTYbOhK/jW
 3QI79utE0vZOj/0y1gVp+7fAIGPq99qaBNYf7kTRCsGwmU3QDGxeGYdGR49LfKcUbC+OoEK6Niz
 VSwfw/1S6BG8nBhPBfeTCH6prTYfLiGWprVKXhi9tIwVyfNr9/Vy76mZg7hwAC+o4YgzzUmXPoi
 NXTRZg9hKIR46yKCDNb7WmvzTv6kusBU8T6vikrDYqnZB2WqsSh2GbPS0FMKGwV6q+srJxaCW7f
 Zo/8Xr7UVWMW7S56VRQP1qFT1HBT5suiwax6xBiNuxGXYSDLsT4GBzjfPnPf3akOC0fnGCiLb6U
 RTdOf3HMl1CXd39gmcks1xgpF8dQlAm4tCkdqyj7aNK73h6ScXsD4ndFE2w8COczlYc8nTrRyTW
 yo8UClnmWdDzhRw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: pKQsqtjZ_7KvswU1O-XfhUCUzBMt53jk
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX0+zHYkPGFSWa
 DCEXRoCAzKtf68tGQUAes73t+/rnj99gOEHxoke2yOhoNVfrofTYxCFONAO8raFuZ5qXLeeCOq4
 AmcOVn55oelqbykmEUF1aGSEpSjzOB0=
X-Authority-Analysis: v=2.4 cv=KPpqylFo c=1 sm=1 tr=0 ts=6a91812a cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=R9TnukjFd2VXrOE3MjoA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: pKQsqtjZ_7KvswU1O-XfhUCUzBMt53jk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDEwOSBTYWx0ZWRfX7u+pNZO+e8bh
 fNebbHlipBU2qXSwPE2ZqYbEwVDJwXFK817OwK3KLDw8zfW88sd/ShP/IeNKb6gHYbbf5YO4hdE
 ajf7f32qA7eNhny5up7dy6LU/D9PTl3fisQ61eItXj8c2JHpC1hvLCcd9rAvbICEsHPa50KuHiR
 z6rw/mbB6kVYrCcPvbtF1sSdi73oTbYSmKEgpB0y+f6dWm8OFe6DEEbqRTqVh956G1qmmnff41I
 qH+QoISgS4lAspq2lVmNCoV0DBr4ib14rQryBwbW7o4uAhhZcjDOQ7jnDgmLvdHgwUPf8Wzy1nd
 5RESBxwvDXm1TzWPLsxN5vQnclSDacxVKTfjx9nKVzbiAWAhyeayLGTRnNwf/0XJtR5g8nteXcj
 2BBxj6LEJlAPzs1TjGP0dsdgPltUaZ8xld32wXr/0H10tuIQG5XsqgHgeA5AiaYli263REH0bDc
 H8hi60sywWnyYtc/TdQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608280109

Since UFS_PHY_GDSC is attached to the Inline Crypto Engine and the driver
does not currently enable runtime PM, the GDSC remains enabled while the
device is idle, even on boards where there are no consumers.

So disable the Inline Crypto Engine by default in the SoC DTSI and enable
it only in board DTS files that use it.

Fixes: 04566e287b35 ("arm64: dts: qcom: lemans: Add power-domain and iface clk for ice node")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts          | 4 ++++
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 4 ++++
 arch/arm64/boot/dts/qcom/lemans.dtsi             | 2 ++
 3 files changed, 10 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index a45485b54a5b..27dda67f3504 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -786,6 +786,10 @@ fan {
 	};
 };
 
+&ice {
+	status = "okay";
+};
+
 &iris {
 	firmware-name = "qcom/vpu/vpu30_p4_s6_16mb.mbn";
 
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 144f117ba511..714414806730 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -581,6 +581,10 @@ dsi2dp_bridge1_out: endpoint {
 
 };
 
+&ice {
+	status = "okay";
+};
+
 &iris {
 	firmware-name = "qcom/vpu/vpu30_p4_s6.mbn";
 
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 695eae1b7256..0795b2be56cb 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -3093,6 +3093,8 @@ ice: crypto@1d88000 {
 			clock-names = "core",
 				      "iface";
 			power-domains = <&gcc UFS_PHY_GDSC>;
+
+			status = "disabled";
 		};
 
 		cryptobam: dma-controller@1dc4000 {

-- 
2.54.0

