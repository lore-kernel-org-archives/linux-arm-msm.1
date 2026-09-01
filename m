Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3A547DD7F
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 10:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788259743; cv=none; b=p8I/f7LyyP6fGXFOmzs4MySjJGdTUTGVHa0iUar8z+hNWQRP3EiCo0G6Sr2vOJ57wSzg3XxA5wNBLyscv3XNyGAM02WR8Qrc8ao1vBVDKjmbJI9o4MXJsmSAgm2W8BOOA0nTmXTe/HvLak4X+F7DiUSScsFnuXgsPmoteaK53Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788259743; c=relaxed/simple;
	bh=SLGSseQaf0vJp+4kOQXKmxaBEuZ8Z93Jn47quXknsh4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=alTZbvvPj4yRD6GolIdHUOi4tGQPlz1DGhP7kNfdCt20NaK7CEMVM1AxLCAzYI7qYkzqup+JHI3ia0pgUlkHemoCPvmEJW2BQQIqHbHr4ZHVnCe63CiSVvYeCsJbiuBsz1HuIhl2LVNW42htcQ3kjayeHt/LqPWfAIPOem3xl7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T0tDVZcd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JHqd8Xu1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T0tDVZcd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JHqd8Xu1"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681AJeWU2494586
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 10:49:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kWfgeNOyFGDYlfIW9v/3p67LM/pgSzbvLJN7re/Y3h0=; b=T0tDVZcdsuc35KoL
	Gl6yMhEOiZ77racbSuMPOeyFCek1TfOwHIawgO58AD9OmvRvrARY9NNGUnCcHrMn
	Hk58PTGkYRaetFb9JtWN9d5dCPDB+51x3xDF20d07maqT2CRv5oPFo1qP/6huy4V
	SBL/fT9yi09owKqSlStcb1zk8wojBlOpQAT4bz7n7S88JLlFeZJqvbsF4C5fdWow
	PL7iWTXsp26kkr4zeqPTC/6WPQZnP5b3rF4g8SeCBgIHcqgBYdgfgubpbUI9J2PH
	7GJKwOwuD6uMGiZXuqdhzTbzR+TBcyy5usm+NBIinlvT1wx4GpXrpn6eksXn6r4N
	8YE1qg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdqbh1nec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 10:49:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-385d2703b64so1027112a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 03:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788259740; x=1788864540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kWfgeNOyFGDYlfIW9v/3p67LM/pgSzbvLJN7re/Y3h0=;
        b=JHqd8Xu1eFy4I9KxMyhxUOWZwopjIFpSLk0fpbuog3iFClF6jaRTVyA0+n55g2QIiD
         oghhg2+wlKgOIjIot9NvfG28jLIp5MTvvvYFRiyKGVs39P/grOXDCceJCMl8kv2mg4dq
         nWdxFx9Bc+pSF5fplltbJ8cKuFY+31t4j7N8lXEdjYRAj8zFYCngebN8x4koUPKSFq5E
         T0GsxZ7PTGB1zVmL8xjNZb3RbHS8UBU0FB5TPZLX528fLIfrJvRnKMU4uMbCKGVlW2c3
         lcakffYwI4s2Ij0qHtKNboaOP/qB305fKKMkvKnhVqSL75zwIFlmGMwjlz4FiOSyJ4se
         cJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788259740; x=1788864540;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kWfgeNOyFGDYlfIW9v/3p67LM/pgSzbvLJN7re/Y3h0=;
        b=Gt8/imVJNMqEUvTcM5Wen48FwGBdhfR7NacffR0Z7Lz8tsp0O3AuhS31Xvl4ZTISqS
         HV3gipjiBVPr0nw3KuANvyLqaiTS8eFDjDnD4IU0GvzqF8ej/CYIl7ingxZtBdHyh637
         P3/h0sWvAi9CeGL65Smy+LnP9uUMcKXq9mflM+qs0AP1SPvbvRsK7K7mnHOPucJHcY7Y
         wC4kldg2UU/drvhPZkx/Z9LH7kP0zZXL+GUS0GiexVJaeInXEO0Ro9RLQe/2Jtjqtrci
         9bb8l1hiySftkpSnlDYKm6LWUIIK93TWaLH8H+RCI3xB3siovTPDNvPfkr6LAQbMibBn
         yaLA==
