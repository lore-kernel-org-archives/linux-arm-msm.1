Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793779478;
	b=INzMPOBEgXLtxD2Vu0vznq3saDxii93f7+cKVQptoBIyY3+YC7IC/1X5ugW4jw+hP37t
	 2zqFLG7ZjN7ItnygFNcAJtRn+q3fLDRSjW2U7jRMvACXfgF9GV9OWuXi//uSibS1RHYxA
	 Skb1mGwObsqLOJTxy5jKqokW/6g7FWeCjMl9exXrCA8exvBXO8xRw6eJu2m7ZLqkY2Cl1
	 lusoGZRHhcCHaepLDRT07Se+sQhWY5HCIbKb2FWctxnr8gASjtW7I9Fj4pqvFggm2ieja
	 f93KKykR/aPNXmZBmUap05B7QJFxv1UFUuA8CvxqN4FILFe1e1wqFxTcYcx8B9zNsMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793779478;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kgTaEL+t27qW+9vwPPLbMOwWN6Dg2fyARer4F49J3NI=;
	b=yKoS4EICeqZbtPvvVW7BRfa8gM158NJFIRmOn1AVCVbR+xlwr8dQnJnsvfpXeTe5xdRb
	 mrzUQ0CczeJAcFiu5cZlt0koM8X9RQt053w1NXIbTlrKzkDdaHwoToOXssqGVeHS0Bseq
	 p4vWvtCCPbPB7OXdUADn3+029lVPmnSnRV+MrTzuNY7ekuzSMrgKSZ3WudnXUMiIa3MOE
	 NQuaXpzPB2has2RCpEZtmypr+SXnPmZhnsdvSPtGoGk8teD3586hgTzW4AWEAWxUDdFrD
	 ImwbzmJ2vcdBvUHog3qnma6S5dvNDtAN2wRBasruJ8pKks/CjNM/+0fq55Jr2kZtC8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AxxaHJX8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ApqN1Um3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5500A606A326
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 08:04:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5500A606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AxxaHJX8;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ApqN1Um3
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4732S6193593
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 08:04:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kgTaEL+t27qW+9vwPPLbMOwWN6Dg2fyARer4F49J3NI=; b=AxxaHJX8hPHCHxOm
	A6nQm1Hh82MA5pNzS324eYzPdp56/BTXy791bYQ5OQFtj/0pGbat+ALqfYo/3XTq
	MQTy9nMlhJAleEox8MSGY25eUsufnCcSoirk/kYY8oF8O0BCn32SN30kds9kvDBE
	GdmF0ONvcSkcTM/eG0CzBIPbmWLpQ8L66rooZyV6afKNHNond6XwSXgbxhSQtIj8
	lNcsbnpy9GrAeWLY7t2JGsQQF+N7wKduxRwdv1qHqN/l7o36twJHweVlHYiu8/tZ
	wtw2gunKpblTaiOyUZAbsHweercRs9CJIf0v1GD2s9J56LQQEN/cMEWZwARyDfY1
	YB6zTQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8njq7y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 08:04:37 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc2c798d76so10954137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 00:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793779476; x=1794384276; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kgTaEL+t27qW+9vwPPLbMOwWN6Dg2fyARer4F49J3NI=;
        b=ApqN1Um35PpiYT4827hlwR+RgLOSgmQjvuTrzHiDjhZffFBBoJ3hOOqSpHOEMXBo+E
         bLog0wYvGuk6eZ0hoJF51k8yfFeaMijGITCjl98m2vl5a2XccEm1SfNhgc+MN8zIQU0i
         mH0Jx8MKIlX345aCY9iN+1jR1s8vQ01iMLSYwUkrYgRRNNSj1Yd0d7ijK/K0WT7KsV/D
         NOobQxHjUH8rzBnmUgy4t4Ry+SSzs1GWr6D3ODvxn846k3x4k4VP44YZZIG2ezOkRIVI
         Xaf5FRi58uepG6TdaDWDdjdIhn8n2xQZY4YPn1b5LliTele9FdXd0HYa1mzRQ7C0dzmX
         a+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793779476; x=1794384276;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kgTaEL+t27qW+9vwPPLbMOwWN6Dg2fyARer4F49J3NI=;
        b=CO9uxvhVj4DoCbICaG0QE5vTbqVgdadhK++/3cEi6K0INgxQ4c3+s4YdEwWHwC9PeW
         Gp2o3tsssT5k1gDl5LOMmT3KFDyzSNxZV1gNagA/Px+B1Bo5OgoxC7wYdZGwf52crQ1U
         A6+G9WhX03T6PNCcCGACSEZYsL6q989A3F5zoI6KW2YQOJvjyiFtos/fwMOjbNv6Eh5m
         iQ4QeaBV8JdaRDmlI8Szh0vkDNlRPxR/QcSg+Pa+uSa6f2X0GZGXWfXPcSwz3BWhrBzY
         QcFC17HidXEPH5l8T31clruswC+zIyHslyzNw3fAjh6stft35PsW9t0UYcn6c6+R2aKo
         B8fQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJUnxP02NJI+L4278NvRK2pI+dwKhQEGOJiQWBQ0UM/I9Ah/YnfK81RW7eM72HpaEmmAhLIB79oWuLP1uR@vger.kernel.org
