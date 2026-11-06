Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977329;
	b=g5jgH6s7bGSS/rZ0f5/n5MA6qx2zWRxurYHXpwve1b1aPhSHetTNLYPHyFYFqy/op3Go
	 X1UcIPaYTEdKZjcSpASM9lSb8PlFuGutRhdKMXF0Ak6HslgcdUivuWucF4dw/MC3Yo/f3
	 8x+RiMG+ninjVedPYUUnzndY/6mPpaZtZSzK5sWu/wODI941QOtOm8o0M4cuGzzuV+r8m
	 I6sxhdQ7opJBaTBq96wX9SYhwPideYnXZdBVRW/8wY5WH0GmhNNXZPuTP10p89pM4pw3y
	 T4ezswo6PhWg+6PGCOVFSHZ3h81haht/9hhVTBY/l5YyXXU2+i9r9NuOD/um4IiPUVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977329;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fYU64DUDZCc6GipuvyAmFtgAHJCx6TUF0Ih1JIPFacc=;
	b=hmTp73jaU4wruIPyc+Rd9vi2XV3furp2JXHJB0qIHgBSl8ECmK2zq14YkhFX+boNv6QN
	 LQfRY22ofOzVhI9rMWxKg5IJdjbtk9PqrJiXcZg92ieMZskdNCcp3UdYkHH3tV+bsHFSo
	 +DldT0WeJiRTqNbUUuh3+5J4f67/NTLzK4cNAbQrgiXmuBxlOiC/2udGKjl3qf9NoljNQ
	 nwBNbS/JobNVIdt6CJfZblwWy1FIvrGr/PprtU7+ttLCDNXsUq2cXShbyjheGJfS5AZUY
	 PaSJGZHWfUtWlePd5CtHsjbKvXoE40FdhJd03/jfOY8ezcCPxTcn2ylxHPrJ4/eNywg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SDZaldbO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a29Yh8cU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F351606A326
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 15:02:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F351606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SDZaldbO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a29Yh8cU
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6ExvCK3324808
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 15:02:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fYU64DUDZCc6GipuvyAmFtgAHJCx6TUF0Ih1JIPFacc=; b=SDZaldbOmYwG9NEj
	hM8bmVDNFqSSe4M/Qe0rvTogB1uxI7CoLNtl0nHoSNhO2/lXxgR+NS0kohM4SeP8
	ZTTyMogd29tIx+VsK0Y1peZr5KeQ6zAeYxWBbQAtW03cSaGVqqyvmRGZry/Zsu14
	JD3u0XniyklpslbdRRBws8fC8HN9nqxSSklCOp3yYpDmGN4slK2p2vbVQtro6Y0f
	FjvWudy3MDjLg3a+tg8qpvx7L3H1LeauMZwclexb0vmVD1/IxAJ86XX+lGqz2rFT
	NwHX5qwFvmeb2jGM+xUNldas+5nAfCDNtusDBYFKxVxxV8yVeKO6pxMHcBuTaFcV
	ocpQuw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9bb45-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 15:02:07 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3ae6fda7a00so842650a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 07:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793977327; x=1794582127; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fYU64DUDZCc6GipuvyAmFtgAHJCx6TUF0Ih1JIPFacc=;
        b=a29Yh8cU5DH5boyQ5JnEXfDmNLDEwuoLwWF7eZfcVoNKtcwFhIui1WhgUCp0pY/BY6
         QjoMBBTwvUa/Q6u8p+MxNAG903gsnOKapgxhwvV7zjD/HmD43n3CNmkmUgYt2nsPtc55
         /EIqORXvyUOWyhDfsCR1KSGFcrCfUca6mVxM026oy94A8gNZ1x07omgqwzmnS+zsNtxU
         GfwJ9V9HZzCl5AREfhFaIlSFZGRUXT68fVhYNFd51N3FW0ZX3jT+XZ+8N6ua49t0W+9b
         ZLYtW8PmjTSQUjypRFyEhoOlbWU0emeQmobKbbvwPaZDT91Dy2ggIjfTPMsHJ49wLrgd
         L3xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793977327; x=1794582127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fYU64DUDZCc6GipuvyAmFtgAHJCx6TUF0Ih1JIPFacc=;
        b=WGuWu8QuC6PzUFOvtv+9QpOq9Lv8Ox0RV8S+zCd5C4RxyRO4Bx3tf9LdJ4oD7tSYes
         ofzcfzFV3ItzOJnk7Fd8dKOELLyOVJZ7wlm8KHonzf9iypwMfjExhmpjdIN8EC8baBgu
         N7Mtafr+rfXl6hPqeXTUC7jEjI9Lc6sIKGE2DzX8fFRD/j9zRDbF8JU+anIIjUG54We8
         B9TZBNhA4saizNmLSLaC5uN7iSRbikOwtIHkebjyT/tx/K++LOiD1VYx68MqVs0xau+t
         h8X8IgGST65+WaZD8C/xjICUb074jWFez3p0LOOD6BZ153ZU7DqTWifnHAT1fvPNoI1J
         xbWQ==
X-Gm-Message-State: APuU4Z8xTg8nbxwqCoqem1kvS+c2U7VL7mbDzAa8z+9leWsgfUs96bO0
	Z7Yuk/T3+Xl9HWLtWclJhTUHFhV/n2y2PVTXu51SstfhJc4RUZAWIAeW0IR5CuCEFJ+mpbXo5qG
	a8m6K3lKBGCI7NBGeNEJD6cbOfSTAOrWe78I61BC8VaW7czTM4hs7Jc9JUUhojLMetivqbDlCCQ
	5+
