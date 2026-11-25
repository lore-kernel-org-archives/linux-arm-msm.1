Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795613406;
	b=XcVsRdkiW1GOhsRqwf+zBI8rEC5JSLbKKI/xbQdVkm64k0SyAM2pWmGKmZDDCZHYtAnQ
	 x3gBeNOfWEjfC5iaQe/QtCdEdLRR1dKDIkSX7jg3181UDr7t/78OVVx3qUcfrUQERqI7K
	 +cEAT6TNA6DLl0Wv4v6e97u9PtR9l8P7fMZA5LU/SZWR9KwaLbTHLBAr3axj7J8I9ooWB
	 ZOWjcHG1DHJGeH3SBrWHf85LXKE1A91nYMh/VUsO4fFC24lUTnkNf4vxXiXY12fGOGEer
	 nQwrf8e4Dqp1FCfzYvCq6I6Hzz4PO72w0yO9c2j91HZpbO+4B2WFTTANIKCJjV1cHYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795613406;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=smDMy6su2v5TRuoxvIhH6UcIUozCziMfy5Wm2BlMQwM=;
	b=guRjtpw3h/TfCofj2pMRMwLphJxK+tbvdn8rNAUu9CvJpoAgMPOT0Whi3+bt5rnZnTh4
	 7w9ZPCtbfH6Jryeeul+QvTn3e/q0Lh1x8R52SUWzVlmeUaviIu/G7w2Ipfh8/LPTkdOLn
	 gxumxuHfvi88pSRE5VrV/Cyzz21yF+UoWee8E/uGR1JiuhoSDFyYyriITvqK9D+XYbhKV
	 UUveZxiZya8+1FXwzBl/bTLT0/3192xjAx0jOpG0iQOsn3tS9U+02DMw6wNaqmcNOohLO
	 A9mqBbF4QeocvnDEeC9cvg2/owrrcbtrIPDnpsqeQi6kev+Jv1gTcMPtv9sRTKetxyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F6sKIbB1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dF7U4VqU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C37B606A332
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:30:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C37B606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F6sKIbB1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dF7U4VqU
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mo4u3611838
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:30:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	smDMy6su2v5TRuoxvIhH6UcIUozCziMfy5Wm2BlMQwM=; b=F6sKIbB1nsAton51
	paC/HxwfC9i0kGF1D9KX0zAFIRfCWqW2aeJh9oyVLl0UnKGQcq3kwi+qrTkjRXko
	zuy7pubBK6K7yvaqsAVvB1Lpu7Fu0BMJrnCf6lJ4/ZPteXflK8hoOttyeCZbkk4G
	9BQ1YFw6tsrIilIRMmFEdGgX1ZFihlDneueV0zmo919xxM/HU7rnLLWvwBvhDGTl
	26VgkQeU4UtPIsekC9HB9IIu5SQJfE3WDZMGxAetqDZFxeYV9EAGeIlq9RbIpjAf
	0HgZwofUi6zcUB3xXDdYGCh5WMRYq6bNDo0eOJy2UClk4BjnSZ1BK/xVVSP7jCy3
	N0wVyg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnsbu77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 13:30:05 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94975041698so1444260385a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 05:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795613404; x=1796218204; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=smDMy6su2v5TRuoxvIhH6UcIUozCziMfy5Wm2BlMQwM=;
        b=dF7U4VqUeXP89S/oo+7JKc7+IRUJEeScod58I4v9l/XRffoYx/uBuVa62RIhf8XOsB
         3tzjZBCqUyHD3P1/KheTIPn0m1XbkRj3Pk8a55CRcy+lFuCVua2Jf8VJcYSnv4G0zSRK
         bIqCvOH7ceLXVsM4lLH6CPr9LXcR78bWU3D835505iEBXx6/ilHrPuY4ShyHOmk5b//V
         w9kaWNtWe2bBA7mRbNvqU6UU2bEOL1jTLDLy5BjIrhWFziaofRjWa1GUtXWsaoNWBKy8
         q9WpJtCi61vHchhGTRxaSpXvJshgVKqs1EHhCr7uA1jYvdbh5O/A+pgzcSTWdFLAOAAY
         1qMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795613404; x=1796218204;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=smDMy6su2v5TRuoxvIhH6UcIUozCziMfy5Wm2BlMQwM=;
        b=2SNK7SxG56lxebFHZohQ/xb1AhpiFpaH/vXB+myhU24BN1iTH9ktcuL4zWG0mmgtIC
         YGKJxyAqh25i2cXV56W8AL3s6LfrdBZFhXGc0Yxd+Z+tT6fbZP13j5d6u2pI6TZf52v4
         o0Fq9oDJ8coyyhnGS7VvPP8LXJgRuz1KeHZHFNG0GqW6VYHnXy7oFd1AhnsqKJFb9/fJ
         JqsKilkv9XZoJUzcSDfFsMPgShnxOZxeW0froh8Jb7KRpg6NwZS2pRpToSw0queUwkv3
         k6oRjraaERKmlEwBnwZTvR9V0MjAng/BosnqetqUQvZ+F3xZsUR7mO6zo1/ydg55XmEx
         lE5g==