X-Forwarded-Encrypted: i=1; AKwUvBzrJbBDqjqvEDU22cq/Hoyihcg8FRpWT7L12zGquwSDFV7VO+nY87fg4Fntv8IKlngKMnXAOqLP44HqXvg7@vger.kernel.org
X-Gm-Message-State: AFuF++nmCG88cYDcoEmFdTCRujfgNTeorlANghe592gCTxtFfMlhxnFn
	qCIMid2IRuosD1Xc8u+ITFf+8vK4l/WnGSXHQ5fd6irktF6uU8W2dy+78GX5hekxV0PyHb/ljxy
	fJztnJQmwc/KUaVj1gcFFzAhet0ScMlbE8dFJVIE7Q0+vPFf7W/c7v+dOf3tPkDcSGyn+
X-Gm-Gg: AYBFou02MTNI4EivM1YkIL36KpKZKaMyBmf/JBtWtCD8NHFPrsoABeulrWvMJA1svXh
	4D6pr9hfQDU8/Gknd1V/bLpbvD0wc+tph53V881kwTMApAaTmMgqcYAGfM1ob8Omz4W+YYdek2k
	FpGsB4RrbZnHdeNVGrNpR5q8L4RXOsPwwhHmJiFN+IbWQ3RB3OJII8BUMrEQ8jItSb6eojKiYTG
	fMZarxBquxHwt6WqgFcVinGQQOR7jjsOO7m4BoxfYW0QM0iRr2104qquklgew88wsyfNDAsQI/m
	eTGA33cagAh1dPAJ6ZcJ08+66mVTVHwv9aoLk4fCLUX9NbToTaAUEQPCcsWcjE4AufeuW1D0M4+
	xro/14eGBstqZ77JBuHbxnx9UG27KfmGnFqdmxKoHuJfpenqqmtNfjsqP
X-Received: by 2002:a17:90b:5586:b0:398:c8f3:d076 with SMTP id 98e67ed59e1d1-3990f93210fmr4803927a91.31.1788259735057;
        Tue, 01 Sep 2026 03:48:55 -0700 (PDT)
X-Received: by 2002:a17:90b:5586:b0:398:c8f3:d076 with SMTP id 98e67ed59e1d1-3990f93210fmr4803842a91.31.1788259734429;
        Tue, 01 Sep 2026 03:48:54 -0700 (PDT)
Received: from [10.110.34.210] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32b5bef7683sm23429688eec.12.2026.09.01.03.48.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 03:48:54 -0700 (PDT)
Message-ID: <4d2d0d17-391c-4c81-8748-bf1025ea6f75@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 18:48:46 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 09/11] soc: qcom: add ICE keyslot partitioning driver
 for guest VMs
To: Krzysztof Kozlowski <krzk@kernel.org>, ebiggers@kernel.org,
        axboe@kernel.dk, mst@redhat.com, jasowangio@gmail.com,
        James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-block@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-scsi@vger.kernel.org, virtualization@lists.linux.dev,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: neeraj.soni@oss.qualcomm.com, gaurav.kashyap@oss.qualcomm.com,
        mani@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        bvanassche@acm.org, alim.akhtar@samsung.com, avri.altman@sandisk.com,
        stefanha@redhat.com, pbonzini@redhat.com, eperezma@redhat.com,
        xuanzhuo@linux.alibaba.com, linux-kernel@vger.kernel.org
References: <20260827160806.1295313-1-linlin.zhang@oss.qualcomm.com>
 <20260827160806.1295313-10-linlin.zhang@oss.qualcomm.com>
 <e23142e8-41b3-40f5-9d63-53c9c38fba38@kernel.org>
Content-Language: en-US
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
In-Reply-To: <e23142e8-41b3-40f5-9d63-53c9c38fba38@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA5NSBTYWx0ZWRfX1NzaF+PeJQu4
 1u8cBjTgYUCB9nyN7M8nUgE0v5W6KWtP75ndruFCQGxvgDMa92aVzXK/GM+xtk5yJ3iK6kV5Ie0
 n4FWJIexoeSgL1aj1RfVNyajfDG9bi8=
