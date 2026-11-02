Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620769;
	b=dqx1XmOnqFv7Fz0RnPfd/c9gWINrTOMc68u98lweSTS1wa/mdTrjpnehS62wNmhupLpy
	 lp12FKpmbMhG4DYKFGNJCluXponrGnvlN7JOB1pao4A1qZd/Dcb3PfFTJpdOaRcRWi9dZ
	 czzGhnChSsbD5jAJV51/xMjvJop1tTegM+afrJKMhVUrMDFKxqrEsR86a32LYMsQCvKZ0
	 a6HV9S1XIUKZ5UxftgrJJuZaJChqmnyjlpnt4QBhFDWzfCBTfElHA82x/1w2KIGVWKIdx
	 8iX5tH+GX8W70bNesAgo9rgPPLzmtRhgHZZeLdev7sP25nblKBOoyIleDo9WAFRFmvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620769;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KxBPqpgXhfqvGlKpWpzmxhKDsK56vJpqqow3NQ9e2TQ=;
	b=JHZTEy8sc7keS/7G3MpW/Qoq+HOW73hiFovQmPa2epv3bmWpYGwcbS4ei6N6NnSu+YVv
	 CtGcAb9Xrs1bcP3CLnbGeRDoqzSI+iw2uxtA4UM2qbyDcpx1hqMmX7GM0ytH7jxi6mLZv
	 nRm2bypyVVBYaG33fB5JMSE3uCJbKfMGaKpXJtoRyrwTi+gdYBgZ171PfSwR5BsQYi9Hm
	 2Pd+cJz3pkBeWtDtYfUtrHd1oypad5jRB5ksrZkvoZSnOzVO3ZnOCoj9UhNNAfp06+e85
	 WdgNz9JmobjDaTk2+3GkIl/Qtf693H6CbrRpDO7Ujud7QFCTWX9umo+fOK5BQnbfLqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RK2HHeBj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZksFjal9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99A2606B177
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 11:59:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E99A2606B177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RK2HHeBj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZksFjal9
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2B2vPE077082
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 11:59:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KxBPqpgXhfqvGlKpWpzmxhKDsK56vJpqqow3NQ9e2TQ=; b=RK2HHeBjVeFnidnU
	oFUwn1G0rZsfbDoIOe1mDEJvDU6WhYabIXrOIvTTN3R43DuyYCZlTATTzJu0SiS6
	ynVHCuAa+dM+NZEwSt2Hf948QH2vcvU2OZma8qirKGKo+vrdU89NuzdpF9o6fkyf
	uHsre8dliUieMfKhh9aIBZX6QfAb1ioWU5Uey32f+40HX3kw18Y+xc3awFjLnBf8
	kR8rxv+9y8z8bFmREfbNZq0TG26DM0s2udi9mh/0yYMXukXRBXqeYE+M8iRoWNWV
	eA/GNeyP5qGN2Ry+kg4OFlkQqU8BVhvseC7L507JppsaenXY9J4v0H0Y2QKJZUhm
	LzqRIw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsa6r5rv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 11:59:28 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c7fe5576bso20442576d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 03:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620767; x=1794225567; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KxBPqpgXhfqvGlKpWpzmxhKDsK56vJpqqow3NQ9e2TQ=;
        b=ZksFjal98DY9yV0Lt7N4y8WWqPO7SWiJ3/U0g32R6LF1LXzEcq2DFXG4Hi6tc2lcwp
         YeoKB01JuRGilqs5y0DXtfB1A6eTe8FYRkrnH2SwUnojSMErexHVzcx5Svhs7NfAmZoO
         o9jJdTfotYYfRjqtZiCVkrNXRHj39WzkfB4nT7kUY6hiqauKjOjw4ZBhKQwd5YdTPKld
         Xs9+0QBztamzYvX7AplN/SdxALJc5aZzPgCxbNTY+NCwYQ3CIRLC76FMGY0MhtnAIhRA
         6GdYOqkWNV0+JkwoDXhQ4Db8ECucEdJESmUsweVvo1F3DI4lIpHN3cF/KZXmNHjulkPX
         RYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620767; x=1794225567;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KxBPqpgXhfqvGlKpWpzmxhKDsK56vJpqqow3NQ9e2TQ=;
        b=t3jIWrtPuG3EZl68qUuqZH3XnTTB00m42wq3ZnsAT4Ydz9VoYnePmZ8rbO9rmWc1r2
         NIMo3l/dZJQqQ3KtLIvvN4rXzfRxo3eifvvH9Jd+rs+6Scyv87VrxvfR0L8OKGBLPqK+
         ppTGGJeYSRRfdS9H+tJ/CsUoMXML/hB8RevXPpEcZ4ta6ZEok7FQ0Kmgg1kkp2fdFsVT
         3jkKmySzOKdEYk2arkz66Z1ru8L36iZlmzA/WNdo0L14OT6r1ERtJG+YDszZyy9jVUvn
         fe3Ks9mWWY3fXuAic18RBvD82n///cmibOHqGxD/X0nT9fQsSoo08zOLhI0PcoG+8yS9
         lN9A==
