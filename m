Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454217;
	b=njqhvFpAf/wz5UJ9JIbE5CYF23uqLi3CxEjaZ2QkoYSHm70QpfORUWuetgvMw7VV/cDA
	 EYwJ8EiKwQde/OAKkK1/mpyWZvcpGuZPpGLgSDEloh2RmiZrHWxAeAh8FVAxdkPpFAb/u
	 S665QhlUgkHRMscMXS/q2lEwLkYExb1FKmdtyC8suDAH73oBTCqef/nC1PHAHpQAj34SO
	 DMqMM/w3mcdtiNVc8GbXNV4LkLyrs5rR3A5D1ono7MLea9r75EPayndhhmC11HtopOR4p
	 /j1EEa6maABJVG+X7LtzRep56AgAtYljUGx2mtvm0w/GS64qG0GmgIyB983F2UCob0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454217;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8w9TqA+d7eLPnWNB5c/fpf04V+L7eVMyAMcjLo2ncbM=;
	b=THTUux44ASs1X+3T+n4tFkQfCXCyZA8QsJywMqRBG9GB0amKnL56WvMrdN9vbA9dCpzf
	 C4xBCOoPeCPA0PcWD5sfLIgRrUa1HB3NTZDC1Gr6tRmOKgQTZNRarqXFPLo8g+DMgIa1M
	 FMDtvLvEoeyqebbGyHciFlQkJDHffo/IW9Lpz1GX5eYjKUNSkPFaOJXeZpoa6EQwUyZRq
	 Jk3dlpUVPT1ERoChCzqvN6QKip5mXNN5P75yrBHggy+jnFxOQMWkN9CIckVHsd9blLZkq
	 bSkMCnDQ6pXONj6M8OHFXMkROHW1dvWGs/L35YRf1D6VmSh6ltvEcs5e2udNI/NwDsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q1UZspcA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Htg1kg/9";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40515606A6B8
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 17:16:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40515606A6B8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q1UZspcA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Htg1kg/9
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGH3D82844523
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 17:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8w9TqA+d7eLPnWNB5c/fpf04V+L7eVMyAMcjLo2ncbM=; b=Q1UZspcArDdeTUrb
	fhS9bbV/smsZy07uxfcgo5RgdDFDMhLin8FCeQY3b3uO1aXMyY8VvQH5u3A4fTIC
	dol2hRGsRD2UlfuZZJENUMNz3D/cPD3YRgXsqy9/fdEsUPPo7c8cEvLvXygdGHKl
	d9PYwFmXZcL6j5gj6vMDmaNJanE4yzfhMMOEW65ULlNvnoFDBirOMWX2EzEvFWs6
	6kLMzPQPajentGBrUDZNwhKqJ3WRIwkNCWXoVDVJoE+ygAg9SMxId8PkDzcpaONh
	C+9LCROVRKFVLPzIAtjAfenLgMzRLin6ESDkNGIuBrj0s1v/wQPH+aWAn4bbPuU/
	nDJtwg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1k2j5e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 17:16:56 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eaad8219b0so1230822e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 09:16:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795454215; x=1796059015; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8w9TqA+d7eLPnWNB5c/fpf04V+L7eVMyAMcjLo2ncbM=;
        b=Htg1kg/98zLV3Guz7jIs8+QV27FCJIVAom4Sbr6FuOmku+qo9V7p9SZ806Vay9pdJ3
         aoEDxTP9Q1R5YFx9yWVrSinhvyo6+NzpkQZeSUPFV2z20Te1GUFpGrgG6nP5Ub+GX5Dl
         vf47xXiIpb7lmNR9FdYaBDgZucoKP3R3FFZKhyZET/W3h8YYp8bHyskk+0XuL+in80Ds
         R+/2XO+DQBmFQ2WWEPkWYC1MZkEOaIm4iePg/tO/gyVIvYJjjuIhalJMos/P2oZvotFk
         Hk2oiCRZkrTovkLs78iGaiVLcHd7q7w59Ss8IHRewog3OQpxrSUlcyU//eDjZfYDWigd
         2rxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454215; x=1796059015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8w9TqA+d7eLPnWNB5c/fpf04V+L7eVMyAMcjLo2ncbM=;
        b=drmIu9ZhuZyOPSnVAdn+NfaXt/Oj6ox/kNLDCwVcssKwWHnFF7w24SP4mLWfVXzx2Q
         qLGLf7tswYyJfpQ1R1jX+Xi0ctWmDZfYXn9mwjetFQgk+CMUudrpjcYalYGhOlNykK4n
         ayZ9HA++skncDc6zUZzmy21d93HR06YvnNh5uPB/gbJtRcKHx4XWiWTkfxkJ5qahEy0p
         +UUzKK4mh0AMTP5nhFZhIZAdIXccdFkgluB3HhLlpARn3ihW9Xju8UxgEHOQ1LL4TAkZ
         bmVdv++XlPNW/YYAa9zjwPMV/l4jKL5SCTgW9kCHFxh0U1vaPdpcUCiWBjJqpTxidJpF
         P5aQ==
