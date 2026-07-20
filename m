Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC847395AE7
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 10:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784543738; cv=none; b=qG0QWOK2+PBLkR1kimODfycaFqT3PYz5dE0e43hmPlJG7yxd0nbSr1TyzDhWH4tikCCLlWKfNmbnYsvSBYbMr+jxYX+nNp3ZDkobVd0JdfhEBIbYuBn0YzL0ATLibkr4i6gJm9mZ6QKer6UbdS8ZaeE7AxLW5K9x6/uYLmC5RAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784543738; c=relaxed/simple;
	bh=gS52Jb9Lr4yRWxZraCQvcHHB+nkdhUanDAxrT4OUIS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mahhraRfnw+P57s2DLKa/brf09JwAg/lSJJWRsb4lz6Aty2ifjR7mYp5XFNS/VPZcrlCaDQQgmVXnf4f87SaqNqBgpPH9aLmY6zGYEIcIPi+y22pNQCKehpNsyLkmduI4VljQTUEB7UkigYAREveo2XFCf+VITfT/bxHUbJQfLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UjT+1A5+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O0BOOtXV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UjT+1A5+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O0BOOtXV"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K9vT4f3295679
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 10:35:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gS52Jb9Lr4yRWxZraCQvcHHB+nkdhUanDAxrT4OUIS0=; b=UjT+1A5+QV94i2BB
	8R8IY0JjmldJqgx3Pu18ee6N+fPINGEqIqqjeKY6xVDuppQ1cRi/QGnT7Oq5a+b0
	HE2ATAoz6ACJuErlb1hwHcs/XMN17KTyDzoWMYmcqmnLE+aY0zb0FJRQic5wJwcW
	vRtAGqUxc3Xy3WaFAKMIz7fR9AIORfds2W1Z3atmRVJuszVSgzwMC0yoz6uCOJzg
	gv5X79MUb4qcdK0innH/fJ9sEi0FWxGKVFogslvnlqLRpCeSCKJu1QnETUCpV09I
	1/dQpo3L87YLm7MpomOw5QfBsD6QrSiP1AZc6jOtl0pkkpgkS7e1xKVwzmkyffPc
	cnUVGw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfpg0qqw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 10:35:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cefa1a2be6so77637635ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 03:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784543735; x=1785148535; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gS52Jb9Lr4yRWxZraCQvcHHB+nkdhUanDAxrT4OUIS0=;
        b=O0BOOtXVDZuKF5cvBUV9qABo7nM1oNQCr4pdTEs4WJ3F7o4JmXzBqWidOgRA3Rfhw5
         ICH7ZmEBUJHsO+k94ONrInKgPr0w01mPONvx+waurmUWfhL4JfNCtIYuGPxsPvrRHDlw
         LaRkr8hfOhkHRQpxzUUHjcfzPixTb5mRQTrwZbhTC9sH1AZGpW66pec4AZSN0ZY9r64W
         g6vBeOSfEgLhLyYDZmt09l2d+Y1iyP6iAnN0CAMTy1a8hLK52wKhOM9cGy3K/kHuhP+k
         bqKZN6WdI00tm/UZoP4+ntlJc8cpCCZ7rDUSCzXc88Uu34v/9SFze9f46me0Hk3B1bXV
         3AiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784543735; x=1785148535;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gS52Jb9Lr4yRWxZraCQvcHHB+nkdhUanDAxrT4OUIS0=;
        b=RMxfZiwJMZw09KIx3i3cG68WSZrbULLiJpZkE6uPunfwRkQalPOCTAx3Ck+RUGL6UT
         SwwAqqsJEai1GkOzWddwYoQGSRgMB1Jb9vx/wJ35SnaADj6F1md9kU8T82Ts6mGnSgVz
         CIgg8RywXPaVIQPoNSyyuJn8n8/9QpCLQ9WWU2uf3lE0wsyik6L71XUYem8W94xdkvX+
         Zzgq6uYikSLTSKG90OaL1hxvTkgScu0GiO7z6c0GHGt4cJiEOwc0P0KWgadtcAO+6dr5
         QTSkgQriIDiJfnaxbIPkluOYfrbkCJZRfJEmkavKZ4BJ0F2zMEUrAQzktedb8dae1EAG
         D/4A==
