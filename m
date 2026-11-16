Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794806885;
	b=RPnJd/NKNhqDO0sifYQnEc8xLVdZrWogKgAXvZlXBJ5opLLHKrdmwY0v8IfFiHwP5leF
	 XmtGq3Vo4Dv0MwHgYDub6QitO41GP4WOx1XH3ysorf+NTuY2nB746t6b+3lisrH+iHibm
	 brIh99OCEXSqRTFRdwHflQZnIRqN+F88/Ym4ldYT68akb+1ZWVtApdSr7Bp/8HnT56xAc
	 SYs3PBPOtIvnPdwz+Mhj3yxvgiWcD9GSvBrT7n6dXEJIoC6Lx3lbmrk7xBIpw7xtPRS+X
	 4EDYAr32l27RE+UM7Y5JCliBUuqLhFqMKf8NQ8sMltlKhO4KIiOiPFoEDKtaoj6x3lA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794806885;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ODAc/WUdkN8owaR4LW8+eF4ErfhvSrgEn9CVJETyrww=;
	b=UJ+wZ9Bk7zZmgW3GVXzl2C0RD9JoxAhL0JH1SksMxQXZMbpWZUKWSR2mmWFWtBy3G83k
	 WbOtDCp7ptrG7Nl81R8p2KQSeoMWvmyfEgttA+l+uP8dBERglvg6MGjzClQek7HLP/Sxp
	 E6UNvhP+8JrG32fAdUgZwAoSKsnVlJ5XVBYEem3hzpAMI8UldHYf+5oHQqQP35gMf7pAO
	 bYMZq9DB7yr4X78RP43ONaqDkd4srbfHZQgDxWQbhwcfygCp528AKq9Y+h9bSO/MYcVwq
	 iDwuz79p0lRpAev/vLWfmUwz1UB3EWQfsG6aXyzTLXJePh+5NQtRBCO0fBnSMjvotAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lgU9aBCv;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hOdD+iUM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39A2606A329
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 05:28:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C39A2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lgU9aBCv;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hOdD+iUM
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AG5Ljae112220
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 05:28:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ODAc/WUdkN8owaR4LW8+eF4ErfhvSrgEn9CVJETyrww=; b=lgU9aBCvep5OTeVe
	CKIG9Qa2yYKfBBe6Ts1PyuGw14n77riQ7lCDrD1eYJ5fQwqLHrW2j86B6Y2xTAsV
	FvzmOe1GjOkj8EsaqGsz82cXrwudtRbeZCfIJT4W2JtJpx6FIE9jJ6/+kYClK7Lz
	Ka7Ded0TIOEqxgm/74+ZDAmtKTCz+tCiiRzMQiEsUgt3OnEav4mskhgaPZOXzC5g
	PGEzn/s0RupRidNHOeM5l/zHUCFUMR12rmNxclmsgDhbuq3zHl9SgiDYhUC0RQpW
	1sv7g1NghGArc21pNHK0kuviRsOVzBVltWLykeh9wKIfDh9ckV8EtB7OaWmGlFeL
	odKuMA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhkwcu3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 05:28:04 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ed05900df7so8393875ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 15 Nov 2026 21:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794806884; x=1795411684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ODAc/WUdkN8owaR4LW8+eF4ErfhvSrgEn9CVJETyrww=;
        b=hOdD+iUMZ272ZRQVb9MEKVS32yfNVni9+wSm7zO6duL2SH0AcsE4Pj+/NK4xmd8qj8
         6YYKetwAoZFc+Lzh7xB3/yc/uPJWjmzkkZTtJp5+yAXb4lfc3cx8NBC+4LY4RfwAxIr4
         qI3V5vZ5hkXdaZYRg/tktbY0PNTzUuoyV66liJd0k0mi31iYdHSZdgyU1Rqm0DnAlHjH
         ykYVKnWrnLKH9yQOZSpBSOHvf2DOqpOcOERYaTJELPYiw70m5mRYogHa1WD/1Fu4DzLY
         +Twsp5Y78hSJVxikMnqrSYABu7yYTsymvVcyIHoDqjCWn7uP7Awudjmxgxy4GKhnAaJK
         +5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794806884; x=1795411684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ODAc/WUdkN8owaR4LW8+eF4ErfhvSrgEn9CVJETyrww=;
        b=ngyPhLOnC/8PTVoCI7m+hIcAo4OZNZuEnBavOrfEYoDVaRWsc1pA+p9u5Vm0JD/s6D
         1h4NrYRZLN1+uyIJMw8ko2760L4sv/5nshFUkNGm9b5tcw1u4wRwrRXW9G686Iu20D0W
         DoC5YYtV2OzP4h4IwmJ5KAT+kMae7QbwRhVkOFIJqwH8OUE+ZyS7k3xnFwoH+oE6s67u
         AQG8XYLNkPE2rE9xTEYmv6nUj5GXRJgNzIsFfVRIeqw/7Sx5RcSv/ojfVpg8I4Ed23Xm
         CfxN1q0uxcMZkQKhQQvXV/srzWaN5QvdYuCjNqBCq771D6+0gQgHC0EaxRtk5IIAE6XE
         MsOw==
