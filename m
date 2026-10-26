Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023972;
	b=GXxcEUZYxGQyIoyFRe6pmKXQa7eqV5bt82HnH8UdGuY8SFg7CDNJc36udqBFuXGkGnPO
	 6NHOfbG+vNi0aglgBPjO27yt8xSMTBS+CM5aGZriPgYhrQmlrhhj+1VSK8rjdJmpVs4Ku
	 Br/L0f+ypQge6Wu6Psooj8vFB/6TeDJhuNExSESBhKqSYYR2/ajVxow+0R1WofVaQn9Sl
	 1Mcz4NAiWBVeILb9ytDaU/yNgCYM00/QTI0M0gr9HlEJgkRYCE6du5DaYOr8EdEZiTc9I
	 Pv+fqssS7t7VSdK5m3u1nCUNL3q4XDG8z7TqjoGgDrIkOMBS53SpYufFX1YH6a6RSxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023972;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=f71ES1dXlHTRx/wzrOZvmx0zX3vslqjQHHXhtcOSokg=;
	b=3XlJ9OWOmOeSK4yzZO1pzbvMXZJcBqD/fmCLcGLmD17dDy2IOsRnakh4yTFDw5JdUusa
	 iaTfSdM12HBQY56pGRDg4H6DAbVpkBN7gfSpC9gVz/Eq+8bfXzsJeKfccnh58xQQM7dKJ
	 f8kiyBVn2VdfvPxiY+ZBIhS3KiMjMQFIEiNwYkiwC20Newvdc1aza5K3eF0/wLPXQ94q4
	 jtFJVsrGRRY8m6V4k5aSlwgE288nCmv6ZQO2c/ClXvckb85NfDIDNE4XmnzKWg1BRK/RH
	 WUDqZToqkVIS5LqYk1Vgkg7SITWvwSqcZCmP0W2nt082GL0mhTJHjLbbCobamRfxyCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UjaiqTmU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BkBAK2y8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4621A606A31F
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 14:12:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4621A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UjaiqTmU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BkBAK2y8
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt0OJ2732751
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 14:12:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f71ES1dXlHTRx/wzrOZvmx0zX3vslqjQHHXhtcOSokg=; b=UjaiqTmU7fiHzeyZ
	26KInDkK981IDmWIvg9QuSIwAoRV4uKC480pT7B9TvrbbGMNboQbblR6ZNGkcdd7
	vQt+JGNJSX3DvH11byU/7zUqgnMYTcMB2I8KV36wj0v7Tv6Sd0Ai+VnHteyEeAFT
	WQC53Qbg0aCOJMLFVkp/lDZSh6v22a2HYb6kThPbpe79t6tajROE3x5Mv77jwssM
	OqAcknKfA4zAC1u5nkHH4o4Qz14/wkOc/2TMoJgDUhtRzj2knlTRpztfgTGHiu2y
	fzdVvwp3fjIm9AZq0grmzITjTOfOxrCcLccuy5mgw379LWBrg3BS1GqU+s/OVD4V
	cIKY0w==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj4cp91js-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 14:12:50 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5eae4d7ebd2so147440e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 07:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793023970; x=1793628770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f71ES1dXlHTRx/wzrOZvmx0zX3vslqjQHHXhtcOSokg=;
        b=BkBAK2y8PUc76+Kwqm9PwBeXioHdb+XtGZ14Pij6IusZQYn4d/AL6vxekTQC/V76qw
         U0w4zZpTf7X8D7myROs7WuwwH1VkbR/KuGuNRktAdzdBtdEFn2gMxg3x8cuOihzikfiK
         MEcKjM/TO+ghzquecQX62i9AWTaSEBj6jPKjOfoKhxDwXdAvTbYxxO3sKFdcxOOhSJY2
         HxeXJQiHRs4R87XOjkfC8zkaaPB7FcNdZKLQi+2IyrgeoQwv6uJfgRznexyK4qTOQaDy
         8lh02tFTmA4XT1YqhEOgjUcwJGowRPidMPsQoOxU4xXb3Uo2J1ZQ8pWwufJVy5MvECBv
         BXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793023970; x=1793628770;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f71ES1dXlHTRx/wzrOZvmx0zX3vslqjQHHXhtcOSokg=;
        b=f4TrPY70WECwpeuHgGmZcaUbw93XLyzj2zVxLrUVIQ3o2kcYTmI5M1hVpT9gxgcvHY
         1gjOULhQwPWRCcGEnsD9Wh5OUqZwmwb2rtW5APqtn8/7YCExKo7NgP9xI1IZOl/xLy6a
         xkE7kqrNFtY3r6SVbWxrAywaXX3oS108wmjgRoNChs5rp8fGmq5RDPkorV+6Fg6VApCd
         Y67bg1HMnX5Y3VRAED7yut4Yx/jNBynFoy1NyLIVdP5COLz5Jt3EUArravwrGw13GHKN
         ZAll3UdXBg/FI95SxDafCQ29rUHuQuwcSSclani4EaNkn20RT3B3O9muXqsFLbR6cKJD
         gLfw==
X-Gm-Message-State: AFq9FYKqUjr39JTMgrSLxkq/3EROAZwZ/lafzMJd0/dTvvWAY5bs4y1f
	RU+G8t1iMw548G6z60sLgP8AVZSdEs1NmsnEYF+ij4QILAI+SDtbz6+seHvdMQOinJfQ1Nh2jqa
	2pzc1ZcsINP/2FHWOy1xMUO3uiw4WBXdNV6rPApcgdnG1RoSRmT/CXIqkki0/jOKwQ0zD
