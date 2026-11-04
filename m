Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793771995;
	b=rXieur5bkSvDS89aeHMC6QvQdL9XMTPYkDoEytZ2y8rgLuEdNOGJDpwbp7bOKETiShKF
	 GpghAQCTQbLR8NRrSGhqfVtozmekQKRxykZOOWv8btoO0qiDqA/rQIPvZR4n3iIi7eOWF
	 jR2NY9iKTv4/TyVt/3MbXDamNIbCmUvix1/Tn8qNHeieXpBozxq98VWeYAOQwgU7rOFe7
	 E0odid3K0ty+79uVgJ4eGNLdS1I3T896i4nYLu59bcSvXdmSDPorG2vT2VQeDad7Fybzn
	 JR1Jk6jgnesLJjNGERVas0OcB2vsS9k7qOR0GhavhZA4hrkiCALNd8uc/QJVlDKSddw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793771995;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nhpwz4SRhs59cnGd5Tl8xadcSjhoV1i4XB92wi1G84Y=;
	b=4epdDJvm9frZj386xOwCmTW1BxWoHCfe4cmkUnlGjqy17JThs+Umb/660JsJ5+MYAodm
	 GgFyD5GZfzioh/7ByL81ijn9capDs7p29I6lEYPSExbGYjVpjgK3R1+PrwVW9bivzakWi
	 huioO3PPxO/jzeIhgRTLf7HRwaLVWE9+R8UfdsTTo+buh8E9dPUMBdhhB+d+aBXfMA6Y+
	 Vi2vynu79YZuZUL0sffaiabOmR+34HoUZ10P65LffqQRJohJWrlvMZUMMSPNlTMZtmCTu
	 A9emvv7ZfG1qMHpg3AbH78Hd81D8KklGFXzPJ7GEIxRMp8kxhHVIYUpOGvcOjdHnj6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="cJ/odVWS";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fwL4geGK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02A5C606A329
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 05:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02A5C606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cJ/odVWS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fwL4geGK
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RwXs3868170
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Nov 2026 05:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nhpwz4SRhs59cnGd5Tl8xadcSjhoV1i4XB92wi1G84Y=; b=cJ/odVWSspNYKz4E
	5c0y/4l8UbXWu6qt8bIvVPkNMRl67TR253t0Ki60dRK/RDGXFS/q58Wh/ghw/ouP
	njdGVqjUoKEHTPv/8ajpcu62iB0nLUGfsFSLjODrnZt5ColbcduQ8SCDHgKr3FYu
	cQXF9VyaILC63iViHtkNTPFuLKxb0ttX0tJmcBdftylxAJf8RktfCvol4Mzf5125
	wkc92AzKpRPAB1Nc0Vg7Ppw/iQKS8mjM9t/eq6CFWf7ScKl59WN4bEk/+odHr6IK
	eAEHfMbDXfqn1IwEqgg06Vp8XNV9ZW2jZX8oC/FdvvMelhqPXJ50A0EuxrFUW8if
	0NnY0Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqn8y25p5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 05:59:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e987ec84afso4369715ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 21:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793771993; x=1794376793; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nhpwz4SRhs59cnGd5Tl8xadcSjhoV1i4XB92wi1G84Y=;
        b=fwL4geGKpHLaMwiiMG8eOD+XPBfDUw6TCnNxWczTgHB6tz686Py57g69cnFhqe8MsW
         2l6F8qvTUtBzFxlSbbGhVF/npjfnDf6A300qDws/qvHmq8dv0kG52gDdj1ZNvSVXuuLM
         Sbwx6eCFRhEMTkANoZpnzRzbCbIvPRxdvD0DQgOjw7tzlZzwOpo8Fio4ici3ekNa4LTu
         ZzsrvCobKi74jCVdbr3FPm1vZ54u8UPXaEgyrQqCn21nGbEhKG3PGw6sgkVHxpVqk5/o
         LOE7umcc1pd3hBj1rMaQhqrZ7iegZyfVEJSyNy6WlWCxZmlRkbsr8VY3MX5J7h+yRA+F
         4aww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793771993; x=1794376793;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nhpwz4SRhs59cnGd5Tl8xadcSjhoV1i4XB92wi1G84Y=;
        b=utr1owaxeZ2/lCmlTi25oC8WHDvAC7iVvU0yoc88ZfYIRVt0X08RJlVC3u6C759PHE
         OznLMgw9soOCcg5MywTpYL8eBH3ilaMqPN0Y8v0Y/+0M4GPZoy7eYxQlVlLLR+jBbsCL
         UmR8kyOiyxZL/cm6Yv34bthGO7+sLEkyCrhyRBoy8iuORCSmTDj0u1yYFqW478IVrQIq
         KGObf4JCGtOGzSgpnzFs1YcLKjgjaxfcY+qzJNnp7JCeieeojpYrN5hDrJJ5ul2gG62v
         oNok1XngvCc0XcjQUVSvSrEF8uO7ItojqZAKJLqwQAYM18Mhp1zpotsbXf929E6mb1B+
         pIHw==
