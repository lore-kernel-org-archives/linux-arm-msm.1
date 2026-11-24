Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795489878;
	b=QZt1S2tfV3nqQ4sGgtZ9X6r9CrYzZyl07ArJ/q0i6jcz82OHzZZy9vb/fdsMhzpjzGDj
	 jNg6fTPRNa9fncrHOoidnXyDivty2rzOK7/rrPK98RQLE0/FRogKJ3QxfM/Fteibsgy28
	 FwpY0rWBYSFea2QT/fFEl1tmOI+qSCvdNBO1xkHfc4VKWApk6616+5oqQmaop6e1w6IkP
	 4nDYMA2ukseHebiQlCz6Moiv2EtxId1O2IG38Gvo9LlcKWyHHvKnhlYK2CXQuOSdJshPR
	 Cgw1JhxLnO+TaMkPeU18I1n39DNGnMqwpgaA13+FmUMTBwidwn4DiVqfxPyOZxCTpig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795489878;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:Content-Language:To:Cc:
	 References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Z5VeJnwz4/sm28InEjRBuwn7cnvfk5WFes1/QC4jAFw=;
	b=IyDeyDhLEJGdAoUEGw4E6ocxBQF+ozY51VMNqac1BvMXD3xLHXDIK7zY5JAIupjpf5E6
	 WnayVFeI8qo0p+470PPOQbuhHBME3afy/GqgXCGPUh502FEeVn6+oPTsLAe/Btd9ez9IE
	 HWOQQ22lgcEY8g+GrA4iGYCl3AYAdXPL7SJMPxct7k2iZGJwfTMH+1to+zNRE+BLVegHv
	 lSqAWs+bnw4wr2gcjanJMRUBH8NGg4hg+EzjqicRalVpKjTiSb1BqPWVfqr1vsk0r43Wy
	 Zd0RQ8mPsHgm3CPJSNyU1tbDbH5EEX8pJVZnl30z6gIp19dWfQxG+DHJlSzinNVBnEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WWOd9wlx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ikjs1Wl3;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED16C606A327
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 03:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED16C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WWOd9wlx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ikjs1Wl3
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2kLgK2452857
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 03:11:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z5VeJnwz4/sm28InEjRBuwn7cnvfk5WFes1/QC4jAFw=; b=WWOd9wlx+nGqB0d8
	7Uhr1RJvZCNKrfDecfAFW68iEq8eEppevbasIdWBuCOHSXpISC5Ubho4n6ZgeiWC
	jKCm72zywG+/3bXFRvEFhe4g2MvS8ndgiQTaMSFFdfZqHg+IDr1xv0RKN65Tcpt4
	Q8BmVjSMgTpkk6a1kiI6UksXe1TW9gEBQri4PSSXsAan18xUsxmXPBxlazGnQ38c
	uWZ65pDjnmU24N6xWUIzVxN8YjR266Fbw36ht/aDgS5ck68h4/Fk+JrnUr/w+r6i
	NcBUxMNqNE6REs3880Al7zGI4HhRdj7A8SEmPh6L0vnKQ/Jehxvi/vROlE+3cRxh
	zxFvvQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0uf9p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 03:11:17 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b3b45597c7so4579411c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 19:11:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795489876; x=1796094676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z5VeJnwz4/sm28InEjRBuwn7cnvfk5WFes1/QC4jAFw=;
        b=Ikjs1Wl3lfyXpwtAEA3LeX6fWGUpS33OMr3vVUp2PdzK+NtLs97ZBF15il+P5c53Z6
         4n2tnQKTlKZZaXr7W6W7lIPwgKqmW0dN7y6FW9/tqo8r5ZLO2hO6SfXA06gJnMInSe5Q
         2g5uzIMAYsbMtfQSl5ndWdcMLxXjG/35t9gO0xANAh7zE0V/925icKFfg+xNWeF9LbHf
         nv9jar9tYKlXzxO0/ojXBjdIlcdT7sJqWzydtnclRh6YXAdacUslpDtj0NeJ+BhNiNr7
         XcBZMcg0RyOa+mU1NOsPcAnRxcnWHWMcBjDliFORKIU3qzJKnBKN5z341xzNQAWBT+td
         cbnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795489876; x=1796094676;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5VeJnwz4/sm28InEjRBuwn7cnvfk5WFes1/QC4jAFw=;
        b=CmeYDbi4/D2Adbwbyfke9ELESv9bv24nMR8Fag99glfoWnmgPk/FJR6flQAQ0NeFM8
         5sbmBaBH9KznpOye8jEkVNUIO8fXjMKAFNptBMbO+nnmODUVyWhNVttvwhTz50tj8aeq
         q+yAtBccnguqjsk4/dWQnbbEtmqNzr9K+P8x0VtiOLwYYO5C/xdfd5ofl35bo3n5xOrZ
         8/CpVIlP8xoAoR2KbaQaUK2r1dLaiuYFuj9j9Bxw8KtSv2hjnurF/NCLCs2WH/quyDi1
         reO+9NPyIL4Kae1hLlKgHPk2DEtaa/Hr8QcHRG7ldU5+jP0OpqrQKp+7zkT9kjRkrphE
         MAow==
X-Forwarded-Encrypted: i=1; AL+hErGHuIo1jNBoEwAA/Az4Fsi1dahS+qtO/RYg5LvXdDCmZ8xJufMMdiq55bvRDWVnauLK+Fh72rkCFPQMy/8S@vger.kernel.org
X-Gm-Message-State: APuU4Z+1tmsOFTIj+l6rCAaIQsMHmW4RCK7vrEB4fUiLkHd+sLej+KJm
	98xkgkR0fqdKFZbJ2hGvX1RdY3I8fJkWCvbKO/Qh8nXEyDj/orIGvHiM+8TfgDMtI8sFxa1B0cC
	F0x9uDUtf8QyQ6BfYn4bQXXoMxOCIeYwl1oZ2mae64M1WmROEQlGNVVuI2XcXai1oqooK