X-Authority-Analysis: v=2.4 cv=R9wz39RX c=1 sm=1 tr=0 ts=6a96ad9c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=P-IC7800AAAA:8 a=EUspDBNiAAAA:8 a=puuXhSqztIu-OQ_ZuWYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-GUID: Eq_LEIyS0aco73jveHHCGdsE8us0ivFy
X-Proofpoint-ORIG-GUID: Eq_LEIyS0aco73jveHHCGdsE8us0ivFy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA5NSBTYWx0ZWRfX1KeRMrsL2ptw
 hDDNYdnxGc8C1ZIfb3Vk9iUKi9znozIqiEwB6WYEFJ8RbirE6LbvPvw9GCS7Jwz0JWq0hvrlaWl
 GZPR+hAzLrX2Rqe31kDTnqhSN+gDRDDUmpUXkf+0Wbh87IMJa/+YHusTNE8QokAf3qirnBtgL6c
 UEY3l9fZavV+c8Rm4RQrx43nYCgvoOf2F/Am6nNkpjve+RgkbnTlh8zuyhkAj/O0/oDJy0dZ6aH
 LoHCgH79eaXZrWA10sz0mOGAV1AUaUXv5U+MHV0SOtJpWiwF8K+ClQhwJOchToRK0R2/KWVjgHP
 jkOkSsyiLutSHiS/9KRKWTVIO1kAmZ2W1E4eIzTXKfSZ0jQRDrvCJ4J9/Mvo6buqJYZtvr43486
 XX2PeAJVJAcPUFB4kaYmB6q1sdEPHCyoP1JXW6PW6OFcohmcj2KJ3G2c1MUES448eXogXgRoY76
 nioqP12cGP4OY8HPfRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_03,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609010095



