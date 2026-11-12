Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794491347;
	b=UmXbn24kLVBoWdCnzzNmW7cqdFUX26YIH2wfuurMssKzqgkV0Udvup7ay0TChKZps3lw
	 sjyeJyGSbfnxjmHT5Hjo3AgSzB6f2qmHxtkOX4Q6+VejWRRaEjxco93/HN22TVJef/LD3
	 vazTqqi0cIjpaYDVZS3i2GzeFXy+KrG6lrzmoJVDr70G4Va+ll32K1ncYYUTfH+Nx/A9c
	 KPfR3Nc5fAVgPVVlKj3vfdLkCNOWDkVJRjGKrMi9Fsy5oyIN7b6KkFmGCqvHXSXJj3NFw
	 9NH+irk7rYjmoGCGCYn2bMcRg4nrFoWJYiim7wruZWwkPRVON0XW4K2F0jdAU40lj8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794491347;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3hXQZENuSxu9iFWGQOgWQMyHyL4PYXASjhi5T5DYXmo=;
	b=fNEJwuqre22Ilp3SuCR5E4BlOrKzl8maiq16S6Qp5ydkBzvQRYyW7jf7gqKs5t18frps
	 QYRSJDkb2Xe8ddmyLo4L+2I6aFcp/HNr3Y3OoFF8TumblIi/tfR74oyRHnuJ36gfTP4ur
	 zKzPjYSUCGdQ1w3PNfNDoXPnNz0Nbl4AJjQkyaoMke5htfhuzYpa6OYwxF2huuOADoqse
	 qXy9/K506wUAf0imt43HKB3eELMN0x8KzTku69MqXLTf/6lWdBxhlmIM3XHkagACCNU2u
	 iWN8c9MYLdmrqVcBmrVRYYWXzfSl8IdTj/iiZ9CBvifMaw1Wr3H96DmM5iXiTbwgVAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dS9ADkxb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="LB/XrMTV";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D894F606A334
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 13:49:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D894F606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dS9ADkxb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LB/XrMTV
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9Nefb2514376
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 13:49:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3hXQZENuSxu9iFWGQOgWQMyHyL4PYXASjhi5T5DYXmo=; b=dS9ADkxb/Kfrsqbq
	kcV7+R5mEVT1gMPTFpALmOlGY+TRXp0Y6aTe3royqRmSFs++2bvUIRJEfwho88sr
	P78psjoAlCnf2p6/FJwQ5p9/GZFRCAt3tz7rQvtbs1jlXaqd/EdhAKRoUM4Q7W+v
	ITiQ+3WrMPGFofw2UQtRSkWg1swqsBtkcGn2Qb2Yghny+OipKvvsaC7rsXotkAch
	9Joi6OWaY+kA55TfWUGDkExP1TAJm7yi2IfKIP5l4h8qLSnv5ruSl0iQR1RArp8i
	v+c3mUnhAlBzsqYWtuL/Ece7rVZFnJOAg0qh+w1mF8+lHe+5XYVvSfZvA9FWnFOq
	Co/2cQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvwm1utfj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 13:49:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so906694085a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 05:49:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794491345; x=1795096145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3hXQZENuSxu9iFWGQOgWQMyHyL4PYXASjhi5T5DYXmo=;
        b=LB/XrMTVAom6eiU4jL+d6VIQK88Sd0mAAKGHBIbEb+L8PX0H4E2ahkdB6YuMLmKwlR
         SSRGEjGhC0AzfcWCy2YPKIfJakX15K85/YxKuq0GohCJA4PITS16QYbvGK1341tOApef
         m+GwpU3i1Q7h2HJAmaf7YyWXJ8CoM+BunMyEEYAwrCmrcFxf5OHC3HzJyJj0spL/dWmR
         T9hDrluoh1T9+d45jOH6pZXZ1AkR3/hkS/YFP4P9WF3GdLZ2Igmd0xOoCwONT11BAh+w
         nIEKRv00eRl6EQV2o3JLAusZrt4mjj6qjFnzDuQRdFSaKNSNN16AANDcu0VkaxiUC9yB
         fPQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794491345; x=1795096145;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3hXQZENuSxu9iFWGQOgWQMyHyL4PYXASjhi5T5DYXmo=;
        b=cniBgK3TyJpHDuVP1dGzqUyUr9L2Vb4uPs2yawsLGZFj+xJfHZrGlq2WYcZfcZpg16
         X3EV/TMsPNVVNyNvUfEHUDgXHdD8vz72LiqLk11XDu+iw8VlCp5kCeGHaAFGlB2rU9hn
         Jf+pjUBTOiaDc3JBCiJaHhzdf3lwSt0yx+QY2kC0mi0Fvc2OQieCYHYDO7kTXhFQDogC
         lV0YJWPBAY/vCtevzdKQaR7/Bv3V8EWs8k9i1z941/ZzhwEXcs/ZtB6dKcJpSHDRjSMr
         9j6OUSH8fJ2yq2MPyjb4MzVy6qCsdRSn39chHxfs6vpMlmrJi2gnVglNzz8l/UJkyJ/2
         cRpg==
