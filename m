Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30282345ED9
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 03:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788923270; cv=none; b=RX40dJd/cWaxsur7BaCvFR3f48uGS0jOdXyxjBMiwJ0f/H+H8C3lkq89sNXF9Byu6UuSM2PwAY8HgV09+cIxsCiUNN2e4cj9ayGS/k6BtQx7yjvurWJeA5dMabba4roNTb5B7iD6RKYeS5/5DCwwi9egxn2vHswzQu4zQ9BePCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788923270; c=relaxed/simple;
	bh=7tSvt6nwUb7l4EOQl7mknaeKX1Rd4B8AUvBTftBoL18=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y++i8iOoKziwWhsVzaIUNWaneZkIhFP4N7Fw4j/mM/1cIudkfHlb1LXJ26IQkMzluNQpQi0QupUvLkNs8K66TzfJNw74964PcMYZoPZ/J6acIxqzbq2gyNPXFger7CsEyyBAg3N87nJEYbwBYc1k+ChsDoKrlGQmt/M+g1iY0uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nRN+39zr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=djsEqN5z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nRN+39zr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="djsEqN5z"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Mgwoq337750
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 03:07:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ySTBu7pObnChLWbiJZoe0KmRvmWCF9+ULBCBUwBKaeM=; b=nRN+39zrtG3WJJ7t
	ECf4XAKuBvGiEWq1Eh+95SXKjDg4InmKcNO7zh6hfLugvhmn53ralwRI3m2OVo/a
	YBgPezcGw8auKHr1hghgKKbglJoJUXh3GdEhvL/6J+a48X+a8u4em7Z3Tk/dJJoT
	JSMZzqMpEOSeUM/RmldR1RIbYCyTiB1fCvBj4DJLoNk9rOsz5GqUPfeO93ZbTjpd
	MhsBuUydiywBzpQcZPWLvDh9noQsSQpPhpbZOvcwbebOEOHPATQAtgrHnpxer5lK
	KVnbcWITjbr9k7M0VvrzpcJAP/+quBjGx0jGqhtcHUW3bK5FARsT682NJJg5AanD
	X/eBUg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqe7hs9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 03:07:44 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39906175917so6124549a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 20:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788923264; x=1789528064; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ySTBu7pObnChLWbiJZoe0KmRvmWCF9+ULBCBUwBKaeM=;
        b=djsEqN5zSUZjsImo1mvo3EfayV1jdV7cF5+C8HWRtO3HeHgNKJsDbr7L6Ooj/y+OmI
         USiuxHI+xnZNenS92YQiqtIwV/vv4mN2ArvblzvN/RKbEMZHA+ik6Yke0+/uVNGu/L7J
         B5cMuBbvJ4c6lJS5+hM1zs2k+cky7rpXfqNi1mXyJy3ftRbkGPAO0slqUdhAaKxVmiHR
         lYa5ZO1nq5uRQrwZh2Mz1QrkfqQz9mgx1i23yaCLJt2HP3/uAz/dl7bbzIP9XxgY5NWM
         5aZ6vKDGxbTPTblcDKOwm2vfnvoFIZq+tx/IWMBYbEXLUkJIi1nlUOIvhU5l6kPr2tEd
         gzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788923264; x=1789528064;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ySTBu7pObnChLWbiJZoe0KmRvmWCF9+ULBCBUwBKaeM=;
        b=S/b3YipqEEL1IDs6ql2WdUBfv7pK0zxvjp3H9tfRHZXYfv65WaiOyjoQ391yYIQnwA
         qSsp1PQSQ5sEMPHTxupssV/OUE832GHzdF7MNtAjmTe9b1eHDTFMkfB9h/lcFodVpIsM
         k8w8i7tU1uYFYaXYtcucRAsiv3g8VdbbY1objV0ycFcCtAw+i0dlNhnUI/49EJafj7Vg
         eN12PrdkJ0duCX6o17fa91Heks9KJXrZ97tghZ9MX1W0y1QIVDnoG1KtoL5dL2vMKBZs
         l7+d7S5i1nAHIdae7LUHfgUTpFhgyXwPAGED0pZmxKr8AaF2fNHi2UowD8v94Or5rqv1
         QXpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzLjCRw92ZOhPpqgCOQ3ZZRxnHA/pE0yw6MiRoA5nIejhZFURNmBDl0U+Yd4BwcjYZ3ff7DCe2/iM9rKTPY@vger.kernel.org