X-Forwarded-Encrypted: i=1; AL+hErHskehKIwzIhuz2Z4xs9tKz8Vc8u1WfJ9zprAMULMkfl0ZZFLIspC97XzdbbmW/5r9mij7VgcG8RqOXYW1Q@vger.kernel.org
X-Gm-Message-State: APuU4Z+4SeTniBcAwYrc31xEK5QcYhdzCEUchWKxYB0kxzVn6eWyoKdn
	mC66TiKD1nN6dl/P7Klx1/X7pSIbXZj6wMCaNT13jeWQ57loQUNyxO6t4BEdWjw9wVhQh+JYGCQ
	80diZ8cq6Lc5DotCVRuMoBOQ18BZ1WyHz8gi96pArqNPSzftyZ95MWjZhwAFFB4R4P8lY
X-Gm-Gg: AZFdTZcqbMDB6QtiI2iT4vuhkcOOkb7DwKA4AojeAEhGiIuBt1S1KH/Q9hRMxlwMsCr
	rxk/ML1yF9LSIvn8sKe5fgUZiJklGhF2cO2E6wVGV5h4aBwqCQyAyqTHaNj1BUwF8EcLDS/Y3js
	R2cUZNEfLwc6E2yc6tRxl47qWxgFf9eaoVicgiFFlRZOW2XcGt9qraKHB7EGCL3U/mNZ2l5whL7
	GxZ48dbnJ8i79VoSONUMO/kgRpizZ1V8wtY1lzSFQlRGzjKg1gXPERd4WVcXHrkZguyeggDTX1m
	ErptU0TUf3MtQitHDTcsxR/YDVmblB/MWzi6silh1Xgl+EOSxrHYs3LUtQhvuTew55n0TYoETFX
	5hBYsueffcfVvscEhjlWSGwvE6Moyk6OKkEkuS7JB56XeJUfPp6/UoSGR/YlybZ5xOTvhANKKVO
	4sp/QMqURe84MhbtJHOh8nZmfkJVxr3412NPpdMi0=
X-Received: by 2002:a05:620a:1727:b0:949:8109:67e7 with SMTP id af79cd13be357-949b3815a51mr3328609185a.36.1795613404422;
        Wed, 25 Nov 2026 05:30:04 -0800 (PST)
X-Received: by 2002:a05:620a:1727:b0:949:8109:67e7 with SMTP id af79cd13be357-949b3815a51mr3328600785a.36.1795613403766;
        Wed, 25 Nov 2026 05:30:03 -0800 (PST)
