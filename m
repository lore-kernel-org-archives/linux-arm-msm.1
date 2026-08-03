Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EAF933C183
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 15:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785772673; cv=none; b=t11KJ51zPo0BbsPkXEudESD/lQ3qEHNlEtPXHjk2xzi1EEFzkL02hfClqRosAt9hdUXKRfUh1vC//RtJFg966CIxHb97zgmdXHLPGf1yXTOs0iwbI/RHQ2HgiWiUAm4eqawECudHa/JSqq+2eQOpN/1Ndcbxw8qsnBrGCrOXPzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785772673; c=relaxed/simple;
	bh=/fmB7Ujz5KUozMQSO1nSxFvk2smNKq537zuc49d4Ip8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oEn9MN2VBgZS0KVNLAOGjppxcjz6wV9VHc2mW/NJghZ3+Zvllk7qeNI1t4rBw5iLUYJanokzfaEoLCk+jJRhVkQ9liEMQJDm7nuqA0cxJ0Vq27h0BmsOXbh3+XmZpI9eFlv+3ZNUDF30cJjhKgr4U3HU9cx8mi6KX771yFNwDQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N9poywF1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CLQVMGqH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N9poywF1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CLQVMGqH"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673EBnbh976663
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 15:57:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nvZMTQb3sKuilMlizVd/RUgZzAHN9JyDHjQi4foIjuk=; b=N9poywF1Q4ssOAhZ
	S1ibNJtQXlEJOqp6teNcnwYVoTPAByZBy76dS4kNd/w7rOdVCn5jBnHHdhYsQjdj
	zHLp3A3pvNaS3DHu+rL2O8FKNSQzhUpGcydmSiD7JUYzkbV5lTs8zaacoFJnRnmE
	xD5vT6s4sfaRPOgL/2iNyVZ97i2bqBUuydMWBhu7Fvet5pAoXqto56PCe7OVxPPE
	eWhfgXzQ0RknyMkPIctVI26CJhyNfzcgvvC+BPuAW1gyblgRJSdZAdpunQSlHRhJ
	Pdk4IMJumzFLFVXWD2zey/UUZw08BiTPjdVAd6O9p/qq1W7k5Hr04aljPo7eFfFp
	mw6xnw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftp16a90v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 15:57:51 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84a251c2e3eso14202b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 08:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785772671; x=1786377471; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nvZMTQb3sKuilMlizVd/RUgZzAHN9JyDHjQi4foIjuk=;
        b=CLQVMGqHAnFWnrOLgJgL6gOPCHYR0ZLa+L3KZvu/VuwD5FEXyHRWAVamhCK/yGt/A2
         e4mrAPziiYjeteDJ9wSQNLMe9/seKBojRrWlbpfsz8tGeHFonnhGBhT+zuIXYEoJUIgM
         hAPewzwKhrDzKqA+CJGLCtx4evSwjjExdn2AiaAFkics28CnGuj+tfk+eiIgc6JaxF6l
         q+eTEIpzul2HLsZ9f+UjmUSHETt4Rz+EPn/vSkQHLxA/L68t98EBa4rM3lK6zA3Kqz+q
         /6B9krCwvOTdfQMCGG6CoCH/1VeRUcTW8ma2B+98Mop5GwR6cIWZ0VxI2D07N2oc84kn
         mmjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785772671; x=1786377471;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nvZMTQb3sKuilMlizVd/RUgZzAHN9JyDHjQi4foIjuk=;
        b=siQqItuenzyY0udOrs2o32+/y6uqGnKnWGg+ja6ysVVJZynZVVkSWQjVcTi7pAYrHB
         EzC+0pkCYtWgnYxqbdgo8JQoKJKJ/UO4/Hgfhme0EmTp7PHJU92JV73R5wEdy1Wj1VuN
         wZjjHqGSVi6h83PjyyOEP0eAHDrAsS5LbT86luhQxpIISzVJByrBWk1WOAE2nVgn7IxI
         Qiwwx4wrI4P1Z+lgEUEupfRVFOiusYu+LJVvyPJv+0eE3dUR0fT3cFtW0aZGQ295tGJh
         wfTZ04QIiRmRPvDrxPTQvqCTMHRyiX3PJzXW2Lbsq930+Zc9VHfPAXhiCgKJpHbUm03A
         8kqg==
X-Forwarded-Encrypted: i=1; AHgh+RqijGMA2vNSXP+X5usDxcY+4yQZFP5DLP6C/LPqZryNNz78GrUHC9Enxg8D2V+6n761MvUuM7cHSzeJ7bn+@vger.kernel.org
X-Gm-Message-State: AOJu0YyX/2ZmBXT6H2fJgS9GadcQ2gUSQ8yvKyXW0hIlmbncy068okUS
	/t4SxxDCSvY8bc3UooFlxUWEQLfILGCK5u/e18Zt71GyBEDvLoQFFB/C99beCNpNxUsyAFgGUoE
	CrQWmd+LMqAFyHnnwMwpzlvHvG/RKlIAkHEvp+IjaSGG5uklJvsRbIZRPFioOgih7D9f+
