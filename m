Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792721606;
	b=gbXqdPytYaX0TPi460M/LvyzlWPyBeQuN5o4xNtgH16zAZHHLg/QTX/afvyO3p+rD8bX
	 Ha2vrtcwx5gtpCExz2OL7pVgVdmT3VZebxfLUuyqAIgsn9lf3Z62f5cd2wKN1BnExzR+U
	 4D2uGGyFJ7RoqR5WQbjnOZ0XF270vTB89Ow2uXAkvCbozgC0X9pdGwjazY7aq/IkfupY2
	 uF+U7q3EgagLWua35mLVr+CbMjrQiHoP5Pk66aFIBnhcf7tOL5hm/cxKU9eT7jv2CIy+X
	 Ln9RV3MiuyWH4Z8vpmw9GAYxRstsRK0wx+XZoRlqNBvvALGYNx8RBOrQddJ0x72qZqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792721606;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=V81n2l4pcVkf8FlHHSPONhxcDe/fAH8DllOZsnp9LQE=;
	b=eDmtmr30L0RolDgJwxx3PdnwVpqBrV9Cm/QccOwYBzWP8SU3iUCtbjUsB9PMZCjE4aLZ
	 xnhokcidvp0PMyqu8Z5KoUtpmDIkZq8g2fftn+YkIK1SRWq/a6BEoUMn36v4DUOh3aUJP
	 PNKpmVXdTUUynKK8kUdW/oqIKcZnEYo8sb+DJYIZPliayMtAeV2r557mVanJptZKRSm95
	 1lkzb6u8ZyCxEHs38mirnKf91EPoEMILM52T9+ADxW281I/+ETqkK6wviXcxrucT8DN+z
	 t7mztl3E29JPxXhtMF5u6dF+99QhDL10emqgF9Jc5f38/joUngmXJr3CT8yjAEUteKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TSPTnav9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R+ExXInX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1B9606A33C
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 02:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE1B9606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TSPTnav9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=R+ExXInX
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1FKDC990152
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 02:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V81n2l4pcVkf8FlHHSPONhxcDe/fAH8DllOZsnp9LQE=; b=TSPTnav9ABt5KOrf
	MhgzmTWAuIKOiBbmrD8KYGQMPa1VMRoNH3lDvCj2fj4ahX6HzNCqybglxI29ZzA2
	ohGoglDnYYQXJAs1RN8dC3R1LHpCpv9SG+Ne0dU88gQF+X+aBzkQ1+v/eDWdOmoL
	/rfSBWQv3OQrUqq+UMzp8bvmgloYYqsr50+fy9tecjri5VVJuDa0uPJ82gbTOnQC
	j4Cj19ZydWLuhg2pLC0BqkQXCe7+nwodQz8ircYUxEtnHf/Iin5x2+lDw/qG0uXe
	acKXa17PM1XdOU43/RXefT1Tq1pas8kG4fchOZOLWMhy1J86Cm1hE0XfhLZ/k1C6
	Mz2wmg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfpahsusa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 02:13:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e9501034c4so6736865ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 19:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792721603; x=1793326403; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V81n2l4pcVkf8FlHHSPONhxcDe/fAH8DllOZsnp9LQE=;
        b=R+ExXInXM0QrFTRUCMb3yBsjmCFruqG/kNSWzkkYvw1UefrJ9ftg5dRRnlX0D04pGy
         +5I4Ay7lht14ZL5SXUUBJ7xDJb3Fp+NIbrWHOF+YyRnAX7PwyTEfpCNI/HQuGTuDwt66
         Q+yxRgV9RhmJfTF3oBg7TpDdwx/PPs6dStJ+qIz9Pz+CBB2GEm7r7wwDMTOu7Du6LI6H
         VA/AlZ/McPZdVvHjdkjZlsOVSvfYfJCCHnyxtYSmtFFQCxb3dpmHOBVo7pI8ytisYkvN
         Cr7sVpafsA37Kf3ujEO6wAcqm4ykSTo977FFnfc9bXgVvEpbPAtV+iWt7GoYYB2/gUob
         +eaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792721603; x=1793326403;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V81n2l4pcVkf8FlHHSPONhxcDe/fAH8DllOZsnp9LQE=;
        b=JxS1SnYR3VSBkxyG/IwNxDglsbFVXIclhw0SLwsbCPuSdl2JEtwiy8A7by3atNC6Ca
         w9+Gj9S+v7m1Ul9TQ6AyL1zPBl6rXaCFSjkLNPxGUCrIUBwetLXJbT7NwD7mUkp/4plj
         iqhWiujED4tHdLsp1CK/LCtpOZ8x35vt1aoI3Y44CT7WZIrCJ7nm/BjiFzH8ac22jui/
         0SCDrsoto6GCgzt1GjJ0R7slYlRuxhHvsAVvz4EwD4ip37l6FwYLB7quqrEWx3eT7dqv
         lIrmETj4btVglaMozsSmYw6mD4YFcBvQPavJyJ163dztO8U+iw3AE/1wDXQfoRVu7agZ
         pd5Q==
