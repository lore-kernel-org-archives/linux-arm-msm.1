Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349398;
	b=i9DM+v1RcMdeHBHjtnoPWNZwb42IvhsRIkb2MQgu6dQRkI4+8SnypB6n4R3upG1twFws
	 yAFFQNbnIeXj1J0Jk/6SFMOjDsm2v9+aIuv5xQMFai4okXcFoWcjL5TuBJAZNAO7tTyj3
	 dKa6MW+ObwOjvD3RKCudzM5QNDq/WNWqArXPEWjn1qJ8fAVY8hW/EhDNYVYflENnqQuzI
	 PCw7pkGBUomGYKuZMIPvR2i7M73tOCvl4IWKs+qDIhzONtCR2TtnL4kKFL+Zgx/AvpTMv
	 6b6YI+NuBFVmsjRuiKmMXnQAYlGSpmCM/iU3oVBuaVVKPn8qvw8QdxGujSVwQJXppMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349398;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pw/rj9q+UHb3g+b1NG7ao5fWfl9kHMdGuItNZtveQI4=;
	b=WIHqcnwex94sUsC7LzDmqn+bsedZbXajBx8VUJvrEu6DBPS7agyt98IJhBor5a0tAlRZ
	 KJvlnAY4iE0YM705FP2ltlyy2nI9rzhQ1W4NBQAVO4Ylky/XoyqkxvPYeHUGvddy0EU5r
	 6QDsFgcbxRespmCBf2yrvuoLG/De3hy5uek9sbKdBIvUZHUEjNIz77sCSFoDQrp7P//xf
	 JQ9PmEtqXsBQ2pzlnGgfkI/9PAX2wRgQItFeviIR+ibyHk/kCrwgaMVRb0+wWQRZWYYlR
	 TI9+LOv2DZYppI5wkbzEf2wyVCXqxy9zthHrSc+gPoKNYJkZDN+ECruNFZdR8rc4beA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W9WnreYI;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JHOqJwzU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 181DA606A33C
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 08:36:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 181DA606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W9WnreYI;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JHOqJwzU
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F3AC3308880
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 08:36:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pw/rj9q+UHb3g+b1NG7ao5fWfl9kHMdGuItNZtveQI4=; b=W9WnreYI9LphC9NW
	1Jl61Ic1/IqHICYDUusvMS3TjbBd/x++wnlCc8YqRyZqNELPMI2HmJYyGbdTZmrD
	lWnf0s73ct2gBXV2CgH5ZakhKUVVEsFh3Nswc7DGQ1xUpDw/sKPNvU7iO5EPCi6/
	xIP2qreA70Ji3gKqW60Axu5STb6xCfQ3QJeCoAn+XdVAu901ICFMt05rZmioqwWC
	d7mc7wvd/L/LgI0sJzUnaOkVXeHQFrFyrOAeNXxQBJXeFOitROEsTPHulU9GzAUj
	RTiryNotolacpDpyVHMfVbU+/vD+7Xk1EJMANdQh3WKJaA7N+K6jWko98+mGEHLs
	YGf2Pw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qt12c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 08:36:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1440e081so10678385a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 01:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793349396; x=1793954196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pw/rj9q+UHb3g+b1NG7ao5fWfl9kHMdGuItNZtveQI4=;
        b=JHOqJwzUUXwG+aOZGzT51qye0LfFfTWIuilmocscHFmkIJYVOB5SiNQ0Gacr6eeoy8
         SZsMJo9xkWCasb5DAfszCUedPFk/oKlkTC1bo+wpIN8wQnYW+X3ZCG0q/fnnI7X4ySrQ
         K4U6b/xhBt3Hxqvg84OlICsGoHPi36gpy9FN1CoU8vSAszGa9+BpI+jIEM9Yur4/WYSo
         qCSqX7Clv4GU72ZfCTitkwUNwr4OcZjvOx6Dk3zY23/wk1RsOGuSfBXcrcNYnzQ8Hs53
         FevjLnlhjFfrOdZb3KNPYfkRGEHnPWYXnrMEUx3bbG5FDC4ftObjOALL5pMEx0w9TCxe
         NsCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793349396; x=1793954196;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pw/rj9q+UHb3g+b1NG7ao5fWfl9kHMdGuItNZtveQI4=;
        b=DLEo3DgUQzsQ741Or8twR69G5UzDuapnDBW8UtjjEzDzaTYUNA763Le0ZO9Wy+L3Cm
         gGphtqo6Qt0VYR4glfumD+udKGfSk5TPuTPfVDMTTJaGZHdPMy8NO/30OxLQe2H0CR3Z
         EmTmbXMZ2yuSoruwpMXhQm1Mmv/MDiFrgtGfJV/vNOb460iBIV6vVwihCQ/7evK/A+Mk
         w2Pbn6u0cwFD9unVHWtMbg0unTGnM6IxJOYtxHVZJssoB2+oqMqkneESDJbvR0JYN12M
         0o4r7BINlxH2C5wMIEiMTQhw43BK7T38G+BumIySfOiG7un4Or06+ybZ/sd/XvclOWDc
         wJLw==
