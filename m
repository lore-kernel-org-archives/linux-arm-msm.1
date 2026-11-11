Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794369990;
	b=5QBaul9hrHDOY7kYwpUiW+Lv1KZrxoolPwUN86jkxMwvn04teEivm+mF+qAzKYwy4t/b
	 fL6jT0EYWuGpAw0EJANq7jvhXMjMm8CViFfeowcvkJ/yWNRA7KggrT3Quz6epvNP2+7i2
	 9f1W4ooymvQXGyWvb6XVemZZQ7u4N4fO1X4VInu06O92rLLtlVkFalzzX+neRcYFjXiPi
	 FJqpHeZahMZpmizke3her05Py7pVWlcJB6wJ5SXlTxouF02I8/4DKoeHacWnqmn33dWEB
	 myvFVK3LkdWTgtenwE9C9Pt1QVoBD68bEv+WmoGe8UyW0A0/B3h1k/u0hlIt8UN9PPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794369990;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=X0N+eXPcaXDvyNvT+oaZCqoDi7RGGzFN8kPT+kr2B2g=;
	b=qg841ONieH53NbXhjIANvJBd20W7pBiEp1dysF7om1E6ip2BNGtjIIVwk7HT03dY0ljA
	 MZFY6FRIVEOCXWzkKmgUeid7O0xXhiSRO0APIfxbTBIkQKHIyPeveScJBp1Z7XOJmmgXh
	 Ohf+Y8TetQPHRwE9jDgoxBZD0TEIxpDDbT6h0jV/wqtTCpFXJJfamZ4DbumHVERYdv59i
	 b5lKek7ISuDlhmjREGRIf7JGgUb4WGz97lamXJJBZxX1YitihftodfG0Wf7XT3Lr0L4lz
	 cG5JVuQxQArLVhTjSNd1DEJQwI4jCNmq/xxhYVq6+u5U7zBrun78TzLaPMuJofiW4Zw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mcL7E54o;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UHRtWC8a;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 086C0606A331
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 04:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 086C0606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mcL7E54o;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UHRtWC8a
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB1tAMv940560
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 04:06:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X0N+eXPcaXDvyNvT+oaZCqoDi7RGGzFN8kPT+kr2B2g=; b=mcL7E54ozQDbMzmA
	mNpGJabuuRSkm1Vm6Iutj5fzqHDToSWvXi1Z3N3PWkoqcXxx5lUE2AX6Uc7XxFEc
	Mw5xjro7woOr2ZRIAe3EJS0fNZOjXjSl06H7AZuU62I6JK1/Me3CuBDf51crIaBF
	vgMAMDAq8vodazyRJPY5s+zJkO72Dz8ARIEmFlsXyRqJbEfAlzndz+E1Kl7fFVkL
	X5fFMUGyfCy25vKKmnfYNEtpCUiDOwmevJm/tdNyUw9+igItkG1DDK2V8Z0quL9R
	fxpLRcNdUywVS0/ql9XKrAqLuFAdVS7JmRWjhsKHXOSRjEFKq/TrOT6t3+/lUaKP
	Ve+jdA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnm8qtx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 04:06:28 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso5565702eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 20:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794369988; x=1794974788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X0N+eXPcaXDvyNvT+oaZCqoDi7RGGzFN8kPT+kr2B2g=;
        b=UHRtWC8auY3z1Wnca5nuuZH3nXi7e3tS4BjaiWty1RFvQpTPU/TmP56yn2+jKxqQwm
         s3JeDROmjTn3ux9ju27A9Y7x3rYkenKGlX18cTq4sUVSO8bjB6K2KhkdFwkssAexfkyi
         3qSP0VmlW7ABZqkpAgtJpXAdFuR3us65ZFXgfKdfWKdCnDh0reuMIJ1jHvyEuR9a1Sfk
         5BTiZlo0C5qgA/57H3GT+tKfS1HNTVlkvh2No3oj5rfC8f5WB4lQnoBD8FbiFOfIRZjF
         x4ORIETRiYpadsjT49gI2MxMlwvejMH9X9RCpsCFiLtQJg7DwjFsnuYxSjeL8iYyQzl7
         fe2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794369988; x=1794974788;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X0N+eXPcaXDvyNvT+oaZCqoDi7RGGzFN8kPT+kr2B2g=;
        b=CRYkAhoDs9urxREP8USU6A6dDljgUJH1VJsiPwb7vsf5+nHmso+/OmCGmI2RhTrHjI
         qNJ9T3UigFrQIHGJpgnMha72x8Kp4lGA0EW73q5PQnPitzKLc5i9gwsCNVRXJmlWlBOT
         kurxvwy6VGnmD62F3m1txHHyAva/yASXh19+3ecHI1YN8yq8hAX09MIb1YBtn+mvBdng
         UpwfrstkceRimdyGcXdyUKHVHIKUaDIErZeJxKcZJjh5DqJIhgbzr1SKzij4G7QCHgOP
         XWRDFafCGoqzY1+/vI9+v56e44dh3r3lMqCG6qHbilvBg/aQUbJWs/lHVlGd/WIintku
         0bRQ==
