Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21BF480346
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 14:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790260887; cv=none; b=eEiUpBjnj+IsScf4FS7eAn3JBoOCaXOaX8/Q0tn+2A6NSfbscsraqrcTYxRfFz3v6+nU/WWFS0uhvn6ALN/S5KDokcfkUHSg4ToID6HLibnJTmEwFoyhDJmMiDch7demHD7q25TCLqYdjPu8NoezW6JsbHIG8dDmbt2BPRg5L9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790260887; c=relaxed/simple;
	bh=hUyEIoiQwZWr0yJPPlPLuqMUSBteihl7VfFpS8WcvLo=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=KuOozDkYNpOdbfin2h64ALMB1h6FiuKB08xfSC/0NcTmUNNrQigjEvIzckcF7jjgweCp2LQfxM5LGESRC8AOz8SnrblF6/20hcRJOWpQp2pwxi2s9K3jMBLq70ZIiCsJRcPCLfRKwOYDAzxbf03X2JCAYgUHfjra6BF4kW5YLBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K847fW/d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dJ0JREOh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K847fW/d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dJ0JREOh"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4tE0803924
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 14:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+lr6vawuvhxJ0yMF+gj2DOgkJvDeGRr1NaIe25+zaE4=; b=K847fW/d3C2ge4bX
	O+Qi33KUGjenW09Pb7UUmgxyv6WOYBV3E+I1XWJgCGZ0dyTbzdkb7pzirKQvu9XQ
	ys0L80F+TeH3vdJNkJn1CGDoMfkWBVXygR7WTrZJowB3tR0gJTNkY3vKSYGYfQXZ
	LupyBjj7kPju04jg1NyirvlqNsM5QQRpSbyQPK3xFlNrEVPWHCF2heT/RTHqPHXv
	mTzGFE0scXbLXVT/souyIe6BuGNuk5e9CvkvTVlgzVFOBFk0oN3HG7nSx9GH58Jq
	drhYtQY1kib0aUwEFJREUbRjwOPX7t6wk2ULWZAlzM4soIFAzgCe3A9mBADOjva4
	jfeLWA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1sc93gc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 14:41:23 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfa4e4684bso32804825ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 07:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790260883; x=1790865683; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+lr6vawuvhxJ0yMF+gj2DOgkJvDeGRr1NaIe25+zaE4=;
        b=dJ0JREOhoOt0+Xf7jvhCbG5jwbOAyKsIdwpEE1JeUo0pWOdTYKY22sc2OEANmmPQXI
         dL1wcQou7/GjBlQYZ5KY7JgEMNhSHunpvWrCWtjBbjG3dtMZG080/x6wY8XJ94fCe5/H
         /vDEgaQ2FDOYFiag5hS94M4Xt4nBm7mhb2kNiFdtXPGmarZJwK7BE9P/sYLY9FsxT+lm
         RNgsJDYoOalh2vhQ/bm7OkBAp5GUmnhH+AOshLvtzTgypRcYDfhap+o2M85X86TqgzTB
         DRhIXIIexSnCdeDlP/vOMmWnpREXLy74+2KzEbzMwE07/bPOQoTzTPphAvzSf2fa9KQW
         p0uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790260883; x=1790865683;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+lr6vawuvhxJ0yMF+gj2DOgkJvDeGRr1NaIe25+zaE4=;
        b=pGA84X5zbwV7LarWjx1igZ6EpinNuXhZI37DLs4zxIrzzX5GeY4iZcygCpBwysenpc
         2fksBJiVxZ7cRcfZS9aFQ0C/yYthShGVInYbZv0dXrujVbaRbz7AXtSrZnsCrfU11PHt
         cEOkh9q+Re1BXE3fFcxCzhZSlwVCRe/bwm2xIQSXz/5KqU+wf9cGGg3PZAgomO/8A05v
         Zuvm9rBdK2KyXYw9YzeWIiI4t4JzpjO1toLwYx4cjSYsg+TYsxW1lgHuSleMxpdA5bFm
         jYkW9zyM6EZ0e8ZPpTNXKDMjfKMV9mbokfnRNAOfRN8SxktM4D+ZsxK0yo3gIaXbXqwR
         1k6g==
