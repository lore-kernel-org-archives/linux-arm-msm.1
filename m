Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEA6736F411
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 05:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787722064; cv=none; b=OY0vozWsyCrZYekTNUAwm4K91bo2PmRw3twaoio3AgdoNTcWbK6TZvoCLZpncMBOHQzBu0QZZLpHfqXMWc7PiR6BFFPVyLeEgskCrNkKaHqnGUXE5LyJjtD3Qo/i+00up1aRHO9xlUBtZU0SLiLY9HR2kLJ0uqv2S+PE+bS/Ljg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787722064; c=relaxed/simple;
	bh=uDaN2GesvFuirtHmWIob7preip2EQiQJbodwJi+qnls=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ufpvd1gn/ZLYM2jqyEjIL8lPTSdo01hn7IehCimz/g/K9Gx9xzr6n7zJiQpf/IWar/ppom1h0BcojMwGbTCqWvnoM7G2iVRvsiqrZ8MfiPtQG/ts6KTpfMGcvqkb0X9iW91ixpVRwK3MJcnepcOG32Z+/uCLDOjoO9V7iXtDM1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PObLEfxu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AW2idUEi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PObLEfxu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AW2idUEi"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q4bRLE3543257
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 05:27:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	866BONmk+mo4MtHhva/j93p/+1G1tiW7bQq9Ar62OCU=; b=PObLEfxuiPflDKV6
	2As6Ms8O7wvNGoU33xu550alzO0up6BVb+1E1YaxwWhyIh60+m6j/NRwfbDXOL4i
	ih0HVXfqF3SULYuUwFZe8wED/QQj5g2yMYJVwo2T6vHdi3XmbVflAKQMIQh0AbaS
	ZxSH7vRe6kpuXHA0s76aGnknPWpDLnGe4hoEXoOtxHXkYWDY2VT47xLjo+24OfKs
	ntYfgJmQ76EZJxJHZw0SWo/dqZU6UhONaC56tBzqKwsU/g2TYXgUOWGfIVfSbvxx
	PBgxZVzUAVOtHEQNDMEmz7FT79Qjy7pAt2n9LFjbMD8nshfVBWfj1ujPGQrAuhcW
	7QHRtQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9s9g84qk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 05:27:41 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc12e8e22b7so1269846a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 22:27:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787722061; x=1788326861; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=866BONmk+mo4MtHhva/j93p/+1G1tiW7bQq9Ar62OCU=;
        b=AW2idUEiOdpq/GbI4A4PBch77us1ovOxUQA7RJZfXUvFdVaekJchgqeGH3VYDIiUaQ
         lTVNzvYXQyhnJQ/R8FHBLRI+D3hCuplzKEMdQURfXnCcVJL5Pu/9DdVvXsxpLOF4Mpgs
         AHLyzZOdPlY0H3ZfPRo9pjvdiSq4suo3vG4BVdyn23ten/Pj4mR21Fms3BHRYzd4X/G9
         Kx8yVkDuQtJQcTyIA9goIYYcpPi/HUKAVZ4fmgVxU9f8MR5IrwHMaAnYcJT3mlPcbslI
         G16QTDnTPCB5+h8FsErzEta3ylye+M3cRSeQ1nze4Qu3LnvnAkqXqB2ChbPYD753bgr7
         abXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787722061; x=1788326861;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=866BONmk+mo4MtHhva/j93p/+1G1tiW7bQq9Ar62OCU=;
        b=QTiQlNREoSvOgck69FEh52sS+zKAhsWsFP/KUNXssUMxUj41SpG+JY5NLgXX7eizNe
         wRWZBmOFrlDbgQyoa4urFTjP9pNwCg0C2skBKKTtXltisHpp72NV5q4ZBY+nlBG1P+/f
         V7EdD2ibdOfj1zO3qjn1HxiHxT1W2Ub+ZVYndlpsjcMsZZ9sOklA9+C3MxjiUnbK+Rqo
         r0k26KcAA2VPCKKzJyXZSufhXcFLKx3HT2r/G2wG+eM6mST/YMMISV+8ulLId8072DU9
         FEtbN+J1DPp7rrX5zebWYCOMy7wmAVbLs3YNqoPehNYWnBpwbrQEFQKg7hWYlws8Taa0
         sUEg==
