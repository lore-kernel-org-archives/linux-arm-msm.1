Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC04E54B1C1
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 13:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788961065; cv=none; b=Jnd8ZQ0WQnSTxRkr8I12cHREzgdoatYNXV1xo12+yMkCVaZDXKU5OBXYrQUIhE6iDOcpmbp3p7T6cQ4a4tpJ0TAS2lpJpd7mdLNnIkSLCTnv507v1IqAXXC1PgmHr7OkPZYueoLkcdIku25VLVaPv2dh668xJigUPWpn+9toHMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788961065; c=relaxed/simple;
	bh=O7CTYYww6kbvbIlbWW7DJQj/nWqn1Zl5VNdZA+L0TkA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ekOUInGLHgKKCwuh/AXqHYdSyIutN1PSz0SyASDTOMEV48zoD5ij7PDZmZZa+m19RU7nBXtvcIQw5Q3hyn8B4Z40roVAGz0IvuvVZAHZpxr01wrRdISwHAB1ikVE5St3e+6afU9dN+qUhVlsCj5toizqsxRYZKgu+tOF/PpL7x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hEIvFy+h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gPGTUVvy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hEIvFy+h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gPGTUVvy"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689BoXUl2698601
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 13:37:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iygAIsZQGVJ3KWkHRH+o0viu20ln2A5UI2v41yNoOPM=; b=hEIvFy+hGRl7UivC
	xvoY1NvSocAfvPTKn4kBVjpF00Z8wJRPupUSQWiGz8ScOW9BGZMRhiMDZp51p+2n
	Quiaf3dlVWvo29BI6iZIVHARai+8W82J0sbLJLJcfCN1z5Z3TpZT+vaQTxkBLSBD
	7eQndcMbdFpUYyIU8+CxccwVY8ml9nMCR9q+2yJi7TkRsmF2EjKzbLKm3DZgYSqq
	aD8Dzu+RYfvUIMgIs5OP55YkGCwDXNsoy37UMsmy/XdquisOs2onEXa+KKKkhRki
	se5nqvJQkr0c4svBQWiCsqfkZAzGPRF6LT0RsWVwkSrH4nRt1MUD1ttgFM8SuiNZ
	go/HNA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gk6xh0e7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 13:37:42 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c7d6767d06so176226e0c.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 06:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788961061; x=1789565861; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iygAIsZQGVJ3KWkHRH+o0viu20ln2A5UI2v41yNoOPM=;
        b=gPGTUVvy6lTfLLRIwhsgGpjP1XA/hcf0+bUQaVlIyVudGuXRP+QmqYZin6ZyJRvA9Z
         Zorgpl4xFcm48NzLslKVZv0uDT6QtWIg8Z4zBd9btb5QDsFSyjuTL5Gd5ppGsS4fL7as
         ctIqidoWF1E+N0HadTKPF0YrhuFdHGy3yH9wu9frSwT7lKfk4qwTxu9dBvRBHjL4ZxJI
         e+NBer8YAIFvP2HD6AFgJ6C4d6vE/XW2mmy5dQBtXUkV7Icgvmyo3twOu5YW2OQmVXQ5
         vjk9mWFpOyo2NfAsfn/s7z4nB6xwGbrJGSRlDrq0sBpYJ4oV/nW7ZdWltHwdAw4Z7B0l
         +VfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788961061; x=1789565861;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iygAIsZQGVJ3KWkHRH+o0viu20ln2A5UI2v41yNoOPM=;
        b=lilysMUSLcgfwT7qjwCuUUeec0LCwyN3wr24NH8o1bIQql3GQE10ssejQVEgQqj49H
         yroVN/6t5SQ6HbjkbhJPkDM80itR7QwHzswwom+emh+jdzFLEE/b08bKuigpRfe/ZpGh
         5mCASe9GdE3LJt1Bnr/iPe9BC8aMbHkocN7yLlbmbgJKLg13nFrfeu/zzTN6lI4H9+rU
         uQBBrL4QgnzqK/8+g3Mnth5pLA58TRfTpMZlEl6WUfXXVnMGXTur5O9qt6gsFmDGv26V
         LMfym/+KpeiwqrsRzY+7X/nWoTGecMHQggXKrBPPGOp97/Ozvlspue2eOiwMKaW4a3Fj
         fikg==
X-Forwarded-Encrypted: i=1; AKwUvBzC+wt6lUIKcxO+yMceVtgp+taNRJ2g9BVC84zngwNpHvT2xNs/ma2gE0UwKuy0oPTEtBGhOz5jSavLx6D8@vger.kernel.org
X-Gm-Message-State: AFuF++nht6BIuxFr+w6jUhchtpa9rFro3qgplSDqENNCIVuEb4VZfSEF
	MnIhKEtLhGL+JAQBmh/1TUw6lEoJK+qt9XOGMAjJFRF6JSxLtM9JB5YhRH62sqf78qUwaPVn70/
	4JFzmjnkw+pZY6TRvFRbjpSlX+DWlC/lRfcA6ttPG7CUf6TtPaiu7gc7yAWi5Hy3SIifx