X-Forwarded-Encrypted: i=1; AKwUvBzJsvmroehczrtFMfGIYc/PkXixj8qvIbA1pwMMe7Mb8QQZ+4vyIPfSO/Zn0GIXCjYRLoM6w5E/J4c39h77@vger.kernel.org
X-Gm-Message-State: AFq9FYIptXGKvmY9ACRIVTM1Z0M2nHeoejNxSFXxaHfK2dUtiuH3drx6
	ybQylmUxX1S4iHAy9ZlfO6Ry06hxMj4r0FDPtP1cN3lRSdew+/YweoQT5pjSlZhn6aibOfd1A64
	Rworegx0hohr84X34JSgrgsehDs7pSue8wlbk4Up/FnVb0t58TFA+p8+2kWRsNtx09kAX
X-Gm-Gg: AYBFou3fHVc/mkzA5yUA4RWohEy9vyrptd7OBcBU/meq6rSsHHk/FAubju8wTLjwyvx
	1QNglAktD2nL85e6J12zrTJ2XBrTH2N9HMIJmx82wNUPjisezBYZWwyVmSKM6Ienu0wwPkfalC8
	Pmx90UdIgU70Ts4jczqrP1Wpv3XhqTAVVXc5KxD9hwI2dXUPif/wwZHgGZs0LHeM++xG+0b7xEP
	k11hDUmXd85eaTlpr3Wam62AGgmVZa0Lp4JMzQLfKsfNZeqvdNB6dzLTabRtVh6HCNigT5hz/EW
	wNVOYYune+2NXWu6lxi1MLYmvr3dG49bOdEEQAu4sgiHG1ckdH6HIyPs6QDbCRJC22Z4tnD+ycU
	GbA7DsAStoR/mu20YFNR4gAPGGhNZsMlJrmD9AMfF3wEg8ZS2ZtA3RVDkrLnNIlfLc8eh9h3cMA
	==
X-Received: by 2002:a17:903:2307:b0:2e9:8b2f:3572 with SMTP id d9443c01a7336-2ea7d0e3d95mr9255275ad.26.1792721603507;
        Thu, 22 Oct 2026 19:13:23 -0700 (PDT)
X-Received: by 2002:a17:903:2307:b0:2e9:8b2f:3572 with SMTP id d9443c01a7336-2ea7d0e3d95mr9255095ad.26.1792721603006;
        Thu, 22 Oct 2026 19:13:23 -0700 (PDT)