X-Forwarded-Encrypted: i=1; AL+hErHmDjY3Krmn0egVEyFA8q3aisJe+E9RRTfx5h56c6G5qc6qquXFCIRrhlPNNSC6oeAsPEfMv0sNNQkrACpV@vger.kernel.org
X-Gm-Message-State: APuU4Z9L/DBVDrvPo9ZdB16z8Pqb2lz3WXgkba3rLRrXjjULB4+hiy1o
	vF5vjw43KSPOBKEGh5EH8gNIU+e2i44JDYFGvSUsNanVCKQgYxvB+E6kf4j/09gdpmhPqAKNI8J
	Ze9ArZwBS9t9Psk8+hMnmnoAcc4wCh1WFDVZFL0DmWSWaUTGl0MAjlfQcFBRkY38yK6UG
X-Gm-Gg: AYBFou2qHxtat66ShNlsBDH7HgBatCgkhkPxdXBnYsea1csGQbb79QsPRvoj/+7Gn5j
	Qf5T94dMhFO0x6ZfWltD3Kq5TU/8Qp6gO6cx2DUFRfizfqbalj438wHe5qMGuq12/LYqaJlwNqM
	R5sq5o8LgX9vvRrq8UmqGDOvaCVHM/ItevnvoAp2URqWvpZY+REVJSMO9nAZ8DnOVyLNB/awm5L
	uDk6nh7xnB6o8REa6o5weG31TQzh/FHQLgcvxEPeIPq0Ztv167mp+eiS8B97zVQH0ZGZ7sUj3R3
	H6tftx2Rv4xzu6I3PgdPJXwlaXIMn6KDFsT9rn4jHRPrhDIYTwf5TDbxph3txmBNaoMGD8Wbka8
	aausI1oxnAsAVAL85K7XywguXr9a3SWuW9FPUDvubI/TwhqTQ/y5pXUYEPn05i/OnrXuJCYQK9O
	/Ogcs=
X-Received: by 2002:a05:620a:450c:b0:93e:623d:99ec with SMTP id af79cd13be357-947affe663fmr964783485a.13.1794491344743;
        Thu, 12 Nov 2026 05:49:04 -0800 (PST)
X-Received: by 2002:a05:620a:450c:b0:93e:623d:99ec with SMTP id af79cd13be357-947affe663fmr964779285a.13.1794491344206;
        Thu, 12 Nov 2026 05:49:04 -0800 (PST)
Received: from [10.218.50.86] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae196cc72fsm10673721fa.13.2026.11.12.05.48.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 05:49:03 -0800 (PST)
Message-ID: <b1b753ac-cb74-4b9c-8fd0-31777a020878@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 19:18:53 +0530
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
Subject: Re: [PATCH 4/6] soc: qcom: geni-se: Define the QSPI firmware protocol
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Frank Li <Frank.Li@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        dmaengine@vger.kernel.org, devicetree@vger.kernel.org
References: <20261106-qspi_upstream_series-v1-0-21f43042dd60@oss.qualcomm.com>
 <20261106-qspi_upstream_series-v1-4-21f43042dd60@oss.qualcomm.com>
 <20261109-stimulating-oyster-of-respect-620b7b@quoll>
 <61646f06-87f1-48da-9b88-8898bb488af7@oss.qualcomm.com>
 <20261111-prudent-polite-shoebill-add35c@quoll>
