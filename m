Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793199990;
	b=04fu8c7m+vSdaDHNnGr3U3mztbug+JEFjHGeWdEX5kEVPGqrLbafF2rfM1FeFRhZwUTG
	 K4uZceLNWCU+mNV0QB7KYZ0ixycpMsa7SO93KM9TT5j3hs8G5CTgMOQQYxDx1LLMf6xYH
	 QXqCh33dVOvseZqc/ZIKlqz9GYsvN4V/rL9ysat+zf9MmH7xE5ggXwL76+TGuj2t/NgtN
	 TN137RI/AIEbHQDbWngBRsXZaMEV+BNc8ZXEpmetg9N+FGS+QxXkp9hKVqiT6NyJR83fW
	 YX0qdbePLgLCLw4XwqG0eQC1q5iDmx2+30/Gceq9SQJNdKNp8H3Bs3JoBB8K+aKPDjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793199990;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+NeF5xb5H70Cmn8d9aPiULwGwjwCvFvdZqpmCdvf/iE=;
	b=UgZz5fQikRRe8Dd7o2uQcuB/l4jdCdJQ17CUDlR4ShYoTRHBaaU6yGsr5nK3jW6YbOJW
	 kWNrjdiZo07GHsUzvI0ZpfPJdtbBRlokRu1mmlAGGJL66xYaqsM6DUf14zGqhKe1bFVNo
	 0IDOXHfoJ0vjHr0enGU7yGACNwUc+syeLsQxO2G9rlcrMCaNYBrjixKUgJwSWbOmWhJUX
	 YlR/uxKHnvyxvZ9VjYQvok9pL4/W2WBnnHfDFkzmE5RJ1nt6L/oZSyosUKsSd2nx5AqZP
	 7+sfHXvfZawqKkNH/5izhU+hWY9MJdV8pOSS293rAhLQfBlQ2TAh9dKZadGDfeJqj4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QgKlVf1L;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BnZSNFYl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57FED606A325
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:06:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57FED606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QgKlVf1L;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BnZSNFYl
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBdvVa2082338
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:06:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+NeF5xb5H70Cmn8d9aPiULwGwjwCvFvdZqpmCdvf/iE=; b=QgKlVf1LGwoeRbtl
	QTxEpQuZ/oBKBtEJQqNnPb3YNR3Agj8a11xGXVGVWrDtrS1Hd4O7jX2TdpbSQfQD
	yhiNPdQkXfLuSYM5zkkZnJrkX5tLRWgR9WK+JxMpEihPK7CZznw2QB9x+yTgDi5L
	I6RW8SJmJld7PMym473X5feE9ZrI9bUytwVz2ZA9sPbnmaMiP5jLtCHZQaeOwpAn
	0RZzLzolyQZ2DHgIIKDVEG/LntFdk3iIyx4ghJQ3Ezluksbfkn+6qbS6k7ll/ivV
	ZRwUHAzMX9MUsQ0jHbwny88iOr7TFyblwSZeQ6pZcvCrKZ2Lx5HF9QPkubGaYTzQ
	PtIPmw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjpvmhc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:06:28 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-98a9c848bf0so270645241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 08:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793199988; x=1793804788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+NeF5xb5H70Cmn8d9aPiULwGwjwCvFvdZqpmCdvf/iE=;
        b=BnZSNFYl0hUDimnobcFGhJ9Z+tCzvEkqnxZ4PNKQ5R+LS+PwyQOEcM/w0zT5CrHDv2
         m/Vs55cnKAMxTeJ7Pri3PNC9rpD1np7SoHydMDMaCNzmigPoL4fibVrZOTmq5py2s/04
         LmpTHQJT/lDQaL3/iLipCHFWt7W8w1KGoG1YP7/NzMUEhlEJdtoTv2FYIsNcxiY8tNih
         8kVKugtB2F3APlyV2ButnLkawWXf8eIg8WWqnmkWqPHja80DuNQo7IeUf/WnEpUP9/3r
         XTZE9IAULJEZDVUsUz0pkd9K2ynyRRcUbof+GRpT/vowVZ5q0kvHk3czoux4Jfw9p4CQ
         i1kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793199988; x=1793804788;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+NeF5xb5H70Cmn8d9aPiULwGwjwCvFvdZqpmCdvf/iE=;
        b=GyRk/OXIs3MQKAF6xpxI/JtRmREClrikw7R/Ky05dPVU9LXMpnt04KUluTrjLo9rYq
         lxnAqjhip4PBRkoFqRJmV4phaeEzxvMgikAHwaLsjwiF6f3i8fFnyBEHFiEQM+c0fbTD
         +L+KH90Nd4dsXMHeDDh/u4dfh2QWf2eqZBF4NwoQu4dDmaAZtaTiZD2yQz77DTTF6xgR
         VRo+qSifv1MAAv7RwakHF+H8iOlwCl6VSI5lzppSKDKrl0fI2ySG/bQrMZij3SXgh5Yu
         DyshsjMBuwd0+veF0bBu+ohXyMDRNVglA+7a7/o7fFWX33yVAhskZ9EIKzTJflcMB6Zn
         NDvQ==