X-Forwarded-Encrypted: i=1; AKwUvBz4pC6yX4AxzgB9FWSrIL6eZmk4QC95wY1CWmnxmIBkg7YCmx6i90FzPNrIAv0/HfIOvO+dFOl3pFRsNS9g@vger.kernel.org
X-Gm-Message-State: APuU4Z8fhnpSP9VzGzuO8JoXPoBunel9uYq3vmLhbQXtjDiKJ0SaSRas
	JMHt8rHhFDLW1JkvfTH/zoGiODOcDmc8z1lWzRhHioBI6vqP/0cLS2WahgucdByS5pHhTMkhXpy
	R23vFwefBEJ4eOD9jPDAPzCcalyMFSl45o033mpMpx1Sj00TB6/M5me8J4uyqv7NLbT48
X-Gm-Gg: AYBFou3SPjTaQY5CNXvLICMujE3GyWmAHnAif+gon7MPiL6TJXHiSEXQOI7yPCJprkI
	0jBgvslu5u4PUngOQD8DBsw/CsaXuoz2+vgLK8DCZfezQkWd0sj10YCZ8HBnd7IiPCRJyyRSR0B
	BiWi+PJlvn55dEFN7hQvWHL7WskhIZITmGMfMUoPG1UvR+dXsTT8nCgY2GgOH6/YTmKgyoCu+IV
	ikhBb1wKg0W6d0kZszhBazOhyuY1wM3C5fvlVaNnSZiAQ1AZyq10pEJRgiBz52VFt67f7CQuIUm
	Jc+6F81g7+SeZk0EQksn8dSbJJs8jzKAQoq6QIFXFaauzJUucYFB/DptKhvkrsIAjdbDZDw6CTT
	fDoRqipYY/UuvLiEOij/DAkREPyuExulAMiTn9OGRe3VRgsK4sjnUt9ViB8xoOBfgjvbWd+WmeB
	ch
X-Received: by 2002:a17:903:98d:b0:2ec:f757:23b with SMTP id d9443c01a7336-2ecf7570291mr29859635ad.40.1793771993347;
        Tue, 03 Nov 2026 21:59:53 -0800 (PST)
X-Received: by 2002:a17:903:98d:b0:2ec:f757:23b with SMTP id d9443c01a7336-2ecf7570291mr29859465ad.40.1793771992816;
        Tue, 03 Nov 2026 21:59:52 -0800 (PST)
Received: from [10.216.40.83] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08bd5aa7sm2781225ad.7.2026.11.03.21.59.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 21:59:52 -0800 (PST)
Message-ID: <1b06485e-d01c-4e86-9989-16b24f5ceb12@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 11:29:42 +0530
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
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/7] usb: dwc3: qcom: Keep wakeup IRQ enable/disable
 balanced on failed resume
To: Peter Chen <peter.chen@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <cover.1793212717.git.faisal.hassan@oss.qualcomm.com>
 <a7e3c1e094be9cb4a282925a6c09e11bf746234f.1793212717.git.faisal.hassan@oss.qualcomm.com>
 <auRiR2synrBgWFhI@hu-petche-lv.qualcomm.com>
 <c261c442-6623-4087-bc3d-c90afabad9d2@oss.qualcomm.com>
 <aufzsuS-hX5HTgLQ@hu-petche-lv.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aufzsuS-hX5HTgLQ@hu-petche-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4nKXK1ne9T4e6s1T-BiQaXdwrsW3nzyi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAyMyBTYWx0ZWRfX3k0IUIdwT8gv
 GMLxDFY1PGTzQnQxTD0PMgd3SZfhbLp+XNdK2vDgRReisx54rUaCwHOz3YPx14BfxVymF/CsyXq
 XchtN2goNSW1+8gfAoW3Vjvibcnew0XRUX/c8mGHl1p4ZiuieVrrb+gJsPK9950HS36EHzbG4Zk
 o7whSxoHs62IDse8XPjPnBsykeJWk3spZDGZyvgxyMjO1P0WHZW9qBU+TwljSgfY9LftwFik5lW
 zeDDMUWu73sXmXEKG74kCwdGKGoEXstswvb1hroqSFyjtE2kPoksd30CkY3iWiUMAMqSOsFm0Vg
 wtuAek1ofKvOUbnSJhNaTNfEfR+Y50XfromwkvZhnWdNwXNGKSRxAVp20XgxKabTQsTrecQ2fha
 HTKHnSJO3knLO55V7ab8sxN2xqMWlGU/MsHrcjBQx0rDwHFAIrzGO5GsNA9o1ziUrtYvp+seJ4m
 KVSmi7KUSZDqZtrWynw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAyMyBTYWx0ZWRfXzEJMkLdgY0Lh
 VsAmxxAS+1RZgprRskQzZ6wJ/9eYXVU+cmZezmbloFKm3Cz0LQu5mUZMgJpJukQluR0H8YUhtqK
 GoR/gV3zshIgALmeyQyqWN348ex+6no=
