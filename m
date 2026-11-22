Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795372963;
	b=4M7wAChcI8yE3MgXEzLefLdwAY4wBpVrgMDChLmrTwzOKZHKMnLpOg9p3AaIdNswhGEi
	 9y+8/EyOnswMokyivVq1wQo6XImeiuOvi4f05rXqan1YqqXw/e2e57kToApzK/yE+odYE
	 4coIZ2Mnz3hRo4FAeuNNSqFpGxS1RMAtoV5OS/lFd3oC5RNnyhI7FjUuySYCJZ6Fe8Tar
	 u4sb8VVPW49VuG0Md4ws8c6hPBYl0xyuHlrfxsOFcxOsRIwF5OzPq8/aB7aHp0hYNsp1U
	 +WOjdJtsmbP8WaJZuD21/2I3sDTF0jR8nDpbp6o9SyU4eJjpdLNYBDNDOeyGZFpK7YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795372963;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=kwivYQBNYMrJzWHFwYjM5RwFY9xg0TLCUyjircrlzqM=;
	b=oGMHj4IpNM5quBVwmlX0P2S+V66TQQNksIMnpBHQ6lI2cOL83j8yU4ne/IEQRRD24lqB
	 +OV0EBHHW0oMT5+GlGbWdKYY73heZLsKW393MSbdC+NenFxjc/US8qvkI+NbxcjsxbrN5
	 +jFA7LL+ILzytfWGjWOIWyJjem1ioJVkSBgiLdCI+Dw8pyXk9QJcL3Yk2bKkz/1CHT89l
	 P2oeklLDLfUjheR8kDtTx+grfLtuaPgSUKkE6pqDGpj3IGgSZcTvfVN/dy4ZmUpP8OVnq
	 1/xz9nQiK6LBpJkJQ3d22wO0mGTUlEbzrpjoZwqft3bALsHUEOdF95cPaJsmMGUj+6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MVqlfr0o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dHyIH4uq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BE8606A331
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 18:42:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81BE8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MVqlfr0o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dHyIH4uq
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGV6pK3986376
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 18:42:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kwivYQBNYMrJzWHFwYjM5RwFY9xg0TLCUyjircrlzqM=; b=MVqlfr0oT4+xkUQp
	YXSsMxXYoUn4w0X3fy1b84sObMFyYFhpQw2Et2LUX75nwX7InOTdR4q4mdLOm9WT
	G69yVUxn49q0mgl/FK8y3lmS6vCC+Bi9Ep1Ma5b6OmaHWlRl6e9HZxhj8bDD5c7z
	Vd5pagggO+5GHTir83up3y64txpck0lUEbp1NcbkXTNZiY+eGWiA4KCHmTs2haNu
	/vyIQbED3lZmTGaiPs3nXgI1Zdkyr+HqPS307BobJOFBVuge5eea7ZU/50FI4m2F
	7uk52f1RrfogbfU8BQYGopx2d9AVsNZFMYMMOlayQMjt4Iq6K7UUpUWabXt9ng34
	C1DhIg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33cu40wv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 18:42:41 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-38531c1a566so6990507eec.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 10:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795372961; x=1795977761; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kwivYQBNYMrJzWHFwYjM5RwFY9xg0TLCUyjircrlzqM=;
        b=dHyIH4uqJPNMYCola4zsa50Wlv6GLiakVxE0Bg4Vr0CXt+UqyJV1bGKeLtJpyxN7+a
         bWoUGtPBV+CgZIvur7ykG5JSuaaTkYNiOilp0kVyVLPbnPLqWT1HT7VcudH8YYE0JYgs
         cpdqoGJgJEBjXRZ0uqpcGhXw14NqSOCJ5XLYOGmz5c8QqiCql3t423Pg4QfL76cUElm7
         dTsof1y5cavMT0l6T8FFBpc/p0NWPqlr6M0/1zvXTpPyBKBuq2HfV+gN546GLUS4HoP3
         Z8b6/qlPz0JWfZ20dRBZvYrK6yFXNt/lKdAsTfgI+oXphyPBfndlGYyaAPBmZ5abgdwZ
         9xAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795372961; x=1795977761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kwivYQBNYMrJzWHFwYjM5RwFY9xg0TLCUyjircrlzqM=;
        b=Uqu+aq91vukYGNdGh5H7TFR3NBt8QvZcRsmHE5dnL2YqYP1eDE8//5biSb1HAZD23J
         suj8GSJOzu7c8r9cKrQQ7m8CuA6a6wgpvGn+VSo+Yc4yzaOBsR5dIcPYxxdCh1hbGacK
         FTcG6PEmkRcTy56ajAQlRibW6HButM+C63RkNmDwNB90JvzE86XnDWjGB0Sk+2c3cqPo
         pn3fikjffDy6pyKqKTpwywFvc3yhRJmIkHUUYsp6h3dMv5IfrI/FC1HQBelGn1IE9vlj
         JvpbI0EofGN6OPsz6yZ/zLx6vKpCvFcmi+IfyWEEbKPOcB3ZnQNA9dEojwefpJp5HAQz
         t/YA==
