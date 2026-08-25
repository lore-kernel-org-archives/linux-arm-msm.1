Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA9D3C2775
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 06:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787639860; cv=none; b=UdT/yJmZ1+PrSVbBs2nj6CPwLBse+foVvnDap3r9DmBPUa+nHyq5bnoZaCRZaliot5mCoTBxKesjTNvWggaNMMtH3+NjUX9ctYdCISLz9sKkkTxviWkGEZX23/KKLHnFyTQNsSSnue9k9nfTF2JmX2Rs3Fs79QKr89rkIGOF1Zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787639860; c=relaxed/simple;
	bh=yo97lpl4nNxII91Vzrfgw341mjyAGF7ejKfRVRWWRhE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KamamL/T1OeEV3+fHN7OGS6oVK60W95qIW9/OETtWLIOLDnQc5A4CD4IKKt/dblF1Xitrr/ZCS3Ljou+h2xzh/DI7M4mP45pVZZW8CYH18i1VVYD8V5VTHAkBK027/UdqTtX2aify5FYuMFQ10z0jZnqLSAIzFsKRl2qO/bunwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IeYso8EF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=entzteUa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IeYso8EF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="entzteUa"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2lJhR1220782
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 06:37:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jw1MAdB13SYeIkOFk/i7GvPAS0J0ZWflfX+r3TnNVhs=; b=IeYso8EFIFUnELkC
	w0Q1+hFFUG0upmRdYTS9GQ63q/2iWTS4ihsO2bmHV2EoAWHnrYB6K14p/+PLEU2t
	5jULbTnu4w0NNj+zQ6QHPhGoyXPiaIeA6ZpTYb3oYiZyRsf0gXEF0Owe+Z0kLK4r
	gRoHzR3z6rtHkf5Oc6GaFVo3QthyBSTwKCw7m/fvuJ0vgdjTwiDtXJbAOy8vPSez
	N0Z8E2Y21xYj321yY3EidP+eV0TQgghZGy/m5wlHS1KECBgVJcaD7r4TcmLai6aa
	6OgXWGL8xzOW8oen1/4BIgVbV45Jp1ZffUwvfZmEIuIAJbwO6aX1BXv+6oBwP0Hh
	igT5Wg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g92jqrpd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 06:37:38 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84e3d575d6eso3649449b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 23:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787639858; x=1788244658; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jw1MAdB13SYeIkOFk/i7GvPAS0J0ZWflfX+r3TnNVhs=;
        b=entzteUa7Ge9F2Q30uCuLvczZKVJhgMIR2a5kYPHy4IDi12T4BPwLkE/53Sfu/1Eqm
         ZDJbsRRC//gdAbcgCsvazEEXVVzeOFbc9RETVQUwh0PZEUfLPirD078swpqzQvtoJcQi
         mxa1+8FKhr9sjqsvpziP075i1BEkG6EY6WaiCcdhmgkIit6jwVoo6OFp1ToL4Gj7BvVG
         tht+KWquu5PL7k0dEZFDlWGk5sThfeBZJp4YbVNxRDgpS8qeM7NjCgShVk56TepYL+GD
         Xr+bAqM7BWj/4w3qT/RGVHqvo3og0qA+RJaMRRbLOuRO8XcVxaWsKBNjgOPqVcM4RUFI
         fHkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787639858; x=1788244658;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jw1MAdB13SYeIkOFk/i7GvPAS0J0ZWflfX+r3TnNVhs=;
        b=T0REpc+LsjzXLC+e8xJVEaRtBXrM7rIuWaGw1xeXJSd2Zj1NVjfzon7hAG1WctWllu
         /hpyK8dXaHrx0jeaYlZ/+RSCYqQqVAP2QyFqmVs4AHUYRAThTFMeAySWIPfn7jsWF/lO
         g1Mc+6YskgEQ3xjyBEBJyl2cndGBeTcqiqZIlETaZyNh3hH7dCh9FqOgzjQI5vvC2xc8
         +UANLgqzQWkL3fG2acJESxHg/S89S1SmtDCvgz/fKnidJ724KDkB1SmWLAdsJE2D1QPy
         ITPD/hUBzM2gi869oDGzJmDFMhTzMKFeNVj419aTZUseuxj7F1YlreMGVftra0n2EaQX
         IW4w==
