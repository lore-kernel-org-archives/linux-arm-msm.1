Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054CE2DB780
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 09:05:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784624751; cv=none; b=ZamM11y2aTyz3xJX3VJalpLPoKSbRMKEjyB6GXMLaxlfZZRYOwYSIqmUaIRWKP4SjuJkYhNmiCSoml8KRTl3RoUzUngH14TRlPH6nuUAT8up8cN3cfUFnbcA1p0awbco5P9a5hx2btyiXnKngKyQWj4a/t9nasNI3Se/U8OkqYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784624751; c=relaxed/simple;
	bh=WlyXu/Qh5r4inzPM7gx0r1zHi0TU7PEPTy/ONofiRoo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f1FPQm6bAh6Du5JWjriuKnRqp3szPJ6TEE2IGM0l+4P2h4tXe9W/qA4sLIg91OCPOyqSvBhU4bckJ6G04ujriquynjKzcGUOSMzweCsk39w+PsvR4qpao1253A/gJtFzG3C4dfnKdqAhWO1CCOVPlDl7baURDS7iezAU6bMZcPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oR/PmMzT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YTKKylOI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oR/PmMzT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YTKKylOI"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6MH0N045372
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 09:05:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pJ+kuKXBlQWpmUw+DzZEYuOi+PJm1lvomogO3upLEcQ=; b=oR/PmMzTjCS2pUyp
	6KlzyvlZKUy31SGYZQiMcnylO1g56prIWRk5WVakvFRV09F4MNzkwQ8InkHVs/ev
	vIpZY0nyOoogEGBPvDUnuHZWtn+OsdfFFPeCBQRHdbwlEyj9kQlj11ghQh25FAJI
	LQZTUybtX8UYhTnaMjBM2oqCVRZ4sinlv6e896ZX0rLZo3ypurkJNK1CFJlImFGe
	QFalI1FQSqlDlTa2o6ml+fJzT11F585y5bsCbvBHJnAUSsv6Hqk6NOPLVnNCBJqW
	qekBEZ7X3HWNFEpLEDt6JGMT89YPnj0zKXgevbs1D/0ddLg3K5gEvZNjBwjqczvq
	Rp7fqw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqv5ujpt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 09:05:49 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ca5d2474c7so200173955ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 02:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784624748; x=1785229548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pJ+kuKXBlQWpmUw+DzZEYuOi+PJm1lvomogO3upLEcQ=;
        b=YTKKylOI5Gf29Q0UPGTSsI/KOZTQ4jQXwcuOCI8QdNNnByY95dOFZzG7SUv4EJvHpf
         63Vj9GiNFIX3mBw62LGT18aAGXPvCHtAejejWJys48biPKHBkuyvL7DJ4mX1WnmadHiI
         ncqYEZv5iw+7Ubu+Q/ciDnfPuxF7zBPnOUNkGBnfJ7IMOSSfEGBa3ynXGaqRs9DPj129
         vG6lPYkgtwAvYTcK5Sj3dgPv2J1+JECYvqRh43I5YV/xtcrup5sFH0C8Px+KgOLD2d5x
         XFAIwaZPlmYm8vnz45FjfCicXZ1LDv0JpZ2QMQGTk5qay21VNQsxdfXIczLU6jw/FsNh
         otEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784624748; x=1785229548;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pJ+kuKXBlQWpmUw+DzZEYuOi+PJm1lvomogO3upLEcQ=;
        b=p3dtSwZVXUz4/3i60tDp8e2YTYmIe13xGnQQu633QH7znM7tlIw4JiaxaObkbOm49Q
         Yg0PTgjuVz3EKhTECoFZuXeU49Msxu3PeLoNaJMtWyTennBSflQECDKf9tdCLzMaTuxq
         kCxGfMoEwSCBFmQ0KFNBNtRfb/PjHgQ0D97DxU2SlFzXmj3s9+3QX3VAntydAcP3zZu7
         mEDhmdgb+zBU29zfLLaCrlKoeauBVAjLQjsvXzdZaBpALtT4K6sL5vbTGP9gDZ3R6QLF
         LPqyriY9rlmRja2M6JvUn05KXJlCVGdM863JJrw1qeM3cSYMJiXWKGMdYCH7uxOgdI+X
         O4CQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpac5D51wkFd591040VNLT3zvg1HL3CYhrpK5cuCtnoncH/mN/vDdjBmfG+EinjgT4yjLwyEkAGRAJ5gT7q@vger.kernel.org