X-Forwarded-Encrypted: i=1; AL+hErEXFGR+WkCf+K5CM4rjZXX1KR2fVaGxRDiUU4DT6zRi6S+zod4Qskm2RJ05w3BtYvsm7UOiNyZNA4GlxmiT@vger.kernel.org
X-Gm-Message-State: APuU4Z/cCH6Q4Z5EPYFt+Jr6xqdedN8wPy+WwNufBHTR9z9KmIwTkhBJ
	NzzHwfs6vmWMakMutML+oHCHnMnPkL439oGMKVLQi8VZYnikOjiegxf4amVnN7yDC/DsoFiOYw5
	45KzCdVQeP3c/Jg5L8+2gfJ+5Pw0Bw5f6G1jELyP4zISjSrsD6zRW7oe3ioYaqQdmTZ+h
X-Gm-Gg: AZFdTZcKRCzI9W9/QzSkvAf+d94Agz3oJCuzaajtRGOAvA1syiSWSfyhdUgWH5cVU65
	ebnUgH8rpuj7XfN21ZaH+OQeANY16mz/JSf60Dp/VUjcBP2taNqPRa9d4ngZVOnqIXj53CUVIY4
	bNgH3Jnjs9E8LZUFSMMl3dsVoo2EIyKW4gsRHdzO0/4WwfDyWIZBXOvaMDHnGTXLXjHKheMnz0y
	6ROVtWuUy21d0QhKCNJTdmiA41kUtD6ob8h1z5S1+ZnCfE+3BW+/O34O8yi7A/wJs2WaIWd6Avo
	nvIWberiCFGkaBWiOceGFqxJ5NQq8pz1ztlHiJDJjYBYqzks6s0q6eKAj0p7wLfKJ99yJ0Impme
	g/vf9k5NSo0/8IencJhtsjzQts/eJfqgIpVe4q7Ex76aFYHmhK/qjMpVjorO+H91joGXHeAT7SD
	HvjHm6aHcAXA==
X-Received: by 2002:a05:693c:60d4:b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-3857111f65amr10851674eec.32.1795372960458;
        Sun, 22 Nov 2026 10:42:40 -0800 (PST)
X-Received: by 2002:a05:693c:60d4:b0:360:5f7e:2eb9 with SMTP id 5a478bee46e88-3857111f65amr10851628eec.32.1795372959922;
        Sun, 22 Nov 2026 10:42:39 -0800 (PST)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385646633d0sm48497465eec.3.2026.11.22.10.42.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 10:42:39 -0800 (PST)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 00:11:39 +0530
Subject: [PATCH v7 9/9] ASoC: qcom: lpass: Add support for Hawi
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
Message-Id: <20261123-add_shikra_support-v7-9-7bf3aa089fc6@oss.qualcomm.com>
References: <20261123-add_shikra_support-v7-0-7bf3aa089fc6@oss.qualcomm.com>
In-Reply-To: <20261123-add_shikra_support-v7-0-7bf3aa089fc6@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795372903; l=2073;
 i=mohammad.rafi.shaik@oss.qualcomm.com; s=20260424;
 h=from:subject:message-id; bh=b/4U84734Yc7dwWjoX+6MpWrZ4xVMl2EfGHGxrL/qPk=;
 b=gYUZRHtzpFBjr3/75J1gKwWp870vSe+Terlm7RWBInWuX0hsNcQq6BELS5GUPU6M8tPjOc2aL
 dNwwwObuDp1Bd9Ofr4v/oHSCwidkAtOfmNKqyAwrIBbJUIrfE62/wMf
