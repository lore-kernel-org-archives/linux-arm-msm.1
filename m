Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697DC49EC56
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 13:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789997755; cv=none; b=ukrslweEc0UCLq8oFQmmu3KGMvXw+z7v4BhQ1p2HhtRyKLHjd+KngCHNu/aS9CLBeSiJDUEKP+3mOxcR1xgOz2PienvC6B6eSgOMqflcLUAmn+zvnppUEyEnVY9/FeNH1ZFB+c9NXBJ4mLNK1i0cDUXl9x+3P2bWxoyAM+TV40M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789997755; c=relaxed/simple;
	bh=Pj6ozmh9fsmLs7MZSns+mq0MCLoIzeXiXHUT53zAR3s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=obICTsGBmUmAWkDk/u/OzqpVn/hMQHk8WF7/OV9E0L3S4sDMF+YcuC+3+TLXGzzuJERUq2zmVir6Iu26JqlbgSJP+IUlW4HWggPDmeEaUoKJ3tApbjaKfuYYZeG7mWWzBobZRE0xrnAPUXAfzQXxSeOSJmnF4F5m5xdVwtOyBrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hSviSdN5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XYj8E1sQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hSviSdN5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XYj8E1sQ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdwFx934208
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 13:35:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FLvo77jmnPz5fCIObaCipUUFD6x8vLYstiEjZostQ1w=; b=hSviSdN5LN1yE0PV
	q3rwlw+kWayzSE5elW84oTO05970RHEikA/vhSuK0powQP21hkIGjvGCnzlR4tsy
	Qw4Y76vuFRjKM5/XIlD7GrNLt03yDOApO1S5FpyWYYLcULTA0kRFQDPqAsiGPweU
	7Hc/q3GsQgb21s6v55WlXD4LiWNUIck51lGfvv0Zad6PeKjliUk24EwcA+sI6Zjk
	yAe+twZKvvY3z+Yku6LeEcAhEXHrYU8/WDOEa6IiV3WgZtAmFPOprMpI2ztbKRzB
	gc6j5A95eWxpfnjFBnOmFpLB2qgZ6KM5fsfmuB0xSYFzjI0PFmoUZ4QMixCgWOcJ
	pz35OQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtq8bav1q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 13:35:51 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c7d6767d06so104916e0c.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 06:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789997751; x=1790602551; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FLvo77jmnPz5fCIObaCipUUFD6x8vLYstiEjZostQ1w=;
        b=XYj8E1sQalTzRuRwDZayLUCDekSLftrDd4dO1PhiHU0gtXYYYM/CxK1nsle/yxfoQd
         HI6SXIUgQSp+pYoLAVtFK3r1PTczdBZLO3S4j3/SwXFMQg8oyuuvIaFO38HdkZypi+dd
         VZxlYPQkzGY2GbdMYfQevUrq4GXJ3iOtfmtzePZCjJpmRR7MPZYnMqV1R8jKlQaGRpYq
         XO40ae4dC1N75eNPSzyMIq566OW7gCkPEC2/qorhFn2JtTe+13QBCoruxBwoa+Pyg7VC
         VbO5mKktrFJZ1El0aVuPO2opboI+pWIzoR29OuKV7kno+vkemkqr2MuBL/IMwv9Gy8RZ
         L+vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789997751; x=1790602551;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FLvo77jmnPz5fCIObaCipUUFD6x8vLYstiEjZostQ1w=;
        b=telvRJBL1Ofk4gSEy2JFWW2cR7og3ygyV0mwdl0LVk7JaLaQIcD9L7ZVEM+rEHDiGb
         yb3JYjE/9hcaIfCCVO6WAvcFdoB612gC7wBQuymXhiHVxNQLzf4LMY0PQDU2RuolZ4Lh
         XpxDZIE++tpuU/B3goDIhDMwSUR2z3NN6pZC+n5QcpXoybdVLSxL7STWtG6+Ft2x/SZm
         /B8o6x6eeHcmqyJlSqkDnDLAhTv925qfIPAULJR6vtM+Jpm94D7ye7KfDnB83GD08fn4
         jlBww75qWBV6S57pFcsMCh+pVnem9O3LblC0z5rVgcEu+UayvAnftrzcP3Eg96m+IRby
         n19Q==
X-Forwarded-Encrypted: i=1; AKwUvBy+yoa6Y1GFWy5byu7p+WgxU2vLhDu8wtk8dg+Xmamfctc8mHpe6nWQbbxKLPmj+2a9PqsGOtCyLY+fm6HS@vger.kernel.org
X-Gm-Message-State: AFuF++lix1F62Pu2r3vKsBh8i4gBT6MXApNtWxr9X3u0GC/t+kXbsnGu
	x/qHliN54oc0Gr9tBV86kfZMGgxde/0RAiobJ4a0VQLLezzgF4KuWW+OpFywouPD8IQEBHThtGJ
	Uhdc0Rdo9yN02/xDkRleVaIxBnThA3jfCO+M1NN8whaFPppWT739BJcsYKR6lRCsOliLW
