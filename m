Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793373950;
	b=VFNdh7TnAvKagyNCWXeTiwAoplMj9cJ3lDiWRwE5qY2HzGYPsbeC5PDSYqkQKDhNLr8J
	 Fnw9k0SAktMrKyZkihd/Rb+IQskWcYFe85Kp8YeBLgZ6R2Ecf52j39OJ48PBb8N+rf8ap
	 5Phm9yROEDUlsCXlEVi9h3zMC1Q0wWQbeCahpzgI/7OdC2bp0OPV4n3mXV3YzVWe29fT/
	 zvYTSzX9Im3bUERSe64yxuiOcRlwsp3CL3Kz6m8gcn4gGeCBEwqiDeEdsv4+MK/M1CYBf
	 t57QS1T6TGILyXljK9Wmcu3rGZftdjUIiCfrka9f1wmswQ/ss35Ujfjin1qC+NOMDyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373950;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HAanuw/65QLamv5I/BsAigacYne4PYbrmQQm09dQCp0=;
	b=K4nmxhy9u4nEmVc1IRiFyCgAnVc/mkKnzdVwJe8I4JP/35ZXRpu33P/rPAZGf1lhLq6Y
	 MKjPunsnmXu7XwPdfDOL6vm6Gzpenooic3ltX0Elmf5Bsl5G0vNyce4zhnOuu9QrE+mVU
	 7UpqLIja856E4wBHklsC6KzC3cnaypMNUXL3TIibJSXLqwXfXaGZhpTVW31Si8r5KcneQ
	 OAeydmSY7sI8L5rpzBrK6OT3tyoorpGogdSsnuLGWc+TuxG1IUc32L7qEppf4x9rT/hDd
	 3+hYE/Ai9Gk+6t5qFPU7Dix4z3lcl6nC8hLswvq1lJ11sspfuEbr55EHYkARG5Exbdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="LtUJw8K/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YxKyyf5m;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74DA7606A31D
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 15:25:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74DA7606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LtUJw8K/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YxKyyf5m
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERLlQ2968145
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 15:25:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HAanuw/65QLamv5I/BsAigacYne4PYbrmQQm09dQCp0=; b=LtUJw8K/jVPibXL7
	Nm6X6MfGfw+jsqw0QHvh2SPqp7FITBDyU6dhveHHRWv4sDrLCiMXu7elwTdgxcv6
	Q3v8AS060Pha/MLTvN/d27jg8OzlGalrMTvDiPa6nz7k1ay8ai2sTBgzM4gQT5Ln
	P58OwN8NvpRQjWM4defAPMQ4BkxF/aWafIxZTjLzBXw21cqPCfsl4dNYSyun1uCg
	FcsITEjBEJGGtVM4bH4yu56IqmfgJB7U4LNJ2aO5u52hh6bPk1YqAP6/UTf06yWr
	aZWscMPIY5o0ShNuCabk/YQkhXFls5MXy89QqX4jA8/yoUx3lfFZFSjl9nYoT27x
	xp6Smw==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qkr4g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 15:25:49 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8a05a4396d2so780627b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 08:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793373949; x=1793978749; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HAanuw/65QLamv5I/BsAigacYne4PYbrmQQm09dQCp0=;
        b=YxKyyf5mwMosBl9MsKEIUJrBY/Lys6qbKF32l6aV6L2rInMpSLYYvLIauDL7z3tfIJ
         vc66hK5TS6Z2m69HUNfr/t3hmJg+PRVFWH7WBg7U7J5Muf/qvUWdeRtob2dz98N8VPKI
         C8MmW1I9VKP6JQ5BjQRHsy/dqiFPmWIbYBqBzA+N+PMs0jsM93cLUJbyvVcN1XCIRA82
         DM9W+P99WFUgAlkw7tC/O5wSB5K45/Wx56YgZOeND7952LvlYW0Da53a0r5k2d01o6k2
         516tsdFxfXgYvwgMdOSKhZSW8nOZsKDNMF7qNilFdRDmq+WKhJndJuXZX+5GHRbcPs0G
         UkSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793373949; x=1793978749;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HAanuw/65QLamv5I/BsAigacYne4PYbrmQQm09dQCp0=;
        b=EgR3BEld8jruHzA9uQUdTFqLQXDVd80bgv4w87L1a3IDXafJYDXtFUTAj1nZRjZwwZ
         KXgBmWNQ0LUdmgcC7CpIlF78jLuxHiLeJS/qGA7RIau5i4F1Mhf6oF1e15wzocJhPR1/
         5pV5f+MIZfoR5dmJ8wDsHAb05fcSGBAhblhwXlRh/n27hbj6yYd+bmeRqy6Usotury3E
         Su4MM9N4bnvd0GopmtRdscmWWSH1srljoG1hktXtRUlxXK0/aLgafOtbCbUtxF53U4Ia
         2ttzMMMFRmTKYt7VBdJATia7aWZ5PAv0mFrC0tQm7WLHiYFMmk1+tZJ6TGI3/GpGs5H9
         tj+g==