Received: from [10.133.33.125] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7af6b862sm4215985ad.1.2026.10.22.19.13.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 19:13:22 -0700 (PDT)
Message-ID: <cbfa35c9-cfa5-4eb5-a203-09c9069e3b0b@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 10:13:18 +0800
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
Subject: Re: [PATCH ath-next] wifi: ath12k: change MAC buffer ring size to
 4096
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Yingying Tang <yingying.tang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com
References: <20260610031358.2043716-1-yingying.tang@oss.qualcomm.com>
 <atcr70WFLxp8zreK@QCOM-aGQu4IUr3Y>
 <0423c93c-8359-4fd5-9ba0-17e5ed3927dc@oss.qualcomm.com>
 <atnVeGiu9Q07HyUq@QCOM-aGQu4IUr3Y> <atoTUgEIfkg6b29U@QCOM-aGQu4IUr3Y>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <atoTUgEIfkg6b29U@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAwOCBTYWx0ZWRfX7atObi+xfLFl
 48uEVWmze2VtBylLRJEW8D+VQAeFzSquf1jKH6JipxHp5y9vutDOh/MtAdIx9FoeBR0z1wzkUbY
 JyKs9Paz/3chURKmcA8qISGJhA9saR0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAwOCBTYWx0ZWRfXwRS6YCICA8ps
 /XfXnzYd3GrZ7WeCylSdWxhN1QcGIYfBGgF3NI7CdfRPRitaqBA2Oedgz4HWn5hXoacHpfntsOV
 VHwHrCRY4RVJriYxNKkwMwXUnKmkREIC4GS4etLxy+2eJnM0v/kVaqiXLGcqjCs8ehCJP3i9TdJ
 j8Q8CwXi7Cqy0n6cEwBD6D6sO3fjayphUrnegEIYISFkLXcmm0W/8+mBNeGmASmUfmgR2In71RT
 aFnf/g9hv2p6jACHjGze7ExLp+Njq5Ksr7UdVslgIXfipFASpTKxMuzWfd88QoWcvhM1/rWUuny
 /3FFZ7eY4vHgLVPNfJ9X8JwbryjVSvhc6VbbM7SLjxtiFW47NhZ4XLEFGXRGWSflvsO/SeHFKSF
 +P1o2eN1TdR9AawtUCwXgyB1HV4YDWJ7CpPcIbx8CYzrYEDaHqSn9ggc3rOw9Rr7sXGg7+OfGYK
 VHKzOtpoXsry1YkqGVw==
X-Proofpoint-GUID: N-xmQdvkpdW26bk5mUzPteQVUZL6doDT
X-Authority-Analysis: v=2.4 cv=YIMKWhGx c=1 sm=1 tr=0 ts=6adac2c4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=GNa4QO3Fkq167Ut2XdkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: N-xmQdvkpdW26bk5mUzPteQVUZL6doDT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230008



