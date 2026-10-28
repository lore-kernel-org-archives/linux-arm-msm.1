Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793194699;
	b=vBXHqvOgaAGspLxVj4KSMVWznYxE8bGMCTf/xmN0QhEzz5nb4CLL9+dwjmJER5m8S9ya
	 I/uwSILDzGiTt8y9f61Vqh/Yhmze3C+gbX5JLkqoqq4yv29zEBBt1ZYC3PlgKnJ6MyHv5
	 XZqH2WsrXaq7Kkw6abt+cY7rlsBnEa8ba2hSj7hY5HytxjBTWtW1l7lUhGKJQeajMbxGC
	 AjmS89u6UtCpmH3rqblcipjwa6rz1nYemEO8jC/hkKZKU5JYp9NyHq937slqT87yqrEQL
	 /Dujt3SYjcb0NdYgiyEU8kXqiqq77jMqrNOXMf3zNfCIrF/Q2c9uDHG1xZ85TChcIlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793194699;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/mpEE39JA9/80m6032FRQgwoN+AByKF2xUG7co+uHQE=;
	b=znEvbkCE8leAUaP5yfdB+F7J5VXLlUjQxCmuws08EhNJEVZdOVyTD1lh1SfQgXXW8Xt4
	 bAIByqMNn7Ume6AJ7FFBu0JY2CB3Da2wasl5HvZxAEuq5h6rPYOSIgnGJfNii8MzHp+Nr
	 jGxAMRsltuyS37GPb/DzArfNzfAotvifKu5xzfFdxNnGLeT2XRucTEj2QFSX5lAR6pkyv
	 S/YX3x4n5VcXAkgy7EUCRAl3XxENHGa+hehsS/xA4oym9eQl3WXm/r7917L3Ed5N74oiW
	 0ploD0nNmkI8j67+L4WBP+j9Q0IBi7yyqPCy4gDy5fDQwb8N3o6dyXvBJRjY3oj4uzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="kybmvRQ/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=djHwWfUg;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A3C606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:38:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6A3C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kybmvRQ/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=djHwWfUg
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe2wZ1538933
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/mpEE39JA9/80m6032FRQgwoN+AByKF2xUG7co+uHQE=; b=kybmvRQ/e8UryMBc
	WTenpDPQ1WXj2/WXl6n6Bq5zRTSaoMiIq1oHOfYCQs2rjN60Az7tYyL1caLBWoyS
	5uqiCf81wrK1zFnWSOQIieq+99Mp/7YDDAtU0NWqbMGq/yGOIG9i+KiL8yiR4GXi
	X72Lp3p5GyAH7Hd+atC3W3CIHzw89ogn8shdErygiC+Cx3+/ZCnIsh+o3RgASQYw
	nA5ake7yV87wcaPewH//Urw/AUqpqUwOlaJfT/+j3Xs0s89eDvv2Z5ivMRoET1iX
	xdHmIFy9DRmjwRxZPsUiPxJtNp+hFSemWqCalsL0lyhFkkCT/d5doiVtaFhagvjK
	fB74Bg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7s59k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:38:17 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c97957d83bso80762e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 06:38:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793194697; x=1793799497; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/mpEE39JA9/80m6032FRQgwoN+AByKF2xUG7co+uHQE=;
        b=djHwWfUg7mpzu1uq6nHEi2OX/T89tBmMQmOfLP8QKR4P9N1VvL5X46Bo2yMkSmQvyF
         E+lLCfzhIe1dkpwgf4pdm1irvUr9+x6OVG+KPfmYaE+q/x468oFI96WGhtGLdRe8fDz8
         YGXT5ODIgq/ncLSNHLAEJjqMssWBDnTplw/oNePBO5sXq+sji9xkpfucYH/ihqSA7Etu
         y0qyC6DwlQVHM4CbCgApVUb5Y2amtDvHw1u/Y5BmvCKIuHv9vS9jXiYVUfFlq+3GtJ4j
         cGyD0/e1GbMOhB54JrkGghtvqZ1+ru4qF2B18UknNyanPGimm1B1p1/PdXVU3GNM76Ni
         KkPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793194697; x=1793799497;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/mpEE39JA9/80m6032FRQgwoN+AByKF2xUG7co+uHQE=;
        b=KKzSOQTm4egL96Evg7O+xBomH+Qk+3z6Ln9m+/o2SVgiO+8G5wurIhijNf9Vt6sAM4
         TjaU4JlMWSb3tjh7JSACixWXzkOkCUA7fe+z0Toq/dkAXDy5aN4V9u3MkMKoXoColOAm
         YSKNyV2cnY1aSJOrD13u33jt8xjJykcFjJ3WAKI3QsvUiOYdrXfDLVoO5FdxfyeHESET
         6XA67nAlhtmoMFDuavHgHiIm+/y6miOPlk7PVI/geNFpMwJlpjNiYS6fyeFMzAM+lB/f
         uddO47zzTtGax5aISKEHzilJg2Gr/GQEoxEOc0U2XTA9wNSfHbG+T6ZtfvEzwePtvdfF
         /z8Q==
X-Forwarded-Encrypted: i=1; AKwUvBxOPlSVNLQM1xqdkTZZExVgpv0s75Hx2KxQdhFH8ZdIrPk7J3cUwdoayDFu+Ti86bFGzbXKMIqYuRiJAJuF@vger.kernel.org
X-Gm-Message-State: AFq9FYL75po/KWi9RSm2vmEO6Hm4TZrgdE3+E/FV8vsLeWu+dhXynXnX
	U0bh6DM/plyu81fXA8cJ7v37Bxlsf8tVGwT5oSVayZC0+fDUmq7dhIAGDMsQ+//qBNZd2N0HAlo
	uf6C4dl4C+9ANkNuhKh0SjWW6wzdQL4LqRB1G3+Ku1mstu/PuUPw+cdKB/ltFiKcBxoa1wRu1KQ
	kH
