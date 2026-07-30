Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1450F404BC5
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 10:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785409036; cv=none; b=TDULnLMaO6Mys0sWAH3hYUkfK4cm5f+ZD5kP8cH/hHemgZIxqx8VLCKSo+XPliR55GyTOZcNCPY0Ojv7flIzbIFeeygpfoJHYgo68TZfMYPktTqzZ0Wx1sOGMIagz9CPf46ZOjs3mUwgwBfXJjD1moTxet/LZhI8sknP8/kx8FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785409036; c=relaxed/simple;
	bh=ZPQPB3xBi/xKVbwZEUGRrv5xu6tvh+vX5h1M0oUIEzg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jLOWtYqRDEGUF5ZKf41k4YqVqba1NYlr8MoNxDlandz9Yx0Nb3adlvT0tNcxl1z/+Dm3AKB/+GKZvtQodcobgt4XboBcfsHoANlXGOfNFToEzwYnUmJ0JbqcvLHZcJ9jwzdbG00E5R5RgUCpUTDpLtLfpTqUZ6PQ/KVqrMmqi/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UuPMJMvp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cq66/Ozi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UuPMJMvp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cq66/Ozi"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UAuqua801388
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 10:57:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lSSgAkjVtZ/wW0D5KMiicODP9+dJfRMr/iPao2SGoG8=; b=UuPMJMvp/ZppRuvT
	IsBHIveztVxJwq5EzE4y03lTRjd5FmO1OzvDIdu+8v9Uhhk84G1buwwxfylzlNjN
	dWOUKnGYj6N92eAMoP8kqXUlcB0YcUHxqW/WZbK06hnQMLkF5OvAV6fcvSKDKt+C
	xF21myvTm9fxJy85+AbIjdkSRS0T9El8kIuo6gSDDRbj+bj2SXmph2UceSv2LuTw
	+r1BRmtLZdvuXkb2SAnB1BRK/SuUcaB2KxzqELYGStvqX/IqUcY6SBqnj3vSBN0i
	R3Ci4R8vAA0uOD1GxKbqWoMNUOukqbAmNwsSehkSnlqEaFa0jXBuFElPAtpL7t6t
	1PLtdA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr5ac002b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 10:57:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cceabd70f5so59627605ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 03:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785409034; x=1786013834; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lSSgAkjVtZ/wW0D5KMiicODP9+dJfRMr/iPao2SGoG8=;
        b=cq66/Ozi4msPRhbV1YC4AYckKS3/HDRhBM+YdqGjgTpjLPrpkKa+VqhZgcbiXPaakC
         y/+uwjQukwqi1V1MlaannBd3TlI5AeFIlUEEcCv3bezjP74QWYgLr0ogBUwzVqH0lSxk
         CcF1MFS7s5KskndpaGdwwaFE2bJ3ieRXQ1sQ8vmfmsY6YDjXQyq1BYFnKTX9QpEYiwm5
         +/kY9D2W8yM4hxlzjLR8FTKU7Pij0ad+mrViNUodt/8Xcye8iICEa9jtd2sg7TUY20vC
         LeIuaY4RTco89YHkyOFol1QEJ1zcjlcApWcNPo+iYrmiQJBF0dXZtEn7/NkvkvSlGtEQ
         e44w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785409034; x=1786013834;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lSSgAkjVtZ/wW0D5KMiicODP9+dJfRMr/iPao2SGoG8=;
        b=QKdgF1k8VHQn3YMcGwLx8UXJh+s09jv416QuZ3YzkwhHC9EG5DhCu5cDcWmhScLCpu
         c2gbGjG9fZ6wZpPyV2SjhmX6i+75E0e+G5W8JBynmAgebgCjdasvOStsrvWmHScIi8BO
         j5MDgaYmbOvmk5L5gK9v/012y1FwifXD+hCfcGMM9ymShMRUno3ZgURI2yKdx265w2Je
         F+NlRAEsxSQDqyXGidb41qca1uh9Ri7LY0sLQkRmreTNLQbTZQnAoBNsyzyj+DdGZY4T
         ZQlrLugweUNXWlUEDVwYkh5Gl8AdLRaSd1uRaWK43q1rrusWFEkBFNso9p2xVJQAnVs/
         AAoQ==
X-Forwarded-Encrypted: i=1; AHgh+RpvHeJwR5lVpydnLiKHoz/umGMhbKVYIpjZohCL+kErKS24RJc/CVLrxELmRBf2Xs2KvmX2no2hMbGpRZ25@vger.kernel.org
X-Gm-Message-State: AOJu0YwPuO2DzpVeDVz4GL4RkjKVjW/pbaLf3wRkh++T5HBBh0xvTzHV
	C/MGu9uF/eEFJlnrTd/QBTptpWazn+7nCrIEnN4wwMUwp/EhzlIuobeaxCmaeSvpzIJhAdJ29w1
	QSTofWBEa8O0/Q9jyPIp1Ue+gFf2RjyihEX0PsVBCnJa3n5FKnx3GxOxRYKTzDJ56vk/Y
