Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795782538;
	b=nhJWigF4hHbWi50S5bR7sTP035qM8aY+8Isno2+thZdTLcT0OdkPfTSibb18tmHxviSA
	 u2CGUsq+CGsp/RE1RM3E0+BVmF4WQtitppzqx8dzLfQhJx39C9kgvhU7Xvyx2DYX/GMT3
	 91BKnShgzoqoyprKJxhQ5jvTqALawz79yKARTizUBXFX8HW2xT67RZ8IQA7Y9YhIOkP02
	 BsbDS1CHgf09rpQHV7aKuAXQz8ac4w6dBiSl6QmQ2wS3UEcl9O4WEkfFB1RRMB58Gtoh0
	 L/Qfb6dPdy8EIO/fWBQO2PYDsawN8Go6yi8gozNKPmU/3q5N5rWYshL8qtpA/RCSIKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782538;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3iHq8357jseZEPfEyY2Z08chWi95v8Y1kHGpmZ69UH8=;
	b=cPsjLhWOTFX8clsH56/OX1QmRaKqXt5b5xcpDkShvxPFtkhoPMyskwf19W/1D1XIKnPT
	 bGRZ6Kkrt8nPIYPOgNAxYMqLsqdT+syINUbtZ9nWRtli9a7PIonUhvAQb61P2gKeqGSJ3
	 vC+cCcqYU2DEWHyIebNXruWxySQ1bokhLuo7WBDrCIYXZKiBlCj1C+mShZ09frKw3Rhtw
	 DWeZJaiiNuaEAwGIgVzExu8mYriT4sE16DP3ryF4I0roatRiLuNbAOYU7XYOcRCI1Gw6Q
	 7B8p5FwS9ebjTv+0V5PpGEs4PMmAI70ZjLAk3s2+HVBqhB39Q6K5VfpBCL13SVgxGfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iseZnTaF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YX9UkW9u;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DF1606A324
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1DF1606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iseZnTaF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YX9UkW9u
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApdBh2058280
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3iHq8357jseZEPfEyY2Z08chWi95v8Y1kHGpmZ69UH8=; b=iseZnTaFgCFpXMMw
	ec54HP9LDjwx4J65rptPmYVSvR9ZcDicWkOail3UnLs0byHjKYWMNo1GFxsXMMaT
	AAsG1do/JGmeBEBCBMETqd0rhVBErVyd3aUJADH0blpW0W+mOJYvmWtJpQrsP7yQ
	3B/VgyhcB6JI86zaF3nys3t5LqLc/3ygda+RvP3K4DnRHmHIhN6Mxf+mJfy2FXIq
	a6o/ZmXfdS0TriFMKF6Z64/acVmkRUOyMgXtaHa+CVseJKoBS7qsdwfBSNVRo8pR
	laT65WJvAbSB9odsyCvwEcSfISbtiCw3URmyrXkSfyvoDXX8g3h8+m8KsxAvmQ6k
	JdpzLw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gase1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:28:56 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-154e9d2d94fso4684273c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 04:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795782535; x=1796387335; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3iHq8357jseZEPfEyY2Z08chWi95v8Y1kHGpmZ69UH8=;
        b=YX9UkW9uWFJ0yjsQxmstXaXn1XAWYR/psowJD+faKQZrWab5k7NnRFhYS0lv/fR4xi
         DTsRPPsoF4xAWtYxNPBUddBktADoTeKoz51IPqXjdwopHmdt/aLAjhX12JrTvkzZxr/i
         7/k+B7x3dkSNbNwUQgQDMm1rfJMjBRnZaIUXpRccm6+162euk6F1wcWdexZ5wi9irC9d
         fHFUfVpoxcKk+3tLJkh2QZjG3dABoGJ8PBCMnamq89zaWCL+W+QMhbWqrZuAFFzr9A0N
         PyEYh+VFkyYcuD2EHudkWb6MU/hMNx5xb6TmfZjuTpz1KLncAvhF70mPL/YfddFo38aN
         mNFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795782535; x=1796387335;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3iHq8357jseZEPfEyY2Z08chWi95v8Y1kHGpmZ69UH8=;
        b=V/YoG8xZaM3FTc0fw/wUnlHb/uX1pzxzkYiIP5xk5scys9LFnrHxOp2Zo0FrZfMyrt
         YLmilPLP25dQnV0Z1yU8eHuHL39ieJlOkKR+2keLc501orydnqbTD90devSy3DIcHY1c
         n0IWyV+rMcI9uVSjZo83RUEObFc+y3On5fUoEOL9BB1JmPaWiCgxVOzWO5l8FisYYnc9
         yw8DRRok944/EnkcwnXOfpxDtwgp/Z7U94uqELywsBoS56yLOwg9IqdSNKh5pbvjXYt9
         g2bIsWURqCBd4k9xq2sBmdWjhJOxoUFJvFtTWXWJA6gX88zt6UtqUYF2p7+0S66X+mW5
         WJ3A==
