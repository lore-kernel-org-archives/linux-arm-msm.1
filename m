Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B74F43E9FB
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 10:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786013258; cv=none; b=aa21UpY54UtIJ5O+AwR1EX/j5cHcjQKI9VObb6/CLWGdDFtugLeEFGve7VIOu3BZGzhM6U73HFrd6G8wcWC57rgWVfUtXUn76AuxS2cM/6Lrr4PmvCNN7L2sCzJotIc5bs8dXhJXQqoYX5zT4w94S4cYdoIqH+h16SRcU8LTT84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786013258; c=relaxed/simple;
	bh=zYS+zZmBCbwicU1zbLJKCTZb/LX51dmiX4lIFeR0EOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qE7FlxkQo+5Y+7oIg9KeV7tppgUku2fDf7CRoq6r1YBQGSzmjac3umVWFPPT46KqGWzbXOIJxX16LbB+NGI4cPnjdNuQujXfqTrazJJM2y77A03ZZ+6CMEg9z13DD/I5CymAw4KxAmVxWlXXAEQtnc/j7kKcxIVEQgKbI0WyuhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QSKWznhV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OhrQG8uu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QSKWznhV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OhrQG8uu"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nhUD1228148
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 10:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3XcAoiANmEcMbel61kHL29IMp6ZNyBHShgiap9zoaO8=; b=QSKWznhVTZ6i57kV
	kjaG1ShV01GKobYOyZb3oRWY7ctX4zYP5YXNsoB0EoBQef2S/z9/2rUPiXm/HOHa
	7npdLv3qiJj9F3gFV/IMo3bv72iFiKyKES3GhvnkqoED1LeN+Hzf7+GPDIM+mxeI
	sedbtXhmZF0Zr3tEiC0Gl/U+6iFiNOOq1vhMX5m2yYaVTaEuHXCsPnrLlCU6HROX
	mMlUpV3Mgo9c9DY+5Jcugh4eVIkpmRUSgCU8mE9FjGFjFLkYnBRlfNZoNBUx762C
	rIroqx/Gu7ROp4rDwgULhKH8ISfVYJJqEbibvFi2b9ju+D4dEt8YvrvlSEZX9+gQ
	RvuP1g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvqdugc96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 10:47:27 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8488ac68185so5085487b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 03:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786013246; x=1786618046; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3XcAoiANmEcMbel61kHL29IMp6ZNyBHShgiap9zoaO8=;
        b=OhrQG8uuQMiUbTnqFlbEH3rWx7wSWLBKn/eAfUes4d1XNKVTuvWfEnb6GdoYFR0+ht
         KtbGz7cE/HPsjScFjX/YqPVC7oLuoN7c3G79qi/gRnI1pJ0Eh635kuCo0nbmeEubrgqW
         7MRyu0d8KAnLSMUqLVuk4En7/MLOMYhngpXSjlz3WsQbTN41fZe8OTg9OmXtyKUl8Rze
         xUjGZL+lojUHnPOSbO2rRKCzIAcnPVDS49TYaIS8bkOiEQlNXT3AD0Nix7WR+wAvtp+n
         pjCnVVF8DL+rL/sCYKyqCdBHDPBply7fu7aBcrrYqrqjGDmdGLXl/OuuNq4ZwaoTEJ+v
         BuiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786013246; x=1786618046;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3XcAoiANmEcMbel61kHL29IMp6ZNyBHShgiap9zoaO8=;
        b=qdw+2m3/uYDTTDuCZk+HQ6TDBYkEJoFzU1giAMb/bCCR0FCE6uTD3K444AGO4McyCA
         TXeIkYl/183dbZCZ+dujR/+wuzb6RGtSvJshR/g44sRKAlZz8N1RANIHUtGbPmSlrNPl
         sZV7lfJ7qviuen8HBKdc4hqUwdyGez3yUJ2qb0layK9/KqFYhKbgWBKQwugzO4V5j4d1
         HLn17/zOkD7WYcYfsDXlXrGcrXhBZ/FYmDMRzXGD3jxh9RWj/8sKsvLJKX4yrF7gH306
         jxwn/yJTTLLF7alqcg9KamAkDX7xVdHCZPBovO9EK8Mbke5h6SUuHwpysteliOFbr4eQ
         Lsjg==
X-Forwarded-Encrypted: i=1; AHgh+Rof8nrDpq41etFYgjYjkn+pnyJYon8IjnKlAhnZ2kY1mrlMQnc3d5PurXCwUqivvGahcla946h3QQbh/ncn@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr9+jRlARYvdF+zZnADOP+lhKieWDdm0MdrKA3CLUiYvVREUVL
	ct2Fb2UBL5tB45anEk2jk1E9R5f7HEhs1PO9IJSjR5CCMoK77hynCmBwagnnAakEi21QgZqbJeJ
	Fp/u0hjWRCYq/a1TI6DWx/gYreqXUPpfLBQMuCMoeXDtTkZuM3d8gUt/MRTfl4jAymT6o
