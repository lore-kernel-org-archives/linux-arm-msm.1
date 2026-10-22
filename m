Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792656504;
	b=q3eALXN5vPkeaHzenwI4RfqTuCuaKCnBews/3jQeEQZqONl+31agCC4cefYBbQc7GXk3
	 SqkueDIaK6jEN8U23G0zi71rCex8YPFS4eyHKAgg0QT3CW7pCoT/9kdU0423Kb9oz7WI5
	 k0EOcdNYnqlov7HkY/E+kDTx0Gm76rhi/1eORUeGX3NTmk7cBm/D7NDU4jyGfUEHrzkPZ
	 ICJt2oI8DkhkNadW4F1YVKR/MMeQlAJDGtVJPkU9zKyn3k/yjY0zO3oe82FQCfSduU18P
	 SKwtt5CywkkFLjyGtBMuzehcDI8HwLmOMLUOI8atKmdo89wDJMc5v0OUSP37/0lRL8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656504;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Rju0kQfcTmFq0/nuf/5fckzUJMwcIHsYdpF1vEzgPqc=;
	b=Qu4p8mpbCUYoaNoDuKvt6VBojMn3BlAfDNfC26IHxDhXl+jJOSCMIt4ORXx3YSlFwmql
	 DsJWhMuGvzkWu7PsNFo27lmsjNvSHYfmOYvJIMFQD40YWlVgf2ChcwI6aP2xM3GP7/rHP
	 zOzTOilm3x5CBM8g4PWeKYLWYibeUdvweP9rt4eVLIJlYVlzyUoBMTxq2Wxe4PDvTnkKV
	 6LJjGUtOGQuYOKo9DVg4PK0T/vsDZ8enyBQJC/LjI212e5NkmO6vLBnrgOCfEnJIlpUKc
	 oFLMEoWcumcEMFFgbIIhrxeYJDeunSbuYIUKJmY61hDDAffPUcdGV7Zn4EHo/MPG+AQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cwBZnlj5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kj0xNvvq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F5F606A31B
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B3F5F606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cwBZnlj5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kj0xNvvq
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M704k44110606
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rju0kQfcTmFq0/nuf/5fckzUJMwcIHsYdpF1vEzgPqc=; b=cwBZnlj5GU+HwE9E
	4jLJAB5g69Kn9u+bz8XrvLss4OfO1m3giEycZoDqEeGvr7ZUf2oo6cWXpSPvaC1H
	vygNgPXU3Twxo1W3u8AWZiyHiUpCZwlOmeenufKnbEfJjxwdUlwrShwVbD5QY+GJ
	hakWlGZ/+VUIlMoLFkP5lo/J7oXBbqVbNbOdNqt5DQz8q2c3sxjuslwNXLKPa/2o
	pfefa9Xau+Cxx25EgoGnbAvcAy1mV7AqbsbXO1KEI41b4Qr63tw/2Fc9FF3kDO4b
	RCAB84UkGeOZxPFVEY+ncfX+g4wp5zjh83i+y8erI5njadqq68h6wlY0N3+ID1bZ
	eP2Ddw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93ahcw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:08:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93df7a9466bso17592885a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 01:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792656502; x=1793261302; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rju0kQfcTmFq0/nuf/5fckzUJMwcIHsYdpF1vEzgPqc=;
        b=kj0xNvvqwzksAwfwVxssk9dxUkm2FIKO3BRGKGmmSf5zofslZFI7ElNXsNHcR/c+dp
         xNs+yMTTJFD8oa9AJh+5Bgwq9omuRWeaZTiC4SDgG4NLYW0//FzqIDC5sfHNKGkeir5F
         uOfmJ/JgJUi3wXHuKKjpiOMeIh6/m8KPafXAoKX+aZ7+qslf7mFu9sUkVHyw+mgzx1bv
         XtWudRRTqhDXUniEkpCoC2Lcq4AslJxG5TRuBrr4CoSnpRtITR535uIO52379qolFN/h
         2JyI35n6KSzTWtB3ut9/SVAE8ahKthbxci1+jLxbBFQrWrYYYMOiNybUAgcvp418bgHR
         vGzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656502; x=1793261302;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rju0kQfcTmFq0/nuf/5fckzUJMwcIHsYdpF1vEzgPqc=;
        b=hPFWOicQePV3OO66cI37Wb+yzNWiaHf1O/VwUzesLPkHlqHDd+lMl+4Ge/ExmytatP
         jchnevyk+z83wXkqj8BSlr40qdnaIwFKQKfddgaCXRn4PdQynzPH7Q/+7Mxkb1XFtC6E
         nDMcFQSHkszNreqns0++jBCFF6trxOdXuccN+pW9PD1S0CVscBFdGciSW8ta1PFqixMR
         JAlKm+BbWgIj0ZiNGEo7fsQ8QxPQbA/dVMi8/8FRSKYbC/KH20mBfCMa9GBHyGWZVlcu
         go0o6EXDMg0mZQJChGZstkBDtna1dc0+DL4SDbaAzhzNwiQ5HSYYs50MLg78zLb5vcru
         29mQ==
X-Gm-Message-State: AFq9FYIEhOltPa4hfnAQ+vDADKmwpMLBvqNtu116iodl2dujwCX3VUOR
	ISxf0qKJxejlXnzCpDiAzoRRVua8YuwgYXkrXykppkppbYFmww1S7zgkb/QbPXAZPyAOvY2Yefv
	xYw2eFWaTPtFJcthaRrwgaudfIB1GaotM5f232eKEbhPEoTzBbRD0JoLxjIlxf5JXG6dC