X-Forwarded-Encrypted: i=1; AL+hErETWiDZVsG4Am67KS7hJ1BXvf2bGbL8zi0lu71y03Z400qrn3QC+gFDqu/A7fZNL1zWFCarS6aasMteHxtR@vger.kernel.org
X-Gm-Message-State: APuU4Z8V2cU/IDPRVvRL/SvsdUuwMfTHS+qvCn+kjf8JV0/6tYb+ZQtX
	y0y6IUgULHp6T3VrmdesHLAzlAIKoZnW6eWFZeDC3pRXjVBrNzCjgY49rsgYUVdJzcNp+CXczeO
	pq5Ln3X2UP19m3/9HK3zmbDlsPtZwRNXQGd3b3b0QpYlQ4eYgaHdlgaHqzzHyOVUFKehb
X-Gm-Gg: AZFdTZfi54YnS7mKjDa7a5BJLpJ4Uhgbt4lFz//qyuCoIntispFiLZc8NOcZouO1//o
	4dhv4ImvFZ5vJObcUar/gd7KtzidtkzZoS1jTfuLpI2mWkI0ztE4har3oYq+bwPIWlsFYqsHuBo
	/kP1NIE1QPKmVbx6IeztmlkPfFRZbEqhKvqfblrs7Y6hDLu6cpUUDtFW79TdTyqV/CUWxNdtjbK
	/vhl0+2HUhRNXlvwDZgcz/iOOM9pZKDqkMdHlgLyF+bdM68lMei84Q4xaMR9efB+e784v7mhVdx
	UQcZCWId3u5lMMCeGIGiUOf6ZzblmZ3W8g3HJajhBBs/sWyLjT9iAiIj3Fv1xoQxGa1pUpIrcmU
	rx+m7UV6j7eRui6op8eyVQJLkJRSySQtHnX4ay2dA/UUJtzJV+wCTDyIEq/Fg5ZHy9P42MGG9xG
	RrRxjC
X-Received: by 2002:a05:7022:ec17:b0:166:862b:9bcc with SMTP id a92af1059eb24-1b55689ad7amr31111916c88.18.1795782535487;
        Fri, 27 Nov 2026 04:28:55 -0800 (PST)
X-Received: by 2002:a05:7022:ec17:b0:166:862b:9bcc with SMTP id a92af1059eb24-1b55689ad7amr31111888c88.18.1795782534930;
        Fri, 27 Nov 2026 04:28:54 -0800 (PST)
Received: from [10.206.111.23] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b562a82b3fsm68351064c88.5.2026.11.27.04.28.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 04:28:54 -0800 (PST)
Message-ID: <704a4e68-ee5f-4ed3-a975-49c0b131d6b2@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 17:58:48 +0530
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
Subject: Re: [PATCH v3 3/4] media: iris: Fix use-after-free on unbind with
 open sessions
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        sashiko-bot <sashiko-bot@kernel.org>, stable@vger.kernel.org
References: <20261119-iris-handle-unbind-v3-0-52d467a13907@oss.qualcomm.com>
 <20261119-iris-handle-unbind-v3-3-52d467a13907@oss.qualcomm.com>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <20261119-iris-handle-unbind-v3-3-52d467a13907@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8bGl3Iz-VtgaS706oLFwr6ilO-h8XZ4k
