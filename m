Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792586886;
	b=XRs5pFGlwWLD5S+owRY1zy0JzGKZuVJ0SOAoSoM92wUcMojTRH+ZaOA6d3ZmvhB5xABy
	 aHnpUNo3TIx5icW1dQHeK+V99hJWzWJf7OI6TdMi+bTM9GA/84tZNpwG+DYaDIeqIpQ0H
	 zNlp8StGrSN273qfmnrXigX/tMb/cbgi1F+4lTZArWKGooYFfhxY6tgDaMAiLm3dPfiTC
	 Oo09QI9D9BJRkaXp8sr3+hkNSOuoK1DSOtFz60dVjaMGanX7Y8uN2f8uzJRBqvyTbTUqL
	 x9UVVHvpWdbj2oMeaZBACHoIpur9CkVaBaOcE6BuSMT3KXvERIDyWRStR6WS8nZIlow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792586886;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ujKdY+HUMEpJhYBNB/aEMN+ZP7OG7I+LW7uZoMOirTI=;
	b=eh1nsq2O+NhlRJNhTJBjAzbGBJkSS7OL102+tlWBSVWvzn7t/TND+u2EObs77/yimzw0
	 xLWX1JQ8+cBY+hpy1DxGwP5EG1LkNP1dDLb4EF+LI/dYHFLFCJaYBe1jBZwDCLROiEYy0
	 GsxsmCCBrzgcYTWIGkbKTtFVA0y7z9o0TurNeMaoFjuNQr7C9K2NzUNQPhGJonWkp9KNG
	 R0pjUEFkvNscrFeEhgZ6mjy1g8kqXWGJgroSqKklYFL/yzrls4RO1KRYdUj1qLfNgnxbr
	 yyg3ciPtFLce8zrDHB4EUXC96k1DiB40HFVR71WDON9KmUnyJDOdN/tOuVfpmmRowBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ctTKI+hl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lx+wL6lG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD8D606A319
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 12:48:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3FD8D606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ctTKI+hl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Lx+wL6lG
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LBg3Ja3830124
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 12:48:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ujKdY+HUMEpJhYBNB/aEMN+ZP7OG7I+LW7uZoMOirTI=; b=ctTKI+hlGosXLyS6
	qDExNv/VnhDYpf9ptalnk6nZQWvob4Wwv8GV4XEWCWSPABtV+Zf/z5fNQOjmXlB1
	193sEQrcFt3CLSbk3mcf0cCAmiJD4z1xmstU/+QEorwwXVLXJhNqhjVkFIR9qJ0W
	mUk78ljm0JWABsefyqKzhcFDupxVvjXjrXgjXOmlqv6yL6mfx1LdRMkVFWLpiYB+
	l39s9hFbfxrYVpjYQG4uECAqkDTk9HXgA4rKq3Sh02KY8nH0ZV9xv4wude/XRbUc
	Ub9xPxVv/c/zjr+4chYbyRxmtavRy+31FUnWB0byyBGk+lnAALTEhlKCPMUjsD8K
	NCmHGg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd4b66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 12:48:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea6b66e53so19104785a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 05:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792586884; x=1793191684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ujKdY+HUMEpJhYBNB/aEMN+ZP7OG7I+LW7uZoMOirTI=;
        b=Lx+wL6lGF6oKjqq67WjvdpuYPy4/DIsgsKSC6+WSqgThe9Iag7PwMATtLVTpkJ18mS
         pLrpONS6nxReDsX46r3wfyfShvw4GICBiR+lMNoy9ws1du2V7LbRZjUP/stOb04FZeEp
         r7TmO5UpjJkFDqmBTFbSQjbT7v+qreR3VCtXVcjGyssOjgA52vGDoqc/KQH5XDUKfVJm
         1iCRb5ALj3+1A45j4Mpik0mVTLSjU4PtKfklFTSgYLqU/l8MJ/i3lfEVHnlzVzm+MWcN
         drM0Qo/5cTM5CjtYT1JVrX2s8MaLvCiYRQre3QIs5y3PosUc1whqh/OE0pHugA53dlp1
         Pzrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792586884; x=1793191684;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ujKdY+HUMEpJhYBNB/aEMN+ZP7OG7I+LW7uZoMOirTI=;
        b=c6/47Q3poSBC6ya/7MvK2Y5a/ftSU8RPCbE/VySgQ3LK41W8eDOE3s1jtZZJU9dGIi
         No2yAmP6BbOX26+7pJ5JBbuiefdv1z+YBUfEbTMi5m11Pa2aB5EFzKC1oEf5zPYnJnif
         7hBUQF4jDVOzTzBiD41vi8trDhFWdAEoWUZ1G+ikFJD8XRdv4z+XPpJlUBBvFnFzdCYc
         dIU0tkJnMgg2h/pvv5D5uuHNXWyTDRMMzaOi8bBC3cHknwr3XX/C3Ulg+oMQg8Ecxx2k
         egRnNU+NIZ2BwXe5AgadW35HCgt73bEJk4v4ioPqaZuXbM3V3cG44Nw97/Wxn2gzvUTC
         eIoA==