X-Gm-Message-State: AFuF++kZI8+1NO9CX/glBaMrUE54MttIQibYws66cGFexE5XGZzPqUDs
	rIs64Rqkh0i9KCs8oAokSimKChJcZkUC3ql7DuJ3IQ9BwuH9Yn0kQ7iRtuuqR2Jpuvs1vC1uKMc
	TgpTK5LIaRhlf4g3qAE90GiSsHRQ8KCR9bT/2RLf9tz8iktYwFZgbzrnPtz1/jy5tjKXt
X-Gm-Gg: AYBFou3iol0TzeTerVCde6+tCVyG37sSYXhtUS/PwsHJGM1Wz6cqWsUAwKw/3lB35cv
	N8rdFzz1hWWpn55sOFJJ/a3Awh/4wvbmhnfpxXntyzgURFxyI/sapvpy+30QPWr00X1fEn+VoRz
	PUtub+NyWBB4mQY+fGtMguRdB/PQRaq368olmbjT6w78S3rMThA1kDj/s4Yf0Os/LxJue7QCTUY
	auwP67M89TddKLMua7Vk711KY8QBQjENx3Y2O3pH8s3eTxBe5iAuD1TULZZD9s0QcryBhDdxYQK
	C+/JYR0mZsrBlguQrgJhRjM5HncL2fVHAxRqcpm2SaAmNePSd3qLIWCQOo9jSrX+BJCri6PYY8e
	BdYLxhPcJfoz8WL6hI+JAwJoP/Bsa5RqH7772OBZ2IaX6sHva0x5e1DEFinHi5Bd8KNFh
X-Received: by 2002:a17:90b:5287:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-39b25eeeef9mr51053637a91.0.1788923263899;
        Tue, 08 Sep 2026 20:07:43 -0700 (PDT)
X-Received: by 2002:a17:90b:5287:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-39b25eeeef9mr51053567a91.0.1788923263255;
        Tue, 08 Sep 2026 20:07:43 -0700 (PDT)
Received: from [192.168.1.5] ([122.177.240.179])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fe843sm28937505a91.10.2026.09.08.20.07.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 20:07:42 -0700 (PDT)
Message-ID: <188ac6eb-764e-4805-b17d-e46a362adcfc@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 08:37:38 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: dwc3: qcom: Add support to skip phy management by
 USB core
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Val Packett <val@packett.cool>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260723-dwc3-skip-init-quirk-v1-1-97682bb44ebd@oss.qualcomm.com>
 <cbb4ae94-7862-4d91-b01d-0d7f18d49a45@packett.cool>
 <f9926203-ee69-4e18-b6c7-95261ba10807@packett.cool> <aqC5oyqKj6A3y8WK@vbox>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <aqC5oyqKj6A3y8WK@vbox>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDAzMiBTYWx0ZWRfXw4+JKkzdlADq
 ZCnVuqf+HGVFcEqL4Cs0rxe0V99uSi4nEL0kocEZxDGsg44fHZjZDc2RuWo8enOVLh0+Yjj8CE3
 +TuZlcDM5Cb+mD3fdFe5dQ5iieMWhY4=