X-Proofpoint-GUID: 8bGl3Iz-VtgaS706oLFwr6ilO-h8XZ4k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0OSBTYWx0ZWRfXxbDozlXVdN1o
 FMlmz/LHvEbxcCAWDpHpztLXRXds4JQ5ooF04VubW885NtQfDggjTUWjwf4IiOqpV/ZfiEbesG4
 azYyUlqrFOh0779FBIMUwgvARfxzDCLQw3meZPeB9oU5HlRQvoVALVSRegcFizs5ad2sfZX6yTR
 q0mAQZgSX9Z4MiloAtOGN0CQv4pNiXUpYd4UcZTUhEwfuzuOryGTOOXYfItkGnkBB4lGoVACjYO
 ZeV4M4rm9x8oYADnWv5L9yPEwVS/N+Ew0NmycUuA44UBT97QY/PhvKkCtheylDk4F7A5Nnu0xqC
 xprDCfgTliNBF9JUKUxtOOUY25XkeYyWEEGrb3cIPHR64SO+qVXaK4YaKmdWSWDyqs3W16xp1N0
 Sa/szdcDn15aZy+Ie3HZCsxR/nQArSxOPFOcX/qeGw7aawyoK/rG9rDZt/mKxe7Nk98/EtIlJrU
 IUHrk6UEdyx+zfQI9tQ==
X-Authority-Analysis: v=2.4 cv=I5bw19gg c=1 sm=1 tr=0 ts=6b097788 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=g8Q9F2srHmfhVmvwUhAA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0OSBTYWx0ZWRfXxIZtgomoEgiH
 QvkgOnicn+bYyi6l7NcoPWZqDgcDHsXpjGJFlGD4MXebv6C7QoDKWqjzJKM5FTlnyjeecfAhcXN
 yXbt0Ld2Y2XgKKnXNVmdr5t0YFwM3+s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270049


On 11/19/2026 5:15 PM, Vishnu Reddy wrote:
> The driver can be unbound through sysfs while a client has a video
> session open. The core is devm allocated and freed when remove()
> returns, so the open sessions then use freed memory.
> 
> Only the core structure needs to outlive remove(), because it is the
> only thing the file operations of an open session still use. Allocate
> it with kzalloc and tie it to the reference count of its v4l2_device,
> which every registered video device holds. It is freed when the last
> file descriptor is closed. The other devm resources (register mapping,
> response packet, clocks, power domains, interconnects) are only used by
> the power on/off sequence, the clock and bandwidth votes and the
> interrupt handler. All of them are released with the unbind, after the
> core is shut down.
> 
> To make sure nothing uses them afterwards, set a removing flag at the
> start of iris_remove(). It makes core init, new sessions, command
> writes and the clock and interconnect votes fail with -ENODEV, so a
> client still holding a file descriptor cannot power the hardware on or
> vote for resources that are gone. A client waiting for the firmware
> only times out and returns an error without touching them. Runtime PM
> is also disabled explicitly in iris_remove() instead of with devm,
> because its callbacks use the core.
> 
> Callers that hold a runtime PM reference, such as iris_open(),
> iris_hfi_queue_cmd_write() and iris_scale_power(), can still be running
> when remove() starts, as video_unregister_device() does not wait for
> them. Take an rw_semaphore for read around the reference and wait for
> it in iris_remove(), so that the references are dropped before runtime
> PM is disabled and the unbind releases the resources of the device.
> 
> Fixes: 38506cb7e8d2 ("media: iris: add platform driver for iris video device")
> Reported-by: sashiko-bot<sashiko-bot@kernel.org>
> Closes:https://lore.kernel.org/all/20260926064921.976721F000FF@smtp.kernel.org
> Cc:stable@vger.kernel.org
> Signed-off-by: Vishnu Reddy<busanna.reddy@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_core.c      |  5 +++
>   drivers/media/platform/qcom/iris/iris_core.h      |  4 ++
>   drivers/media/platform/qcom/iris/iris_hfi_queue.c | 18 ++++++++-
>   drivers/media/platform/qcom/iris/iris_power.c     | 24 +++++++++++-
>   drivers/media/platform/qcom/iris/iris_probe.c     | 48 ++++++++++++++++++-----
>   drivers/media/platform/qcom/iris/iris_vidc.c      | 15 ++++++-
>   6 files changed, 102 insertions(+), 12 deletions(-)

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