X-Forwarded-Encrypted: i=1; AKwUvBzneCakRjVgS8GtUZlr2Amifc6hZT/EvvU1PQCxpm/pvaAcsdA0wsjLvn0C/j2M0vIGA1NUIPtah992CaLJ@vger.kernel.org
X-Gm-Message-State: AFq9FYJ+c2AychpzVK+6pEFubOpIImSj2sZFMsMao7C0vKlry3IdIsKE
	70tftjyANrKSaNa+BTugWgGHFTuGLYG3vkQuzdOyVXvBgdd+sEswE35oje4qHGJEbrzqaNBxrmC
	A+4LDmYcl3/SsEA+iDJaVFpvu6vEoxGr3Q+HAgITfSCeqX77Sr/iNEgqWja2JhATQ4EcV
X-Gm-Gg: AYBFou36zKr8Q6nfyM0RF8S7FNCR1/uIxV51sJC91AyIB/dNdcgBqDzweOIWaX9170U
	fiKuXrYMfS8Q/Dj6digurHrr1HCixybHLcbQk7AcnD1IHBBf/Jwn2S7Xz2fhRgDY+a3hlnHHH28
	caCBMGvNrzqGNDYX7rmVpBRITb6H+tFxLg14QNLlglTZ1bYbLtmbtblDWGlnVBmp9SmR32CO2bP
	0PEhe7Gt5wMD/2tKlDDtvKn63fBpTBTkTfvvT1jvDS/o1P3BhNoFg2tLddL07U4uDWCxQww2PMP
	G/a+A1PjV8sQTiN+PeL1dtTFGehmy9rCgX3k5QMhn1Bx6DXIIvY1A8lb7YALGFz2SYmniuGkojA
	pgm6wVUjPg/WJI/VAQgOPVQ==
X-Received: by 2002:a05:620a:414b:b0:93c:61e0:81ff with SMTP id af79cd13be357-93f57ed211cmr471679185a.1.1792586884206;
        Wed, 21 Oct 2026 05:48:04 -0700 (PDT)
X-Received: by 2002:a05:620a:414b:b0:93c:61e0:81ff with SMTP id af79cd13be357-93f57ed211cmr471671485a.1.1792586883333;
        Wed, 21 Oct 2026 05:48:03 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b40316a2b3sm774673a12.35.2026.10.21.05.48.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 05:48:02 -0700 (PDT)
Message-ID: <74d7c3dc-0880-40a4-b056-f9a089a0ddc4@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 14:47:59 +0200
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
Subject: Re: [PATCH v4 0/2] Add device tree for Acer Swift Go Pro AI
To: Jianfeng Liu <liujianfeng1994@gmail.com>, jactry92@gmail.com
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        kaipeng94@gmail.com, konradybcio@kernel.org, krzk+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, robh@kernel.org,
        krzysztof.kozlowski@oss.qualcomm.com
