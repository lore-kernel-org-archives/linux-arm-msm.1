Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398853CAA50
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 12:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476929; cv=none; b=HIWyNIRHw9839aKrM/Aj/czjVhHhUslszFar3iw0/f9g2S6PqnRBT5OKOnVqNLtzrgYzrGDYKD/4AtboGqnC6CQngIeotfJMdqJ2REOrlHqN8sFj4swbnGnGbrt/dwIQiEgAmAbpLvgTWgPs0vfHeiqkX4BzBIzWxtXDoZrxbE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476929; c=relaxed/simple;
	bh=eBuqRI24vD9lYQdJzGI9yYYYHDAzmgfP+d2spgyUCE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ovnm9lfZzLbvCLmU6UzKjFAtQZwEjcO9ZOUFhXsx1tcG1NrL5RyBh1YwGhPVw6PfWZXKNoGcE6ZBgWZkDVQOj4pYIKgbK3sFR1T6Vq8JRhdVgYhZWhkvDlfsCA7/diLoZpIJwMhP+RnjfzA8Vz40qhXZiSL6eeTYUdQhYpVonXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PVO+5lEP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XuwkCcdM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PVO+5lEP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XuwkCcdM"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9h2U72086727
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 12:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r4oI1G/Tvwo9Ye+D1/omQonq92SLREOl8PUl+SUaYyg=; b=PVO+5lEPcrUX73k3
	qJVcygFJF2n6LbU2fBb8YO5youBtQ8EgV4G5/PnY5VtJGH/5lG8u2NzcXdlnxWJk
	MZoeDcPqNNwygsna3I4NsAoxdmJYetCXTI/fXuGv4BTJmD3cWdkZGSaRPjpd/bSe
	HqKPZnq12RkGMQmS5PcOdaXkC5TDXyuueVy4h4oenZA+/wT4zdoe7RKAmei27KRw
	UACC8uhZrtq0dF9+HrKAotgmlcKWaMY1V6f/b054vIsEBuGO6FeCS7i/a9tO5DuD
	f0df5fL/iBsVcv0hu7PDWvZDbFgzcGafIPTaUumQQWBEEVcMjN1g6XEc9rTsavRX
	jfoQuw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq1qp9j4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 12:55:26 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a00c70d28so495429285a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 05:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789476925; x=1790081725; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r4oI1G/Tvwo9Ye+D1/omQonq92SLREOl8PUl+SUaYyg=;
        b=XuwkCcdM1Z+GwiMn1YS6FnO1GeHl1xMqUMcaw4GfSWaL+FM1j9PCwwNZAOfvwqCfaX
         UUMquYTZK9LsdjpJxQ+RgNOS1eqisOlJfUnnyvLm8HZ1Am1rqPFyRznjeWKrmXoZQquS
         a7083MbQ/zvsHy/Hg6/1NXc18Wj9yuSKNU9krDTWu8ERa0n9jNIjMTw5DGWr7f+pqW5o
         q4cKrg1wl2iTt9+fMtWWwdVZVp866gKXbJeavKjza65Yv0mhiA838jBSrb9qX1KXqfiE
         HnjtZbB8lKnk6NkCRiVYCX1Lv7k6QAt+W0/H2YjPrxh3ExVbvCDJNZ4tPSq2GS0OG2gX
         0mMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476925; x=1790081725;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r4oI1G/Tvwo9Ye+D1/omQonq92SLREOl8PUl+SUaYyg=;
        b=SsGkTVDaYD+hjgOBqgCmCUJOmGeU0J1eV/2cEilPmdNWLiFO3v0CPimG/GFFSNLT9u
         D4/9P8O5scrOY3n43MjWk7mz7M9XiMa1GquOyOZ6GkafGfGd3pVhx1/rmj99CK0zCpYG
         wQBqw+3HSTwHrRFrQmLuTY87iPVZaW23nW7bODGrPU45Apu8UX1QAhQLFDl1bZUPfdSx
         l0wLsxBMtaw5Mu66sI1cvPxv+BL1eceDa0/kYqJc5STuJGRJm9NZt/xyw2k3iZpywR2q
         7IpJVKzw4KRHnewhoD2IzVMYnbhjGy2sshTFdIxDZsQyJu4FVVFS1aXgjIUJqgYp6fBP
         JLtg==
X-Forwarded-Encrypted: i=1; AKwUvBzFkQUxkhodkZOO47gI6uRCcDoh7yq12fxib6YYPLEhPZB8Klsv8K9izinOeNRf1QygNdvdVoAdv3G7pjH/@vger.kernel.org
X-Gm-Message-State: AFuF++nC0zZryUY1BDMk+OAxPlQJ2gD0T1wQ3ezHzZbuWiUaPXMgjjAh
	Zb7LsFTBgaDItp04KZF08+bmlzhNuKork58yR1p+PDqJJCIGQaH7Dxa9xlBAC9YVZHmgDj+28Ps
	E7cmkFUl9wfLvIun73hc2s8qZOsHx3MBGRc3PsruxK8KRjolfJqkhQk/bQBk9c9+oViZD
