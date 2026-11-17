Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794902262;
	b=E+qbXfIMOVkeGueN5nUEDLEnM598UynM8NfdlXWRWGwi0yroZEeHhrA72GWxV+a5fal+
	 nW63ntN5ElmNjw3KwHUKfLYAaxItrOS0USWW1zcGNrBAdY87ebmf15b2LumwSQx8oxaB1
	 cdGucrv/gRSAxiyGYKzFpbV7iB9NBAtKj7JLrZMr3N2KbObCAqRaZ4R8ULRxyyjNLwOCt
	 hfCgnYZsuNTcsaLUb+NnZZMNhYTjifo/lPcvMIvbJC3k0fi9AWwTsVThJ1gwj+ekXY7ak
	 1g0+2ae/zEBnzzsh9FkMkEHFweT+JPeOhepnszSx3IVcS9cchtlrYQcFg8vm9gNFQgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794902262;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:Content-Language:To:Cc:
	 References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MLlCCShlOa+MPZ0JlAdJDjsDVBjSAOvo1zMk+KLQ9bY=;
	b=DzbWny7JYxVPkstFcn3q9dcX7kOoxG6CX8sImKwRJJN26zBkf9IdoN5cndoL6ZyPSqdm
	 Zh0Ymvrsk1iZREAYFlo7lbP4il2L0SQ4S/Vtq+ejM4c142KD3KSMLTolw4xuxqAr9+I2/
	 HyCDrcl22P/A1Xb+fTXuRET2vdpxH/nPPKIXf54sNnn9DhytcBnvuQVNmWaJImXhBa2c2
	 AN2d6OCFT7GE1bgCin50exZYCCoUzVTdrMa6RDk/K3edKVf9u8BbvEHEv3f/OAQ3+ZDbw
	 xzrrqv7dSMVM3G9afa3i0nYbs5M2s5WvqZiSm0Q4L/QdMC/hiYnfOdcC8eBywJRmFNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FmQwt4bb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PtgIgQWR;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA27606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 07:57:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFA27606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FmQwt4bb;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PtgIgQWR
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH2aGid3624321
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 07:57:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MLlCCShlOa+MPZ0JlAdJDjsDVBjSAOvo1zMk+KLQ9bY=; b=FmQwt4bbWhbkQ6Ts
	W0PvawoGMyhL7hp+98zs4c+/dRDaPCwScV6Qd0qLno4+F6QZpAQPfPvBisW/w2u5
	2+/mIo6vqbfVeWp+wIljKODwLfrteqTRWsCOFhrrrntOc/tabxQaQwyu2qGR81Db
	BRXlRLtDHnQYFQIOj7vW7TAiTOrp6IdkPTyc6s73IpDEtSldpOT5Vn2dCZMP9TAC
	TfG14XNeFsFoUZIRLRlekLdPmwnWxgx4yk6EA1OiGEOrhkurqtf5g8Q9N3GiaeNr
	mfIWtr9l5L/OUV9+OVyQhySbXXkVoshpyKR2XZtAeDehEG1ko1PFVFETR8I7B9Fo
	XnVbkQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j07rejft1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 07:57:40 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so5632348eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 23:57:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794902260; x=1795507060; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MLlCCShlOa+MPZ0JlAdJDjsDVBjSAOvo1zMk+KLQ9bY=;
        b=PtgIgQWRUPwyFAcZnIWuokqaMkEixi+NvN8cSjwIaP3QHP+XEUpg5FqsLZuAWQ1OKn
         Xh0juSRs5XAkC1QsJh0Wyw6mwoXleyrBkFKncJcPg2CmtDv1sYMuMt2xbIi76zneoNdu
         f/RtmDfH+eOdpnfOdfK4TlAS3EnyWJkT/P3gtGddMlg/AlVC+CleRtmlB7trhfFWHZaq
         smYWI4tX/Mg41evpCs0B/sJN/KvpgPifE4ZQw9oRF0GtTXvcWa4JoWVQAoyySRLNpScp
         HEzEup7LTZ05GudFCl3DW/pE3fg8F/1rt6FSd3r6R4tloENryKo0jjC2Btkafwz5pg0I
         fgnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794902260; x=1795507060;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MLlCCShlOa+MPZ0JlAdJDjsDVBjSAOvo1zMk+KLQ9bY=;
        b=07Hl8gYr9h8TSPWGnuD8hxO5YMkFT1Geylm7Qxcl2nR531k0LbK7Y+jj2HtWUz3tDA
         inBZLpPfXeMdMsrwHtpFrs/OkwqWu1Sh7XOzopmY1DE8AwCEzy8O6rE3ppW4n5yI9ddc
         tVxLrl4NDoyDXMS5OB76Ny8QjTeSNX9moFDBBKJAR59oLMFB/tXiJ5MSMx8DBbWf1zYB
         A9A4KQN6s4Iy4qk2iTlANN6sSX5vz+Zvom/W0NiwUVVy0BpZLA7msYxHqRSFk0YWUPxg
         wFe47EQbkC+kXEvhNnXU8o8zCmu0kkFJsg9UbKCNMQRFM2XO8q0kgFdeMkIHU1SlJe4c
         0qJQ==
