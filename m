Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C206E34A794
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784621505; cv=none; b=B9i9MqKLxyWS+K0XXUe+6kqXmOBHvHyGfgUZE3/yBXeuHoDtnZYQvECblpWWTvDyneiYxkLbLAyjf5pTuh77TptHV+ixZVvnqcpBml3dcRYvxsLOesKoPXnQIOITaHoStv4W8ZG5sVAvhRqz1Rsp+JBbqN+cp07gmA2dVUM0hbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784621505; c=relaxed/simple;
	bh=Ji6hFGQvBj2zF7FE7vbkIkExGu/cONKSyGaXjsPWo6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IR7CSGtdPZ16LhPuVjifYpxuaEDL02D9s0+1fwtuNkvqge5CXNrlSIR922TWxTxqMzwXAL7K9Arf6NirWLZVe0PsCUe9X9uXjZqsCTYAGn481ok5jai+f8tGDL7oLUCxKo5N7CzIAOMEL5kpt+jjqqRc18x0XB2YOKn+gezv5Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b/zlQRLO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h/qFnKyc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b/zlQRLO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h/qFnKyc"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L67i984107054
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cBqUUB9b9W14Exf/ItpHRFEySzEIgcyc3Upy0OSEqCM=; b=b/zlQRLOLRxZmV/O
	xm+DGgaHr0GZRPln36reUSZxtvYSMgLCH30n/Rd32nLU31No5GX0sRlQAz32xUBj
	qatPBMZWDzQ6r4rTHsByxN2gEIWTkYsFnoD5UTmF6gCflSvZwW2yxJ6h1ZsC6rk1
	jUq1k5Hn0kA+KiKk9extp0FVgplRplLutIFhYtgs3/Z1hXfgRSzKnuj5yc1RR0mN
	6cjm/hjXsRorjZ9s3AmMyKYGsAjB2LksieLGITWYXgqyY/Caohju9KtsgQ+MtVXf
	lwAbnUFtC/2HPy8pz1BzNs5lz/iQ3I5d0SAM4nXhzRvtCGuQ90FR4PuyyKq6JqKV
	RHC+xQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhvqn9wk6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 08:11:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92ef7c6e9b4so171509285a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 01:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784621503; x=1785226303; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cBqUUB9b9W14Exf/ItpHRFEySzEIgcyc3Upy0OSEqCM=;
        b=h/qFnKycI85hasL+7mQYlwxg11trUKhb8jWDTTVPLZpg2mPlLPno39uv6uexVusKR1
         xN88BuMZP1/r8ZwHcTIvmap/v7VWKdMBDqb+aH5NUHmLIqrVmQICdLdLAkiW01XBNh9V
         qLZKW40Jsr71ut2quN1EbYd4X0J4osod01PN+W930+DsmilVecvT8xM/IPC8itYuXlv+
         UVgqvdgEEOKdyoxnQdVtJHg7PRuQQkBevS6WO2mvyozUVZI7Zeo63GvTKZRPbcxUfxS4
         bJ6BlOdh0fIMh1v0elQhoQyK9H1ZVnVVW+27WSZ3csUfl2sHO1lsz08i1nBBIKGlPK0k
         S9KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784621503; x=1785226303;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cBqUUB9b9W14Exf/ItpHRFEySzEIgcyc3Upy0OSEqCM=;
        b=LWgnbe8Rru32znq3DhXUiMyAeekCqmDG/+alF5kF3XuHpaj7Bq4u+ZTKrLvqXcoZKm
         Y5AmzZ9njGQSLZBCwvKSWra+dmXjnZ2XT/DxUUxGXceS191ufk+2BNS2utCFU2tVW+Os
         x2Nx6fo/OCU0EsLliGCWxzqpuZItX+f6XnGvX3fkkm6zW1fK9t1g/BcwQaoyOBDA+tbD
         /JvBFAMeplsV5bVwzh2W9BoAbx4v5nW5qbmyQL1t5GLriZh6A+W6QprpvoOp4DeaNd7a
         nQYBzFo2kRfLXvFhPCQ0EJcbNWWlsvOITbE5bcTRJuL3ZZmbQFKy6PYaqNiGVnI4tN4X
         c2fw==
X-Forwarded-Encrypted: i=1; AHgh+RomDoGZjRc+VIterAlRJzNFuz8IzTLQA2TzBJRw8lZQ0nezYQrQCscwBVNW5tcIga9jFhvmi8FuAO2yRgxo@vger.kernel.org
X-Gm-Message-State: AOJu0Yzefb3joMzGvBdduOLDgVLva9gC2hxGsZCdsymDTfMDMedB27rQ
	WrrduM1Z7rYC5IoiVzxXX+hUEZhC2avg0DfzV+qmV2PgW7sjHqsM3gqXvfJC+p0+9TEOFPL+aAK
	Sf9Ww9ln24XNTMI4yU5GSD5VntPB1kEQ+BsmC4/UjFhgAw3vLOD2NRRElzUJfjl5XYQTq