On 10/22/2026 9:44 PM, Shawn Guo wrote:
> On Thu, Oct 22, 2026 at 05:20:56PM +0800, Shawn Guo wrote:
>> On Thu, Oct 22, 2026 at 10:30:45AM +0800, Baochen Qiang wrote:
>>>
>>>
>>> On 10/20/2026 4:53 PM, Shawn Guo wrote:
>>>> + linux-arm-msm
>>>>
>>>> On Tue, Jun 09, 2026 at 08:13:58PM -0700, Yingying Tang wrote:
>>>>> For WCN7850, MAC buffer ring size is updated to 2048 in
>>>>> 955df16f2a4c3 ("wifi: ath12k: change MAC buffer ring size to 2048")
>>>>> to increase peak throughput.
>>>>>
>>>>> But during the RX process, a phenomenon can still be observed where
>>>>> the throughput drops by about 30% from its peak value and then recovers,
>>>>> and this behavior repeats during RX.
>>>>>
>>>>> After increasing MAC buffer ring size to 4096, the data rate drop has
>>>>> gone.
>>>>>
>>>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
>>>>>
>>>>> Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>
>>>>
>>>> FYI, in case someone else runs into this: with this change (merged in
>>>> v7.3), WiFi on my Lenovo Yoga Slim 7x (X1E80100, WCN7850 hw2.0) stopped
>>>> working with the older firmware that Debian trixie still ships
>>>> (firmware-atheros 20250410-2):
>>>>
>>>>   WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>>>
>>>> Probe and firmware download succeed, but every WMI command times out
>>>> once the interface is brought up:
>>>>
>>>>   ath12k_wifi7_pci 0004:01:00.0: wmi command 16387 timeout
>>>>   ath12k_wifi7_pci 0004:01:00.0: failed to send WMI_PDEV_SET_PARAM cmd
>>>>   ath12k_wifi7_pci 0004:01:00.0: failed to enable PMF QOS: -11
>>>>   ath12k_wifi7_pci 0004:01:00.0: fail to start mac operations in pdev idx 0 ret -11
>>>>
>>>> Bisecting ath12k between v7.2 and v7.3 lands on this commit, and
>>>> reverting it on v7.3 brings WiFi back with the old firmware.
>>>>
>>>> Unmodified v7.3 works fine after updating to the current linux-firmware
>>>> image:
>>>>
>>>>   WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
>>>>
>>>> On Debian trixie that one is available from trixie-backports
>>>> (firmware-atheros 20260916-1~bpo13+1).
>>>>
>>>> So nothing needs fixing on the driver side. I'm just leaving this here
>>>> so that anyone who sees "wmi command ... timeout" on WCN7850 after a
>>>> kernel upgrade knows to update the firmware first.
>>>
>>> Hi Shawn, thanks for reporting this. I just had a quick test
>>> WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 with the latest ath tree
>>> (ath-202610191908), everything looks good, simple connection and ping pass, I don't see
>>> any ath12k warning.
>>>
>>> The firmware images I am using comes from the first commit adding WCN7850 firmware:
>>>
>>> 	fb04a7f4b750 ("ath12k: add new driver and firmware for WCN7850")
>>>
>>> and the md5 values are:
>>>
>>> linux-firmware/ath12k/WCN7850/hw2.0$ md5sum ./*
>>> d3750b67b1013fe82358d0538fb131b0  ./amss.bin
>>> c79c410d585360000c0490f16fda43e2  ./board-2.bin
>>> 73056f1d2aff886ce9bff313f455e963  ./m3.bin
>>> d0ee61498bf1a205147cdbcf645391e7  ./Notice.txt
>>>
>>> can you share the md5 values of your images?
>>
>> Hi Baochen,
>>
>> Here are md5 values of the old firmware shipped by trixie firmware-atheros
>> 20250410-2.
>>
>> $ md5sum /lib/firmware/ath12k/WCN7850/hw2.0/*
>> d3750b67b1013fe82358d0538fb131b0  /lib/firmware/ath12k/WCN7850/hw2.0/amss.bin
>> 5dacdfbe6c3c25d9e0605be8a9f1f6e4  /lib/firmware/ath12k/WCN7850/hw2.0/board-2.bin
>> 73056f1d2aff886ce9bff313f455e963  /lib/firmware/ath12k/WCN7850/hw2.0/m3.bin
>>
>>> and have you ever tried the upstream mainline
>>> kernel or the latest ath.git tree?
>>
>> I'm not sure what you mean by upstream mainline kernel, but v7.3 should
>> be the mainline kernel released a few days ago.
>>
>> On the other hand, I just tested ath.git tree at tag ath-202610191908,
>> and it worked with the old firmware. So it seems there are some gaps
>> between v7.3 and ath kernel.
> 
> I bisected drivers/net/wireless/ath/ath12k between v7.3 (broken) and
> the ath tag (working). It lands on:
> 
>   15f7603b69a8 ("wifi: ath12k: Increase RXDMA buffer ring size for default memory profile")
> 
> The previous commit, 643f0bf93617, still has 4096 entries and is broken.
> 15f7603b69a8 changes one line, .rxdma_buf_ring_size from 4096 to 8192,
> and works.

thanks for sharing this. I can repro it using the 481 firmware once get 15f7603b69a8 reverted.

so the rule here seems that rxdma_buf_ring_size must be at least twice as large as
DP_RX_MAC_BUF_RING_SIZE (I also tries four times large, it works). This rule looks
reasonable to me, since WCN7850 get twos HW MACs and its firmware setups rx_mac_buf ring
for each, and each ring fills itself using the buffers all from the single RXDMA buffer ring.

maybe I should submit a patch mandate this rule.

> 
> Shawn

