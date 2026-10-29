Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793298847;
	b=Bed2y8bAEZTctx6nBSf+Dsnz4hprlO1GLYND+41yIVoLXx92y0fLj92XM4SaZqJF9oqj
	 DHxbR8h2JJHJvXb9tXkuDz7mzirkn7uED+WbUqMXjpz2fDNMRZ0ZmTlcZzdtSiU5CwKy9
	 qJso/GLNlFyqQBNXLK73igCkp5bnDxwWOb9sdm8yQaq44nO3b0l9eDGeKfaSF6A4+T5p6
	 V5uyTvTGnPHrn8H9hOVXSOBimF1zwLzADZbotiDKnYYVcI+K19HT1nNm9Qmn/oBnXLFHo
	 88zciF2QhTlnH4/1kRMv7XjdHUJC0VSh5C1h/VRdyzYQiAYUeSwsjNeqC1NWPCKFF1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793298847;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Z+aDws7OJDKq+f4+h02DRvXLUpx0YCtn3FsfNdtqNoc=;
	b=XuySb9n8YRb9vmUfstM8ffJT5zxIVqDxQy+3gfA2U89w9I+NfFULnVZU+Lr1dsFw9WlB
	 tegW50cXGkim/Pr5f9RDah1Lmhq1DRltbiSnJu3QhgzrzJMLJGQCI84t6k605uA743H7F
	 Ai8P74eV61cABQyJFt8lWoTL0m6TmkH4JcfwXNANqdXgbhJEnDG6XwRhfAiDWR/2MBA6n
	 Z6GndhEf5abEl+JO1xT4CIta24uBql6gSxUrWYX61qd5/BRL7DlGVX8Bt+boHdpfduM2V
	 oUl8xhjXmcJ5dChiDaqzoUfbvLDgZ3IsvmvRTbXxR1Kg+GWLc8ZQikCji91Br7UVB5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="K/1UWcCZ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OTYW69R7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E73606A327
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 18:34:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48E73606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K/1UWcCZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OTYW69R7
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGD0to3872950
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 18:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z+aDws7OJDKq+f4+h02DRvXLUpx0YCtn3FsfNdtqNoc=; b=K/1UWcCZpNbhyzNN
	WbtJu/7bS5iTGmfyIl+XdgXFcxcZaSq77pY/Z9jqUqPtArOotHCHroW7SKalFhX9
	rDj4WrQXIlvnAwa3VXV18HpaaWcOfLr4ZAEw2sxnjjrMBtnrmbuBLZvSU5TkzBWY
	RV0f0JNssbuzy0qayYMo2cLG9WHONvjfjKmE4aOfizipis6e++C4WMCESwE1Do47
	v86gIckMySnK6gwOl8cEodnNkSLG5r2jJyTtBgh0Rq6ytQUmwGZIn7AJJKYqJWST
	4jQmhCLZhsEsNMsXVjfcxUmDjBgoH1OVCCdrUNWvk4WSqXbSOYOkdDP3mPasJBlM
	nZZliw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm7621hdk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 18:34:06 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35c5aef2a74so7846351eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 11:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793298846; x=1793903646; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z+aDws7OJDKq+f4+h02DRvXLUpx0YCtn3FsfNdtqNoc=;
        b=OTYW69R75hy1zUMEtOG9ELYw47s2HvYNUiIXVsDAj8p6ruZt9WFdddUwnN8HNw+4YC
         3wg3uFmSzLFtWvwnjMEOvTV+/RH2zcCYlDThHeSU7iAIGN1LVA2lZlLGRfOhj41LvHdT
         IO4WgOiULzpmRfMp1bNazf3SxKdC/bper5VqTQHsMbL04gsT1Mzma+31cZEXiNoN3tTV
         XJrVxBb3mmnQ7BeIRK8bw3XLO/pZi2Vi4LzqXpdR5cBx9LjZBKjlSVaXsOgjry61y+kd
         Tb4hNhVpH/qFBY74KShCYfREfhHVDbwe0GGcG7vsJ2C6diIb0UynQkoirYmoz6YTfZt6
         0shg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793298846; x=1793903646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z+aDws7OJDKq+f4+h02DRvXLUpx0YCtn3FsfNdtqNoc=;
        b=D/WkeC0VY4RRwUHlMpo9voW0tnHL+mfnsXqUXhTuN/uA67ZFUzt8/pdXgWRNSbKZMG
         kh9Hh1hLJM4qjzUMmJ3oPXs581FnFcJimgqAbmlTjdRtFP43EvHSxuc1N7iyXHGzztE2
         QU27OuufcHMJUu3xYEpbvBXv56VcZ1JC9AlvylldGlqdnuVNcgZUCFEcd1/fGn9kTNcz
         WO/t21Kcnl8nkp3Ca9ol5CKD2SpKW76hfaYt7n8RvDaSRM7rtFSXeDiP1rjFKRrCqu0g
         W8flZfo0lEecnESsCe8gVPJ6BF1wXzBKFrIk1hyEpcAz0Fs6sXfBf8OPdVB3kslGBMQ7
         w0mQ==
