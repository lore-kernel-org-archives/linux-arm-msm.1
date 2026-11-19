Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107880;
	b=QdG0w1HeabOT2ktoWoTgBQyzQm7CQ7qdLECNpUkIlD7Wu8oh65468Ox4wg8MUP6a3wed
	 74UQUaY6novlGdmnxEitwitYHFsjD//gBB483+dwLumcisqkk6at9UHfU9hcBojo8fgwi
	 16iwoLutXd3ql+ncC3Zza4lRHBzlBBVJJtP5wn2c5ya/bcScrr8p5TAiy8W3ZEPhMMstS
	 KcqCjIRtNVb57pOS63SgNJe/uUPkRCO3+g+W2rkNQ2/E6L5hz5xlP1q1xrylE93jwDJe8
	 M3biRZebZ0ps8tr89XFI0fG/WewnfK55W01RlDvHWwLix49KILdXPPePCsR6p1P9IDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107880;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vZlrpoS/2jIPAVpXAiTcVzl4it8q3cUnRLFIJfhVr44=;
	b=dYLZUFD4II+5YF9on1TiCpBXR2XaFlk1ijMwtFrq7kp8ecUqs8IOlhJfWaU+YjnXgp+D
	 qQqzJbFeT1udCdJsAJ+R1rrFDRHM+IrhVMioKqbPQQMC7kIPSe55aoN8mMOc2+Yt3Ktxv
	 HlIPBn9OIKDBfPa+cG61O1KUs71+sXmZDHfno/iZE+PZpjkNq8q7Oc17II6XHUdtjZw9S
	 29WmqlNnzeHrYvlhD1FkrW7OLca9/wmW92zO0N8+G1KC+MDVoH+/4qeK2tTByuoZSzsvF
	 WqV9XkNG732QvYZG5GWNi88cUi3/ZRZzY3Ap51GZW9/DVxzzfjAIjJtp6vxTX2bCOJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aTuNbBZE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yiz70M6S;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9628606A339
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 17:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9628606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aTuNbBZE;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yiz70M6S
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJGrkFa1385633
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 17:04:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vZlrpoS/2jIPAVpXAiTcVzl4it8q3cUnRLFIJfhVr44=; b=aTuNbBZEAbYXOG8b
	C/Yu31pC4/QFAvBtjK41LgXmCvjHAk1DGATDoLuLeKK9icPJdxDjdl/E7uMKyHfl
	0tl99Dj2PZJM4pX/0abi37EHW7xf72AN0hDDF3h4WdF93sEhnQ9vJZI2ZKvFera4
	PVWj9ImhEKOOx7vTiTyeCTwSYZkUXQ0C0qJesmbnH0+U7CzPnpabwRg8eOpos8jd
	LBbalkSNgXkRIfS1oVw40d02Ao24rS8Y57sztkPZtXwW3LgxKbzvtR5Ij+AhHHVN
	G7bOgmGQNKndT30PvQNdrX39Yk8M6L6Wp+g++rdMrn6a+xR2W8QqZxRR9nz6cnKB
	4s3XCg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1x70a3qp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 17:04:38 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8b69d1f2a18so957936b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 09:04:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795107878; x=1795712678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vZlrpoS/2jIPAVpXAiTcVzl4it8q3cUnRLFIJfhVr44=;
        b=Yiz70M6SJG9zSa6cHlv/oif7aWaCrSBeMqWVJlXXgrkwc8UYuBPrmkvvvjF1ocXaHE
         mvahlVdbywMDArLq6d8waobM58IStAZPSZPrQ7ZoQAfK2nNrXCbVo8d0yt2irEoTtl2d
         OK49XhNUctUB+FkmKPH4bv7OlFo6W0TLqg2/ybquBnc1kvD8Mcf27tpnpNA66pTqcjUu
         r2ihQzG+Qa+eGOqIP63EfMfQYCYZ+O5sib4i8Nm1GowS/mqi5yjnzGh5pTDX3SNWztQu
         U7bImwaxY1Pr37VxwSPhjRwQHwt+rv6OrFmq6qXte2G9LtO7myBvgC/heDc1QzOW95Xm
         49Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107878; x=1795712678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vZlrpoS/2jIPAVpXAiTcVzl4it8q3cUnRLFIJfhVr44=;
        b=xUGuBSkMfGGgr5O+z0du5DyhtBJrh6cLJH2UFjLuXkAe7CJyCcjJ6oFsHwc+XxCJ+/
         O4vGlRjNPY6nB+Lar7iDfij1vLYn8TaFXxukCE4Olk1wzaxYrlJ97BbW7qkvxfNBmija
         BmZEd4RgRxTtVzZNgzyXZUI8X2vSsZ990RfDXGYIeybc+DllqejbJDdap20mRpBJwyHH
         IcXrRCczQPtU0psyBW4xeNO+bQRqEabuxI+/oOkP50jeSj8pJG/PW6gc39vKzK86tiZo
         ItwkpBIrbXWe2r2VFk0CBu5iTDx1r527hGW0a9Lor6atYPGp/sB1KZov/bQiL4CdYu/p
         Okow==