X-Forwarded-Encrypted: i=1; AKwUvBxd6M6g4N78G0VV3fPN2gs+VjPy6s2oYO4xqCx6sRExr+/O7H6lLLve3X42CcXsNrosj50zGUD3lBnmmIy0@vger.kernel.org
X-Gm-Message-State: AFuF++k4IReItSHHDhiLnAA6i0O9bbmq0YTSJ8yTdy60Ocu73Ogu71nj
	XDJvtWqbPf/Nugr9/G/USYwvMTAVTHotlwEDhANPJ6QwrgXQxjlkeXZPcTtaCmAokRkLQZjAvFr
	hi+Fi4AbVJDMYXd7J9Tu798N1h2nF9EVLlWCKjDJZLN9O1itFY2Yjqsu0cQ05qhs5FP8d
X-Gm-Gg: AYBFou2E3mwdJVmAkNniXAXwbxRr+fp591O5vavqiFZB4tHZIxJjT7QUkLxt4kSHRfi
	a+Z0cXKq8wCfmG8soBWAcJ+KX/d+zj7JMM6/i6BgRlJXwD82Ilm+H2/VIbLTaTuD++bsIudJ9GY
	twgDJ6i3wnqMP7mhasV0vfvTISSrAteBK2VO/bEgZ8+oD0YxIeC59r/fo87EXVZjLvRJFxrtoSO
	EwPMcI5t661MQb3gBf5j/kg5b+6UdrkcEvMetKTD7xXqJkkqYPJMq61maU8o+Ua3vRG/ZMUxedH
	qcotmo/gwqQykKquO1Nj3cyhEornLYQGne6RoSj7JBO+Xp49vQWDwMFx0m7lFNmACDytQUim0pA
	SF3mrs/abtBJL2W0J8h4yMjTDmzufdeid5Q==
X-Received: by 2002:a17:903:4405:b0:2dd:c100:3133 with SMTP id d9443c01a7336-2df7e23684dmr21196905ad.47.1790260882855;
        Thu, 24 Sep 2026 07:41:22 -0700 (PDT)
X-Received: by 2002:a17:903:4405:b0:2dd:c100:3133 with SMTP id d9443c01a7336-2df7e23684dmr21196615ad.47.1790260882340;
        Thu, 24 Sep 2026 07:41:22 -0700 (PDT)
Received: from [10.204.101.119] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a517069sm28885125ad.3.2026.09.24.07.41.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 07:41:21 -0700 (PDT)
Message-ID: <e167a249-54da-4f1c-9285-a439776c4897@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 20:11:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question about Iris SID override assertion on Yoga Slim 7x
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
To: Birk Skyum <birk.skyum@pm.me>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Renjiang Han <renjiang.han@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260913194707.91885-1-birk.skyum@pm.me>
 <4e4acb29-0b3e-4b76-8179-b49745f53bf5@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <4e4acb29-0b3e-4b76-8179-b49745f53bf5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 3LdBxyh9mPDsVfPmBoCTvZawj9PdymIC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA2MCBTYWx0ZWRfX897SbTiLxUZ2
 6oqVWZfo8DYKG4Jou/iUgnLGVUDf3n75ghsTaUaZ87z2dnNwFDyd2vJpBdlj2/2EKtrUG5wo6aH
 TSYctnXD7uj/kCmWafILDT9ZNW3DnJcGFUyo7eGzW097zKO0dQhUE8KcX6vQsGCByreSze1QeHU
 csrPePNiL74vzy9c/v4aXqi+LkxKbqqRjqf9ebKSXvBkC55DvtZj1UH2x5qJ7USP8E/s99WDmnT
 J3Zl+3iEmfW4c2t2NbzohT0+EwnS+aT1Ga9NqqWxaxgPDPeXszfsqXvcuqRK/pz34v9gYAer9NI
 cVTbW90otqpyT/Q7hKNd1JFcu1yKdnIt6s2J3MVARxpeOcalOsaZG0bnI/vqGDH9s0Mo8mIrz0q
 nRUgUPLIE//7zfdenCmxmw/tuyd6uMp4TOq9Cc2sydLdPHQrqiK2CTQMEG0eN4/C9UYSJi89LNq
 xg5ZTSmbYBFWVuwIQUA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA2MCBTYWx0ZWRfX6ZCKupBKTw0y
 B8Hblu6hs2K4aRF7pZctgkP4r1TfH97cI4vphEtKivnI1jnsPhf2s3vum+TBu1doHucUmK/WiZV
 OggUVXCqEXZ7oPMx+2AA/h2i3bAEC7w=
X-Proofpoint-ORIG-GUID: 3LdBxyh9mPDsVfPmBoCTvZawj9PdymIC
X-Authority-Analysis: v=2.4 cv=GI+dgeNK c=1 sm=1 tr=0 ts=6ab53693 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_f_NTwuWuVAfArxx4pYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240060


