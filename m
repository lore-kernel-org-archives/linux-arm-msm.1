Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7667F357CEA
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 12:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786538556; cv=none; b=TbshsIyMv7erbX2U3EA5ofOmrtWe4nX+DVcUrdy4w+YgLRb7vn9GqrGKoeUbfQhs06mY4Tr16DJ8Jzs1nKK8vrlzrrKm20eBHQFSelv6qJYYrVxithu++pefk/6V6QDoqwWynXmcyWvWgQRPgsyXa1+/fCu0sArJ59P2D2QlRZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786538556; c=relaxed/simple;
	bh=HT6odfgIm31nAJlXlSvWqpoui4IahVtMLX93lrDvz0M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u9Y9rby80dWU/RgZBExjXIZCb2v9DZ5YfgtpooMM/Nl9RAOD3bTfVBT9S3Tt+VDelFvSL4WCMdh625Icy1qK/MMOgmkxKbs98njVTV3rsFN0JtRSsSo3wv9W+PrH4DKji25gb97n3pMk0DVDGsmErmhmJX6KPfnTDMWlIFfcgGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bu0yGjTw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PzIQYkIV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bu0yGjTw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PzIQYkIV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CB4Mfg2860276
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 12:42:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xJ9VAtOW4dvyLTFJEa/GHt4ssfJ12G8OyYzymmqsAo4=; b=bu0yGjTwPU+skCKe
	8BcRSYnznUUuD/6w1Uc8YkK7lL3SaHWK8knn2W8SUaHNt7KJPNtE5VQQD28lODUR
	/YypukvxjsGI0gq7dWjAZq9sJpdN3vVWZkyM0JUOaP+p2tephTXzXOakodBX2tLK
	tK+yjGBVqJ0aZ5+m6bnmgAA6A5Wy/gm5HXiH343weEyOKnDfkXVG72LmK6XhtR5t
	/ALnWf+L8jx+8lqXL5//ACRzkIbzTz85vaZtnOktItKXIIHG9StSIEpBgjl8DWWT
	wyevSYWfYY1aErU9WjhkeCch0o7cdLNXMeXmLpcwVbnTGXRgKl0UVmmoovb577IM
	AxtpiQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0mnd93b8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 12:42:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cceabd70f5so26346045ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 05:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786538549; x=1787143349; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xJ9VAtOW4dvyLTFJEa/GHt4ssfJ12G8OyYzymmqsAo4=;
        b=PzIQYkIVRgqculSy6QeBlNq3s2VvaB6mrAx6nYh/1xU7WEQSBMcAJKdmDxQjoPkTAA
         t2SofXHTUL7fRIzyp9Kzn7fFVRVCsGcg/ZFXQeHf6ntZiLIzDsmgZ6ci5xkykD7c0ZGQ
         G6XhUjYtBIKJl/L4EDzpdzt72Drg5Sef+VceDQdfqv6ZGKapWIInRyM7PnYrcd1iBxpV
         g9q7g9X0n1SHbxLX4EXWf0rH/UedFMmnKdyNr0qAFnHvQ3fHINrT8COi1s5yaSOKY093
         iF+yaXc3f2hnwzwCNYqlSQa+c65wfWdvgvmB3uLCXK8CcImptH9VtPsOpKJEsQx4d6Mr
         Iz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786538549; x=1787143349;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xJ9VAtOW4dvyLTFJEa/GHt4ssfJ12G8OyYzymmqsAo4=;
        b=QpYIlD4Ofg3dIXL0j0KHmDHpQPXnV0lpyFJ3tUzlO/RZGudYV0OSYTvnU0re7n5IdI
         oplWDUhB9FI01SzaUbztmstx569mwrsreg2CTK0QBLPoXJ1vpsh439G4U2tMuNmsrHPi
         Oi+YAA+slpOtJKlmzG+8FDHB6ARmV5qMYI+t1BP3BouIKzvt8Vub6ntJdjlyAPKoqKYO
         fjiY2zRd/wY3ohZPLx+rfUy+dEte2N8rYmA6ATwER+b0Me+uQtwz0LI6SUMe8cH/cf7G
         EyNSN94dDJXyh9Arw68v2pUHZyJWODpbopiU1jSPBURgCKngErVDin8S14zvyW1NEhpu
         TIEA==