X-Forwarded-Encrypted: i=1; AL+hErGGbLyYiBaFSbl9xcx31LRZsK/3880YCwZ5Rb7l6G6yufOfmc70qnR7/lZWaMR/57gJLUKb0sHfaA8gKhkh@vger.kernel.org
X-Gm-Message-State: APuU4Z/ivYPvtFMH8yyx+/iN6ZGOwmNyV+eQmtHH6vh9E8r45RELqDBM
	xI0lHYUc1rDsxHnc1EnvSQlQbmZmA7FWvb6LRmJ3sRIuQ3MwgH20sj8YHBpYt3XArUFSpikE0DZ
	7jgFgoemAz9ldowojq2wNhcE/x6egY47+O2kH4RSATHIWfnztGGNUabvP/rBqoIYf/3pP
X-Gm-Gg: AYBFou0mCrJYvO9AS4TzWA8Z9y7zg4oBj5XREtkAo9xMSpTutsVhrA/ADdaL0/bhIiq
	U14AhbHa1qsp/cUVyeNioub4YKMfh4ddo5tC14emIt6reIsaSK8C8UI3RsCxatmDMbzhs+T6Sjs
	OzuyViP5POcjelvLNkUplhw/99ySk1CP21fvIQeRm7oZJc8F93sCTVM2FBlRxlHia/mLr+32X1F
	RGT1n4CuI1eQspVQnVBd4cZh5KrsbuLNAn58C6TMZmNILw1vItkpIwfttmfSybwoeCqpeqhFvqQ
	0lWIOviGowjIFslBwUM3pYjTDxIc+zNRW+vf3T1IJV2jHUoSq4fL87ZMRAE8pQCz3fkmsbNbD45
	9AuV7ooeQwLFU+bBHEyk0ZUPWj8gMt0jkGF9FwKMD1gyHS+sjQzVtqd4Gp9VnA+mBwmliIrrG/w
	==
X-Received: by 2002:a05:6a00:2eaa:b0:8b9:7b94:19bd with SMTP id d2e1a72fcca58-8c7dd3072a6mr1299152b3a.13.1795107877583;
        Thu, 19 Nov 2026 09:04:37 -0800 (PST)
X-Received: by 2002:a05:6a00:2eaa:b0:8b9:7b94:19bd with SMTP id d2e1a72fcca58-8c7dd3072a6mr1299117b3a.13.1795107877077;
        Thu, 19 Nov 2026 09:04:37 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4af1fsm206335b3a.28.2026.11.19.09.04.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 09:04:36 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 22:34:20 +0530