X-Forwarded-Encrypted: i=1; AL+hErGeNSGCnQgMQmnUXMJrJ/il5SQS4a51oAzibHzDrrFSN/7W7lxelYbt+NpQAwT93FQ0p/sNA5kzzIbdZEwc@vger.kernel.org
X-Gm-Message-State: APuU4Z9Zr9lM6V4dZ2FS3a/Vrut/8VTshuVa6E52CYR70zgJeiuAB309
	79Yxc5gUjsIm+0UweWL9KmOZfZDo7KXh4w2v2mV0B9akIvQIgTMANmY3GfLyybJyW86Y3DNbSxP
	/cq2ljCzEJzmPCtnEGwA87LxIdsIX1FvWS5+woJmSFPb9cZX4u+WT/9Af7z7KvsLIJk2Cwp66Q1
	Cc
X-Gm-Gg: AYBFou07pQRr5iFOlIUwuB4m3yyv7FDxkw4S/FFqYprcx7cwic/cSOE47ZAtFNR8LlB
	9fCyQRnILudgacvdea63v/YnkbprEjjnEgtHnDoEYuSVF6JS2IaGFslXV/tpRv3n3KyAiVxlp5t
	YDy5Uc7a7jvx4ZEEHey9Ypa1z1qBSOFo09W5kqlQB2ZxnWhFkP0CUz5ciuEUKWlhxF7/93DVk0B
	HnN1zdtreJvtta14ia99RzxAoM8awmVFDIGuKKMB+NyeXLo96SRDeqkIBJ8MCIq5xghLoCx0NyK
	8BB1P0DEHKsCRFXgKQp1yZbwGAArlVif435QJfpdFX3UHqSGAj1cIoPRFmm4F2hjJ17tejIrTwl
	pJew15y97dQ9juWVmtrSGQQHpfFvqd8chFHICiyj/fsXrLLAv4g5dyCMYP9UcTVOwzCra6XVjaC
	t0L0U1i19jzMo75NcBw28ll95pXuEdCdE1ARBbTZp7
X-Received: by 2002:a05:7022:5f08:b0:1b2:471f:c4c with SMTP id a92af1059eb24-1b3c030fcd1mr1051373c88.19.1794369987493;
        Tue, 10 Nov 2026 20:06:27 -0800 (PST)
X-Received: by 2002:a05:7022:5f08:b0:1b2:471f:c4c with SMTP id a92af1059eb24-1b3c030fcd1mr1051345c88.19.1794369986889;
        Tue, 10 Nov 2026 20:06:26 -0800 (PST)
