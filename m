Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9380743CE62
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 10:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786444475; cv=none; b=U2zrPvANS1P43BHYMGn3eUdf9uPZuHiXd9ZLPbccILnXKrJp8OLn6Y2ejLop6xmSACa6IkbxKx2Y3WmAhnPgFaBUxwxaxLwOjtd8MzXce7T/rSECDWGvmd9DC+RNwADwUZid2tC7k/TDG8TXcorqC/oMrw/vvw6lZ8CKlJZ+vyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786444475; c=relaxed/simple;
	bh=khlQxXBFoIYgGCKdLKHy/O6Ag9LzLbpRU1Mf1asnSLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N0MMOjoYioo28gehaBMADHkGkKYgxFckP3zuieI5lKwjevFgMC28lhaOiZIO4+P53Rh8zHrDIutmbLsLIJczFKG0uQnOD95wdyrGi0LJ8q/TLrcJKtU2eIT4QUZnLr/pxTYA6+eZxD1CO2Gdv0/UUMHpENOl8Qp9ZTQrPn82n7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kHL7C/FA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UrmIEfkn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kHL7C/FA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UrmIEfkn"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BAM4iF1490299
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 10:34:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pX8gmMmDKg3afhYRts2RaqhPOxNS8pLkC/Y+vBXD8qU=; b=kHL7C/FAhKGInXCO
	zA3KOpoL1jYxsGz71CjF5j6uWbu02n6O38tEQp1ZcyNkVkB0zD8ljTGeGYgiy7Cw
	7y9wU+ofY5nqQrE41en095MaX6weRe0DVl2E4bPyDrVjBbqDo/DsIVbCTbQeAoP+
	VZzr6pcQx/2VyVShuYjMR46nBtyM5FPqXLzTbCLRbyc43hYTXxgc+wU9Q6NkftV9
	lK6Peguqszx/rCxk+DG9Ic4LZ0X6n0MJxe8+0FyETtGIOz245k5SksLmb7lwUMc1
	hGf95yZcZl15lfE9FGT1TrryvSPispZXkuPZ1UF7nOTLnc/jI8dVj/zrBLmufgRp
	68A9gg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyhp8m0w0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 10:34:32 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so13849315ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 03:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786444467; x=1787049267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pX8gmMmDKg3afhYRts2RaqhPOxNS8pLkC/Y+vBXD8qU=;
        b=UrmIEfknFq1aLfzZDf1aGkY0QiiNMT37pNmT7HpKVtgf5SRW69JMyNFDC2W3dnc0Z4
         4CcJcqBJlZFHqR4fR2grAInyPdDUOVvOAjX9OzumqKp0kMu1XxyL5PNX2eRnEiIUqmEQ
         KmmC93oAfXjaFlXM6WlzyqsFZB6r89HIurpmhhRCGf4WdVtPJZhVcAE8Z2GFQQXpx5O8
         bout68ADxNBaE1JtZaHIXtnQMEuZWZBNbpiIpW3N2oRD/Z7y++WszJ6+18GX5ldNJ3Tq
         4WObu04RYGRYra5oD53RdCBhRTYDi7VWFSugiipjssRj7d9Q+Wvsdxh1OGAMT0NJU+Oa
         Z8CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786444467; x=1787049267;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pX8gmMmDKg3afhYRts2RaqhPOxNS8pLkC/Y+vBXD8qU=;
        b=TclIyRuoQBo9o36Hzajzcx/TwqPy0lMBz0ZlYfVnJiolpwbPqD9NmlEX8lhBnnSwfE
         V2LVzugK83spqEMYn51J1oWX/CsMxevw8aqBvYApod037aHVW+VF2tLRcnMDiZZXcVaC
         eldd22dmn3XLVHn2MqGjxm2irFLB238mb/R1RMTJ6FSPn68UhzYEAhCE8tc2ZIu/Txyt
         xbGgHm6GRrB9IcruBZC747KmEGt4M6aaBAaAFx1Sl/sAWJNyKmvn4mpOwpY1J+thNmvY
         F7nTPGGc6KlH/0LpDhSnnv9hkGKXN3LvqYLwWN6aUw9uELOiCfMVjh4vzfChFPMndgly
         uH8A==