X-Gm-Message-State: AOJu0Yyw5lOf7VBz+lJYJc2FW9Bw7FQbFXgmyCc/GKSm6qn/oMcwHLC3
	GRfX5U0Eh+UxDpKgiv1R3nTMdhcWzp35t02FIEAY0csNtoaTPR3uXhYXZLVIi1hkXEmyFhJvFd9
	MD+rq+Bxy17G6szpyAxa2KxhEnXj7bVgnNeRA61nJPFS8847z+r8EoFWnJZqkWyA/7nRh
X-Gm-Gg: AfdE7ckqDcEHyznB5PiYZKKyfzgoH5rFKvV1XRq/VN0IGHQxh39m5+N5k9Siysp0eij
	usbp+Qb07KUirCcB6DddjS2lDS9K36JMYHCEvfOY2YMOdM8REDpNNYVmCwBkgnVoGGQT1aTrToT
	jItpadL4iUKd3PwgIPxDOSwWdRV0HoPl7/mI30ErVeeSldjpZ83zGyw0qCJiusn0604taZq0Cvq
	V1yDO2PZSHDpd3wfRAJde5w9FQ/nOwWuEIpR3YQYvAHbbPA929SN2QTQLJxAMO30B0LIBRLAXfw
	jX07Ag8cux1CDp4FDksc/hGbNo1TNmEDkAa+kD+jukOq1Z/o9vaP+cF7AHOFd3idD3nXr8o9HOg
	lNO3fRtRjr/GgYqJKGPQfdnXBrZ/IO2Mw6YS5T7kYxrMkJBqoayi0SYVobSVlUyGiZKCJePaO
X-Received: by 2002:a17:903:1b0c:b0:2c9:e5e6:8621 with SMTP id d9443c01a7336-2cf3496bdf7mr142578795ad.25.1784543735150;
        Mon, 20 Jul 2026 03:35:35 -0700 (PDT)
X-Received: by 2002:a17:903:1b0c:b0:2c9:e5e6:8621 with SMTP id d9443c01a7336-2cf3496bdf7mr142578485ad.25.1784543734602;
        Mon, 20 Jul 2026 03:35:34 -0700 (PDT)
Received: from [10.133.33.169] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448f614sm53959155ad.5.2026.07.20.03.35.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 03:35:34 -0700 (PDT)
Message-ID: <9c648fca-b55a-48c2-8fa3-27083c03e826@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 18:35:29 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rpmsg: glink: Split protocol start out of native_probe
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, chris.lew@oss.qualcomm.com,
        tony.truong@oss.qualcomm.com
References: <20260618-rpmsg-glink-split-protocol-start-v1-1-c4f93986cdb4@oss.qualcomm.com>
 <43293037-99bd-457a-b190-31fb24625b1c@oss.qualcomm.com>
 <0585ee18-5bd3-424b-93b1-eb841c26b63d@oss.qualcomm.com>
 <2be76246-3430-4f76-b6a9-11de39a961e7@oss.qualcomm.com>
Content-Language: en-US
From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
In-Reply-To: <2be76246-3430-4f76-b6a9-11de39a961e7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDExNyBTYWx0ZWRfX1WEd7IpuBwGq
 s2EI0GSLP/WAO6758sOiWMUqY7rrTfLMoM0RcGLbPI4KLYPPweFR9sXDn24juy0//WYp1ZczwWx
 q2xSijlq7LU9mOuL16TC50WA+p6YCjc=