X-Gm-Gg: AZFdTZdO3TPkUUH8XR+OkjMx2lIwEKzJpYQ7mOZeqtumunAaAclbHjPsYjQWU3+qVsh
	qJV9aRwsRbZVhWrMLNOoCCE8aajmtj1opRh8uf3mzd2p03B7MdKMxDCOz/8shwfSjj36AP0MF4P
	tPm5g5R8QzrAnis03dNIpWYLROzYeWyck71j/z+D8r1vf0W7n1Slc36jsSxJE+r+KE/fm+DSt+c
	JwwH69NU0SP10Dqt0ok37S1EgxjdlAWtvCWntuzSd0FzMBCMbCG7WbQK8il5E3JVBtkW7JAfAYp
	yHf/yCqU86ljZTq4MoPaLSTYdT1heMGgjgmLf+hFFZ5nEbRLYNnJgZ4J0H9IpM9HwUv8hIO57jw
	EqyYSkM8vaYqOdhX9nJcpyvMaCLDhvgBDWGY2+trDsnaJfgGG/fJ4a4OZsSHbENmHd/qS4gURTL
	QHSah3
X-Received: by 2002:a05:701b:204b:10b0:1af:2ba7:e44b with SMTP id a92af1059eb24-1b5567a6142mr15576903c88.3.1795489876311;
        Mon, 23 Nov 2026 19:11:16 -0800 (PST)
X-Received: by 2002:a05:701b:204b:10b0:1af:2ba7:e44b with SMTP id a92af1059eb24-1b5567a6142mr15576868c88.3.1795489875573;
        Mon, 23 Nov 2026 19:11:15 -0800 (PST)
Received: from [10.206.101.140] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55ff0e4e6sm24383285c88.11.2026.11.23.19.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 19:11:15 -0800 (PST)
Message-ID: <0596e698-a599-1f83-a39a-146b52569575@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 08:41:08 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/3] media: iris: Skip redundant HFI_PROP_TIER updates
Content-Language: en-US
To: bod@kernel.org
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>, stable@vger.kernel.org
References: <20261031-fix_dec_seek-v1-0-cfedf0c267ee@oss.qualcomm.com>
 <20261031-fix_dec_seek-v1-2-cfedf0c267ee@oss.qualcomm.com>
 <179501803041.2846709.479596500645471046.b4-reply@b4>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <179501803041.2846709.479596500645471046.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mdZGNm57U-9ta0DsHfP80f7mdgApRTgk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAxMSBTYWx0ZWRfXw+6/KPeLZas5
 THhgyv814Smvei22ejuWA8tsT4GQ9YUYCmlgkYUU8JaGPtYmytQnIljXY/wbq4XXbs+UR+VyS4n
 f4dtphj18rPD72C9h4GemUp6MWrMnrk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAxMSBTYWx0ZWRfX4xCZXkdkqgsb
 azmNL01Lg1mYE7Jvp0J5f9JePQBLxyDkJtGk34+Cv+Im/d4p4HijHpnGHhJetN59vzQa28gAJkD
 Xi/PmkcflvprXeneOLrvcpyce7nLm8mOAi0hm8ge2Z2+sJoPeeZ0WFiRqTN29e/poxTPG3CAo5d
 +ZjFZJogV+mnOXM6ZTVGuEUdYRzkgR97LOmJEwBS1syISDn25EzRA2IPx8ZsAJqt74O89Qdbs4t
 JWQ+zDdwqCqJQtYNfoD1AXdzz1aGeQGVRKa8tTI39Mhc9Ckt8LkII8C7Xzo1/cy6gE2zko/C4lC
 dlO/n46zmq9axwXm2kxHCLZoezjQrTCa9Mspr53l0fFMJamWYM0VflZScJ0UKrFYj9Um+ZKj1D5
 uXF17F82jvpr+06+EKdmJjQpcMDLN3uMlMiWlc6nrmg/JPxgOq3Q6fGRdAFDVcmYRBjDbUhb3aW
 dYDw04iZp5C4YzNoGJQ==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b050055 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=ZEpBKAdWhQgix3oRGUgA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: mdZGNm57U-9ta0DsHfP80f7mdgApRTgk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240011


On 11/18/2026 9:37 PM, bod@kernel.org wrote:
> On 2026-10-31 01:49 +0530, Vishnu Reddy wrote:
>> HFI_PROP_TIER is already programmed by iris_hfi_gen2_set_tier(), which
>> selects TIER or TIER_AV1 based on the active codec. The TIER and TIER_AV1
>> caps also define a .set callback. As a result, iris_set_properties()
>> programs HFI_PROP_TIER again through the generic cap path.
>>
>> The generic property loop sets TIER first and TIER_AV1 last. For non AV1
>> codecs, the TIER_AV1 property is programmed after the correct tier value
>> and overrides it. Remove the .set callbacks from both caps. This ensures
>> HFI_PROP_TIER is programmed only once with the value for the active codec.
> I think this commit log should list where and how these settings can be
> applied three times ? and what the sequence is exactly which leads to the
> invalid setting.
>
> It's not enomrously obvious reading the log and then the code how that
> happens and which one is so obviously wrong.

Ack, will update the commit description.

> ---
> bod
>
>