X-Forwarded-Encrypted: i=1; AKwUvBwwdD4pZ+WQMR//JqPaxhuml3XChnMwAZ4LkaqxM1e2u1CfcSyAmxQYRwS4WlWSbqWvtFjQjRcQqt8KY2jb@vger.kernel.org
X-Gm-Message-State: AFq9FYI67A9eCatpqISinwCdYhQ7OcfbJVkvuts7g6QhpmMPjX32tmQy
	oZzGzRpt5mZeqsptpLVV2WoXSjyHjth1fr6mqTP3Urgw8TQd2yPM+ByiGmbukkxJ0+vbTKK95oT
	Dteatb5v2iFYf0U5XjtBrS2C49WuYHghDiv6SMBmQZLFFv4m6DmflIYWaJJV6jLZ+o12Y
X-Gm-Gg: AYBFou0W1yWdgMuIWz1kuDyqd3JbzS9QYuXdRCR+uwrk8gMGHBpLcFVy3UMv+bN0gj+
	B7rSDc55e1dH++wZwzh6U3A2MVtFqRo449ATkgbi6R+ynI2UiwSFl0DgV/Bzl2sQO2oFWTf8p04
	x9jvu/r7PFgks2RAnjPLWSx7jLVmMUYMbsFEiI0jGFHHSV3AAAfJhiP7u+BMMNsTTQRDCnc/Q75
	2gbR9W1oojW6JZ4Z+BqvO+5YEgPgWn8PX2dqvGUMbjNIlYy/J6LD0nCENiriRxrKT3t4hmkOntw
	nezC7qiT6uOiNtf7YOB02ndEmKz2HQCMzpOyiRZyAhjTviOnspKwg3tRblC0rJJRo5q5Bmf2y/t
	ReneIXrUI8xY3E2zLN/8fyFF6024Wy7eXBfaMQEI65ofG3pVl3tjhhsvsF4b2eke4V/SPLyH5sO
	93NilzQcADYOdPfHR6fRRL14rdDeyY8Qva9+dO
X-Received: by 2002:a05:6a00:12ce:b0:880:5fe5:a818 with SMTP id d2e1a72fcca58-8a9bef522b2mr2301164b3a.59.1793373948948;
        Fri, 30 Oct 2026 08:25:48 -0700 (PDT)
X-Received: by 2002:a05:6a00:12ce:b0:880:5fe5:a818 with SMTP id d2e1a72fcca58-8a9bef522b2mr2301134b3a.59.1793373948472;
        Fri, 30 Oct 2026 08:25:48 -0700 (PDT)
