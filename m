Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1D41A9FB7
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 15:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790263545; cv=none; b=Fto0GaNm3nEZvwtExA7FBw/ndkzlCy9Y0TkRdwAPvcNf9EoEyjRCd/537tNlR9sk2nqIVz3JXiXLpH9ZsLOPr+n3MVyY911lGMUn1jIIgooY5morxTk5MLnmbFztmQ/xrP9fIOSmc1hxQ7cTOhT95cirDp0JXwcN4leMLQgvKgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790263545; c=relaxed/simple;
	bh=TLfsX0T3MnQWIMK16P/VsLs3IvvNHmMu8ag5AlHUbCU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gvPyCQCzPVuauON0PmmeIuGcXkateDx/c4iw5bYz6C24QWpjzje8cW01hoe0lszhkfHecgKYLqz3V/LCgHfkB4eDuwKOmXmmu7aCS8m/dg/uqSILnJZLZpBhQfPkjF8X62msjdu0xvi60RCpGhIN/gw/poOQn8StG4u81UQPK4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nwb0cUSy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AIhxy5m2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nwb0cUSy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AIhxy5m2"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OF8hkC2032220
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 15:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NUECUlCbtHCVYRHqlTHziR5uhDYKMdJYxNhtWGFgu4k=; b=nwb0cUSyZ1ifHWiz
	NVNUFLLDBBR0cwPB7G2H6D8qSx2U1GhXxbmOQtJB+xeORzoDz5EwIAB2RVwszwPN
	n3GstZee5tk3PsjB89+3lQdjgUCtrIPd6XKMzsD15HZ2g2L3r11Wg0iBxmowX0NC
	6FcgAJeSqKsSMkGVVrKGZkg4u5den4YXp0VGBZHWQF/zxZk7b2XxzQ/k3p5vgo/4
	njI53d1qA0kbnlCOcSgH69DyBMpyWVK5qNLs/Hb8Qn7oI/SjqqgtxRLmcMB97Uv9
	QTkIXGuUip7VbF+IEBdEUFUTdvdfcxcL09hmNFWUlNXEftj9oY2f1WmCv5wuxGFn
	IMaqJQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw68e03rn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 15:25:42 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc44d708055so2417822a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 08:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790263542; x=1790868342; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NUECUlCbtHCVYRHqlTHziR5uhDYKMdJYxNhtWGFgu4k=;
        b=AIhxy5m29VSKkTriLR1we8pvUwyiDmKEIwFxt/S5TCmPODtZN6Xa9qIur6oQy89MRv
         d2QzIejZGdYPGKtIcsFIlo5mRy+YGYLhIObj2Y30JYrbSHznhjTfUWXC4dzo51Ji++jm
         pT16NiTunkHq1SMCUTUVxpjk+AUOAnbod13h1dp3pJOI0aVJRwZhHuwX8M3OAlbOW8zG
         4C3uJIeYMB53lJIuuFY41ReZlG8OO6+tFbhPEbC5NRtwsGGNd2Dk6dXNTXiJU+Z9lu1X
         nGxhCgQwYVSFfhZT/Gtka3dR3Eww+djaWsbDkhqHNZQujG1zS9gDeoqlUlvKIb+72t7h
         oNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790263542; x=1790868342;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NUECUlCbtHCVYRHqlTHziR5uhDYKMdJYxNhtWGFgu4k=;
        b=goFNvC5tjRcYgn/f+FLdkanGeHg1yCVwQEJXfRqFDwOifTuMNofgblKHojE/SaMI+b
         nUQLcuVTW5mYs1kGc4FHtaoJ1mjdqZ7a18anrNFeThOA8x3GOpTR/ep0Z84z5EVXOhpp
         vecwh2qs9g63nXnhcY9yZKExuYn6KjOnM5rhamko3b7IZkMEyj64W9CzB7hS+b2OPKtH
         B9lYIiUzhDcws8Z/Wvfqv3pVuD+QkGoMIHaHX9TkK94qXVXaAWqm3liRASjL8GZHwumm
         vjBVKjlivIb1pLh7tYm73jKpU3ccJR5RaqtgODHRM5Op6j71IOFLvPIZV2qQkdpGk0Dg
         JPjw==
