Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0B2449EB2
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057407; cv=none; b=ZvYri0Y9yReKPaEHOVzZ4jb52TUAgQkyZC5ni2FflYvpX+f+zF2qzoRNdsulSu8pbFJuQZ57fbFPZQAzlG7WvkfJgFB/p6qRXsVpIZGoOUi85ZtOh23HRROfFx0rTRrpnv0bH0avhRaUDGqlzWwJlUpjDbEY6gYLCvVKwg5hQMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057407; c=relaxed/simple;
	bh=H8NaE9LzYbEl3BGqNL/O3QntEmXsHzAZ29BebUdMpTA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NwZFql3yoGsnK0enCcQ2w0gT7QM9BleiYYoGEyu4yAlDWvvY13hpEJFv12WF7IiW0UbqCaJVa2zdFarM9xIW5TP6tF/J7vopBl6+F0va8Rm6sAkhjiFni/u6oGslUd9OTlNYZHWMlaFaBcQWgREv0CkvVDUhMjFd3svskVeNyWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UgAysyLw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AIY8rFou; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UgAysyLw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AIY8rFou"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9ThOV2738645
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tzf73yGEud0D74ONzoUYEsG5WGkzmMwPfPRaWzQs8VU=; b=UgAysyLwyHwK9pQb
	adctrMIYnE742HQ/AVojqu8LLGrWCdkYMWz1YzPSx++Xgd4LKbvOQXSRm25G57Pv
	cCDbeF0GltAMdXSyQMDqaCghE+P2cv7Lri+WyylDjUifmH/FwDw+OBRxDj96apss
	uHw3Li8P2SKzllKSusqyP4YXsl87o8T7Cc+adaUNWamezCiq206TZoBq6pzWmZh0
	9pjmlh6j7wjFtmTOc4wMhUJ10ESH8fjMONTkhTNgtIHG1DgZWb9zTGOMWrmyXdX5
	g27BrE9rApAKyy3maOeXu4wXBI/kYYZTa16iTSWJ1iR9WkzxYKxm79KZlxNvH1tO
	VY1Clw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqds9c41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 09:43:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5356c6d98cbso14200141cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 02:43:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792057403; x=1792662203; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tzf73yGEud0D74ONzoUYEsG5WGkzmMwPfPRaWzQs8VU=;
        b=AIY8rFou/JukNxJFqN4DmmMqvhuvl+FlH0J4n+wz+wWzzNz0dfhvjELr5i2ojPhwfv
         wL3ugDOSE2SIv8vPyAoOsJtemZgush28uIz5I1oTKSKKJgBKQzkLLrp2Oy1BlN/3omr/
         TC8nvTZ+Zc7NAXfWQ5z3K+GZrrQPWelWydkhJWsm9ATSEbxohsDSaHldiAhz8WygxWd4
         uefuYh1+4ejHyEAfqtvedcd4hIUMrvbqAP/2JE7fCEEUwJpEX0kyGQBzypdye7ok7hlP
         wOIaUDEOwjXhH6nJLqjD3ur5JdBQsXsObHpsO0W0iXm12/1YRGPcXa36HIwuy6A7YUTG
         wBeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057403; x=1792662203;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tzf73yGEud0D74ONzoUYEsG5WGkzmMwPfPRaWzQs8VU=;
        b=PXcIaXjxAwk+axTaSGvOCLeezQP56E/MBwknLferGw4S/CVyXgJV9vLsgp5nt+Igh6
         rNSGUuLEMbyglIWV+Yy0LVnS067fYfHHgVVqQ4JhPrw7b9q2Z13Qn3Stg8GYPttpxVlZ
         R9mxVSlivAaW517HkMQ1wTLxVZGnBjV637WFIz//3xBE1JehVWGjBOwUuRNzkkYN4LTB
         3lcwM9ug0mnOnH6VjVBlof99PZhm7N+W7soqR4CtsAsnjbq+sjy4Hzwdk9oKzOfjIj3v
         4VFTZdDo+oIN0lrIZGUQxzegkwvZ/wOyiane5apqJq29YjPBFa8Uh+rBa6Q1qypDpJSb
         fN6A==
X-Forwarded-Encrypted: i=1; AKwUvByk/TY/tl3luIvNqx00VuzJqMbN+tO/TgU8LG4Zgv8AESxRNCg3yAw6vCr7/J5CVwFDDbjlvq5ntLUaMuL9@vger.kernel.org
X-Gm-Message-State: AFq9FYJuo7K0/GDC8xemegm/vKWW+j64SlwMHU48/pLfpVft9F9CwVc4
	/gKrLVDyiKP0CEA3erhk3+ELH66EJ2xicQ76kqxRb950+odFHVLLLj1G87aBm3/qzrr1lr0+P15
	HdAevU8K7Ab2P5fPtSpaeJw+wBT68/SLSgU3W99fsqMTWZdDqHcmtAEltpDM8zeT1k13k
