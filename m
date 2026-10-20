Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792481727;
	b=Inerlh3Es1iJXfiO2MxfwK/XoZ6hIMzEQlGFM2TiWI0tq9OrWHujfiMLnnfe9nPHSMX0
	 IlXK263PslHNZAKw6CfBUVggqTaMDHAtwCabyi6vwQNaC0kfWRdmCGDCckJd8BMIx9hTg
	 ZZKvbA12Z2w5HyOZezy1fnujLXocMFExqsfJR9IdaQiwPkK6lEQCYTwwYvRKWkrxDwSYY
	 C4+GOXYIH4rNpweDT8m97pHv6g/uD96O6Z+6NrCVNAg2bpsHpIHrDbY3JohOaoDt8hFSq
	 G+4KLaEtV2LNJPYjV0AD0868mQEC29ehVJgzd6kPsoz9bZ5zawljCvT7tg2OJLEJJ5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792481727;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=DZRPJySHmg1AbHi/1VKM5kCKJJzzQaHn48CduryjPiU=;
	b=JLIbseNYRI/JEVYAXTIY1KM6B+Seiuy5rbzs1K/0Au4DlBTbExIAZQ1ja954udF8Nl11
	 fiU3Vh4R6M/zALK/9CGQu7xsMAytFYMo+y4rqQBJPr4jF+axnpgyoYF49LkhzCwj7KGeq
	 Z5eN2vQJYI/qbeO2nlIxOwsGcmilABoY+iQXSpRb/qCCjHruFb0yscVhMfMpdRSAzU9B0
	 7nvmRecerK6HRaHx7AvKMUJaA53GzgJExHk6hyFqjDpQDNsmYgZO4lLWNj1FD7ZUkHpv0
	 2bCcTOFPS6ueLAG3Kk9IK4Rh3rfypDvhHmNu9voHn9ki3c/UIut298nnzDtyA5Vyvyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nlRDOa8t;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ei9vJL0U;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F8B606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93F8B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nlRDOa8t;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ei9vJL0U
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K0t7lv1211003
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:35:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DZRPJySHmg1AbHi/1VKM5kCKJJzzQaHn48CduryjPiU=; b=nlRDOa8t9Hgr9vm8
	Exp0+O4d+Xq/xMzvPrNn5DYCcsjtKzuLCyw20nRs4FePtAY6GbdMW7zyWxPDL6bA
	19+GeiCCMFgoBnkaw3ePKddjvKYbPqPNXbu8ei0HeNVbwvIi1SO+PETvFZQFjxNQ
	90t9Z0t4j496eyQ5YcbChZ2d8i6fEGd5Jz0onMYlMQssopqHIIzOzde02sfCmQlV
	WmvmbtI42ccAuZLXFPFdj/VNRrIWZtmgYr2is7Q4x+lxqCfA2qu/swuxyGatNtmN
	iqXiRQr1EpvjbRrSbglaH8GdJEzxYHGMU4zEbCcEGENoFD62C48b7mC0nNqgBUUW
	PZKQKg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5p1dhx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 07:35:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-536708d1a3eso5004001cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 00:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792481725; x=1793086525; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DZRPJySHmg1AbHi/1VKM5kCKJJzzQaHn48CduryjPiU=;
        b=Ei9vJL0UREV7NGiEWAy621xe2iRZsXLBXEYe7SecTLIEn2yDIEByo1qPpaJDRcGbRd
         wPCL7tuO+kW335EZsEPFKXzjff4Ba3dtEGrIQj6r8gTNpHhvq6TtleO326jytYjFf/wx
         e31Jh2fi1VYQ9m8v42svVjW/nxoXywX0sxsyQaLIgM1Xyqc5KnpjBnYKwWX19arZlWnz
         cO9ZCIv+h6r07/DYq0MU+L8Y5Jmzm+l0hbxmHaCJDxK1/abFvQkT2mYGVFeh+CHDYIns
         jMfWGkQEPBi/KWpETWFaMN3A6kr3FX1PC9UGxkhHG8lyedZbyk+fIdF7CbalP52afOJ2
         KjYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792481725; x=1793086525;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DZRPJySHmg1AbHi/1VKM5kCKJJzzQaHn48CduryjPiU=;
        b=Ozv3+O/Y0bZYJwx35kFa7GdlH5ZUi1eQPDAyf2iMN3/QIZeY25S6J0lssGNjTLugcF
         EnrRb4iijPyk7bgAPP7EwIbzURTVKJB3jVOZVQiXOm8viLnd6x36hFanTpTGzt6oIoQ8
         fmsQ2AE133brh65xY/KVS2Ttmhv9LyJH06HEE7C0NTg/g6xIHpi/xPz/j0zD8fmRjiL9
         b652LeXYqZ9zTlClTfTBZi5xxOV5RG+4iQhagYxgry/6BxQEYdzpkvwIkcyyXMtbnZKp
         ykkttTRSTr8ahzBr+tFE7jcMdHnMERLPFyrxBuoDO47CvKTqA14SwumDGdIsqQqxPrYR
         mDzw==