X-Gm-Gg: AR+sD10eqCgJQ0eUWQUqtI/kh+hzUG54zGcV7fNejYeW2rEhn5gEWbjZBXONJcEzRN3
	DkROxQFewWab3GMARsXy6ljNp4sf5lT4zQUjhVfUiBkUSmMLf0nGN5FFbBPFoqpzmn96dG+Ukxf
	ejlSgImOT+/TarAdfpSjoOks53nnJEhQRJEuNjIoEZDY6xdCZ7OFxW47dH/RScA/GofYiqny1MR
	lqpCQlvsuPv7OLv9x1MCPjeZLEuVg7nIJ67cYPCp3v/KtvR31Kugzu9L20fQHTud7cu5eHjA0Gb
	twJLRR0Ks/ZDkxWIbx8dwOIOB+85iTiB/OHiaN7o1xMXZC4jnt0yNBOo+SJXbQ2/6g7vzhMJIOP
	RTOJaOl77fPRl9u4Wjj8Vo0VUZcJrnMyAbl+XjQCYzCn1pWMtcUHBCw==
X-Received: by 2002:a05:6a21:9185:b0:3ba:d7b0:fcac with SMTP id adf61e73a8af0-3cb6c75336bmr125702637.5.1785772670671;
        Mon, 03 Aug 2026 08:57:50 -0700 (PDT)
X-Received: by 2002:a05:6a21:9185:b0:3ba:d7b0:fcac with SMTP id adf61e73a8af0-3cb6c75336bmr125661637.5.1785772670126;
        Mon, 03 Aug 2026 08:57:50 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18e70esm64951283eec.29.2026.08.03.08.57.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 08:57:49 -0700 (PDT)
Message-ID: <6e2fda2f-ce14-4f81-b848-9fee4e6a221a@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 09:57:47 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: Flush the posted write after writing to
 MHI_SOC_RESET_REQ_OFFSET
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Alex Williamson <alex@shazbot.org>
References: <20260623145134.43976-1-manivannan.sadhasivam@oss.qualcomm.com>
 <cc4bb54c-fee1-4478-af17-8b48ed379210@oss.qualcomm.com>
 <af5gbjoe5eswhnofzsvvknt7dfqbgyfs4kjkwzt6viivb5vwte@wjs7pg54szz7>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <af5gbjoe5eswhnofzsvvknt7dfqbgyfs4kjkwzt6viivb5vwte@wjs7pg54szz7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE0MyBTYWx0ZWRfX6s2Qxb3OQ7K6
 hEQIUztvtQm2hN6XFaBGRM7vpLW307ewmiEaS6vd/MLSntNc0ulKQHokyuEnDXPlwzJIVAbv+eE
 BfWMQcTwv/rhpthRY7aFsUP0G8tWExakDQRqG8IInHrrs7JH3ELxWkI8ZI91ygrtv2paCix/4go
 AwK3PmWj490KcBptPucyW83HZHnl0sFDpQKfELbmXhdvYO2AIsCRnq1t8F9h/eCXrEf+bT4dLPE
 9rHgq5DlMugS6Lr4uSONBjqGXgTa302G8sMeALU6XAwaqWf/dpI3ER4FsaVfyvVAM2frtyYFjgJ
 tRT7Bfl/MNJuyizIwDwA+fJestlt76GbBQEgs37EbGG1jk1DJyJqxEfg+YR7qEMU5FM5DQypD9e
 cxLMPE2MRZuT2bJ05CbhwPjrxwidsZGU50fJl/46KfSKuWlmuS9jHlnOg5iiYNEBhVICFdub5JV
 OYvqf4XRKXjaULP7wNg==
X-Authority-Analysis: v=2.4 cv=Wpob99fv c=1 sm=1 tr=0 ts=6a70ba7f cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=r1p2_3pzAAAA:8 a=EUspDBNiAAAA:8 a=balVh9TWn1L6BMhRoM0A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=r_pkcD-q9-ctt7trBg_g:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE0MyBTYWx0ZWRfX659/YdJ2wz+j
 OeEEO7Jcg0KjkBQ1IUB2rfZ/eI6NCwXWN36H2ErRicaAWR8sWfNRs7VirTmRAbV8SGvVsLHJ8FF
 XKyh2ODdyQd7J3aFVgkPUlCNzyGhrHQ=
X-Proofpoint-ORIG-GUID: pd7ivpwx9AEFZqzaMFRGnfblisMyaNJM
X-Proofpoint-GUID: pd7ivpwx9AEFZqzaMFRGnfblisMyaNJM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030143