X-Gm-Message-State: AOJu0YwhsQMpA489B3vXbq7XE5qyM7mj3tV47kGra1/B0gSWS4/4mxjW
	k1og68PaUkf41uvNNAARVAm5STOSY1mC9t/Jde5oXN3GamwpXCZQvPLYIWb7+UwEw5dM+KnKYjY
	uFfi71FtTfPizxGSkuHN82DNCwCKgR4bMTm1hx418DGISk3WAI/mizWzPbIl4QlT4Q1Tz
X-Gm-Gg: AR+sD101F7Z6SW5EgdvswnVyPmOmH9VTbtXaIZnHwZBCYFvQIkw4qtmgJhaWvi3SDdc
	3gQDpJVkFjWNvP8mcL4GG3ebWoNl0vunqfRpwJaNvdPqom7B/5e9lp0ABCZRiucElN0UTTUxNiW
	bze2mNupwKwc3mJrqcP/uiP8DXkLRwvzJyJhuL3BMaOk7RFjMdFeYDfeugBlXHv/FDSoWEV8Ecx
	fCsE/j3ybDuCXQXufn97OMlwKIvz+w8QHvqqQWNWXeHNSTXH14E4+XrsEB93jBOd6F8scAx43x7
	DEPjdDIjhCKR+FqE2zYXd7CNUeeh8iB9q30QpEyJLX+mUrgYe5jEfBhD3IR8wRFVvOCPmWTyZ0U
	xDXYaN/BVf2uG2OFqmhmZh+XUQlWysA==
X-Received: by 2002:a17:902:dac7:b0:2ca:d9b3:715e with SMTP id d9443c01a7336-2cf34803792mr203528155ad.9.1784624748216;
        Tue, 21 Jul 2026 02:05:48 -0700 (PDT)
X-Received: by 2002:a17:902:dac7:b0:2ca:d9b3:715e with SMTP id d9443c01a7336-2cf34803792mr203527885ad.9.1784624747688;
        Tue, 21 Jul 2026 02:05:47 -0700 (PDT)
Received: from [10.206.100.243] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf345111d5sm71661425ad.37.2026.07.21.02.05.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 02:05:47 -0700 (PDT)
Message-ID: <15957c47-f8bc-4d92-a6b4-88c9a546d807@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 14:35:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260706-shikra-dt-changes-v2-0-56fcd1659ea4@oss.qualcomm.com>
 <20260706-shikra-dt-changes-v2-2-56fcd1659ea4@oss.qualcomm.com>
 <8a3cc857-0b1c-4bd5-a5ce-a564823ca614@oss.qualcomm.com>
 <ec5017a5-8af7-433c-a011-9ad7c6cd33b7@oss.qualcomm.com>
 <6f8d8cf5-1e35-4d45-b2c1-6f36ac51ad4a@oss.qualcomm.com>
 <h37rmadj4yallpbm3n4vehm2rcflocwen65jacg7kd3zmpo6hu@ohjpgawid6jf>
 <4efaa8d7-56c8-4581-a161-51abb319bdcf@oss.qualcomm.com>
 <fa5bf9e0-66ec-4506-a2fa-bf1d95adf9a6@oss.qualcomm.com>
 <6c89ef9d-3551-4b92-904c-316dbcffcfbd@oss.qualcomm.com>
 <rq4echpblosddelpjmcms4ezynohrzfbr6axfjtonhd7ptn5mj@gj6ecmqv4ows>
Content-Language: en-US
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
In-Reply-To: <rq4echpblosddelpjmcms4ezynohrzfbr6axfjtonhd7ptn5mj@gj6ecmqv4ows>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA5NSBTYWx0ZWRfXyaSXjlqq2gE5
 C6E2pvSUVOMQGGQWxtmFZWWpcN/cFycPbkAy0t3gl19hGsHB8Iw2NT4ir4XqcwkWOoFfPYjGSiz
 VX61/fdizAjPCrMQ2Ng4TKlJpndp5dL8DMVcwldTSIiGiGrRiN7FLUWa/KQVC+CLYRmJtTjMHEu
 KK+hHkUkYsTK2vgFscCB35Cy7BsodbaMOh+SmSyNVJT9EBvHnoxF43oSYuN5rSkvLmWjq7+IxMK
 X9OY8GbMYrtJmk5pKbUo7V1Owg96PXusy6MSWh7h3WyGeY+gzax2WfGdKnlMUjFM1QE/0QPwzQN
 zk66SiZOwf7LLQdeK33Z0fl+cgwge4tRFBATyYvLttvjcA7F1lZflxCb7epxR1ZvDP7+M2g6+EW
 GAeQEh58Jmn18yKzl56z3G5K3kImQUbToJzflvW+DSTF3bmPRJsgV7nKjcmy/zk41AT8wA4vdoI
 GgZ0t666j9cu6/SLPrA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA5NSBTYWx0ZWRfX7L4eiQD9bBhM
 sipZBpIh0OBVpJajrYAE1hGHs4kf+rOLTBtS2t6KrUAMN/Fd2+qM9xt9i/v+uHqdD4xoDU7X3/O
 +xPHjPUdvV1kIMMta5wfU3rEN4untos=
