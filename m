Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793716562;
	b=LkpDLBu1lGriOiAhr/gWpeeYwu5NdwR8YyAmUL1nV2NXzOwAWmh3P9q1Bd2/M/5tw7Cy
	 8tIFuEqOvRSAuyVZyEj+tSEcL9lsOulGgSd2l/hxxNr5hNW/Zza7yo1mwd4+iy1nOOtB5
	 7CK9xu9Us24bcRrLyj3Z+Mu8HpKBO87tU+7PeFuyY5V1ockmkGRUO7Roo9bJYC6MNXLIs
	 YbiL+cZqdkldcTfXDBO0cJa2xMo7nDUmVdt5qe2cmYw0EMBNgddR90s710l0MzL94o95Y
	 qrBqAPHSIB2Kz7GILR5ccDve8xvzFyAnZIQE8bO/pBdat7wU6taz/nCtG2MKPZlG5xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793716562;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tejntqRDlJgo6+kuQYEvaWuon7nBszN4jE/gMFKNG4w=;
	b=5rSnbOmVPe1v3TLBhzRmgOZh4mMSTYeFm/gyPTs6K0/BcNl0G0blkaCAMsaDyenb86iR
	 mY2sWGJP7O++7Pb5IitVY4jvREA3S0UpJ3HgaYC/z0T7Xa2Q5hX8Imgwqg0V2m/n+WkOI
	 FZ3xiX22hkUJ4kGoMvCG7zQqPqLDM4G8LyLmdd5JhUFNVH16k/YKZfgi4yMmsvdWt3M+d
	 oX4aSt0U9L8zRoF6Fo6MAWCXIkXsFngrG0dDAF5m3EjEKBee5SSGDzwld+YnkFLIqH7W7
	 ruKXcp93nihfKs+Q6HY9EgxRJWnNUnPz5cWcDJW9/isn24pBNLhr7OSzfRvnnyIKrIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Demgw1Em;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H+4Uq9pM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5BFA606A326
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 14:36:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5BFA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Demgw1Em;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=H+4Uq9pM
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3EAJJ23690024
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 14:36:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tejntqRDlJgo6+kuQYEvaWuon7nBszN4jE/gMFKNG4w=; b=Demgw1EmK7stCnoS
	tfhgiEnrI71eLw+kfQqZTlXBoMyQKuvgsiLHofy6AkTlBVOc7fByasyaF687IUhs
	TkxpG+s3HcRAQ6JD/3+uFWBEiMhF9G1zJh4kV5J/I2OiRgEOqdwI6YYvEc3C/+1r
	UXwzrceW//VBW42qNuoIXqF0BvPpTjwLe0Ew/bTyfmErj4x4nDxr3MRn5JOyHCkC
	MWfiTAO8Xzg4ZbioyqoZC0G7EU1F7NOCPH9SdGDFqz83pJ7RK1sTHir72wj/Au0B
	qssIv/2GWQeQN2THbwx5OU5mNX/WC00gE8siets3dOwLh8Q6SBboV3mDiExog8Cr
	FLRluw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq6m9aqr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 14:36:00 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc0e78a4ccso659340137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 06:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793716560; x=1794321360; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tejntqRDlJgo6+kuQYEvaWuon7nBszN4jE/gMFKNG4w=;
        b=H+4Uq9pMhuoYZVa8NMW2JvzoHk4/iLwq69I37ZCTSyNjxTQNpiDHWqpGs1YE1ytz8T
         JrbrNwhOORS0qwa0bjBczlElFFL6zU2F7w52t7xLLI1kBq3dM7I2aqjbQ56CsLgpr6iI
         8o61/JHgVVlFB/RChDwLBhTn8iCwl4NY9uHRGjdFdqOlZnVnm+E5gIzKVHWybIPdZHhD
         iYBXZrrsbPjkyKhqRXXP5+LSJc6uG5fT7PzCf+T3/i2kmmNR3e5JruHBM3vQqUG+MOmn
         ObkL+yze2BublLJDXkGxdEoH3gR7TrKefzrl3ReR1Z+KTH2cBbzdzZHaxNg04GphpcDc
         ItxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793716560; x=1794321360;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tejntqRDlJgo6+kuQYEvaWuon7nBszN4jE/gMFKNG4w=;
        b=yoyMRorINpJm4fy5fqQHridZQec7QR0bPZa2NpiImSTTlswBB/itXruwxzB46cDo8E
         CHl8Mb6SV2mnEOWbcjn27K0yHhq4wU6B7r2WdyIUEH8Bc+b0luqdBID0STdasupZPt44
         xyLZnZv09yz5RxUa5t1eSlFWvxlBnWQwe1EW79jpQ7N1+lOfOEs0isuyJAvLOa889QSG
         7T2kTTbBR0N6CQFZBbYJPdgYmpfukiRegGQ3ewqImkBbtK5yQg/kgljVyNzPRz4K5I4J
         DuaHrAwKwzvOCj86hp078DKxnMEkE5YVmpyD7QqbSx13CStxh+YUx011OK3LbSeXiGnk
         Ddkw==