X-Forwarded-Encrypted: i=1; AHgh+RqjsKbMto/kxTYBIPtOGV7kmzmSJLDQQGCqVWfWhjTvJ6Id0UD6eQD1Cvy31ACVVgtw/uk4jwiUMmsiJEgD@vger.kernel.org
X-Gm-Message-State: AOJu0YwFgizIUxPLpFmHLQf4BUPPz5XysSNi0XOzO5K/lhC8ZcsRQZW1
	WaVAORLQ22JXyuf+ikxY26c85JcHzs451LnbXIGSpn+wC7cDuUi5JoxENH9sh2cb/yoUlPlSPJS
	FsePGJzZmM/GDo7+J3/J/1zEQ7NtgevYsOsPfQQx2Gg+iWHDoUt1/1PrBwmruQY9/liQe
X-Gm-Gg: AR+sD12Fx7MsF+s9py3L0UjMNh4EJkhmbJSYJTr6PTbIHmngbQBJSTf8Vam24orsQL1
	+kYbfS6kCnFOcws9jO90gmU0AqdKjJzU1Kw+X9e4XV0huTY3eeAHGfYkwRl+WrO8dU9ncxLHTai
	LNiXpIvxLuOfwZX2/45cSnk7C6d2YoIxgU0y9ZPXN+FZqlPTr5WnGNnY/TPC44/L2SkJQFYwVup
	klbQyraXyLok/eQ693d2V2BhS8iWihQOOTSskEx0qh14XBL8CnrWUjSsDbzOUuQP4ysQySZDSIe
	W+UztNUhVzJAxjarNovE8TxqVNKr2cqUW0MXmWhush/OzjFP8B60OGLmwlxVIqqt9Znmb+Ln6YE
	QzlkBigmROYZIK6/ptDKTwTzZKgXTK5I6Y8s/2kzif71h1x9OkjcsRrvzDDIj7Ns5I5A=
X-Received: by 2002:a17:90b:4b81:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-393011b2a20mr4777113a91.1.1786538548612;
        Wed, 12 Aug 2026 05:42:28 -0700 (PDT)
X-Received: by 2002:a17:90b:4b81:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-393011b2a20mr4777039a91.1.1786538548133;
        Wed, 12 Aug 2026 05:42:28 -0700 (PDT)
Received: from [192.168.1.6] ([122.177.240.91])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392f94adf39sm3478809a91.11.2026.08.12.05.42.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 05:42:27 -0700 (PDT)
Message-ID: <f92cc91e-6e5c-4375-aaa6-f079a165f4b5@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 18:12:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: glymur: Add missing USB clock, power
 and bandwidth votes
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Greg Ociepka <greg@ferrisoft.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>
References: <20260812083522.774711-1-greg@ferrisoft.com>
 <qsxaqckpbvqlrtpd27fcufrmo3fmrp3zf432a2fn5hpvw57mnq@xekhebfewl4s>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <qsxaqckpbvqlrtpd27fcufrmo3fmrp3zf432a2fn5hpvw57mnq@xekhebfewl4s>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEwMyBTYWx0ZWRfX7FjsTYaLzR+v
 wEz4Wq8+TI/NVxvYxcYnyyBJP9g8ju17/G5mkFxSE0hGzd1wYZh/ObKOJ1XUP8tDoS7riK/Rgll
 Axne6ShbknHyQQmXfWR6hWGkAQ0jN7Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEwMyBTYWx0ZWRfX9y81lNV0TB38
 kaoQ+6H4NgOjaaPWIUHHTbonhI6ZjOMQL2lNrH7jA7EPq/Uwbv3Sbb2KQB6T64K1NoE3FofzNWa
 ZCug/ZUsQscxQjDkuUZeRxX6Fd+Z4wm9YzcRrTRamBCnyH7d8mjz+v6r4Ke8lJ7CMROXzxfbSW8
 tJFlb0s00dK57feKsP5uXD7byb2tvNqL2IoCwv847hVZxCSKYfKv0DcmK+iFsA3pRtKz2yKoEQl
 PRRNio6ZYgSCQZN9vrGhCueHAA1vG7ciUHiwjF+xV/TEoSuNIAhw2sfUvqyJagAd7dybkUj9OdO
 9fKQJ/mJ+RogRmCKY1mQ8Ud2Lkwjnefkblm2Be7vn981YeHCciZv64syknVpO7I0Fp+/afXhdDd
 wdBvdERBD6IMfYHSA/qgJWHPZgrS2nS7AylJqyLr1QFei3YnnJRjdvwvsKD5wRAVALJ5Ru0i9LJ
 wXJIfS1kJvchxjjYcXg==