X-Gm-Gg: AR+sD11RqnUvEAG/b0ov+rdmfFRMagjAF+dMgJYhMMbH7g5J8kZGA/NSD+9OnKMwpOU
	3lKG7FLZPtnvM0SnprC4l2c9W2Az5+ejUdbZatGmKQ1HSXTVZV0T2Abb9NTuEoBj/fSceRU3r11
	Jlob1eykhnEQ5CxDenZx72RVOiqZC3pUHAPEQFIn0ojQSanfgfeqJEc1Iwe28ED5PUzNHC0zl8J
	9eyB37cD1fJVTVfXHzN1A3WJ4JP62/lRQtVKSc3xj7YLzcHyESDdbWuOwjXzANGeRFF7vTPhrA1
	vaT+Toj+3EcQY+tsW+gnrVtvo83IPgiJFBCv9+6GuszoyhecWzb8vs2R4/q17Qgq3rfYTuxKZWb
	Hx3FsjDYhqbryG6du9KtATmkX5EQ=
X-Received: by 2002:a17:902:c40c:b0:2ce:fa3a:45f7 with SMTP id d9443c01a7336-2d035be39b9mr23128595ad.16.1785409033685;
        Thu, 30 Jul 2026 03:57:13 -0700 (PDT)
X-Received: by 2002:a17:902:c40c:b0:2ce:fa3a:45f7 with SMTP id d9443c01a7336-2d035be39b9mr23128285ad.16.1785409033257;
        Thu, 30 Jul 2026 03:57:13 -0700 (PDT)
Received: from [10.218.5.114] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bc8310sm25005455ad.44.2026.07.30.03.57.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 03:57:12 -0700 (PDT)
Message-ID: <6b52355a-796c-41cf-b604-ea866edd80bf@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 16:26:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] ptp: qcom: Add PTP driver for the Qualcomm TSC
 hardware
To: Jakub Kicinski <kuba@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
 <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20260727-tscss-v1-0-beed14e72510@oss.qualcomm.com>
 <20260727-tscss-v1-3-beed14e72510@oss.qualcomm.com>
 <20260727162008.2b93959d@kernel.org>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20260727162008.2b93959d@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hXwi_QwWrJyTqQVMdixvl8OwcmRZ7qUh
X-Proofpoint-ORIG-GUID: hXwi_QwWrJyTqQVMdixvl8OwcmRZ7qUh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA4MSBTYWx0ZWRfX4O1bEkKbGMTz
 89hXDgDKUzv5/OhWtpoj6tyMa3qvoGHMGfd9ajBmhI+kphyRLjmVvEHQcBYg3bMGRiTBoaF+dRg
 Bfhh+jDFS0fifDUbc2N02/NWUK5LB6M=
X-Authority-Analysis: v=2.4 cv=e/U2j6p/ c=1 sm=1 tr=0 ts=6a6b2e0a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=-goOgsFvLHZ0uZs3yIIA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA4MSBTYWx0ZWRfX+Fa43NkZw7FA
 DeUQ9mhubG1plUIuA8epuIoMj+5U8rRq6TyFfXwyIfA5b6OxCoNNb1tL7cXucyB9xTvXfx7cUFc
 zPB/s+IwYbYkZfwjMBt+chjDUhSEQnBFcsHiVc6cyTM7sgynM9H1hGbzUYVTmsh5Q4UZVv7DaWw
 KWrQAyzXy2hhxIn7h/hbAPbdDdYMbYnJorACw9oBSwYlWpbhlvm5ehYPxQk0J8GmkZu5sd83Wrt
 YLBOxpI+nyIGcQZRSzuJMWoIp69BWhsKNYqWrxoSZBEbdkoKWSFyvdxf4FofVTXmGIGgDxcz8dw
 WurjPyr04uJdIfTP7HminQk6ZejBpf1v1bKsQ58fpdj7wjBNrx6OJbHyuNVRQgmdAjxaKkheNtz
 FFF9Rbhi5ttfK5W+RFUYdjYYSdYfhB7dfysUpAhLUK/sk9ja7MSyIdetSDdjD7h8Bq7GzKPlF3V
 vt4AoHssCH9r/BjJ8lg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300081



On 28-07-2026 04:50 am, Jakub Kicinski wrote:
> On Mon, 27 Jul 2026 19:40:59 +0530 Imran Shaik wrote:
>> +static inline void qcom_tsc_split_ts(struct qcom_tsc *tsc, struct timespec64 ts, u32 *hi, u32 *lo)
>> +{
>> +	if (tsc->soc->rollover) {
>> +		*hi = ts.tv_sec;
>> +		*lo = ts.tv_nsec;
>> +	} else {
>> +		u64 ns = timespec64_to_ns(&ts);
>> +
>> +		*lo = lower_32_bits(ns);
>> +		*hi = upper_32_bits(ns);
>> +	}
>> +}
> 
> Are you sure the compiler doesn't inline this trivial function with 2
> callers even without the inline keyword. Compilers seem to inline as
> much as possible these days.

Sure, will drop the inline keyword in the next series.

Thanks,
Imran