X-Proofpoint-ORIG-GUID: 4nKXK1ne9T4e6s1T-BiQaXdwrsW3nzyi
X-Authority-Analysis: v=2.4 cv=NP5AaE6g c=1 sm=1 tr=0 ts=6aeac9da cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=36P6ODGhHdYnLHd9aFoA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611040023

On 02-11-2026 07:51 am, Peter Chen wrote:
> On 26-10-30 16:54:55, Faisal Hassan wrote:
>> On 30-10-2026 02:54 pm, Peter Chen wrote:
>>> On 26-10-29 00:29:31, Faisal Hassan wrote:
>>>> dwc3_qcom_resume() disables the wakeup interrupts before enabling the
>>>> clocks. If clk_bulk_prepare_enable() fails, it returns with them
>>>> disabled.
>>>
>>> What's the relationship between clk_bulk_prepare_enable() fails and this patch?
>>>
>> Hi Peter,
>>
>> The wakeup interrupts were disarmed before the clock enable. If that
>> failed, is_suspended stayed set, the next suspend returned early, and
>> the next resume disarmed them again. disable_irq_nosync() and
>> disable_irq_wake() nest, so each failed resume left the disable depth
>> one level deeper. This is the rarer case, so I will reword the commit
>> message to lead with the runtime suspend case below.
>>
> 
> Okay, so here you may need another patch for error handling improvement.
> 
Ok, I will put the failed-resume handling (the wakeup interrupts staying 
disarmed, with arm/disarm kept balanced) in its own patch.

>>>>    }
>>>>    static int dwc3_qcom_suspend(struct dwc3_qcom *qcom, bool wakeup)
>>>> @@ -377,8 +388,13 @@ static int dwc3_qcom_resume(struct dwc3_qcom *qcom, bool wakeup)
>>>>    	if (!qcom->is_suspended)
>>>>    		return 0;
>>>> -	if (dwc3_qcom_is_host(qcom) && wakeup)
>>>> -		dwc3_qcom_disable_interrupts(qcom);
>>>> +	/*
>>>> +	 * Wakeup interrupts may have been armed by an earlier runtime suspend
>>>> +	 * even if wakeup is now disabled,
>>>
>>> How wakeup interrupt is triggered even the wake interrupt is disabled? Is the
>>> hardware default value makes it enabled? If it is, we need to disable all
>>> wakeup interrupt at probe, otherwise, there are un-expected wakeup interrupts.
>>>
>>> Peter
>>>
>>
>> They are not. They are requested with IRQF_NO_AUTOEN, so they stay
>> disabled until the first suspend and nothing needs disabling at probe.
>> The issue is that runtime suspend always calls
>> dwc3_qcom_suspend(qcom, true), which arms them in host mode regardless
>> of device_may_wakeup(). The old resume only disarmed them when wakeup
>> was enabled, so a system resume with device wakeup disabled left them
>> armed.
> 
> Get it.
> 
> At your second patch, it already knows the context between runtime
> and system suspend, you could disable wakeup enable if the device_may_wakeup
> return false, that could avoid introducing more judgements, and have this
> patch after your 2nd patch.
> 
Agreed. I will move the PM/runtime split first. Then, in the system 
suspend path, I will disarm the wakeup interrupts when 
device_may_wakeup() is false (including when the controller is already 
runtime suspended and they were armed earlier). The resume side then 
needs no extra check. The failed-resume handling goes in a separate 
patch after that.

Thanks,
Faisal

>> The comment read as if the interrupts trigger while disabled,
>> so I will reword it as:
>>
>>      /*
>>       * Runtime suspend arms the wakeup interrupts regardless of the
>>       * device wakeup setting, so always disarm them here. On failure
>>       * they stay disarmed, as a level-triggered wakeup line could
>>       * otherwise keep firing while the controller can't be resumed.
>>       */
>>
>> I will update the subject and commit message for v5 to cover this case.
> 

