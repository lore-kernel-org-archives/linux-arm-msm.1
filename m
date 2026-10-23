Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792759449;
	b=wM8mmK3kMRuPerLBcLk8TMoegQ4VM+ZcKNUkGeee5rtLVB4A2lZDh82HcsUBnK5qv5Eo
	 09S8dA3bgT7dTXNj26CymDW/sN63GFatGKbj3mSVkEqyl1jpMPFWGmdxBf7t1MUlZai1n
	 zQ2vA4Af4VPciYluQeqjR2ZF7TVd4z12j3Q1/3gll0duIMe44Bs2HbRU+kO7aGafCaZsE
	 ZoF/bdrlHuRjJgeDacXVcbykMI/psG8kxR5/t3hs5HraCROrDAHUNKxaFQZ9p2Lzp67Fk
	 Fm45i19CW/pBcYoXKDsIOwXcW/EetmNVndKMw99A5iH23xScbEG0xKDf0pnX+lz5s1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792759449;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AOMQhYGznP8ZPbiSDUkXtajttWxKGXnZv3BF5N3G1jE=;
	b=5Ba23ExbpYxEAJX2a1jj5H8gzDPiSFnmJ9+CERhhLpNb3aR1nspR0YpNZTFLfvb5Eldf
	 9eH+4ZGDyc2ZiKZAeLzzDpZKCK5pIRF7vWP8jA+aABHMYS0f9+hhinyzGZgm2bMv1nfS3
	 z02hBfmKOXXG7VfrSVovOJ70NFX6glSUhgncJS1ZbrIaqiIe/9gXcL3T6T5HvIHQb1GR8
	 RtHy/puP7oR6Aww3LdO+GrYr0ya7CsIVGJi3EbBq3q/pfriiKdk4LeD7lyUlXTDv16HoB
	 Vw/DRVDzmBISey+KkcA97VdtTxZwRZSnIwimsMHP7ws/m8GE1wO7pZjhvwNwRellXAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EOLzUgb+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MeB+Ccm5;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA8A2606A321
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 12:44:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA8A2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EOLzUgb+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MeB+Ccm5
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAZGw3045401
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 12:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AOMQhYGznP8ZPbiSDUkXtajttWxKGXnZv3BF5N3G1jE=; b=EOLzUgb+E0uxQT0f
	8/QFI615gs0NK7KYqfejZXLYKOyB7OB0560XRPDD5G+PUkYnVJwx5zK1VpNCLELR
	x5b3blzv2BlAL15emEihOb9KX5SnTu7lqNYKhS6lW4DXqdVX68Wt4UGLA9nWvTtg
	RiIs4O/fp6bnL4JNSy3BXcxmEvZ7FTMJSOUYNWCYJqSWKnyE73dYX9dpx9dz6q7n
	LdNWCPVCQtSkQwpNuzXzZhQJDMdM6Y9pThf1tS/pFV6DRwfkYwoXXttuFWvTkxa4
	aB+5iS39UsgXJqGvZJZK4fM53PstW2etw4VLf7x6wWuOY8QToWB55ryeb/Eztc+W
	cIB8hw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmjbqn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 12:44:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93edac5877bso28487185a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 05:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792759447; x=1793364247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AOMQhYGznP8ZPbiSDUkXtajttWxKGXnZv3BF5N3G1jE=;
        b=MeB+Ccm5+rYESBvl0VmsABVWwe4RJU1awZNQVd5r6V3zqlJbBEBfeZ4n00F30fK6uy
         Um+NtVvW45iJwN4NAHMAvI/goDOTVIuiqNzxecvCxYyGQExDaHOOmvqhEc4DRmTCh4Uv
         qrcCjXIUqlEL0qQVqmdzGVQfCThezR0dzobly1pG2eP7YGqUXg/CMPo/y1g1z7XAIxn+
         kyLbhZItpic115bXmULrMX29JZU8JFw6OgFsBpnfYQL3mEJsQvJgxhnXBfY7YtELCUgv
         904HkCydiv4xEMqfvZv5BBg3vJ3C1gZ4yRSMTlNHS9sT1qnLSMZwZQrRKLcjSTS6OQXt
         mNqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792759447; x=1793364247;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AOMQhYGznP8ZPbiSDUkXtajttWxKGXnZv3BF5N3G1jE=;
        b=Cyq69xZhmaade/oVPStjfnix6eT1z8hTb7jnzCTCUoBCarkzsZYbH+h4+noEHVUjtA
         QTAo7YJOZIndV2fgdGb1Xl3d53AF6732dxl2dGC9tE5r4CG4+f7nqaqKzFJMXST8MyIM
         2FeNaOnCidviE5c4mwwyoXs6vure/PR2bn993auFoTYM+JJxznOnlcH7iaiCPoj03vOA
         +CXV4TYUpHukJJxnlA28djwFIFW94HXCAzKqvfDnDyaNZFj3CTmAY+nNgi+b2ponJO3n
         ZNSLt9wprkmsxhEq0RFUVM1Ra3Iv0+xvEfGAN1yUeLQP37uT45yqhKckcyynTTV4etY9
         SvMg==