X-Forwarded-Encrypted: i=1; AKwUvBxlxdA/Sdd058w5OSpHLGkMtLi+bYpZBvxFnV6PU/zvFzoSJpy4yNU3z4XZH3q0HUZOJTfRkGShrkcxPRq7@vger.kernel.org
X-Gm-Message-State: AFuF++n76W1XoRItlkW9L4ZKxX2qaREa7oyndV+16obWHx1t2nxz/B88
	75yLk+MJyro+g60jTatKYrKlHLPMQKWmFRvJbW4B6WIQ3oVJWUhIEmFjgWc4sCsBnEX9S8zJkH5
	mIQ7ANAVYWfIlp01ouRzDBC9pg+vNU0xz7skkXIk2oTqufcMOX/pPVBXz47VtTymc4Pmi
X-Gm-Gg: AYBFou279GC4phu78XZggiIfDBxInc3Ct5K3JW3jnkYAP5Hb80vGk83M2iCJfTwe5PD
	7X35j7mQfuyPNzvSRniGUCuItp4AdGOgQPnk83ZCr6ZUYKJZrw3WApEQsbAaLMQ5QbJE9tqIUsw
	44UqRVIdjzxEgHe5xLi4r3r25yxb+h4GjDFkBBRwk+vx/r0O6WTCGK+o7JUSCC5f7ypCWmDOxfk
	2sVQ50ngiO2maPQ7AXqBHNOp/YlEOmF0U+c8aIq/bTpQwvcg/mTy6M1Phfok5JETa++ApHqrzQc
	k9XjlQ5aMI/TJIa13gMEKQYMRKyeuAEdUcHaCHLlqSERdQ9iZDJqGQlIL/D8H9XmVuzWLJwIQrY
	oUxMT3utzxAvPd7AHqTMaJK1e40/rBsQDFg==
X-Received: by 2002:a05:6a21:7a4a:b0:3dd:a00a:1714 with SMTP id adf61e73a8af0-3de0e88979bmr2903970637.47.1790263541983;
        Thu, 24 Sep 2026 08:25:41 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a4a:b0:3dd:a00a:1714 with SMTP id adf61e73a8af0-3de0e88979bmr2903935637.47.1790263541402;
        Thu, 24 Sep 2026 08:25:41 -0700 (PDT)
Received: from [192.168.0.172] ([183.83.137.191])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc75f3b82aasm3066167a12.9.2026.09.24.08.25.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 08:25:40 -0700 (PDT)
Message-ID: <c62eef0c-24b6-46f0-be87-f4ae7e79a60b@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 20:55:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question about Iris SID override assertion on Yoga Slim 7x
To: Birk Skyum <birk.skyum@pm.me>
Cc: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260913194707.91885-1-birk.skyum@pm.me>
 <4e4acb29-0b3e-4b76-8179-b49745f53bf5@oss.qualcomm.com>
 <e167a249-54da-4f1c-9285-a439776c4897@oss.qualcomm.com>
 <L_J1jOdE8Ng2gXPC9_ZA3WKXcPoIjuQ0FdeKF4SQwh-T3AZ5knRZJBIg9ZT-B2oajnx13oh_X66-dDEInmvP1qeakD6RvHckUocQeaLCsDY=@pm.me>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <L_J1jOdE8Ng2gXPC9_ZA3WKXcPoIjuQ0FdeKF4SQwh-T3AZ5knRZJBIg9ZT-B2oajnx13oh_X66-dDEInmvP1qeakD6RvHckUocQeaLCsDY=@pm.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA2MyBTYWx0ZWRfX/rSFzTNm4zwE
 XsbHbwxREs84R8lkSiEC6roZYELMOPKMB3je4sMHgDJLvyFSZegOQPcCn/4HhVYxbc55BkBj8qu
 RgBmhXSapXsqi89E6jljVpoi86vOjf7hm6vtemKvlPn1gG9IVkVPp7jASV0Mzhci9qLUjbqKc4u
 bPMR3SALPJunDJWdBA6gf36884npcxFxF/fUc1wFuwGAOOyQY72kZ3coGQKqft4dS0Er3dyyxBJ
 WPeEJmTy0V/CoFkXmk6p/NBbyUKivNvnqtWNjZHAjuB2acqUVy1vBj0bJrMhvCV0SNK3JyD8gmL
 NuJ9+FzaBxLcNOidgiRcd4sSBcBOkUdr96udq50iQKOOHvP9bjO4wRUVXqXpSKja492kzIRaPcg
 ONMrC0STaTbpyx1IINbZTFDAE/NbAI81xfifKTVb23jbSagY8plLYkNGNQNGb5AC/RYhxvOBJSU
 +ylfRWq8K9kScQN4LHQ==
