Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28428C8D9
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 03:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790135703; cv=none; b=tKpJyM+ghpI7/Pm6yFdSWBqcM3WRIo5x1pTZsrpJMUCfVYmktv05GD3wF9yFoGVeFcJhqRrdTJ1tFff1NTCoyrGpWrSPsC/wszbEAgVxL9D5xtxPP93cSiZ5iSmbUSnER4oQf3hd2tIV5KjQmFs4JmlkuXmNpZRjjfgpC5vb1UY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790135703; c=relaxed/simple;
	bh=I2y+Q3y/JP4FAuevPIkg/yzyIU7sQ8gYea8Sp5bayYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kNC0upcbmVzUZeQf9LpUvT5t9e6VBRGRJRf3eUQQmBtIHtdU4lGFkxa32FOD68Ms5kIT1TblOOSqLM3GQdh+fQdcr953nNFMsTEKxzTcNAI8I10KvEyNDg7Q5h+NkGLRCpMVHpidmoh/XD6YMcz6UgWkOrX/whBnjwzGBU8XSHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OVz0iY5+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PHIxKA8q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OVz0iY5+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PHIxKA8q"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68N3iWIH3096087
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 03:55:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HsyStiKpapbMHJVSA8FehAfpdi4M9Dgl9/9WbFEg8zI=; b=OVz0iY5+Vc4TW2mH
	PbtRPb555/pCRTK/PD3f7jj+fPezS0CQ8nbr2mSrIypVtwDC18pp/gD13db5KVFu
	ZIJ3NiNA9v53iZzZD7nHVpnQHNAG9z9l20dbkqe6Fof5PsSbsmKkkIfVFOTw+lZD
	gn6d0Ro6TWVN8Lpg1NyxYVM4iz6a6spVy6sAzQjDPmzhcl4yEyj52dqwOMNGKKJm
	n0kV87ZFlJMBFMj0OogzHcjEDBgH4g/gTUhvcR2mt2CP8KrWJqA4MhMbz4DSpbP4
	dD4zuBxysx42Qn3lgeQa+1hQU4hmXTeBg0/KflcJ+mw+L8VXXVxDyeJm1SXH4EkW
	p9HkuA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gv428rpcu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 03:55:01 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30f1b904861so621297eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 20:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790135700; x=1790740500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HsyStiKpapbMHJVSA8FehAfpdi4M9Dgl9/9WbFEg8zI=;
        b=PHIxKA8qUF/OA5lLf42Yr1DtY7na/kXx4gpogH3H7gngF+qAfBfsQ5QADmhAh/mpCE
         vSOWLHz4wvuqnE7NV3iTU2RAvNE3jmw9btTii5QyvtAPmh4/Hnv9s/OPJgXTONEg3pfk
         8PqM/Y64esAJm3SyrkOcgd4DKW1C7s3TmSMsPh9RclDCuzyF4Gfr3v+MFJ38dJGbsvnq
         X/3m8War7wLJp7PBps3v0PJS+DpXapuFQAz6GeKqJ4Vl0A1TCiY095t8F4MMtCA3F0Sx
         iHPoZ4RAusL4EId4U/DfQxq40PfVtwUVqzbFVwQYw9UmE3rEvjjfTBLMpwHLKSeW0BS7
         2xGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790135700; x=1790740500;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HsyStiKpapbMHJVSA8FehAfpdi4M9Dgl9/9WbFEg8zI=;
        b=cdaVaWqNODA8J6sTpJ3nATSVkZjMXi1NFwDh/ouXmFepxJuP2ZEy2KD2eCwShXqqZY
         zFYqrr3cClKdEgRakwEr3NUBvZ1LLg2vrv4PXFQURU0oPaNksmKxQHEfhujxg26RrlUt
         tRwYh3SdjeSSDluhJ0Cu0HTI+Oq7iOLu/bf21pQmoAjB+gnCQjWmQcNPod7a2Fq7dTwB
         OymghxfxSluD+pE7U8RRjb51b8WUo4V9Jl20wPQfRAbTm5jye5Yw91Q6fcz0VnKq+lOC
         8xm9NliL3ajngoeEpSG/lSeq1MFOU5BMgiVjRcuktsCq0OiFYJQws72g+/3hCiUhv1TQ
         Xdfw==