X-Forwarded-Encrypted: i=1; AKwUvBz+KWY/CMWb5zXG/DyRgfn4ggOlXIGyiLc5FbYtVwC25B565g5nGg1/RdZ6ORmKwGFnA9zHWcPllokO1W6s@vger.kernel.org
X-Gm-Message-State: APuU4Z891lLGyM6CsfzXICDIDNXzedRStOlrA1Er6A0vTc6FHbMlmYx/
	X8RM7doGHqOQLx00BKAo+/5OdzEfBlWKZeFr5OTREEfmztXpZAseKJtLurRaccuto+AZdFxPzID
	abn2rcLqDb1cpd4jUwEGuTvhzn+EvpqxgGh0ztz8AAQBHVxuKQ2zuATEhQZUUkja2u0m8
X-Gm-Gg: AYBFou0xdQ8mMPhwiYIB7AZs4+owPYC7KOpX7TggNEEvzlDGDHPIM9vKA83aJ7jqXgO
	Qah4F+jA5+SnodpphLfRgpUoUXTj1NLp4VPHfJbQpYtBugbU02rU8R8DR27FzfCcCPHJlwNja3F
	VNsdyGJCDEfUB9/emnqbIm9hkflBsNkx6sc9Z+CeUj5r4xL/J6Bc9h0CaQ8vU8Iaid2lazePd3p
	MmjjATzmebXt9av6DKchB97CaINdVuWz0BODVMRJYT4KPLzazb01tHJ2gqeoEEFArv5ZM+E9GV1
	HUvA1/KfX099ViTJ1CjbmAbEk3a4rJXCfK+cbtyc9re9wIHkomzBZfnNezCUtlcn2pl1v/jLBWt
	zwBXEJc4YIUT2OgZYYfKdktIVILEZzvh+7n3DKMadETo3eSRPcwapjaTkoukp6j+aAz6bEmiJLS
	io5sIFzNtPec+g
X-Received: by 2002:a05:6102:14a3:b0:7cc:232b:f5a9 with SMTP id ada2fe7eead31-7d07272efedmr4647351137.24.1793716559975;
        Tue, 03 Nov 2026 06:35:59 -0800 (PST)
X-Received: by 2002:a05:6102:14a3:b0:7cc:232b:f5a9 with SMTP id ada2fe7eead31-7d07272efedmr4647338137.24.1793716559440;
        Tue, 03 Nov 2026 06:35:59 -0800 (PST)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b7246fsm25764805f8f.19.2026.11.03.06.35.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 06:35:58 -0800 (PST)