On 9/17/2026 4:50 PM, Vikash Garodia wrote:
> Hello Birk,
> 
> On 9/14/2026 1:17 AM, Birk Skyum wrote:
>> Hi Vikash and Dikshita,
>>
>> I'm testing Iris video decoding on a Lenovo Yoga Slim 7x (83ED, 
>> X1E80100).
>> This is a request for guidance on a firmware assertion. It currently
>> reproduces on a modified test stack, and I'm working on reducing it to
>> an unmodified-driver reproduction.
>>
>> After repeated runtime-suspend/resume cycles, VP9 startup intermittently
>> hits this firmware assertion before initial stream settings or CAPTURE 
>> START:
>>
>>    VenusCoreCtrl_InitSS(506): un-expected SID override configuration
>>    WaitForHWidle(462): VENUS is idle, no HW is running
>>    assert_loop(500): FW Assertion - venusCoreController.c:507

Could you please try the usecase with the fix

https://lore.kernel.org/all/20260924-vpu_hwmode_fix-v1-1-531498f3499a@oss.qualcomm.com/

Regards,
Vikash

>>
>> The first HFI error is 0x05000003. The SFR names the same source line.
>> Later venus_c2_parsing.c:1550 assertions follow automatic recovery; they
>> are not the original failure.
>>
>> Could you clarify what the SID override check expects on X1E80100, and
>> whether there is a known firmware, secure-firmware, or resume-sequencing
>> requirement I should check? Which diagnostics would help distinguish a
>> driver sequencing problem from a firmware requirement? I can test a
>> targeted diagnostic or patch.
> 
> Same failure was seen once in windows based X1E80100, and i was informed 
> that doing an explicit GDSC (vcodec) power on before doing a warm boot 
> i.e iris_vpu_boot_firmware() helped the case in windows. I have checked, 
> in iris, iris_vpu_power_on() would get the vcodec GDSC on before 
> iris_vpu_boot_firmware().
> 
> I am gathering more info on SID override configuration part.
> 
> +ing Renjiang who is helping to debug this issue along with me.
> 
>>
>> The firmware is qcom/x1e80100/LENOVO/83ED/qcvss8380.mbn from
>> linux-firmware-qcom 20260810-2:
>>
>>    video-firmware.3.1-e5aea20c64cb6df9a1c9be99e206053b36424939
>>    PROD, build May 9 2024
>>    SHA256 
>> 3456a15e01528c2ba2957ef2b78daefd875841b262dc02f0c3bb03c33cba657f
>>
>> That hash matches the current linux-firmware main file. The BIOS is
>> NHCN62WW, dated 12/02/2025. The device tree lists qcom,x1e80100-iris with
>> the qcom,sm8550-iris fallback.
>>
>> The test repeatedly decodes the same synthetic 1280x720 VP9 clip, 120
>> frames at normal speed, closes the decoder, verifies runtime_status is
>> suspended for 100 seconds, then starts again. FFmpeg is 9.0.1 with a 
>> local
>> fix to requeue empty non-LAST ERROR capture buffers. Successful runs
>> match every decoded frame against software decoding.
> 
> Could you please share details on the FFmpeg test and the local fix ? We 
> will repro this locally to get better insight of this issue.
> 
>>
>> On one cold boot, three 100-second idle trials with power/control=on
>> passed. After restoring auto, two suspended-idle trials passed and the
>> third failed. On another boot with auto throughout, two passed and the
>> third failed. A separate codec guard removed an unnecessary AV1-only
>> partial buffer from VP9; its warning disappeared, but the fourth
>> suspended-idle trial still hit the same SID assertion. These comparisons
>> do not establish runtime PM as the cause or keeping power on as a fix.
>>
>> This is a modified test stack, not a pristine-mainline reproduction. The
>> kernel is 7.2.0-1.1-aarch64-ARCH-camera1, with camera patches. The in- 
>> tree
>> Iris and video-clock sources were built as external modules. Iris also
>> has experimental initial-CAPTURE deferral and pre-start buffer ownership
>> changes, a bounded HFI/SFR diagnostic, and Renjiang Han's firmware- 
>> logging
>> patch with an early debug-queue drain to retain the pre-assertion 
>> messages.
>> The failing session receives OPEN acknowledgement and its first 
>> compressed
>> input before the fatal error. No looping or seek is reached.
>>
>> Testing stops at the first failure and resumes only after a clean 
>> shutdown
>> and physical power-on. No clock-module reloads are involved. I can 
>> provide
>> the synthetic clip, exact source changes and filtered HFI trace if 
>> useful.
>>
>> Thanks,
>> Birk
> 
> Regards,
> Vikash

