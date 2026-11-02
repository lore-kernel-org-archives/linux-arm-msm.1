Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617897;
	b=Remx7Cx2hdDAeQ7vJmoEaGRBZcU62D3PZAROjMA2KkeSNtfCAKPPV4r5tM4+DBpmqJVi
	 +G3CjP01LOaxlUZuTjpTxdbsw/+OmYSEBaZzaYbPw3RVDVGu8U6axyQUMFsiWbOs2LTXR
	 pV3yiWp8Sm3tGm35nvGIRB0gRgNszyFosxYt34Av6D9rctZRsaFa4/qKm3dWbrIp/5Kx9
	 sAeyimQz9lHFJh4IycThxcqpdkDGXI4bIywF6W50ZfIjr/eGh5w5vGy6RWmu0FXwwvDLw
	 TYPvXwyqUlrPxBKu/KacDG/b8R9bLdCBrQPXbqXhZX6wt+RbNp6kq1rOAE2d891nK+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617897;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XLIl6X1z8YQm2K5vGZ/P+IEtPgFQw1b2JuxAYXpLPHo=;
	b=z6rgYnZqCaYZK4yiZvQJee4fmBw2ROW+4DywqvERYuNIX0Otc1v391X8awvZ28f2QtGH
	 9/RKalQXAPKjm4r7uZcKvFabNhHawU+VG9zSCAezYlUh1Emin+Wzsxc2Rl8vPTlHtgXGl
	 R+WgEjZkfYCxPHhHUbrIs1419DpSjg+JaEPwI7P1mAcFzPG3xWNY7ny8ubPwUdls2oCLu
	 kTERSKlAn+MWkhDF2T1EkrBbyc/126gwHa967xbF/WgcEG7QUw4E/FWIoliPvVYwMdNTA
	 ESiHwYfLnVENIu/HOrH7zid1dcJk3+oq9wGBN4s0JpWyXozJ58tPVidnZowg9WgIopg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lW4mUyFm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MaMNKK/K";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9552606A329
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 11:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9552606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lW4mUyFm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MaMNKK/K
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29A3s9260571
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 11:11:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XLIl6X1z8YQm2K5vGZ/P+IEtPgFQw1b2JuxAYXpLPHo=; b=lW4mUyFmDfpDprXL
	1+yZwBOBnNiGFaDsQksfEh/D2SeBY6pv0/9J+i73ZRF8rm3tDDWxxE0irRtbn7Cx
	E2asNEbg5amG184AArFfyzZLsozgi5khO8fM1W51uXSn4HV2NbyOvLgCXX2fm5p3
	FYXrhWHvX0OoZQTfqNhBnkgs13GEdDeaX+/5mAqAaPgGmYpwrRqPBQRWnUvkqEdG
	7fjqKboqI4KKIlquJtOJFaW7cB48rEkyP8p7HvipPm2K5ilavU7HACcd0rPbsu0b
	ECEyGMt4xOqWRISjTAOROzgnh0QtwJzWf1RB8PqFB//q5kknqF1+wjtCRoObn3BS
	uaILDQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvrfnq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 11:11:35 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e629c7b16so49778485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 03:11:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793617895; x=1794222695; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XLIl6X1z8YQm2K5vGZ/P+IEtPgFQw1b2JuxAYXpLPHo=;
        b=MaMNKK/KEfcAlYrf8JJs0ePuf6ZvlU9FS+gWy3hUmPVXahHZz42S1HXipqbMQxong/
         g4lTCnBWZVxAaYsC+qhmBP1Dv8whZpJ1K7eRJDuu+U2ctk7UIZZDvp5odWhyFZYQZraT
         qvzu7Uygk04V2nlAF8vGjBT06JsA0Wtu4KBowCB6e1sgGvNBflh3uxYL3PEcp8KBcBlz
         dU4P4A+z4ub2vUGmb+YssgmrHDhMNikwAoUaV4EKohZRk5fvhbDgX4A2fSac0OJfRshZ
         1cD5fJzDNQ2MS/4dB42F+4EplWd0dQn9F4Mi3sDQyFWsz0Vicxh0rtSV93979/oSc3W8
         XklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793617895; x=1794222695;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XLIl6X1z8YQm2K5vGZ/P+IEtPgFQw1b2JuxAYXpLPHo=;
        b=EZ72H2BFP5qKacWEJ4qE8bIN5bLflLAgwaNRWp22eCrwYPCesMR5iAWNl3qJwKsGEQ
         8DlLdtSQQVneaSxnoM/nn9LbYRinZEmtoOXbUjIYXGIx3CUB8Px5aIYpU7eyo/+0ihjK
         Za2bvvRiFo7t220dH35M3lVIOTFtLuZ41fQ8PojYfjyX6pzM4790Z5YRPnbvNS8c2tdW
         zr1yghUUBMZWLkrEft4sVterWagtI/KNj7PzE7ne3P6r0TbcVeKvYZnYSSXdc8I8wmwB
         JPPwSbrBnByufW7PYeaWbX4DbEIRdAsHqEDZ6/5KwAg7ZXRIaucj0Vl06XdUKEV/OP3/
         B0Xg==
X-Gm-Message-State: AFq9FYIXGfY45Hadxkl8HYAEoe6ivtPO62W1SxRGzkUfzmQuwhq+njfq
	1UxTfklxQkZENjNme7EPUpzgM7eYscFSQkEdTGKH0rZRQjSCAfaWwVrXsKZaPLGV2Ysi8apcMyx
	L+ccbDG+6RoruavLd+HRxLmtHdm0c/tr6BARrJOSu2QZWet5YTIW6K3zelpJIxioTCxQv
