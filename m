Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792666838;
	b=oNMZeyAkONtBTxHj8NipjHCrFpVY8Yt/Df1X3Nx8ioUwOnGX/NoFtKDc8+aWiH8bTPb5
	 iS1CWHVzeLy8YPkxH4jTZxKWQIQR+vtp4L4zR5GNnkkuB4kQ3rBl3XQA9PxIFhtf2p4X+
	 8KYk4Dh6/6qiqyPz43hvhIfwD2OR+hUsHuVMi2H1CdVEosJrUMjfzSs9Vmo3HxxUQNILu
	 R/rX3b0uqrak38MbI+7kXHBEEIBFZmsx5TdNwrtkzyCSD+gS3LxM4/Weyox+55b5wr8Et
	 hRTAWYJhV8ooCSiV5T0PmCteEuV5rAvfwVYM5w7OyIaGA99WRXSPjq8vJ/30VYL9Zuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792666838;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tNgk1Zalkc1M0w3EsqbvSKsYob9Or3oPjo0QS5Err9g=;
	b=21J8uxHK4NMq7Pgx9kfyMrpvMFl6066d+2wVlnBYb7/I5BE4JQD7VEhxNYDW59q+35EY
	 M1jyyZDf3ybGTtXGpKaZ20GsHcHJCoxdk2PeEOxNaMG2hXH8v5DCtAknzMR93kNp3PKOZ
	 7TGR3xkFxyNbeNp+cAEQiGWsWNqKaLMjDw2xgQeD70DGkIjTGQVBE5y8tFyKg8xpdAHaC
	 d0Jsr2MvrYP/JzEtZOgYMvbjVVei/hYGCQW82Disz+kWPrWahfElfDeTaEkDWd6H6CbN2
	 2F0BfHhhLNH6ACQvLkLWsS+X+wDQeBccNGLsAEPknFFJb03ott1a386s1m4vR5fay9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UaDET+z2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h1rRefdW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E7C606A323
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 11:00:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47E7C606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UaDET+z2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h1rRefdW
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0AeP2918714
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 11:00:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tNgk1Zalkc1M0w3EsqbvSKsYob9Or3oPjo0QS5Err9g=; b=UaDET+z2B6Wm/Tl/
	c2YSwGwenIEBpibmySjrKLSrKR4hv/K8MyWg696uyqs+tclMvvoEJ6zGKHGQxcBI
	+d8QC6ZatvL4V38ziy0G+22dZ4oYnXJed+JH34854VVjGp7GTT1aqWYGO3ziHZSe
	tEHr3iGexgVH2roHaVz2bucKKKunKbbmOCAPaODOMRKtCacqlt1qs1CSxtvbqTiq
	HdzmqC4XZRT9P+qeQ4gH+5km1QYYjduTP3rztXZktG1kUeHOYH+3rgZ0U3IRr9jF
	qyx3RIWZv/JGCrW05HG83zhDS6iFfXQlXJwzcQjeifK4+htayLlxme/4sTphU2k/
	WFgzCg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93aacv9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 11:00:37 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3ad436a9d00so1739783a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 04:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792666836; x=1793271636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tNgk1Zalkc1M0w3EsqbvSKsYob9Or3oPjo0QS5Err9g=;
        b=h1rRefdW5TgqDkXmd2gxGnJqap18u7SZ2LE9s8LLWVkzG2Jogs2pJEh0Kf/EXex66u
         5dKPQ67oxcuAIEyfAjwKihoju32z2w0+XrM0s15hsuzIKbjDAz2FuCwHpRrxRqmwajEA
         +QXNOqIRDDQb6yUBum+NYKrxkdhS/azWvTgPtwjN2eQBFscMu3K8XYXIfKHTzD76W7BG
         u1tBKuT3XnGRT03MzqQwmh+7fLNOC4NGBrosbFax4M3gCkrrDDt0p/rrPBZkILmBMq7M
         G9agAyUG9qhDF8lJ208Xw+KfuEhDEPLRP0sYz6QaZ0MSEPTMdX9F0HWLQ81RPVKrRRgK
         zXGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792666836; x=1793271636;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tNgk1Zalkc1M0w3EsqbvSKsYob9Or3oPjo0QS5Err9g=;
        b=qoob4MUyM9hXsx/dpfpmuNf7yoEbxSnKpenTdWfOtEmK2vPkx+BzKWN46qdSFYb8fh
         K9ipM0FxMGrSELQik1Sjobb6gI8RARK5gSPOu7/l8NAvBhjbo+Y0vDYtoXfJ7ks4jIEN
         MKplnBa4wCYtJA7qQR20KkjHCZ+2mQ54prfQpud/Q9FmENIsHYgj/BFpsw7x+UQTrfDT
         /gs8pHo5wRXGWwfp0YuknjyXY6w1QD8IYlR6PNqoLiTITzFUTAI5DI83gIKvTFMhnDvb
         KYYhiTnpVA4fn8QaYd0psd3n8/+r7RyR85sDK0BAKAZHgd0/6r3AIAj8Zi2Cf9ed3UvN
         BjXQ==
