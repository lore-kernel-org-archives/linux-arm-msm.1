Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603847;
	b=sD08q/BEBmdkrkziKbOMYKvNm6ql2pisXITsNW6Ll/azwGocT4poMXvg12L5X3kdSGzd
	 gZguRShorVC8GKtEbmkhPL6heMsBWMd7f36rBSuK9Hatq8amnZDdETOtuN4fadaJ5nrEj
	 wgM5lKj9JUw9Th+iEKZGTzDEBxuy9hbCV0xPtMKVgU5cSB6POezn+du/pdMFkevJFmxfk
	 yRLMv5TKdwe06Q5aOLBa6zn/OVE4aou2fKhf+zbNQHeANzmF+Nx5StJmwULj69YaTvb1S
	 KczWTIX4dnKk6URd1uIdsqA7BJNQxdvA6QokiMfnym844wANP+EWR0YWsRicIwtP2SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603847;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bia8k3E0+Fi7EKvRHW2oHQSwTE7OqUkyuc0dBUGcvBA=;
	b=Zysv8Fv0xkITW9YOgvqLqfv9c8rXhcR4KX70h3mXr/DvfbDpPzyc46YCAjb1B/6TLn34
	 zJkvhmGhh/NOeEQsvdk+E3x7O+AHAkL8+RN8xc7szkujpnN9BoMqqcZd/XQqgBlNiAyvi
	 xCHiKxe9rEEg5Can6BCclcdZE6FluNClGlKFw2otKRgdOHpMkd79xm4t2itOVRARwLOGB
	 QTorQUtoz5O+LFTrDat2rfsAPNNtgH7wbULcW7nFYKYkfivhYy32ggBljhq4hnHEsrJok
	 ci0wOvd/Yfyp1V3h79wn9MFTY83QIWgdMby9cP/sigV7vfszXAjO9MTXEyYUpm+LkxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="TdzD+GO/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VtW0JMYd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8F0606A32A
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:50:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F8F0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TdzD+GO/;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VtW0JMYd
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mBV22121024
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bia8k3E0+Fi7EKvRHW2oHQSwTE7OqUkyuc0dBUGcvBA=; b=TdzD+GO/kXtb5DDk
	iiQ8TAlSDmVWjIjqcfdRUXCclCB3/n6dN3v6J1wHiXZcKBIlGD0baCQlN+U8h/4Q
	DLM5iABHb5NAAG26K5wjYjAwLg+/V60Zu8OpYT4AXkyUGKP+XeRb/YRIrZPT+hqI
	LLRKGtSkpPhG0vZAvIkSGd8gqMZw0PV2j1iUyUt6WlwkUrsMx/B5/7wTSbdGrGug
	Z8p9OmqvJC3GS2f2AnRfdSsVuRwmeDmMYcJwiyNRKNsfgmzX0uebiPizxtoYwwck
	pGNByZ8epYMbMYsni8A2b8kM2rYLiLNzynfvCCQkK3Eka/E4c6+qmSSqcTKq4Dkf
	OBfbxQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vukreuw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:50:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53630cded29so18124761cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 02:50:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795603845; x=1796208645; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bia8k3E0+Fi7EKvRHW2oHQSwTE7OqUkyuc0dBUGcvBA=;
        b=VtW0JMYdhB4CPTEjJxalIy/04+DknY32XYeuFaddw2D45qYwslnM4VzxCXfVP7MXhi
         Qqj6rQScbCwOF8BP24mwvUA5Bf/uCPFDbuGYJJk/gR//dpOytfUiHQIN+u8KPmygDqzr
         ZbQhRuQB8lRPwwnpfHsfr/Nsoub0c2+/QTF7FD7ZHIhBhc0g7MCi3vO+CzVvf+dCTSzA
         1gyGsuM3gf+3CxOjkZXoDVwBUZDAuNsqkPF6+SrPpqw+bNR3u4VZti9gR59Qmt1D4JJl
         FaJJn6dYJHbJzFbXz5e0et6VLxV4sgdBa7rM39RTyN2HtCySm9uwX9ugtuU4FTZiX3fH
         oyzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603845; x=1796208645;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bia8k3E0+Fi7EKvRHW2oHQSwTE7OqUkyuc0dBUGcvBA=;
        b=WEPD8e870+WyZPOq9erkCy7ZbRX/7MurdNzxewLWkHbxGlMzDgJzelkHEWfYE1ZZGD
         ZAiBAe5MlyXo0FGnCaeInaypqwCX0ONGFY22h9AnFPxZevJaOM1R2xfdMS0ddzrNq41Y
         LQaCOwS8RScpLDw+U3i0HPeXqMbPduj+M6OIB9NRVUNR4bh0ZY76PGKNxfSq0yptdZQV
         uFmuP7KR1g27o6TW2CZOo13ZzZBBmyrw69sEBgq7bNGwUmaq3hrP3bHTqhzU+jDHcW4T
         2oKWXnyXOpvyL6x3s4IJ34r4Lp/iuNL0oE9MFzimaeI30VuVEX+dR9sKjbVxPgK87Eb3
         Jwfg==
