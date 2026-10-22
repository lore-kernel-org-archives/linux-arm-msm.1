Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792676792;
	b=LqGYv6AuU/YniVte1n3PjQ6Q0c+jOWOBJzHyIY27ErmTFY7+iR8O2c/TzzoqM8pVbR+M
	 u4T5bKEphNED/L+ES8EkSccXrg+Rqd5vhadoTmx7dV2Z5NjIYHZmKlex7H4ZH80Wg3FsD
	 hj01qoSQRI8soPut8tUgvEC0HXzcNSUC48Z0R6y2kJ/gMFpHF5fgLI1cWnUxQa8EWHkqF
	 Qj2S5kwXVze4R9srCidOq/Kv2jmF5v5GXpsyj4cwmC3OlPmxZYrRaJEQNyq5gE/JR7scw
	 JZUUxbiyURKxbBIyQLsNLKAvOahxYE6Eo9J1pukP6i22J2i+5ViFYWYlLhTfA/OA9bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792676792;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=u3Gda1su23Ey/hn0j+qLFhPL93ioEvm9bzh55nNkACg=;
	b=Ly3QOJr6/L2WBIPgOsKh6sCkA59IfOF6OYU0TG4WnwMVoKAQaPmrTIjRWrZaJIPc8ogf
	 2pGoQGcHgOvqdSUcqxo4g292qcjA/p5hVt761CSVBI+KnXkQmPqdjp4x7Io7/Z6U/+KR2
	 pWKYatCFPe8vDxCnK/yhkupKTMLAeCDq4pwvD1BaYou3SwrRsONAOyLN1hAjvzVTJNpOQ
	 oCHWYKBLI69mcrn5mz4z03bK22CpKouKNbhXI0MXbw/Imh9xyReX87bmydYLTjJqSAJdj
	 ogYdI9TU7gtpvPqULV4fZ2zQJxCPGUbsL+bhjwgPrXZD0+t8g3sznZh52ZrbQNGgfrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TnHyVIPb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QlIU8GpW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE378606AF46
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 13:46:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE378606AF46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TnHyVIPb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QlIU8GpW
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA02372574428
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 13:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u3Gda1su23Ey/hn0j+qLFhPL93ioEvm9bzh55nNkACg=; b=TnHyVIPbHvd9bZx9
	pBvv263KXsQOS18ga59I/Jz5ZtK3f5TMDysjv3rvSWUl+HE6SsMciXn1Nv+sFP3V
	7D2eHHujZhMNyt2ymsESg5STQO7tSsTFWGgN64quCzc5uYDQ93kJczMFRppyReth
	Wa6Hcb1EqoSoosP31bU9p/SyQM4S7d8vz1y6FOyHPDmE8cvJyYZfbH1lsJzvA5aR
	ei83ABHUOK0qKVyerIVaZ7hP+Zs/ccB2eW/pGsuZAoja6q7iEIJ7eqjqjqpyicet
	Qfln1gaAoSb6+EdWUTNmMgfQ9bLKgFfnkVOcYmjV9lOpAV7bNpnJmrGBcVrJwG/E
	hohGxw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93aktnq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 13:46:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e58614290so40859885a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 06:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792676789; x=1793281589; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u3Gda1su23Ey/hn0j+qLFhPL93ioEvm9bzh55nNkACg=;
        b=QlIU8GpWYU7VsTIhBIZLgldpB20lZjm3hmu81j1hvA/N0L26HADj077t/y0hKVQc6w
         t8j9sBR4sP19Z3Uv3QwJ7nFEtHZ5Sb+8mZKy5pGNtffBNoTw3hoCTES5zgczvLeXam5c
         bO0Kn51ZFD715Qh7/XbVO1XAMZa5/a4rinpTmtqRLW96+iiNw+51T4dKgDduVgrHPMFt
         1TvntNThYW5Bh7wDGfkRhCt8+piDca8s8fCMUDkYsd1GKr6BYvkIK7SZ1sIrPSDCOFqE
         SIkPBfGd6mOYN2fjs7owQFmpjZn3j6bbzbO5fFKJadJdgcUjG+KgUjKbVqdJ4+Fdxh70
         Ltbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792676789; x=1793281589;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u3Gda1su23Ey/hn0j+qLFhPL93ioEvm9bzh55nNkACg=;
        b=sfs/w3aZvy4hne9b9+6MN9Zr/DKZUVBzzhcVDEFwteLqzxXgBoJ4Hi0acEaurhCJYl
         fULIEhXAjuzOt32mlMTYSrH1Fzn1yEsBMcRWTPc8QJ4pC4dwAqiF6KdRFFjAygkJFL6c
         E79mO9SF+lUeoWa+nP335ji1ppThSlSAR1jF7dMdUhVkONUoKUprYbAbl9tMiKKN0xu0
         hgWZ8pd6FlMqTqBRnhgptHCTNBgj1CEM9PDSXLMec5HwSYdvoEIwjAkDhEnuMZiiZoPs
         6i75zk9+FZ8QzNPM8vkrdtc3Le/JNPhdKS4fJruDY+A4k7sURnKj7a2yWEn1Hx3goIEo
         KKAg==
X-Forwarded-Encrypted: i=1; AKwUvBx12HnAgXGVQuZdrJGzHOabQDGbZRoxvLyGhknkuszRrO+NV6yPXNlYIdIa3fe+o2zuL4DHV2DIrUBPgl9d@vger.kernel.org
X-Gm-Message-State: AFq9FYJexLvSgrJKiZ9/eLNRu/fShWjJlnAX/hxpIOFEt1+eLqIKvaYC
	94BRD73esoHwaittms9BUbyINTwYpbmRdaFUBuisH3BbTKMqTkhKz/3M2/gy+VYVM3hxgifIpYR
	FpBbvAeyNlFiyXFPwvvgjUkDV0WqGyXgHvzFzc6wGimuOO0ObDvAgrCPGfObBK/ugr7Dn