X-Forwarded-Encrypted: i=1; AL+hErFLKu561+aQJNqzZh+BJvIIWMdoyO8O5uU+Kf9wNA3FqyCapC74e6xNSCRqQd03kBhMHvs5qNAwe+IoyhK1@vger.kernel.org
X-Gm-Message-State: APuU4Z9K19q7is4l3sLnqybc2EoM8H0jvxjxT44UQAFFS1H6Vw6+9qYQ
	SeZSHloGt68SjRmu6k3OIbiL0+vgxXwcgfECAG5BjNJg6+Hq3nHPkTRj7p8l49Dic6W0I32NZQw
	luZ+WiMB3Deb687w/DodLnDV7S7Rq6WD5/cv0AYg60T7mVp20XUb5Ifz4rr6Vbqbt7s/3+ftTaT
	K6LWg=
X-Gm-Gg: AZFdTZcZNQHjAeKna7NtOAbYn6AMAH/nGEvtfziBPV+MqfI+iH9oyMzcKoVrUJDPoy4
	RBck8aDRQ/8m43PJk4RHUcO355A3s2pumaJMXuCgN/sAHpK4oxH2p22HQoJLV9MbSjT5On9eOL9
	cT6ZxyzIAZSBmCOepMp586Fgkt+eeMHnxjUhEB3RbFVxC6dGqdbjaUFeA4FXGHyHW1e/sQ5QXoX
	2+zFwSgIrB9E7tgRYTZxovS5H4J2Ra8haWcjOFCcVe6Uy/1KuCpu4uJ78tjS5+Yhk3QLzU5HHUK
	DZUNDLsW4/zA3cWz3oXoSaDUsrsKGlVnmbSMIi4IO1yC4hR7irjCEqe1QFDLMnqxzqJ3/5Dqpye
	NuiXxLoKmzRgWQY6fkNKxt2exNaIUw8WR5NccCVRa5xuR7gKIOUvvpx2958KVE30I86BJc3EBXI
	tyo91r8GczEFYcs7VdAHeiWE34XkyNtu5dIi/T/VfSlATgwuB60U9pUZ30Peuyy0pwSkRZmoZAQ
	C/SkjtxkPG8CwaX3Rh5rsSx9dAm
X-Received: by 2002:a05:6122:21a5:b0:5db:4749:1737 with SMTP id 71dfb90a1353d-5ee8aea74aamr6082451e0c.4.1795454215427;
        Mon, 23 Nov 2026 09:16:55 -0800 (PST)
X-Received: by 2002:a05:6122:21a5:b0:5db:4749:1737 with SMTP id 71dfb90a1353d-5ee8aea74aamr6082167e0c.4.1795454214663;
        Mon, 23 Nov 2026 09:16:54 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066e34esm205168235e9.3.2026.11.23.09.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:16:53 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 18:16:50 +0100