X-Gm-Message-State: AFuF++nqKQApQRnx3f93QJMMmyl7YX+QoadzHRbOnAgLRChEz1Svfr/J
	d3hEobLvLq7fWdVdml61JSowjW1nOYXGB0TLPHPQZOAniUC9J/x5EnEDbuBIPsQ+AvkOzhJ0Bf8
	p1VjbnUjdSf/mRobokXuIUiPgVym8mLfhZO4g3VvcOhL8o6fxpbfFE+24h0atnMp0s41l
X-Gm-Gg: AR+sD13E/VAIOK+IlL9mpsLchBJl0ClcQ4B8v7LI27KktRk4BjkjtG4gD1qeqA8eVPH
	u+18WbZpETr0EozCbGw5821Pe6bWOKqEd7nVCgY7kIjL5SjmqYE30Tu3XhcrZwiBZXGgiU/xX4T
	MZBuM9+mrwJ7Y+PUUGS1fyZu+w5i8Mv4h0uqurbrwf0mnA2QwGYwnaLUMlSsuczrejus/oGGMAs
	VN8RbTr4lU7tFTL31pk5YDGGigWN5PEKZi5+LA7f1UhuBY4mDCgBzYC3LNOBDgQ6D/JzwDKl9I2
	GlqD1HXdWfHus88D4uWkvt7BEnwWsFg1YG9vdQbCCkMGMr4/bD6PVoC53ylFkEC3D6GSHOEzbgE
	9J5Usgv/mN8HjyerO
X-Received: by 2002:a05:6a21:680d:b0:3c4:396d:4a6c with SMTP id adf61e73a8af0-3cf75e8b237mr9386282637.5.1787722060796;
        Tue, 25 Aug 2026 22:27:40 -0700 (PDT)
X-Received: by 2002:a05:6a21:680d:b0:3c4:396d:4a6c with SMTP id adf61e73a8af0-3cf75e8b237mr9386176637.5.1787722060365;
        Tue, 25 Aug 2026 22:27:40 -0700 (PDT)
Received: from [10.216.54.141] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a905c18bsm4681138c88.14.2026.08.25.22.27.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 22:27:39 -0700 (PDT)
Message-ID: <c3e802f9-4657-4595-92a7-14436d2d2fb6@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 10:57:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 2/3] ufs: ufs-qcom: Align programming sequence for UFS
 controller v6.2
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, mani@kernel.org,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org
References: <20260122141331.239354-1-nitin.rawat@oss.qualcomm.com>
 <20260122141331.239354-3-nitin.rawat@oss.qualcomm.com>
 <883a2f40-a945-47f0-8022-20ad4146acf3@oss.qualcomm.com>
Content-Language: en-US
From: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
In-Reply-To: <883a2f40-a945-47f0-8022-20ad4146acf3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: WT1iBRPltYTZc-ndG3BXrGgaG640YcPh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA0MyBTYWx0ZWRfX1F/UeA05PPj1
 CUvTupFBJYTqj9ZeaAObec3HpC5Avuc3mWawxhBLxH6aQIIQH8WbgC3vKipEcocGCYw2TRvbgjx
 SMFBq34uhah5xt40rhoWMuzukf/Da2q7Dkzu68hlVj3JKyDmEnMJ56sFqc7TaGE+HOjxu3W+VXv
 3i+Ot0iQv2boifc/syFtoCg4CDdhPvljHUrmLS/aEPBKJxYHlkNIEZpekLEGViFa0cWLGRsrxSu
 a9WQAKrCl4dzchq0qyzF/4Xqcl208fnTATQ8vy0bsXz0DiV9MunhpoOCxgkGIWDmcs7gr2d+tHc
 mAU0/iWk/KMCe/aRkF+Me+wWuzyXj3dxYXbrHv1zJ4/YPm8e1NaLDjSK7kHJSJ67icg7I6l2zzG
 q85p/0rAGGvfiZDAxt/CWXeNbOd0qrPlOwksKqrG2dvo8Ba0Dp9UDZlqdaODcfQ+IIxDw9DZcgh
 gTAJDTMNNxa3KPL+b5w==