X-Gm-Gg: AYBFou2FHD5MfGBHW/4Ii5itqCw6JOXNVUPprlhaLR+5zRj3TdcCLABjBuTNdF71pln
	6K8r0qHdimFwqXDz18NGJ46JyZUh/15DUxUAKhGUhUVOO4gDWOBpkvZ9etlOcjl5jln1S4FqXc7
	oCAOKFOtpdr0eoGzItP83/IvtBP+8/c8qcn5l2OPJDhOsTPpmmiCFNmahWJIsezYmIobQDNod3t
	yTrhrEJSAdl/kUsoS+7KC6Aw3jA9SEV66b7mVrWFzKZd6AKvHi+c/gotKmaNy/y3niP/CGNWOtY
	BbkE1H6hXE2w2RDeBJ/zEK4TDFepIJfeEqFnEKyc+gNaJ9871wNE80Je6DKQShrRVe5JIVhAlpj
	hpfjePCOh8lKKZtM9acimNQ==
X-Received: by 2002:a05:620a:2852:b0:93a:1312:ff19 with SMTP id af79cd13be357-93f57fd982amr1113276085a.5.1792676788811;
        Thu, 22 Oct 2026 06:46:28 -0700 (PDT)
X-Received: by 2002:a05:620a:2852:b0:93a:1312:ff19 with SMTP id af79cd13be357-93f57fd982amr1113270585a.5.1792676788371;
        Thu, 22 Oct 2026 06:46:28 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a56082csm106605366b.40.2026.10.22.06.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 06:46:27 -0700 (PDT)
Message-ID: <a7114c6a-2ce4-4e16-8911-d5459d4bb362@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 15:46:19 +0200
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
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8916-samsung-j5: Add proximity
 sensor
To: "chr[]" <chris@rudorff.com>, Linus Walleij <linusw@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261016-iio-light-gp2ap002-v1-0-7c93312fa8d5@rudorff.com>
 <20261016-iio-light-gp2ap002-v1-3-7c93312fa8d5@rudorff.com>
 <5531e454-0d84-48f2-af0d-1ab34c149760@oss.qualcomm.com>
 <2b091dc3-9588-4042-8908-2fc3adba6cf5@rudorff.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <2b091dc3-9588-4042-8908-2fc3adba6cf5@rudorff.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5Jb3XM4THepirW8c3eEpZs_zc-WFZ4Dm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1NCBTYWx0ZWRfX2ugIFWpHZYoj
 Eoqz11d99zOc/FdSwV57gWAPN0YEMF5Q/31ixfangf6MXe2T5ELgB+EX+JmN94jc4Jp8Ej0zlcG
 XgGeU5qK2DanI8lkGogMc2Epzx9W92o=
X-Proofpoint-ORIG-GUID: 5Jb3XM4THepirW8c3eEpZs_zc-WFZ4Dm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1NCBTYWx0ZWRfXxNflZQ9OYB7b
 UPnmXkPHOOz2uK4zEluDArXcimpf90wZhA1r2B5iOryCZZ7pNXlsfPbwEerEKxLbDz9GXgVRYv9
 rqQHNwZU1NE769uoqiY8/NVmuBow/ggYEWu2Sl/7jORu1FiWRun+gy63iRT3s6OoCeMm1fEf9Yh
 rrKRfvEGKg30IdaZ2k6eKJcWUmtX0tyFcrFI9jUSylzWtnrnn6Ccr9WFDcGYOxKja9bZ8tG9NTG
 edpJ63c7680PCLuKqqhxZFYHgucjWexsEeECsygnxDlaZF+lMmKvC9xrdC7wtWkH49TW8iJ9jT3
 OV8vlz3aI5SUWHLnyBVT1fOGNeJ3LRt6o3fTZibDI1dqUD7v0hdXKhygcnQHVQhfCAhwwLYO2Cz
 3yu+991WUFjat40cBieVrnK+I/d3BmmKmwF7IQbQllU3dh18FynVEb3C5p7FPQJdfcWHzc+6C/B
 Fn+ZrWyeyCxjBL8r4+A==
X-Authority-Analysis: v=2.4 cv=dOszC+Zb c=1 sm=1 tr=0 ts=6ada13b5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=qfT2Yf8mAAAA:8 a=WbbDG5xgrYMa7k-JMu8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=nKa2voRIl820JbUdVH2x:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220054

On 10/22/26 3:35 PM, chr[] wrote:
> Am 16.10.26 um 17:11 schrieb Konrad Dybcio:
>> On 10/16/26 4:43 PM, Christoph Rudorff wrote:
>>> J5 got a gp2ap002 sensor, add it and it's supplies to the device tree
>>>
>>> Signed-off-by: Christoph Rudorff <chris@rudorff.com>
>>> ---
>>>   .../boot/dts/qcom/msm8916-samsung-j5-common.dtsi   | 19 ++++++++++
>>>   arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dts    | 40 ++++++++++++++++++++++
>>
>> It's odd for the regulator and pin setting to be common, but the
>> sensor to only be there for one of these devices
>>
>> Konrad
> 
> Hi Konrad,
> 
> in patchv3 I removed the settings from common
> and renamed some labels.
> 
> Is that ok?

I guess we'll see when you send it?

Konrad
