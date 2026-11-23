Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795463563;
	b=B/zhA8sQu3zssq+VbxckoDePR2KspwxxhdoEqJEyb2+EZm7RDB91DrZ3O2Yl/y6xj7jI
	 y+U60AV3T+zeyvdevm32qz9EA8GYSNEmuIdsasXQ83TRSwKl+hnrDn6DBZlB7b3rr9P8d
	 p2PO3FPTv856F8svWS0fLXUvfmILx4HMBxE7SU5KXKoJUKRt5zBAjisZiVK8HPI6Xmawt
	 hsbbRtP8LvyRYqneA34Ejdoyy/Cas4rbJcW4TyJ/5kPppmaVS4sj223EFZzRCTobg64XS
	 BL6vYATKBumwSO8AQGE+L8osA7tB3+u9SmRCuBCRQ8SczWWiHxHP87yYAL5dcF+mq/w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795463563;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8ckrSPVsjExE0zofMEyb/7LGF90QWOS3C9OwQZge+cQ=;
	b=joPqxRCvzAwR8QvrfsZViUTH7Q7KZ8GMvvw/UlLCUTd1WYN00t9kyFNVYd0c65JOgl7E
	 jzGC/TvyujK+pVKaASKEvcy05Vb6GvpqfCF5stj92k1dj8YiZwaf05OxuSDlk6seRKxmM
	 26PRdK8scFTyr3AI2r3aX0TGDyup8PCyhxya3uynGL16Ebzz3Ak3LWZGRkfZmPwRNO5Vm
	 griMf3sjzpyu0aGZTvHMgiMajHd9x9vkU08gPtCweHsvH2nTIbsk2Fvdp0t9QEUCOpBQz
	 tK5jze1Yqr9CTfIFWSwKrHPZjVaSUCnObvhGZ6ybPtLKNxwezHd57uE4xXSOFW/hFkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I1TDKnn7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PkDTIqSE;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1901606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:52:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1901606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I1TDKnn7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PkDTIqSE
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJ1nTJ3211961
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:52:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8ckrSPVsjExE0zofMEyb/7LGF90QWOS3C9OwQZge+cQ=; b=I1TDKnn7QhMB3PBK
	No8NilYpEKgpq1suagt+vSY0Zndoz2v9cnxfOBRkDUDFDxgeztcxIHprmYU+88mk
	P2d4Fk7zObzRHTTsxOMRVCBQ+xHmPr/9w05OJ0F2XR/C6+ol0XQGRig+2Y/0u+no
	indcRaRuB74V+/Jl+ktGR8Hsq8fsCsJSEnqgbuL3rlOlehQ/leh/Sx5QL1bDxZDL
	sg3jVdRVf61tb6CwajufuM7mLNeuHy/da5V2cLAaIG5BrhGbg4qotPO9b4ExoZOo
	cjfPtI0BxqlTZyiVFljLsQ9vjKpa4CVTyXhDQ/gB0SGaNLXr+6lG2dRonkIuL+lA
	RG+miw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4u9nr6uj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:52:41 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-386ad819860so150855eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795463560; x=1796068360; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8ckrSPVsjExE0zofMEyb/7LGF90QWOS3C9OwQZge+cQ=;
        b=PkDTIqSEy6bRPMwGBYNwbhMF05vtOcZjDqvIbI3qKKaVEtRcGBz3JzsNFVan/aYzkj
         dC0RUiWClaNhw2DO0ka6hQnpEamqX86ekSfRj/Ik2JtSIQs9sOj7Lh72O93MU/x/yQhG
         p+eI+Y+AVFaYr+8n2w349bzflzB1jY8Q/WPEV+wG2Dw6WIMOLwuLxQ38C4ba5lQBxR8E
         tM7HgrByYFFi8sh5nDy4YHNQyEwVPV+apE6NKjyk2RhS/oRg74WzaffPTmK2zub9vW+v
         UIHgsU2fffmjonD7QpyQ3TA9u4fgio3aUwrbhKxPfzTT+96leXKRACvB7b869MZ37eKS
         z2PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795463560; x=1796068360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8ckrSPVsjExE0zofMEyb/7LGF90QWOS3C9OwQZge+cQ=;
        b=o4InT7hGyfos6GkWrsxdtxWVrGe2xS/g4zo2t/x0ZUh5bQpXyQWxjakg07EWedC/mi
         oCxXEnDEjbeoJGHU+vEzDTIB2j/7Mb+B0FTPCEYhP6p43cTESeIsmNHgWjg4F1mFTWF8
         Uun4YWvCqw6+tOhWQ5fm9wPNG4C5gLf/QzDOSItbBt3oeztXqCYm6vTlbRdPCE3Ix5+c
         W4U/3Mwe0VfDpZ98ceSJmJB0ghi0wCorRSd2I8elyx43PKSSqDkhL8SFF9g01EhkbcPM
         IkCxlKo5Gd/4qmbzUJpq+DBtjOXZwWN+A1xUMS/rtEzDQQR0qodvJokSMuPMCjNuDXih
         Va9w==