X-Forwarded-Encrypted: i=1; AHgh+RrWniJr292NAL0HFK6w7r20HgzXwjB7j9DBrd6q0OiiWCV4ovXCq1ao18ouPtjh0SG2311OzqNdIPPvQseG@vger.kernel.org
X-Gm-Message-State: AOJu0YxEBZBjxBhHhG3917RQc1bR1QkWGdk2+cYGps4nwvu+Hxbbyzc0
	5CqCKlWPo0FSZACA13r4TB6CGpih6BEUfJyR6veb6ODHrLZCZzZEOGyZ9nAd078BedSelOnfYH4
	+ogKAGOOoJ0x42l0VSbhYN5DAymM7ZMB/i/bnHTYAJ0YWiIsvlKyncMGq7k0/mxaBI9ja
X-Gm-Gg: AR+sD10/0VAn7CqMIhiT8rWqzjEUak/ZLx7gFG2EV02ovGcb7Hr37rtfMhl6jSthXkQ
	T2duEzDP35d5q5Mwul5DlsgmAMuO/2RjfZsScBzooFAwNjSR+la69rrva2Ae1Zu2qN8+XS/c11v
	HVrhqiA5wyUcf+bBKdK5jR22Wwp8ZgzkTz/inH2EZjoJ8TZxgqNKfqBu40a7u2kFxLz72sazQNs
	G56KKgY6tejvcL3CilXJ4mzUHgpVk80M4tpwkLZegLiZqR+rujVfdQ1tFYMEaVBmCxE8qj+Q3BO
	M//Zrq9I46ZZwp2+PlEmVVhyS7YpPHrvWPZ19BWKS+EvIW9cICvREVUvb4cPKJ9zZ8rYiNtBXk5
	m6afV+HRpYN4j196axSsWmn9Ma6x2tfnuUKmJT7b52PtR5+fvb1qvXW98QzpG0mmtsP58G//Jvd
	FeD5R8msIMDHZRFpMnh5XRhg==
X-Received: by 2002:a17:903:40cf:b0:2cf:41ba:96c2 with SMTP id d9443c01a7336-2d31914fbc7mr8892125ad.12.1786444467205;
        Tue, 11 Aug 2026 03:34:27 -0700 (PDT)
X-Received: by 2002:a17:903:40cf:b0:2cf:41ba:96c2 with SMTP id d9443c01a7336-2d31914fbc7mr8891755ad.12.1786444466630;
        Tue, 11 Aug 2026 03:34:26 -0700 (PDT)
Received: from [10.149.102.240] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f48547sm5405795ad.36.2026.08.11.03.34.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2026 03:34:26 -0700 (PDT)
Message-ID: <4bc060bf-b5ad-436e-a27c-57d5d0a89638@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 16:04:16 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/15] soc: qcom: geni-se: allow selection on 32-bit ARM
 Qualcomm SoCs
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org
References: <20260809-kuno-soc-support-v1-0-5e0ede4a0c72@oss.qualcomm.com>
 <20260809-kuno-soc-support-v1-1-5e0ede4a0c72@oss.qualcomm.com>
 <7f4qs6su5fd5ilecy4r72suk6mqvj7oouz7ahgatxthqavrfia@wxilczij4unf>
 <vxpntlaebf4an2wgebgbwk2rdkingzjecdgylqv36wmxtyqju3@hkip3wqgendw>
 <7cc49120-8f0b-4e07-a008-145504e00dd0@oss.qualcomm.com>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <7cc49120-8f0b-4e07-a008-145504e00dd0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA4NyBTYWx0ZWRfX1LXMtI+RBPcA
 rq/Ocz1dCgdowu3tUs1sM3vF3H+2Xog87KhRXUqIiI+uTuZiAJtzoWf+6xZjllmHh6M91lNHQ1o
 OfJb+jO1kInriJb8ahmOE3lT60/z2zU=
