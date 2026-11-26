Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706955;
	b=b08iXG2iiPoUkOba/anGY4H+BxDVMsgxai/UjuNO8D/NCtNK5y7N5h889Y1U30FRwwAf
	 8XjmYPJvuFQ8q3fcmRPUFyua7M1ZFD1pbqfrGRCZErjb15FAKaXTeoHjzKTo6T+mdJJH2
	 AMXcgGj9XAq/c9k5dDxjpKzH7T1HucjPYiQ3Ws5zsNsRQw2YNfoY0ie7ui2ckr6LeTLTz
	 edEM15xjkrWd5aBYSD9ymqZs/37colaDaeDBtjhB5KxyU0cKYi0UCIs58jgswumtx80u2
	 Up6zmESiQTvrjYYn6d7nHshL8Mq/u/jB2nVh+Vn18i2Gkz8KErSH2D/21NmlCLXoL0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706955;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4Avc+sTpAvITn8tvFDLpyq/WRXcoXa74D7F5mNDMS3I=;
	b=zaD/BVO0JTyPURAv3FlChCmuk02JU+AIp2hfUng7Mg4WlIORatnTsYWTpsljYMb0I/n4
	 O0lOaaM1RmJUTRHmyVS9SX6UMweqs89jzQwXvmvQNiJcaItjbx9wM74dWiG9w4fUaxRvv
	 ZUKK81dtzJDjp0/v0GK4kqby0hhGm3WqFZa/WAfs6cryIEkg93uEt5XzBrrBftpERzhBO
	 /sHhD5WHOZPaNOXVeZgAnrff1yoyCPOj8hQCFYb6K8rVVsQAXraOxRvyIcFs/Fha8PtsI
	 nBppSfW61b7hBNzKI5guypGbAPx0Fak83H9QKAW5xUhU8VZ06ImYQzQgQnAbk66f77g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dqn0kUaS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="M/GUgSyl";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49432606A321
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 15:29:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49432606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dqn0kUaS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=M/GUgSyl
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEVAM6088634
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 15:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Avc+sTpAvITn8tvFDLpyq/WRXcoXa74D7F5mNDMS3I=; b=dqn0kUaSSTo3y8pd
	o2AKQM9P8Ie52h+H8EoQescJqbHOWMLGQikInVhQLOoOhNa4+3N7ncCsaZOlZg4k
	7wUA3nrc6FVrxvf+i1m8+66lStpPC8CRFKR1JZBcml/F3VUS56A7f/11zwPSRWAY
	RQitCzMu37BgfoWn0/lWbdxKdRJkQP74qrYyJvsXzgqbzpB5O5ocoRagzbrDKyaf
	v4DY+DJ6lYWkajnB6GkDd0BDHNHLWGgDGZQHmYoYTiM5uPQZZ7XXdOpJLfPuHAmx
	71nibQIrw60kqn/AFbtGqfGTUUsGFcd8LWo1eOM7dOWGftcM0+3Xe1tc6ds7oVrr
	cJYcxg==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6hm81d55-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 15:29:14 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ecba171914so329474e0c.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 07:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795706953; x=1796311753; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Avc+sTpAvITn8tvFDLpyq/WRXcoXa74D7F5mNDMS3I=;
        b=M/GUgSylRCWxD5mNp5G1i66XNGjIhbXUwCBrTh15lLw4RL/DwJ1K8Pj4oFYx5q8aNM
         lyG90mOBr05zvm4ZtkNdhIA5xnMVuPR5Hm14aQP3SG3jxKjFzf7yEAV/VZHLRZ4TDY59
         wQDgl/xCFcYiKFF7n7vfxYshrSZd3PVs7VaaR0XEd29U5sxYSNZo9RGa+5S2tr/65OLQ
         V55hDEnSqd0voK0JhN4LsYELqo+1FdFfPyI7atKvV8clDvdMQhrZClzTNjtc3ApVGoq+
         Sez+AoZmOri0emrw3K0BQCWKM44/0WUU5pv31qQd03dk4HgQizN4HotwKacFkoMtAb62
         IfYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706953; x=1796311753;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Avc+sTpAvITn8tvFDLpyq/WRXcoXa74D7F5mNDMS3I=;
        b=0oNjvXxd57bFtPMNcJHdXjs/J8QeBSiMawtzOSVR6wx/0ZwCiiRz+Z0ejZ7q5cCHz1
         bOp/Q3Up3jwbm/QtaEUdQ0cpcbiXO6ZClmS6D0v16yR3vK8gzeON4VYaUJy+v8izaF3o
         HlFXHuRTOp8Yqc+rgTl/z+ANHnQUm3NVlir5fYei+BflYSyCfWkYE2Xxu7xRdeoAGD6d
         ZQLX8lTWeWrEPoLPK0YGXzDWh4l4ZJ3a6mHX3yH5rb8gOdSTr1lSr+0BuK8dwYCGuLfZ
         rCEGBqYUB3VZXT37Z6hwFqZjVVcogICOuQi0X2fKvmsiwP52G9IUJGtxs795e2Su+o4t
         EveA==
X-Gm-Message-State: APuU4Z96iEeeCqGpaJOLFdOwUvX3I48gQ0tnwLI2vnNiIhPXADtEGWOn
	LQ4o8XbD8AwYl37Uc7AXO0mUczZTRbDS5G6lxOcIaWQhzNYvlSAfYFN/vjXXEJl2VgG/sXj60Bs
	TJL6YgOQ0IXF6+c817G93NGJ2fq8diTF5lD7Jfk1AuAB9pSjs36xiGtokI+UFkFlckF+k