X-Gm-Message-State: AFq9FYIRhK6V0snSm+lT1nw/ckJUNFCXvZi2gG8hIGYJ6bXy5dvYIo5S
	svCRV7V5i3qxkIDybx6+ulSUGjIB4RiE1Yd/95dgbJRULeZc39Kj4p/cRgFzREIvgpmKtnMbwMA
	kZKXNksBAwyCyv44Giq8Ad2s3wt8FKOLmyGaJlQ+oSToWmqhE8Ir4F0PZB8RACghyaq9D
X-Gm-Gg: AYBFou00oY7In7b0lVpH6kQWImhmNtar8A5NtntdAL190/WEJgN0FJ5EsuZW/5ygXXt
	AyxUPlbpQApYo0AF0yPnxWeLAEnyUGOzw33o1RDhxSwfsWkouhxHd/fbVMklbTFE406XMOl/shT
	kn7uEecNXmZUziRDWfKOd9ZwC6dryrlQb3D1x7DwdToMOrYBNwCKpBg3jfNXg8fV3+sjKsBP9p3
	UDzK8V+zloZmINNuQRCEOX5gH67gaEs/rp9g3Wd2J/BGNGXbwbB7YkK0JZPEGFpH/8OGZrvexke
	q9GZJQ9O4nc2dTQc8cH64afoFo5EX2VmZjGy4aG1craZlQCPRkRIKHaVbOVr8T4Js/mjsiLSuZ9
	4fob32h5A/pyS/kRbCoWgZK9C41d36+F/1y/YxTx4WDlfWSoAzfFbOcYHDSPDspfiSE1HXoQ=
X-Received: by 2002:a05:620a:a40e:10b0:92e:6485:f640 with SMTP id af79cd13be357-94421762860mr267863885a.4.1793349396359;
        Fri, 30 Oct 2026 01:36:36 -0700 (PDT)
X-Received: by 2002:a05:620a:a40e:10b0:92e:6485:f640 with SMTP id af79cd13be357-94421762860mr267861685a.4.1793349395882;
        Fri, 30 Oct 2026 01:36:35 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabe96185sm38480866b.68.2026.10.30.01.36.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 01:36:34 -0700 (PDT)
Message-ID: <831671c3-31ab-47dc-8e9d-5c8015549121@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 09:36:33 +0100
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
Subject: Re: [PATCH 3/6] arm64: dts: qcom: sm8450: Mark USB controller as DMA
 coherent
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
 <20261030-usb-dma-coherent-v1-3-3147b8f7aa64@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-usb-dma-coherent-v1-3-3147b8f7aa64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: frs5uO1NWbXS_khYsZpIx_62hY6yBPXQ
X-Proofpoint-ORIG-GUID: frs5uO1NWbXS_khYsZpIx_62hY6yBPXQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfXynZnKoO7agLX
 yRDh4Njo4b65sgYReQPSOrDxbcp2Oh4WhZXoYMTr5YDNFtFLFsRz5CWJCcglVosh1zk570ThmtG
 wLflo0nXUzaFCZLdmlSaXucjBSIK51pxTVXTiG2HdB+euF7RQ8f0P7eEkHPYy5yNI5k0ky5sSqc
 bp7BfjvSzjSSiw9/9yGeG/aeK613ov7uIiCKlVEdhoMoNybiK0GoMH3kICpJ0YmpZe3Elkgq8cg
 EHtXOXoBQlUxWsNYqVewf7Z4kG+sDMS47raromiDb6brkwzLcOJ6NiXyERQ/4vorVecMqt05NWe
 tOVnfeiutI0Q/IeaHez2Xjb0WhT/jtWl7RnrquSgQVI4ADOJMWcHOcxMlwce10veDMS45YMcGPa
 M5TJT/6LsfjqZ5B8FxWgs03bKNm3ytsP1dThD3iflLLva3xtpxjSuXt2/4sA0q2dORy+Ertn/ae
 T9r67RF2Ei6FX1cpaiw==
X-Authority-Analysis: v=2.4 cv=dPgzC+Zb c=1 sm=1 tr=0 ts=6ae45714 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=bZAcljcOyrLSmtN0bq4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX2NlFlOuZybzk
 SOMv8QOOEzeKb6IXMK8N46/U4t8xQ3xoaRS6L1iDf1sBJDxrz/aD6H0D6GadBUDCvJIPEAnL4iq
 0OFzAqgxImEDk+FT8PYqWDbKNzd/i1Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300034

On 10/29/26 7:33 PM, Krishna Kurapati wrote:
> The USB controller on SM8450 is DMA coherent. Add property
> indicating the same.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