X-Gm-Gg: AYBFou2s81ICPBYGh8+xVpG5o/UDpcdDEpB+J++Rv8euNcGhX7opYTtTGHE0I4AARvn
	kX8zihonX40ZWPmbM1/C6qHcMBSxdrSlTe2R4qI0GNuiae859Ehr6FRucRQYVzZzfeptTLG+l6N
	DfTk3Ek/H2deuZg/SvsVMrKtDHJ+4u1wU6DQMjGRlXeAHZuhutGYB7L5tlbO6NudCiw7xWC8rym
	rWSCfXIun/3WIi3sZcE+JGdYhnw48O5uzDR9HIqbCq1bdSy6mffi5pJAe6EApVjByIBwvhWo90v
	fwIn4jCmR5eDMad1hnyNPHLixG7F1qyZ//bWW+dzdEQqwWpqD0JXuWoBAEf167QH2L1xhrD2geN
	fLG9mOiDg+iJke/eA/9mObw==
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr1009349585a.1.1792656502092;
        Thu, 22 Oct 2026 01:08:22 -0700 (PDT)
X-Received: by 2002:a05:620a:1d09:b0:93a:14c:329c with SMTP id af79cd13be357-93f57e3e05amr1009346585a.1.1792656501661;
        Thu, 22 Oct 2026 01:08:21 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a1f0b46sm79569966b.8.2026.10.22.01.08.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:08:20 -0700 (PDT)
Message-ID: <29d55c6c-5565-417b-8252-7f346f07a035@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:08:17 +0200
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
Subject: Re: [PATCH v4] arm64: dts: qcom: sm7125-samsung: add initial device
 tree
To: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Kees Cook <kees@kernel.org>,
        Tony Luck <tony.luck@intel.com>,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Stefan Hansson <newbyte@postmarketos.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        David Heidelberg <david@ixit.cz>, Abel Vesa <abelvesa@kernel.org>
References: <20261013-sm7125-samsung-v4-1-3233901b48bb@gmail.com>
 <5fb086d1-7725-4d8b-a2c9-7627f6da7cd9@oss.qualcomm.com>
 <b33efcca-eaed-4efe-99c6-035afd73dec5@gmail.com>
 <eb559119-4d52-41be-a954-2c26492d6a2e@oss.qualcomm.com>
 <701defd4-79af-4ce3-9c49-d3f4378a9953@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <701defd4-79af-4ce3-9c49-d3f4378a9953@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX1NNRtvE4UTNN
 NgJzsA5iNm0heSUNkfrrW7uENL2+JRjOtAEV7Cj3XAafp/O9ZXIaHHwz3exZZ8Mz4VQ9bAEpcJk
 AeEDa/Ya7DHUU3ZUWWMo+pXq7m3CR31YqFZ44ZafHNB1+tYMRhzoDEfgz9YQp/hFG0QtdgZOwsM
 NKOM8Vyj1MOf05dh1dcZTzYXCY0yDz3UUNQm7AYw7tuj4mBhRNZ6RHGsEeUwZ0DNuXndvvBTQwN
 zGxuWgL6oN0zP9/SUWhKnGFgkyVWI08GPTDEIGkdKPtczIqqzhMjv1qGGAAwywotFy32Rq9PJf4
 dnGzNfrnpd1+G5cMQgcgb0O+wXURacDTgwvmPE5WmOkw2JXazmyzHpXSXjdt5+bbc3DqqdWhC1Z
 tNUscwGTJf677VnrA5SahN7eooLd3WBKuiiQDN4ERR3cjOs1Yx+cdsH2YnaBjuIXbWygUfZgl6E
 3bKzxm5BOwc+PFnBBmA==
X-Authority-Analysis: v=2.4 cv=H7FOUOYi c=1 sm=1 tr=0 ts=6ad9c477 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=C8oghTkgAAAA:8 a=aE2qjto-PEiQifxUPIUA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=BFEk1I1Cc5IuqT1TcHpZ:22
X-Proofpoint-ORIG-GUID: iKEyllS-qzU7BTEO93g_1u4CG10WrRDV
X-Proofpoint-GUID: iKEyllS-qzU7BTEO93g_1u4CG10WrRDV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX/ipbGejDKzvu
 OfJvErLjSN0WoPGrhssA+wZOAyA2UTyxX/DiaxsDBOxvfUKl3PoOIhopXhvCsLTJen0fTQHTA+e
 XMQnCP327AhJ7I536HV5eblxfeJvCTo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 phishscore=0 adultscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220032

On 10/21/26 5:00 PM, Erikas Bitovtas wrote:
>>>> Have you tried using the bus through the normal QUP driver path?
>>>>
>>> No, I haven't. GPI DMA support for this platform is not yet upstream.
>>
>> It's a copy-paste job, try it out please.
>>
> 
> The pinctrl driver for SC7180 has no QUPv3 mux for 51 and 52 GPIOs. I
> also tried checking devcfg.mbn of my device using qc-devcfg-parser, but
> it printed limited information:
> https://bpa.st/PEZED3BN3JGND6HS6BOGNHQG7I>>>> +&usb_1 {

I checked the hw spec and indeed there's no QUP routed there.

Konrad
