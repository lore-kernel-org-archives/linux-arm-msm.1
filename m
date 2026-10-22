Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792667823;
	b=NnFdz6xLJvlQpf2X0QnB8N+8voxosl9vgP9vXHtGuIpgJ2z0Cxlqn12AlssxkUJffu0M
	 m7jY+4bSoa4s4UTL5Nu1jrT3nB1DahMsrRHZFXL2F+C8RVdXVytOR+BjX3Z5r+kL6Wbzo
	 o7dQTgQep5Ywqo5oyul7jDmFW243wPOXLK9y1KQuYXuBX8PNW5C7AiuYcwJFc9GurufZy
	 J6us996Tft8ggH+szGYKcCDupm94Fgkm6c1PNAIWB1LEC+49sSHdrce/z774yovNHSoPM
	 Rk7v/P6Cg6uIYivJLQ9lFrBM6sq0D4xBhIB5Rj7lwuGSGM0uqfNPTcXcdN8M73r+lBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792667823;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=TAWBrkbuKQn1zMVuxEUXParUbSxUXSXaJm9fJCZ8RHc=;
	b=AntZJIAVfUj5tlt8cg/3LV/do1NNAIjcg2hQ9sQ6Ap2dxfAnOY0qwCPeHbBQctO+LC65
	 So8oV+mF92muUiLQYxjljatmB9N9sSgZxPwY22kqnn+sNO6elnPYRAEIk6gepqArol4r6
	 QHdQ10l97WQyDpi6o1mbO2e7KiwcY8gKdTqKW76KOm+mgC1b8iixYryBKnWxhYD64VR7S
	 ruXhvjf8vb2BI3uHD9xHbJw0iBp0y47r+ZXq7FGj7VRrf/KEUFUWXVaMtcNZo6VzAtcQc
	 LtCqX8eGJ5zmzkriRhl9O+aFeqxat+eelvH0L/OiW8/yM2+J58JM6XvaSRSqvy3ymHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mEbv8TL1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="T/TKtgDN";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E3B606A31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 11:17:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71E3B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mEbv8TL1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T/TKtgDN
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MA0Ka43995484
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 11:17:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TAWBrkbuKQn1zMVuxEUXParUbSxUXSXaJm9fJCZ8RHc=; b=mEbv8TL1X9bu7ppb
	RvzsBSy4uAP7zIGvnFhjoFqN8ZplPF8jSSUGe6/WmFrF1O59JXBdCMLM3jnY3bRF
	vQaq+3Bf5IvSorkbb0m/9TuhrFdDO/J5e3jngB6yuGwcJ/W3B9teiFToYxp5+U5A
	0xEl+sB3AtNEfVEoONVdkg9QjjqU97TrdGJrLjoSbQ0cGws6FvhwMeJqrNQx2kN2
	/TD8+nNDabNZFXP7aZkcWOdbizuzA6LdEuTFz5Rmxt81sZjXkxg6NEA5qkG+u0Z1
	54u7ODscN8Qd+9Yp43P4foFMBbRfCWvSRexkGnIfKO1lrrotLgk6Utzkc10DBBfO
	ymOorQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93caj6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 11:17:02 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e60770381cso17999545ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 04:17:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792667821; x=1793272621; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TAWBrkbuKQn1zMVuxEUXParUbSxUXSXaJm9fJCZ8RHc=;
        b=T/TKtgDNNiPZq9vQ3Y3dqIfbQcGcQ3zjBDbnKTVNGsWr31x7tCysrrTnWGEhemm66H
         3PWNbrZHzJWuuxq681JQotRghX5ZB7rJYEXx41U/GXgiHjJuAUVBozp5CPLqbbW0f/35
         M6d+Fazk9L4I7kOED9pDu5hCV26LZxofmxAiCD7moUdmphpp74PvGOdx1Sosw0QQYH0i
         dhYU1HKdkzg36YfgbNxuQc/6aWLVj2NZrzbmQIkkLkH4pSLXuExSq+CJftD3wOHWYvT+
         hOfI8AnO71ixcq82liu6RzkrZOVDgccCTrPkD2OVe0yipjwFJvM1AeRaqGG/DCUEFBrK
         pT3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792667821; x=1793272621;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TAWBrkbuKQn1zMVuxEUXParUbSxUXSXaJm9fJCZ8RHc=;
        b=LjvdVQ1Rq8QaqjM/H29jiqOenkMoRQVMu0Y7IoZMc/SbuSGvCWXmt4Autm4vr7YsRk
         ebYw/us1ky8QQgECxWo0W46Wd6E+iQ4B1VDSvoED88sJNNEH1sfLqHOm0ioTxyrWuO6J
         P4LlIcZqigLjr6xsWOfTz6LhE7eYggyw+WQEsfUL7HdRdQ+30PwtylbbxesLDEFmEZ4Q
         C1eyJby/JUhCZKAwvnm9RE3vZBsJytLXw3umO6vfuvUfzs+bJvY0NNrIeY9r3mYqZPK0
         8xiBZRyWtfcBFrc09T04OZaymLAjwni0ESsYnKl/6+7cf3cftHMImIl54R09ludMgjqD
         MKvA==