X-Gm-Gg: AYBFou34SE2ifirR6kk0XY8HBXHcGadC79C6SCt8Vo2sT9iefWy7iCsVfWmZ+fl8fnq
	R9uoGtG2w6nOI03UciwcRFmPlGF5hpJ/Y4qYDalg5uQ9Dc92ItuPCgBqLwhF72KpSx71IqPI5A3
	xe1/rSRde46lOgkOhENkZZhz4QNAOma1/6QhK3MSluOjtlgnJm0L2QUrNJkrxYdYk895a41bJip
	c7y62VSpAnhI2h4YBoA6O4cQlfjHk4wl8eFiSR3O79vP0p4BRP6ZwiYMMEkJiRGcApEBAI06+OS
	bB28YHTeKuFU/P/VGj6lNfQb295dzQxFsO5CGig/casL0NjjMpIfefG8i3uMeOg6A4YSJsl1+iC
	ctxYLrgszr6ewbbPb0TvYgdLprHzN5ldYbSsmih8RUDiEtlwn946WAFNLpLH20v1yf9ui5YzIMX
	44dU9SDXCV
X-Received: by 2002:a17:90b:54cb:b0:3b0:d070:3c4b with SMTP id 98e67ed59e1d1-3b0db6ffb8dmr2344808a91.33.1793977327150;
        Fri, 06 Nov 2026 07:02:07 -0800 (PST)
X-Received: by 2002:a17:90b:54cb:b0:3b0:d070:3c4b with SMTP id 98e67ed59e1d1-3b0db6ffb8dmr2344749a91.33.1793977326247;
        Fri, 06 Nov 2026 07:02:06 -0800 (PST)
Received: from hu-jseerapu-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0fc1bc1e6sm100032a91.0.2026.11.06.07.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 07:02:05 -0800 (PST)
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 20:31:20 +0530
Subject: [PATCH 2/6] dt-bindings: dma: qcom-gpi: Add QSPI protocol
 identifier
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
Message-Id: <20261106-qspi_upstream_series-v1-2-21f43042dd60@oss.qualcomm.com>
References: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
In-Reply-To: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793977309; l=856;
 i=jyothi.seerapu@oss.qualcomm.com; h=from:subject:message-id;
 bh=iJecahOznZMfSn1ZECEomSzUGcetmfIMkxUzE7I2o4s=;
 b=B5SY3JrN4UIDmzeORd0lh9riEKx7+MDEpI/r2Yb04WH6sz03eNKv/Py/s1LJ3p9cSHMUByaFT
 yK4pOmm/NlPAouJHsvCk8M/r3gq3qJbwpGP+ClC2qE9librYyE2HFba
X-Developer-Key: i=jyothi.seerapu@oss.qualcomm.com; a=ed25519;
 pk=9vafyYsia0OnBKWSEwhmWe3hPVQfI2T1xOs5dPaFvEo=
X-Proofpoint-ORIG-GUID: ivoj74euBXqSPlVdMhvqomnFwgXTTl5J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX9gtqVyBA2A8f
 JMUKMNVFTFn2ybwaQTO+MlqO0Dy7rpxHQwdJKjWGov+FJL+xgVwiXCZg5PseBndH1ZuEANTBCN2
 xN8U+Bn43td89nIVY4UHwaRrDtJsqLMk7CYQbcSSS6e/kIXiSTAfpa6UqoDM25GrkV2vVXCaSk+
 K3O+kVuiKeX28MBr7Qxhe9iWJ4bCzZedCfJvEyuHWp9UqhGYvlX9DaM7oYrBjuZ06FLO5do3jwq
 k/0/YiGi0Ik6MLYGvo0ER6kfZgmZ1V3X/WO/JWrc0007ybX6QftdBwKacqrrGIKhoRWJVKS97/Y
 Bs6th11pGZCZTsMQv6S6m1yz5tnlmNOmG+6mskcynSm1vYE64bphPZfWsXaDy6lNbmnZ3uVrtCF
 aEP6nXJNPQBhlIBmkYQ4l5c6k9ZCj6p9aOnzJ9U3KDDslMgovEhZ95GaF95Ey3T0HB/LW7RYY0A
 efjePyfGRdURLEAhAvw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1OSBTYWx0ZWRfX5olWVEUGNRmH
 DRYya/GHJSR6MhIIOQgfmhJ6obljhGLNYXH28MHel1k/I5rZMU5KEBlH3omjT4tfFvjlx0pTUrY
 YBAPPcLTpFp/AXiimYBU553mbagSMEk=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aedebef cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=htPuCn9dtfDBuPHNxMEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: ivoj74euBXqSPlVdMhvqomnFwgXTTl5J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060059

Add QCOM_GPI_QSPI to identify QSPI (Quad SPI) channels in GPI DMA
specifiers. Its value, 9, matches the GENI serial engine firmware
protocol ID for QSPI.

This lets a QSPI controller reference its TX and RX GPI DMA channels
through the dmas property, using the existing channel specifier format.

Signed-off-by: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
---
 include/dt-bindings/dma/qcom-gpi.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/dma/qcom-gpi.h b/include/dt-bindings/dma/qcom-gpi.h
index ebda2a37f52a..68fc1414af55 100644
--- a/include/dt-bindings/dma/qcom-gpi.h
+++ b/include/dt-bindings/dma/qcom-gpi.h
@@ -7,5 +7,6 @@
 #define QCOM_GPI_SPI		1
 #define QCOM_GPI_UART		2
 #define QCOM_GPI_I2C		3
+#define QCOM_GPI_QSPI		9
 
 #endif /* __DT_BINDINGS_DMA_QCOM_GPI_H__ */

-- 
2.34.1

