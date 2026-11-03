Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793709039;
	b=1ot0yDoM/0yWuigXL8Kz+TxaOmOjmeH5JoAqGh4K1YYIEor/s1/4uYw0G/hWBO752R13
	 QYItwyltjkL2tAZs5UeyG+3VZx2PTdBNsulvlFj5Tqe+zhiZkKk94YRJnXAk/QSJksOLp
	 Gmm8kPd/Fa5yOSwMsMiecK9DdrGbCx/2jDIUeMKrJj0jD3xIGo+0O3fA+o621YV6YY0vO
	 zllMcKa5sWXeV+VhDsg5jsPoOQb6GgseOfN28Mj2I7s+u+D2sE6+o8JkoIT9lfDTs7kyz
	 BbTmO7sqzpLZi5mjd03XaJb7cIsE4IpqyZmpzsvZp0M+ZsjcF5JcPqaOvgu8gNspJXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793709039;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=F/Xz68RfmvzLiPeAQU9n7YqQPViKNbDZ9FFgzq8yCjw=;
	b=RvX8wKSyU3+Ppu2BL5WTzsTMaNPUCN3LoWAqpPH7yEujWtWLCMt3G0J4myOw3GEbWgD5
	 GsXCd5D45Rh3TmZsFLfS4Ixi+Yag3hJKNSclPe/MhVwsAOxep8CCMEnrw50R0J4JSL0ML
	 7QXUAgo64JANXvW7nOgQ9UK/8EbZCwXXo+20dTPy66V+Ohrq14GwAwfDkaLVodBC+9dEz
	 UBwrDu8AVAULdBAyfNzj4QXQjPtSvOH26kuSfaWOA47MLU+3d5fxp5zWqRPdVMJGJ8K7h
	 KStXAYeYf2eep25faNGLS/1041ARh8+7mew/LZPodcoHc+ycDis07KfFuUQTw5ZZ6Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WEkbwBhs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZFW5G7zu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30D8C6083611
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 12:30:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30D8C6083611
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WEkbwBhs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZFW5G7zu
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3CPi6f2817826
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 12:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F/Xz68RfmvzLiPeAQU9n7YqQPViKNbDZ9FFgzq8yCjw=; b=WEkbwBhsloDnVLuQ
	5IWEo4NLb9MLCbwnf3qTDdmi79CyWEDcUYA6DV7MzZ6Wa/HY4rn2hNV47vOEzEvk
	H6YqqCkEHKwTJTQlq+sjjfmU66bFpA6u3yXlW7+lUPoMTWLsjFMyJAnXvrJo7/mQ
	23y668ilx+tf6myY48WHv38TVcD8CkvZ7OOoSWXm4B+c2XXRBoVuVxmDTqnG56sO
	IZzmPGEP/7PqJKRKUur2Gh+eVN9hZonI8EbRHWpHIV9nOcX2T2n7InT35YktsLuU
	Eg8XDoB7kxDPUuK9nR00fteV2p93uwa7RcK4yn9aThb6avk7/leignpTd0YQMATW
	tZNxmw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq4v5jmmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 12:30:38 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7c15deb3794so824899137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 04:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793709037; x=1794313837; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F/Xz68RfmvzLiPeAQU9n7YqQPViKNbDZ9FFgzq8yCjw=;
        b=ZFW5G7zuBvDNgHN1MlX+D5dpggtMTts0w66XMr1WiFmtxA+qKvGOXoUJ4yQQk+1JVC
         Sh9bDn2EuWqYz/B8gR8qONY9N+1t4+uLB5Yao7czpwlMqMj6qY+dgyZA68hOmAXts/9u
         DzmQYxGROIeQtMCluUHpoIZgs4mIiXPuAJhQc9aCgldIqeIsQq4IA/0zQ1Ea4Stl6tJy
         zXFgqZubu/+Ygo9iUwEMy6kD/BaOGDwVkOd9KiEjhUDupH6IH40cx2d5h33EjG96h39w
         a0CH7Kx1vIkZpPzv1I7X5rjkPp18HiP1jB4GhlSHGwgXddgpfNO+ognw1M7l5HSJNd9O
         voLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793709037; x=1794313837;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F/Xz68RfmvzLiPeAQU9n7YqQPViKNbDZ9FFgzq8yCjw=;
        b=yB4fNprzs7vqyzpnwXfIiIufF9RInnJ0AXSd4d/mMYGkYg/BCKxSiIg596XBGOikD8
         np+Bpjpmls9bEoheQeHvlFxT/62iHJ1gPQc3ZG9qSafvRVlJo1a5uxMw1CNeEhQcSVdb
         lUQ0/oIPReYLj8aISzCAiyr+T3RegFmo1uzytkAMw3ViKTJmybTiHJ8k48yk85rQ6OJT
         7b/a/NQbNdVV9lYw3fGzkhcwDYJP0EsuPpU/Dad99vfIM9pOicXtgu3VB+jsRVdaeC5J
         YC4si3TanxretgZN/FfvmpecygyV15gEIFrUeqiAfpWsE3AiZpl83NYZF0Pm161Jduki
         YCOw==
