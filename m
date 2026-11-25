Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606446;
	b=QpfGeBphxgvOKvvj2IBZl8ERw9dyb0gO+Kbt8weEj9nY4pUWMyCEMSMgDP+QiNGR+qp0
	 l8f7nR7F2SlyYM6Kfo91y34H9D9MbzA70xMQjfDua2l/Smo5JKJgyrDnJi6PvsfzyEFou
	 gIvZuvSldS3sm4rFyH70hkx44J9/OxaLIB/+vBWZzFXor6seNgqal/YDggcM3DAwtOmCp
	 YNzuBok7lu4fTds0hTYX95MTabxm21oDYEvvaBdOgq9WfK4diGQFsGDZh9sxu4vGbdeTr
	 v+qWbEUZsMGLi9SW9OcTapWlFY0KUCVmVzQG+9ZdtKYnF2u11SjqURA3Hqdhyb61QwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606446;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=29w1gzx+mlijXisMhVyMq1DcjkOzJxC3H0X0IhvOXlc=;
	b=JTcpTYlyfrjBfI48vOCs2agh0Dj1hQWZ0k4O4FKF47ebKEqDdE38n5sLnuCfD+guF+tt
	 4APqbIA5I5JCwgv4LzXwvhGw2A/gERiLpXdGlmRu/v2oB29+57o0sW7tBwuoikDGwqY67
	 SxsbMsWBsWjEJ7tbW2Rn42DBxCgXzZtOfWxGdDLOOX0gqK79/n3KUO7DwmE+zUsrBotg4
	 lPyBt7bzqJ4Uz8qwDg/zlzeEGFqyPxPqawSMCTfZsAIf0J/yV7Vcw1D9ebt6JSORKQHhd
	 MkCeBPZtexJlF/1dKLQeYPsQt6EwXXxf03wSnYqqgr71cubTFfNmx7bmxMOLacBpcLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KygF8YWd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WeA7TtPH;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91944606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:34:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91944606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KygF8YWd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WeA7TtPH
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mTia4034159
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:34:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	29w1gzx+mlijXisMhVyMq1DcjkOzJxC3H0X0IhvOXlc=; b=KygF8YWd1LOeBnFz
	agQeX+s2Ds4MplCN/Tfo4biB7fP373X2rU2171awL1QuhFxQJc2JqMnEVhtDo70K
	1n5fvMXP+WZcUO+8atBTKPQcuYodxzBR1U1vek3ZUFful9v6AkFxH2mmJVZHit7e
	ZXP7pKyOqz/M/vuu+QthDsam4roucwyQb3pGjnSEfNl1alw4J31H69C4LsZXz4o/
	crBdqSPHIXrAuPERPWiz8a4ypwUA1vwgVPSlS9PPE3Oyk8S2pQz2CtqPSo3xb/H3
	PT3GlzcKH7AuXcawIDxIj2gs/vGtTV7pZ+dAlJiQkhTHZD/sLiQricf5OAhPqCQ0
	DG3Ggw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mqbjj3q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 11:34:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-55d3ad11f50so7639961cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 03:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795606444; x=1796211244; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=29w1gzx+mlijXisMhVyMq1DcjkOzJxC3H0X0IhvOXlc=;
        b=WeA7TtPHRxQ0G+Xy/somJNID59Z6rMEsnyQBVCjnkCTCh2fB+d7dPM+8iRTxRVQZcD
         /LUoqjDFB+WM5ZT4Cji4shWsjSlInzB0KlwRhigLBCtY4hUcU3HX/Cv9NuUcFir87nvx
         MhGfOYcijLSyvHpElOcl7SWiyZe88uccwckEq9Km/FRcxDL3aN9NhzysTgkYKT0mNlFN
         ZbfFolaiJwLuA2rU2mq94wPf09Iqhq68eY+1AtXXcSF7UQXm58OU38xoKB3BRGco0Teu
         MstdaJz2HezJaKDdQp0SGKhr1EHv3We8ZE7Re/3wuykbnDbWeR8c5BaAS3sQaExV9aGy
         DXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606444; x=1796211244;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=29w1gzx+mlijXisMhVyMq1DcjkOzJxC3H0X0IhvOXlc=;
        b=wn+06Q3asT/VHwRvPolO5TJYg0B3pWv6WFQEcns30ewHxBoAygZgftLb5fCDl4NCIC
         AjrxFDYlQv+AIv0AZWRBPyr32E9b5Q3RxgXbd4oMy8D9L3JdUThJQVPxRBM3rzDr52oQ
         qrLNQT/ENE9oycH4M80wYHPmAZrx4iO9xs/WaMG2EyjUW2/5o5iWrV32cKM/p1zKY2Z+
         O1gyDAtmRK4piAY+rl5zuIoLl3pBxBzP+UbDFXhPOMphvfK1au/PxWcuPSYKW8/jXVY0
         qKoPRmmejvzUeUHxpouL5tHHPRmgSUgcu2qINLOSfzlJFrrGfR4vRRv177BiUu3Q6ccF
         WguQ==