X-Gm-Message-State: AFq9FYLnScaCok+5WyrMWmlrBAfcyvjC1xa1RX0/uFayMVIKdl9ZUgW8
	TjiFCiDQlsTSgIch5UA/vu4empinpxPuLjAx/5Q4BsDPYJwgFGhJFCifZCg2Eymj2j1bgRbJ/BJ
	U4KwfWjXNxJXFySl74LnPB7SzYnEYf3OPHgNnG3NQDFpmjrRqb0Q+ufUyAXSgL+IRPmtJgCkBh/
	mU
X-Gm-Gg: AYBFou2mM6nXlXIN0R1OF6/60HHXK9ZDhZy2jdfNDmTeD4Ot6MZxWBkryqGKj+2qXbi
	jl/v3tOVPM3MO199P1BL8pR9/JjdoRUfBc/RT0q+zkjN7gIC0DUODZaDIsLg5uE/vBEIBTJ4Pvq
	MW5TPSW0CmjKrW2/uT8DZYROqoQM9EF96BiIewLv4QilszftINfhmkdaHdGZ3WcqrJdU9TGQfRr
	7Q2hdM/AUIG3Hg0mL0NktvKHgbYdX8uuwvb3diDvca1Op3oJ/cpaFrfQbhwkxhgToaw2lIJRDhy
	9pKD/mcV7He0RSbMgqKuaWfb+/YKQd9W0jSMu5L6mX3bcYYxmQ54AOBSNzwTuJCWPqGSfx+eVIr
	LQXXbXnEwiCVNRDXHUADr9mYe8WYP+lXQerTQ125J6DCd7dJsy9QpZ3h64AmEsrAXtC+6kCeIwk
	Cj+6kI3vpD3Y7RjBjn
X-Received: by 2002:a17:903:1a8b:b0:2e9:9b5b:e179 with SMTP id d9443c01a7336-2ea43ccf806mr41226985ad.50.1792667821425;
        Thu, 22 Oct 2026 04:17:01 -0700 (PDT)
X-Received: by 2002:a17:903:1a8b:b0:2e9:9b5b:e179 with SMTP id d9443c01a7336-2ea43ccf806mr41226775ad.50.1792667820890;
        Thu, 22 Oct 2026 04:17:00 -0700 (PDT)
Received: from [10.79.116.36] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b4113b6sm21784805ad.19.2026.10.22.04.16.59
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 04:17:00 -0700 (PDT)
Message-ID: <f634305e-3d04-456f-a0f6-0de637ac4317@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 16:46:57 +0530
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
Subject: Re: HP OmniBook X 16 (X2 Elite, Mahua): DT bring-up report and
 questions
To: linux-arm-msm@vger.kernel.org
References: <CAAnD8Rb4ZZrHFWMJayabioB_8bOHh1mqZ5LCXZz0jTNGMA7UZQ@mail.gmail.com>
 <0e5df58a-e97f-474b-bd3b-9b1a24ae0c03@oss.qualcomm.com>