Received: from [10.217.219.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5890e04sm11420079c88.2.2026.11.10.20.06.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2026 20:06:26 -0800 (PST)
Message-ID: <b47f5ff6-014b-4b4b-924c-bd6310bcbded@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 09:36:21 +0530
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
Subject: Re: [PATCH v2] usb: dwc3: Update nominal max votes for qcom usb
To: Akash Kumar <akash.kumar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
References: <20261105100626.2003771-1-akash.kumar@oss.qualcomm.com>
 <e2847855-c096-4aac-bc85-386f5502131f@oss.qualcomm.com>
 <875bc537-af18-4d4e-86d0-9bf0ed7992db@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <875bc537-af18-4d4e-86d0-9bf0ed7992db@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: VQoJrBzrz4j0u6FLBIP2-zcSVqeApv__
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAxNiBTYWx0ZWRfX9gEL0Xuq0xPh
 xI5fd2b6anVnVfStrJC8PBRjaR+kA9DdCcB0DY0RSR44fGDtLptajTuUThePoRck9xcjrpSd0l9
 4C/V72zQau8bIYxdSzaQXN4rSuVJIT0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAxNiBTYWx0ZWRfX+Wx1Ios5XGT4
 KpFN8JAX6B3QpruxAbDXOUM34gZ1ioUC0Vc0eFwGurSnWbFP+01H5S3SKyMgLMF9KIpJphNnt9+
 6cFSmnSbIGABF6AOoTgNxSQ48JDUjdPnj35nZpn03XfvwgjuQV6Tx648w8loF5HR8CstJk+Wqy2
 ySryJzesUUv0/isSmS8uYhE+KMv/EnDcovhZoXn+7/k+FQ91VyLaENvcz0GVyuJlW1SywDY3qM/
 llvq72Y5Y0Si+uM+8d0Q5GwRWFaSv2HSEQHUGs6GwI0sBM74UW5QnZQtRndt8ZgkQCeLStjDGeS
 0KWCXC4kSnkcOrDMzgXXiccvke9A8ECNUGFRj4jR6cTzeuk8j4nx59SvHWt75XZMjMkhJqlbLZb
 iyigR/QjrSYLaDZCsGfqu/zbWZ8PxD/QGUpm/vz+pJ4fJL1b2Oyix3O3amSpuDQANZW8RAkoePv
 KTJLMkad/K8DqK70FSA==
X-Proofpoint-GUID: VQoJrBzrz4j0u6FLBIP2-zcSVqeApv__
X-Authority-Analysis: v=2.4 cv=MpzHeGae c=1 sm=1 tr=0 ts=6af3e9c4 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=dkA42MIeFly6lUBFm3wA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_01,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110016



On 11/8/2026 12:52 PM, Akash Kumar wrote:
> 
> On 05-11-2026 21:11, Konrad Dybcio wrote:
>> On 11/5/26 11:02 AM, Akash Kumar wrote:
>>> Increase the nominal max USB memory bandwidth vote to let DDR scale
>>> higher within its nominal corner, fixing glitches seen during
>>> simultaneous USB audio use cases.
>>>
>>> USB_MEMORY_PEAK_SS_BW is raised from 2500 MB/s to 4500 MB/s (+2000
>>> MB/s, ~1.8x). This ICC vote does not by itself determine DDR
>> Can we scale this depending of the real speed of the connected
>> device adjusted for the real data throughput? i.e. if we walk
>> the tree and min/max as appropriate, we end up with say 10G
>> wire speed, out of which we can shave off some static overhead
>>
>> 4500 MB/s is 36 Gb/s which is way beyond what USB3 can do, in
>> any configuration.
>>
>> Konrad
>>
>> Hi Konrad,
>>
>> Two things worth separating here:
>>
>> 1) The ICC vote is not a USB wire-speed requirement, so it
>> shouldn't be compared directly against the USB3 line rate. This
>> number is a DDR/memory-interconnect bandwidth vote; the platform's
>> interconnect/OPP table is what maps a given vote to a DDR
>> frequency/voltage corner. 4500 MB/s doesn't mean we expect 36 Gb/s
>> on the wire - it means we want the memory subsystem's bus matrix to
>> have enough headroom that the platform's table picks the higher
>> in-corner DDR frequency instead of pinning it at the lower one. The
>> vote intentionally carries margin for the aggregate memory traffic
>> of the whole USB subsystem (descriptors, buffering, concurrent
>> audio capture/playback, etc.), not just the raw bulk payload of one
>> device, which is why it doesn't map 1:1 to link speed.
>>
>> 2) We do already have a speed-based split for this, just not a
>> per-device dynamic one. dwc3_qcom_interconnect_init() picks between
>> the HS and SS vote pairs based on usb_get_maximum_speed() of the
>> controller:
>>
>>      max_speed = usb_get_maximum_speed(qcom->dwc.dev);
>>      if (max_speed >= USB_SPEED_SUPER || max_speed == USB_SPEED_UNKNOWN)
>>              ret = icc_set_bw(qcom->icc_path_ddr,
>>                              USB_MEMORY_AVG_SS_BW, 
>> USB_MEMORY_PEAK_SS_BW);
>>      else
>>              ret = icc_set_bw(qcom->icc_path_ddr,
>>                              USB_MEMORY_AVG_HS_BW, 
>> USB_MEMORY_PEAK_HS_BW);
>>

Hi Akash,

  Rather than relying on DT parameter to determine ICC bandwidth, we can 
do the following:

  a) In host mode, we can register notifier to usb core and based on 
device connection speed at runtime, we can modify the ICC bandwidth. If 
its High-Speed, we can scale back to SVS. This reference is present in 
downstream.

  b) For device mode, we can register a post-conndone glue hook to dwc3 
core and depending on connection speed (DSTS regsiter read), we can set 
appropriate ICC vote. This is not tried on downstream but I think it 
must work fine.

Regards,
Krishna,

>> This patch only touches the SS tier's peak value; a controller
>> whose maximum speed is HS is unaffected. It's set once at probe
>> based on the controller's maximum capability rather than walking
>> the topology for the actually-negotiated speed of whatever is
>> plugged in at a given moment, so it's intentionally a worst-case
>> value rather than a precise per-device figure - which is also why
>> it's sized for the glitch we saw under concurrent audio+bulk load
>> rather than for a single device's best-case throughput.
>>
>> Thanks,
>> Akash
> 