X-Authority-Analysis: v=2.4 cv=WNpPmHsR c=1 sm=1 tr=0 ts=6a5f366d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=zH1VfJF8K_7n6kiQoj8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: F2riglGwlpEJeqCM9q2lCaKP0krQXBPV
X-Proofpoint-ORIG-GUID: F2riglGwlpEJeqCM9q2lCaKP0krQXBPV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210095

Hi Dmitry,

On 7/20/2026 6:35 PM, Dmitry Baryshkov wrote:
> On Mon, Jul 20, 2026 at 05:37:25PM +0530, Arpit Saini wrote:
>> Hi Konrad,
>>
>> On 7/16/2026 11:21 PM, Konrad Dybcio wrote:
>>> On 7/14/26 9:21 AM, Arpit Saini wrote:
>>>> Hi Dmitry,Konrad
>>>>
>>>> On 7/10/2026 6:09 PM, Dmitry Baryshkov wrote:
>>>>> On Fri, Jul 10, 2026 at 05:28:04PM +0530, Arpit Saini wrote:
>>>>>> Hi Konrad,
>>>>>>
>>>>>> On 7/10/2026 2:31 PM, Arpit Saini wrote:
>>>
>>> [...]
>>>
>>>>>> Normally the backlight EN pin is controlled by a backlight driver.
>>>>>>
>>>>>> However, this panel uses MIPI DCS based backlight control with no
>>>>>>
>>>>>> separate backlight driver. Since there is no driver to assert gpio91,
>>>>>>
>>>>>> we control it via the panel's pinctrl default state..
>>>>>>
>>>>>> So this is platform specific pin , we need this to enable/disable
>>>>>>
>>>>>> the backlight.
>>>>>
>>>>> Handle it from the panel driver. Also please fix your editor to prevent
>>>>> it from inserting extra empty lines.
>>>>>
>>>>
>>>> Earlier I handled it through panel driver, but this GPIO is specific to our
>>>> Qualcomm Daughter Card, it is not going to the panel connector.
>>>
>>> So is it an enable pin of a voltage regulator maybe? I'm having trouble
>>> understanding how this is all tied together, given the panel driver
>>> uses DCS commands to control the backlight status
>>>
>>> Konrad
>>
>> No, it is not a voltage regulator enable.
>> GPIO91 (WLED_P1_EN) is the enable pin of the WLED driver IC on the Qualcomm daughter card.
>> The WLED driver is a boost LED driver that powers the backlight LEDs.
>> The backlight control works in two parts:
> 
> _that powers the backlight LEDs_.
> 
> So it is a power supply.
> 
>>
>> 1. GPIO91 must be asserted to enable the WLED driver IC itself.
>> 2. The panel's CABC output (a PWM signal) is connected to the WLED driver's PWM input
>> and controls the actual brightness.
>> This CABC output is driven by the DCS set_display_brightness command sent from the panel driver.
>>
>> So the DCS commands control brightness via the panel's PWM/CABC output,
>> but the WLED driver IC needs to be enabled first via GPIO91.
>>
>> Since GPIO91 is on the Qualcomm daughter card and not on the panel connector.
>>
>> Dmitry suggested , it is not appropriate to model it in the panel binding.
>> The current approach of asserting it via pinctrl default state in the board DTS keeps it board-specific.
>>
>> If you have a better suggestion for modelling this, I'm happy to follow your guidance.
>>
>> SoC (ITP Baseband Card)
>>  ├── GPIO91 (WLED_P1_EN) ─────────────────────────────────────┐
>>  │                                                            │
>>  └── DSI ──────────────────────────────────────────────────┐  │
>>                                                            │  │
>> ┌──────────────────────────────────────────────────────────┼──┼──────────────────────────────────┐
>> │ Qualcomm Display Daughter Card                           │  │                                  │
>> │                                                          │  │                                  │
>> │  ┌─────────────────────────────────┐                     │  │   ┌──────────────────────┐       │
>> │  │  DLC DLC0697 Panel (ILI7807S)   │◄────────────────────┘  │   │  WLED Driver IC      │       │
>> │  │                                 │                        |   │                      │       │
>> │  │  DCS set_display_brightness()   │                        └──►│  EN                  │       │
>> │  │        │                        │                            │                      │       │
>> │  │        ▼                        │                            │                      │       │
>> │  │  CABC output ───────────────────┼───────────────────────────►│  PWM                 │       │
>> │  │                                 │                            │                      │       │
>> │  │                                 │                            │  LED outputs ────────┼──► Backlight LEDs
>> │  └─────────────────────────────────┘                            └──────────────────────┘       │
>> │                                                                                                │
>> └────────────────────────────────────────────────────────────────────────────────────────────────┘
> 
> This is a nice diagram, but it shows backlight LEDs as something
> completely separate. Usually they are a part of the panel. Are they not
> in this case?
> 
> I'd be more interested in a different representation of the information.
> What are the _actual_ panel inputs? Decribe those (and only those) in
> the panel bindings.
> 

