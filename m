Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F5948F002
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 10:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790589639; cv=none; b=RF+VUOQFFbGqlI7h/xmA6CpLiu5n1xJDaBHuXEgOtJX8FpxP/pgA/0S/PqK1XFzYytuh6AypuqlxK7cb6bUhYcMe+aZtOvBM5ODqnwcIiv7GFqaoZTajGoQXQmnpAyns9Ta5wmzGxOKUYiBMNZQNI69y0RiWanvPwnxn73Y4fn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790589639; c=relaxed/simple;
	bh=+kKJYvjXri7s6v6L5H5Wt8m/tVO6Oh5w8G3Nmn49fT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fZwEDRCz0bacS8xGGu94PEn4h89GakK3VJxxxCFEsJYcDwoe27wtcgWxRfFu8XruUQDTcxF9TG8W2q8Q3B/G/XaMd4es2SaJJqIPE42Omtvtc6wuQEDUZRFkvRcqEKv7AXpGtOjTjWaeB8tzjWBf5yqyvaCoxZy9Zd+h28EEmLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CC/R4dIT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OSoHbWdD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CC/R4dIT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OSoHbWdD"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S9M41b322557
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 10:00:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SRdl2ImDaA9RyrSIRrOpGmVshuJ8L6YSb8CpnEqxuPg=; b=CC/R4dIT36Ts/kmZ
	aFPJgXKkgMzASCZhR5udAfQQ8X4ejWDXhP2P47BCFmpHSBNkTGcXbyO6HSH0uglG
	zy4O2tee9jDsrmf+K0mW46ib21o6fMHg+h+NNwQcQyKtu5Vhv7fGymDm2Gy4tEjy
	uctOwm5uePi88dcHwRpUHMsKl7vg1n7V4fIU+kVqeYBfRGtxutV2PBjiS/YHffNF
	W9EGai6olRns8mVXACRbOKtDxHOKJYcus7w41wMLQA10xWITFgIE95+eoQdaQhRG
	TVivCNufXCOerQ+L0VkfJXswykf8UNbB3p6re2HpVLM6NXOdQP81AyyxJe4ILMOI
	7DKWdw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyebq1m60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 10:00:35 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9143a95c6b9so52149946d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 03:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790589635; x=1791194435; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SRdl2ImDaA9RyrSIRrOpGmVshuJ8L6YSb8CpnEqxuPg=;
        b=OSoHbWdD8XovLiAeHpb48Cve3gwqUCMG5CcR0Fl6fSA7nqLan/lHvnRWkYano92Fk0
         KeF3nc930zxPsiyNRx3FDvoiX+rG5uIfexxEc48y8QEHwJ0lxdoxflm9j+7RHXSwhlPN
         /6m/1FfqDbwO7LeV0l2ngqCbTKI6tMj8SdfGNyKTHYBIbIqhC6pfVo3P/GtOrG2l69Yg
         0+0NR/Q/l7UOO6NOLsXgyUABVkcJye1RaZ9MKmOkR4Rsap+yS5YrjlM/xRiQGRGlFjwh
         wJYTpZgZO80pj/ajR4a57hk2Khn7wcH45kaFtPKfRyi/M2MazWU5SG3ufszimIelsPKV
         Kw+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790589635; x=1791194435;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SRdl2ImDaA9RyrSIRrOpGmVshuJ8L6YSb8CpnEqxuPg=;
        b=duzOPP/q6LCLa+kcAPv3z/dmgrlm2IgwBKRHmMPHufRwncYlSZ4zlGxs3VyoTJNxES
         9EPff7gLeHpDyvcjT7bCwXv0XJHpbRuKIcCZzeUNcAMij5cfU37yCcMr0eYgdfvczQfz
         GwZ314ZcTAZYVuBXN/vu9iQNDUlobf7VzZIN0vvmhC4Z3N4gtzzBG9M656IvOWzR8Sfh
         pK1iQHLzzcLuBmwtIrTbLPkhvhk1OkkpcDt3Ezb2+CsWzHzAVLyGKPjFmqsxzl3AYOPb
         4RLp3sEqzEXtXySIH5NakwYT70PwMGIeiKVdKgQbEnlod2KmTjTKwzbsolXTDNERPuD7
         t7fg==
X-Forwarded-Encrypted: i=1; AKwUvByIJTgdLqnQVrYzOdLDAaOLdpsBO5G1O63e/XOVNYGhH9neRc/1tPaK6STCHs73Cmbu4FmVGWHFca+ir09t@vger.kernel.org
X-Gm-Message-State: AFq9FYIqFYv4r7a6IE8cCoFJuw1DW2CQeJsbkhdKQ+DHF08QkDf9BCLs
	WVAOIVexPUquYL7tK4PcZ3YxqXSHogF6mUzPYP3c2iJ/7WMWGSv1UdUsTXwku0xhbIU0+IaYfQT
	IMtvdSRcRSFsFCDhqZAxI3WhBlef2nZs+TILPBm0zZLPld2vV2Dvx7gEtM/4RMIxeYRpz