X-Gm-Gg: AYBFou0SWUYUNFSMt3TpIXNbR9mXHJSwBMfJgZ0+IbPpZzPKWU90dH/1TYsUfIfikvp
	W/65sOav/Riq+Q2CTIM2yyl9SgymrCzbsjVCenAcK6L2VqKYJ32c8bwONMlzH3qxyf3NE7FB4y9
	wS2RJmJLBX70CVRaTQyK/z+MxHICQG+q077pX9E5NFscMRzt/SmBKAvshcCz8IIgOz2CmEfsDSu
	GP2gQnxTJ9XaeoRjc9vXzKRQb7tU1JXn0XBx5eMJhlgEc+ankhHW5fGiHgxpqJJfdszCmUdKruA
	ecjeEjSlN1nIXugAvVWd8ThfRHBPuUud36J5GfsnJDJmL2GRPEgjFLi9idLOHSbSXaQVfpaOmvt
	h5FMNmktv54Yeu9+TV23P5Cg+iUchSvYFiJwm99zCotWhJkbdC+xIF8U8TRYEqp1wN06Cd2M=
X-Received: by 2002:a05:6123:553:20b0:5ea:af6f:16e7 with SMTP id 71dfb90a1353d-5ec4cc714a5mr1020169e0c.4.1793194696844;
        Wed, 28 Oct 2026 06:38:16 -0700 (PDT)
X-Received: by 2002:a05:6123:553:20b0:5ea:af6f:16e7 with SMTP id 71dfb90a1353d-5ec4cc714a5mr1020137e0c.4.1793194696325;
        Wed, 28 Oct 2026 06:38:16 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709f3d9esm30451071fa.26.2026.10.28.06.38.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 06:38:15 -0700 (PDT)
Message-ID: <0bbe4db6-0c47-41e3-838c-37d880869ea9@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 14:38:12 +0100
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
Subject: Re: [RFC PATCH 22/23] arm64: dts: qcom: glymur-crd: add WSA speaker
 protection VI feedback
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexey Klimov <alexey.klimov@linaro.org>,
        Ravi Hothi <ravi.hothi@oss.qualcomm.com>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261023171433.820092-1-srinivas.kandagatla@oss.qualcomm.com>
 <20261023171433.820092-23-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261023171433.820092-23-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae1fac9 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=7ERdoP64vwSu8KGZOMAA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: UX96j9TlVLNbvbk6q5M7-T5lLr9Ghohp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1NCBTYWx0ZWRfX0flLhehvD1lK
 70GmWt9HGQJOVCuWTktq4GKxz/rAv/oKyZMYuzSGeXutkfNcQMSW7MqxWBPJptzWeEj0xk328uC
 RJvLVvFvXhahh4/MOHqOhEkxe0Tz8nI=
X-Proofpoint-ORIG-GUID: UX96j9TlVLNbvbk6q5M7-T5lLr9Ghohp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1NCBTYWx0ZWRfX9Qje+y8YQllx
 a2l9h6XkOde993jFXHxac2c3B91Skc63QjhnvIKvonVpQgiAzkcSYcHQAQYTK/tjCIWG1qh27Nd
 QxuUShhyrnDbqWU4n60WEPrN7+uHUchNMmJLi8HMZZQzu0JavFnqxz1SGVSq/B9qGdS5fNAQRq0
 jzxyF99ucYt8fPh3pqMSVgssdSBfoPLzU2ZNH2N9/e3lUrOshPkbHBMaP0vh2+T/9Hb8pYIKaHX
 3F9YuKRc02garFHW6qwOKvVFil6ERlQ2A61A1MzNY38lONQKOLSLz/EcgnZfXzMC6iBCBLtIB6S
 u524OT441ivYZEIOA5dZtjE9cKeSsH0njkXYxCc4lg+K7a/+B21GHmcxhkp1LpcCohSHnkqPfUp
 RF346Y3bQZ4ZCfapFDBNC6NJY8iMwaPnHXGWglt8XVNsTDrKF2OigPYoy3D/wDKr8l+fEX+2BtF
 UNlMG6nmvJamjv8lXPw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280054

On 10/23/26 7:14 PM, Srinivas Kandagatla wrote:
> From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> 
> Add the V/I sense DAIs of the four WSA8845 speakers, the SoundWire VI
> ports and the WSA macro VI capture DAIs to the WSA Playback link, for
> speaker protection. The speakers now expose two DAIs, so give them a
> '#sound-dai-cells' of 1 and address the playback DAI explicitly.
> 
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 29 ++++++++++++++++++------
>  1 file changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> index 58158b51fe29..fddc76f59557 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> @@ -256,11 +256,26 @@ cpu {
>  				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
>  			};
>  
> +			/*
> +			 * WSA SPKR playback-side codec DAIs plus the WSA
> +			 * speaker-protection VI capture-side DAIs on both
> +			 * WSA (left) and WSA2 (right) buses. One MM1
> +			 * playback open brings up both chains via the
> +			 * machine driver's multi_direction_codecs flag;
> +			 * the SP<->SP_VI control link in the tplg handles
> +			 * the DSP-side pairing.
> +			 */

I think this part belongs in the commit message instead

Otherwise, do you think we could bind the speaker protection
channels in the driver to avoid having to modify the DT?

Konrad