No , Backlight LEDs are part of the panel, I will correct the diagram for that,
and regards panel bindings, I modeled only the actual panel inputs.

Hopefully, this diagram will clear this.

┌─────────────────┐         ┌───────────────────────────────────────────────────────────────────────────────────────────┐
│    SOC Card     │         │                                  Display DC                                               │
│                 │         │                                                        ┌──────────────────────────────┐   │
│  DSI0           │         │                                                        │      DLC Display CONN        │   │
│  ├─ DSICLK_P/M ─┼─────────┼────────────────────────────────────────────────────────┼──► DSICLK_P/M                │   │
│  ├─ DSILN0_P/M ─┼─────────┼────────────────────────────────────────────────────────┼──► DSILN0_P/M                │   │
│  ├─ DSILN1_P/M ─┼─────────┼────────────────────────────────────────────────────────┼──► DSILN1_P/M                │   │
│  ├─ DSILN2_P/M ─┼─────────┼────────────────────────────────────────────────────────┼──► DSILN2_P/M                │   │
│  └─ DSILN3_P/M ─┼─────────┼────────────────────────────────────────────────────────┼──► DSILN3_P/M                │   │
│                 │         │                                                        │                              │   │
│  1.8V ──────────┼─────────┼──────────────────────────────────── vddi ──────────────┼──► vddi                      │   │
│                 │         │                                                        │                              │   │
│  VSYS_PWR ──────┼─────────┼──────┐                                                 │                              │   │
│                 │         │      │                                                 │                              │   │
│  LCD_BIAS_EN ───┼─────────┼──────┼──► ┌──────────────────┐                         │                              │   │
│                 │         │      ├───►│  LCD BIAS DRIVER  ├──── VREG_DISP_P (+5.5V)┼──► VREG_DISP_P (+5.5V)       │   │
│                 │         │      │    └──────────────────┘──── VREG_DISP_N (-5.5V)─┼──► VREG_DISP_N (-5.5V)       │   │
│                 │         │      │                                                 │                              │   │
│  LCD_BKLT_EN ───┼─────────┼──────┼──► ┌──────────────────┐                         │                              │   │
│                 |         |      |    │   WLED DRIVER    ├──── VREG_WLED ──────────┼──► VREG_WLED                 │   │
│                 │         │      └───►│                   ├──── WLED_SIN1 ─────────┼──► WLED_SIN1                 │   │
│                 │         │           │                   ├──── WLED_SIN2 ─────────┼──► WLED_SIN2                 │   │
│                 │         │           │             ◄─PWM─┤◄───────────────────────┼◄── CABC                      │   │
│                 │         │           └──────────────────┘                         │                              │   │
│  MDP_VSYNC_P ───┼─────────┼────────────────────────────────────────────────────────┼──► MDP_VSYNC_P               │   │
│                 │         │                                                        │                              │   │
│  DISP_RST ──────┼─────────┼────────────────────────────────────────────────────────┼──► DISP_RST                  │   │
│                 │         │                                                        │                              │   │
│  Touch ─//──────┼─────────┼────────────────────────────────────────────────────────┼──► Touch signals             │   │
│  signals        │         │                                                        └──────────────────────────────┘   │
└─────────────────┘         └───────────────────────────────────────────────────────────────────────────────────────────┘

Thanks,
Arpit
