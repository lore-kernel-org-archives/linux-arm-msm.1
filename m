Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 437FF3839A8
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 05:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787031875; cv=none; b=PvGB2qyXaogTsqptse0aFIRUa7ukU+ipkEd/OFnapsjp3baE4AG+jCTtNUIx9I3FGn7pEw/F5+ohR8Lj1A3ZteFzS5fXoQ/68afjACWLkZP60Pgt2+inNFbXbL9Y8JmryJEuSev0PCqEYFiWvZMm2R79WC/nqbGCUYfcJpZ6ngY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787031875; c=relaxed/simple;
	bh=sHE07R+E3ock5k80GQbOzo7oDqEzd7hmLX9F51ZOOTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hXZL2WGkVLcDfoZIu4N6batPArXm38oBnslaejc6WBHOORmS1IyfK4YF6IZcOLGu+fssRwZrpFlSJxLKTT0+l85UIbhRqkr8K6Tdkn4wuqQv1oGt2Ij1bpSTN3zIsUyEbWM1YXSe7J3JYUsfetde8pf3hy7/XBQjB9UbF0Plw1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MdB/aI7g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PpE7smxM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MdB/aI7g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PpE7smxM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I12W2g297868
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 05:44:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HW+t7QxvsT7H1vLeb9Eb6FkDCG/wQu3JC9K2ceXpNaY=; b=MdB/aI7g6QOpoB7e
	XQ8yNtedTszSMN80FoDCnb7nzxWD/v4NxGfy3NpSMA5Cww2bz8x7C3oKErZq9zdT
	Y3WooUHeVCEmD8oy7ifT00mCoUpvQZMmouRctZGKWrxg66I/DB1KjYWrRo2M5B79
	S/TaPRBwEeSHkQKiXsKbwyRSBjsYN3mWAcHX+3Fac9mVYVWFQcfrdDz2LRwzK7bt
	df12+VM46x4g8aUyCqSf3SXcUWjCAVY5FMWSS+lgkz8hOGlEPPfEzCD+C01LNZL8
	ZJhLgzns1iSxqdc1pxS7ia5zwTAPKMQqxzkHgpc5CBiQC8BMG0EuFEWBR2Knafc3
	53DXmw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4dcn11gr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 05:44:32 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f5ac7354dso4859428a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 22:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787031872; x=1787636672; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HW+t7QxvsT7H1vLeb9Eb6FkDCG/wQu3JC9K2ceXpNaY=;
        b=PpE7smxM28GIyE3icKJjFJBGzgGcImxeNo8oQUw05qIgAk0z7/4jKPitCSacgKWW4P
         7FaIn6f77HYcbG81kcdDOreyRA0SwXg1bcQe/+Z9h19auyBNGF4HP94EYDK/6xpS8s+U
         gwuVT+vMuk8LAEFTuM6yDQXbGiaDOAB9bu3r/pA8TrYdq7+PWsRmhkEnjdAWwu1jUsby
         aCH5M3inbymNNmRvgByGXMz4hyIRNaM8NP2swGQv4ZJal2woxHd/N4LSMhXKQHRY5XTz
         f4sroFWo/+ZM/tFtAi1iV7fMBSxMKKvdTm+5F6kDAAjpj8vOzq4djLpw3aarZSTpnNRF
         po2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787031872; x=1787636672;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HW+t7QxvsT7H1vLeb9Eb6FkDCG/wQu3JC9K2ceXpNaY=;
        b=L6xv4Hm4X8ldKyChC7amWrGVSb7wzKm/QDHP+g0YFx/PKci2pRy0sijnZZ0ZGy4BuP
         ShsFy9o/F0tGsMidxaKuzoRg5p8VAEcWuf/3kYvAffp1auLSRjHz8SstLslwFX7cMjMI
         wUqiIwbHamPQI1hGN5Pi8L9eiZSvSJV9UrIGhwVONKYGWg42Na+M0I6xenRSvWm7HAZJ
         vZ4B/AM1XU5auqNuzF0cy9Au96fIVASpEEy0sR106IocfuuMocrntkdUgcPcoWIzm077
         TZbaHBCYB0eFtnafn2yc9SW3Ou9jV91tpTgLN5dpiTWPNzNfGRevbhUFhfSguacERvT9
         4V7g==
X-Forwarded-Encrypted: i=1; AHgh+RrtcGgtws43Oio2J1E/hKx52Tor3oHYbSanqI8T6NLpgbt8P9srnwS9rJM3CFKsYSG1xDIFpgRgJ18tipY8@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo+tWt23hcxvG1RWc934PsfslmjJEz759mQgtzqIXMx9OTtl5q
	6uJhwu8OI/C/CG8bvcvvfLSduojDyzixqwAgon3pYGbDbFZkT/7LIIZrAbCzEk2NjwYyvRTECOO
	L1ODT+5iYoIBiQWveFuXm+vmvAk1cvAjF3ZcQXpYHaWvHWkW4sucx1e6EqGCjTxKZl9l9
X-Gm-Gg: AR+sD10lo10KBMdKtke/e4ov0mmaak4J8MiMaEx9CebkcErpu0Tif/b7wtLqzaSqj7Z
	NkSp+MrijFE54g/D/sMf5BSvSQSO8mW4R4AxVIxA57UWXaHA+U4agddwOcBanuNWdN7tsMAXCEx
	EiKgmqIsxeQKnFalLkQ0x4CqZB7zD+VLB9skF9N0+j94xSowzK66lPGwNqciOFG9+goKkiD3jeO
	HBmv4H7uw53+zpVhQcGbE/pEzlJtCC8uVbUnBzSqxysWs9Uq+lHVHYRt4MpyWmjyuMXtpOcHCjD
	7BXOM7d3F2PBRvwkFivBSVHE/iNO+28/S49Nk3q4og/W/WTbXvtYG1MqOkYGSYzLuIL93lQASut
	JYazPxkm999kPFoB78rnK8JqyQphLIVBHJsI=