X-Proofpoint-GUID: oUuRBtvIHB6puNCaomSjnl8xNKaBCklt
X-Proofpoint-ORIG-GUID: oUuRBtvIHB6puNCaomSjnl8xNKaBCklt
X-Authority-Analysis: v=2.4 cv=c+6bhx9l c=1 sm=1 tr=0 ts=6a5df9f8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=X5oELPwlFjtDxv7hUZQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDExNyBTYWx0ZWRfX8LtHU7ZoHx4T
 WxRYx3M1lef7Ilbc0TtONx2aCxT2WLKZyLorMnEmnTfhRUvCkodbwSW+XbLxfRfE1CfDpWM6jGA
 0/JO+N+yiOC5HJruWYpuPPFGZGmEM4ikCNr7L0Mn0kq9j/nFqHWCU7blDuTltyNBfGbbgwAtLNG
 8Lf7LVzfmqAPksVFJa3UfubGc/HbA6owKAGhBb/g6/BGtPqlv+fkhzOVUCVUp1NeBW3yzs4ikHh
 EkiKlQ0y9UXYU0TqrPKtBhOilWgIRb4L/uUpwSUjzFvLR9pIVRic+ppdld8fQwPn0mVRbOatT2E
 YaYJZG0uEAR74Qz7WvJpS+/kggq943aaZJM7ofPO/mZZZdUDKSEH8KgjIGsryHprffv4W3TMy/h
 c9FLGNfLgEFpXTrWx+qDs924K+IDEBA0vklz480VSgtXjIdOe9+aIZwzk5zABXrHtb5y6+pC+JH
 ihXNlbsus9k+BtsPLVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200117

On 7/17/2026 6:54 PM, Konrad Dybcio wrote:

> On 7/6/26 10:59 AM, Chunkai Deng wrote:
>> On 6/29/2026 8:47 PM, Konrad Dybcio wrote:
>>
>>> On 6/19/26 7:01 AM, Chunkai Deng wrote:
>>>> The SMEM and RPM transports request their receive interrupt with
>>>> IRQF_NO_AUTOEN and enable it only after qcom_glink_native_probe()
>>>> returns. Since native_probe() sends the initial version command, the
>>>> remote may ACK before the local IRQ is enabled, stalling the version
>>>> handshake on a fast remote.
>>>>
>>>> Split the protocol start (qcom_glink_send_version() and
>>>> qcom_glink_create_chrdev()) into a new qcom_glink_native_start().
>>>> Transports now enable their IRQ first, then call native_start(), so the
>>>> version ACK is guaranteed to be serviced.
>>>>
>>>> Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
>>>> ---
>>> Would it not be simpler to just move the devm_request_irq a bit down
>>> and remove the NO_AUTOEN flag then?
>> Thanks for the suggestion.
>> I analyzed and verified it locally,but I'd personally still lean towards
>> keeping the current change as-is. My reasoning:
>>
>> (1) The IRQ must be live before the version handshake — that's the core
>> point that can't change. The version command is sent from native_start(),
>> so we need to request/enable the IRQ first and only then call
>> native_start(). That ordering is only possible with the version send
>> kept out of native_probe(), so the split needs to stay.
>>
>> (2) Dropping IRQF_NO_AUTOEN does make the structure a little simpler,
>> and functionally it's equivalent, but I'd lean towards keeping the
>> request-disabled + explicit enable_irq() form. It makes the ordering
>> constraint visible at the call site: the IRQ is requested up front,
>> and enable_irq() marks the exact point where the handler becomes safe
>> to run(glink assigned) and where we want RX servicing to begin. Folding
>> that into an implicit auto-enable hides that intent, and I think the
>> explicit form is easier to maintain.
>>
>> That said, if you'd prefer the simpler form, I'm happy to do the IRQ
>> cleanup as a separate follow-up patch on top of this fix rather than
>> mixing the refactor into the race fix.
> Please don't paste AI responses into your email client, there's a human
> on the other side..
>
> If this patch was also created with the use of a coding agent, it must
> be disclosed and follow the rules established in:
>
> Documentation/process/coding-assistants.rst

Understood, and sorry about that. I'll pay more attention to this going forward.
I did use AI tools to help with some of the analysis, but thatwas my initial view from the beginning. The potential issue here is that send_version() run before the IRQ is enabled. If the send_version ACK arrives during that window, it may not be handled. While removing IRQF_NO_AUTOEN and rearranging the devm_request_irq may simplify things a bit, it doesn't really address that race.
Thanks, Chunkai Deng

