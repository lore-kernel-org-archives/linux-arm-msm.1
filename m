Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793711593;
	b=kQEPkPhc4mrw4ksr9oEYUKDIpRCtHDmf8eJTuzUcAUalCqJmOzplJm5ZrISeqXdA3syp
	 Myap9Rbc7tkc5nexLW/sf/7t8jXdtYTLqrfVfRo/NhHV9yirntQfRU89c4qIgAsJEZaTg
	 r37YpNILgbasqGlP/yhNTX/YSl0eu7mBIlDfWxRySBBocpQnqj7C+0e+kp3+eeNxHrCpa
	 7jfn7pfUL3tL4mKsDEGqFTMgp0CLttqivDZRWHXv64rSCKNiKa38GcQrtpyqXEA8TcBIk
	 p8ccL1DoiefZBuPwfwBGSgCuQjWjEXOt7CwpMLUZDg61Mx0Py2j1TLT8xG9CA4aHSvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793711593;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hyiAUjHvt1+X14T3/fDOxmZz5s9mlmOYVmjPV+rb6qk=;
	b=nPFt80OFlaUUDLEjept2rJm4YDLUNTj6j790u4WkR1EWpiOeemcrKCXCEuKfe/FWP+hI
	 a/0AaC6b/X8nNCwuh/OCmZh8cjVbh3qzMsVjuPemNAy75eHphTKOzgTzo16VZfLFlskcj
	 GURJ8YNtLwh29wjd/w2JZQdntTT7JAr9Ar/JXYywN4D7477F3O6zC6yPcV8UD5tNTTOjB
	 b72+L2yEA17KVtDyqvxwwsdOYoZdFxlOXOfzebry2mzF2zNXNxsTU3P7puA7x/WmI4WmE
	 vE4YiPpe16VNQYkjW6JENyQisSmnCLfJC0Ck57J1ICLrsKLpns2ckGnftFNXKt9ih7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YnCsvjoK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VdKJeQdX;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D30606A32D
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 13:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58D30606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YnCsvjoK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VdKJeQdX
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3ClI3Q2897152
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 13:13:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hyiAUjHvt1+X14T3/fDOxmZz5s9mlmOYVmjPV+rb6qk=; b=YnCsvjoKOg41w2fy
	NCc1D3VtRcD7lTaZmWWlydx7PxtmO5zPxPFaQaBnfKZZHDCyjmUlApeSfrwTT37f
	mqLXYYjTQvHaw5IDogbFKmc/xp6eVvJNmZqwkVreAxbv5VLeRO9Sh41s2DMyBfJE
	gJVxiXtx/ec5uxAiFH8D0mQMF4KVWvvWVitATB/8N/rjlo3SNWyQX/pHZRWua3A2
	4wUsyvY8KYgJls1pjaEFl32RB2XbACdETG/aEyQOO7Y4l+4QkXutE8VZ6iu1ac9K
	GHskR6yICmAMB+yP5yRQXz0RDH4rQCq7bTGSlxmNSI2ibwggUozxeawzVvO8zBQ1
	uHFLpQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq0873ucr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 13:13:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2373e9b4so420789585a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 05:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793711591; x=1794316391; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hyiAUjHvt1+X14T3/fDOxmZz5s9mlmOYVmjPV+rb6qk=;
        b=VdKJeQdXNObU3F2AsbVCISDpmh5jLl0qx6VaKiX3XnGU1NLqvaOenSWtY3/uueNd5N
         TZ60HIuZZ2AGPANlg5LrAizWenap1Jpgc4Mimqr9z1JuUcBLJlSsqFSSTRp6ojP4l9W0
         ZSEtd58jbPDbeA8aaNIfHWQ8xiTzk1pW7mMWG1BIPprYIANGgCvheQxJH1LW8V1rmewu
         3a2vvcPH62XvjH056HExXEImEVGm8/iE+OZOL5BjgxW/RRac343hRVbgk3IzbaOuwpf8
         qxPeXZNApCbXNGtEvGTb7Oo7kVSTatsGZZRRGyZPR2T+oLERd1cxVEHmfo+TetDjLf3E
         wVIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793711591; x=1794316391;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hyiAUjHvt1+X14T3/fDOxmZz5s9mlmOYVmjPV+rb6qk=;
        b=B2a9wX3mbriezMrRCPO8Ei5eQJjXEr7y0DQwr02kIeUU+9JXhwyaN7Xcz3UgR5A3rc
         j/vOwa1kuJ+I9zIyjKA+cveB2bX97Tf3+peFmmgNsxD+H3V30IYSh25hFuMAksXdNNvy
         DBZXQYGHezRr/nhPxy/j34JS2TbiKMu7swRZ3ECIL2sGNp/cnjfJmx/JmMlAZUkXI3nR
         LOsl+D8UbhjxhvQrgQpEg5j6K7WEQKfzK0ihUHYj8w41b7fw/fe3dIxFU6me+BVenIAA
         /xhTq8XXzqFljvMfiYT1gGOn7107kgwPgV+M4ltLjaAuSGMtvPq/a7nNbI/V8yyULPmn
         cR2Q==