X-Developer-Key: i=mohammad.rafi.shaik@oss.qualcomm.com; a=ed25519;
 pk=KZedmYgMGYOzuTpLGv56tdrL+pTLDP8pdmfQ91xemiA=
X-Proofpoint-GUID: KEjo0EUbwpLmAevnmCEAmW_m1DeCNrpT
X-Proofpoint-ORIG-GUID: KEjo0EUbwpLmAevnmCEAmW_m1DeCNrpT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfX7Pc1WjwHUeXl
 bIkbsJJsS8dxXK8rQSdPgwa3/y/93b/kSmy27CqcDAcukjykcN8IEyPPaXuJEtGXMhlLbEuVMu/
 2E0azmz/bfs/iuXp3ZC+IQuSzl4We7QfkJCK48AhQIgVnh+s26Ibh4F5b4JMbo5Ypztm2ZVkVem
 Qh8PJuE2TokYpPzG04TbD/5buANv78vmbckXueWaOJCRQSXWF7bKLfbOT7E2+hXbCahWUEH2XrE
 7wOS6FRhTP3ohI8LYrLE/6X7e69cvNSWK23U+x9zgTHL5deZi3LRKhmo/WwkIl+nUc2aNCBOK5W
 jH/qSxgdG/i8ZP7E9qV75JKhfrLl3ke5oRxUNEccqSFMf6KOiQvHgFgsUv2K7YUDfoW7tc9bc9w
 JNa/AAaav5vj80nNboSOdUuvosfUJFGPL+Kj8dg0+/yZMn+kKE4MJ2bsTul+VHhdnU6vMeA9DOU
 DJdc5M9NUqDqBY9Xs0g==
X-Authority-Analysis: v=2.4 cv=MM71C8Zl c=1 sm=1 tr=0 ts=6b0337a1 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=bsY24OqhetQib-sbROEA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3NCBTYWx0ZWRfXy0ixegH6c/vQ
 1M3xY54wjYZqKNjFDzGs5+rD7bd79h50x6SQ0/usp7ly8o78D50Q4IpI2Q7rmbmL+9lAGT96HIy
 R+hJDxJRscKyYik931JCXq57bMDib+g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220074

From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>

Hawi and Maili use the LPASS codec v4.0, RX macro register layout
of LPASS codec v4.0 matches the v2.5+ layout, so reuse the existing
v2.5 register access helpers, controls, widgets and register defaults
for it. Unlike Shikra, Hawi does not require FS counter bypass or
adaptive filter blocks.

Add the "qcom,hawi-lpass-rx-macro" and "qcom,hawi-lpass-va-macro"
compatibles, both pointing at the sm8550 match data, so the version is
read back from the hardware at probe.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/codecs/lpass-rx-macro.c | 2 ++
 sound/soc/codecs/lpass-va-macro.c | 1 +
 2 files changed, 3 insertions(+)

diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index b3adb32f7d33..09ea4240196c 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -3997,6 +3997,8 @@ static const struct of_device_id rx_macro_dt_match[] = {
 		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
 	}, {
 		.compatible = "qcom,sm8550-lpass-rx-macro",
+	}, {
+		.compatible = "qcom,hawi-lpass-rx-macro",
 	}, {
 		.compatible = "qcom,sc8280xp-lpass-rx-macro",
 		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index 8ed8420d7185..8e0c38517a5f 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -2195,6 +2195,7 @@ static const struct of_device_id va_macro_dt_match[] = {
 	{ .compatible = "qcom,sm8250-lpass-va-macro", .data = &sm8250_va_data },
 	{ .compatible = "qcom,sm8450-lpass-va-macro", .data = &sm8450_va_data },
 	{ .compatible = "qcom,sm8550-lpass-va-macro", .data = &sm8550_va_data },
+	{ .compatible = "qcom,hawi-lpass-va-macro", .data = &sm8550_va_data },
 	{ .compatible = "qcom,sc8280xp-lpass-va-macro", .data = &sm8450_va_data },
 	{ .compatible = "qcom,shikra-lpass-va-macro", .data = &shikra_va_data },
 	{}

-- 
2.34.1