Content-Language: en-US
From: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
In-Reply-To: <0e5df58a-e97f-474b-bd3b-9b1a24ae0c03@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA0NCBTYWx0ZWRfX2ugOyZb8cPbP
 pOkosZK49kvdwI9awmofNcGbm+NapxSZEqot3e2tq48/IEWrF7CKm3Uo/muGpIn4F+ctp0TLzry
 DpUYMCkLORLdaewNiA0Vj3G9ewZZj60=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ad9f0ae cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=mXjWMpZXRtaDrDc4jYYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 5aV14LYLRqruL10929j2ME-c5kaX4lM2
X-Proofpoint-ORIG-GUID: 5aV14LYLRqruL10929j2ME-c5kaX4lM2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA0NCBTYWx0ZWRfX+hfmPXKyebUF
 pPhlVKj6+jCnEkA0++Tqg1sb6wG6QcNMhWatq93bXkjiElZQkDmqNZJNgK3RB1P0VW9IoJgxga6
 ZuRAQB9QfxYdGnv2hm5w9cHulZsqDOhoXOCk8DmNMVYQq/+dTaAFYwd+xM7Pq37lA2dMCtkB6Rz
 toEe8Enj/YqVAUQrKhYmkHokKN8IHUEZO0jTVbezxL1EvQxrq4XgCrKfnByP6WY7ItUwRyqHfVX
 aq6a5pXdEJD+O4ANjNzAxVNZH5Y4TwUKoim8fmD6wK3DxVvMTIFY+ahGOUANvFIJqKlMCZsuQTG
 9EhRYbOy8kxZTaz697xoU/SgXwwTu0IRvh24wKsK9CSl4ZvCEZuRNe6JiHSOfDdJb7vceTEjIdP
 Tm+wcQZhoh4/Ecs99f0bYTEKK08gJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610220044

On 10/22/2026 2:00 PM, Konrad Dybcio wrote:
> On 10/22/26 12:34 AM, Jeff Roach wrote:
>> Hi all,
>>
>> I have a device tree for the HP OmniBook X Laptop 16-cp1xxx (board
>> 8F46, Snapdragon X2 Elite 12-core, "qcom,mahua") that boots and runs a
>> full desktop. This is a bring-up report, not a patch: the DTS is
>> currently based on the Ubuntu linux-qcom-x1e 7.3 tree and still
>> carries my verification notes. I'd like to rebase it and send it
>> properly, and would welcome advice before I do.
> 
> [...]
> 
>> 2. CPU frequency. scmi_cpufreq fails: "timed out in resp" and "Failed
>>    to query supported version for protocol 0x13", probe -110. The SCMI
>>    base protocol answers at boot ("Qualcomm:PDP0"). The perf
>>    protocol never does. The clocks stay where UEFI left them (about 3.5
>>    and 3.9 GHz). Is perf over SCMI expected to work on Mahua with
>>    production firmware, or is something else needed?
> 
> For a workaround, adjust your config to CONFIG_QCOM_CPUCP_MBOX=y
> from =m
> 
>> 3. Suspend. PSCI SYSTEM_SUSPEND (deep) returns -EOPNOTSUPP, so s2idle
>>    only. On resume from s2idle, usb_hs (a200000) gets an arm-smmu context
>>    fault for SID 0xce0, then "xHCI host not responding ... HC died", and
>>    every later suspend fails until reboot. Unbinding dwc3-qcom before
>>    suspend and rebinding it after works around it. pcie4 also logs
>>    "Timeout waiting for L2 entry! LTSSM 0x11" on suspend, but the link
>>    recovers.
> 
> +Abel is the fix for that out now?
> 
The fix was posted for usb gdsc but wider discussion is pending which
might make the patch obsolete
https://lore.kernel.org/all/20261016-glymur-usb-ret-on-v1-1-1790a523fd9c@oss.qualcomm.com/
Use this series for the usb context fault

>> 4. Smaller things:
>>    - "GICv3: SPI 4115 out of range (use ESPI?)" right after the SPMI
[...]