X-Forwarded-Encrypted: i=1; AKwUvBznbEup0oO1RCYvQQJuaUXR3Ws451IEkaz/1Pl2+NSa6Vz8BMu308IwzbKpWn2ospkg3+dRq/akR/D1fg4O@vger.kernel.org
X-Gm-Message-State: APuU4Z+kQpJwyyvFXngxEEWpybihjBHg/DIag87lBxwFtEpxrNaqYcAp
	q/8hs7lfeyRP2fnEc+3ArQ6k6alSHdEh1Q7nMHGEbwEMZqr296R0qZoPFPFqKEITYHUd/tTnfBq
	JoYZLc8JXHT7F1y8KwdBMvhoV2MNEDPzesBVNMLMt8JBurV4z5ktzXDLX9e1jnLxjRMLY
X-Gm-Gg: AYBFou2S3VWNEVNjCNwxrRdIYdIpBClUZqWxhmYYyJKQTGs3OcFx0+mjWW62pAFQCvI
	APbBzZ0Ba0o1lW5Uai+d91liTXvqTeaToQx4jLxPZZnvgczjQNWGLtyD/TFdNtsZzXYigkF09S8
	4FWsm5c2wDNSWvBsXkbxkLMWPTqvmLdQ78NRfF8CYTjg93lu7IxoOvLc2Y7monOAUzyo1YUnFA0
	o7cvrN4PXF5R6kG6/NC8iV42Q1HO8vUUUdKIT6i0tsV9u/xP0JJzKUsuF/fRJt/OT68i8GzCIze
	BjKB5+dYRauHaAY7vYqcQoHJzSho6IYN8QqM5OUKheyN1+WoXm9mHdgrx9QW0Gj7tIjKA2ZUmhP
	m7a7e+hOBBq30ni4wW9EdMCejlJf4glrqyoqmeObsnozc0j/RAFFtHrYbIsYAbKZOCo8CKifssw
	Rtf+t+9vCVVS4c
X-Received: by 2002:a05:620a:6293:b0:93e:d5c1:da58 with SMTP id af79cd13be357-944217ce7d5mr2047384985a.79.1793711591406;
        Tue, 03 Nov 2026 05:13:11 -0800 (PST)
X-Received: by 2002:a05:620a:6293:b0:93e:d5c1:da58 with SMTP id af79cd13be357-944217ce7d5mr2047380085a.79.1793711590852;
        Tue, 03 Nov 2026 05:13:10 -0800 (PST)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a922c298sm50322075e9.9.2026.11.03.05.13.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:13:09 -0800 (PST)
Message-ID: <d3a7c0c2-f5dc-47da-8466-d0b77aae9b9b@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 15:13:08 +0200
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
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
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
 <36008be9-2b25-4f04-995e-f90e2547f7f2@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <36008be9-2b25-4f04-995e-f90e2547f7f2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfX3f9Hfw2Yg884
 HeNc1eq2tfm0i1BmBz+6ReUaggo+M+k6OgVwVaMvI0nFX1eoqQ6NSp3l18MqtTHMC6lxZ51o8QJ
 Z0IHqpwR7SEyhJYs6HPd/kc9Jc8vKdg=
X-Authority-Analysis: v=2.4 cv=K9m3jCWI c=1 sm=1 tr=0 ts=6ae9dde8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=Fj6EcmcQT-bn4kmwQ3wA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MiBTYWx0ZWRfXxfge69Am6tt7
 TByCFRWDqNMCHiTf3mEwljJXzEZ+iMGZN5XFUIUhQ9kZhL8i7yCF92MAH6o6g5wT3WoY/Py2k4t
 AnKSCHTJYC//Q0YdTB69zQsCi1fsRPI4KJAJBsVG7921cMy76tUIU7IkzpGYE3l8uhIlQzmlRNx
 CRYZwKw9/Y9iRA2Uk+r/b7LRzHHb56jCGefdRUVqrTWF/82MiHSchHsWq6HC2zJI2D08cgGqcSH
 6vAGSPa/7kOVVar195AELf3vn1APbI22kLcljHJTL/B4DGHW2Ak4tLYXaxyJV9glcphptlFtniS
 qgpxKd/rNrUwKftw0N/ms1e3tM/jcLqbClb/yMoFR5+ClZz6ZMSqKt6lAdHofkZ86ThaqlQ0f+c
 T/pkUhECUDE0xc+WXM0Zf1PEtWwgVcZniYSBWCXMMQDbQY2vYFrHGBLY2oJmeuRgleyZQC/BbTW
 9ZuNicyJAVIgzNM9SJA==