X-Forwarded-Encrypted: i=1; AL+hErFUvhdBCeJ30gBMK70e3In+wVO1bOno5C1ksgmtQYCzbF5jnFbDBvch07+b3vdlq6B+VJV8PYUNC456c8ZX@vger.kernel.org
X-Gm-Message-State: APuU4Z/wJNH80wC9XiWqowIdYUUC/t1rqLyujiH4Xg6qAswU90BAhtEE
	u7b22MYs9txnoxunTKCIJfCTFy5ix3EfLY8AsmD5gP1UxYZnHb9HAkGRT80wfQihcCpfr8m6prX
	oiX2K9GKOUUtLFqMgcwKuZj51Q0ZeVGTNqvjxHlW+nYrUMw5hqEx88IaJA5+Fwhd/C185
X-Gm-Gg: AZFdTZeEX7KVum9sZU1D4xGNBhNei19o1Vh9mbRd8wmhMJR4DFfrxEK5DGBfz/p7NGR
	JbPAaaeisuMqfmHWL3KB2msxjh8gXshX2JHdKDCyzqubpV6gUNJlmoh9mj4JGfWLVPoRltxtQHc
	p425JwX6eCUoBMH3n8ESFC22CMm8gLrR1odZMe2A+3psroVkcXR0HkTxjKPAPO2xu9P+OsplFl0
	1EXX8bRNCATXl+69zmogyvDwuHHY29dBmToiOlSFV14Dhw8tDTXcmxMd0qsF1HsDmKU7xURtGmH
	hCqp5lG9wwtbhw+EPYsWS5KGnomFFXDpNfwLel0XMHe8GtflBGUY9ktfXdqb6V7plPLFYo89oUI
	DGPuEF8d8zi4o4G+tFB/ChkdVUVPMlTUoEsAbjM87pYaf/uySeO3FYOoExG154feYjZ6OPBGAbi
	mswo7Y
X-Received: by 2002:a05:7301:fd03:b0:36a:3ac:b15 with SMTP id 5a478bee46e88-37968993d61mr11889992eec.36.1794902260030;
        Mon, 16 Nov 2026 23:57:40 -0800 (PST)
X-Received: by 2002:a05:7301:fd03:b0:36a:3ac:b15 with SMTP id 5a478bee46e88-37968993d61mr11889973eec.36.1794902259508;
        Mon, 16 Nov 2026 23:57:39 -0800 (PST)