X-Forwarded-Encrypted: i=1; AKwUvBx+2n9Lx5Pi/jkby8Il2eShLgX2vpVNxhDW0sEF0mJjmvBVJnK0xVEBPIuM7ArgraXDZXNJk78ZN8dx7/Ut@vger.kernel.org
X-Gm-Message-State: AFuF++lOblgdLRgN4CuRAGBNLcXrxZTn4RmK1jy+bPO9CpxB4Xu9i3bk
	OzaGrp8VYgi7tVcHMb9iqUR1mm6SPwYw459wzRCm56tz1eTal1Deby1RNp0pA8SMc43Vo6n9z66
	BkIDnUjzlNeuXcUxUAQCP6CP2eoZst5iuJ2WXSnhfi0qb25O9ka9EHXx/EiPOkp6Xc+Sf
X-Gm-Gg: AYBFou1lWgrinkdDDSZwNVNA6JHPQq4I3D6PGZfmnvHH8CRhDfgArscb5w/Wo+UO9zu
	HRVE/q6G6CTGsS/jhWRnVVrRQBVEAaW1bK/24YHFkF+r1/dtiuaN+p0Wc1ZzS30feLJ01bBRHLn
	MRnPTnzziZINh0I4SHU0smTklT0HE0jQXq3v9IlcoK9RmRIziwWsb7Vz2tUtICynnw6z2adgEPh
	BTsRa9huShbUm4QPw976pZaKnarRxuJoojiL6bSqb8BanSB68t1q6twp8dPM9fn9x/IbviXbKH9
	sAmp612eO3TO/5kaszGtiz8w9Y780yp/GIMvanBQ/tcDC9Wqbirj6OcjjkHtBksnh4IsLchDM83
	cq2wEcGHEK9qztAhLr1v0hcYBLQOkYVST
X-Received: by 2002:a05:7301:700d:b0:33b:fc00:976a with SMTP id 5a478bee46e88-33e8ddc27e8mr1454095eec.35.1790135700310;
        Tue, 22 Sep 2026 20:55:00 -0700 (PDT)
X-Received: by 2002:a05:7301:700d:b0:33b:fc00:976a with SMTP id 5a478bee46e88-33e8ddc27e8mr1454061eec.35.1790135699641;
        Tue, 22 Sep 2026 20:54:59 -0700 (PDT)
Received: from [10.218.42.145] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e95c7bf6bsm2357770eec.8.2026.09.22.20.54.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2026 20:54:59 -0700 (PDT)
Message-ID: <2b0d3e13-96fa-437a-9de9-4a61911fe232@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 09:24:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Add autosuspend_delay
 customized support