Message-ID: <d4d0161f-37d1-4b93-8b54-202e691d66b7@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 16:35:56 +0200
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
 <36008be9-2b25-4f04-995e-f90e2547f7f2@oss.qualcomm.com>
 <JG_h5JjMWB6vy7eR2AS1dqGGrNxZZgcte904oblinYLOAtSNIAdesLgsGrFpYyxekmZ1_FdEON9Uoua7GmkX-g==@protonmail.internalid>
 <d3a7c0c2-f5dc-47da-8466-d0b77aae9b9b@oss.qualcomm.com>
 <57a326a1-81f8-437e-bd4f-25f79e0cd1cf@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <57a326a1-81f8-437e-bd4f-25f79e0cd1cf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -6AxrjPPsWtzlFgk8_ggdgZ_dt3muWkm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1OCBTYWx0ZWRfX72jsGtb5gGn5
 EKfUKANx0120Wz15XZ0nJLE/CONsvaMx0B3o7gz7JtM9ZBdINnKK7RDH7eG5r/YfVsS4d/dnfKL
 3Uwk8oHyMnYUn3ZtDAAOWdi+TwIqx8I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1OCBTYWx0ZWRfX6K8sKnmpju/2
 tFYD35vq5T8m8kZUeNyl2scF4KzhFKTqC5iW/6DHGzkbxJS3AcmMFzU7Oo1uD2vhLVcVTfK2+2c
 PFaJVjGQkmKfFstYIwLrvj7FYaMkGGk19mBvDLDf9VXassnEUepoHWxdirDD4z/Mld/GogQzRFo
 jtgvjEQJm9pXudIDefqicMyMJ30RdQq6kT6Z6yfU2GIX51qWlSQExjJ/cF051scCr5/pA9SDYfl
 2HMGFQnbb6ICMj/aWosrYcoEJOtynJBfM6V9DfgVv1/j8tUwxJ31tlL5970hd8g7pSw9MDTyim4
 mZlFyHKtxjcQFgoBGY0DcyprVNj8NUl0e7d5Ai+EOY392x+T3LR45D+1zPOb8zG3JlQzN9MD2uB
 8pf9kKCByJpMTe/j92HLwiSj5PEfcXgz9uOb0NpWkDDm9qubDVyZ7kjFY6ULPUBHo3jtEYmhZaG
 BfcHs/KEA4f7mI8EEpw==
X-Authority-Analysis: v=2.4 cv=C7B8WgP+ c=1 sm=1 tr=0 ts=6ae9f150 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=eFg4IZInNbfrhCL20lQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: -6AxrjPPsWtzlFgk8_ggdgZ_dt3muWkm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030058

Hi Bryan,

On 11/3/2026 3:27 PM, Bryan O'Donoghue wrote:
> On 03/11/2026 13:13, Gjorgji Rosikopulos (Consultant) wrote:
>>>> More than that though, there is in-fact a VFE specific SOF/EOF and EPOCH
>>>> event but these require the CSID feeding a frame into the VFE pipeline
>>>> and the VFE moving through its own state-machine to process that frame.
>>>>
>>>> So they are separate signals and separate logical events representing
>>>> different things with different timings in hardware, meaning different
>>>> things to userspace.
>>> Well that make sense i agree that it make sense to be part of the csid
>>> but it should be documented somewhere, maybe proper thing to do is update
>>> the comment in videodev2.h and update the documentation for camss driver.
>> Just an proposal if it is decided the id to be used, it make sense to contain
>> stream_id. Then userspace based on the stream routing can map SOF
>> for the stream of interest. But the API for retrieving stream_id is still
>> experimental and i am not sure if will be well accepted.
>>
> 
> Ah yes right I didn't really grok your point about .id = <integer> yes I 
> agree with you, the assignment of port/line number should be dropped and 
> left @ 0 - also what is the point of stuffing the line id into the .id 
> field is not warranted.
> 
> Agreed, that's a mistake.

Maybe this is a good point to raise. My concern is with the multistream patches: 
the id field is also used when subscribing to an event,  so it would be useful
for userspace to identify which SOF it receives in a GMSL use case.

We can leave the id as 0 for this series, but I think we should discuss how to
handle cases where two different cameras arrive on the same PHY over different
virtual channels—for example, one using RDI0 and the other RDI1.
For sure what is currently missing  in stream_api support is the events and
how they can be adopted to be per stream/streams.

I hope that clarifies my intent—I’m not looking to hold up the series...

~Gjorgji> 
> ---
> bod