X-Forwarded-Encrypted: i=1; AKwUvBzDvVD598YHLc3kZ3b14TUPRTL/2jgGt4I+ziDV/lHPbWz6J+d8QkHjVQxliMPS27ZJ2eK0/iLGpiOnG2nt@vger.kernel.org
X-Gm-Message-State: AFq9FYLkHccwHeUk9m0QoAyTujIpIRD4jPmJyrQwi5r5C75gND0UYWF2
	Rsn3lH3VdcOTlCi145fEqTV832ZCnK6vJTbp67KRXRyxl1Z6soanY/JngNqpFEYh//vC+vBj1lG
	JelKHjNDuyjSNRu/VOX/I7ajQcB98W2MaqLtQHxwOZnlH1doxqa+ba3GyJgPzGfxqgis6
X-Gm-Gg: AYBFou2sqsOj3Z5qPg3ZQ9BOrtkhzjmVS1tsswZb5sYYsvr7xSxL+0K4XufH4div0vf
	r7NtLPeynTHeaL2iEH3SRP3l3Amrck+F8gLdeinD98qQa8noNx4UIpW/dRLdo23otNvFv//Z8HK
	xG968pes6NQSCM4TSmuUSAjUXYPxiMvIEG4IePYI4s5RcyqTgbp2Qwz1AJrx4qgPlzbYuTBttKb
	bFvqaV2Uzf5Zcl6mxRuNLb8Wk3YU76jb18xv9fVaXWcpsshJ9ptasqXYgHxcCSBNMgEVhfQSPas
	VrhKsQsTTTpMPVZy/GtW6Q717xELukq686Re1L7E48aYnDxTeRZONz8ihAbfOyYkxOyWjWN4SmY
	NHODFmUNEKOxBFBgwvbr9dQ==
X-Received: by 2002:a05:620a:564a:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93f6f936070mr411664185a.4.1792759446742;
        Fri, 23 Oct 2026 05:44:06 -0700 (PDT)
X-Received: by 2002:a05:620a:564a:b0:93c:c96c:a5b4 with SMTP id af79cd13be357-93f6f936070mr411654985a.4.1792759445506;
        Fri, 23 Oct 2026 05:44:05 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5c7d0b7sm100365266b.43.2026.10.23.05.44.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 05:44:04 -0700 (PDT)
Message-ID: <4455607d-53b1-46fc-934f-7e7ae8f4f3d8@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 14:44:03 +0200
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
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm630: Drop the cluster idle
 states
To: Fabricio Akio <fabricioakio@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261011-sdm630-idle-states-v1-0-3181d488dc0f@gmail.com>
 <20261011-sdm630-idle-states-v1-1-3181d488dc0f@gmail.com>
 <2e5bfe2f-f639-4c55-bb4e-e8893e9f098d@oss.qualcomm.com>
 <CANxzQdH3eC97bb+eef=wizrxoB4XfvROzg8iHFxCrN_a+TZiSg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CANxzQdH3eC97bb+eef=wizrxoB4XfvROzg8iHFxCrN_a+TZiSg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ToUNAxS9Wazg7SJk-hy-FMJb5HxaurQs
