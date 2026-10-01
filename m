Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117743AA504
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 08:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790842576; cv=none; b=gsarGT5lRI6Ja2TI6Id8FRUfLckSZBGYrbg+oT0h++MFtIr2GXbBvqAljFczTJHCHG7xewxeADQbr6hlBqQyE3FiUR4qIoS6eEoZM7AhK4lmQg++9Q1JLIaQPVriyYzQXjs64YckCljX4QByZwI/e3X5CpEsK+a6JBH+S4PfjXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790842576; c=relaxed/simple;
	bh=/1DwrtXLUl/SM+2pkFpXTJgQKtSS4VCZ1/ENKW4q3t0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=reMOpdtvznMcHzgsVxn/cPO1yDx4M9z/eOZ0mH//DFuCfMryLfoCnQhARabuIunam6ToLd7x3K6JMkma9o27B9eC1XT56cRcEV6TXf8PlSp0pAgh1+VuVJXX65w44hOk1dJUL77Vl037xlPyR6zQV0ynM//T6nP6/yTsdo4GNHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UdllZzkY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d+yzmMSz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UdllZzkY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d+yzmMSz"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xawp962446
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 08:16:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UbwMEoyhtt/fORRnWenyyzMm1ZZmj7FoSP4RFKxRtPg=; b=UdllZzkYWDkK7/KK
	xaoDcsiMXKjfj6cDd8ySh7ZrkKLDSOYOgkPMaFYADhkSj8V7O9K+VM9AZfIV2YYD
	zxTAULs8+UKfxPmEdni2F4gDIvp1nZq1dwQW6t95TZrIzainWB4mScRNEMl87ngq
	eSng2HiZxC8jQN3SxqFX7SerJ5OQq8vXY61Ta0wa4HuIuyumx/VFPpVWRiJowV6R
	CM6KUU4Iazw75qwl9aaVZyZu41Puk+tr6i5MXrsQQ7o50n9vG75kndNjSuCmB3rL
	jEepRG7wt7DguimbJVFK7ql/cDxPrswL3ogMCUW4xeAsXtr7VcEgdZXSrvA6ATUx
	tMg34Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h16wctyp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 08:16:04 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cac495d99so15429785a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 01:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790842564; x=1791447364; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UbwMEoyhtt/fORRnWenyyzMm1ZZmj7FoSP4RFKxRtPg=;
        b=d+yzmMSzl3XLCWtrCRGbOiNaIVplCTlbWuWPrPoTxr9jAONOGRbgmY6nakg6TH93a6
         O9FXDe8cgX+oSdwsoib/+0lXpRYeFgwiVddFsmpJT+Sd76NkfgyzSrjuBtbZdeqrBcrD
         6mGZNI7wIr/uobQMQ3uFkZ6pgFHRnpwlKyBwVaQKONGFRmcTjAsChDJyOMrwt1cFzjYK
         iKqmtOIgm/fFhC/1IKNiGyQmEZUU36bsSgEuKhnC+I0r9aHmTsZGmziK/Xy1XviBLwT9
         6fiNGiDJtKr6PEKADlv45X7zgSpMmPLEtoqzQwV4IJt0bGJxEH2hhtEqQSg+yaPwzjqd
         3tYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790842564; x=1791447364;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UbwMEoyhtt/fORRnWenyyzMm1ZZmj7FoSP4RFKxRtPg=;
        b=iyfm832TXWTyoEk2fGJ/BKsg1Yafw4Y3FZFOpflBFlHH9v7QOaw8TfAaslQHLacMRo
         LYCMypO3L1fUdaZA8hpiW32dqhkn37MZp/8xX9dK0xRCDNZCljb7zLPHhkZ7X6/8Gtky
         Oq8wj9rDI/y/+r30y55tzzeHNzdt3aj6N86cK0p9UygyITVfKNyqihQXCjNo37qjl6Cr
         RrsG66t/1ajqBYD9i1S6S2NuZ5UsNGSQRufcZCr7Iq80beRz6tc1vzZMBZtnXEiwBsPm
         CnrkgXd07LLy7+aY6Ze8IlwkuyfABN4LptjjvQie8LSfJyBoYG1qc/txNN1oenavpXhy
         DO7A==
X-Gm-Message-State: AFuF++kGF9BEOBWo741AnBLJGDxIBnS6yk14duKVdQPyB6x84pdnbKhz
	XM/CWVhkqo69FpMPhcVtwrLvFwVrPgDSaRla1x6jc4XXCDHj6VIi7XSfYYdQgS+Oax8wtHjdf0D
	1C4oLtIhdfBlwnECPXvx61y/rCmC+AgbpAHaqbwJKXioMJDHtVovF5H/NSeXmkzRqhzEFFJL7qp
	Gk