X-Forwarded-Encrypted: i=1; AKwUvBydC9/Y5IbCGpZly86KNjkfOuLCRO/TQ9YCpbkR2AX39g5TCUu30cgmugqUacP7n7h7e+mLVTyBc67OuPGa@vger.kernel.org
X-Gm-Message-State: AFq9FYLjoAR2pPPPcjAbaK3HoKw1xhOj1VjrVGGAE7Qc5P81x2qAmgI4
	ASbukXHJwW3mdIIkihUvBtZxG7ry5qJXb76DoBz8zdA+yyLwky+wBZMT4I81j1bfAGBLWO/yvZH
	ZUv6/1AGyy0SN+I78gEPJkbQKPXqyFAvT9iPQBfNNLmO5KOwkresUe622YKKR7H931/bd
X-Gm-Gg: AYBFou3tnzLgwNrkKlN352QPH/eEYrtSarsWXkqVLBzZdGj8oPuD87JG9dtnuj+cg0/
	nlg391J7ktgTWltenu8aQ1MAPVFfDQ4b179DmOiuVG8srv64SmJ8xpkomXUDBY7NFBAbYKdJE1A
	hIerKtoPWBWMO02yhXXkDrvf1Kna1Og0LoxeG11pMn/5Bx+Pwyh+MAUOKyYx5kMc1LhZaHZYvay
	tus8bzz2qyOV7VrkJazz0z4bZtb+grbqp1bmLUvPx+t2HFYcJiByltJ0pBIANPapAKRMQTTY1Iu
	d4XpN9ewyz+TGjmNc7aM+CiEPahYrD3vqUA7pvUWuaMRpxm89+9kJ6HpGRZS9I4oOShQN5siElD
	T9VWvh0lZ2K5QeciiCJ/wWYgKjEtIPLddE1XOz1kZ1uQe+sxwaXj1+vJOpiKLPdMUSWPaFfAR
X-Received: by 2002:a17:90b:2c90:b0:3ac:8741:e2e8 with SMTP id 98e67ed59e1d1-3ad86dcacf8mr4085342a91.8.1792666836387;
        Thu, 22 Oct 2026 04:00:36 -0700 (PDT)
X-Received: by 2002:a17:90b:2c90:b0:3ac:8741:e2e8 with SMTP id 98e67ed59e1d1-3ad86dcacf8mr4085282a91.8.1792666835602;
        Thu, 22 Oct 2026 04:00:35 -0700 (PDT)
Received: from [10.133.33.125] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada4890bb2sm3793372a91.1.2026.10.22.04.00.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 04:00:35 -0700 (PDT)
Message-ID: <0d5d36ae-3d65-4dec-98cd-7409ba4180c2@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 19:00:31 +0800
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
 <atnVeGiu9Q07HyUq@QCOM-aGQu4IUr3Y>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <atnVeGiu9Q07HyUq@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=JudkP84C c=1 sm=1 tr=0 ts=6ad9ecd5 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Z4Rwk6OoAAAA:8 a=NbhQ5tqkUGBw_Ouk81MA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=HkZW87K1Qel5hWWM3VKY:22
X-Proofpoint-ORIG-GUID: WvvUJyY2G6ZuKu81PMlazRCY63KyQ19h
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0MyBTYWx0ZWRfX/HVkhT/pY/Zr
 7j0G/Uh3TubGHOah2+6BBBjv4wQJ1INHt2xqgXtzHKf9UT+IAZsRCUClpAJL8pLvCq8tXAaxcAB
 MmXmvMMZFE3EZ88wxzIgGyxx93otLLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0MyBTYWx0ZWRfXz7+vfZ+H0SNa
 OmK+pTmURNlOQjHfzVUcbFdKFKL14mUSNfLd1oLSNpv9FdL7F+gIG/5X9fyayAsQt1LfHilCrGV
 fB0itcivT//V3zTqwsS9ZhZ0V42qE+ozCygOmXyVRh9mijQj1UaQubJkuOl9pg2ZzK8ZMHjKphi
 7Jps653/ggkToDRGfOfoaLnlq05HzVvpia9CXzd0FNRcp097AQ7hlAHYKgfi7BKQ0KcvEBcInj5
 jzYHlz3K/T7SVsBP0qPuGBkZchU9ziAZTpQ0fn0MkeHzeKQ0ftMdfQnDrH+3JHRX+tHRcwtKLfh
 zK654YO/q4rE9heQa6Tik1s4WimP0MBexlwTv9/qFzSc2RbCik/QNmfwF8Pel5SM7NU51DZAGmI
 Uc2vnZQnY5bmgyoKSFXcYUalpE4sw3aVBhXq69p8xKXgqXfwc8fQ0OKM9hDcy9/cxrUZXy8Hx6C
 /DuWVeuFmBBnDi6K09Q==
X-Proofpoint-GUID: WvvUJyY2G6ZuKu81PMlazRCY63KyQ19h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220043