References: <13181dfa-b92c-43b5-ae12-912abaf79c41@gmail.com>
 <20261013015728.43307-1-liujianfeng1994@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261013015728.43307-1-liujianfeng1994@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1MCBTYWx0ZWRfX59ee1YgAwTbz
 l+h1chb5IJQ1YhK5DcFVkyYd3kw5NhI/IEFh0l5HzQt0jGy7oJ/O0s7ekjHEnm6BhdRX1OTPslx
 pfeMS9NRvvipND6KMYErSxKxrpaGlmcFCTJsuLzVfUTbFHTgkXBwLoqrFNuPlJa5QANqGeRJxVw
 3LeqaiD7EkmhReZ7aQWyHF95dFNMxk+hudjAYtGwkiZHKqlg6XbEnU6XZmTlAofWKbWDbD+EC8H
 uaEzuTI+tEhDDhVkd1ehSnYW1gh7n4Zsrf1f2hnRF+nVt7lOSYqzrr63WunhHXtMW6UFyub86VJ
 bzvn2u2kdtmJSstW6FU34M7yWC9180K+nfeYALe+CFIlSQILkfP17WYBM6F3UYDzgRe3Qdrny6Y
 QbQctOZIYx83m/9B66ZW11ZZ6cw3qDA0SKgbGDjvVG3Q/dETfs1zopF++AyrrvlZ3tLO2hGK2JZ
 APfs6kZPjoBptcZI9kQ==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad8b485 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=tl9W2HV_90ib0x35Y-MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 1brt1P5KUED7XjG9aV_s5ADy57tLUNIB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1MCBTYWx0ZWRfX70GaUlb8zFJH
 vaRbBziP4mXl8w6XY4rS2G9/9Bs4buCEPZlhlpiD0BVpOLT2Sf554AcytrVIcAwiKW6YMjucpEz
 pOf28sEvYmNcfXYNQX+2F4+d2bKs0h4=
X-Proofpoint-GUID: 1brt1P5KUED7XjG9aV_s5ADy57tLUNIB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210050

On 10/13/26 3:57 AM, Jianfeng Liu wrote:
> Hi,
> 
> On Mon, 12 Oct 2026 22:18:13 +0800, Jactry Zeng wrote:
>> I think we are about confusing the product name and the model name here?
>> It is clear that the product name is Acer Swift (aka '非凡' in Chinese) Go 
>> Pro AI; the link to Ubuntu stubble you provided also reveals this somehow.
> I agree the product name / model name distinction is the right frame. It
> turns out we can settle the product name fairly directly, though: if I look
> my machine up on Acer's support site by its SNID, it resolves to
> "Swift SFA14-11" in every region I tried — Japan, US, Australia, UK —
> and on the China support site as well. So within Acer's support database
> the product name is uniformly "Swift SFA14-11", and "非凡 Go Pro AI" was
> only the retail marketing name used on the Chinese storefront, whose page
> has since been taken down. It is not even a China-vs-global split — the
> support identification is the same everywhere.
> 
>> Also, IMHO, I think we can't use 'stable' to describe this situation. As
>> soon as the product is produced, it was given a product/model name;
>> unless Acer renames it, this is it. The vendor can also remove the
>> support page that you referred to sometime in the future, just like they
>> removed the product page; this isn't rare; I think we always shouldn't
>> depend on it.
> I fully agree that web pages are not a sound basis — so I'm happy to drop
> page-based arguments altogether. That leaves the two sources that cannot be
> taken down: the DMI tables provided by the firmware (Product Name:
> SFA14-11, which is also what Windows displays as the model) and the SNID
> label physically on the machine (SFA14-11-QWU1 on my unit). Both are
> model-name only.
> 
> I think the resolution follows from the product/model split itself: the
> model property is human-readable free text, and per the conventions in tree
> (e.g. "Dell XPS 13 9345", "Lenovo ThinkPad T14s Gen 6") it is free to carry
> the marketing name — so something like "Acer Swift Go Pro AI (SFA14-11)"
> works fine there, and users who bought it as 非凡 Go Pro AI can recognize
> their machine by it. The compatible, on the other hand, is the machine
> identifier, and it should correspond to what the firmware reports —
> either the model-only "acer,sfa14-11" (my v1, following the DMI) or family
> + model "acer,swift-sfa14-11" (what the maintainers asked me to use on my
> series). I'd rather not embed a retail marketing name in the compatible.
> I'll leave the final call to the maintainers.

This makes it sound like the retailer made up / confused some names,
let's just go with what the manufacturer says

Konrad