To: Slark Xiao <slark_xiao@163.com>
Cc: mani@kernel.org, jeff.hugo@oss.qualcomm.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260919095506.9570-1-slark_xiao@163.com>
 <bf94f351-777d-4dc0-98a2-7af77f832f2b@oss.qualcomm.com>
 <1bec2fd7.99f3.1a0c8ea4db6.Coremail.slark_xiao@163.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <1bec2fd7.99f3.1a0c8ea4db6.Coremail.slark_xiao@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EZdd0/mC c=1 sm=1 tr=0 ts=6ab34d95 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Byx-y9mGAAAA:8 a=Pom97L_i2cqLMbMsZTUA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: GukNlsLiU7nECR7bBAxDRV8zBj445KiX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxNSBTYWx0ZWRfX3iR0d2KQwZ14
 p2Fg4JZF4Nrpf4bn+Di0nXZGVr5v2+kb187PD4XeE80wNtnQKzG1fIu9rX+y8XVDSBZJS2sJwWJ
 1/kyBWp1Muq0eoK4RVfHfICOl7KQwnMMTlmkLvaA3x21crlbF3S1APzW3nx65QXoIwLdn0yaJXI
 i6EV4j9yQIHKc0ST/k8mfDUS0wDZqa9UCIaoh9SwO/GRyw2XpPeVqo+kLn3ebTnXx0NH2ShJR0y
 uCemsA7++Z8rP+XFIdd9WEbtF22R1miwvPLi4gcLi7cWV+vFYSbypTCzdZYCWCLHw9eoUpiNKkO
 hLo8thKAYA50Dzcp6Vcfs7QSYixf2OuxfeQobd4oPRUoJERmqQ7Xy/r8r2Zoka8QAdi3gORkF+5
 vPPj/+NhRKYJo5ATL06Sw3sBfuKjDrMhJ7WEgG1KMlof+xfPBoEH3p0sfkupUnqAIuJyLfMRrcP
 xCmgwc8h82+VZCnIJBw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxNSBTYWx0ZWRfX5R+YO1YqpWbA
 4ZwSPddHyqjwvkzK1pGQHfYiW2Ii5JhRdPqiYUy4STAR7nLtfdFl3YnI8USSozJ+7IQiRxmg2Yb
 mVte+sVfb4Ca4uPHFyOfXw2p/RpDLU8=
X-Proofpoint-GUID: GukNlsLiU7nECR7bBAxDRV8zBj445KiX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609230015



On 9/22/2026 5:09 PM, Slark Xiao wrote:
> At 2026-09-22 12:12:35, "Krishna Chaitanya Chundru" <krishna.chundru@oss.qualcomm.com> wrote:
>>
>> On 9/19/2026 3:25 PM, Slark Xiao wrote:
>>> For some WWAN device, it may get a SYS ERROR issue when resuming
>>> from suspend state frequently. Refer to the Qualcomm Windows
>>> driver, the default value of autosuspend_delay_ms is set as 5000
>>> ms. But in Linux side, all WWAN device were set as 2000ms. We
>>> tried to set this value to 5000ms and we can get a positive test
>>> result.
>>>
>>> So we add a support to allow vendor to set a difference value for
>>> specific WWAN device.
>> you can change auto suspend delay from sysfs, please use that way instead of
>> doing in the driver.
>>
>> - Krishna Chaitanya.
> Yes, we can do this by setting the sysfs API . However, not all users 
> are aware of this method. Additionally, this approach is only
> effective for a single instance; it requires reconfiguration after each
> restart, which is quite inconvenient.
you can have udev rule to set this without any user intervention.
> Though I want to set the default value from 2000 to 5000, refer to
> the Qualcomm Windows driver, I don't want this change to affect
> the default configuration of other vendors. 
>
> This attribute should belong to specific WWAN devices, such as
> SDX65, SDX72 or QDU100, rather than to the same category of
> devices, like all MHI devices sharing a single setting.
>
> BTW, I saw some one add 'no_m3' flag for their SDX7X device.
> Why can they disable suspend on the same SDX7X device, while
> I can't adjust the suspend delay time? That's curious.
no_m3 flag is for qdu100 target, where the target itself will not support M3.
It is not just disabling suspend but also make sure device never enters m3 even
in system suspend case. 

There is already support from sysfs to change the time, doing again that in
the driver is just duplication of work.