X-Proofpoint-ORIG-GUID: 28qA_hGsLbvwUYR8R9nJ-kktsqU_Gdla
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDAzMiBTYWx0ZWRfX9Lx6xXu5MFdu
 BLpfTb08NMXdtQBioN8GdHE1BWhjcagw0GU1E6VeyIJazmghW5oLgxjIXLe5VymzzHhJvVlw8Pu
 GSsQIXXx9xKUcyBAOZegZKC4rEY1Xr3HcIkdN+KmOV1QF/6xk6qyQ4QoeoOL8TXqOTEoxb3aejq
 hlOIHusmF2ucY40X1YbHiaaZZh9ivMILlc4biLEN9WQ/98HHkkEfTjypJXviUZfJEtkbT/hnW35
 0pwWI0SroR7+xYZN5EHRvQbam1ESLvxI8Fab0XJp7jMTpiPUOPZwXSR+BQEZMiqftooMGwtjf3m
 RGoN4SUfeRLz81yPqM8IuIInuGGPno/XZepinkk5yGrtoQcUnwGwszWMpCMDhaw4ib3oJS7Kd4T
 QdrmD2Was5VivAJOzX9piXBhp5wExo104BG/s6t75XeH74ljQP8zD7OY2FpJ9I0DlEegAuC4Hll
 6r8YwE/cTcE6BVa9glQ==
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6aa0cd80 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=k/HPyTtL2bl9pZtdyDiZRg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=hD80L64hAAAA:8 a=EUspDBNiAAAA:8 a=eanv7jwH1jcZw_mpfL4A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: 28qA_hGsLbvwUYR8R9nJ-kktsqU_Gdla
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090032



On 9/9/2026 7:16 AM, Thinh Nguyen wrote:
> On Tue, Sep 08, 2026, Val Packett wrote:
>>
>> On 9/8/26 7:33 PM, Val Packett wrote:
>>>
>>> On 7/23/26 7:54 AM, Krishna Kurapati wrote:
>>>> DWC3 driver does manage phys itself sufficiently for Qualcomm platforms.
>>>> If xhci-skip-phy-init is not set, the HCD core does a phy_init and phy_
>>>> exit is done only when roothub is being destroyed. Due to this, during
>>>> system suspend in host mode, although phy_exit is done by DWC3 core, the
>>>> init_count on phy is never down to zero since HCD core also did an init.
>>>> consequently causing phy's exit routine to not be called. Hence, add
>>>> support to skip phy management by USB core.
>>>>
>>>> Some Exynos platforms still do rely on USB core for phy_calibrate calls,
>>>> hence disable USB core management for Qualcomm platforms only.
>>>>
>>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
>>>> ---
>>>> Link to PHY calibrate handling for Exynos platforms:
>>>> https://urldefense.com/v3/__https://lore.kernel.org/all/20190829053028.32438-1-m.szyprowski@samsung.com/__;!!A4F2R9G_pg!aoY0pB27Tlxo3u1RzNzwPHpGsjuAgJWtPeKMvDrL___6gEQb28ew8Rg-O1877xBHB92Zv2fY3_Zbb2aoEQY$
>>>>
>>>
>>> Hi,
>>>
>>> this was merged into -next a few days ago, and I'm seeing warnings on
>>> boot now:
>>>
>>> [    0.613188] sysfs: cannot create duplicate filename
>>> '/devices/platform/soc@0/a800000.usb/software_node'
>>> [    0.613195] CPU: 10 UID: 0 PID: 93 Comm: kworker/u49:0 Tainted: G
>>>      W           7.3.0-rc2-next-20260907-uwu+ #143 PREEMPT(full)
>>> [    0.613197] Tainted: [W]=WARN
>>> [    0.613198] Hardware name: Dell Inc. Latitude 7455/0FK7MX, BIOS
>>> 2.13.0 09/19/2025
>>> [    0.613199] Workqueue: events_unbound deferred_probe_work_func
>>> [    0.613206] Call trace:
>>> [..]
>>> [    0.613226]  device_create_managed_software_node+0xe8/0x108
>>> [    0.613227]  dwc3_qcom_probe+0x5a4/0x7b0
>>>
>>> There is indeed already a software node being created in the shared dwc3
>>> core code.
>>>
>>> Could there be any other consequences than a duplicate sysfs path?
>>>
>> Answering my own question: even worse messages when the controller switches
>> to gadget mode (which happens even with chargers when DRD is enabled)
>>
> 
> 
> Thanks for the report Val.
> 
> Hi Krishna,
> 
> Can you help send a revert patch until a proper change is in available?
> 
Sure, will send a revert patch.

Regards,
Krishna,