X-Forwarded-Encrypted: i=1; AKwUvBzs9aycu0Pq7+5Fhv1R3gk09kaS2/zyYP+euDrZNEfVbfqM2d5fiaHQasDByTPn9B4RrQ5FkX68nA67FMEX@vger.kernel.org
X-Gm-Message-State: AFq9FYJLZ1ziRkvoCBxU67HUQ0B3QGymyp8vqhCJbnYa8P0Ktz3AxIQh
	K1cp+0jurBlGZ7j2vMN2EEvLSDd5qkJKrZzKk5SDOpVnVmcoYW54HFoMhur9bU1UZkYxqZNAjhn
	vfQTpDKbPIkbLlH9OsCl03utmBEXT1COTTm79CbBsHkwLqB4uBr3ikKWqsmN7Fcpgsupbf3CeA4
	q/
X-Gm-Gg: AYBFou0/NQbecd1W2+oDWdCfcMHNGc81oQ/PrC+PhhRy1miA9qKUHiuVYBQjfPiIVeP
	oCaxuQGnWaHCkSsPf8QbFXoqe7sa+2OIQZvJ+jP1jawfCTXSzvvwZbmPv8mRZvPZW9hRKi8QIap
	Bw/6kpS8MfUj7FgAQwdr1osnprTAfP4G2u3fDKDJIPSqkE7DB4EmzG7wz8g97um6wBUb9Z0cBZs
	GsUnElf5C7M+cFWqOc+7rfBp6eKh+ehWGzLO0YuGLZvBO0H4b/Wpl1KBPLCdQ+55jflwoLM39lc
	NwF99iXch4d/bCZVBOcOK02oc7qQy7qVumqFM0kW7LTEc6vQX8hB+HJOmaiECIZONKMs5HHUP+K
	u41kGc29yHrEfUD7aYX3jlAwljZLnCJQmF5n8Sn3KrxUkyAU6Ram9nV4nXOPYChvGp9wv0cMWNY
	Vyq+6W27+kdazR
X-Received: by 2002:a05:6122:2805:b0:5ea:c11b:432c with SMTP id 71dfb90a1353d-5ec4cc44655mr1202121e0c.15.1793199987856;
        Wed, 28 Oct 2026 08:06:27 -0700 (PDT)
X-Received: by 2002:a05:6122:2805:b0:5ea:c11b:432c with SMTP id 71dfb90a1353d-5ec4cc44655mr1202078e0c.15.1793199987228;
        Wed, 28 Oct 2026 08:06:27 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4ea0ccsm626317566b.16.2026.10.28.08.06.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 08:06:26 -0700 (PDT)
Message-ID: <5e30518c-c6d3-458f-a0ba-f202f5b428e4@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 17:06:24 +0200
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
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
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
 <07f884f2-bf92-4264-a289-d40fda9508e3@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <07f884f2-bf92-4264-a289-d40fda9508e3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MCBTYWx0ZWRfX09tTOGejUOLT
 R9/jy8n2PgYyRlyz4I+yBxm6AhD8ElRo2EGXTUgKW6foUAscZgI1Q4E7Qh42xEityRZI116Nk0H
 GhNEx8v0ixmkNyHdpiWYnShGZTTmssopPbTh6pZVg3h77KHS4Y6EtrIUxBqxDlP4Cm0RDsVYq4d
 eqMY2bn4vn/OmM8nuLcKMZwno5WeMM8SAaQEKZZZLC5+2DUEm1XomrIUg+8wVV+DLVc1TwMQS+5
 ujN7CFxEEQTXqc8ye9Pcz1nSHfkdorrmGSI/chliIiCdqY7px5dffIALmjw03DZPDElh9d7SGa0
 CfS52SCvzdYNEBgyGSom5mwEVgRSpXVFDRCI2ZsRGaR3IT7owHcVyAIjID/RINzrfmQVCIOon56
 cGIlMgQgjF3xUIr4kOWC68Z97mC2Dca3V0AWdW22TJXNM+yXK8ye9mCC05YSgtZ0HWeEX/oC0TC
 HKJSYu4eQkRNXNaXlEw==
X-Proofpoint-ORIG-GUID: 0OhwHlAHJEbM644JBlP6_9DU9xtUhRWm
X-Proofpoint-GUID: 0OhwHlAHJEbM644JBlP6_9DU9xtUhRWm
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MCBTYWx0ZWRfX3ITDa7be0XYS
 W854Sjob1hdmlfPvHQAUSLgnOPL46G+nYqSrSaHj1eeKgIYGq2zl5aInhWsTeEaaomGSRNhbJOx
 mOCsIrI6aFSPwZdKH8DFqN8G18ph4Qk=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae20f75 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=D-oFrpvt22n0kU7c7gUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280060



