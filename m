Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792782474;
	b=c3ZXVUZAEzP1cGHRBj5RnBf9t42l9C7AqA1zz03gbRXbeRC612DibCJjkF0eOBMdbwkE
	 hfK49xKfqkaTNBDwRG74E8HOpHjA59z9B496qwvbqX9aCqsaP0fbRfyYZUFQBIRuSlpkX
	 Zlqbo5UJD0PodY6ZygmcFbdHFYOrO43g4rsTy3JBoUXzgW3SR3TRrCfXAuaWRCkHh5Q57
	 8ZPlBUOBlLL19K0omf52Fs8UBETvqns9lYgkM1/yHRo1T2tlU8mPJUSY3kKOmEz6BBuuL
	 E3H7fj8OrVaGzJSBoQ4LdPRXpIPHTteYmE005Zg2YZ24LEVM1xGkAMp7gLiEfkwWPCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792782474;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/BDsE7KYZUbeCjSRjXDmRvAJvYjOJm6pC727IV5UA0w=;
	b=i1SZAfiX11iapfFcDpHiqfZRNEcozVvBDiiQZrQqXXlvvEBSM0BkTWzDXKuIHmJ6Tj/+
	 pa5FLvWPvr7vqMgzRQ6johACqoldL+FuBeSgybMWpPUrD0IfDute3rOOmDaS6o+pzIvEG
	 pj3tGbmuQpDMRCN+9xYBov30r2iGFtvP93O45nIJC0OXxLHS5auS/Fx2EiSPIJsZUd3n+
	 rspQtmzrP0dCXC3NIwKKAjNUF6cQ4YP8kxpYnbDFg3p8QI5Cl1sEM5ERpNhhFN9bUZhcp
	 0kJU5oQmx8pQR735sDQwiR/tSYQv5qo/Fn0QFoa8scYX1W/ssBBkih3qMGj8+qhYo+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O6CsSf4h;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bZXc5h1S;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8E5A606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 19:07:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8E5A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=O6CsSf4h;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bZXc5h1S
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NIZtHi4143652
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 19:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/BDsE7KYZUbeCjSRjXDmRvAJvYjOJm6pC727IV5UA0w=; b=O6CsSf4h0VM8cbRJ
	xJb4HXkxlxWe3aajA3C8W5033KaRZdEmntURB1fXkMix/w+ouxAXIbiLR3Vwfp4A
	u1MCxQhFNN+Qr5Zoo9EBieLi+KTdhCbRb3XZGbS8DuuDFoLGQ4P29lvBXxxpwhKr
	QKpwak5wQZ2YtZvEeBZblx+yrT3cBKNNTNgtF7fviUa+PdOgkyHIrxmrVLFN/Eca
	61yRzak3tryYrz5+JAv8noDIKBW+hoauKvnL0u5pGXgUy5MXuWHErgriu9PCu72Y
	uy2SL5BFSluJWmZn7B63km8VaGQKqZTu8XzRy215z8Fuf0psn5s1PiSCsXaTTkXf
	ztQNKw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgas88p69-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 19:07:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f32050e72so31402285a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 12:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792782472; x=1793387272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/BDsE7KYZUbeCjSRjXDmRvAJvYjOJm6pC727IV5UA0w=;
        b=bZXc5h1SUL8TtWIRo5+J0V+WcTGMvccxNzlUor6mLq0AjpwvDlAv5IgytDYHMsZT+g
         37rVOO5j0f7WbI9v4G8Upbb3w6AurS/kgfThZV2NgJ+E+vKjLM1V/1eAsuIpE6cm4uia
         cw2sVrEvcxtkfCOu758PHSFLvHE7fzw1Rx7WzsSEGW6MxZTEXU/7U1tWno4edSEHIGO2
         pw6C03wuYucinlyzn0qvtj/AQzVYr1eQDHX7T5Xel7K9QD8oXclZtvDQcxc6X0bT4J3h
         0l+MZPkzuADqmmUgeEnsh6RlVtmzHkjFnzpQqWRuEhHpo4Wmpkyqd3sDK80s2sWgjkuV
         P/WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792782472; x=1793387272;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/BDsE7KYZUbeCjSRjXDmRvAJvYjOJm6pC727IV5UA0w=;
        b=ulRIBwQPv9pX3P0YCkjNLGxQrf/yZ4kGLhQkYH0e5RfJDlE8h4CshKyN2X9iLYmGTQ
         NhrnfqmNoAfAE5XqUszkuVevpYSs2pHhZGRsc8gu6oQKsgSTQY3D7BWTSCWqwDMQhEjC
         K4HWl3r9BLuRMl+aqS77IWMARjFdkVp3mTff2j3Bi5bgPyeo4f0X9N7VlbTSmzHzS2rp
         f3J1ErGhzfRFd2nBzgGOMbJD/rDGJPCLw2i8SNjBKYtBz5dTPuYyUjDZsJ4urkDlkKrE
         Vj+35g2VYeX/FyksLzfHWVlq2HABbbIgHtgUwjVncPHzBapfYhxyQKRQcbdUpD78bzku
         NxEA==