Received: from [10.204.100.41] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-380e0fdcc36sm6089673eec.25.2026.11.16.23.57.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 23:57:38 -0800 (PST)
Message-ID: <f3079c6e-36eb-0c65-2e46-c9cb0a371656@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 13:27:32 +0530
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
Subject: Re: [PATCH v2 1/3] Revert "media: qcom: iris: use disable_irq()
 during power-off"
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Hungyu Lin <dennylin0707@gmail.com>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261111-fix-disable-irq-safely-v2-0-8e13f68c2ef9@oss.qualcomm.com>
 <20261111-fix-disable-irq-safely-v2-1-8e13f68c2ef9@oss.qualcomm.com>
 <39881cfa-6f44-41fb-aade-041d9cdf2f9e@linaro.org>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <39881cfa-6f44-41fb-aade-041d9cdf2f9e@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzMSBTYWx0ZWRfX+Z9A2rW2gbtT
 rPIo4/4n76Feacw+UoXGU9KjveoC7f4jpqWu9AymC61Dy5kaiIxQtxYV/J/tKaCVDhnSuPLabhO
 G8tVSxEF1B0IiuUu/+YLvOtQOVt53AE=
X-Proofpoint-ORIG-GUID: Fid0_zlVJF2GVjqy9-8YALLRS4Vm96nf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzMSBTYWx0ZWRfX9dktVVujCq/A
 P5l8H9xs0mV9xEGK79h/zj09PePoREz7WxZzYW17glJrG61ZLevnezjH2kg1DC21Y1ZMHvvBh3D
 4xp6B78TVHYxHOnvHzWvMAzd6TJ7HA5P46zfdz9toS2wwDfrhBKEPciqTpGJO8rJPs8CV6TGSDV
 TbXbaxI/wDKndZDEtIN4aaIQzQjVZRdnYvsdznt0ZD5fM6pOdRm9TTAGfRACgr8XaX/q6+qSTIz
 9VjXCBFc6O2fne8m0+0AAUIxJO4UZ3SDgj7qrJRXmPUm7TAlPBBeYI3p2Gcj6C6qjFvbJCh1fB2
 fbK+/lAFOgbX1Rrzj11tbzUyJt9Zxu3DuHLJpRaFVLARb2mnNfKp+/vhVPCJ7UFEAoTPALCbzXH
 xIdV0qfADU4yYPqBw2y1BX3DcsSsKFI2h7IOxxHbzjVaOyMq2QoXkUroS40W8bhuM5bfjv+8Ljo
 N/0lkwlh79lMzmBElsw==
X-Proofpoint-GUID: Fid0_zlVJF2GVjqy9-8YALLRS4Vm96nf
X-Authority-Analysis: v=2.4 cv=R9uWitRX c=1 sm=1 tr=0 ts=6afc08f4 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=4gvInHfGZssBu6MVqJwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170031


On 11/13/2026 6:25 AM, Bryan O'Donoghue wrote:
> On 11/11/2026 09:05, Vishnu Reddy wrote:
>> iris_vpu_power_off() is always called with core->lock held.
>
> This statement is not true : int iris_hfi_pm_suspend(struct iris_core *core)

Why is the statement not true here?

iris_hfi_pm_suspend() is called from iris_pm_suspend(), which already holds
core->lock when it calls it. So iris_vpu_power_off() is called with core->lock
held on this path too.

>
> And TBH as I look at the code I wonder if it should have a lockdep assert if
> that lock is a requirement...
>
>  The threaded
>> IRQ handler also requires core->lock to proceed. If the handler is woken
>> and queued around the same time power-off is entered, it cannot acquire
>> core->lock because it is held by the power-off caller. disable_irq() waits
>> for the handler to complete, resulting in a deadlock.
>>
>> Fixes: b9c2215bdedc9c ("media: qcom: iris: use disable_irq() during power-off")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
>> ---
>>   drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> index 243bd845349f..1e183fc4e58c 100644
>> --- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> +++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
>> @@ -240,7 +240,7 @@ void iris_vpu_power_off(struct iris_core *core)
>>       iris_unset_icc_bw(core);
>>         if (!iris_vpu_watchdog(core, core->intr_status))
>> -        disable_irq(core->irq);
>> +        disable_irq_nosync(core->irq);
>>   }
>>     int iris_vpu_power_on_controller(struct iris_core *core)
>>
>
> Looking at the next patch I'm fully recoiling.