X-Gm-Message-State: APuU4Z8g4d888v2hli/LBG9SQgR+QOzrpC4GQxNRrAJp080xBFYHbmiw
	rvw1Hecvzl1FkN3eRvt5PHRUeq3FBwsB2TTvVB6fgm9NjTgxtUl29xID8rQ4EIEQ8XTH5l3Fl1M
	NENUvCcgqKYu0LlZfbxhKEkJd8Kacxk2xXEEQraDZNDvHItqzvyaeNBElVz9z2qIY2/GT
X-Gm-Gg: AYBFou2iSriNZf+BigRTkiREB0gSHW7FjiPfw70EOhXg74OvMLV3RLlDmS/cqqZjs4j
	2Yu9OiNoBT4TkfA/BGkTFzOhkl1pw3SAZwC4Ow2YcvGYZ0OiM4qj5o7pw5IhVlPVOIECAs5+sTC
	oRc/pQmqOD/OK7QVw8PnLcNJsZYeNvs2qEsJWxtvGlMzdKJvM91uhtbjbvfHitvKKTOGO0VZNFC
	KGqPPcUgsEF9uN8tj03XJk11b+nO9DLtsqxxceDALYi2yz2OuBJATJuDvyWi/hcAkZqb9MWdw+d
	RM70mof8OVw5Poy7OSLfyPwShEf0EcVpXniqSNp6hG8s+ILToBnRH6on0kv2qkeIQ+qGTRkaJzv
	ZvDKexmToR5TSKa9WycqQ3Mtu24VjNEgdI90y5pWdm+fS+YhmC8FFncXSWLIwiu3FU3KQ
X-Received: by 2002:a05:6102:2004:b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7d07255715emr6037629137.2.1793779476523;
        Wed, 04 Nov 2026 00:04:36 -0800 (PST)
X-Received: by 2002:a05:6102:2004:b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7d07255715emr6037622137.2.1793779475937;
        Wed, 04 Nov 2026 00:04:35 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e4467a7sm43308266b.42.2026.11.04.00.04.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 00:04:34 -0800 (PST)
Message-ID: <02ebb6b5-4f74-41a3-b6ba-bd8ff24ef000@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 09:04:33 +0100
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
Subject: Re: [PATCH RFC 1/3] arm64: dts: qcom: nord: Add Ethernet support
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261101080413.1428016-1-shengchao.guo@oss.qualcomm.com>
 <20261101080413.1428016-2-shengchao.guo@oss.qualcomm.com>
 <658a44f3-219e-4810-8931-192a26ebdc3b@oss.qualcomm.com>
 <aurl7S0IEOeNHDo3@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <aurl7S0IEOeNHDo3@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAzMSBTYWx0ZWRfX0u4K6VSsonyi
 /Lwe5wTX7Ul4Qx94OLUPMy5FZw+5l8KN4xWEhqbvaO2i+67yaludkhgIzG5vuju37bzOY+jyIZm
 h0lYUmDWZRufIqACAuHVSi//p9d7zvHgevQfBJaMWpJxIamXqelBe6grnhXHVc2jR2tZCHd3Gq6
 uhDxeKBzus0jkBuirWZP0DsyM6RnMZVuYC+W5TS+uVadDpj+D5EOjxKL1vDbfb0eum4Bes0zgaF
 sW+rrMSR4oyxHcME5J2WEwgBkBBFDLkyGUkpsCKhuiajG3jcc0/zJt6xnGNNa9GHEMyrhs0VTWy
 p7yW468oLbdJfjGv4Iibw4hvtEV01uSBGy12L7IQHrwjfK0+XcHhNazLi5qHN5QZgj9KaYbMCfd
 q5dnf/dPAJYAwYFBgv7WEkurIvJaWUfskSoveri6zrJNQVQsdnfHFKNltfnFtpY4u+XSUsOmkI3
 m6tALSmCcX0xsF/2NTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAzMSBTYWx0ZWRfXw4uOdd26vGlr
 f4M2szEflmOAUXKAp3vaa0VTfOE/3wrcyTJOe9GhvIC7iYXzzZ5zNuIyniDrGTtDg0pSoca9MvM
 7ka168loIAI+cuwu7hSV8lK/xGh4U/U=
X-Proofpoint-GUID: JuuOtd2jpp6FAme2NrwmRAOffM-8_usg
X-Proofpoint-ORIG-GUID: JuuOtd2jpp6FAme2NrwmRAOffM-8_usg
X-Authority-Analysis: v=2.4 cv=As17T+9P c=1 sm=1 tr=0 ts=6aeae715 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=lNFNs5cjDqv29Spi1AsA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040031

On 11/4/26 8:59 AM, Shawn Guo wrote:
> On Mon, Nov 02, 2026 at 04:01:03PM +0100, Konrad Dybcio wrote:
>> On 11/1/26 9:04 AM, Shawn Guo wrote:
>>> From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
>>>
>>> Describe both Nord 10-Gbps Ethernet controllers, including their XPCS and
>>> SerDes blocks, clocks, resets, power domains, interconnects, SMMU streams
>>> and DMA queues.
>>>
>>> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
>>> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +	phys = <&serdes0>;
>>> +	phy-names = "serdes";
>>
>> I believe this holds for both GearVM and embedded, so you can move
>> it to the common DTSI
> 
> No, this doesn't apply to GearVM. The SerDes is owned entirely by the SCMI
> server firmware for GearVM variant. LDOs, clkref, reset, and the per-speed
> PLL/RX/TX programming driven by an SCMI perf domain whose level is
> the link speed.

Right, but I meant the assignment to the EMACs specifically

Konrad