Content-Language: en-US
From: Jyothi Kumar Seerapu <jyothi.seerapu@oss.qualcomm.com>
In-Reply-To: <20261111-prudent-polite-shoebill-add35c@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KsnYSmWN c=1 sm=1 tr=0 ts=6af5c3d2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=DN1OgqIxCIglqtzaC5MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: wVziFCQ5dCD6Z9VEkRgADaO40uWqMnvx
X-Proofpoint-ORIG-GUID: wVziFCQ5dCD6Z9VEkRgADaO40uWqMnvx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfXwpl4Pt2SoYPK
 pPp0H6sz+/4M5P5vDZ8huTm1i4CDfVYp1xBaoeGqz39n3RFwoko3GuXq9QjAvAb/AVf/UsHCR99
 81Gt+nWhu4pnTgzWENnquA1wn0743jdAyiak72po7RVDgEUD+pbNR+VAZ8rqhsngVCtFuUVi1qH
 wUzMzG6v7MX3tUqxKGErK4XaRMQYy6LE16K6hWf6AMVELcrHYXblgZpLwOpmGcwzFAeYcZ6nW1x
 1Nyl7/3XeyqZkUf6hJ6USh1Nti3xXwkq4GAY6New06wzRFwMDz5uev8BpXDH2cU85YQNWv5SPWd
 cHlGo4feNtMIPyFzyUSDXjrHmHu6fnp42rR9qjwqxXgGFqAF7NWh1hULEy/lz497DZOl5nc+rtt
 T4szkJAZO43DqqkcWEY7W5x6V8Sn66wQcU+GwmkxbisVKGtJZT4AlObStRoPHtHE6GEa2ohp176
 46HDY5gFzD9tXwSGBkg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NCBTYWx0ZWRfX5PDK3ksr/Ipo
 EiOO/pwdM68pSA5GYYdJScOAjwm3XNmcruH9FjdMPPA5QDpwi6SFv9RACWl0iiTQqo8/zjXGHoS
 a+dh9aPx5S7o18qMXHr/b/MwtbVwvvg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120054



On 11/11/2026 6:10 PM, Krzysztof Kozlowski wrote:
> On Mon, Nov 09, 2026 at 08:13:33PM +0530, Jyothi Kumar Seerapu wrote:
>>>> -static const char * const protocol_name[] = { "None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE" };
>>>> +static const char * const protocol_name[] = {
>>>> +	"None", "SPI", "UART", "I2C", "I3C", "SPI SLAVE",
>>>> +	[GENI_SE_QSPI] = "QSPI",
>>>
>>> Why are you creating holes in this array?
>>
>> Hi Krzysztof,
>> The array is indexed by the GENI protocol ID. QSPI uses ID 9, while the
>> existing entries cover IDs 0–5, so the designated initializer leaves entries
>> 6–8 empty.
>> The added NULL check rejects these unused entries before accessing the
>> protocol name. Appending "QSPI" directly would incorrectly associate it with
>> ID 6.
> 
> And it should be 6. Just look at uses of this.

Hi Krzysztof,

The QUP Hardware Programming Guide assigns protocol ID 9 to QSPI.
This enum represents the serial engine's protocol IDs,
rather than consecutive indices for the name table.

The SPI/QSPI driver uses this ID to request the appropriate firmware
and validate the protocol read from GENI_FW_REVISION_RO. The firmware
loader also matches this ID against the firmware header's protocol
field. Changing QSPI to 6 would make these checks expect a different
protocol ID.

The name table therefore needs the QSPI entry at index 9. I will
clarify this requirement in the commit description.

Thanks,
JyothiKumar>
> Best regards,
> Krzysztof