X-Forwarded-Encrypted: i=1; AHgh+Rowd2FcnpS9S3J0nvzQItOYwyLBIm7kDiLJaemVu5/eXgVkQCdb+DFcZHllDgS2OFf2WaeqX89EDeBcl/Ey@vger.kernel.org
X-Gm-Message-State: AFuF++mTudWhMf0efQ2Qlp57z5fTHRoszfwU5s0KLmK2e6Hkc30teUVA
	T4R4lkqUZlAV7GK9AMnYNB6OjiQutGcsiPOJGg5/PMvbnXfugRkyT3Cw1HS063yRkMY6xQaFxfw
	YRDplffaQtKDFT2J592L/0HCr7h8XjdRjLxBa+Nh7rlpjKRIsPdQQ62ioAQO5P48oSNRj
X-Gm-Gg: AR+sD130+kxfaJzMQfNM0WtzDwp2lloEDHLbmUrjJuWadNty59I/tFTUMg1BxxgpNRb
	liOkbqpWIx2LNhx7l4Vgn9viN+oayxqqKs/5p5o8AotTvDQK8998GNHHBUy9t5GWaf210Pt8uN9
	RM6IgOMrYWkEOj6kQmMi9H3MUiv6Ilg0ifSbPtTw+XIHyyF61sD68JXpI0qxfrO2wfc3qMRPqc3
	VWAv0KuRGyak3OXpUjXqG1KJwp/sKqELOIPYnjYaCVxtneiIJ0b4mf32RHuODdAktE/8DM8YsNs
	PT7KGC7JrfCRIrsehKT3aeJvrQMI1JJQAC238eeN3yrhqd0we8Cl4G1Wx6fxDV43cXk2eA+Wuij
	IMbjilvCxzHw6Q5MVX5luIGqMDQNxdg==
X-Received: by 2002:a05:6a00:22ca:b0:847:8b11:5966 with SMTP id d2e1a72fcca58-8523c7f122amr6773229b3a.1.1787639857953;
        Mon, 24 Aug 2026 23:37:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:22ca:b0:847:8b11:5966 with SMTP id d2e1a72fcca58-8523c7f122amr6773185b3a.1.1787639857564;
        Mon, 24 Aug 2026 23:37:37 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc199daed9asm1672400a12.5.2026.08.24.23.37.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 23:37:37 -0700 (PDT)
Message-ID: <57908a66-cb60-4d72-b205-099660ba91bc@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 12:07:33 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] cpuidle: Deny idle entry when CPU already have IPI
 interrupt pending
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: Christian Loehle <christian.loehle@arm.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260403-cpuidle_ipi-v2-1-b3e44b032e2c@oss.qualcomm.com>
 <CAJZ5v0jXwtBz3z4h3ehJTuaqYN4z7=wOv_LGnjQ4LQMP0TBKmA@mail.gmail.com>
 <5cfd774e-8797-4765-a36a-c3dc2d6ac004@oss.qualcomm.com>
 <bc9c2236-6411-4ff1-a03c-d97997b5f780@arm.com>
 <8b728c1a-f783-4660-8ed0-eb131875f2d2@oss.qualcomm.com>
 <6d5dfbaa-f0e0-425e-bacf-f177185d1eff@oss.qualcomm.com>
 <CAJZ5v0hhgGyKFb3ZWFAYyfqmyp7csWAGB7Dus4ZbohzEHQT4-Q@mail.gmail.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <CAJZ5v0hhgGyKFb3ZWFAYyfqmyp7csWAGB7Dus4ZbohzEHQT4-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: jSY3PUEXuY_Eglv4KPDVvqxQDBfUZLMI
X-Proofpoint-ORIG-GUID: jSY3PUEXuY_Eglv4KPDVvqxQDBfUZLMI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA1NCBTYWx0ZWRfX/J1z9NeY+i9t
 zsm7rNhZX5EzcCrgpHNOPV4xgyfP4+IiLchtS9tI3ytwtTzABsPu2HRSyXzTxmBGf2vAVaW3SFH
 5znv9zDg7los6i7r5dub/xlKRoYw/jZHhg63XHUFI1vprrtMKPP0hG71p2th2y4PSXnfgrEU6FK
 drB50Fd5Urw9De9C8yfdRH7NJbDlKx1q84ywaURNM0fclzAPxBpQb8Uvxi7aMSMS5XPuQ09DhEm
 GbeIUlZBkY6Clw0R9/ToTRJGWN/awWy9anYfeT8/cjP1E9IkbtchQD0Ccooh5h6GFNhep3x1hJ0
 hH+Uwt4aS4ShpYVYvhUuQ9kU2nVK1xb3T6NCmjjzOUtETYq9mJC93kQDRaUodhDH6HEZTTngM8q
 f/E2siNBW9p7x1aLiO2rnVuH9fldvr9ReCss6X7PRqpAsM3ayxGx9LxqCdz1AVZPwUYvRzeo2rI
 xmNVztES1xiZih3bU3g==
