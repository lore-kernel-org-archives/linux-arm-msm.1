Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794236239;
	b=4K/pfokCT30dPYkH6EXy4NcFrVLBSwzR2SJkRgJpJiy1EblNOKG4U2l2lICXguBrxmT9
	 IHG4y+r4+zu+zPOhuIBbuXM2tPGc6JuPqXrQzXjiOrsEEqzJbwUEsY8it4h1ABBCE5qau
	 4Z55rC7u5OONFCSaEhnAAd0cGWiHbm5KtW891Mrck9Bwn9K0YZ1RStT8MpxAU1gdhkoEJ
	 LGtOZg5IJ10df/3hTLBqlyHPqPXtfPad9NFiDYvmDT8jLzpLzWyRxSHYZslqIOGfvUJ1R
	 AbVWSvo3gO96VjvX6lo7ESMl82XaXBe3Vh2vpb4AhIzaXSI9sHlo4hZpkSuHVL+XFtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794236239;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=g+kkRoXjLnZvkcsVYJVyA99F6A7zMFGj/ZL5HWfx1bs=;
	b=qJqGVX36BTxXKJ8z9prFcypadTYdf1am7KPG4J9aViIAhIaZO835Wf1KGGjsXe/nNLhR
	 A0U9v/P1+Vfc1ctaf9LsTtqvENfPggurI5ka0bWXj5TTZvJsEZ8D15PS6rTLASsb25EMk
	 kL2svgQqqZC/333KY1fMllNFPHxWmVD+4Wjyrd9bmlvK6OId28Ic9I7uoWrQl0GMWBcm4
	 JNXVwT6vEeVEcSEBgxhqd/QDyRlKpbcp9/dsf1VahEkJPSTX0F9d2h/8bTxzgpdNwtZFA
	 cBdutbhvXH6SpCdYnkX7oeUSsf72Uh0u6eqV+U4WOw9u55Ufdt4L5zeMRJ2dNqPlidg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BFq8BqgO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DpR+dvKU;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DEF9606A322
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 14:57:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DEF9606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BFq8BqgO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DpR+dvKU
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A9DFGek971398
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Nov 2026 14:57:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g+kkRoXjLnZvkcsVYJVyA99F6A7zMFGj/ZL5HWfx1bs=; b=BFq8BqgOWHBy7rpY
	XytFy+kA7CtV9qJKCSEga+ah0ixp5++GUYK/Mw4xX4A6B7vTvjicuz1jHZ0Mwadd
	NvL7ttkZhTk9Z2ZtAu9LBI25Pft4BOzMZ+Ka44GAShWBXDDJqTpGFX9suhX5E5gG
	zd+oqa0khh4OtC9oyEhOq/i0JZbJDKDktcYzu35upbxiACBlDFxd6M8WrXGvIcxC
	RXl/fqlDEgZF3dIo+mAdgm7N5WtcbSOBg2Uw8uf4HKJv3t1reSSvWnO2QrU8uF4q
	tYK8rpMBE8ihUW5asCWoglo/6hzzrU+1VOANKRt6JWa4Y0alAXyMzwCl3C9QADxd
	li5v2Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4htuqm3nfy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 14:57:16 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ea6b66e53so22112285a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 06:57:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794236236; x=1794841036; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g+kkRoXjLnZvkcsVYJVyA99F6A7zMFGj/ZL5HWfx1bs=;
        b=DpR+dvKUW3JpQG5mLvQ1D9BxUA1zVmYGjI0vs/YntxA0L1Cme0fcVElNOyucUsO2kT
         DcAIJF78JCcmQKWIDKrgy9BF2K4tBJpC7dhUJ2qU7Ct03k0BvajPd9duUYHS8lpwXIqD
         lNpGjUbgLwjN8lcH05fz5Jp+Rsfm/Umd1MGwNm54ANmAaCzJz/di1sKve4DucAS550El
         bX1YLV3H2OonyowT7GbVKJWHrgSVIFON5Y+ZxXTWCswEtV+S9M+Pbx/XSp8ryGGV3ixR
         kbWDo0onJ7csX3UnCQ8ey0hz5alrS3FHG7pfdZ4OCwbaWMUrhTCD3bxO6tjmjQTwgbHy
         /FqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794236236; x=1794841036;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g+kkRoXjLnZvkcsVYJVyA99F6A7zMFGj/ZL5HWfx1bs=;
        b=Fq7cDW+zguioTCPLmHfGoOwK07/YZUm88WHpnLKxcxvN7/PjWUPhobrVwvGmTLSRPt
         o/KxQqTlSVh5hBmSWFrxHtUYWNSvbnYxxyZwDcZkldojiAUsaVrFJJC3+un4E/ndpk8A
         1jrBIS4pdjBEdfhKpckJyAY53WrmemZDOWTAQCcztxQYmzn0S7Gv71Wkii8CdCDoBvVC
         ypjKLjNJhJahJXZ2q/wcn7G+CogiGQmgZRYEA17y7eQorKERu/oBb9596szBjplUKRca
         Sf5F0TieChVuQ/DGtcUUFyopTDPQGwkrKXEb2FzsFPE5xBDWamR+42BvgTyEizi8wExG
         UhXA==