X-Gm-Gg: AYBFou1mAB3VaEwAUGsFNYLRkkvvhdNMLNhiiOMjJ5paMhM/fpC1Vpz+l0lXRtNS11C
	dLMRNrQ8zzgqvUA1swjt50mYE+/0wG7fU6eKm6nYsO/naw57VHs/V6bHUyahWEkOGnfWu8Sasqv
	YHmKd/A4uTQoRD7heoF4HIZ+yAWzkpGNa+9ulBj5lgbxKmdwTN4Up/V5gSTVtVRrefqaSN0czku
	THQkoIikBP1Kx39T5CpBk8Hwn5AwARmrjry6C7hO1zyre+IorFq647u43FFFRHAEt0ktExZRvP9
	VIkbJ9x1/Nw9i8f/EuxNs/ZYe6YmXX+ie8ETNW1uc1E5gl2Ylri/aPaqVz+calqNmE/3I4YKq8a
	A+0WjOX3MAHF2aAWLx7ZiGHtX5A==
X-Received: by 2002:a05:6214:1ccf:b0:917:7e2b:d732 with SMTP id 6a1803df08f44-9177e2bde26mr4362156d6.21.1790589632731;
        Mon, 28 Sep 2026 03:00:32 -0700 (PDT)
X-Received: by 2002:a05:6214:1ccf:b0:917:7e2b:d732 with SMTP id 6a1803df08f44-9177e2bde26mr4359726d6.21.1790589630615;
        Mon, 28 Sep 2026 03:00:30 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-915e7afe81asm21547916d6.6.2026.09.28.03.00.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 03:00:30 -0700 (PDT)
Message-ID: <b095b037-ae76-4b0e-b73e-241e6d638764@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 11:00:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] dt-bindings: clock: Add LPASS AUDIOCC and reset
 controller for Glymur
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260922184425.56114-2-srinivas.kandagatla@oss.qualcomm.com>
 <20260928-nonchalant-mindful-goldfish-910c9e@quoll>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260928-nonchalant-mindful-goldfish-910c9e@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SCf7ophd35GEk-a66cuCR2xiLjtvQ5ct
X-Proofpoint-GUID: SCf7ophd35GEk-a66cuCR2xiLjtvQ5ct
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAzOSBTYWx0ZWRfX4QogEUdHGSNw
 ZwtS1IQB3+oruaIEYkZnb6UJIPXq1L/Ty+7PYgJmYeWzR+ACteYvolJkI9YtyXnNW81xe22VGXV
 80oZwCbphUIOA2PUpZx5CTrbYbTPxMw=
X-Authority-Analysis: v=2.4 cv=EqRHPicA c=1 sm=1 tr=0 ts=6aba3ac3 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ffBAxg_qJ57NiJVD2GMA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAzOSBTYWx0ZWRfX//EEWVoiu31N
 agwlNJ0lsgZBYl1uLFdbUX9mDKXxn+f6mdHg9q9+paoCQmu0gorP3orZpbaDoluqNCVUebCmGIk
 +2V3fEpRuLVA/PYpJazIGF3OF5LRLc7Kzj5DvUEhO/2dR2y4Hun5DXV2htKwwdpx6cT+LV8lMMl
 JmqMHsug2zTP9wdtj2JPh94DTOTFtNGkxiJBMyC0ehxAg5SSy/AvxvgiuEdYvinbDM+zJe4TO3s
 msZnD30ed7aPKPzaBi3R8oewh7Dcn1cA0ajJyJ9p7nixClvi4vJPT3MaqfdimiE+9UdjfLkW1JG
 Edm9YhOvM8wEMxn5LrWxQIwJpz/M/jqglLAz8senOcQ9KzmyIIhc18uf0iK6y1HVRzZQJMbJog5
 acxtnLhaVfXGHNdx5O2Zz+4H1gGV9MKs5LQ9lbe9EyhNL505RqJp/869bw49SSechy9TGXVF7H2
 k0UprEkDxa6JQojfLMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280039

On 9/28/26 10:59 AM, Krzysztof Kozlowski wrote:
> On Tue, Sep 22, 2026 at 07:44:22PM +0100, Srinivas Kandagatla wrote:
>> +maintainers:
>> +  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> +
>> +description: |
>> +  Qualcomm LPASS core and audio clock control module provides the clocks,
>> +  and reset on Glymur.
>> +
>> +  See also:
>> +    include/dt-bindings/clock/qcom,glymur-lpasscc.h
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,glymur-lpassaudiocc
> 
> Binding looks exactly the same as qcom,sc8280xp-lpasscc.yaml. Just add
> the compatible to the enum there, no need for a new file. Less code to
> maintain, less possible mistakes.
> 
Yes, I was thinking of doing the same.
> Separate header file for clock IDs is fine, though.
> 
Ack, Will do that in v2.

--srini
> Best regards,
> Krzysztof
> 