Received: from [192.168.1.6] ([117.143.160.247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada2dec47sm141926b3a.36.2026.10.30.08.25.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 08:25:47 -0700 (PDT)
Message-ID: <73b1f591-69cf-471b-9763-a0b719c74501@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 23:25:41 +0800
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
Subject: Re: [PATCH v3 5/5] media: qcom: camss: Add support for Hawi
To: Bryan O'Donoghue <bod@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
 <fFfGGWaoXA-LdO6s8Xh_kQWQfncXe9YNdpcj2yNkphWHAR_V69LdLOcuhXPsbg8dEUSN4j4yygq4wPre5cz79w==@protonmail.internalid>
 <20261030-hawi-maili-camss-v3-5-9742bca8cef2@oss.qualcomm.com>
 <5817be6b-7180-407b-acb5-8c5fdef4edfb@kernel.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <5817be6b-7180-407b-acb5-8c5fdef4edfb@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfXwvK7zueWPkVX
 OEKNS10r2qXjgtMx0f86nGrznK31wWrS5507B9WOYU7WyXxX3hOsP/xLC2CvUiAH6Xz/S6dArj/
 duOzTE6rLevw/++BSUc0zy9VKptnPUPJ5xYH3Neky8X8+h0vD8ZglTblgdKmoOuaaH+RTRwdjp5
 kqpaCuFbpJhEN4ElpfhbipILlNn6SVXpbAjIQ67HtEXPpU2XIekahgJd5U78Ga557xVNrrQgVQv
 SPIuctTAuaIKzvqbAj5lNF2yoxeUAT4GYWsg4oSGeYME+DLBCcuPdIdlMEsdrs0IXwFHGKHZmvD
 ATg9gkF8umgWYnWILo4qKAvEMVhRUayHUPLmnJakEDrJCvk/35l2O9KhaBidUhW2yYZ6hqn89ja
 s59L1fmqZ+XygxgeHlbxRamd9aXE+U+jNBb8Q1QbCQGoTLwPpLZD+nDbmnCRx2yDO72VE6hJDAi
 mhzL0oQkAX+4MBQrunw==
X-Proofpoint-GUID: ZCRcG_Oi4oi5osToqmiZyCUhEly__bpa
X-Proofpoint-ORIG-GUID: ZCRcG_Oi4oi5osToqmiZyCUhEly__bpa
X-Authority-Analysis: v=2.4 cv=IumL47/g c=1 sm=1 tr=0 ts=6ae4b6fd cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=6d0oVIyUxUng7TJeo7N4IA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=oDwHtdCdAfthrX0yCOUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfX14KmuXbhDYA6
 qk3CoyzwfbG3klRtNel6CCjgan+o4TUbD3QAlyQH78XxTxPPI6EyB+wcb6g1hyGc3Lrdtf8P/y8
 uvtShiL7vQyKP10b3UHZSxM9oFTYxbM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300061

On 10/30/2026 11:04 PM, Bryan O'Donoghue wrote:
> On 30/10/2026 12:43, Nihal Kumar Gupta wrote:
>> +static const struct camss_subdev_resources csid_res_hawi[] = {
>> +    /* CSID0 */
>> +    {
>> +        .clock = { "csid", "csid_csiphy_rx" },
>> +        .clock_rate = { { 480000000 },
>> +                { 480000000 } },
>> +        .reg = { "csid0" },
>> +        .interrupt = { "csid0" },
>> +        .csid = {
>> +            .parent_dev_ops = &vfe_parent_dev_ops,
>> +            .hw_ops = &csid_ops_1190,
>> +            .formats = &csid_formats_gen2
>> +        }
> 
> This looks strange, why is there only one clock rate ?
> 
> ---
> bod
Hi Bryan, the current CAMSS CSID code always selects the first frequency 
listed for each clock in the CAMSS resource table.

In camss-csid.c:

[...]
} else if (clock->nfreqs) {
         clk_set_rate(clock->clk, clock->freq[0]);
}
[...]

For the CSID and CSID_CSIPHY_RX clocks, the hardware supports three 
clock rates: 200 MHz, 300 MHz, and 480 MHz. If I remember correctly, 
200MHz and 300 MHz is not sufficient for the sensor's output pixel rate, 
so we need to use the highest rate, 480 MHz, to meet the bandwidth 
requirement. Thanks a lot.

---
Best Regards,
Hangxiang