X-Authority-Analysis: v=2.4 cv=Xfq5Co55 c=1 sm=1 tr=0 ts=6a8e794d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=OVEiKLsq3_rofKxWuQEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA0MyBTYWx0ZWRfXzekb2SPv/rS0
 mYQid4daodXW/lip+grvuIsn568x5KvNysOolxRTXNGLBiNDE6+3qFzIUtjeFH2syArQjwcQbD8
 L7KtASmUWO+T1G1uddwFfgy3+O7XAd8=
X-Proofpoint-ORIG-GUID: WT1iBRPltYTZc-ndG3BXrGgaG640YcPh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260043



On 1/22/2026 8:39 PM, Konrad Dybcio wrote:
> On 1/22/26 3:13 PM, Nitin Rawat wrote:
>> UFS controller v6.2 requires bit 31 in the spare configuration register
>> to be set for high-speed link startup mode, as per the Hardware
>> Programming Guide (HPG).

Hi Konrad,

I've revived this patch. Sorry for the delayed response. Thanks for your 
previous comments on this patch.

> 
> Please stick a "Qualcomm" before mentioning UFS controller v6.2, I
> don't think that is immediately obvious without looking at the code..
> 
>> The spare register value is read during host driver initialization but
>> gets cleared after UFS reset. To align with the UFS v6.2 programming
>> sequence, preserve the spare register value during initialization and
>> restore it during link startup to ensure proper high-speed mode
> 
> I believe you're supposed to write the value yourself, depending on the
> state of the controller, it's 0 at reset.

The link startup mode (HS LSS - high-speed link startup, or LS LSS - 
low-speed link startup) is decided during the boot stage based on a 
bootconfig GPIO. This selection is carried forward through the secondary 
stage bootloaders and finally to HLOS via this register.

This register is only configured by the bootloader — no kernel code 
writes other fields to it. The kernel reads it during initialization to 
capture the configured link startup mode, and restores it after UFS 
reset (which clears the register to 0) so that the bootloader's 
selection is preserved for link startup.



> 
>> Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
>> ---
>>   drivers/ufs/host/ufs-qcom.c | 11 ++++++++---
>>   drivers/ufs/host/ufs-qcom.h |  1 +
>>   2 files changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
>> index c43bb75d208c..ab5aed241913 100644
>> --- a/drivers/ufs/host/ufs-qcom.c
>> +++ b/drivers/ufs/host/ufs-qcom.c
>> @@ -686,6 +686,7 @@ static int ufs_qcom_cfg_timers(struct ufs_hba *hba, bool is_pre_scale_up, unsign
>>   static int ufs_qcom_link_startup_notify(struct ufs_hba *hba,
>>   					enum ufs_notify_change_status status)
>>   {
>> +	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
>>   	int err = 0;
>>
>>   	switch (status) {
>> @@ -708,6 +709,10 @@ static int ufs_qcom_link_startup_notify(struct ufs_hba *hba,
>>   		 */
>>   		err = ufshcd_disable_host_tx_lcc(hba);
>>
>> +		/* Update REG_UFS_DEBUG_SPARE_CFG to set HS-LSS mode in link startup */
> 
> "HS/LS"?

I've Change wording ("HS/LS" instead of "HS-LSS") in next patchset.

> 
>> +		if (host->hw_ver.major == 0x6 && host->hw_ver.minor == 0x2)
>> +			ufshcd_writel(hba, host->spare_cfg,
>> +				      REG_UFS_DEBUG_SPARE_CFG);
> 
> Is that a "only on v6.2", or "starting with v6.2"?

I've Change version check from "only v6.2" to "starting with v6.2" in 
next patchset.


> 
> Also, I see that this register has more than just this one field, with
> the previous question in mind, I think a rmw would be desired here

I'm using ufshcd_writel since this register is only configured by the 
bootloader and no kernel code writes other fields to it, ufshcd_writel 
is sufficient as there are no kernel written bits to preserve via rmw.

Thanks,
Nitin

> 
> Konrad

