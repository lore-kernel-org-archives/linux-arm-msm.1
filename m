Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B43C4498902
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 15:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790956647; cv=none; b=lf4kX9CfrYBJc67xQqhDVjDx4BYlezn4OHieeBs4ASDcz2FXWxkaqY4d5raEkwdYKjcP3ZFlKrOQyiQGcEnFRqugNrfixGkYoe4ycjpJ6Z1LXTQdLV8AJjdpJiCinIcXY2gqGBNono2P4uuXPNOADkCtw3zTmGYbAfbTPut4/+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790956647; c=relaxed/simple;
	bh=pffDxeTqTUR6LQjSZCkYskAt9StsM/o4yFboMujZs9E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZoPL00ruVlTeB+tQzAJM1qRa6zM10yhYRVGcjyk4VC3idq1tlgkXm6y24018od6sqxVHMH7N90DZT3gI/vzT4noLoSXUk8pyBa1wb3b/Lb0WADlgSFWVb+ZAoCSgw4cmUU1XmyZM7rHhy+KgYWdtlzK9lHjAj1T+sLJeppvzPMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FtqAUbXX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fDEmL0LJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FtqAUbXX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fDEmL0LJ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692FH4eI435502
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Oct 2026 15:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	STbt/EQ5IYGf9hd0cIP+poyGBZ+Wud5KuSCXYG9Stw8=; b=FtqAUbXXrEynI2sH
	U5Py6Di06ElBCw/2qYdT+TROS5RUYyxFYCDp4gehd/VIJ57MthOzRS8Iqo4wquyN
	CuaeIVFSfvY3pzslvIvFsUl0rsADCooK/hx2lwUH6elqFyxT7m4lwhDzcfR2YUaK
	ZP4SIHHqMHTYt5f/CRx4Wy3co0hk9XipUdR2vmoetdQqJrW1pZs1Sk4XNOE7oTpo
	ytdSQYQUKXZoyPzLgB6iaw4qDWQaeRcInwPlDzOqIzxpMix59sfXTzeeSQnkikIR
	b+CZTtq833n88kJP+k/j7fhauCPj5hvIpFWGEvacrU7nnO3akIbCnW+rGn7FROd6
	Yh45sQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1vxebw9w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 15:57:24 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3a470ead068so31377a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 08:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790956644; x=1791561444; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=STbt/EQ5IYGf9hd0cIP+poyGBZ+Wud5KuSCXYG9Stw8=;
        b=fDEmL0LJeO9hg7lr+T8qIaOx3NjJEzKz8p1UgOvn9he8Y/o0RWS7zmZIwOPI5PchbT
         gzqfoq7m+i8Q1dx4SXEn6vsZL1qWnKhrPUUxEM1dCh75PvvFYkdpNmJi3yN5RIe6EvR9
         05xJcHTfeKTgqgfzyoTCRWwFw/kLgfWsnLgYvgON9efTySHfq8JQ2xf5B5v0NCJoFml4
         5R5YGxBEDir3qjssTCTz8PDIYosvb8fmgiWY/ZE7W9k+YPwMQBv4jgeCqps6INLclkB1
         UZGc6Dz0N6XhWlLw6H/YFp9yXAE/Y6AuS/iL44CA9ER4+3jRfcMMPCa7M4e9uqvByGAt
         ADZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790956644; x=1791561444;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=STbt/EQ5IYGf9hd0cIP+poyGBZ+Wud5KuSCXYG9Stw8=;
        b=tMXF/kyHe67veFEMREe48ntzJ56kAzz+/JBAJ+MhMkY7bLRi7yeIZuXwyi0ZAOeokv
         QxMEoIY5/arhk2liizC/1PDssYDPGGAw18ePfxXRF/E1wEZ8BpT/3qSKmj/bO021ONva
         nxW4TlGoplp2OxgQhjqQ9GEzN0mfEdTvp0mM47y6v2vwf+qFZ939Owj7IvLaEtbudXKm
         57/EN1Yd5Ine7yx877pDZaks6li6VIwcNaVcBFqc4RMoQUiVVCEhWS/yCyVYo9djokaI
         5v9gJ2Ros+y9u0AX93CQYFfmLuSSwV2MRGa6euvqSXLhMjLOMipv776H7r0h4Jn3KXcC
         hmkg==