X-Forwarded-Encrypted: i=1; AKwUvBxCZCK3PubvJ7ZR++lOSmz90ydTqmJ6/sLR70Ocms/wbMW5yCt+Pbi4ruwxPmkwZtK3Tp8QZ0k8zDgQNTAV@vger.kernel.org
X-Gm-Message-State: AFq9FYIgOiefX3oh8LqjoS1ewYbUNkLy4x+Y6mctSYjLpixGDLwcGeqJ
	YIG/eZ+bU8EpDgRjOdaLJNdXxodNPBdPRM1Vs+e348s1X4AKgXSkNu2uQshdWg1rs/9HSqTB2sT
	0hCoF0IHrtekLuI4dfAwSHKmYG8kSYnjklU93hkI+TjAgpn4G2bPAn1I6NFIcsof/PSo5
X-Gm-Gg: AYBFou25lHxsXoMV880Ehc0B8Rj64tYnDARHdt4J59PEEPN3ZcMOKBMxi8MlHHObzAu
	dUM64igPr8Fwqr1DjZ1SInq0NibsDmtFiv4Z3ELpMb4aUVYlQOjworLhq5gP4JwUitDXOfWHovC
	/sqIOypc/U3ciHLWkDr7zBPY/VTuFZXRB2hX3KM7RqqhlPuUSM2OUTSlEOU8jfyF4Hl+3nhHAqB
	2Os/acy1Eigd9hj11HdU2B0K2JodZ1KWU4yUMVl8MobpfmrMR0ElX2cTcnL7VwSEJ9+nNMGZb1r
	tPwtb+6viVXUJD699ntPhUWGI11CsYbi3YqSYVl9yX1uPA+7m5EcgS2kf65q8nO64QIb6mIMI+L
	F/kueyCqETjP4mI7c9L4IgLQl8sRbjdwG9/MbcMI=
X-Received: by 2002:a05:620a:2a09:b0:93f:2def:5cd5 with SMTP id af79cd13be357-93f6f9b34e2mr577866185a.51.1792782471715;
        Fri, 23 Oct 2026 12:07:51 -0700 (PDT)
X-Received: by 2002:a05:620a:2a09:b0:93f:2def:5cd5 with SMTP id af79cd13be357-93f6f9b34e2mr577859685a.51.1792782471128;
        Fri, 23 Oct 2026 12:07:51 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d37c883sm1397603f8f.7.2026.10.23.12.07.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 12:07:50 -0700 (PDT)
Message-ID: <07f884f2-bf92-4264-a289-d40fda9508e3@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 22:07:47 +0300
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
Subject: Re: [PATCH 1/4] media: qcom: camss: clamp VFE clock rates to the
 highest level
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com>
 <20261023152857.2859767-2-atanas.filipov@oss.qualcomm.com>
 <CAFEp6-2tC+uFJSG8xOhQdrhfCqoDuhm6q0rYc6cROoUG_r1vtQ@mail.gmail.com>
 <dc87be81-0fcb-46ea-b9cc-42866cca074e@oss.qualcomm.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <dc87be81-0fcb-46ea-b9cc-42866cca074e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA3NSBTYWx0ZWRfX9j11ZhO4cRPo
 UxRN8180e4XW83LhUyFBoufDLxZJkpebZxHc9WgafpeukBJ97RayhzqY6RPjusmYwUkhrGpHnKY
 b2vH/iVxHdMQj2gKfBOpTh73yu0IMRc=
X-Authority-Analysis: v=2.4 cv=OPqyTiaB c=1 sm=1 tr=0 ts=6adbb088 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=j4AJ-kHJ1b0bUOn6I8UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA3NSBTYWx0ZWRfX5ZkRJFpJvo/N
 YBbJuLgk+hfd/OXVkZeUydF0aYkJnRLugeJhyG+BwMicedLH2lIlWQnhCYmV9kTBW8sTO4GwnFE
 S28RCnFSqBNKY3elDJwtaDAbeOQnlCSFnBWitMCe6lJQn60Z8WEhSo/IVvca0ytjOM2DwN6KCJs
 HMK34KB3TJLlnTUuuJd2HuE2P9fuOk2lctsgvfdA0CHcn19HRWMbYkawKurUv58spLAfvOH8Qyo
 JYUBtpCJUGb+swi31M7Ory3yrbHypGHX8KY9sKPYk3Lflj7Ad7KZ+UVc366cPtCfaeapzIazFU+
 Tsme9rbC8nLzpsp+HYKfu6hm7Dn8+FtDzjtrnny837NVXe/IEzPeYkI4MONktY0REDXj/YwJavj
 3z/Sx/vQGFNFUe5zS6xF1Sofp0LuY+AyfDgvINmD3FKu//PTYeRut86B0xyqxNn3GQ9BH1l1f5R
 NuIV8D3vlWYZW2i/3PA==