X-Gm-Gg: AR+sD11xe7QVLhYHZ8hh1jdT0ch2rPoSVMwIS4CVoxQuQN3Gtww/T14o6ltBVAHlLBT
	pQ5GYk6OcfRTnYGy3FVYM67mmJj1XE1XqGZ4G6dS3ol75s7g5yKrh/Z1ULmNBToTY+U8h+1wVeo
	9SzHtjavrGTzle3llG80yoQ1uQ0ShMQmp8hVKcbNNx+D6pBgqdtfScGPN+ZSwsRNbZYRrgNIsoT
	QaGc76pxPS4aarE3/9z/prTKgNX+tyOtiutFnSDTyrANrZHPnzitarvYbM5AqDEF65wuKROmx62
	QaQdku0fQIWoEoYhkKnC0feTf7CZh4ZWo6AfnSggeN7pMPwooX/RmH30YrU/gvHJ1dvQfwp1lbt
	Gu2M84mcoWhk3GVSoH8h40s6xSyQGLkY=
X-Received: by 2002:a05:6a00:3c84:b0:845:e9f8:67de with SMTP id d2e1a72fcca58-84f2e0555a6mr14758721b3a.27.1786013245878;
        Thu, 06 Aug 2026 03:47:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:3c84:b0:845:e9f8:67de with SMTP id d2e1a72fcca58-84f2e0555a6mr14758664b3a.27.1786013245412;
        Thu, 06 Aug 2026 03:47:25 -0700 (PDT)
Received: from [10.218.10.148] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f453bb24csm1138822b3a.24.2026.08.06.03.47.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 03:47:24 -0700 (PDT)
Message-ID: <89c7178e-dab2-4b2a-8d8c-c91363b7280d@oss.qualcomm.com>
Date: Thu, 6 Aug 2026 16:17:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] iommu/arm-smmu: Use pm_runtime in fault handlers
To: Pranjal Shrivastava <praan@google.com>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
References: <20260630-smmu-rpm-v3-1-f69874a580fa@oss.qualcomm.com>
 <anB8ydWLQw0KZxqT@google.com>
Content-Language: en-US
From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
In-Reply-To: <anB8ydWLQw0KZxqT@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: gy2wzxdudO4pM95miay1Bo66z12ELQ1h
X-Proofpoint-ORIG-GUID: gy2wzxdudO4pM95miay1Bo66z12ELQ1h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4NSBTYWx0ZWRfX01eCYtnxO8Zs
 AQ4n53581VRIjpyC87xIZ8nYmCHr4Eymtk/V851nCkzhSMtfpBSIuyZvAEyB0WVrDrjGUZD1XUa
 yuKaJlpvtyZE7/in4H/IS/n6zbjlh8aT0DspAqvVttyOiIGEFifJibv4FHCqgHrfhTVpS+Mckfk
 gvvJrVuoQ0fE8YdRa3Ng9z0VRdxazQLOFOnrt4GIxQ5OnpUUISbIqYZuV21GX3mDPhsjWMTkPz0
 NJwhi0QQ6SaOckJk11ZF6bKsHQIHumZ+QzWR3OmGaQEmsWbU73xFP7WoJDTDHj6nLF/U1KbHlxE
 Ztz37438Xy36DURmMYNRovcYGg5Yp1AunZFXzXC6aOaSOys1FsfPYJyIY6jOFn2BkiLiRTncJ67
 +yszN/prtxRN/hWGv8sjmutIASyyBNLh8bwFMxUHFfKlf44rDsDVDWurS1g7l4XpJmD1+urz8+K
 7co/Xg2oEzwIm+Ajc6Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4NSBTYWx0ZWRfX81QyrgFuCSjD
 +ovO3TxKq0jxdOoIX6HNqVDTxuOyRHdroIgkK30NV16VXkGk+GvjjIpG1hBUq7FmC7ovxiMQCsd
 i6oKQNLX4QtcGAz9olG/TXaX72QiRYw=
X-Authority-Analysis: v=2.4 cv=bdtbluPB c=1 sm=1 tr=0 ts=6a74663f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=1XWaLZrsAAAA:8 a=k4Bztf7HfYMb5pBHrIQA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060085