On 10/22/2026 5:20 PM, Shawn Guo wrote:
> On Thu, Oct 22, 2026 at 10:30:45AM +0800, Baochen Qiang wrote:
>>
>>
>> On 10/20/2026 4:53 PM, Shawn Guo wrote:
>>> + linux-arm-msm
>>>
>>> On Tue, Jun 09, 2026 at 08:13:58PM -0700, Yingying Tang wrote:
>>>> For WCN7850, MAC buffer ring size is updated to 2048 in
>>>> 955df16f2a4c3 ("wifi: ath12k: change MAC buffer ring size to 2048")
>>>> to increase peak throughput.
>>>>
>>>> But during the RX process, a phenomenon can still be observed where
>>>> the throughput drops by about 30% from its peak value and then recovers,
>>>> and this behavior repeats during RX.
>>>>
>>>> After increasing MAC buffer ring size to 4096, the data rate drop has
>>>> gone.
>>>>
>>>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
>>>>
>>>> Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>
>>>
>>> FYI, in case someone else runs into this: with this change (merged in
>>> v7.3), WiFi on my Lenovo Yoga Slim 7x (X1E80100, WCN7850 hw2.0) stopped
>>> working with the older firmware that Debian trixie still ships
>>> (firmware-atheros 20250410-2):
>>>
>>>   WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>>>
>>> Probe and firmware download succeed, but every WMI command times out
>>> once the interface is brought up:
>>>
>>>   ath12k_wifi7_pci 0004:01:00.0: wmi command 16387 timeout
>>>   ath12k_wifi7_pci 0004:01:00.0: failed to send WMI_PDEV_SET_PARAM cmd
>>>   ath12k_wifi7_pci 0004:01:00.0: failed to enable PMF QOS: -11
>>>   ath12k_wifi7_pci 0004:01:00.0: fail to start mac operations in pdev idx 0 ret -11
>>>
>>> Bisecting ath12k between v7.2 and v7.3 lands on this commit, and
>>> reverting it on v7.3 brings WiFi back with the old firmware.
>>>
>>> Unmodified v7.3 works fine after updating to the current linux-firmware
>>> image:
>>>
>>>   WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
>>>
>>> On Debian trixie that one is available from trixie-backports
>>> (firmware-atheros 20260916-1~bpo13+1).
>>>
>>> So nothing needs fixing on the driver side. I'm just leaving this here
>>> so that anyone who sees "wmi command ... timeout" on WCN7850 after a
>>> kernel upgrade knows to update the firmware first.
>>
>> Hi Shawn, thanks for reporting this. I just had a quick test
>> WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 with the latest ath tree
>> (ath-202610191908), everything looks good, simple connection and ping pass, I don't see
>> any ath12k warning.
>>
>> The firmware images I am using comes from the first commit adding WCN7850 firmware:
>>
>> 	fb04a7f4b750 ("ath12k: add new driver and firmware for WCN7850")
>>
>> and the md5 values are:
>>
>> linux-firmware/ath12k/WCN7850/hw2.0$ md5sum ./*
>> d3750b67b1013fe82358d0538fb131b0  ./amss.bin
>> c79c410d585360000c0490f16fda43e2  ./board-2.bin
>> 73056f1d2aff886ce9bff313f455e963  ./m3.bin
>> d0ee61498bf1a205147cdbcf645391e7  ./Notice.txt
>>
>> can you share the md5 values of your images?
> 
> Hi Baochen,
> 
> Here are md5 values of the old firmware shipped by trixie firmware-atheros
> 20250410-2.
> 
> $ md5sum /lib/firmware/ath12k/WCN7850/hw2.0/*
> d3750b67b1013fe82358d0538fb131b0  /lib/firmware/ath12k/WCN7850/hw2.0/amss.bin
> 5dacdfbe6c3c25d9e0605be8a9f1f6e4  /lib/firmware/ath12k/WCN7850/hw2.0/board-2.bin

this is different from mine, can you try mine?

> 73056f1d2aff886ce9bff313f455e963  /lib/firmware/ath12k/WCN7850/hw2.0/m3.bin
> 
>> and have you ever tried the upstream mainline
>> kernel or the latest ath.git tree?
> 
> I'm not sure what you mean by upstream mainline kernel, but v7.3 should

I mean Linus's tree

> be the mainline kernel released a few days ago.
> 
> On the other hand, I just tested ath.git tree at tag ath-202610191908,
> and it worked with the old firmware. So it seems there are some gaps
> between v7.3 and ath kernel.

can you share the exact tag of v7.3 kernel? is it just below tag?

commit c03c1a14507dfaf8b856c2608f9ac216021fc222 (tag: v7.3)
Author: Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun Oct 18 13:14:58 2026 -1000

    Linux 7.3

diff --git a/Makefile b/Makefile
index 0dc1a9f4e63e..c61ea07ee505 100644
--- a/Makefile
+++ b/Makefile
@@ -2,7 +2,7 @@
 VERSION = 7
 PATCHLEVEL = 3
 SUBLEVEL = 0
-EXTRAVERSION = -rc7
+EXTRAVERSION =
 NAME = Baby Opossum Posse

 # *DOCUMENTATION*


> 
> Shawn