On 8/31/2026 3:02 PM, Krzysztof Kozlowski wrote:
> On 27/08/2026 18:07, Linlin Zhang wrote:
>> From: linlzhan <linlin.zhang@oss.qualcomm.com>
>>
>> On Qualcomm platforms the ICE hardware has a fixed number of physical
>> keyslots shared across the host and all guest VMs.  A userspace
>> virtio-blk backend handling VIRTIO_BLK_T_CRYPTO_IN/OUT requests needs
>> to translate a guest's virtual keyslot index to the corresponding
>> physical ICE keyslot without letting one VM access another VM's slots.
>>
>> Add QCOM_ICE_SLOTS, a platform driver that implements bcp_slot_virt_ops
>> for the /dev/blk-crypto-proxy device.  It parses a
>> qcom,ice-keyslot-map device-tree node describing the per-VM keyslot
>> allocation table, where each child entry maps a guest_id to a
>> contiguous physical slot range [slot_offset .. slot_offset +
>> max_ice_slots).  Entry 0 is reserved for the host; guest entries start
>> at index 1 and are excluded from the guest-facing translation so that
>> blk-crypto-proxy cannot accidentally route a guest request into the
>> host's physical keyslots.
>>
>> The driver exposes two callbacks:
>>
>>   get_guest_slots()  — return the number of ICE keyslots allocated to
>>                        a given guest_id; used by BCP_GET_CRYPTO_CAPS to
>>                        populate the max_slots field in the virtio config
>>                        space.
>>   vslot_to_pslot()   — translate a (guest_id, virtual-slot) pair to the
>>                        corresponding physical ICE keyslot index; used by
>>                        BCP_SUBMIT_IO_BY_VSLOT before calling
>>                        bio_crypt_set_ctx_by_slot().
>>
>> The singleton pointer to the parsed table is RCU-protected; the hot
>> path reads it lock-free.  Probe validates that no two VM entries share
>> a guest_id or overlapping physical slot ranges.
>>
>> Note: This patch is submitted for visibility. The keyslot partitioning
>> is based on the current DT-based keyslot allocation with vm_id known.
>> We are aware this may be revised to use a TZ SCM query interface in a
>> future version of this series, submit it RFC for design discussion.
>>
>> Signed-off-by: linlzhan <linlin.zhang@oss.qualcomm.com>
>> ---
>>  drivers/soc/qcom/Kconfig          |  18 +++
>>  drivers/soc/qcom/Makefile         |   1 +
>>  drivers/soc/qcom/qcom_ice_slots.c | 232 ++++++++++++++++++++++++++++++
>>  3 files changed, 251 insertions(+)
>>  create mode 100644 drivers/soc/qcom/qcom_ice_slots.c
>>
>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>> index 6c632d114d45..e1f383b4dc63 100644
>> --- a/drivers/soc/qcom/Kconfig
>> +++ b/drivers/soc/qcom/Kconfig
>> @@ -294,6 +294,24 @@ endif
>>  # Options selected by other drivers from different subsystems must be outside
>>  # of the menuconfig if-block:
>>  
>> +config QCOM_ICE_SLOTS
>> +	tristate "Qualcomm ICE keyslot partitioning for VM guests"
>> +	depends on ARCH_QCOM || COMPILE_TEST
>> +	depends on BLK_CRYPTO_PROXY
>> +	depends on BLK_INLINE_ENCRYPTION
>> +	help
>> +	  Parses the qcom,ice-keyslot-map device-tree node and provides
>> +	  per-VM ICE keyslot accounting and virtual-to-physical slot
>> +	  translation for guest VMs sharing ICE hardware on Qualcomm
>> +	  platforms.
>> +
>> +	  When enabled, guest virtual keyslot indices are mapped to the
>> +	  physical ICE keyslot range allocated to each VM, preventing one
>> +	  VM from accessing another VM's keyslots.
>> +
>> +	  Say M here when multiple VMs share ICE keyslots on a Qualcomm
>> +	  platform.  If unsure, say N.
>> +
>>  config QCOM_INLINE_CRYPTO_ENGINE
>>  	tristate
>>  	select QCOM_SCM
>> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
>> index 6d4b7546d1fb..952a57554f9d 100644
>> --- a/drivers/soc/qcom/Makefile
>> +++ b/drivers/soc/qcom/Makefile
>> @@ -38,6 +38,7 @@ obj-$(CONFIG_QCOM_LLCC) += llcc-qcom.o
>>  obj-$(CONFIG_QCOM_KRYO_L2_ACCESSORS) +=	kryo-l2-accessors.o
>>  obj-$(CONFIG_QCOM_ICC_BWMON)	+= icc-bwmon.o
>>  qcom_ice-objs			+= ice.o
>> +obj-$(CONFIG_QCOM_ICE_SLOTS)	+= qcom_ice_slots.o
>>  obj-$(CONFIG_QCOM_INLINE_CRYPTO_ENGINE)	+= qcom_ice.o
>>  obj-$(CONFIG_QCOM_CRYPTO_VIRT)	+= crypto_virt.o
>>  obj-$(CONFIG_QCOM_PBS) +=	qcom-pbs.o
>> diff --git a/drivers/soc/qcom/qcom_ice_slots.c b/drivers/soc/qcom/qcom_ice_slots.c
>> new file mode 100644
>> index 000000000000..364ac93077c1
>> --- /dev/null
>> +++ b/drivers/soc/qcom/qcom_ice_slots.c
>> @@ -0,0 +1,232 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * qcom_ice_slots.c - Qualcomm ICE keyslot partitioning for guest VMs
>> + *
>> + * Implements bcp_slot_virt_ops: translates a (guest_id, virtual-slot) pair to
>> + * a physical ICE keyslot index using a per-VM allocation table parsed from
>> + * the device-tree node with compatible = "qcom,ice-keyslot-map".
>> + *
>> + * Device-tree layout:
>> + *
>> + *   ice_keyslot_map: ice-keyslot-map {
>> + *       compatible = "qcom,ice-keyslot-map";
> 
> NAK, there is no such stuff.
> 
> Drivers for undocumented downstream DTS are not allowed.
> 

ACK

This is used to set slot mapping table in DT node. It will be moved
to Trust Zone if current out-of-band key operation is approved. Otherwise,
if virtio block devices implement blk_crypto_ops, this driver is unnecessary.

> ...
> 
>> +
>> +	dev_info(dev, "registered: %u VMs, %u total ICE slots\n",
>> +		 idx, total_slots);
> 
> This does not look like useful printk message. Drivers should be silent
> on success:
> https://elixir.bootlin.com/linux/v6.15-rc7/source/Documentation/process/coding-style.rst#L913
> https://elixir.bootlin.com/linux/v6.15-rc7/source/Documentation/process/debugging/driver_development_debugging_guide.rst#L79

ACK

> 
> 
> Best regards,
> Krzysztof