X-Proofpoint-GUID: oF2m1vbcH1Ix78K8qJg83Xy-7ZRla7Ok
X-Authority-Analysis: v=2.4 cv=C87ZDwP+ c=1 sm=1 tr=0 ts=6a7c6a35 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=8gVGPzDiWuseyeRcxd+aqA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=a8UEx8NLAAAA:8 a=EUspDBNiAAAA:8 a=WuHgnROwf8Ibkt1w3KoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=-yeuc7zBjbfZT8aiaP-D:22
X-Proofpoint-ORIG-GUID: oF2m1vbcH1Ix78K8qJg83Xy-7ZRla7Ok
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120103



On 8/12/2026 3:53 PM, Abel Vesa wrote:
> On 26-08-12 10:35:22, Greg Ociepka wrote:
>> The four USB3 controller nodes on Glymur (usb_0, usb_1, usb_2, usb_mp)
>> are missing three property groups that Glymur's own usb_hs node at
>> a200000 already carries, and that Hamoa (x1e80100) carries on all five
>> of its USB controllers:
>>
>>    - assigned-clocks / assigned-clock-rates
>>    - required-opps
>>    - interconnects / interconnect-names
>>
>> Without required-opps the controllers place no performance state vote
>> on their power domain. Measured on an Asus Zenbook A16 (UX3607OA) with
>> a SuperSpeed device enumerated, CX aggregates to SVS while the
>> controllers run their master clock at 200 MHz:
>>
>>    $ grep -E "^cx " /sys/kernel/debug/pm_genpd/pm_genpd_summary
>>    cx    on    128
>>
>>    $ grep "usb30.*master_clk " /sys/kernel/debug/clk/clk_summary
>>    gcc_usb30_sec_master_clk   ...  200000000
>>    gcc_usb30_prim_master_clk  ...  200000000
>>    gcc_usb30_mp_master_clk    ...  200000000
>>
>> 128 is RPMH_REGULATOR_LEVEL_SVS; rpmhpd_opp_nom is 256. With this
>> patch applied the same measurement reads 256 while a controller is
>> active.
>>
>> Without interconnects, dwc3_qcom_interconnect_init() silently does
>> nothing: of_icc_get() returns NULL rather than an error pointer for a
>> device without the property, so probe succeeds and icc_set_bw() on a
>> NULL path is a no-op. No USB-DDR bandwidth is ever requested.
>>
>> Without assigned-clock-rates nothing programs the master clock RCG,
>> which keeps whatever the bootloader left behind. On this machine that
>> happens to be the correct 200 MHz, but ftbl_gcc_usb30_mp_master_clk_src
>> also allows 66.67 and 133.33 MHz, neither of which sustains SuperSpeed.
>>
>> Add all three groups to the four nodes, mirroring usb_hs. The
>> interconnect paths follow the provider layout in
>> drivers/interconnect/qcom/glymur.c: usb_0/usb_1 sit on aggre4_noc,
>> usb_mp on aggre3_noc and usb_2 on aggre2_noc.
>>
>> Fixes: 4eee57dd4df9 ("arm64: dts: qcom: glymur: Add USB related nodes")
>> Assisted-by: Claude:fable-5
>> Signed-off-by: Greg Ociepka <greg@ferrisoft.com>
> 
> This looks OK to me.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> 
>> ---
>> Note for reviewers: Hamoa additionally marks all five USB controllers
>> dma-coherent, while Glymur marks no peripheral DMA master as coherent
>> (only the SMMUs, PCIe controllers and remoteprocs). That difference is
>> deliberately not touched here since getting it wrong is a silent
>> data-corruption class of bug, but it looks like part of the same
>> omission. Is USB DMA coherent on Glymur?
> 
> I think so, but lets see what Wesley thinks.
> 
It is dma-coherent.

Regards,
Krishna,