X-Forwarded-Encrypted: i=1; AKwUvByfrRzf+uq34bwZcqRtmWSSwyZURaFFVaMMPjBsCgWuQHWS5Xl2uNM56R/H3u5s3vv9aNJNpFse3XjFfnO3@vger.kernel.org
X-Gm-Message-State: AFq9FYKHDTiCGHTnty1NRGgFbWZivLINgSesFHvWUzad3aiUJ8JI/Od5
	VRFCM7pDw3SaCq+lteulkmUKJdqQf/E7s2Ulr+4i+7BjvX9oMGt1pRqIS4GHqNWW7OkIuKEK7rM
	zljukT/tJ0fBxvUmoaNupxiR5uYKZ6n5xqB0lhSGho3yhP4GBecwAiWQhWXl4cPaXTbr6
X-Gm-Gg: AYBFou0DvD9E30TybkjOwocYR/DBeHzDGrGjMkEinTJ+GoAC+0DLdUgehi5+ha3InB4
	/8mZM2XIylXOmZ9hXklqv7J3kmoHvnmXwAllTHqnjQkB8VVFcByUwvaD05b4FwTvH5mdtTZRmJE
	9xc2mV0qlv1n05dqnYU4k7jLa5Fj16+YtBpQZNLtAtQVgVO+fBFzgomXe68DFitrI9G2xccyxSt
	IWu2PwDr8dAH3djqfXOYGy7RTniGPY2spt9OE/FNQ3yK+gLC+6dH5KC4idEs2vWDG7kaUgQopZK
	1oo4CLALz5PXxA1q2lIFcBZ0X7zS2OmiArvgIhX/vW9u23+M2Nb8ORxbDZhGR2C/lB23J+zVbAS
	qWGlEEHpAgRwTHCIdm+yy5w==
X-Received: by 2002:a05:622a:14cb:b0:51c:2324:666 with SMTP id d75a77b69052e-536460e29afmr170738111cf.3.1792481724802;
        Tue, 20 Oct 2026 00:35:24 -0700 (PDT)
X-Received: by 2002:a05:622a:14cb:b0:51c:2324:666 with SMTP id d75a77b69052e-536460e29afmr170737751cf.3.1792481724319;
        Tue, 20 Oct 2026 00:35:24 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb14a7sm471411166b.76.2026.10.20.00.35.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 00:35:23 -0700 (PDT)