X-Gm-Message-State: APuU4Z/dQINeGMpAMLtwRLrwCByewpV6Fu5Jr+HDCcrLbUU/KSY3q0vv
	YI1yB9uzY4ZIKRGfO1CAR1w9DslLolPMnArwPs1p1S6NzBm+Peelm7PnAWJ1UCDpahc2ammbS77
	QLewOVfTBvP8zjmypnAsvgQCKvI7gi6e8aQ6nFdn2ZU2KYSDm9/CJemCF/8n+axbFgkD33e/TNk
	Gt
X-Gm-Gg: AZFdTZcj42pNeWXLwS9mPOez/UNz6ARd4jaiQvmNxO2pT59yLUP2crz9nZdpEPcl/li
	QajsiFrnGPwrz7Zs5cd3WOWqVmzSix0tP8AGujcqR+CqHXgmz4kbq0PGNitHEKU5Yz5sIgwCRYO
	tC97sManCuYCUogdg+zg8joXKx6HlhbRuLas9ugudyFAPeYKx22GN88uLoBt6URWzVoazjKtG47
	PSZnh6LsJNsF7JYbLSgxOZOSbBvXfBH7wp0WyaR/9blvu136G1B8Lvlf4/cL4HGeLHuf76HhkmW
	Bk7KlZq5A2eM7kJpW7vIVhU/9pHHKRWaNsjvyZmSCU2RRDXjOG6BusznHafEu16hrXuc7dpA9y4
	8Ku0LAsNNV99V/bwZi96YcLf2Wz/R414Pk9BAyPUZC2YkXRwUTgA5I+eL+TzxgrRKLdjmD6s=
X-Received: by 2002:a05:622a:e2cc:10b0:535:f9db:3b86 with SMTP id d75a77b69052e-55d769f824dmr295532491cf.3.1795606443829;
        Wed, 25 Nov 2026 03:34:03 -0800 (PST)
X-Received: by 2002:a05:622a:e2cc:10b0:535:f9db:3b86 with SMTP id d75a77b69052e-55d769f824dmr295531901cf.3.1795606443307;
        Wed, 25 Nov 2026 03:34:03 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae68788sm621435066b.29.2026.11.25.03.34.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:34:02 -0800 (PST)
Message-ID: <862d4e46-8999-4b26-8bc8-f7a3a82f66fe@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 12:34:00 +0100
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
Subject: Re: [PATCH 11/11] pinctrl: qcom: sm8550: add the egpio function
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
 <20261124-qcom-pinctrl-egpio-v1-11-34f2c06b2658@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-pinctrl-egpio-v1-11-34f2c06b2658@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0NSBTYWx0ZWRfX/ziheZqyFIEA
 TLY7i7eoFRDgLmaGSKSuGLeh7zJoze9YvFqx0BNjKlVBsKqFJul5AyYM807vYLsMfoKT5kajsHU
 Hg4SEPjT6pJyyvlWxxXhlgvez/s87kE=
X-Authority-Analysis: v=2.4 cv=Bb9NQbt2 c=1 sm=1 tr=0 ts=6b06c7ac cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=JjaA4w47dj37y3qDwwgA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0NSBTYWx0ZWRfX7tF+04FjExQK
 LY2Ll2woWT6Pk3qyQ+7HWneeqfqoXZywYC1ARyueIEf6oKrVv2uPICF4725yMkCHn0mxSawFTSy
 /cVgh3QCwHbXuIwkgHY5POrrj1QadfNExZs6/MBmtGiBIUyMb6l8QNqLMMOTC9y9NItB7pp8Y7V
 VhDTFKJgOSjIEr8CCPpjoIqPTRLonbNEHjVuiWhkLdhdPvHanB6q8XfNmOQRsblT9PzxyRkmp9Q
 nxBxiuzr50tKYyd/BEffeJ4jCNK1azqctpkwfK4BCzE8v4hjonl3HjB0Q1dczXnN+/x66Usip+F
 1aT3PZ0ebUnO85QUaij2J0ue7Ocia1BRthMYh44uIW1jI1Cve7H7juiI/oCE74RyWqowQ5OvCOU
 zp9tRQepbsBDGUOsPXk+t7W7EXH7Sz+6JMqKhPJsLC0tqZzDRD62Z7ZouObP03JG1rZ/OBDth/Q
 e22iZk5E5gTUzd2Od0A==
X-Proofpoint-ORIG-GUID: _YM89_nD_bAOkSDJMRck-sGh7knNovCm
X-Proofpoint-GUID: _YM89_nD_bAOkSDJMRck-sGh7knNovCm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250045

On 11/24/26 3:29 PM, Bartosz Golaszewski wrote:
> The sm8550 driver sets .egpio_func but never defines the egpio function.
> Once muxed by the APSS TLMM, an egpio-capable pin can never be handed
> back to the LPASS or SSC island.
> 
> Add the egpio function for GPIO 120 and GPIOs 165-209.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
