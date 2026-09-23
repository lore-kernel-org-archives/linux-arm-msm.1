Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4290051D536
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 13:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790168723; cv=none; b=buCEa3EXa6JeXTI3+aRNZWoxHdeWojg9lQ1RNwrIYLSUIS+YFt/Hxg2Gutev8zvsLt8K1eC34zUAnRzF7hyOBj/gyd40Dxblxx+ne8uMniM0/ZqOoWcsTkQSRCd0i55esI8wvTxPoLDNmmKJoO76psKl3HfZuVxXWl7ZaMfxmzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790168723; c=relaxed/simple;
	bh=5JWwbmm/sf9shtpTQDKczj3QCEB9Gx1ej9MKInqgKCQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GPkUDP+u/AtQ2U5abhLnS3uZvf18wFIhlSwkC4cSR8O7fLalq46dfU0zad39JfUPicD5UPoHY2czHJQ6DKQ+W/ML18SbvN2bKjz1JVgk3wEb4INna/4udyL7TU1KmrG44+aPkLH1DHS3vZccRKpjUKEXRid46/6kCWujFN2IPcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kh2Y9rMg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lb5b2TDX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kh2Y9rMg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lb5b2TDX"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NBbTM02466545
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 13:05:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ieaJ3s8Ys6OkOmVj9MU1PHSyb77w8B86NRRI4rsdGCY=; b=kh2Y9rMg1MzLaEaA
	5YmavkJWOssHX4hwEgR7oz71ODR5WgwLMyh4HB2pH11vU9L0lWNonxm2PUK5mlP5
	5GCYL03LQtboAilKRZIwtsZrC8wxT8poEpcAzHEA76jSScl2cwqbDnkTxdMVGL7W
	5jP4hwavIwWDxhGe3pO14ATVB5q8TxFDE6Wv2FI2k9UH8K1wW/lzZUosFsClyQJi
	60lb5M92vRlMnUziyg4NkITUW5Xfel2OGF+gHcsD3N48geBAdhO2tuT/MCs84pDz
	B+t5qjUwgk9tzisA/3Qttk5ZvdOBGJ9mfCEKlUHe1+EdmhafZwHpfUUuXGjiJ46N
	CC2JvQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guy2c44nm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 13:05:21 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c8383e6a13so64956e0c.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 06:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790168720; x=1790773520; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ieaJ3s8Ys6OkOmVj9MU1PHSyb77w8B86NRRI4rsdGCY=;
        b=Lb5b2TDXMiv92alIKnWJgsN98j1xZ9FLZJZan+Nr63Ko4J0E4eloByBAmJ6d9iY41T
         MLfYq0vCcoo24cHz3WMOE+RZueBFQ7XaIYh6K61nkpLRu3jUGXYQ5wGow+EzVpmZR9Ox
         1/Cstg/bD2aH1ooK6va9OXoi//mDDYYO4r/s++o4DUew8QjeYlCoLUN4bbfXbtTDLJcf
         drBWOiC1Zq/P6OcjP47sInkKN4oFaAyEq/xMIXB0qNF87fZvF0Gg02zPHRLahQRwh2Sv
         u+WR/Gi2acBgvSwnXI5WV7Hd6/ZsUtINPA3OuZDPVfejQwZtdV3qZVd9UQ/aXLp94JpE
         Ef2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790168720; x=1790773520;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ieaJ3s8Ys6OkOmVj9MU1PHSyb77w8B86NRRI4rsdGCY=;
        b=Zp3LTYn88RecsEiywZdEGDQhQ8cKzYCKFbZyB5zTnJeFoLchl9SjZBYA+uLAKsUfCM
         DM6xvrx2glHrP9qrFZWlTGpVnhu6G2yrOxWHdplSPp9ik6Udyvw0A4miz0udyPCL0yJv
         fmx3uit+F/GAypTd6IUaCDjuFxARa/c0p5mOBEVbT0kAYOxBNJM8Ai8sVNF0GKfK2pea
         fD1mwTW+HUvYWEEI+GUGXl7EANTKOF2Wkssw7ZoEyMZ+g4ADk49tVDbftK0kK+yItqhL
         ulnTTWxCowC/9U5LsV8M8WJFzYqtg4jnAlv/5MXGDFmB6dM0XRc87r9za2CXQicUw8HC
         k5Ew==
X-Forwarded-Encrypted: i=1; AKwUvBx8VqiEn0gi5MVKC/rnlh9q9/rwzH+LQR/OhRWcWhRPPBGr8RabulmY7p238QDriMNjuBayDgcrbCJYo4zV@vger.kernel.org
X-Gm-Message-State: AFuF++n9MZv4tBxyePAvag1B5KDKfa6Up2wlvBSBKRy2H7aQctkSbwsB
	QLwsCDuOABfUBu5C5MyJ7hwsiqeFgScHOsFlc+OXL7pgggXnhXPATZ5zPiBxlle5rdSiXLDr8W2
	z/XqG9fJQkGvsHhBi7RO582oaof6ahwyKD0Zec3O/SV3ItbCOMQof95vPvWyu6vJvBW6/