Subject: [PATCH 4/6] media: camss: Define timestamp registers for csid-gen2
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
Message-Id: <20261123-camss-hw-ts-v1-4-7b62dda6d7a9@oss.qualcomm.com>
References: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
In-Reply-To: <20261123-camss-hw-ts-v1-0-7b62dda6d7a9@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfX4JM9AKrMafVj
 bGYCrQ7Z4+7EPopYn3VLupiYWf+5UXutAT4N82vDhdjhoWiVeIFzH54hH4IqWiiPU8KOW6gb0tr
 m61ySZfj/M8hdTQmCIS8qUCaYjA5rbE=
X-Proofpoint-GUID: GUuwUfpkni9597E4MzKYE_OOy4eo5yKm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2OCBTYWx0ZWRfXywlRgXtTr9Lu
 NMw4VxwAI4nv2n8JmxJpsRrYYuVPtSvpoSCqAFPT+jCQ2rB9NgP9UMYrIggiWK2uz/7pBrudziN
 ak8m63QW9DjtmDm7WzeiaOQXJj/SZ7m412d6cY1PNmP9P0PI0AeChYKMNDDQSFLSkVAis/DqrMd
 WCB7CffUaBwHCYfpKsXZLNni8Z9f3m7tvAcz3Ug3J+snmB18/7zcouR+RypKG7w5Oetkerj40TA
 A4nB6mJRIGTwlhD5BTo+YIOcWexAeRrLS8YySj73E8vyPMKYChF2uoXSW1D8B9gCn2qe5njVup5
 LnajsUAtRWcwuwFD/GXx3FmPTQ7bnS1dHo+wPqcezT2YWnB09uc5gWaSbczqqyjyP8M0lCPwIOT
 nJi2/PzwFgzKl1hvJNyw0b7BjfcfzkrzJFZA5jaKDYRAP3TnrSr0cITrjzsci9lreFeFDsvpeAe
 Rp8JRIyrN1H8xIlWeng==
X-Proofpoint-ORIG-GUID: GUuwUfpkni9597E4MzKYE_OOy4eo5yKm
X-Authority-Analysis: v=2.4 cv=cpIOAF4i c=1 sm=1 tr=0 ts=6b047508 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=3Wk6MWIrbtHnLGL1blMA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230068

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Timestamp registers inside of the CSID block are available at different
offsets from the CSID base depending on whether the CSID is lite or not.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid-gen2.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
index 72f329c2bb1ddeec96f33c21198104157c14a73c..ac085ede704653a532aa1ab77b2845471d1e6900 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
@@ -121,6 +121,22 @@
 							+ 0x100 * (rdi))
 #define CSID_RDI_RPP_LINE_DROP_PERIOD(rdi)		((csid_is_lite(csid) ? 0x230 : 0x330)\
 							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_CURR0_SOF(rdi)		((csid_is_lite(csid) ? 0x290 : 0x390)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_CURR1_SOF(rdi)		((csid_is_lite(csid) ? 0x294 : 0x394)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_PREV0_SOF(rdi)		((csid_is_lite(csid) ? 0x298 : 0x398)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_PREV1_SOF(rdi)		((csid_is_lite(csid) ? 0x29C : 0x39C)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_CURR0_EOF(rdi)		((csid_is_lite(csid) ? 0x2A0 : 0x3A0)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_CURR1_EOF(rdi)		((csid_is_lite(csid) ? 0x2A4 : 0x3A4)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_PREV0_EOF(rdi)		((csid_is_lite(csid) ? 0x2A8 : 0x3A8)\
+							+ 0x100 * (rdi))
+#define CSID_RDI_TIMESTAMP_PREV1_EOF(rdi)		((csid_is_lite(csid) ? 0x2AC : 0x3AC)\
+							+ 0x100 * (rdi))
 
 #define CSID_TPG_CTRL		0x600
 #define		TPG_CTRL_TEST_EN		0

-- 
2.34.1