X-Forwarded-Encrypted: i=1; AL+hErFif5sjV+HuCTItx/t6iFVlAuTIiVfYxWAN+n7POQvqWDLbkrVhcmvRyOpHpSMOAzpEDpvD4e8Q2B+Kln9H@vger.kernel.org
X-Gm-Message-State: APuU4Z/FUVeWVQidpFGUZxmrDAqQNF2f020xL8+rgLOr43TXosHIrYCN
	GEPEz8BXyc74e8Nkon8ZO2zwZ5o9f0stigVr5qX0FjFqip4RdoPwmkUq5C9tjzm/kYXqsXZb9wE
	2Z8jKrHKuOEjlimr0lDbRMyMuvXj7gfLyXptKZ56nzMHRP7OIS06DmYgiOk+2aG36nxDA
X-Gm-Gg: AYBFou0N4xmS4WWbWWpKSatwzsh2apPCP8byB3wl43HdLDrjtgiGaSdmLY2htb21+Qb
	UCgrJO9e8By6KHCHZ//USJbMhosnSRpsELZw3HMoADES4TY4NQ3zHXoz89GM0bPbu1aE4cJdyj/
	Tu/Z/YquWchj90HZbUI7MAVkG93bZoFkQyWQnNl+fHmk5Z/kQdIPXvt1s3wUs6mhAKFCSkYtD6S
	u0FHiCJ8xfYY/Cl0AQHNPxKnINHifczGuHYf5jM4bONQGjGjyjyf1PGFmVBRZPTkpBEfgK/eyP0
	LalEXjKKXLwfb+oIQaPZ3DVGI8whBx0K/xl1MsFzJEX3XekobGb2sXyUMJAidAVsSdCPV4oowvL
	KgtFNlx4QaIZyqu0yOkTsY6U3XrhLQnzXpCFPa82K9d+A7AoyFjQ89msFOW9wN82PBT1d0Q==
X-Received: by 2002:a05:620a:a41b:10b0:939:9ef4:79eb with SMTP id af79cd13be357-947842c05b3mr643352185a.6.1794236236339;
        Mon, 09 Nov 2026 06:57:16 -0800 (PST)
X-Received: by 2002:a05:620a:a41b:10b0:939:9ef4:79eb with SMTP id af79cd13be357-947842c05b3mr643346785a.6.1794236235768;
        Mon, 09 Nov 2026 06:57:15 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d69f943fasm178778066b.16.2026.11.09.06.57.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:57:14 -0800 (PST)