X-Forwarded-Encrypted: i=1; AL+hErGCL/soYcEoVLyHFliU7OjuU8+B4cpo9UOCVSDOvvrvM5KQ7QLIkVBhXV9X6WLNEKgi6n7AweMWePJbHZEh@vger.kernel.org
X-Gm-Message-State: APuU4Z9+PHbZ7lYD1hcRsN8b5ggQCw8TF0nrJkzuYg1STcEqOyTt/6RZ
	7/VC2obzvK56HXdZ8pVI0H5Rj+vFWRNjulwICVyHg6V3QJJgnx3+2ko7CLYCWvx7LLwJWgcolYs
	gJr2pv5bl8f5YuLmsoptR7cYDD8dQqNBF/k9BV119Mz1tjbpXeZpPuKBpSXseEeM8GTM2
X-Gm-Gg: AYBFou3BngAdS0GNoiVzoX053uHJ2yyfef6DGilh+7d65Zrul+KZjeQPTtlS2Fw+jJq
	2mwKdM2ialudsRXg2QTRh/jqY/kEq2QWSM4+FuvOJE9dl3fI49QEvyej/kVIuWrg8btPRF3v6MP
	4I4bTPNtYGyfQvO9McndTnW7DquLMm5xJpL8OyWrDymtPxXpgxXKx0KDAJCQhfOb8mUguM1aEJL
	eCB/eTdI3orlF08mBM5h9qqBrKG/YmU3GOSM/ss1BVTLsY+qXH++2K2UKrfox6KAA9vqG55L/QE
	J6+Pbmrm4vt3Gky3fXfKa7I39HpFKtBBz2aZwonYbNggoOTRFtdPiHjjO//Ssj0p6oNr1IyW6Z0
	pfiNDTeEbfYwN6iSBuTfCzYOxdV8x2+V07qlK2KQd2ZJJgUdb1LXcDhfHSBJrPv28vNcC2VQHWA
	==
X-Received: by 2002:a17:903:3c68:b0:2e9:53c2:760 with SMTP id d9443c01a7336-2ee0dadc2ffmr101068665ad.30.1794806883658;
        Sun, 15 Nov 2026 21:28:03 -0800 (PST)
X-Received: by 2002:a17:903:3c68:b0:2e9:53c2:760 with SMTP id d9443c01a7336-2ee0dadc2ffmr101068535ad.30.1794806883260;
        Sun, 15 Nov 2026 21:28:03 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f4ad519sm31478885ad.2.2026.11.15.21.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 21:28:02 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 10:57:44 +0530
Subject: [PATCH 1/2] dt-bindings: clock: qcom: add Shikra PWM XO512 source
 clock
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
Message-Id: <20261116-pwm_clocks_shikra-v1-1-55fc11501821@oss.qualcomm.com>
References: <20261116-pwm_clocks_shikra-v1-0-55fc11501821@oss.qualcomm.com>
In-Reply-To: <20261116-pwm_clocks_shikra-v1-0-55fc11501821@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDAyMSBTYWx0ZWRfX9vTB4gLT+8zL
 eYH86r31XAYCjieiLvKQ4luTOGmTgP43Tv1og4atBTnsRIKIhlVsPFl0MUdEVzWou4oylD1cveq
 ysBBL87sRefPFIov/DzU1xrNzuKrOUGr8QUhebu9VKIOgLOyGaqSNmcQFCbpdW1C7vtxa053Ahw
 rvAiiVtHy5rYp/ogsuq0jyBlK3l3zbmmRLzJlX/CpM0uNH1+sRyZLIe5U2gDAcB1y7UbSti+EqA
 pmWPGyoFCulb9BQ71m0rkBa9HF6Dh96uHDSf5x4tEqAXcXcXENv88CvV5BDC6JXhrilF6kOUPPA
 u99Ez3S6+nFh4wiam8nhxYLseI2qCYJ3j6EiVpsKjjYRpS42izbyrLoJFHDpa8C0QJDgWFHLIZq
 4hxOPw4ZYwwHbUB8oVYGPP0UkNm8sBK24FZat0yqq/p8v2FETJNdApuMOGrlTF1fUvyGx/m+3XE
 bg2nn1eHTcHEwHjxdog==
X-Authority-Analysis: v=2.4 cv=YPYKWhGx c=1 sm=1 tr=0 ts=6afa9464 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=4k7nqb-1yaoPLSLXa1YA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: bhIrqH4q2aLw6pY-mQBfAyVnPUYvUlWF
X-Proofpoint-ORIG-GUID: bhIrqH4q2aLw6pY-mQBfAyVnPUYvUlWF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDAyMSBTYWx0ZWRfX08M5PZ+6Wp4T
 hXDfdo9yjbYO+bDQRVnkX/XskUy5UuONAxs3yOKEbRiM2Nvmel14HZiff6YBMDb461PoCTvw2w/
 Ev1g5mO5IbIGm/A1omYDdRsoFPzqq1s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160021

Export the GCC PWM XO512 source clock ID so the Shikra PWM controller
can describe and configure its complete clock path.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,shikra-gcc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/qcom,shikra-gcc.h b/include/dt-bindings/clock/qcom,shikra-gcc.h
index 656c959c7e1251ed9af8fd04285fe616dfe9ecdc..b86f122e7a9ba0d10c84aac954626eb9caaf0788 100644
--- a/include/dt-bindings/clock/qcom,shikra-gcc.h
+++ b/include/dt-bindings/clock/qcom,shikra-gcc.h
@@ -222,6 +222,7 @@
 #define GCC_VIDEO_VENUS_CLK_SRC					212
 #define GCC_VIDEO_VENUS_CTL_CLK					213
 #define GCC_VIDEO_XO_CLK					214
+#define GCC_PWM0_XO512_CLK_SRC					215
 
 /* GCC power domains */
 #define GCC_CAMSS_TOP_GDSC					0

-- 
2.34.1