X-Forwarded-Encrypted: i=1; AL+hErHvB9DTWWDR5AdWrYTfhA1AlqhnbKx0EDky4m6N+64GE0m/6gMTuErvxBuWsgDI0LSnGSNQjPdjiAlY5r1W@vger.kernel.org
X-Gm-Message-State: APuU4Z/My1MXIsBIr5OHacAwS+10NApJpqcg96bRRBzgvc2OBbtX8mis
	TAIuJ7brkEbwOM8V+7JgRdLWsUhQ3ET1a224DNxt+YoTMRO7sPRoatTG8FjDl79KG7cXhWVKvfr
	+Blg5k7iQjXYwT6lufgZ37yl/sxtjf99e2QEoQla/hwNBgPiGdGCRmn4mcQkO00HITKZT
X-Gm-Gg: AZFdTZc5k+QGXMQnYrNY3tDoZjlpvWoudUyA1W9dfaNXxP2oSLipZe3rg+1omwZY+Sz
	sAaEDiRgAQjzZwvqQ+RSSc6H7vgBINAqRai54G4i7ALvixDMxQc/64FCwPuQm8bBd7WmLVnvSx4
	GRDkoGDh1wsY5aYdL/DCr+sCye9HYod6CMsY/VfAfvDJagKcAVovxICaEwAezsh+SQZOs9s/rFq
	ynSZc8AueeIKQy6vKWk4R2Th5ROQM+s9VVGSFHP8DkVgH4zsnHA/oC9IZLu1+HTWUBUNWeDglyu
	Nb+kHjz+uSMTlJFFEJwUaYGZBrBumtY8mWRUbX9x56kj2UBQwbDgmBTifNl0ywKPphZPasXu7nP
	bLNbuIQ0uqIXaGurCMaiZGf0MOyRQqvzOOjzJRjS7bnaTraPHQhAmKpNGHvp77NPVSb4V7LOOmQ
	==
X-Received: by 2002:a05:7300:f498:b0:386:a716:916b with SMTP id 5a478bee46e88-386a7169544mr6475648eec.31.1795463560522;
        Mon, 23 Nov 2026 11:52:40 -0800 (PST)
X-Received: by 2002:a05:7300:f498:b0:386:a716:916b with SMTP id 5a478bee46e88-386a7169544mr6475613eec.31.1795463560078;
        Mon, 23 Nov 2026 11:52:40 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e96bdsm36363123eec.7.2026.11.23.11.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 11:52:39 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 01:21:39 +0530