X-Gm-Message-State: AFq9FYKicsyiREqdKA7RSkhHFH8iHfYGtu/J2EveGFPuV8Iud2mrsRi8
	tcRW7baASjyJBPiIXzxvhjLlWZVpzX8BV+WnkAHpu4BALYeYwXHe7hCwTs+xG/zrB+v+HAzDl8f
	yW7J57UamFUxV0VOMMvPHSEqpKPqIg4009BofSnRO560/T/vxpnzmBi+0uQo6wjYRjwEn
X-Gm-Gg: AYBFou04P1mN6hhzY3putK9RyuRl+3MRc9rJt3xAhajbThSntK07COfg2KAFafuUJjL
	cvJgQtZlMHeA9RiGTQgEwKJINzrgel1nBUNeKVlxrDqXicm3Bnzl38Zd1C80jsmhS4juXLNyaRC
	OCRi7sp0QTJJnZt14Hx1fHPsbcj2OHf6WElAABNMHDE6d6TYe7kt2C3FI6aCKXqFY4xVigN+0Qb
	GBhW0ulfq3keDc8VCNwyxomDQ0Z2GFPRNiWis7QNn88Ubehfgw8xZQRm2FYqRCJmp4jHnP+S+lm
	6BCQXHo4AZeD5/xCADhkHaMG0uGmVqEnHermxKs4fkMFXAHZpIDpEcCwjgJ/htfh69xQw3Fufja
	yYjjQ47svBo0uw/9ibbaeyDxRbjJUE3mE4Dri/LeuMB6Bx2Wy2oq7zbb6ZX6LT+fd4TZ3sBwOkl
	wHibm79frbwO45xU9PEVSIhKtwV5A6YjQ9xYWXInElBw==
X-Received: by 2002:a05:693c:87d0:20b0:36a:18a:e00f with SMTP id 5a478bee46e88-36a42406487mr293220eec.34.1793298845803;
        Thu, 29 Oct 2026 11:34:05 -0700 (PDT)
X-Received: by 2002:a05:693c:87d0:20b0:36a:18a:e00f with SMTP id 5a478bee46e88-36a42406487mr293142eec.34.1793298844743;
        Thu, 29 Oct 2026 11:34:04 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a504c6sm389458eec.21.2026.10.29.11.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:34:04 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 00:03:40 +0530
Subject: [PATCH 3/6] arm64: dts: qcom: sm8450: Mark USB controller as DMA
 coherent
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
Message-Id: <20261030-usb-dma-coherent-v1-3-3147b8f7aa64@oss.qualcomm.com>
References: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
In-Reply-To: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793298829; l=708;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=DZIC2FMxgoUo+lHizqzlRGkDHZh3jbRVq2fl93zvclc=;
 b=1Ja1rpsjyOWr7a4tpUPPzBUUP1eVslWIM2yGsnNIsK0ixqk8y9GKW4MDvJZMJixdgl0VJkKqk
 TGqPG6CJ7kaCE/8hR1WY6LAtiJbZj71ucUq49R6xJqyzcQOnOiTwsgu
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: GUVD5K2Zg0UdIpgCRtgo4bKB4MTpvmBa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfX11PErHq/Yj+H
 OmbnId0UhxrPcPLaShow+U6oecAokyi5rCJK2kAtCKcGiqPWZSVoRfpF8kmkmiSW27B06w1/YEc
 ZcaCI7mV8cTh0fx+jBnDVUJ6UcuBFkAPYKd1a5/sMpyCtO8KiT3h1nGOqHQ3K6Gu2Pu2JiGkm7o
 1e6gJfoVaeWfzIHDCZbEyM10tusZZftpTA7nkOuYg1cHKk7hNkZ/ED78I6ycdprtDnJ49NhwWVR
 swXNPUcaf6qhjWtKilw0Hvn+1bOonUtzMmXYqXUJCacrnaLscgntAOa7FfJHjrJHu9qwm6DiOay
 M1blNt1Y4KRaaklksYvRF9S5JUi1rYddW46BGdDG6VeL96i6+EujCr4Fgc99EzXulqaRFYsQh2K
 sZa2EBrrAOyORqi+jIciRDSRtXFlY5XhTHd//inTzq0puxKYR3DahxVCXTicxhVLbnoE9RV6icN
 r0Vf0YE37EIBPfgYXqg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfX9hJa7O0nM4sl
 NONi+QQd5XxIqdhVPwQSJsVX2rTW2NgbIqfD4uxOlUBFtqGdl4HT0LvP+29+E78pVCC9nYiBxrA
 fOHKD1n30xPNwCzpaBrmPcVnvAuFUN0=
X-Authority-Analysis: v=2.4 cv=Kv3YSmWN c=1 sm=1 tr=0 ts=6ae3919e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Srwhhb0qkpw3J9eHVkAA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: GUVD5K2Zg0UdIpgCRtgo4bKB4MTpvmBa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290072

The USB controller on SM8450 is DMA coherent. Add property
indicating the same.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 05417cb5c4e5..b611671e292f 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -5489,6 +5489,7 @@ usb_1: usb@a600000 {
 			phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 			phy-names = "usb2-phy", "usb3-phy";
 			usb-role-switch;
+			dma-coherent;
 
 			ports {
 				#address-cells = <1>;

-- 
2.34.1