X-Gm-Gg: AfdE7clMkIvRFj543GfeFBqj3EnlDtywJxbhZ7mfuV5Wi0xSpcYtGMiTGDRHXduEqyl
	QRLNDerOjsxCOFmUeFC+nL5EKo69U50SRTWKnQ6kFAox5c5BTumY08enHPpuJF1nsxPP1rWof6O
	sFJk2hlx5PjTT7FzqiDyt1ATF3BfrThf6J7wL/SHDYXoYWRCsXQ5lHfeP9RFouIvYaoAY4+lgZv
	qoTMFimfWVRJb7ELS1VzfqC4i9/PYD0lb1c6WE07X2q0BcLPFQzifcBdXUo5ZDc+RyNNzwalGS3
	AmmOagH3gPBknRjPu9TexRaiG+igqMlwvt6NmOfAMghq6pPNT16v+/Ez2sFmgpk81RgDat4qdk4
	v2pLweYtsoip8XOpkNmTVMhSJ
X-Received: by 2002:a05:620a:1986:b0:926:e8e6:3c28 with SMTP id af79cd13be357-930b4329f29mr1587145785a.7.1784621502936;
        Tue, 21 Jul 2026 01:11:42 -0700 (PDT)
X-Received: by 2002:a05:620a:1986:b0:926:e8e6:3c28 with SMTP id af79cd13be357-930b4329f29mr1587143685a.7.1784621502534;
        Tue, 21 Jul 2026 01:11:42 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5fa23sm556382066b.39.2026.07.21.01.11.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 01:11:41 -0700 (PDT)
Message-ID: <d96f928b-76b9-424c-905e-500b459dc8d6@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 10:11:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] media: qcom: camss: Report hardware version via media
 controller
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260717-camss-version-v1-0-7ed71fea95e8@oss.qualcomm.com>
 <20260717-camss-version-v1-4-7ed71fea95e8@oss.qualcomm.com>
 <f0cd0e8c-3782-404f-ba75-8e339ee678eb@oss.qualcomm.com>
 <CAFEp6-3m0LesW_QUEPc=wLbBOMXo+YXSSw=5YpZgg3P5wsz3qg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAFEp6-3m0LesW_QUEPc=wLbBOMXo+YXSSw=5YpZgg3P5wsz3qg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA4NCBTYWx0ZWRfXx9yieGNhRJXS
 hlV72x+A7/U+l3nH8XY2E9yvVHJWMAAh/iUiG8yYN3fD9xvaL+NqihpqJHBR20Eeq+IhcwQuNqY
 5lm2fXf3NhtiYTPB1Wne5ZY2XkZzbZCM79UIotMUNCSJpaqt5ikkZa8FXBM2ccr7gbGaim27oO4
 AvyRL4UDSjiZ066oU6J8zuoYDO3R3uIJxFpcVYNNedYIx40K8HBeUXb0aRvDEZCWWSQ225QTHDF
 nvrDrf6GH2bRwkNwFIdOwv3HQVzrFvO5RrDU2kLqhRtbVs7SqN7R/LGmLTcDkQht9wfU3ELET/2
 acyyKzbygEZ4zfkFfEAkHpk+TJuQp5dhzijhV/+BVJQ0ydnTMLax2mItCTUNN33ZMT4FCNj7zYc
 tBfOpG88K8Yn+m0ZX4dv8pMozkmhT/7Ccs1TvpiUgNE0kydKHfITwvcl2RxIfADIO0/wxz6AjXE
 cK5rZiZlnYqvDym5Czg==
X-Proofpoint-ORIG-GUID: y2AidrG0naK-lgVJkzHuSh7rg560yeeq
X-Proofpoint-GUID: y2AidrG0naK-lgVJkzHuSh7rg560yeeq
X-Authority-Analysis: v=2.4 cv=M5F97Sws c=1 sm=1 tr=0 ts=6a5f29bf cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=dNYAEBq0_u_y8s8JZjsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA4NCBTYWx0ZWRfX/+FQ1tqCnLrB
 Ene2pbak2T+FUyZcVU2znx+6aFGeKjTSwSa3ao28RJZo9S7IxyJczAuBQk4QViM3YIRx0Hjl46I
 2GoLitBZb5erb6B/f9kbkefCaVgl3QQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210084

On 7/21/26 9:55 AM, Loic Poulain wrote:
> On Mon, Jul 20, 2026 at 11:12 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 7/17/26 4:20 PM, Loic Poulain wrote:
>>> Populate media_dev.hw_revision with the top-level CAMSS hardware version
>>> so that user space can query the exact hardware variant through the media
>>> controller (e.g. via media-ctl or MEDIA_IOC_DEVICE_INFO). This can help
>>> identify the platform variant and adapt behaviour accordingly, for example
>>> allowing libcamera to apply quirks or enable features that cannot be
>>> discovered through standard V4L2 or media-controller APIs.
>>
>> [...]
>>
>>> +static void camss_read_version(struct camss *camss)
>>> +{
>>> +     u32 hw_version;
>>> +
>>> +     if (!camss->top_base || !camss->res->pm_clks[0])
>>> +             return;
>>> +
>>> +     if (pm_runtime_resume_and_get(camss->dev))
>>> +             return;
>>> +
>>> +     hw_version = readl_relaxed(camss->top_base + CAMSS_HW_VERSION);
>>> +
>>> +     pm_runtime_put_sync(camss->dev);
>>
>> I think non-sync is fine here
> 
> Using asynchronous PM may result in the runtime suspend ("work") never
> being executed if the probe function fails later (read version called
> from probe). From my understanding, a subsequent pm_runtime_disable()
> in the error path would cancel the pending suspend request, leaving
> the runtime PM state in a non-symmetrical (unbalanced) state.

Got it

Konrad
