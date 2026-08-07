Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303A2291C10
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 16:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786120560; cv=none; b=JQ023FJqoPbX/jgYm/3pbNH7RD3WYKveGADlF7iK6yIwrW7MZTQWPUQXfNMS9aNkamRgY8P5x1cjg8/rRDjDSj2ja2B4pMrIGq+MV/Tl0ycOOw4OISAUf+bayFHVrMtSiYqqNlxdQUF6XbafbIandx8bFA8WQKZP/14KZGGIFQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786120560; c=relaxed/simple;
	bh=l3hdS9oe9Ob+4L9fKQcTwy3SCLCh+xyP2FBqvgiDKM4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZWFaTivj7u+x9ieeGwoWmhibVYFXPOk1/iNSwMfualsghtirUksBy2NWbuIQvGJwIwq94c6GZ4H8MDACtehQp4RRPJEfQuAdt4TXbo83alP6o0tjPesBkcig16qm7dWP0CbZrz54ALIvDbcdBeFz51zXgldfKyA1uwK6F7TPMms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tohd4Yxt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iz9hO/ns; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tohd4Yxt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iz9hO/ns"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 677GObZh1808236
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 16:35:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d+Xo/yZ5cGMlbYz002VO3p0ZTjgmFWg9wox9uQ63vQM=; b=Tohd4Yxth6neuGnz
	w31V+xTFArIbZEGGdN4jnsHFKxWrVvquuELTRpTTT3mUSSDGduNAU5zcQ/x4gW6N
	NcDWOo7wiiZYPmMx8Dya0Zuw6lXY1U10o9DoWOiHHqg0j8eDIGxvtGO4VETSc/2K
	6DchYFMTeWokQdfLSnfNpyRgXmo3SOAIrc+wdfrxq9ePYcQgblDlSP5XmYovOIhM
	mK5zAsg+Su+ZqUjPAuvW8O3gaQgnWFrFAtrzeU95zUynA8HzlTogkOLKrglqzDyM
	q9LEXn15m4U9932ScFRX+K/E0US8eKdIgPh7gQTiJyDYmNSZZtjSio5kyQUY0UCg
	iiDDHg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwgewgq8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 16:35:57 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so7798036a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 09:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786120557; x=1786725357; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d+Xo/yZ5cGMlbYz002VO3p0ZTjgmFWg9wox9uQ63vQM=;
        b=Iz9hO/nstuFUwO8+l1bJ14Q7S/1yKvyQTgCBj3T94eSmQL1/aVhSy53Rnlfbafp9Bu
         2la1wxCC5tEiVn28fez19HKRdjWGiBJqn4VARxFHjqLtMH59jO0xxDno5OXni+YpIe3B
         GVjyom3OXcGByaTEopsX7OAp5KPcy+nYB8gorS2a8QPJZBqNV+D8/8fns6dUZ2QsxtZW
         hJyO2e0zEUb1CltJgjOSiB/cm97UQ6HBtgR2/ptdISrEQhWlWa9tcvay7k12hvp0booS
         7jXxt2Zj4nAxqzQJ5yWD3kcHr5WFuc4s4ynJdfoKMjpUblQpPe1QUW5/TeaJ2GGxBjIy
         CqLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786120557; x=1786725357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d+Xo/yZ5cGMlbYz002VO3p0ZTjgmFWg9wox9uQ63vQM=;
        b=BR+NGz+ODBn3L3wk7lLedzBqOWl4c6X63+oZ7r8p+hPmnfScpNqSpbqv8/Fac2hLs6
         P6Lcx1mmmnV4gFsbJDOGDfrRhensBCo7WKEPYmUUh3fcBkYCVuJGi+prVB+mb+CdGSGJ
         PJf6fm1z4HXNueZ4gHj0bGrr7FoIuSpbKiBx3exm6/NKNREkkYEsMdDKJlqQL5cYp9CW
         WLE/CQ2OS9dHt2ThezVq6FwfmpIZi5XWjov54i6m04ctjVeXjc80niIQTJIYyID+1Y6c
         zB7xm+rP2eSI2Vp8h00CRjuD+8tG/8zPg6camigmkB6E7drZpFx0hJZQcEy1h4ljJuFX
         aWTg==
X-Gm-Message-State: AOJu0YxPen615swsrAefpTNRQBjBHOqoU/Iz9OVTrGHXsjS3Ra3guoXo
	VVh2c9/3xyaC0/+kLGqRxV6zxHJ4g0RIYUSP65h1QAQMlx4NprLNsG3Lk7LEJDH9fg5w3EK55I9
	qseHbNsCoqym54OqFZSw1hHHeAEfVsykzC2pqMT8WcQBBB4tsvWm9l7gvBkCEgnE/kcK0u1vz6m
	A2