X-Received: by 2002:a17:90b:1641:b0:38e:63de:730d with SMTP id 98e67ed59e1d1-3955a3daf70mr5813246a91.3.1787031871751;
        Mon, 17 Aug 2026 22:44:31 -0700 (PDT)
X-Received: by 2002:a17:90b:1641:b0:38e:63de:730d with SMTP id 98e67ed59e1d1-3955a3daf70mr5813168a91.3.1787031871167;
        Mon, 17 Aug 2026 22:44:31 -0700 (PDT)
Received: from [192.168.29.31] ([49.36.209.30])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531fbb41esm7223248a91.10.2026.08.17.22.44.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 22:44:30 -0700 (PDT)
Message-ID: <359e5cf6-c30e-4cdb-a6b2-baa2aa21c4e0@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:14:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v24 04/12] mfd: psci-mfd: Add PSCI MFD driver for
 cpuidle-psci-domain cell
To: Bartosz Golaszewski <brgl@kernel.org>, Lee Jones <lee@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, mfd@lists.linux.dev,
        Srinivas Kandagatla <srini@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260803-arm-psci-system_reset2-vendor-reboots-v24-0-889281373870@oss.qualcomm.com>
 <20260803-arm-psci-system_reset2-vendor-reboots-v24-4-889281373870@oss.qualcomm.com>
 <20260813123841.GC1820248@google.com>
 <CAMRc=MdA_zM_pHCmk7dd7kosqvNmFgA+iXvHS4qpNs9bdsUMCg@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=MdA_zM_pHCmk7dd7kosqvNmFgA+iXvHS4qpNs9bdsUMCg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: DZfatgsS_CS8Gm_N_DXPBsiMBULohO5J
X-Authority-Analysis: v=2.4 cv=Gs5yPE1C c=1 sm=1 tr=0 ts=6a83f140 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=LF1w/1kWa9VLj9Mif7fHrg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5DcdI_qaGnyFb-cuGoAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: DZfatgsS_CS8Gm_N_DXPBsiMBULohO5J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA0MSBTYWx0ZWRfX/VO0Mik/LCw6
 5CNLMKV5ilzQ3N5BKbByDlgcshZK0ROmp0oYTt+MwRWKOuI414BcQCUUTfmD6zr2sJa9UD1zZUD
 4RBgZjrK7XRY1ODJx86scxzvkKnIryLJLIr9H7+miPIoj0+8k6yMRHhDc/vm/ICHninCW/8eI+X
 JG2O9Y5hju7Tv83drpZih3M+p4FTlhjtoKAKr4L53IW5hcCpo5ExnOuY7/LIoJmcR2ViYzdsbJa
 A1prDjeadLoGtNFaIKCbIqkfrl4ynYzOQXweD5Kt2eatN26WaWAY9WCTLstyCJR/SKJGcT+h95j
 sd9q0l9O9B4mD+Ar11WVFogdrwJ2f/O/qzwKm94jf1nfzSxSP2Ifatk9JAQK86r9vWHTEpyPHDU
 SZAcTPYCFUU6a+u//MlmXDmMOolvtkvU6sFPmV8NEOrl2Jdcr1vqAIw1S9QlR/CwCKdpvdqRojw
 sDbyazQjcofPweZetkw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA0MSBTYWx0ZWRfXyryhf/Uut4bd
 +NHWo++1HGC/8MmPq4iwujaiuT38yx67BODcqVDO1Tojzx8w0X78iik7mFZdKP/YB9UMxZ8wCV/
 E7QzoNTCuGYQwLIR/QRpXBvLCYye88g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180041



On 8/13/2026 6:36 PM, Bartosz Golaszewski wrote:
> On Thu, 13 Aug 2026 14:38:41 +0200, Lee Jones <lee@kernel.org> said:
>> On Mon, 03 Aug 2026, Shivendra Pratap wrote:
>>
>>> PSCI has multiple kernel consumers, such as cpuidle-psci-domain.
>>> Currently, both the PSCI core driver and cpuidle-psci-domain bind
>>> directly to the same PSCI node "arm,psci-1.0". Additional consumers, if
>>> introduced, would also need to bind in the same way, leading to several
>>> drivers attached to a single device node.
>>>
>>> Introduce a PSCI MFD driver that binds to "arm,psci-1.0" and registers
>>> PSCI child cells. As the first user, register cpuidle-psci-domain as a
>>> child cell.
>>>
>>> Update cpuidle-psci-domain to probe as an MFD child and use the parent
>>> PSCI node for power-domain traversal.
>>>
>>> Suggested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>>> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
>>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>>> ---
>>>   MAINTAINERS                           |  1 +
>>>   drivers/cpuidle/Kconfig.arm           |  1 +
>>>   drivers/cpuidle/cpuidle-psci-domain.c |  9 +-------
>>>   drivers/mfd/Kconfig                   | 12 ++++++++++
>>>   drivers/mfd/Makefile                  |  2 ++
>>>   drivers/mfd/psci-mfd.c                | 43 +++++++++++++++++++++++++++++++++++
>>
>> We don't usually allow the use of the term MFD in devices.
>>
>> What does this do?  Is it a mux?  psci-mux?
>>
>> If not, think about what it is and call it that instead.
>>
> 
> My two cents: I'd call it drivers/mfd/arm-psci.c

Ack.

thanks,
Shivendra