X-Gm-Gg: AYBFou3DA7JkIZy/wU2HIRlZyD2LJ9albDK0zbFzlQUvAEJz6pS2snDyixylCIGXJTC
	3qqgodkDmjAB+yJkD9e4NAcV8CmlcZVR5tz/te9eRZy4kUID/E94NaltdZ3mUd9lqpfKBv9p06i
	gs7Quw8qe92xQ4+XNnQ8rriy9bGSJ1RVjiqRgOV8IAbNalxaSbJByM+vbvDLfQ2Vof2pLVhJXsK
	jNW+XkBaM5SHI7MxZ5Q788BGw1P4Fsy26HtRh5GyuzQYHkS+a9sX1JrFrErR/wpUOdoSyslMVnF
	btYpi28NF4xT6aI2gUmdDZnE3Wl2134W5viVcW6+ds0rP8b5YAP6dXRKIhf5NK5b2ej6yThhrAC
	4iHWZ3XFP5Oh7VqCR1k/z0g==
X-Received: by 2002:a05:6122:6b14:b0:5c3:a1f5:7569 with SMTP id 71dfb90a1353d-5c8148141a8mr3923751e0c.1.1788961056436;
        Wed, 09 Sep 2026 06:37:36 -0700 (PDT)
X-Received: by 2002:a05:6122:6b14:b0:5c3:a1f5:7569 with SMTP id 71dfb90a1353d-5c8148141a8mr3923741e0c.1.1788961056058;
        Wed, 09 Sep 2026 06:37:36 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b7673bd6e5sm438764e87.22.2026.09.09.06.37.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 06:37:35 -0700 (PDT)
Message-ID: <fcd7eb6b-95ab-43eb-91f7-f9a0ffe18ead@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 15:37:32 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: ipq-cmn-pll: keep the CMN block bus clocks
 enabled
To: Stanislaw Pal <kuncy7@gmail.com>, Jie Luo <jie.luo@oss.qualcomm.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Mieczyslaw Nalewaj <namiltd@yahoo.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Georg Seema <georgseema@gmail.com>, Brian Masney <bmasney@redhat.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <b58e3f64-1a5c-4db4-a51b-7138fb3609da@oss.qualcomm.com>
 <20260909132049.37611-1-kuncy7@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260909132049.37611-1-kuncy7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDE1MiBTYWx0ZWRfXwflXLEMnfXdy
 N3WzWq5iZZk8ZoMoRiaL7O2oLRKjyS//AvtcsoojP8dWrio8XFECHq4LsRiGg6OfyosgyF4a552
 7Fh+6eZsahXnID5CJD39hNIwLlhzHsOjNPYxccI7iGlPavW1Eddhzly00sr/OTbw9rG+6XDlRdF
 S4gRywbC+jdNHFgY1E6LuI6GhqSY4o82+irBcrRg+6JQ6yY3rBAeaZkX7/zcJ1Lo3VgBmaHRgGv
 Blf9rfouW6GiMQm82cmD7377d9RpuJaoGgT8nv5eR0gv169+F0tKsi7PhyNGnrmDcMfy6SNQBnO
 A6VtIISEsbpcwq+1n5jg2N8PnwHosdH3AGFrgCy4LnY8f+8htA4dV3y52je/ZrWKQ+jpw92zMKI
 d9ZCtAtytIwivTjmeXqXSVqj3enzAHm1S6bicpGBErxAK6ndC9HjPfaajkK0jX6KEsxubVMWqc1
 kim6vW0I1aHDjYerJnA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDE1MiBTYWx0ZWRfX3P0JaP/8XjLM
 UiRkIG/PKv2e0uIoNcQHCgLVw6CIuv2sv5PTGk8dk8Rt6VnLAg4DKY0zVUKmHC1zk/LAi37uK9K
 I4a6vPGP2W8R9expAhGo/rTlxWQ/SmA=
X-Proofpoint-GUID: 2sc6v5UoiLPjWP2EkYRJFvVEdlnz7MxU
X-Authority-Analysis: v=2.4 cv=KOlqylFo c=1 sm=1 tr=0 ts=6aa16126 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=oVlbBDgyKwfZh0hzoKgA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-ORIG-GUID: 2sc6v5UoiLPjWP2EkYRJFvVEdlnz7MxU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090152

On 9/9/26 3:20 PM, Stanislaw Pal wrote:
> On 9/9/26 2:12 PM, Konrad Dybcio wrote:
>> Is it only the UNIPHY consuming the 50 MHz one?
>>
>> What consumes the XO clock? What consumes the sleep clock?
> 
> Nothing in Linux consumes any of the three today.

Yes, that's more than clear :)

I'm trying to ask Jie about the platform details, to which I
unfortunately don't have access at the moment..

or maybe +Kathiravan?

[...]


> I would rather this did not decide the patch, though, because the
> failure it fixes is not a later register access to the CMN block.
> Mieczyslaw's summary in the v4 thread put it that way; the mechanism I
> measured is narrower, and it is what the v4 commit message describes:
> 
>  - gating those same two clocks on an idle, fully booted GL-B3000
>    (runtime PM autosuspend, gate landing ~75 s after probe) is
>    harmless - runtime_status "suspended", both radios still serving
>    clients;
>  - with UNIPHY0 disabled in the device tree, so that no uniphy driver
>    exists in that boot at all, the board still dies in 6 of 7 boots;
>  - stretching the end of probe by 15 ms, or by a full 2 s, still ends
>    in a watchdog reset, 8 of 8 boots each.
> 
> So what hangs the SoC is the gate transition landing amid early-boot
> bus activity, not any consumer's access afterwards.

I would be more inclined to believe it's racing against some other
driver enabling/disabling something else, perhaps a register that
depends on a clock derived from these two.

When that crash occurs does the device enter crashdump mode (USB
PID 0x900e)?

Konrad