Subject: [PATCH v3 08/10] arm64: dts: qcom: qcs615: Add GP M/N clock
 controller
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
Message-Id: <20261124-b4-pdm_clk_gp_mnd_v2-v3-8-98db26a87500@oss.qualcomm.com>
References: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
In-Reply-To: <20261124-b4-pdm_clk_gp_mnd_v2-v3-0-98db26a87500@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX13kxwcwo/9kF
 XRrJvy3hvTvVxEknjhsRsdZwcjTccehWoNdV+rKcuagbTV71krnDTtXIKTm1lUHIoZfTSscF6X1
 n5kEvSrZWomxF1mlk7/FJKNCZ1xiRdSOqjgbJXtqYu1htGFyl8sfxYOEw7Mn6h2fNI6X5SYEbGM
 OK9D6ULJieZigCshJ//wQ/aRwISQTIG2TlZb3ka9UnmjOp63qcvcHmxYHdbTPAXaf58qiPUJOnw
 /XOUwhfSBRig6KaUEtTRxTQFArIjzaNyHVA3UTHWi1qI/2B+Ncr9SEPCOl0fHPhah0GMaywuKb3
 +BMhQwRR0iOBF/V9JNotQUISFnDIAgLQpegGy+C52shmk5a/pMRg9FDpbCPq+yXW2/nqHuM4Vog
 pW1Y1CDScZN5Zn5JnCWwP8RZn7fCUeJ25vEy49Qmh8Db/R0r8gyLd3PxXgW7ifwnHIDuDDa3ErL
 ScK0Tes5SoEqHuBoyYA==
X-Proofpoint-GUID: rjWq3en-9zXPUfLgf1KXjlxeHLjpGpWc
X-Authority-Analysis: v=2.4 cv=f4ndl+yM c=1 sm=1 tr=0 ts=6b049989 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=pimPiyicOD4MdmKq59kA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: rjWq3en-9zXPUfLgf1KXjlxeHLjpGpWc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3OSBTYWx0ZWRfX5XgumlI5AUlO
 2dtuj5FvAMvFrxMf7q7hshQrQaAPbghlsZ5r6vEhQe1i7j1fAIJ8UJedRHpes8cotq14ofO9l1F
 hEYP7ZW+PO/2c0mg7YFQKwWz3/jn8J8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230079

Add the GP M/N clock controller and its pin configuration for QCS615.
The controller uses the PDM XO4 and AHB clocks from GCC and routes its
output to gpio29.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos.dtsi b/arch/arm64/boot/dts/qcom/talos.dtsi
index 1d74e459f892e7aa65296850816dc9ebaddbe3af..a6f195509ac2e27a4862e49e82cd9a0fda67d153 100644
--- a/arch/arm64/boot/dts/qcom/talos.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos.dtsi
@@ -1626,6 +1626,13 @@ cam_mclk3_default: cam-mclk3-default-state {
 				bias-disable;
 			};
 
+			gp_mn_active: gp-mn-active-state {
+				pins = "gpio29";
+				function = "gp_mn";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci_i2c0_default: cci-i2c0-default-state {
 				/* SDA, SCL */
 				pins = "gpio32", "gpio33";
@@ -4031,6 +4038,20 @@ opp-202000000 {
 			};
 		};
 
+		gp_mn: clock-controller@88d3000 {
+			compatible = "qcom,qcs615-gp-mnd", "qcom,sc7280-gp-mnd";
+			reg = <0x0 0x088d3000 0x0 0x1000>;
+			clocks = <&gcc GCC_PDM_XO4_CLK>,
+				 <&gcc GCC_PDM_AHB_CLK>;
+			clock-names = "pdm", "ahb";
+			#clock-cells = <0>;
+			pinctrl-0 = <&gp_mn_active>;
+			pinctrl-names = "default";
+			assigned-clocks = <&gcc GCC_PDM_XO4_CLK>;
+			assigned-clock-rates = <4800000>;
+			status = "disabled";
+		};
+
 		qspi: spi@88df000 {
 			compatible = "qcom,qcs615-qspi",
 				     "qcom,qspi-v1";

-- 
2.34.1