X-Gm-Gg: AR+sD12O/py2cENMhgXEUnQKjKERZo7YzN3IzI+OhcnojoUX8Qe5qcT+uajcilnvvtK
	hRtAkguTSgbovlAOirWJwo9v0Jwa0ueJgJ8ns+d18LGtSBhubezpNz9Z3PZo4GHxr/1poljym5i
	Pa78Qq3Z32Tu8t43V++LzIg106fLZ5uX9JhhgJuE0xQ3WG80FmvBvjIfQetAAv2LCa5lslhp7gc
	lxryqEIJVxPHKnfI0akT6M2jlvDAHFAsl6rIg8mpMAWx34YVgHo5KWYvlYrp3wbh5Dq+CrXIZUy
	lkIXGZSEVyrG0aZMkfTgwShDPuwNusdU0cO+ICJvFoP/rBXVmaJXvgt4PsDNGhQlaWxRqG67zQP
	4jnSYZiJiadQR0M1IiDjDqXwLbOuXU/u8urkA9XiQI+Dcy5iYC+eYO/k6rTBrfqWNXNQ57izdtZ
	sDqLL7Hyk1Asg=
X-Received: by 2002:a05:6a20:4322:b0:3c3:b57b:6285 with SMTP id adf61e73a8af0-3cbc01b4a9bmr5152101637.13.1786120556892;
        Fri, 07 Aug 2026 09:35:56 -0700 (PDT)
X-Received: by 2002:a05:6a20:4322:b0:3c3:b57b:6285 with SMTP id adf61e73a8af0-3cbc01b4a9bmr5152063637.13.1786120556447;
        Fri, 07 Aug 2026 09:35:56 -0700 (PDT)
Received: from hu-mdalam-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bebde2e6sm8918689eec.21.2026.08.07.09.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 09:35:56 -0700 (PDT)
From: Md Sadre Alam <md.alam@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 22:05:33 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: ipq5332-rdp-common: Enable quad
 SPI mode for SPI-NAND
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-quad_dts-v2-3-6f578d4152b7@oss.qualcomm.com>
References: <20260807-quad_dts-v2-0-6f578d4152b7@oss.qualcomm.com>
In-Reply-To: <20260807-quad_dts-v2-0-6f578d4152b7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Md Sadre Alam <md.alam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDEyOSBTYWx0ZWRfX/3cRnbGy6VW2
 6m2g9UXe1x9SyuHXFQMACGFZ8XNiidWejPfFRH5S8IrQngy8zagBJrvy5y8yXqMPGPNmnH1r1iJ
 pS8Le/BrrQawe1iqqOQNk9aJ8Ocq1NI=
X-Authority-Analysis: v=2.4 cv=N5cZ0W9B c=1 sm=1 tr=0 ts=6a76096d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=QrhUAEvljbRiGgZU1AMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: UdzZVe5XcU7Dw0PDqCojLjGoAjWO0MSI
X-Proofpoint-ORIG-GUID: UdzZVe5XcU7Dw0PDqCojLjGoAjWO0MSI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDEyOSBTYWx0ZWRfX2ut6iu66DsfC
 JeqsWryZcd9FkkOooKgixsivzr3rvrtlufz6JUs8OaMNU13u1+H/w6xC0PbA6YOvXZUSLrrBGeY
 aOEuivp8vcC1FDzb9BY8xQPfL7LZTJu40gon1FVMK88swJ3JWhaacTKOBwKilVSbR4uqivuVkrc
 SdqWacGnBNEerr3s8k0oB8j6qzXsIyNphhrSZBOuBh9C5SkQGTkvYcelmodCtgKt4llzd6Eqy1B
 n0nQ5y2zo3U7JPwR7bZLwzfQ2eIopwFazaygTBdaIEW58ARExWbBvNgbm0ei4/KS3l7pPeAI0iY
 usap9RHmecDzx1IZSNOdqqtdGXGbnBXiilvZq78nwDAE4WKmFv8YpRnGP00GJjhSptALtK5zEqG
 MtrTlXgWk9iqi4u8urQmMJB845nkx2z5LsZcdV74cfo0JNhV2N3gm9MgNQQh1c1viawrKc7X5S3
 elJPPUGSjdfHZ10MLIw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070129

The SPI-NAND device on the IPQ5332 RDP supports 4-bit data transfers, but
the device tree does not describe the bus width, so transfers use the
default single-bit mode.

Set spi-rx-bus-width and spi-tx-bus-width to 4 to enable quad read and
write transfers and improve SPI-NAND throughput.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Md Sadre Alam <md.alam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
index 3bbf748f2e5c..6f5b193a204b 100644
--- a/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5332-rdp-common.dtsi
@@ -141,5 +141,7 @@ flash@0 {
 		nand-ecc-engine = <&qpic_nand>;
 		nand-ecc-strength = <4>;
 		nand-ecc-step-size = <512>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <4>;
 	};
 };

-- 
2.34.1