X-Proofpoint-GUID: 9sO9wueGjbPJP2OmagNEFKAItLihKpTQ
X-Proofpoint-ORIG-GUID: 9sO9wueGjbPJP2OmagNEFKAItLihKpTQ
X-Authority-Analysis: v=2.4 cv=XawcX455 c=1 sm=1 tr=0 ts=6ab540f6 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=iB3hNsdZaZMRGRx/E791SA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Nsrxk9Y1ytH64-Jka74A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA2MyBTYWx0ZWRfX2wsIWVhUwb5x
 Pitkad7H+WM4G5QSqNE9zQZsa2iDyKPMCk+uRAGL75wmnd2xoGSJixPLKPZnkZfw5YsEkS+poXy
 d1S/6wBMdEL9/9K3kknUhTBohOI9WK8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240063


On 9/24/2026 8:37 PM, Birk Skyum wrote:
> Thanks! This fixes the SID override assertion I reported on the
> Lenovo Yoga Slim 7x (X1E80100).

Thank you for confirming, good to see it fixes.

> 
> I applied it to the same Iris build that hit the assertion, with the
> same kernel and firmware, and reran the same test: decode a 720p VP9
> clip, let the device runtime-suspend for 100 seconds, and decode
> again. All 9 trials passed, every frame matched software decoding, and
> there was no firmware assertion or system error. Without the patch,
> this test failed on the third or fourth trial.
> 
> This was on the modified test stack from my report, not a pristine
> mainline build.
> 
> Tested-by: Birk Skyum <birk.skyum@pm.me> # Lenovo Yoga Slim 7x
> 
> 
> 
> 
> On Thursday, September 24th, 2026 at 16:41, Vikash Garodia <vikash.garodia@oss.qualcomm.com> wrote:
> 
>>
>> On 9/17/2026 4:50 PM, Vikash Garodia wrote:
>>> Hello Birk,
>>>
>>> On 9/14/2026 1:17 AM, Birk Skyum wrote:
>>>> Hi Vikash and Dikshita,
>>>>
>>>> I'm testing Iris video decoding on a Lenovo Yoga Slim 7x (83ED,
>>>> X1E80100).
>>>> This is a request for guidance on a firmware assertion. It currently
>>>> reproduces on a modified test stack, and I'm working on reducing it to
>>>> an unmodified-driver reproduction.
>>>>
>>>> After repeated runtime-suspend/resume cycles, VP9 startup intermittently
>>>> hits this firmware assertion before initial stream settings or CAPTURE
>>>> START:
>>>>
>>>>     VenusCoreCtrl_InitSS(506): un-expected SID override configuration
>>>>     WaitForHWidle(462): VENUS is idle, no HW is running
>>>>     assert_loop(500): FW Assertion - venusCoreController.c:507
>>
>> Could you please try the usecase with the fix
>>
>> https://lore.kernel.org/all/20260924-vpu_hwmode_fix-v1-1-531498f3499a@oss.qualcomm.com/
>>
>> Regards,
>> Vikash
>>
>>>>
>>>> The first HFI error is 0x05000003. The SFR names the same source line.
>>>> Later venus_c2_parsing.c:1550 assertions follow automatic recovery; they
>>>> are not the original failure.
>>>>
>>>> Could you clarify what the SID override check expects on X1E80100, and
>>>> whether there is a known firmware, secure-firmware, or resume-sequencing
>>>> requirement I should check? Which diagnostics would help distinguish a
>>>> driver sequencing problem from a firmware requirement? I can test a
>>>> targeted diagnostic or patch.
>>>
>>> Same failure was seen once in windows based X1E80100, and i was informed
>>> that doing an explicit GDSC (vcodec) power on before doing a warm boot
>>> i.e iris_vpu_boot_firmware() helped the case in windows. I have checked,
>>> in iris, iris_vpu_power_on() would get the vcodec GDSC on before
>>> iris_vpu_boot_firmware().
>>>
>>> I am gathering more info on SID override configuration part.
>>>
>>> +ing Renjiang who is helping to debug this issue along with me.
>>>
>>>>
>>>> The firmware is qcom/x1e80100/LENOVO/83ED/qcvss8380.mbn from
>>>> linux-firmware-qcom 20260810-2:
>>>>
>>>>     video-firmware.3.1-e5aea20c64cb6df9a1c9be99e206053b36424939
>>>>     PROD, build May 9 2024
>>>>     SHA256
>>>> 3456a15e01528c2ba2957ef2b78daefd875841b262dc02f0c3bb03c33cba657f
>>>>
>>>> That hash matches the current linux-firmware main file. The BIOS is
>>>> NHCN62WW, dated 12/02/2025. The device tree lists qcom,x1e80100-iris with
>>>> the qcom,sm8550-iris fallback.
>>>>
>>>> The test repeatedly decodes the same synthetic 1280x720 VP9 clip, 120
>>>> frames at normal speed, closes the decoder, verifies runtime_status is
>>>> suspended for 100 seconds, then starts again. FFmpeg is 9.0.1 with a
>>>> local
>>>> fix to requeue empty non-LAST ERROR capture buffers. Successful runs
>>>> match every decoded frame against software decoding.
>>>
>>> Could you please share details on the FFmpeg test and the local fix ? We
>>> will repro this locally to get better insight of this issue.
>>>
>>>>
>>>> On one cold boot, three 100-second idle trials with power/control=on
>>>> passed. After restoring auto, two suspended-idle trials passed and the
>>>> third failed. On another boot with auto throughout, two passed and the
>>>> third failed. A separate codec guard removed an unnecessary AV1-only
>>>> partial buffer from VP9; its warning disappeared, but the fourth
>>>> suspended-idle trial still hit the same SID assertion. These comparisons
>>>> do not establish runtime PM as the cause or keeping power on as a fix.
>>>>
>>>> This is a modified test stack, not a pristine-mainline reproduction. The
>>>> kernel is 7.2.0-1.1-aarch64-ARCH-camera1, with camera patches. The in-
>>>> tree
>>>> Iris and video-clock sources were built as external modules. Iris also
>>>> has experimental initial-CAPTURE deferral and pre-start buffer ownership
>>>> changes, a bounded HFI/SFR diagnostic, and Renjiang Han's firmware-
>>>> logging
>>>> patch with an early debug-queue drain to retain the pre-assertion
>>>> messages.
>>>> The failing session receives OPEN acknowledgement and its first
>>>> compressed
>>>> input before the fatal error. No looping or seek is reached.
>>>>
>>>> Testing stops at the first failure and resumes only after a clean
>>>> shutdown
>>>> and physical power-on. No clock-module reloads are involved. I can
>>>> provide
>>>> the synthetic clip, exact source changes and filtered HFI trace if
>>>> useful.
>>>>
>>>> Thanks,
>>>> Birk
>>>
>>> Regards,
>>> Vikash
>>
>>

