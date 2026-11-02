Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629955;
	b=qOFKVuuBaHPLLPyna0HCw7SzpxoQv4PKNVEwYPHQrlXO5fywWmjz+80wsui9F9pBZHhV
	 54lOJTIoL99RUKmi9V3+jC2JO8kWRRrVRXCTCUf112ZoLuKFohD046Jtk/tNPtOkvviyn
	 ++lM3F0WfUa6SWQPYVVcaA2VLCEsyFnGTTblb1tI/ypPq2Cp/rBNhkBLsxKFswNEAWdmz
	 Buc/o5Ar5w/k/xtGF3gmbWgipb+/WO4bD+BoEKaLxNlmlV2zHeTnkQSK8BenDsF4bMgfr
	 i+LGH/DEEB8Bj6oNME/vxsuS6h2i21Y2cEY7U5j5mIPQHlb2Tseh8xjXC+9GXw0K7BA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629955;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=B2gdNyETl25FSFhnQB85W6qXKXQTVxgY/VhavwxwRBQ=;
	b=SXRGa+zEajlYnq3JRqmJowaNsYUzhixu6TEMFD3Y4qC5BiU2YxzED12YpLMMMeSyA2ab
	 L6+L2X/ORztWoFe2zv93RrK9yuzYSuKjDVfy0/kDUuBpyAcTOGzR8vkcHfH7WCXK2gn+E
	 xJZTbPGIl6HhF/DNmX09LmLlGwZF3QZVrdfnVPe4rYlyvxE60uUCioXn4/Yz+lJRAS/gW
	 Y13J43tnEAgi2pDdOg7b8ZFzznJFxGnxF+xtxKSY5E4mdKRN1pKJD6NxVvYQdtoJyCXZQ
	 FBV+ulRmfxIx+EEeRupiBiapMMzKNG2qjKHxrdpvzhiA1cxOYH0egsYHVcwUoRHobzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YLN0WTN+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OX9YN+Mq;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DC4606A928
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 14:32:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50DC4606A928
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YLN0WTN+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OX9YN+Mq
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpNxu2991933
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 14:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B2gdNyETl25FSFhnQB85W6qXKXQTVxgY/VhavwxwRBQ=; b=YLN0WTN+XVkEx7nS
	IUH5f9NLarjyz5TCoJOBfaK3X3KXB3pngGNkh288RgrCE1yU7huXhCt7VOhRrBWU
	N3m/BbPksCEAXHujSBTDAHPKfkV5H33xSDWyve5/g/7Bg/c8xc492CJsX1tnzn0U
	KOykRu0pe5lUPvsNQGvIXrTuuwc86t6PhDMml6ve1Y/kLBkuFmlnzFFpVzSCnkxl
	Hsms7vyat6HC4nLMtI3meSb62sQo99lzBbB6MmlnsuL61F/o1PN9fiLjf5AHeDT+
	XfzcGJlc6ADexvhOWMGwMAjjBdwY/eOGcaXht8HAtqQYxCBTrZs+h7Exn3KWvVK3
	NPvaQA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsavgrne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 14:32:33 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc450e6e1aso117080137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 06:32:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793629952; x=1794234752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B2gdNyETl25FSFhnQB85W6qXKXQTVxgY/VhavwxwRBQ=;
        b=OX9YN+Mq1oGcz9FS5M7Tl3qxPyC98Cmi9pf9tt3ropitn9dNWzZx2t7qNqdNwQZbso
         sE3edQEko+W2lShHpwERQ3ObrfyajK8Qr8pqTzHjOBPTm4vQP4VJ/Fe8SMSd4rVlAKEr
         +qvPeT8YWPe41WM2K3nctsynb41l92yzKyX10gE0i97pHD5dcOgXv1QsFxMu0483zshS
         bUobzfeexu95Hcn7T30/N4wpZZ1p0d1ZsBVRNDtXF/GuVwx/XQLrABQLbJ/OPHW7SlIq
         iL/yLj1RYCO2q4AKTIywqDqEv/M1UXMvHrlhFvvfrFPYYa/CqsTPzhKr+uuB7vu4oK7i
         SkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629952; x=1794234752;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B2gdNyETl25FSFhnQB85W6qXKXQTVxgY/VhavwxwRBQ=;
        b=iiJ7WN8be+y+RZnreaCQZaduh6zE0NYqWn00sdE17ECVu73UhN4GmjO5jfH0b3wsRi
         8KZgK3iJp6rR7zo/KmjR+41MI/DJI4vT4SMDGd1mbVGVKZR4x5pQHYmHUaUwRpx7mo/X
         Ju5007oVvGvPKjc61yZgAkt/Gx96t7RuB75tollOKngEiQM4oiqzdqRl4/VQekt2glt0
         dmP+y/Kzjh81NX9nmjWJUL40aeq1B9f2LBKtP9CDawYPaZP4OLM5X6gtXBVS320UJq/F
         A3Cpplj3BxdvqZR67AeyES81dmbL3cn5vTaHomIrmQp0I+CRfW2JcBIWAGaJSrOt3XEo
         rAOw==