X-Gm-Gg: AYBFou3/byB/Z1Ju6jjglHRsHkSTi0CoCFii5mHlFCWBD4wbhFeRNatzhKnUq9vQ6a7
	caC0HjZie4EieM/oGQprmn97s8+AMF2Gjo/EcScnBEGSi+tknNV0yxceu/wtWyj8QdwVt0sTulf
	8uxsfM1Wcdx6PTFtxr3AdVALhtEeOKYTti8cGBMBDn91z7REqy6zukucEDxA2Y6Ciq+mAoOJ0R+
	eqEUXybfCr0gXUHYpsPUVL0QQq2xWd17LKLN3cRNwIj4j7wmBh32tAKRkhbycYr6xEL0geEjZ7y
	WsES21eNi3DG15UxucDmOh6ujBP/+sGLcbzc6c/ceQuPiF6C8Hli9VWkyJa2OgTvRtXNrXeN864
	Jmk93OJH1rCLWArNRtgD4cQ==
X-Received: by 2002:a05:6122:4a4f:20b0:5c9:ac9f:b7f8 with SMTP id 71dfb90a1353d-5c9b86e8c7cmr3529532e0c.0.1789997751192;
        Mon, 21 Sep 2026 06:35:51 -0700 (PDT)
X-Received: by 2002:a05:6122:4a4f:20b0:5c9:ac9f:b7f8 with SMTP id 71dfb90a1353d-5c9b86e8c7cmr3529489e0c.0.1789997750828;
        Mon, 21 Sep 2026 06:35:50 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa67dd344asm4368300a12.18.2026.09.21.06.35.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 06:35:50 -0700 (PDT)
Message-ID: <4970855f-37d9-45da-ae05-027a605c03f5@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 15:35:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] soc: qcom: geni-se: Correct QUP Core ICC vote
 constants
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akash Asthana <akashast@codeaurora.org>,
        Matthias Kaehlcke
 <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>
Cc: mukesh.savaliya@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        stable@vger.kernel.org
References: <20260915-correct-icc-bandwidth-vote-constants-v2-0-f78eb611204e@oss.qualcomm.com>
 <20260915-correct-icc-bandwidth-vote-constants-v2-1-f78eb611204e@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260915-correct-icc-bandwidth-vote-constants-v2-1-f78eb611204e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE5NyBTYWx0ZWRfXwjbf5EH/YZMV
 OeVcOMNlsChpM3MkNsVSQEtJS4Cb+Ze9c5Ixs3ejbKHVP2IVon4IaT9wQdEZgvOYunV8Ae1AtJ/
 qGm1U6VscVVSkqBmIZzjETCpDlk6gi18JsB/0WlPdtAM+zm3k6Hv9n3xkrFWaf08vZdRcd+gVXQ
 8jbQQ6YIXZ/nN2mC3xDZx4jRm3K5weqTQxCgc2dGBUP5GKaOOh45Ax5Lb2BmTEmbfmrxSZUrj5i
 vM+ncYpUGGZOxSrSUAz7HgLNRXKhwfxmCno7Mc/8f9wc3GKa46rek0ijt73I9LYhviMX/CgMWAb
 yfGZ1wvaz4BtsjZKQouS2YDWAO7SYDjT8HiCtfquMj3RqRGb6+8ouKhiOxfFkL0ZRTJSvBU2evA
 a6jbyKwrMm/ZALl/vQIu4BG72UlG3tcSWG6Uzz+B2CUiORXMh4U1XBEWYS+irqVDKgNlwIQPi2Y
 kv6qcwc2XTUxc3fyY8Q==
X-Proofpoint-GUID: bKt5b6N3Yr6_4e3ZGz6o2tu_ybkPNDak
X-Authority-Analysis: v=2.4 cv=T/8Z3PKQ c=1 sm=1 tr=0 ts=6ab132b7 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8Lir4zOpp7cNL01G2WUA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: bKt5b6N3Yr6_4e3ZGz6o2tu_ybkPNDak
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE5NyBTYWx0ZWRfX5RH38Mmtjh9l
 tJBZtngIhP4uz1x2Efl8BgD9/6PY1XWGHJFqkWrpHD2IDe5GiMrxuDd8A9U/ZbS2bp4sAy/QSlP
 I/Vyrgj1DPAZLlZhpEfa9EaexHotLL0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210197

On 9/15/26 3:26 PM, Viken Dadhaniya wrote:
> The GENI_TO_CORE ("qup-core") ICC vote selects the QUP Core 2X clock
> rate. The CORE_2X_*_MHZ constants are expressed in Bps, but their
> values are several orders of magnitude too small. For example, the
> 50 MHz threshold is represented by 2500 rather than 25000000 Bps.
> 
> As a result, clients using these constants can severely under-vote the
> QUP Core clock.
> 
> Correct the constants to their intended Bps thresholds so that the ICC
> provider selects the corresponding QUP Core 2X clock rate. Drop the unused
> definitions.
> 
> Fixes: 58ffbba6a399 ("soc: qcom: geni: Support for ICC voting")
> Cc: stable@vger.kernel.org
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