Message-ID: <a69738f1-1c6a-4476-9c0c-8443650d1f6a@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:35:19 +0200
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
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Samsung Galaxy Book2 Go
To: Luca Weiss <luca.weiss@fairphone.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jasper Korten <jja2000@gmail.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Luca Weiss <luca@lucaweiss.eu>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
 <20261012-book2go-v1-3-7188e7ea7a15@fairphone.com>
 <fb634f17-de56-4f43-b139-3d040a35f019@oss.qualcomm.com>
 <DM3MSNLF42BV.1UV490PXB0C07@fairphone.com>
 <emdm463llmoi6vsv3zmfjddqrfaf2iubdnydsqye2n6ui56oae@frsvj6el3zvq>
 <DM4DIJZOLJC0.2KAZET8VYUDY0@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DM4DIJZOLJC0.2KAZET8VYUDY0@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: VHf98vfzwpWcvoCXOWgRjYdawTgp9W_L
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfXwobYy2S/Z97L
 0lDPCiQAbWN5SxBRVxIxSWDP0lcrmuUs2qyGHHY9QxCDloHWV1bgd9QBnEe+nXieYLM+c+8n5gJ
 FU2738R2p1GFC5FgqyVjjFF37Q4amgY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMCBTYWx0ZWRfX1dwTn7m90gbC
 TZviilHwOUapM2cjT5qUsnLPr1+Kxp0XXWzdHe8yXJBk8O/P4nj0JXR30g1ypLvKccy6VWLBb4N
 H7YL4bHQe1gLVKqKfYvDoGErmO5dnL8GanZBIwpvWkKVOFnlQtyEiip3+lyO2g3ZVk7qHRic2WI
 JpCwslxiW+ijkQnQC4ZTrg+e6Qnd20+jnx9T1vNyu2p1GYj7YrXYze246Vmtspb+QLKc/YS1gQR
 OeO4zq9/04Jm/oEsZOM3XOdRENrDqjSva0P55zpFgAUnWNILZ6vB6jzkH9nG9RCdTgaQmlXRGJV
 GjgN3HEg564h2kx+DC03a8EVDInJh/6LAG5Uxpwa/jXbbCC7EiVjXWeFE9xMz+Fxfr8E2t8pB1B
 5gV0j2YC00Bu4WB+O9QTq6Js0xtjrrxA6DxGWVuYPzhXT5v6xaqhLlppvLeu7LlyNFiKTAUb7Bw
 DTdJO7Qb1mC7b8MVpcg==
X-Proofpoint-GUID: VHf98vfzwpWcvoCXOWgRjYdawTgp9W_L
X-Authority-Analysis: v=2.4 cv=crUOAF4i c=1 sm=1 tr=0 ts=6ad719bd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=b7wq30jk4QowdIX3xroA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610200030

On 10/14/26 9:13 AM, Luca Weiss wrote:
> On Wed Oct 14, 2026 at 3:28 AM CEST, Dmitry Baryshkov wrote:
>> On Tue, Oct 13, 2026 at 12:17:05PM +0200, Luca Weiss wrote:
>>> On Tue Oct 13, 2026 at 12:10 PM CEST, Konrad Dybcio wrote:
>>>> On 10/12/26 8:11 PM, Luca Weiss wrote:
>>>>> From: Jasper Korten <jja2000@gmail.com>

[...]


>>>> I'm assuming there's no pmic-glink on this device?
>>>
>>> I'm not quite sure yet how the USB stuff works. For sure from
>>> observation, USB-C only works when stuff was plugged-in at boot time
>>> (UEFI?), and charger also only supplies any power (but not actually
>>> charging) when plugged in at boot time.
>>
>> This means that something is not 100% correct, for example, missing EC
>> support.
> 
> For sure some bits are missing. This laptop doesn't have an EC per-se,
> it's got a "EMEC" - Emulated EC, where on Windows there's just a bunch
> of drivers handling EC-like functionality.
> 
> So e.g. already for battery, we just talk with the sbs-battery directly.
> I assume this will be the case for the other components on this laptop
> as well.

I guess sweeping the i2c busses would be a good start. The other day
we got a contribution for a SM8550-based Samsung tablet which also
didn't have pmic-glink, but used a SM5714 IC instead:

https://lore.kernel.org/linux-arm-msm/f7ba4d5a-0e8c-417d-a1fd-5b5e392df71a@dxdmail.cc/

Konrad