X-Forwarded-Encrypted: i=1; AKwUvBwpmssmvpfuZg7FmQT660IppaaBYdOiPpfHV55MfrOGR2XWUlWsryRdDuI8ut1UA7jvL4eJSyQj1/bWcVSQ@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6RkuMLjDuB2VgiaouwMYsw//iOnthTF+aTNO63plJv1mTSkjH
	E8a4M/lY4UZL7qYcDL2lLaUkP8NDSTsl5VtQMcvV8gssHlC1/YgfOrsR3kwxINXHzDBU3cenxb/
	VWm0p9SyXL2fWwKzVF3Z8Wb+yn7pw/+bTKIjMPvgNZJcmz6tuVlTJc5LOBFnPt9Xnm2/6
X-Gm-Gg: AYBFou347PlvzsW9FvAgfs9KXsKLPeLYMeBK1Q70C0bjJZX+H8sJdhKI6OGqyevpACM
	DGrC1zQVfADcwP3p6evzzaTvVE+fw3Qu+pN3r8TFmiw6YRENoDpaaeH6lkOWaPGnMLCuc+I22gE
	tl/Dh+mWDVv1xX5rixD5XKPGqMyBBkpgKXLZYaEnLb19euoriqv7QL28MQYVIPvWi8SH/lPobA9
	fP4XY7H3Po2xYKbq3NSU3Xbpjl4VW7jp6UiSRnc6pICwlpO9JiKguhaLdHxruXs4TDTAagPMpk8
	9v7Uv7A5SzzO+95i6UVqf3bN0JzrpyjCzUX1ZcW7oQvBU3/oJHeaM+/ipUpl3VYU12senk8Q+t/
	Bk5UMroHnWIkFZpeF9qagllodC95BRZKfdsNYmlQO7bCUBhscug==
X-Received: by 2002:a17:90b:5805:b0:3a2:b04e:8086 with SMTP id 98e67ed59e1d1-3a6ceca1622mr1531885a91.44.1790956643919;
        Fri, 02 Oct 2026 08:57:23 -0700 (PDT)
X-Received: by 2002:a17:90b:5805:b0:3a2:b04e:8086 with SMTP id 98e67ed59e1d1-3a6ceca1622mr1531876a91.44.1790956643331;
        Fri, 02 Oct 2026 08:57:23 -0700 (PDT)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6dd0cd76bsm1943615a91.2.2026.10.02.08.57.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 08:57:22 -0700 (PDT)
Message-ID: <2cc22f12-25c2-4e01-9375-653b39d8b62d@oss.qualcomm.com>
Date: Fri, 2 Oct 2026 09:57:21 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/3] bus: mhi: host: clients: Add loopback driver with
 sysfs interface
To: Sumit Kumar <sumit.kumar@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
References: <20260908-lb-v6-0-66755ceb16cc@oss.qualcomm.com>
 <20260908-lb-v6-1-66755ceb16cc@oss.qualcomm.com>
 <xji3thurj6lnez56opmh5xoxzjiwtlh4o5qd6iqokbqkcb4rxu@mblahsfmtioz>
 <d05a60d1-3787-4318-b28d-9901d7fd7a00@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <d05a60d1-3787-4318-b28d-9901d7fd7a00@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=fdc4WEQF c=1 sm=1 tr=0 ts=6abfd464 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=5RwuaTuKtwK3GDd0iDsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: x-JJ4lg4R8iVKCRrqQSQ6PU-WxeDalIa
X-Proofpoint-ORIG-GUID: x-JJ4lg4R8iVKCRrqQSQ6PU-WxeDalIa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAyMDA2MyBTYWx0ZWRfX2jokDsFhlAKA
 iZIGDqf6EWCgXufBKZmSs6GuBP6BaggFnGadPKguPLe43xmb4r1F3Msb/UxgAjBux4scXWJtxbz
 iwbWvTKToEVMG8R5r6mtCsjMQsUpZDJwK25wmmo9U2rVrsUut4jlu1X4gjRluMIuRBAqdEXHj4Q
 5bD6gtbwhDvyn+xiK+ua5bLSs/cNE7iLzCwNYYGvC07yXou58txVxqD1kepYg5P2ECuX674X+ls
 jK8CjUfUIvAcXsuVkz4LEGqkNYxhUSoDCVSWxlbW86poFIN5aLhlGPsZnZNjV2OMOD4dnpWuKrP
 CSV1baSGyfGqtx5vKgQzOijYRbbD4BKQQE13s6f9u9+vASNzPBIh8elI7qkfnQwdkjb1agZv8wO
 +t+qVObOjRJJk2Crutto5Ss2uzFjm9n9APNJAxKPe0fFTJpMW9e0X02sKqM3tTlD+Vq6JaVXNIu
 WpJUJ5w3oP6TVCLqGgA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAyMDA2MyBTYWx0ZWRfX6sRs5JNGNKHx
 N4E0cL7opI076EMu/dn/JGpKzTe+cifP82GcFdnB1WaAZu4raENOROFAJlnBkH7gHc4bTv25Jl2
 yFzOQfCUwcJG9R64jeFWs22Jirec+M8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_04,2026-10-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610020063