X-Authority-Analysis: v=2.4 cv=JJULdcKb c=1 sm=1 tr=0 ts=6a8d3832 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=RoGA23PZG_bSAmPShQoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA1NCBTYWx0ZWRfX3cOQ38TuPbU3
 2sa6jl7jXV9JNNF7nfAljo1sYv5qg574lAU0yrNiAVTzBPNSGczIHJl/uFcFeXl5lJtGU+XhxzU
 OrRWfuUFWO259T9F+oBKxvezv0TYIDM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250054



On 8/21/2026 6:33 PM, Rafael J. Wysocki (Intel) wrote:
> On Fri, Aug 21, 2026 at 11:28 AM Daniel Lezcano
> <daniel.lezcano@oss.qualcomm.com> wrote:
>>
>>
>> Le 21/08/2026 à 07:03, Maulik Shah (mkshah) a écrit :
>>
>> [ ... ]
>>>> What do we do about the cpuidle stats in that case?
>>>> I'm thinking primiarly about last_residency_ns and rejected here.
>>>
>>> As the idle entry will not happen (call_cpuidle() is not invoked)
>>> the stats would also not required to be updated.
>> I agree, with the IPI pending it is like the idle task should have not
>> be scheduled, so the idle call is aborted.
> 
> Which is why I think that this should be handled directly in the idle
> loop and not in cpuidle_enter_state().

The IPI is raised to the idle CPU which is still running cpuidle_select()
but an idle entry with call_cpuidle() is not yet made.

with some additional traces added in menu governor, this is captured on LeMans SoC (8 CPUs) running GLMark2,

     in:imuxsock-1348    [007] d..2.   791.122080: sched_switch: prev_comm=in:imuxsock prev_pid=1348 prev_prio=120 prev_state=S ==> next_comm=swapper/7 next_pid=0 next_prio=120

At this point CPU7 is idle, checking the 8 past samples logged in get_typical_interval(),
at menu governor's menu_select().

          <idle>-0       [007] d..1.   791.122084: cpu_idle_history: samples 0=944 1=26010 2=6821 3=5033 4=664 5=1958 6=15226 7=4977
 systemd-journal-373     [006] d..3.   791.122085: sched_waking: comm=in:imuxsock pid=1348 prio=120 target_cpu=007
          <idle>-0       [007] d..1.   791.122086: cpu_idle_predict_params: max_thresh=4294967295 min_thresh=-1 max=26010 min=664 divisor=8 avg=7704 avg_sq=59351616 variance=66916462
          <idle>-0       [007] d..1.   791.122087: cpu_idle_history: samples 0=944 1=26010 2=6821 3=5033 4=664 5=1958 6=15226 7=4977

CPU6 sends IPI to CPU7 at below point, CPU7 is still in the get_typical_interval() loop.

 systemd-journal-373     [006] d..3.   791.122087: ipi_send_cpu: cpu=7 callsite=ttwu_queue_wakelist+0x118/0x1c0 callback=generic_smp_call_function_single_interrupt+0x0/0x30
          <idle>-0       [007] d..1.   791.122087: cpu_idle_predict_params: max_thresh=26010 min_thresh=-1 max=15226 min=664 divisor=7 avg=5089 avg_sq=25897921 variance=21762726
 systemd-journal-373     [006] d..3.   791.122087: ipi_raise: target_mask=00000000,00000080 (Function call interrupts)
          <idle>-0       [007] d..1.   791.122088: cpu_idle_history: samples 0=944 1=26010 2=6821 3=5033 4=664 5=1958 6=15226 7=4977
          <idle>-0       [007] d..1.   791.122088: cpu_idle_predict_params: max_thresh=15226 min_thresh=-1 max=6821 min=664 divisor=6 avg=3399 avg_sq=11553201 variance=5412374
          <idle>-0       [007] d..1.   791.122091: cpu_idle_sleep_lengths: predicted_ns=4294967295000 next_timer_ns=42336718 timer_us=11215 latency_req=2000000000000

CPU7 would have gone to state=2 (which involves PSCI CPU_SUSPEND SMC call to firmware)

          <idle>-0       [007] d..1.   791.122101: cpu_idle_ipi_pending: IPI pending = 1

With current change, the CPU7 will roll-back to running state.

Thanks,
Maulik

> 
> In that case, cpuidle should not be involved at all (if it is
> sufficiently important for special-casing which I'm still not
> convinced about).