X-Gm-Gg: AZFdTZfQOS6lFQzZZXZ/HLWbzFA3tqcIlykXE1jpdLBalNGI8Ra6ChOpnVpb5ULiGwF
	Psa8Y/p24yuc4+7YF8B2YwR0Nt3+9TGKX0/Qr7TCZgW5aBTtLYExjoEsdFXCagqyGei/dp8DU9s
	CILEpGdlB0d1qLK8nFjiVAcaXYX9Pb5JtTdj7Hx+KYglu84pRVB4yoZpHCiJV71VLlzlcsm/vPx
	+pRcarGzmGqtq4Y0w5dtbN+jftsrUe64IIObq4Afoji4fw432sQhhyKWOdvssEB8zY4rzEn7v7G
	5vDrviZhkuoPaz4r2E7S7x3SSliAkbwsdzWRYQelKbfK7M1Ssx0JhjXzrvaubUd9RUzCLfygkSo
	mka4OFfMOBIT6zJwVbqWkK6UwLzQ8mfZgP14PfW0P2qF7RJ65f3XRFJ8BIZALbfr1aKeTLSE=
X-Received: by 2002:a05:6122:2b1:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ee8ad0ec78mr13671385e0c.0.1795706953508;
        Thu, 26 Nov 2026 07:29:13 -0800 (PST)
X-Received: by 2002:a05:6122:2b1:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ee8ad0ec78mr13671332e0c.0.1795706953035;
        Thu, 26 Nov 2026 07:29:13 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b01e242sm739907166b.82.2026.11.26.07.29.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 07:29:12 -0800 (PST)
Message-ID: <6962c4ef-ad14-4984-9df4-4624c4bb50ae@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:29:08 +0100
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
Subject: Re: [PATCH v2 1/5] drm/msm/a6xx: Add Adreno 753 support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Shivam Rawat <shivrawa@qti.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
References: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
 <20261118-nord-gpu1-v2-1-8d6d9908b7c5@oss.qualcomm.com>
 <a005f8a1-76a2-46ce-b328-2063bc307758@oss.qualcomm.com>
 <70651641-b264-43cc-a745-178ef2b02680@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <70651641-b264-43cc-a745-178ef2b02680@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: P6aN7uJb7GlkskApQLwLUnMOYa4SFPzB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2MCBTYWx0ZWRfX7uBVY4RvAYXI
 Xr8gZXxF26AhoH/mjhk4c7rLwS47NfSXGcbCiBGVOj1z92P/tl2MaPJDdQmd/Ngo4QXfium/dgk
 bebsLoRvFRmr0O5Z7YbuKqj/6O1sHNw=
X-Proofpoint-GUID: P6aN7uJb7GlkskApQLwLUnMOYa4SFPzB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2MCBTYWx0ZWRfXy2X2Zy6Bl587
 g1o1Dl95R8VAmwfW9kQ9cCZwaoXjMPIWEAZ0VolpOpTDcuRmOv6w5RGZhmE8tI1O9MzLS4OgSW1
 bvBfzdIvCLgzXSp1fO5m3oPqvwq0Y4Gh9HtKak1hfXSha55r1R4aQPyXeXmvBM7E/D6crEOPxjs
 Nnfb10EuQuxPJjF1ZU9Tqi4M/Ev6SQX8NnyjuF5DdkZmjKPTT6G6SPNq+RF0J/DlY9ijBL+XBb7
 brkQRDlC1u0KEmsdT9ShthYGe4vnwpoi63gM1ElpPYAh8ykdXYjQ+1Xzg4S25sqygy+veSLU84K
 DoNR4bn1fZaQEAFrBx1faob57Topo6O7BxFAs+D7tHgkYMlOOry5F9/Px+BONST1ZXZVMaGzKtf
 w/Z2vCOnSTMbJadx1gjryw54Vju8cDEDQKNx6FIj/jnYgE463adqrJtuGrcMT++sDAKDYWm2zEB
 ujkyZS9f1PyYKJdglYA==
X-Authority-Analysis: v=2.4 cv=O/usLx9W c=1 sm=1 tr=0 ts=6b08504a cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=Ljcxbz6TTgZqL_1UImsA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260060

On 11/26/26 3:53 PM, Akhil P Oommen wrote:
> 
> 
> On 11/26/2026 8:17 PM, Konrad Dybcio wrote:
>> On 11/18/26 12:00 AM, Akhil P Oommen wrote:
>>> From: Shivam Rawat <shivrawa@qti.qualcomm.com>
>>>
>>> Adreno 753 is the primary GPU in the Qualcomm Nord SoC and belongs to
>>> the A7xx Gen3 family. It is derived from A750 and shares the same
>>> IP-level configuration: protected registers, pwrup/IFPC register lists,
>>> GBIF CX registers, gmu_cgc_mode, 3MB GMEM, bus BCMs and preemption
>>> record size. The differences visible to the KMD are the chip id
>>> (0x43051701), the GMU chip id (0x70d0000) and the gen71300 SQE and GMU
>>> firmware.
>>
>> [...]
>>
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> @@ -651,6 +651,9 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
>>>  	if (!(adreno_gpu->info->a6xx->hwcg || adreno_is_a7xx(adreno_gpu)))
>>>  		return;
>>>  
>>> +	if (adreno_is_a753(adreno_gpu))
>>> +		state = false;
>>
>> Is that intended?
> 
> yes. It is mentioned in the commit text.

Right, it says 'it's not working at the moment' - are we going to
have a moment where it works?

Konrad