On 8/3/2026 5:04 PM, Pranjal Shrivastava wrote:
> On Tue, Jun 30, 2026 at 02:32:46PM +0530, Prakash Gupta wrote:
> 
> Hi Prakash, 
> 
> On a second thought, I'd like to discuss one more thing
> 
>> Commit d4a44f0750bb ("iommu/arm-smmu: Invoke pm_runtime across the driver")
>> enabled pm_runtime for the arm-smmu device. On systems where the SMMU
>> sits in a power domain, all register accesses must be done while the
>> device is runtime active to avoid unclocked register reads and
>> potential NoC errors.
>>
>> So far, this has not been an issue for most SMMU clients because
>> stall-on-fault is enabled by default. While a translation fault is
>> being handled, the SMMU stalls further translations for that context
>> bank, so the fault handler would not race with a powered-down SMMU.
>>
>> Adreno SMMU now disables stall-on-fault in the presence of fault
>> storms to avoid saturating SMMU resources and hanging the GMU. With
>> stall-on-fault disabled, the SMMU can generate faults while its power
>> domain may no longer be enabled, which makes unclocked accesses to
>> fault-status registers in the SMMU fault handlers possible.
>>
>> Guard the context and global fault handlers with
>> arm_smmu_rpm_get_if_active() and arm_smmu_rpm_put() so that all SMMU
>> fault register accesses are done with the SMMU powered. If the SMMU is
>> not runtime active, the fault can be safely ignored as
>> arm_smmu_device_reset() clears fault registers on resume.
>>
>> Additionally, disable fault reporting in arm_smmu_runtime_suspend()
>> before powering down. pm_runtime_get_if_active() returns 0 during
>> RPM_SUSPENDING, so without this, level-triggered fault interrupts would
>> cause an interrupt storm while the device is being suspended.
>> arm_smmu_device_reset() re-enables fault reporting on resume.
>>
>> Fixes: b13044092c1e ("drm/msm: Temporarily disable stall-on-fault after a page fault")
>> Co-developed-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
>> Signed-off-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
>> Signed-off-by: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
>> @@ -2306,6 +2329,25 @@ static int __maybe_unused arm_smmu_runtime_resume(struct device *dev)
> 
> [...]
> 
> I believe, there is a small race condition in the suspend path that can
> lead to unclocked register access crashes. (Something similar to what
> I've attempted to handle in arm-smmu-v3 [1])
> 
> In arm_smmu_runtime_suspend(), we disable interrupt reporting in sCR0 and
> SCTLR, and then immediately call clk_bulk_disable(). This disables the
> interrupt generation but what about the interrupt handlers running
> *during* suspend? I believe we could have this race:
> 
> CPU 0 (Suspend Context)                    CPU 1 (Interrupt/ISR Context)
> -----------------------                    -----------------------------
>                                         1. arm_smmu_context_fault() starts.
>                                         2. rpm_get_if_active() returns 1.
>                                            (Clocks are ON)
> 3. arm_smmu_runtime_suspend()
>    - Clears CFIE/GFIE in registers
>      (stops new IRQs from firing)
> 4. clk_bulk_disable()
>    (Clocks are CUT)
>                                         5. Attempts MMIO access (e.g, to
>                                            clear CB_FSR or CB_RESUME).
>                                            --> [CRASH] Unclocked MMIO access
> 
> I believe similar to arm-smmu-v3 [1], we must call synchronize_irq()
> on context interrupts after disabling them in the SCTLR but before
> we cut the clocks. This forces CPU 0's suspend thread to sleep and wait
> for any active ISRs to safely drain while the SMMU still has clocks.
> 
> We can simply add this loop to arm_smmu_runtime_suspend():
> 
>>  static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
>>  {
>>  	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
>> +	int i;
>> +	u32 reg;
>> +
>> +	/*
>> +	 * Disable fault reporting before powering down to prevent unclocked
>> +	 * register accesses in the fault handlers if an interrupt races with
>> +	 * the suspend callback (e.g. device in RPM_SUSPENDING state).
>> +	 * arm_smmu_device_reset() re-enables fault reporting on resume.
>> +	 */
>> +	reg = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sCR0);
>> +	reg &= ~(ARM_SMMU_sCR0_GFRE | ARM_SMMU_sCR0_GFIE |
>> +		 ARM_SMMU_sCR0_GCFGFRE | ARM_SMMU_sCR0_GCFGFIE);
>> +	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_sCR0, reg);
>> +
>> +	for (i = 0; i < smmu->num_context_banks; i++) {
>> +		reg = arm_smmu_cb_read(smmu, i, ARM_SMMU_CB_SCTLR);
>> +		reg &= ~(ARM_SMMU_SCTLR_CFIE | ARM_SMMU_SCTLR_CFRE);
>> +		arm_smmu_cb_write(smmu, i, ARM_SMMU_CB_SCTLR, reg);
>> +	}
> 
>     for (i = 0; i < smmu->num_context_irqs; i++)
>         synchronize_irq(smmu->irqs[i]);
> 
>>  
>>  	clk_bulk_disable(smmu->num_clks, smmu->clks);
>>  
> 
> Since we're disabling those interrupts and fixing concurrency, 
> this seems like the perfect opportunity to add the sync_irq too..
> 
> What do you think?
> 
> With that loop added:
> 
> Reviewed-by: Pranjal Shrivastava <praan@google.com>
> 

Thanks Pranjal for review feedback. I have addressed the comments in v4.

Thanks,
Prakash
/com