X-Gm-Gg: AYBFou2NlwskPVOlcKY8g81f0cyhlherafb49hhpqSCeuZZkw8V+YrfqpnjVc3k0RJ9
	tp5doF5L1wpRDWkLltJ+pCqr3x1rJqbdhc3dphVOko3QF+K82iZfKleEuMRMShgz9fzNDK2Ghdb
	rYer7Iy3KBJFs2rtVvIp3TL34wfsYMsMVPKHx2iMP4Fct6Syt2rDe6QXRJGEDY7rJXF9Brk4FIi
	BqjsDzKDCWby61jGUHUS32RCtB3/XLImaWIwL7Wcua+x+Ukixyz4rIFv8Zi3trs6/LemU/uACf+
	CFbieqEX08Y7x01wRmmT0YFZEuPF+SxnN0IqIH9YwsE65qLeSSwFauSWqcxG0PCdP5Stdi9j3fj
	1nH8pVlXSzz8EOx7hYjIB4uRamaeUnj+Rt20t5B0alnL/EFK76Wv2X7LQGvB+WSF0t3/CSek=
X-Received: by 2002:a05:620a:8795:b0:93c:61e0:81ff with SMTP id af79cd13be357-9442155a11fmr1437724085a.1.1793617894769;
        Mon, 02 Nov 2026 03:11:34 -0800 (PST)
X-Received: by 2002:a05:620a:8795:b0:93c:61e0:81ff with SMTP id af79cd13be357-9442155a11fmr1437719885a.1.1793617894020;
        Mon, 02 Nov 2026 03:11:34 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cd291a96csm140778066b.13.2026.11.02.03.11.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 03:11:33 -0800 (PST)
Message-ID: <a9670d6d-28d1-4fa1-8562-0a23dba74336@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 12:11:30 +0100
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
Subject: Re: [PATCH 3/3] arm64: dts: qcom: glymur: Add EC thermal zones
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
 <20260928-ec_thermistor_support-v1-3-d9c1bae4cd0d@oss.qualcomm.com>
 <e77c0255-6299-4718-aaa6-04f4366fe749@oss.qualcomm.com>
 <5d84ee1b-a765-4d6c-ab01-ca1a06a0e3d0@oss.qualcomm.com>
 <c3de7659-726c-4fbe-989e-148bcd13bc49@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <c3de7659-726c-4fbe-989e-148bcd13bc49@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae86fe7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=58eKMYwWEGuKRL77_XsA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: plbN9Q9h6tRD1RN8-ynqTf3iSPH32_Aq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfXwRQttDBZBD5m
 3WOjWQWG8xSTI8yLPeKhL50xN3iDyiVOIBwzxrA9wrihJX1DHRm5YD0ULzEGM/VTrZRb6087Mt2
 sqMfkCDnlqR+WmuH/YyNJjL9tvuehTg=
X-Proofpoint-ORIG-GUID: plbN9Q9h6tRD1RN8-ynqTf3iSPH32_Aq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NCBTYWx0ZWRfX3KTaj01K57Hf
 74DI362kUvX3NvBRkD9/rfBBv25EvHMGegkGrvYbh8rLV93iHtpJJcvnxFBDYFk2IN1fE62zivw
 pJ+KKswj1P3f7ZJ1fvkExWQKLvTreapTfQ1w+deT9zCRgu0WqwSw3hlbm4m49IeSI469YODYrqj
 I7Y2XJacJTntEZHWnTlxToTxv9TKyvzSb9SEu+C8rSZ9jjeiYpfqwcy+C4Pq5feJ4GJt2tRwqfc
 zIxan+YZWt5ry2BPxnJZPKCcZJ2tVM+SICPJlBcbD/RetRJtfHWM8AejnCE9Bvwt6jlVgGTXo0C
 SP0n0nswfVX/3tAOBVCDr5mn3H6ctTUp3fI05bttknNZ38Ie8L4wGdoB20GdNJ/7EDDCGn9bZVR
 v72rF0X/pMsM/HjnPzDGTSX9lmayjyFh6iJQD0IOKcYFJpj489t1XaXADSbdBF5L1fnbMeYSIz2
 vqbMmrWNx5DNRAbDYCQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020044

On 11/2/26 12:06 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Hi Konrad,
> 
> On 10/29/2026 2:38 PM, Anvesh Jain P wrote:

[...]

>>>> +&thermal_zones {
>>>> +    ec-back-cover {
>>>> +        polling-delay = <10000>;
>>>> +        thermal-sensors = <&ec 2>;
>>>> +
>>>> +        trips {
>>>> +            trip-point0 {
>>>> +                temperature = <90000>;
>>> This is *really* hot!
>>>
>>
>> The 90°C trip value was suggested by thermal team(Manaf Meethalavalappu
>> Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>). We are open to using a
>> lower value if this is too high for the keyboard and back-cover sensors.
> 
> These sensors are intended to be controlled primarily from userspace by the thermal governor in thermald, through the powercap sysfs interface [1]. We do not plan to add cooling bindings for these thermal zones.
> 
> Based on discussions with the tuning team, we agreed on a hot-trip threshold of 90°C for these sensors.
> 
> [1] https://github.com/intel/thermal_daemon/pull/614/commits/7f3dd62353e039957e52eeb40c67ec388d543ebe

If you never reach the userspace (e.g. because you're stuck in
initfs) or if the distro doesn't ship thermald, you risk physically
harming the user by explicitly allowing the (metal) back cover to
go to 90C.

Konrad