X-Proofpoint-GUID: Z3eLKIryYG-Z5Kf8JMq27RRo24N4wYyo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA4NyBTYWx0ZWRfX9xRnLiRqL83N
 Mon3SpzqS+CMitpYKoME4jJd5TlObYlyg65/69oAnJCd2lqyi8hHA2Hi0sF/AhfJOETb6z/1U1Q
 ZWbaCrCp0eCpBpxlAHw5Qh6PFmhfSHMrG5l0pE9H5tcY93oyz1Uy0hcxbicwEDLtjccwqO8yfsw
 RuSkQHpnFSFMEuz4bbZL3coKUCrDvSdGTUwFYkOhJy4/zgl841ddPVaWZ1WXKRqvtuvt6tScZR6
 QXuFzUm9aPu52v40wTxG3dFdaXgE7u45azEdcvJskGQdeimMoCKobZtdKqQGpUNXpF/9wTCWssG
 U5emfGCb3eiIPeyh2kxT7pWYjrcI3akPEa0i7zS+WTnAiHMU9d9zjqJAfKQ7sWM+MlXv6MJRHBz
 lw2dBXVkaR2yS2RLZYgF9lrE7O2RV0zhnfwNdSXS2dPUuc+tmk/caxixCdEvQItEGk5eP/ekaKk
 DCWZg9ctWKjyMq+4jfg==
X-Authority-Analysis: v=2.4 cv=RM+D2Yi+ c=1 sm=1 tr=0 ts=6a7afab8 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=RCP4fZz32dXd7NFGJtwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: Z3eLKIryYG-Z5Kf8JMq27RRo24N4wYyo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_01,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110087


On 8/11/2026 3:14 PM, Krzysztof Kozlowski wrote:
> On 11/08/2026 03:15, Dmitry Baryshkov wrote:
>> On Tue, Aug 11, 2026 at 03:48:00AM +0300, Dmitry Baryshkov wrote:
>>> On Sun, Aug 09, 2026 at 12:57:00PM +0530, Hardeep Sharma wrote:
>>>> Commit e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
>>>> tightened QCOM_GENI_SE's dependency to ARM64 || COMPILE_TEST on the
>>>> assumption that no ARMv7 Qualcomm SoC uses the GENI Serial Engine
>>>> hardware.
>>>>
>>>> Kuno, a 32-bit ARM Cortex-A7 Qualcomm SoC, uses the GENI-based QUP
>>>> wrapper for its debug UART, so this assumption no longer holds.
>>>>
>>>> Fixes: e10b198a94c6 ("soc: qcom: Restrict drivers per ARM/ARM64")
> I doubt this fixes tag, otherwise please explain the bug.
>
> How Kuno could be supported, as you claim in e10b198a94c6, if we do not
> support non-dts platforms and there is no Kuno DTS?
>
>>>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
>>>> ---
>>>>   drivers/soc/qcom/Kconfig | 1 -
>>>>   1 file changed, 1 deletion(-)
>>>>
>>>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>>>> index fd4d4ecd2df0..5b3c9d31fd7f 100644
>>>> --- a/drivers/soc/qcom/Kconfig
>>>> +++ b/drivers/soc/qcom/Kconfig
>>>> @@ -39,7 +39,6 @@ config QCOM_COMMAND_DB
>>>>   
>>>>   config QCOM_GENI_SE
>>>>   	tristate "Qualcomm GENI Serial Engine Driver"
>>>> -	depends on ARM64 || COMPILE_TEST
>>> depends on ARM || ARM64 || COMPILE_TEST
>> Or depends on ARCH_QCOM || COMPILE_TEST
> None of them are needed, because this is part of qcom soc.
>
> Best regards,
> Krzysztof
Thanks Krzysztof for review.

I'll fix this in v2:
     - drop the Fixes: e10b198a94c6 tag;
     - reword the commit message from "fix" to enablement framing;

Regards

Hardeep Sharma