Subject: [PATCH v2 1/2] dt-bindings: clock: qcom: Add I2C and TSC clocks
 for Nord
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
Message-Id: <20261119-gcc_i2c_tsc_support-v2-1-dcb91a0b0013@oss.qualcomm.com>
References: <20261119-gcc_i2c_tsc_support-v2-0-dcb91a0b0013@oss.qualcomm.com>
In-Reply-To: <20261119-gcc_i2c_tsc_support-v2-0-dcb91a0b0013@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: sohTyHVThyynzcNc7Or47VBuL4vH5AGF
X-Authority-Analysis: v=2.4 cv=RdgFmFtv c=1 sm=1 tr=0 ts=6aff2c26 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=OfrIayanZ0Hpx6dNCfcA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA2NyBTYWx0ZWRfX0JG3VC7L5XC3
 quZ4IYJoBvfFdo2woUzHAhmTgS01WWvNu42ingKawPIpiozi1fdAEWfImFn7mRtDXmNt2cT584A
 GlKdks7YzdhELADYuNm0GgqmYI5qG6U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA2NyBTYWx0ZWRfX7an7GeIJ+z4F
 Eu3u5ihXBVMK+Ss5qj4w5KwgiHAKbZ4311oMd6NvZ+ovgGrzLM95Ly4X6/ob+65uS3gUmfCk1Ex
 wQBS+2wuEBYV0/aD7N1q4N50umZKK4Ukc8RlmjsPnHtsbQiaKKoTXNSsIIybtsI0u8eUffTKP4G
 8nQERK0tAXoJf39b2h20uaHKIdMuMI0tjlAj30JWpOEJaKcMpifIeZKRcEgAw3X2sxQ57i913/w
 XcpKps0xg4Pon00/LU2bH73GjE+czRtVSVa6oy0fBWBJMcD7xesuWftOaManJ7PT0Tf66HZUO11
 WSVhS6zhaKAJB7eNIaTi+juDhZFgfQtATYZPVMWBVOtGcA69t5v2oL55+W7LGJnrXiEUhNbpllR
 56aTEth4HWAwndCKUTKLiyfsAXGy1t9XJR0Jl5TwfivNWb57Y7UcM2tF0P+S8PKfRcDzYa+YS49
 f7cOUGvlm25fijQqTKA==
X-Proofpoint-GUID: sohTyHVThyynzcNc7Or47VBuL4vH5AGF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190067

Expose the I2C slave and TSC subsystem clock and reset IDs used by
Nord SE GCC in device trees.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,nord-segcc.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,nord-segcc.h b/include/dt-bindings/clock/qcom,nord-segcc.h
index de4539b999850294926854a45db2997043c74f2c..f8d6963f226f151d8cd49aba9ab98f9972f8cd64 100644
--- a/include/dt-bindings/clock/qcom,nord-segcc.h
+++ b/include/dt-bindings/clock/qcom,nord-segcc.h
@@ -86,6 +86,13 @@
 #define SE_GCC_QUPV3_WRAP1_S_AHB_CLK				76
 #define SE_GCC_EMAC0_CNOC_APB_CLK				77
 #define SE_GCC_EMAC1_CNOC_APB_CLK				78
+#define SE_GCC_I2C_SLAVE_AHB_CLK				79
+#define SE_GCC_I2C_SLAVE_XO_CLK					80
+#define SE_GCC_GPLL1						81
+#define SE_GCC_TSCSS_AHB_CLK					82
+#define SE_GCC_TSCSS_CLK_SRC					83
+#define SE_GCC_TSCSS_CNTR_CLK					84
+#define SE_GCC_TSCSS_ETU_CLK					85
 
 /* SE_GCC power domains */
 #define SE_GCC_EMAC0_GDSC					0
@@ -96,5 +103,7 @@
 #define SE_GCC_EMAC1_BCR					1
 #define SE_GCC_QUPV3_WRAPPER_0_BCR				2
 #define SE_GCC_QUPV3_WRAPPER_1_BCR				3
+#define SE_GCC_I2C_BCR						4
+#define SE_GCC_TSCSS_BCR					5
 
 #endif

-- 
2.34.1