On 7/29/2026 11:19 PM, Manivannan Sadhasivam wrote:
> On Wed, Jul 29, 2026 at 03:07:00PM -0600, Jeff Hugo wrote:
>> On 6/23/2026 8:51 AM, Manivannan Sadhasivam wrote:
>>> mhi_soc_reset() tries to reset the device by writing to the
>>> MHI_SOC_RESET_REQ_OFFSET register. But it doesn't do a read-back to ensure
>>> that the write gets flushed to the device before returning to the caller.
>>>
>>> This may lead to the delay (if implemented) on the caller to be
>>> insufficient, if the posted write doesn't reach the device before the
>>> delay.
>>
>> Interesting.  Is the delay tight enough that a few ms will possibly blow it?
>> Seems like a poorly defined delay.  All the devices I'm familiar with take
>> multiple seconds to boot (with some variability due to ddr training and
>> thermal constraints), and if the reset triggers a crash dump, then its
>> easily tens of seconds.
>>
> 
> Which delay you are referring to? RDDM delay which is just 2ms? Yeah, that seems
> questionable. But this function itself doesn't implement any delay. So your
> comment was somewhat confusing.

The delay at the caller of the API referenced by the commit text - "This 
may lead to the delay on the caller to be insufficient"

I looked at the thread referenced by this patch via the closes tag, and 
while I can follow the virtualization flow, I didn't get a good view on 
the specifics.

>> Regardless, since this reset will either kill the pcie link, or disconnect
>> the SoC from the link for a time,
> 
> No, this will not reset the PCIe link AFAIK. PERST separation logic available in
> the Endpoint should make sure the PCIe link is active while the SoC is
> undergoing the reset. Otherwise, if the host tries to access the device config
> space before the device is ready, it will blow up.

Reset separation (PERST separation is one part of) is not always 
enabled.  PBL won't enable it as it requires loading the reset sequences 
to the PMIC, which is outside the scope of ROM.  So, if you have a 
non-flash boot device, or a flash boot device that has a 
non-provisioned/otherwise corrupt flash, the EP may be sitting in PBL 
from cold boot without reset separation enabled.  If the EP is then 
passed to a VM per the related thread, a reset will occur, which will 
take the link down.

Also, if I recall correctly, automotive products do not enable reset 
separation at all for ASIL reasons.

If the link is down, the upstream component of the EP should complete 
the read with an error, not cause the host to blow up.  The only host 
issue I'm aware of is if flow control credits get exhausted, usually the 
host will watchdog, but I don't see how this patch or the situation it 
addresses would trigger that.

> 
>>   I've been trying to figure out how this
>> change might break, but I haven't found a scenario, so I suspect this is
>> good enough.
>>
> 
> This change should not break any devices as it just ensures that the posted
> write gets flushed to the device before the delay.
> 
>>> So add a read-back after writing to the MHI_SOC_RESET_REQ_OFFSET register.
>>>
>>> Fixes: b5a8d233a588 ("bus: mhi: core: Add device hardware reset support")
>>> Reported-by: Alex Williamson <alex@shazbot.org>
>>> Closes: https://lore.kernel.org/linux-pci/20260622160822.09350246@shazbot.org
>>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>>> ---
>>>    drivers/bus/mhi/host/main.c | 6 ++++++
>>>    1 file changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
>>> index 53c0ffe30070..4d458396233a 100644
>>> --- a/drivers/bus/mhi/host/main.c
>>> +++ b/drivers/bus/mhi/host/main.c
>>> @@ -170,6 +170,9 @@ EXPORT_SYMBOL_GPL(mhi_get_mhi_state);
>>>    void mhi_soc_reset(struct mhi_controller *mhi_cntrl)
>>>    {
>>> +	int __maybe_unused ret;
>>> +	u32 tmp;
>>> +
>>>    	if (mhi_cntrl->reset) {
>>>    		mhi_cntrl->reset(mhi_cntrl);
>>>    		return;
>>> @@ -178,6 +181,9 @@ void mhi_soc_reset(struct mhi_controller *mhi_cntrl)
>>>    	/* Generic MHI SoC reset */
>>>    	mhi_write_reg(mhi_cntrl, mhi_cntrl->regs, MHI_SOC_RESET_REQ_OFFSET,
>>>    		      MHI_SOC_RESET_REQ);
>>> +	/* Flush the posted write to the device (ignore return value) */
>>> +	ret = mhi_read_reg(mhi_cntrl, mhi_cntrl->regs, MHI_SOC_RESET_REQ_OFFSET,
>>> +			   &tmp);
>>
>> If you wanted, you could fit this all on one line.  word wrapping for a 3
>> char parameter seems a bit silly to me, but I suspect this is highly
>> subjective.
>>
> 
> Entire driver is still 80 column width, so I was trying to be preserve the same
> pattern.
> 
>> Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
>>
> 
> Thank you!
> 
> - Mani
> 