X-Proofpoint-GUID: ZBKQpp7aVd4hs_SKC9bust8A-SPyH0cq
X-Proofpoint-ORIG-GUID: ZBKQpp7aVd4hs_SKC9bust8A-SPyH0cq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230075

Hi Atanas, Loic, All,

On 10/23/2026 6:50 PM, Atanas Filipov wrote:
> On 10/23/2026 6:45 PM, Loic Poulain wrote:
>> On Fri, Oct 23, 2026 at 5:29 PM Atanas Filipov
>> <atanas.filipov@oss.qualcomm.com> wrote:
>>>
>>> The VFE fails to power on when the pixel rate exceeds the highest rate
>>> listed for any of its clocks. The rate tables of the VFE clocks are
>>> independent and need not have the same number of levels, so a clock
>>> with a lower top rate than the VFE core clock, such as the SC7280
>>> camnoc_axi clock, makes the VFE reject pixel rates the core clock
>>> still supports.
>>>
>>> Clamp each clock to its highest listed rate instead, and warn that the
>>> pixel rate exceeds it when the clock lists more than one rate. Take the
>>> clamp into account when another line powers on an already running VFE,
>>> so that a clock running at its highest rate does not reject the
>>> request.
>>
>> IMO, this function has become a bit messy. We should split the core
>> clock selection into a dedicated helper, as it is directly tied to the
>> pixel rate. The AXI clock scaling/selection should be handled
>> separately, potentially through the interconnect (ICC) framework (when
>> available).
>>
>> Regards,
>> Loic
>>
> 
> I completely agree. I just don't want to mix the two issues, as 
> requested by the reviewers. IMO, if we can reach an agreement on the ICC 
> migration, that would be great.
> 
> Regards,
> Atanas
> 

There have been several discussions about this topic. 
I would like to summarize the background here and reopen the discussion
about the direction proposed by Atanas.

The issue initially came up with the JPEG encoder driver, which is
represented as a separate device. Dmitry identified that changing the
camnoc_ax clock from the JPEG driver conflicts with CAMSS.
I will not revisit the discussion about why JPEG is not part of CAMSS, 
as this has already been discussed extensively.

Currently, CAMSS is represented as a single device and drives the front-end
blocks that write data to memory, such as VFE, IFE, and TFE.

Depending on the hardware architecture, CAMSS may contain different number
of front-end blocks. Some camera subsystems also contain offline engines
like JPEG and OPE.
All these engines write data to memory through the internal CAMNOC and
share the camnoc_axi clock.

The relevant topology can be summarized as follows:

CAMSS device: Front end -> CAMNOC -> MNOC
OPE device: OPE -> CAMNOC -> MNOC
JPEG device: JPEG -> CAMNOC -> MNOC

An ICC path is already available for MNOC, and each device can vote on it.

CAMSS currently has two issues on this topic that need to be addressed.

1. Clock aggregation for concurrent streaming, As described in the cover
letter, CAMSS currently does not aggregate the clock requirements when
multiple front-end engines are streaming concurrently.

2. ICC bandwidth voting
The currently available MNOC ICC voting is implemented using max bandwidth
values. This can increase power consumption in single-camera use cases.
This is not included in this patchset.

Addressing the first issue depends, to some extent, on the direction we
choose for CAMNOC ICC support. Atanas has proposed two possible approaches.

1. [PATCH v2 0/3] Add Qualcomm CAMNOC ICC provider

The patchset adds an initial CAMNOC ICC provider with multiple ports, where
each port represents an engine client of the CAMNOC.

This allows a device such as CAMSS, which is represented as a single device,
to vote independently through different CAMNOC ports. The CAMNOC ICC provider
can then aggregate the votes and calculate the appropriate camnoc_axi clock
rate.

1. [PATCH v3 0/3] Use icc-clk for the SM8250 camera NoC AXI clock

The ICC framework, together with CAMCC support, can represent a clock as an
ICC provider. The implementation is relatively simple because it reuses the
existing infrastructure, the camnoc_axi clock only needs to be exposed as an
ICC provider.

The limitation of this approach is that a device such as CAMSS cannot vote for
each engine independently.

I think the patchset should be updated based on the approach we agree to use.
If there are other possible solutions, please share them here as well.

Apologies if this message is not perfectly structured. But i think is
understandable. 

~Gjorgji