X-Gm-Gg: AYBFou1SFl2DIfMeparC4CrfpHYQX1mNtp0TIEiR5BE8vqfZJqwY9O10ORmeekLVHzn
	/f4TrFXk6E9IXyuSoF5faMwI9RUirwfuufNlisZ0lfJfJDlDwbRZX5YxlA1fSVI1pleJEHAAzK7
	XWATOpNHTyObEHY8yrfIKIHVULj5IACdCkbgjtS4eyuUm/GE16i2DLzBY3tL/X8l1T1Qm5+BMMO
	wBTplBt9G8WfSw+B8Is4Usc8odnO6W+qbIf4ntZdRNsa2EVDrEJJAIrhcLRAQx2AuvJW/JSNZ1Q
	kaC48jXE9p0LgJ19P63eYLjLj0scKGJysx/hX4WCB+zsDYGdfZK3BNVcsjKYgzpZI9rrw8T0pVI
	PnWuPD31oIa4vlkroiBtUip338MqYRFQlq6ZI5IE=
X-Received: by 2002:a05:620a:2556:b0:939:13a7:70f0 with SMTP id af79cd13be357-93a40765af3mr102035985a.5.1789476925510;
        Tue, 15 Sep 2026 05:55:25 -0700 (PDT)
X-Received: by 2002:a05:620a:2556:b0:939:13a7:70f0 with SMTP id af79cd13be357-93a40765af3mr102029085a.5.1789476924914;
        Tue, 15 Sep 2026 05:55:24 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939ecc38105sm1206322785a.4.2026.09.15.05.55.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 05:55:24 -0700 (PDT)
Message-ID: <9ba16818-ae60-49a3-8444-c1056c03c63a@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 18:25:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] ASoC: qcom: lpass-va-macro: Add shikra compatible
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
 <20260910-add_shikra_support-v2-5-fdd2129c696c@oss.qualcomm.com>
 <8acf2491-01f3-49d0-a357-39592ba991dc@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <8acf2491-01f3-49d0-a357-39592ba991dc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE4NyBTYWx0ZWRfX1z7qAAjMyeUr
 DeXPoHa/XtLZUIjTNQ6w94T/ET8Dv1WwftxF2ea/Y0YBNSNbKnoNOb+DtzQNp6zpSepGd7JyGTs
 3ZmsVdxfnIerSZh9M8l44JXAGNEE9Ao=
X-Authority-Analysis: v=2.4 cv=I4Xw19gg c=1 sm=1 tr=0 ts=6aa9403e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=xk92F0r0DzOCDTAHD88A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: FLb0d7Ws2b-XLBs3JZqJroEqyWV-T4Cx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE4NyBTYWx0ZWRfX0jfTN1lCF0Vt
 Vt0NwW2XOvLntNm9Lvc7BaPO/8uXNBrC27QWslaS9JFlJi72R26B804CFVud4y2qegE2Tev3Ndc
 4ohcgUIhPMyg1Ep8Jqn3S4ezoyTUObHm35cZ+rtMiLcLRLJ0orRdOb4KahUCl/ek8LhHQQ9fiYc
 rJYttR0TW5Eve1EZDSleLJSL9F5fRQrNVb3RLjB9Z1jkW3cIN9yQZFQaVsdj3qPQq1ASiOVYFSd
 YC2Y2G8zZ3pIMrX18Dweg4SZEg+W2E3XD7oxyNL/Rr40yS30mEXZS/rSD3IngwjDDV9q2bM+dCA
 3hGMslYV/DDTayj8HE7VYihrHSzDD6z0T0io0ATbh6JtQ6eG5fHizLrXBdFSHtL8tJzcWB7Q4af
 7NXyuZ2efiADUivwXUtL5jN+vj9R+g7sjLqLex6Cv11CVEb2CuC92+Ul4Z+30h/TbD+XDmrZgHr
 dEba0FewVI41e254vXQ==
X-Proofpoint-GUID: FLb0d7Ws2b-XLBs3JZqJroEqyWV-T4Cx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150187



On 9/14/2026 5:17 PM, Srinivas Kandagatla wrote:
> On 9/10/26 10:46 AM, Mohammad Rafi Shaik wrote:
>> Add shikra specific VA macro data and register programming needed by
>> the LPASS codec v4.0 implementation.
>> +static const struct regmap_config va_4_1_regmap_config = {
>> +	.name = "va_macro",
>> +	.reg_bits = 32,
>> +	.val_bits = 32,
>> +	.reg_stride = 4,
>> +	.cache_type = REGCACHE_FLAT,
> 
> Pl use MAPLE here.

Thanks for the suggestion. I will switch to REGCACHE_MAPLE and update it 
in the next revision.

> 
>>   		regmap_update_bits(regmap, CDC_VA_CLK_RST_CTRL_FS_CNT_CONTROL,
>>   				   CDC_VA_FS_CONTROL_EN | CDC_VA_FS_COUNTER_CLR,
>>   				   CDC_VA_FS_CONTROL_EN | CDC_VA_FS_COUNTER_CLR);
>> +
>> +		if (lpass_macro_get_codec_version() >= LPASS_CODEC_VERSION_4_1)
> same comment as in 4/5 patch use a flag.

Ack, Will introduce a flag or switch-case mechanism to handle this 
configuration.

Best Regards,
Rafi.