Message-ID: <cc6e877d-0d54-422e-b9e8-1cf8b8dbceb4@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 15:57:12 +0100
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
Subject: Re: [PATCH RESEND v4 3/3] arm64: dts: qcom: oneplus-kebab: new device
To: Frieder Hannenheim <mail@fhannenheim.net>,
        Frieder Hannenheim <git@fhannenheim.net>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Robert Oscilowski <drgitx@gmail.com>,
        =?UTF-8?Q?Jean-Fran=C3=A7ois_Bobier?= <jf.bobier@gmail.com>,
        phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261105-kebab_dts-v4-0-c6bbe6ded92e@fhannenheim.net>
 <20261105-kebab_dts-v4-3-c6bbe6ded92e@fhannenheim.net>
 <c25371d5-1693-4ab6-9b4a-7b17a38a4e09@oss.qualcomm.com>
 <DMQRL5NXWCTG.3VYYE9QSVOK2U@fhannenheim.net>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DMQRL5NXWCTG.3VYYE9QSVOK2U@fhannenheim.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDA1OSBTYWx0ZWRfX1tvY5oc0ZkAT
 tDT6KWPhn8H9AauHZbbT2Lc+4MUFAWVyKETjy0+TDBdw6WOt6vl1TV6+nKpch+SWUj9TnrTKCyz
 IpQNRA9xs85IN6wUqqbZgAjR7ecMAE0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDA1OSBTYWx0ZWRfX8cTJzqJZm8Xq
 UlRXJMS0CMsn8c4WAJRSATJZg12PuUIHS16g17LR0cjUqVn7P8pPgHZAzDY6CNIYHKCW13XRehL
 Gx5IueKUVT/6FdrHue0b4q+1dfu/p9DMrvAGbIhNgT6ift2YpvjbLF7hyUI3oLuNRWwDdqzp0Pz
 Yk4y0iEadUcsKSW5fy3yymUryM5JoKfxLfWMAM3CcQlgYMq013VeRhmuY6rdFD+xK1M/UuzPWgC
 u51aeic+M5/TxvPXforarVi0P0RsbWlIYvtNeD5nXB8hR5ScNvGc+tVTLSI5ON1+8oX8rGt8CHP
 l7U5K5QPMG6vzsirH+iMK0dVFhTiSn6dnzf+veIbhvcynYN0fuEzCdl0Dvu38nMA/Ua5N1HsQvj
 9gPMqGrekJIZe6vQPLkaalQgMP5s3hpOTxQn9nN5EP3YCRNAK6aOvopqSvHDrw+Ur79/0J6iiDX
 PE+r5wELLBxOjYx7Aaw==
X-Authority-Analysis: v=2.4 cv=JLquIMKb c=1 sm=1 tr=0 ts=6af1df4d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=OQN141zOAAAA:20 a=pGLkceISAAAA:8 a=WE8o4AYwAAAA:8 a=MDqjLbU1OJPnQEr_jJMA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=6aV5INxNnvWGCTbEtcBN:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: KwTmjgwsYHGxUDlNrtqE5PNXfLRr4Bi5
X-Proofpoint-ORIG-GUID: KwTmjgwsYHGxUDlNrtqE5PNXfLRr4Bi5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_05,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611090059

On 11/9/26 3:53 PM, Frieder Hannenheim wrote:
> On Mon Nov 9, 2026 at 12:08 PM CET, Konrad Dybcio wrote:
>> On 11/5/26 9:20 PM, Frieder Hannenheim wrote:
>>> Add initial device-tree for the OnePlus 8T. Downstream reference is [1].
>>>
>>> [1] https://github.com/LineageOS/android_kernel_oneplus_sm8250/blob/lineage-23.2/arch/arm64/boot/dts/vendor/oplus/kona-kebab-overlay.dts
>>>
>>> Co-developed-by: Robert Oscilowski <drgitx@gmail.com>
>>> Signed-off-by: Robert Oscilowski <drgitx@gmail.com>
>>> Signed-off-by: Frieder Hannenheim <git@fhannenheim.net>
>>> ---
>>
>> [...]
>>
>>> +&i2c2 {
>>> +	status = "okay";
>>> +
>>> +	pm8008: pmic@8 {
>>> +		compatible = "qcom,pm8008";
>>
>> No PM8008 on the other phone?
> 
> There's 4 phones in total: 8 (instantnoodle), 8 Pro (instantnoodlep), 8T (kebab)
> and 9R (lemonades). The OnePlus 8 doesn't have a PM8008. Should I define
> this in -common? It would need to be disabled when a dts for the OnePlus 8 is
> submitted.

Okay, I thought there were only two. Do the remaining two feature
this PMIC? Generally we try to do a lowest common denominator in
-common, whatever that ends up being


>>> +		reg = <0x8>;
>>> +
>>> +		interrupt-parent = <&tlmm>;
>>> +		interrupts = <112 IRQ_TYPE_EDGE_RISING>;
>>
>> interrupts-extended = <&tlmm 112 IRQ..>
> 
> May I ask why? According to the docs interrupts-extended is only useful with
> multiple interrupt parents which is not the case here. Or just for brevity?

Yep just to be concise

>>
>> [...]
>>
>>> +&vreg_f {
>>> +	status = "disabled";
>>> +};
>>
>> I think it may be cleaner to move the definition to the other
>> phone's DT (are there just 2, or more?)
>>
>> Konrad
> 
> The f block is used on the 8 and 8 Pro I believe. So I think it's best to keep
> it this way.

Thinking about it again, I'm a little surprised there would be variance
between them. Can you do

`cat /sys/kernel/debug/qcom_socinfo/pmic_model_array`

?

Konrad