X-Forwarded-Encrypted: i=1; AKwUvByzgW7oTzkQjmlm/KzhddHGiRLPevR+K1c5DAvd24Fd279/bhb0MvqbcNJk2uBMNo/RQ5OQvAZzNRnzYCXV@vger.kernel.org
X-Gm-Message-State: APuU4Z+meKOkHxJEg05VGkB8A1/9SwVrCnXifUPi6g9iP2UA/wxMffdW
	LqDlB49nxM+IovSR62YSNUgErN6pwci5IdNggvPJXPHMHo6EPF7OHXV5Au9g6jYcuTHjIBBZw+k
	6L/roT+OqhHbZ7eZgWSqugs/+RqVgUX+7W918vlehXSZWeJ1sQLx9NFAMQUEdAdoaZp43
X-Gm-Gg: AYBFou1NpYoIqQ6tVwAKz70FYp0rzQWSHQ1Hav4uvkdQpYVx+IduO5kdx9xzQMMQPY2
	X6wZPz9AFWWs4pf/oURZjCFwLoomYVs/ceHJWGDnz4Ijiv/W22UTOPL+ifn8TfApQxPlAsoRm28
	0MDfCHmnSz0XZCbqU6oilFkrQqlP+ywS7q8wNCnGGwK8h8xNs7WvzzTxySfeeZJeYL0bix8Kh9t
	WJlR3JOPT/eDqKCvPQ8gOBj1WyW7NNSLK/yzAJKIw+fvTMsbvVPrTtSszroDg/GbmYzR623zlq8
	kmZCQY+cbe9iLijKo+0V4yGl2Uf2oaxrg7W+hCQegIjeITQURRQ4pHkqdYOYdmnrNUfqTIRIMP+
	K0BvyNsidpKDFZQ9XhjvLH34GwRCGW8ecKnrhaXh5RkvbeKIFbTkz99V39i+J1QkFThPdUedwe7
	1gssJvokqANhaA
X-Received: by 2002:a05:6102:c13:b0:7cc:1a41:20e7 with SMTP id ada2fe7eead31-7d07255248cmr3929504137.7.1793709037236;
        Tue, 03 Nov 2026 04:30:37 -0800 (PST)
X-Received: by 2002:a05:6102:c13:b0:7cc:1a41:20e7 with SMTP id ada2fe7eead31-7d07255248cmr3929498137.7.1793709036671;
        Tue, 03 Nov 2026 04:30:36 -0800 (PST)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b723cdsm25490173f8f.12.2026.11.03.04.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 04:30:35 -0800 (PST)
Message-ID: <36008be9-2b25-4f04-995e-f90e2547f7f2@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 14:30:34 +0200
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
Subject: Re: [PATCH v2 2/9] media: qcom: camss: Introduce SOF sequence
 tracking
To: Bryan O'Donoghue <bod@kernel.org>, bryan.odonoghue@linaro.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261102-v4l2-frame-sync-v2-0-25cbed7a772f@kernel.org>
 <20261102-v4l2-frame-sync-v2-2-25cbed7a772f@kernel.org>
 <MPrRsE5vvB26tbMAT443IrH7Zr_tyIPaFwvQfnZj5TJUaM5uN8MyHB6kU6Y7rW92Sy35A5GfNcv95YOt-4YUNw==@protonmail.internalid>
 <8196a664-f73b-4da1-aea0-0ea49676a4eb@oss.qualcomm.com>
 <7f3e822e-3749-41c5-8390-e6d74b203927@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <7f3e822e-3749-41c5-8390-e6d74b203927@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: r_v3AITAIRqXeVPfO_ZV1AzXOVv0nT0v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0OSBTYWx0ZWRfX+Ze7auCcxVeE
 4wlhyZrnuAzgKits7mlt8TYa8HxRyYVdG/dV0XDSlvV5Vhgbr+iPgDzBlY/YU+aKVAbZG3TiWqQ
 vEorpGd0eYRU42xuut7ZO788LOef4MRrSDL8ONhvSXSeOHpEcCKqtBx0fTXeGPGTMvTGEH6/gbN
 iQpS29uWHEbFQiw7HUCSdvMSjWZb27G8fcErTjVxhsn1wPbNZBb2i4zjZeT/1wqiF+XwVGoE9rL
 mD3f9zrdMipExhJwQr2he/IuWcDa9R4P+AN6nh+4r/d+qMB7i6S8Jhf++P00krJ+cfna33N7iQ2
 4dku1Hv1MQ+Q6Trl0pio/9efffNPLBm15FT+odR+flh0Y2TO4QsuwXAvWCRzs3LpZJgRZyKwe0P
 T7sxdWElbpfkEbHoFYhizxIPZU+nmW0Lb2Up8IW/ydz+w82kmClOgXFfDZeFgf3+7McxP4gSV54
 iNdkyh2LJ29rWUuuJmA==