X-Gm-Message-State: APuU4Z9J2fR6wuP07dznr4WfGZpScXMbk8oLxomTiK5OA8EYtwQMk2vl
	bTBXWF5pFUUGIaCYmvQ7w9KEM8+3Aw0Gpmbdfj0q0cTM75ZgL7W8oFHr4QxKXAc1NzJ0QjgJts5
	HbHwL4BF8PjTwdeIgsCrgioxcUY9cQ3KD+uNOh7fnyXLEUtAYkhfFSs8WUneFMxMpfqrv
X-Gm-Gg: AZFdTZesejaLzLsrUVOykeccYrBknbvZ2ki6923dR5C5AHkOavKBGyDgLK0rFqegTpY
	xodWFnAjpiEjOc/9tw+ozKMaGLALrQcX0Is5fnn/nTfO0L0nqhkLdlGbeoBmnXTvNt15hQ16/9z
	1BVZiY+QEI5ZtFRExy3plwzxpgWe0DMT1ilkQROcPF0plpZIThQDU4F0uZhF0bKLdD3Glwzv2Tj
	2IHd3463KEcpr5JBr4kp+cVqB6H1NaL6crwjPr5U4NXUGw2l1h0Mgrz7C1hCj2QOfvPBRR41c/o
	sEh0VM+51Gsh9xhJLKRg0EKAAxV8DvERdNTTM0Tg95KQEnQas60yToF7OUwq/gOYFV4v8xCRSVT
	6yzOL2ol/MMvEqhM0sasSQ2c1TpRa0KGDNE8LIDDIhD6OjxNZIBXhRcs4MvW2iPZFArnXq/Q=
X-Received: by 2002:a05:622b:1ca:20b0:55c:2657:9cb8 with SMTP id d75a77b69052e-55d76b1a306mr308082501cf.5.1795603844979;
        Wed, 25 Nov 2026 02:50:44 -0800 (PST)
X-Received: by 2002:a05:622b:1ca:20b0:55c:2657:9cb8 with SMTP id d75a77b69052e-55d76b1a306mr308082051cf.5.1795603844557;
        Wed, 25 Nov 2026 02:50:44 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513afe85ecsm617406766b.70.2026.11.25.02.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:50:43 -0800 (PST)
Message-ID: <2e7662c5-d025-4186-977a-a011a66c582a@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:50:41 +0100
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
Subject: Re: [PATCH 07/11] pinctrl: qcom: maili: mark egpio as a GPIO pin
 function
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
 <20261124-qcom-pinctrl-egpio-v1-7-34f2c06b2658@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-pinctrl-egpio-v1-7-34f2c06b2658@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KfVHIgYD c=1 sm=1 tr=0 ts=6b06bd85 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=AUjckUqZSjTMZ1qE35IA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: wOU7qk9yACJn3mkKe_r7Q1x7Q8UpX6uw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MyBTYWx0ZWRfX+ziWr9bPzP2g
 JdVCS3DZQvt05c7DArwq/NwtgoRCgmpRoT2UmgIRyULqE+XTz+q1ev9p7XNtj4q5TgWdc1i1Di9
 6IYuH+67mNxQHx+mVPhCEZmxl1/OBy8=
X-Proofpoint-GUID: wOU7qk9yACJn3mkKe_r7Q1x7Q8UpX6uw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MyBTYWx0ZWRfX5QndI6Z3gYDF
 UZ6b+OqXfgVH501p96GlkbnSNp4PK7hDhXnSfagGdw6hdT6LR15sfs3g/mmzRrolEo099vP49Nz
 S1Q7wxA2oxbxmzJeeEY+78kj0JvP0CMGGOdc3M72dG3Z8IaYQx24bS8cvJi5eqMSv9CwvOoT9Qj
 hOse6JepcNLALovsUpHWze0A0Kf/x+q+npmjlpv90xF34caSnxhvgYYV3pIrtLHXsHYgBUqE/Sw
 3cZrGr4W9PLePHakMjpCYGRCSnOtdlFcGBR0riMKJbXt+xWrgTF8vxONpV2kbyvzz4XAweTE7xR
 RSkLLI5AbF6l7DQsW9KifJAyMnQDej1+bcyvdJiM8evA5O+5gEgHXLm+Anzqf6cxbDRzBMiJAH+
 D6BTyJsk2DzlhopYhbhtL/H+DZLCpCgbdEj0NV6GOXtVMemSDw1FJigsEUkmFA+3NzomQxt0Sgw
 rc5pNnsC0fIbPsi4kBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250043

On 11/24/26 3:29 PM, Bartosz Golaszewski wrote:
> The egpio function in the maili driver is registered as a strict pin
> function. With strict pinmux, a pin muxed to egpio cannot then be
> requested as a GPIO.
> 
> Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
> be used as a GPIO.
> 
> Fixes: 251b53103a2e ("pinctrl: qcom: Add the tlmm driver for Maili platform")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