- Krishna Chaitanya.
>
> Thanks
>>> BTW, based on the principle of structure alignment, I moved the
>>> location of 'trigger_edl'.
>>>
>>> Signed-off-by: Slark Xiao <slark_xiao@163.com>
>>> ---
>>>  drivers/bus/mhi/host/pci_generic.c | 14 +++++++++++---
>>>  1 file changed, 11 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
>>> index b636e2c23b4d..3339b9b2d16d 100644
>>> --- a/drivers/bus/mhi/host/pci_generic.c
>>> +++ b/drivers/bus/mhi/host/pci_generic.c
>>> @@ -23,6 +23,8 @@
>>>  
>>>  #define HEALTH_CHECK_PERIOD (HZ * 2)
>>>  
>>> +#define AUTOSUSPEND_DELAY_MS 2000
>>> +
>>>  /* PCI VID definitions */
>>>  #define PCI_VENDOR_ID_THALES	0x1269
>>>  #define PCI_VENDOR_ID_QUECTEL	0x1eac
>>> @@ -38,11 +40,12 @@
>>>   * @name: name of the PCI module
>>>   * @fw: firmware path (if any)
>>>   * @edl: emergency download mode firmware path (if any)
>>> - * @edl_trigger: capable of triggering EDL mode in the device (if supported)
>>>   * @bar_num: PCI base address register to use for MHI MMIO register space
>>>   * @dma_data_width: DMA transfer word size (32 or 64 bits)
>>>   * @vf_dma_data_width: DMA transfer word size for VF's (optional)
>>>   * @mru_default: default MRU size for MBIM network packets
>>> + * @autosuspend_delay: customized autosuspend_delay_ms value for specific mhi device
>>> + * @edl_trigger: capable of triggering EDL mode in the device (if supported)
>>>   * @sideband_wake: Devices using dedicated sideband GPIO for wakeup instead
>>>   *		   of inband wake support (such as sdx24)
>>>   * @no_m3: M3 not supported
>>> @@ -54,11 +57,12 @@ struct mhi_pci_dev_info {
>>>  	const char *name;
>>>  	const char *fw;
>>>  	const char *edl;
>>> -	bool edl_trigger;
>>>  	unsigned int bar_num;
>>>  	unsigned int dma_data_width;
>>>  	unsigned int vf_dma_data_width;
>>>  	unsigned int mru_default;
>>> +	unsigned int autosuspend_delay;
>>> +	bool edl_trigger;
>>>  	bool sideband_wake;
>>>  	bool no_m3;
>>>  	bool reset_on_remove;
>>> @@ -1369,6 +1373,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>>>  	struct mhi_pci_device *mhi_pdev;
>>>  	struct mhi_controller *mhi_cntrl;
>>>  	unsigned int dma_data_width;
>>> +	unsigned int autosuspend_delay;
>>>  	int err;
>>>  
>>>  	dev_info(&pdev->dev, "MHI PCI device found: %s\n", info->name);
>>> @@ -1394,6 +1399,9 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>>>  	dma_data_width = (pdev->is_virtfn && info->vf_dma_data_width) ?
>>>  			  info->vf_dma_data_width : info->dma_data_width;
>>>  
>>> +	autosuspend_delay = info->autosuspend_delay ? info->autosuspend_delay :
>>> +			  AUTOSUSPEND_DELAY_MS;
>>> +
>>>  	mhi_cntrl->cntrl_dev = &pdev->dev;
>>>  	mhi_cntrl->iova_start = 0;
>>>  	mhi_cntrl->iova_stop = (dma_addr_t)DMA_BIT_MASK(dma_data_width);
>>> @@ -1463,7 +1471,7 @@ static int mhi_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>>>  
>>>  	/* Allow runtime suspend only if both PME from D3Hot and M3 are supported */
>>>  	if (pci_pme_capable(pdev, PCI_D3hot) && !(info->no_m3)) {
>>> -		pm_runtime_set_autosuspend_delay(&pdev->dev, 2000);
>>> +		pm_runtime_set_autosuspend_delay(&pdev->dev, autosuspend_delay);
>>>  		pm_runtime_use_autosuspend(&pdev->dev);
>>>  		pm_runtime_mark_last_busy(&pdev->dev);
>>>  		pm_runtime_put_noidle(&pdev->dev);