X-Proofpoint-GUID: r_v3AITAIRqXeVPfO_ZV1AzXOVv0nT0v
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0OSBTYWx0ZWRfXyeHnnVdadCxY
 7p4WBB+BUDzTZNMBmdTemRtDrTlmdlFxKOtIybnyjHyArxXqoSL//EL38QEVGYOJkVpa5XkasZ5
 +R0xe4Y24D1coe9pe+yzsZPfaNJFDSM=
X-Authority-Analysis: v=2.4 cv=NeZzRGD4 c=1 sm=1 tr=0 ts=6ae9d3ee cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=zZ9IWTiuT8Pi6IuDbjQA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030049

Hi Bryan,

On 11/3/2026 2:19 PM, Bryan O'Donoghue wrote:
> On 03/11/2026 07:11, Gjorgji Rosikopulos (Consultant) wrote:
>>> +
>>> +void csid_sof_event(struct csid_device *csid, unsigned int id)
>>> +{
>>> +	struct v4l2_event event = {
>>> +		.type = V4L2_EVENT_FRAME_SYNC,
>>> +		.id = id,
>>> +		.u.frame_sync.frame_sequence =
>>> +			atomic_inc_return(&csid->sof_seq[id]),
>>> +	};
>> On first look this was looking strange because the id is used for the
>> control id events not for frame sync. But on second thought it may make
>> sense, but the question is how the userspace should interpret those ids?
>> As of today userspace does not have any info for the VC and csid internal
>> pipelines (so called lines). So with the current state of the code
>> the id is VC which makes sense becouse the SOF/EOF packets are recieved
>> based on VC. So i am thinking of two options:
> 
> The id is not the VC its the CSID:id/port/line-number. VCs don't change 
> what this means; its the SOF event as seen by the CSI decoder - inside 
> of which there may be multiple VC:DT combos.
> 
> This is also the case for PIX which is just another CSID 
> port/id/line-number.
> 
>>
>> 1. Move SOF event in vfe (rdi/pix sub-devs) we have per line sub-device
>>     and will be well known to userspace for which line is reported.
>>
>> 2. Add and propose extension of videodev2 documentation that
>>     id of frame_sync event types represents SOF per virtual channel.
>>
>> Personally i votoe for (1) because it will well fit with stream-api
>> support and usespace will have clear understanding of the SOF to which
>> stream belongs.
> 
> You know from the media graph which CSID drives which VFE:output so it 
> is 100% possible to know which CSID:SOF relates to which VFE always. 
> CSID::SOF is a hardware description of what the CSID decoder sees. I 
> don't support mis-reporting it as a VFE event TBH.

Yes i know that, but does the userpsace developer knows based on the API and
documentation provided? Or he needs to ask the linux media?

We have some kind of id which is mapped to line and that is known just
by the driver, if you can point other drivers using id for frame sync
events will be helpfull. 


> 
> More than that though, there is in-fact a VFE specific SOF/EOF and EPOCH 
> event but these require the CSID feeding a frame into the VFE pipeline 
> and the VFE moving through its own state-machine to process that frame.
> 
> So they are separate signals and separate logical events representing 
> different things with different timings in hardware, meaning different 
> things to userspace.

Well that make sense i agree that it make sense to be part of the csid
but it should be documented somewhere, maybe proper thing to do is update
the comment in videodev2.h and update the documentation for camss driver.

> 
> CSID:SOF is the thing you want to trigger off of if you are for example 
> trying to align an IMU timestamp, not VFE SOF.
> 
> Feel free to propose VFE:SOF/EOF if it makes sense for VCs - I don't 
> think I have a clear picture of what you want to do there - interested 
> though.

I am not proposing that, but from the current state of the code each line is mapped
to different VC (before multistream patches). So this means as of today, id can
be mapped to VC. Anyway my point is to either document or open discussion for
"id" field in v4l2_event structure when event type is V4L2_EVENT_FRAME_SYNC. If
not document for me it looks like some kind of a workaround just for our own driver.

~Gjorgji

> 
> ---
> bod