X-Authority-Analysis: v=2.4 cv=cPR1IVeN c=1 sm=1 tr=0 ts=6adb5697 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=2CUSOdstmcgysknA9-EA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0OSBTYWx0ZWRfX8tO3mfWmug93
 iyj9sa14jOjml0+VkHyvX6UFTQBAgvRVoykgECGFurUwpPKUl9mmk/NQjb5FEvM3KoxfKQezVSK
 z526ZLWU1E6m/IgQemZHLtD2VeKxcqg=
X-Proofpoint-ORIG-GUID: ToUNAxS9Wazg7SJk-hy-FMJb5HxaurQs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0OSBTYWx0ZWRfXzPWR/Ay47V3M
 rgbvrouFR79OgvT5qGDK5dkfALJfWWzPo2sTqkDp3QYGjHpMnPvuQT393GW47BgkInHwBzs34wv
 BO/TMUvNtVvRluo/veKtySE4Pp7C1bPPLw23GEJ9UwQ8bF6SExRVXXmNgWu75qGo/1QDHC6A+oW
 Xpws6tvD3Laho2kHzT9+ddxw7Dq0uaH28iCgtg5Hp7518k9x5hNi1PIVq59hdPh41duuWs8WjvP
 vGpHsw/VvQEt0UhPjAPIE8Gp9xMFm2eIrfabVpUto4SIt6qFVmo/rMmzrwly7i27Fn1bNZZFjNT
 wb5re2sfp7jh6nFFcTrWF/aZNxLxtQrupP50emqbYYXCkAQtUcF0ZNszp9QayMgjvR76GIvTszJ
 kojrfjRpglaMY6csgZDwdJyc2YsnVQKZZhgSS1BxANI++LSJm1Aqr5HY4kriCeHciUjU2LHdGpx
 d6Ffpw0HmtmKJBe9YFQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230049

On 10/20/26 6:15 PM, Fabricio Akio wrote:
> On 10/15/26 3:51 PM, Konrad Dybcio wrote:
>> I threw an LLM at the downstream tree and it decoded the states to:
>>
>> C2D, no cluster state    2        0x00000002
>> C3, no cluster state    3        0x40000003
>> pwr/perf L2 D2D + C2D    L2 2        0x01000022
>> pwr/perf L2 D2D + C3    L2 2        0x41000023
>> pwr/perf L2 D2E + C3    L2 3        0x41000033
>> pwr/perf L2 D4 + C3    L2 4        0x41000043
>> System PC + L2 D4 + C3    sys3, L2 4    0x42000343
>>
>> sorry for getting it wrong years ago!
> 
> Thanks! I had decoded the same values, but I didn't just put them in
> place of the old ones. This firmware supports OS-initiated mode and
> refuses platform-coordinated mode ("psci: [Firmware Bug]: failed to
> set PC mode: -3", PSCI DENIED). In OS-initiated mode a cluster state
> may only be requested by the last running CPU of the cluster, which a
> flat cpu-idle-states list cannot express. I tried it: with 0x41000043
> in the flat list the firmware returns DENIED to nearly every request,
> accepting only the few that come from a cluster's last running CPU,
> and the idle CPUs spin on it again, at about twice the battery current.
> Linux runs OSI only with the CPUs described as PSCI power domains,
> with 0x41000043 as each cluster's domain-idle-state and 0x42000343 for
> system power collapse above them. I'm working on that, but I'm not
> sure yet when it will be ready, so this is not a placeholder for a
> replacement coming right behind it.

See:

https://lore.kernel.org/linux-arm-msm/20261015-b4-shikra_lpm_addition-v2-0-ac7f1a0d5638@oss.qualcomm.com/

https://lore.kernel.org/lkml/20261005-s2idle_state-v1-0-3c402c66f388@oss.qualcomm.com/

> Dropping the states is not the complete fix, but it helps now, because
> as they are they do harm: cpuidle records no successful entry into any
> of them, and since the deepest of them is what an idle CPU picks, each
> failed request is retried instead of sleeping. On the Moto X4
> that is about 133,000 failed entries per second with the screen off,
> and the battery current goes from 277 mA to about 115 mA without them.
> 
> Is dropping them first OK with you?

Temporarily, yes

Konrad