X-Gm-Gg: AYBFou2IBVUwRNik9CKs2JjJXUjBLEJwIMnxJPt2qTuFtuHFnVKhtGZ/RVEz0fDuMuT
	BWR+mgCS+rZ+LeFwDS9GwmgsXD3kd4nVaag2gMHWYMBzc4cthjAVwKX9+rLT+9Go2fw8qP/DHJs
	kNllINhF+8ODG0qv9nD9VlU4Y0/9fLJtmIKv8gj1BQWDx5jcDIqB59UKke5pmPEvaHRzRggszrd
	61w9u/ahvub6tL6JNsRLmKBII6Jck2r+QTgbevPtWaEMlDbAPmrvWvESnDGMg7fV2YjadWmMz7s
	iRzcLFJadWTRXXm40x7Pqh314h1gVdoLsgdxFLF0rjnkxKHvHZxb4bcVwOQJxr4MgqSZNZVPCBD
	OACHIFeeYcVAYeNjeu+HmrA==
X-Received: by 2002:a05:620a:1a23:b0:939:9205:4d78 with SMTP id af79cd13be357-93ca9704feemr635880185a.3.1790842563977;
        Thu, 01 Oct 2026 01:16:03 -0700 (PDT)
X-Received: by 2002:a05:620a:1a23:b0:939:9205:4d78 with SMTP id af79cd13be357-93ca9704feemr635876385a.3.1790842563375;
        Thu, 01 Oct 2026 01:16:03 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31d86372sm106000166b.56.2026.10.01.01.16.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Oct 2026 01:16:02 -0700 (PDT)
Message-ID: <67eb0b53-6c05-418a-b1c7-6e7264bf794e@oss.qualcomm.com>
Date: Thu, 1 Oct 2026 10:16:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] clk: qcom: gcc-sm6375: Use common clock controller
 probe data
To: Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260930-clk-qcom-gcc-sm6375-rework-always-on-clocks-v2-1-eaa893a6103e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260930-clk-qcom-gcc-sm6375-rework-always-on-clocks-v2-1-eaa893a6103e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzMiBTYWx0ZWRfX0FtcXTaKnx0y
 Uerhk83aXbX4Bg8vMIhfEtjOca/+3pbcUaaUtdZhOH7+DhGZ/uybsl5ZX+zhKL3lE1hjoXVgVaE
 /+jgIin5x8eMPlOTHB5RbJSE5SKSX6n8CFSet9pUnQqRObd1SEVcIlclxK7WWV8JYk8XK+m/1Y7
 vpOXzy17s9kl0xHvVoGydmZqo8d3sTk+KKRggMl5D362AHBxu9C+exocRquvPeyCCHebbhJHUS8
 BW14S/NuuPHmcjghpoTwHNuijDb8VWwkN706FnYkK6VjBweOPHGIwpmR9CZDSuNOROeQhF/GBfG
 FpmMSCFjXRZAiL8A1VSHH+yuOS5PsaYduZuPlDzMoeUecSdJaQOH84pyec7zemkNaHoN3/ZVbk9
 9NcC8z8NXZN6r0Mjj2uva+o6ltsKcc7sCYcMqBeG0FTh+baJmVdbezjviykpecBNMDG3oeSzkiE
 hiSy+jH+z0xpgN87siQ==
X-Proofpoint-GUID: 2bfFYdwMKNBKzcrusuEN4i9eW-O-_pmw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzMiBTYWx0ZWRfXwb55c22K2e0m
 4X9ZSo7a1ZWxceqStWmy1ZtEOZI562Q033dVGPY7UOg7YgK2KH5fa1Hgo3YUDDqRuL/g+3ikQkV
 im3GP1g8pawzM8Efh28XAAxvmp/VS3M=
X-Authority-Analysis: v=2.4 cv=S51MU4sP c=1 sm=1 tr=0 ts=6abe16c4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=n0B6JTkGe8lfbm6N72oA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 2bfFYdwMKNBKzcrusuEN4i9eW-O-_pmw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010032

On 9/30/26 3:53 PM, Abel Vesa wrote:
> Move the always-on branch register offsets into a critical_cbcrs array
> and describe the DFS RCGs through qcom_cc_driver_data.
> 
> Associate GPLL10, GPLL11, GPLL8 and GPLL9 with their existing configuration
> data and list them in alpha_plls. The common PLL helper selects the Lucid
> and Zonda configuration routines from their register layouts. This uses
> the common initialization order, configuring the PLLs before enabling
> the always-on branches, instead of the previous CBCR-before-PLL order.
> 
> Use qcom_cc_probe() to perform the common initialization instead of
> open-coding it in the driver's probe.
> 
> Assisted-by: LLM
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

You may want to adjust your system/project-wide prompt to not
be so noisy in the commit messages

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