X-Gm-Gg: AYBFou3IQRt/SOqXDKhfgjb4DHrsriw0GAH+/Ww3EenxOc3KSQAIitpKaVPzLbbSxyK
	xoZd56guHpM8CAmgvslOozeGrMT8XYIniNppG+VLJIiH6RV/wyog4F4rL+AAFTHkWlBYwfCiFi/
	v3lkKJ0XHiLK8LmAi7/cjezHk++kqIPP7ypXkXy6UzDP7SgMZ0xb/JR1p67DnovEuAaXkB58ASe
	ik5aLtoYIKsNG9Zd4zVO+8xKMOV2FbQq8/C5N4GwWq/1333O8A1LNsTXmXOB5+evhjtvhvjV1AW
	AIHfvKrQOQaBWi6inG5K6KusMWOkfbC6/Za5QqhDnOhmjgwOAuOvLgcIR4WrCC2B3YCtVDwQQD9
	D6xdPs5KFZ+GgflA5mBy3tQ==
X-Received: by 2002:a05:6102:688b:b0:7ae:545d:f97c with SMTP id ada2fe7eead31-7ae545dfcdfmr383263137.3.1790168720492;
        Wed, 23 Sep 2026 06:05:20 -0700 (PDT)
X-Received: by 2002:a05:6102:688b:b0:7ae:545d:f97c with SMTP id ada2fe7eead31-7ae545dfcdfmr383203137.3.1790168719825;
        Wed, 23 Sep 2026 06:05:19 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae62dabcsm115831566b.31.2026.09.23.06.05.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 06:05:19 -0700 (PDT)
Message-ID: <f71f148e-bbcb-4999-9669-4975fc989c0a@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:05:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 6/6] arm64: dts: qcom: sdm845-google: Add basic audio
 support
To: David Heidelberg <david@ixit.cz>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260705-pixel3-audio-v1-0-3b66f33859f1@ixit.cz>
 <20260705-pixel3-audio-v1-6-3b66f33859f1@ixit.cz>
 <c5773a71-e7f0-44ae-8418-1e00de16d08f@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c5773a71-e7f0-44ae-8418-1e00de16d08f@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2_B7LfTcJhxspnpICkJgiHKl39YMEgwW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1MiBTYWx0ZWRfXyn5E8cO5DWDi
 kr34zvJt41vXSVxhyd44PZXA+/zDrmFrPKK90da83oqEMl9Pz5UdiTp/fHR05ZXi9d2SYmJU3ZL
 WX1VFdsGDsEVc103wRg9L4PauRiEFPw=
X-Authority-Analysis: v=2.4 cv=Zsh4uN7G c=1 sm=1 tr=0 ts=6ab3ce91 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=NEAV23lmAAAA:8 a=-N33akl6Kve4PNw8qKgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: 2_B7LfTcJhxspnpICkJgiHKl39YMEgwW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1MiBTYWx0ZWRfX7mb9ljpfxHHJ
 E1281JKzD26ZoFMy4AOVj+o5wJgsUTRP1nEQEv1KRti5VOOVsu0EaGeHT9webH6mJ30BPotH7pf
 1dgSxV+IqPQG5lZcwNzCanetE0AQphK0ztuBCtHOk2wvP4/0H3CNBPvl+QaR08WQiqpVATuKxhm
 zfhBnoPHchJMEUZR9yIT/LPIyKUhvVIEE1od1xvjHf5s5r0lG1pHH742HAyG+vqGXF1Tq16ApxV
 NF1TsPkZP2DWYKV5LpfNzFOwoOGXkaezZLBf2nUaGVVCBOkLD808dvhXoYhHz8h0vb9SgW/OrJH
 M/qKZ/cEvVyXXRVP8sRUNkpRfmKs3U1nLIAATW4uLcDlVjgTtOov3q/yzGd0t8FmQtjeBYqlNSF
 9/8oKmknt/bh1CmacpYj3XsPD5aQlzR3h56f7Q5ffAxxiYoprYLMcKVq3r2d8d1Y9N3w3Fu8RdW
 brtvRigIl+jb9Rdg+Fw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230052

On 9/3/26 7:24 PM, David Heidelberg wrote:
> On 05/07/2026 22:06, David Heidelberg via B4 Relay wrote:
>> From: David Heidelberg <david@ixit.cz>
>>
>> Introduce support for sound card and wire two CS35L36 audio codecs for
>> top and bottom speakers.
>>
>> Inspired by commit from Joel Selvaraj.
>>
>> Signed-off-by: David Heidelberg <david@ixit.cz>
> 
> [...]
> 
>> +&sound {
>> +    compatible = "qcom,sdm845-sndcard";
>> +    model = "Google Pixel 3";
> I see some new nodes using such as
> 
> SC8280XP-MICROSOFT-SURFACE-PRO-9-5G
> sc7280-wcd938x-max98360a-1mic
> HUAWEI-PAK_AL09-M1040
> 
> is there is a preferred syntax?
> 
> I would go for blueline which translates into google-blueline profile.

Looking at

https://github.com/alsa-project/alsa-ucm-conf/tree/master/ucm2/Qualcomm/

I see it's generally SOCNAME-VENDORBOARD-FOOBAR

Konrad