X-Proofpoint-ORIG-GUID: KiLxPGYQ9vymFhFFAmZqTH7rvMzaawKq
X-Proofpoint-GUID: KiLxPGYQ9vymFhFFAmZqTH7rvMzaawKq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030052



On 11/3/2026 2:30 PM, Gjorgji Rosikopulos (Consultant) wrote:
> Hi Bryan,
> 
> On 11/3/2026 2:19 PM, Bryan O'Donoghue wrote:
>> On 03/11/2026 07:11, Gjorgji Rosikopulos (Consultant) wrote:
>>>> +
>>>> +void csid_sof_event(struct csid_device *csid, unsigned int id)
>>>> +{
>>>> +	struct v4l2_event event = {
>>>> +		.type = V4L2_EVENT_FRAME_SYNC,
>>>> +		.id = id,
>>>> +		.u.frame_sync.frame_sequence =
>>>> +			atomic_inc_return(&csid->sof_seq[id]),
>>>> +	};
>>> On first look this was looking strange because the id is used for the
>>> control id events not for frame sync. But on second thought it may make
>>> sense, but the question is how the userspace should interpret those ids?
>>> As of today userspace does not have any info for the VC and csid internal
>>> pipelines (so called lines). So with the current state of the code
>>> the id is VC which makes sense becouse the SOF/EOF packets are recieved
>>> based on VC. So i am thinking of two options:
>>
>> The id is not the VC its the CSID:id/port/line-number. VCs don't change 
>> what this means; its the SOF event as seen by the CSI decoder - inside 
>> of which there may be multiple VC:DT combos.
>>
>> This is also the case for PIX which is just another CSID 
>> port/id/line-number.
>>
>>>
>>> 1. Move SOF event in vfe (rdi/pix sub-devs) we have per line sub-device
>>>     and will be well known to userspace for which line is reported.
>>>
>>> 2. Add and propose extension of videodev2 documentation that
>>>     id of frame_sync event types represents SOF per virtual channel.
>>>
>>> Personally i votoe for (1) because it will well fit with stream-api
>>> support and usespace will have clear understanding of the SOF to which
>>> stream belongs.
>>
>> You know from the media graph which CSID drives which VFE:output so it 
>> is 100% possible to know which CSID:SOF relates to which VFE always. 
>> CSID::SOF is a hardware description of what the CSID decoder sees. I 
>> don't support mis-reporting it as a VFE event TBH.
> 
> Yes i know that, but does the userpsace developer knows based on the API and
> documentation provided? Or he needs to ask the linux media?
> 
> We have some kind of id which is mapped to line and that is known just
> by the driver, if you can point other drivers using id for frame sync
> events will be helpfull. 
> 
> 
>>
>> More than that though, there is in-fact a VFE specific SOF/EOF and EPOCH 
>> event but these require the CSID feeding a frame into the VFE pipeline 
>> and the VFE moving through its own state-machine to process that frame.
>>
>> So they are separate signals and separate logical events representing 
>> different things with different timings in hardware, meaning different 
>> things to userspace.
> 
> Well that make sense i agree that it make sense to be part of the csid
> but it should be documented somewhere, maybe proper thing to do is update
> the comment in videodev2.h and update the documentation for camss driver.

Just an proposal if it is decided the id to be used, it make sense to contain
stream_id. Then userspace based on the stream routing can map SOF
for the stream of interest. But the API for retrieving stream_id is still
experimental and i am not sure if will be well accepted.

> 
>>
>> CSID:SOF is the thing you want to trigger off of if you are for example 
>> trying to align an IMU timestamp, not VFE SOF.
>>
>> Feel free to propose VFE:SOF/EOF if it makes sense for VCs - I don't 
>> think I have a clear picture of what you want to do there - interested 
>> though.
> 
> I am not proposing that, but from the current state of the code each line is mapped
> to different VC (before multistream patches). So this means as of today, id can
> be mapped to VC. Anyway my point is to either document or open discussion for
> "id" field in v4l2_event structure when event type is V4L2_EVENT_FRAME_SYNC. If
> not document for me it looks like some kind of a workaround just for our own driver.
> 
> ~Gjorgji
> 
>>
>> ---
>> bod
> 