On 10/23/2026 10:07 PM, Gjorgji Rosikopulos (Consultant) wrote:
> Hi Atanas, Loic, All,
> 
> On 10/23/2026 6:50 PM, Atanas Filipov wrote:
>> On 10/23/2026 6:45 PM, Loic Poulain wrote:
>>> On Fri, Oct 23, 2026 at 5:29 PM Atanas Filipov
>>> <atanas.filipov@oss.qualcomm.com> wrote:
>>>>
>>>> The VFE fails to power on when the pixel rate exceeds the highest rate
>>>> listed for any of its clocks. The rate tables of the VFE clocks are
>>>> independent and need not have the same number of levels, so a clock
>>>> with a lower top rate than the VFE core clock, such as the SC7280
>>>> camnoc_axi clock, makes the VFE reject pixel rates the core clock
>>>> still supports.
>>>>
>>>> Clamp each clock to its highest listed rate instead, and warn that the
>>>> pixel rate exceeds it when the clock lists more than one rate. Take the
>>>> clamp into account when another line powers on an already running VFE,
>>>> so that a clock running at its highest rate does not reject the
>>>> request.
>>>
>>> IMO, this function has become a bit messy. We should split the core
>>> clock selection into a dedicated helper, as it is directly tied to the
>>> pixel rate. The AXI clock scaling/selection should be handled
>>> separately, potentially through the interconnect (ICC) framework (when
>>> available).
>>>
>>> Regards,
>>> Loic
>>>
>>
>> I completely agree. I just don't want to mix the two issues, as 
>> requested by the reviewers. IMO, if we can reach an agreement on the ICC 
>> migration, that would be great.
>>
>> Regards,
>> Atanas
>>
> 
> There have been several discussions about this topic. 
> I would like to summarize the background here and reopen the discussion
> about the direction proposed by Atanas.
> 
> The issue initially came up with the JPEG encoder driver, which is
> represented as a separate device. Dmitry identified that changing the
> camnoc_ax clock from the JPEG driver conflicts with CAMSS.
> I will not revisit the discussion about why JPEG is not part of CAMSS, 
> as this has already been discussed extensively.
> 
> Currently, CAMSS is represented as a single device and drives the front-end
> blocks that write data to memory, such as VFE, IFE, and TFE.
> 
> Depending on the hardware architecture, CAMSS may contain different number
> of front-end blocks. Some camera subsystems also contain offline engines
> like JPEG and OPE.
> All these engines write data to memory through the internal CAMNOC and
> share the camnoc_axi clock.
> 
> The relevant topology can be summarized as follows:
> 
> CAMSS device: Front end -> CAMNOC -> MNOC
> OPE device: OPE -> CAMNOC -> MNOC
> JPEG device: JPEG -> CAMNOC -> MNOC
> 
> An ICC path is already available for MNOC, and each device can vote on it.
> 
> CAMSS currently has two issues on this topic that need to be addressed.
> 
> 1. Clock aggregation for concurrent streaming, As described in the cover
> letter, CAMSS currently does not aggregate the clock requirements when
> multiple front-end engines are streaming concurrently.
> 
> 2. ICC bandwidth voting
> The currently available MNOC ICC voting is implemented using max bandwidth
> values. This can increase power consumption in single-camera use cases.
> This is not included in this patchset.
> 
> Addressing the first issue depends, to some extent, on the direction we
> choose for CAMNOC ICC support. Atanas has proposed two possible approaches.
> 
> 1. [PATCH v2 0/3] Add Qualcomm CAMNOC ICC provider
> 
> The patchset adds an initial CAMNOC ICC provider with multiple ports, where
> each port represents an engine client of the CAMNOC.
> 
> This allows a device such as CAMSS, which is represented as a single device,
> to vote independently through different CAMNOC ports. The CAMNOC ICC provider
> can then aggregate the votes and calculate the appropriate camnoc_axi clock
> rate.
> 
> 1. [PATCH v3 0/3] Use icc-clk for the SM8250 camera NoC AXI clock
> 
> The ICC framework, together with CAMCC support, can represent a clock as an
> ICC provider. The implementation is relatively simple because it reuses the
> existing infrastructure, the camnoc_axi clock only needs to be exposed as an
> ICC provider.
> 
> The limitation of this approach is that a device such as CAMSS cannot vote for
> each engine independently.

After carefully reviewing the ICC code and discussing it with Georgi Dzakov, 
I believe this assumption is incorrect. ICC aggregation is performed per client,
so each VFE sub-device can call icc_get() for the same endpoint and achieve the 
desired aggregate bandwidth. So i think is better to continue with this approach
and see how the things will look like with camss and jpeg migrated to this provider.

~Gjorgji