X-Gm-Gg: AYBFou2UNLg3YgBDBrNOfFOUyDyDUQCmNxg/5jtGTO3CyX/4iFBhVIYxaUA1MR6F1PH
	uQyYrOLDKObpA/pq8eBWWjqfp7qIij0jwxwqdGjC7qKeb5hczCwgH4NG+KSBHh5fbWbVd5Wr2QF
	gK5LVVy1A598tXP9ndEqXRQ7GCdezfExsfI9OPkDV7lgAqjY68N85fnTm7RuhzLHIs/iOMMqDm9
	J/uYyzRkBRW4mbcKMavu8Lflwr5l6J6d9hWvSzC9sqVNUmbJHiWqJwpPJsSWroG5O7JmoM4iEFe
	Tto5WRnfTRCJf0SMbA2LG6VNOJvJri49nOuq8R0f3y6xxQ0KdC7KDZ5yrSZJpDZb6u4rZ9Vg/ne
	M5V0IPV8UWRPa39yK8zggmg==
X-Received: by 2002:ac8:59c6:0:b0:51c:2324:666 with SMTP id d75a77b69052e-5359fa50f67mr353276461cf.3.1792057403608;
        Thu, 15 Oct 2026 02:43:23 -0700 (PDT)
X-Received: by 2002:ac8:59c6:0:b0:51c:2324:666 with SMTP id d75a77b69052e-5359fa50f67mr353276251cf.3.1792057403109;
        Thu, 15 Oct 2026 02:43:23 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed6be6facsm106366566b.12.2026.10.15.02.43.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:43:22 -0700 (PDT)
Message-ID: <9ae0c4e2-35cd-402e-96d0-eccfe26e622b@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:43:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: iris: Skip SCM call for non-SCM PAS backend
To: Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez.ortiz@gmail.com>
References: <20260911-video-optee-pas-v1-v1-0-7bbddaaac5ba@kernel.org>
 <20260911-video-optee-pas-v1-v1-2-7bbddaaac5ba@kernel.org>
 <38fa7602-f03a-4343-9999-0eda108332e3@oss.qualcomm.com>
 <CAGptzHNO02tQJypLjQD+nKWW76m5R2fo-s=bAJhN=Hmu_oVvng@mail.gmail.com>
 <d293c3a5-7318-4ef4-978e-2bf1c064d0fe@oss.qualcomm.com>
 <CAGptzHN5uTR8w2b3ODHoSTcys4woRBmAf0fa=93H34ZDV+=ymw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAGptzHN5uTR8w2b3ODHoSTcys4woRBmAf0fa=93H34ZDV+=ymw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: h3W2b6NggtSDwbo7Xbi3dtbOZYW06mVV
X-Authority-Analysis: v=2.4 cv=fNusTpae c=1 sm=1 tr=0 ts=6ad0a03c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=XeEdsXCBUZsRL06xsssA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOCBTYWx0ZWRfX+9eYVEcDpa0B
 7pTFIRt2LIPDeWu2G6Q/lbPs4e+ij9kOVO6KhN2j5IJHDD6/bICpYJWvxf6nGl/wpkHyMqBU6BI
 H58O1s0wdluw5o5R/lEThsm4aZ/pKH4ffCIXC+la3k1UP0PJ/7e3fYGz7a9VpAls1JcxP3wM4Qw
 H9+bJxqEPNkDRYqMxRR/7LqL0NW9gwbfHk9+Z/4QY5eIcaI5a8fxPDn4je33Dn3TFe7gQ82ebfP
 Q4K7Eb2YCGKdbFW5XB5tveRE5u5ZCfqVtxYLjZ9vdCnaGKHgxShE2HVs7jbWOGMwEm38ydTmVXZ
 leVHTRZhXr8+fcglcKA/3dJRnwhRw6ePz/+7yTxb3H5zGbqm8YBbUrt2nvx9+fGVeCkWRUxEQPJ
 t2FzqMEQ/JFhGtVM+2yHUpD5e//YVbrGq1WObPJU/maO2Yz8dmcdKUcmKQ19lUfuIfRw5VPkOjQ
 efvGa2Gsha/dR8NYTjw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOCBTYWx0ZWRfX8syIGINm4lbz
 KOp8nl87mBRgZm8HngRn+hygMkOzBfZscI9/+sf3NnyBufON4Or2w8JJdwd6zdq3/1MwuMJElbe
 nMnN5nFgpPZwENc59Q0BGMFvHJ5DzS0=
X-Proofpoint-GUID: h3W2b6NggtSDwbo7Xbi3dtbOZYW06mVV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150038

On 9/18/26 1:10 PM, Sumit Garg wrote:
> Hey Vikash,
> 
> On Thu, Sep 17, 2026 at 5:11 PM Vikash Garodia
> <vikash.garodia@oss.qualcomm.com> wrote:
>>
>> Hi Sumit,
>>
>> On 9/14/2026 11:44 AM, Sumit Garg wrote:
>>> Hey Konrad,

[...]

> The main disadvantage is that we don't want to carry these custom SCM
> ABIs per kernel subsystem with the open source TF-A/OP-TEE boot stack.
> ABIs always come with maintenance burdens, especially the custom ones
> we have in this case.
> 
> Since we started from scratch for the open source boot stack, the
> motivation is to keep the TZ ABI minimal and that too with
> discoverable OP-TEE services like the PAS service.

Okay, I can symphatize with that.

Let's think of another solution though, as a strcmp over the provider
name is 10x worse.

What is the planned replacement on the open boot stack side? FF-A lend?

Konrad