Received: from [192.168.1.27] (83.31.98.241.ipv4.supernova.orange.pl. [83.31.98.241])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884c3063sm519677145e9.15.2026.11.25.05.30.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 05:30:02 -0800 (PST)
Message-ID: <f9190246-ea4a-4dde-9ef7-e29cbf6c5908@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 14:30:00 +0100
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
Subject: Re: [PATCH 2/2] dt-bindings: qcom: qcom,ids: Remove unneeded ID
 constants
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Ilia Lin <ilia.lin@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20261122-qcom-socinfo-id-dt-bindings-v1-0-eeee0ffa25da@oss.qualcomm.com>
 <20261122-qcom-socinfo-id-dt-bindings-v1-2-eeee0ffa25da@oss.qualcomm.com>
 <c4509c17-2c67-4f76-899d-548edc47069c@oss.qualcomm.com>
 <b10fa9da-39e1-4bfe-8c09-cc1d5cc007f4@oss.qualcomm.com>
 <786351d0-c7a6-4ebe-bae3-0c81ec20b833@oss.qualcomm.com>
 <c8e53787-adee-4fe6-8a8c-66fab28bbedc@oss.qualcomm.com>
 <403d0d8d-85f0-405a-a26a-54040272aeba@oss.qualcomm.com>
 <4276402c-9fa4-4bcb-99a2-4556ec59f3d2@oss.qualcomm.com>
 <ac7db1b5-ae9d-43c6-b553-ffeccc50e1b6@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <ac7db1b5-ae9d-43c6-b553-ffeccc50e1b6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: imM7gGUxEIPgjYA9cKs91uND8TSNgJlL
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b06e2dd cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ivW4MigAevuCEqTxTIunpQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=ks9rPHZIzW2PBVneSSAA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA1MyBTYWx0ZWRfXyyHGyn0VRE3X
 rwfebiFrjiTVBp7R84CqaanxCV7iRzrqntBfa9qVtq/XfChREr+/AZR913yqirVzU5e3mBSWeUn
 n08a+Y0/P7FDLFnl8Q1DZvtnykrw2tw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA1MyBTYWx0ZWRfX9TUAmnNbL4DP
 AWzVqjc1qTCv0W2uvs+U+F93mAW2Alg/dQood4Ny7HH6vVZE1DyProdrTw2XAFMMtQ/LazwEQ2Q
 xRkmL+/9ZwmYhuDcENLwkFbPaF2cPNjrN+uI6sRT6WS3Y0f1WDSvcPY7kzAyuS79UZGtpZjhZtA
 xGfce5iErG54VUSCOFAVk7YGa+T+M0oIQT3/FlpBaDu+1tkLJwRGVXV2R+bESdivgxXor6mif54
 8CgZVNUivezd5jut3PeBXdMzh3yAjXhfnNEHZBno5x3sj1c4yjr4G6Li+su2R3F+jX0OipxZmym
 cinjq+uy9F5u7Yro1eWmfepRwHp9bUl+uMCJYlqkzItGw3XaV8JDLUULsA9cqFkJxVo0GFT49Hn
 3Adn102E0zCPjmchK22pqy+ZxGQRlqxLwm5ydYz5ZMfVCKFALtgPmzcSwvEN2gNGwj+pEVpGpUn
 v4NOh9jTVxA4HkADAYQ==
X-Proofpoint-ORIG-GUID: imM7gGUxEIPgjYA9cKs91uND8TSNgJlL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250053

On 25/11/2026 12:14, Konrad Dybcio wrote:
> On 11/25/26 12:05 PM, Krzysztof Kozlowski wrote:
>> On 25/11/2026 12:03, Konrad Dybcio wrote:
>>>>
>>>> True, not ABI in meaning something agreed between DTS and driver, but
>>>> the values are used by bootloader, DTS and the driver, so I would just
>>>> leave them as is. I rather care about not growing this for newer platforms.
>>>
>>> Right, but they are compared against a hardware readout of a
>>> well-defined value, not against made-up indices (i.e. these are
>>> not bindings). I really don't like this ending up with 2 files
>>> doing the same thing.
>>
>> Not two files doing the same, but one for legacy and one for new.
>>
>> OK, let's drop the bindings, but then what do you put into the drivers?
>> Hard-coded values duplicating another hard-coded values from DTS header?
> 
> Or we can have the defines live in include/soc/?

Then DTS cannot use them...

Best regards,
Krzysztof