X-Gm-Gg: AYBFou2QZIMMZgPJ46GfM+7rSmqwD1kCAFUirOyfHKjoWjf4kvmOFkOnE37tVyBBgBB
	ivA6f4FPpJqfcNw1LgJSnrTQZ1bcYti9fJv0oHLIWkjOXbMpYRswVU8RY1QMUG5edQ98a5DEKKH
	DLGjFGabvziXni7HyEzUbKMSfWOzP29lL7ePVERrzLBJfREFHuY6j29tdFcx5siJQYolvbuyn7i
	8GoC+eGe5NzSAavWFgHz/ziud54hlrIofAzgRayJU16XfgSBE7+xOvhW41mZ8MsWVrD1I+Ur0AW
	6/gySSy4vJ+DIRBuLq8IHku0WNpVGEdq4QuXTnQp1lM0WEeKzHHf3+7+7cZURcfydSPLL5pAayt
	lESpM5lMjoUh8Lo3GXEa6JA==
X-Received: by 2002:a05:6122:8494:b0:5cf:ad27:3a67 with SMTP id 71dfb90a1353d-5ec232aa431mr1648648e0c.5.1793023970312;
        Mon, 26 Oct 2026 07:12:50 -0700 (PDT)
X-Received: by 2002:a05:6122:8494:b0:5cf:ad27:3a67 with SMTP id 71dfb90a1353d-5ec232aa431mr1648609e0c.5.1793023969822;
        Mon, 26 Oct 2026 07:12:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd5202d9sm327107466b.32.2026.10.26.07.12.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 07:12:48 -0700 (PDT)
Message-ID: <e8a228e3-a414-4b2f-bfc8-e3225063bc49@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 15:12:46 +0100
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
Subject: Re: [PATCH v2 5/7] mfd: qcom-pm8008: Add PM8010 support
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>
References: <20261014-pm8010_i2c_support-v2-0-b395d2b3f668@oss.qualcomm.com>
 <20261014-pm8010_i2c_support-v2-5-b395d2b3f668@oss.qualcomm.com>
 <a940a7e4-95c1-4207-91d0-6aa5e715c2c7@oss.qualcomm.com>
 <6a5124bc-2191-4470-9d88-7d41bb6157ca@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6a5124bc-2191-4470-9d88-7d41bb6157ca@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NiBTYWx0ZWRfXzyOXteK//m0a
 62wGT9c9SYTl414cGGkzVHjvrwAHhf9j8TuxVJWHk6nPZuVHhQtEJ9UBam8sYsjAWoDVugMfGF+
 JWO9g6Nvyyf32SfrqqYsIIreCgqghTn+c1P3odIDVZAC0Y10eWF00PJYWj0tV5eHrvew9rbGw5z
 SCUDWEvp0LPSNYQGaqqLoJBPdx/zdL8V2GgD3qepEwGmKIkfgTMDIVEpqGO2rST1TgJmZqIUVGX
 8HFBXRcjg1tqRcIIjxiWFRbH53brFY9BIlb2aQkSawrxLhI4ZPrrm8KqjaiMVihlgDC9EUG8L5y
 lX/z7RIVn0VwWTeLaQD8ijnkOU+jcgUd5mTyjG8uQSSXZIJNtlUg94o7+9ny4RY2Kn04mL/MPDa
 RBX5laWZOWr+89aCqNc0rFWdtr+hl2fginyZf+OTmg3DGQF7KTyQAhRKz2EGqcZ1jf9tt6254J2
 bVdXaLth4Lq/hZi4yeA==
X-Proofpoint-GUID: 3DpP54eJOFo0IPsjFRH97XD4P_qRiyMy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NiBTYWx0ZWRfX5cIYAlP+5fkm
 uX7rtZw9/dmYXo4c9lci4XISqIBYMPRRLNUH36tiEC9r3jBNiwPhcTsdAeA1ajQp34Lm0w1qUAd
 rdISYYI982TPqNZkQcZM4rjvh0qnKqs=
X-Proofpoint-ORIG-GUID: 3DpP54eJOFo0IPsjFRH97XD4P_qRiyMy
X-Authority-Analysis: v=2.4 cv=TboDJhQh c=1 sm=1 tr=0 ts=6adf5fe3 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=1XWaLZrsAAAA:8 a=EUspDBNiAAAA:8 a=QnRxpVyo2ezrWcQ_LvsA:9
 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260056

On 10/19/26 7:00 AM, Jishnu Prakash wrote:
> Hi Konrad,
> 
> On 10/15/2026 5:34 PM, Konrad Dybcio wrote:
>> On 10/14/26 12:32 PM, Jishnu Prakash wrote:
>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>
>>> PM8010 is effectively the next generation of PM8008. The device is
>>> generally designed to serve the exact same function - power camera
>>> sensors and the associated supporting hardware.
>>
>> [...]
>>
>>> +	pmic_type = (unsigned long)of_device_get_match_data(dev);
>>
>> I don't understand why you changed my match_data_struct approach
>> here just to reconstruct the same data
>>
> 
> I was asked to do this by Lee here: https://lore.kernel.org/all/20260922093327.GA2308615@google.com/
> and also by sashiko: https://lore.kernel.org/all/20260918165137.302631F000FF@smtp.kernel.org/.
> 
> Using an enum ID with switch() statement, instead of more complex
> match_data structs, seems to be a convention to follow in MFD drivers.
> For example, I could see the same being done in probes of
> drivers/mfd/rohm-bd71828.c and drivers/mfd/max77620.c.

Okay, if the maintainer said so, let's roll with it

Konrad