On 9/29/2026 11:56 PM, Sumit Kumar wrote:
> 
> 
> On 9/26/2026 4:36 PM, Manivannan Sadhasivam wrote:
>> On Tue, Sep 08, 2026 at 02:57:22PM +0530, Sumit Kumar wrote:
>>> The MHI specification defines a LOOPBACK channel. The endpoint firmware
>>> echoes back whatever the host sends on this channel. Without a host-side
>>> driver, there is no way to exercise this channel to validate MHI data 
>>> path
>>> integrity between host and endpoint.
>>>
>>> Add a host-side loopback driver that binds to the LOOPBACK channel and
>>> expose a sysfs interface for data path testing. The sysfs interface 
>>> allows
>>> users to configure TRE buffer size and count, trigger a loopback 
>>> test, and
>>> read the result.
>>>
>>> The new sysfs ABI is documented under Documentation/ABI/testing/, not
>>> stable/, since this is a new interface without established API
>>> guarantees yet. It is unrelated to the existing stable MHI sysfs ABI
>>> documented in Documentation/ABI/stable/sysfs-bus-mhi, despite both
>>> being covered by the same MAINTAINERS entry.
>>>
>>> Co-developed-by: Krishna Chaitanya Chundru 
>>> <krishna.chundru@oss.qualcomm.com>
>>> Signed-off-by: Krishna Chaitanya Chundru 
>>> <krishna.chundru@oss.qualcomm.com>
>>> Signed-off-by: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
>>> ---
>>>   .../ABI/testing/sysfs-bus-mhi-devices-loopback     |  40 +++
>>>   MAINTAINERS                                        |   1 +
>>>   drivers/bus/mhi/host/Kconfig                       |   1 +
>>>   drivers/bus/mhi/host/Makefile                      |   1 +
>>>   drivers/bus/mhi/host/clients/Kconfig               |  17 ++
>>>   drivers/bus/mhi/host/clients/Makefile              |   2 +
>>>   drivers/bus/mhi/host/clients/loopback.c            | 287 ++++++++++ 
>>> +++++++++++
>>>   7 files changed, 349 insertions(+)
>>>
>>> diff --git a/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback 
>>> b/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
>>> new file mode 100644
>>> index 
>>> 0000000000000000000000000000000000000000..9e47e8443f309199691a50d70adadf84f3237037
>>> --- /dev/null
>>> +++ b/Documentation/ABI/testing/sysfs-bus-mhi-devices-loopback
>>> @@ -0,0 +1,40 @@
>>> +What:        /sys/bus/mhi/devices/mhi<N>_LOOPBACK/tre_size
>>> +Date:        August 2026
>>> +KernelVersion:    7.4
>>> +Contact:    mhi@lists.linux.dev
>>> +Description:
>>> +        (RW) Size of each Transfer Ring Element (TRE) buffer in bytes
>>> +        used for the loopback test. Valid range is 1 to the value
>>> +        reported by max_tre_size. Default value is 32 bytes.
>>> +
>>> +What:        /sys/bus/mhi/devices/mhi<N>_LOOPBACK/max_tre_size
>>> +Date:        August 2026
>>> +KernelVersion:    7.4
>>> +Contact:    mhi@lists.linux.dev
>>> +Description:
>>> +        (RO) Maximum allowed Transfer Ring Element (TRE) size in bytes.
>>> +        Reading this file returns the upper bound for the tre_size
>>> +        attribute.
>>> +
>>> +What:        /sys/bus/mhi/devices/mhi<N>_LOOPBACK/num_tre
>>> +Date:        August 2026
>>> +KernelVersion:    7.4
>>> +Contact:    mhi@lists.linux.dev
>>> +Description:
>>> +        (RW) Number of Transfer Ring Elements (TREs) to use per
>>> +        loopback test. Must be greater than zero and must not exceed
>>> +        the channel ring capacity. Default value is 1.
>> How does the user know 'channel ring capacity'?
> If the user enters a number greater than the ring capacity the error 
> will log the max num_tre value.
> Would you prefer having a new sysfs entry similar to 'max_tre_size'? 
> something like 'max_num_tre'.

Yes, a new sysfs entry sounds like a reasonable idea.  Having the user 
guess, and then try to read an error log which they may or may not have 
sounds like a way to cause frustration in users, particularly for any 
kind of scripted use.