X-Forwarded-Encrypted: i=1; AKwUvByMKZ4MPTxfOVS3lk6bsLkY67VwhAHaIaCvMebFRtEveW71/V0VseIg5sMG6hoasuNSeY1XAcTKM04l/x2v@vger.kernel.org
X-Gm-Message-State: AFq9FYJjbaoVqO8XXDNdtr4+0EQi9jSbGg8RD9Lq5A2yinINfa+GogOL
	dEe4R3mCK2N0rGRinhQ1jshqWxjVqisv9AIZpQWuQAtYRztNZ/3entaygD5kwFOluxsj/K3SSaw
	8tJlcmGBDYYOR9jBEge3zIisZiliPM418PauMoM19uGgE+OvL1yuYcQ1jwapw5C6fEM/c
X-Gm-Gg: AYBFou3W2NPUGfuBmeY2bc9VP8k9rU39d5Umocc4mkTJ6z6H2ouZFFbv1QN95RCcrw2
	lziGPOVvUY/yvD4kqSRNL4Yex7O1AUOh6z72xpCs3rw8VacCcVnbDXxds8eWxVDQg/8xGIYxSJr
	fIkxXKw8/onzwTwABWpH7Qa08hMY6ECLmMRSvc+CTZlbj4QlL8B2xmV6M2PCSiu7KekgSIF4hYK
	5zMe9BDnt768wGc3AAUqBhGSL0xgZldmcRmyS4jmHNwRZTProSsfZrb8mETWtcKJ3ih8J1BxKKe
	krMFGsA/6V5V1i7rAr5gS6hmF3PSLIyaI0cTS7SNk3eIn82JAgUqdDoztlHtYBaXQtclt+D964O
	EshuE2ygimVzihOm+lXF50evKiLglnqHJZ/ix0M7wJE+T9SWDsfwbW/VBSc2dt/KwOd5Hy1s=
X-Received: by 2002:a05:620a:6f9a:20b0:939:9205:4d78 with SMTP id af79cd13be357-94421654ce0mr1517091085a.3.1793620767279;
        Mon, 02 Nov 2026 03:59:27 -0800 (PST)
X-Received: by 2002:a05:620a:6f9a:20b0:939:9205:4d78 with SMTP id af79cd13be357-94421654ce0mr1517088585a.3.1793620766638;
        Mon, 02 Nov 2026 03:59:26 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabc1915csm377913466b.7.2026.11.02.03.59.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:59:25 -0800 (PST)
Message-ID: <44ac4c60-d89a-42f3-82aa-ef3fb0f54636@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:59:23 +0100
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
Subject: Re: [PATCH v3 07/12] arm64: dts: qcom: sm6350-lena: Enable PM7250B
To: erebion <erebion@erebion.eu>, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261102-pdx213-upstream-3-v3-0-cdc3be96d257@erebion.eu>
 <20261102-pdx213-upstream-3-v3-7-cdc3be96d257@erebion.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261102-pdx213-upstream-3-v3-7-cdc3be96d257@erebion.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfX1Qnk64cKMPBk
 yeZquqEGtzVzqeF/TnaENx1lpcM9GXvranIBMAKQxQt/APrigtgqwMsNo60iRUmapR3bWl92xhS
 16geS9aX8dyxbePazPhcSvmBtDJcBMUM/huuj/lfLT2/98fDGWW0qGRWoLalN/iXkjUzobeo8i1
 P1cVMWVQqajaJqG86TSO4njgX+K6UMIze+aA/w3rGq8ZVsxfyQDmBFNl005ZRlwTDKqyAXmH6L1
 f00Jn7m2w3MROstVxF6dYorP/fsZBzvTkNIr5ftqMV63dc7vKiuPgoUymwNLIPw7EjlK5Pt6Ckc
 nGd3fb7tmCqOtDuLfOcjRjaZXUST08e6Yg+aZQ8kYCYK1Mdeqi1nMFbTDzmjax6Yo+1ubWImkYI
 ms3Lq/y819N4csF48yv8D1jDP3wS8a7UINkumeN0YN2h11TM5AQS96LD/HyUVUBKzIvqLnUOV/H
 2U/gUSUv25vPfTYGt0A==
X-Proofpoint-GUID: rkgf4hS7bzVDAzDzF3V5-n0tU9wXVE3Z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NyBTYWx0ZWRfXx9P1V035/Jmo
 oCMnxdL+SQai0ZKr34Uj6KsY5zM1u+bnEelz5lwt0ucIinDexKkuluMkfXOZ8ZyZc4gJJeu5dCc
 UOIE75VaAWPx99FT8xxtzBz91Ii6sug=
X-Proofpoint-ORIG-GUID: rkgf4hS7bzVDAzDzF3V5-n0tU9wXVE3Z
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6ae87b20 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=JgZe5hknAAAA:8 a=EUspDBNiAAAA:8 a=dNZ_EX_IlpB_z2sQReYA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=ODtDA1adfiiB3BH7YLNA:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020047

On 11/2/26 12:32 AM, erebion wrote:
> Enable PM7250B and some components on it for the Xperia 10 III.
> 
> Signed-off-by: erebion <erebion@erebion.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