X-Forwarded-Encrypted: i=1; AKwUvBy/6PYoO5FpGsGdwdhywTsk7JiAay/f1MRKCgqNwaKUPkJu9Xzw2p8XKxdeeMKJJMM7pY4QHJcb7+b5hQ1m@vger.kernel.org
X-Gm-Message-State: APuU4Z/IT8Du8HbJ5Qay/SxcjE2wv2Nqt/kNWg3kmIIknXBuj9Z1/coR
	sKCvwECXZMfzxAl0K2+6B9Lg5l9sYJsHF5tIZOOi5QPMqD6fJQ5sp1RUedKnEWYHCDp9QX8H7ex
	yf4/M+7zcBI5zyZN7Oq0P4xP0WZr78zhcmkRO5Q2ajy0o7EbtSqv1kAn3vfZb7Eg+cfNK
X-Gm-Gg: AYBFou2gY+aiaGLznd/KB4C67LaKnw8fERr4k9KOaWC4JheYmhk1hQDoCjPkDJIbwFi
	RLSXiUGwVABicblHJ6nejRCAMPsCI5FLvdTJoJmmJ4+D4MNBhKH0akI6Bc0E2Sb9+h7QOL8BAB8
	px+jIydojpQtbEObnB8vS/eK1xm0ZPA9RELG7oXNU/NMe+uokI+1a9S6e2p0ze60rN7OmDcLFLw
	nsJTYHylRRQ19awR5UaWYQUq+Y3Ks+lXiXsSKts626UbeaTtiGCdB6z2cQzqEwx5oZT54hYp0c+
	ZPVlXDXR4+mEmq/7NABsfmmxPY1PdTD+7j0DCpyAmpdUfQLpi4hPqecf2Ke+sRVAT06AcsBUyMB
	TSl12sYVRyq/v/dtL3nEawsWQ+LgzGGsnYZ1dpTbeQt+Qx6KUblLT/vi+XhOX5WpeZCNiUKcbdN
	DiSIWvx/OAIsFNBYsZ3MZ1IuIXCODRiw==
X-Received: by 2002:a05:6102:a193:10b0:7cc:174b:f7ca with SMTP id ada2fe7eead31-7d0724f26f2mr3582511137.0.1793629951378;
        Mon, 02 Nov 2026 06:32:31 -0800 (PST)
X-Received: by 2002:a05:6102:a193:10b0:7cc:174b:f7ca with SMTP id ada2fe7eead31-7d0724f26f2mr3582490137.0.1793629950943;
        Mon, 02 Nov 2026 06:32:30 -0800 (PST)
Received: from ?IPV6:2a00:f44:e0:8d11:8079:3a24:c57d:745c? ([2a00:f44:e0:8d11:8079:3a24:c57d:745c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b52f3c2934sm418712a12.33.2026.11.02.06.32.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 06:32:30 -0800 (PST)
Message-ID: <c69d072b-ae69-4f87-aa82-d3cb4b1af82b@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 15:32:28 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] media: qcom: camss: Switch on frame_sync_en for
 x1e/x2e
To: bryan.odonoghue@linaro.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bryan O'Donoghue <bod@kernel.org>
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
 <20261102-v4l2-frame-sync-v2-8-25cbed7a772f@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102-v4l2-frame-sync-v2-8-25cbed7a772f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NyBTYWx0ZWRfX3vYXO/cpeKBh
 cXwMPBGP91f+0dZJpCeinkztxhtUBwTDcB3oQrO6ulSzSVr6jkk4uKreJDWfssDzkDd61e6n9XN
 D8Wy5LYN6/iM5H9y4maPMhCRE9JAymudWbuxNczpUXQvWIJta6q6wcEMfIu5Fd9XqKly/Uv978U
 pE87oaUkA2m0ZiCcLLfhxAbJxWXwHR0UFfaWO6oQ3CtxVGbJML71wrVYB+lVRvRsrxRvJmef9KT
 19MVX5YSNqimqkoYeBqR9Ojfat3hsBM5R1cWmgxDIXvkESEQmOHt7gJ4a+ka04VWFLiPzkya0eF
 EEk2K34KOdFajirLvvDLNP30YI050sjLCzYyjn2swEPsd6Nip8r77guYD+COcHt0xoJbaMhi+MP
 NWbqaBI6EqWQ6sgma3v/ZDGu3v0EZUWD8YxAcLauoDt1olUCmiEOT6tgZre7fS5OiWsLLgfi31x
 1Mgvp9Ow52c5SmIDOQQ==
X-Proofpoint-GUID: rEBUy9fjC47-ZWOcUyaM7g90zRH4S0u7
X-Authority-Analysis: v=2.4 cv=FZmiV5+6 c=1 sm=1 tr=0 ts=6ae89f01 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8
 a=xvBfzxcjuVojlPD1IgYA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NyBTYWx0ZWRfX2yYzuggAnRjV
 vGsywzGJcDslNnMMmendgOKkZwZOtlqwbPQE1C57Hmnhz5N9uXfjqvfl6b4ifxwXO/rDcQhH6p1
 1Xe2JC8QN3MJK5cSovDAKU4K6V/g1HI=
X-Proofpoint-ORIG-GUID: rEBUy9fjC47-ZWOcUyaM7g90zRH4S0u7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0 phishscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020057

On 11/2/26 2:56 PM, bryan.odonoghue@linaro.org wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Switch frame_sync_en to true to track and consume SOF/EOF data.
> 
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # x1e CRD
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Is there a reason why it's gated behind a feature flag? Will
exposing a SOF seq counter that's always zero (i.e. not
implemented, never bumped) have negative consequences on
userspace?

Conversely, what information (i.e. platform list) are you
lacking that would let us make this non-opt-in?

Konrad
