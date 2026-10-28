Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793188853;
	b=2arFmd47VXUBSQE9mUWvFETXK3RjWHTg3R1TicSaoiRTpJFyJH5/HnYZYQ/OPr3pKPoR
	 HzjkuzOqp88r9gRfytPQbZ8d90E2kAcRM0oT/a41RKHkE/gehc5izY/d/GIg4kJ4xuw6p
	 KBq4R3RNueGv95QQXlGNV3+CGhhE3RR0XxI1CyGjNoUJ1Vw6CyQv72qQkkVBus3AIhlS6
	 5ntgmrXjIV/Vaze0dl+f73qSdmaJm+7w6kXEYNd12vOMGYpIphX6DICd39iwH/Y8HYW7J
	 k3g7dt9CigX8iV05A0NJJTX+AgiogkC493UZ/ztylZepm3nf5QA9ShXxMVF0n7flRuw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793188853;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rG1EGZ3f728DsRaOfC0x4QVyGbD2+1X/bwKlZnMEkj0=;
	b=I5cvWwDoX49EyiqDUMitFeF+bSspvWGe5jEuJ+I2dH/QKywOmh+LGMx6h18wytbC9DOQ
	 xekKn8d27G9S0GHgitLiJaQQ4i6/wDaek2UBYPS5PXsZ8TyxS+T1VatkfBf6HhyWWVjwj
	 9M+akncyG1Wo0F2+nFuvdjgKDRlOI5p3Vcix1PZKxuQ+aKSz7zdrdy1Ilk6GVnnxRQSpY
	 C/LdjivmQ2uxvpjXNYjNsJX2A6PHZYHTDsemQUqby9NtS81aZl1fGEYxGB4EXnGz6qW4X
	 hbU6VMzdZT6QYrAb0yRQd3uUqtSdnRujyGtRAmwWWDD2QMULUosb619DSuhjiGWGo1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OhNv9KAt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LVxZPrTe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42F9606A320
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B42F9606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OhNv9KAt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LVxZPrTe
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe4xs2082635
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:00:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rG1EGZ3f728DsRaOfC0x4QVyGbD2+1X/bwKlZnMEkj0=; b=OhNv9KAtxifJpUim
	+T6V1PHmy5dVGXL+97jf5tqZgkS6ZTc40iX8pl2e9+7gHvtGmHmMnx1ITqCe4G8c
	1vgxQ+1BRG8C7KVKsuO7tDSDtlKXri3EyS7bJiif4CuJ+hu6LoFfo9GO8PMmjkAb
	cV2We5AMY9WsZ/FPfX0wwkESorBMhoTvnjM6Tq4JJ51JZGIF4GyxYsVwR1ZwH334
	oXbuSoCb6DtPfIQwblfqXgmWg0MBadEcC3dZr5mZI/XgRaAbe66Dv2G88aO5UICb
	a/S7c/VxTI+APpwbFr9a20EYuIPMjE/kvGkmWVttkUTsVkrl4UxZAELnP2vp/EyL
	stTsRQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjyjpuux8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:00:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5350173dc7aso2391971cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 05:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793188850; x=1793793650; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rG1EGZ3f728DsRaOfC0x4QVyGbD2+1X/bwKlZnMEkj0=;
        b=LVxZPrTeEa9+02E4oQjBl55yT2Q6xBaLx8FfUezGSkDIvRLmGxSCFaVeVgQuUkuEV+
         QZdo8ZvtSTDZYciVC3Npmk1dDJm6D6mDpjam4oeX+hRz5I8wkzejvdaYtBMb4pl8xIs1
         1w7YJ0W7ZhXbDPBUIzHLBrHFH+yY0D7T0wVS5saBuooC0l7cqglf+wNq0TgHlRZ2JDpz
         QiX0aoqIhoBkWhFa5skyFE+WLUKg+SH8C+cB95a9lCQm49H7Djh9Ant69IrMwAm9EtcT
         ATBB7SA6tnazZ52tnCOaf6AsSJPuapDWjBnlnmUENDAHIln3NNGZZPAORJAopbj/+ZOG
         d5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793188850; x=1793793650;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rG1EGZ3f728DsRaOfC0x4QVyGbD2+1X/bwKlZnMEkj0=;
        b=nEvpEM8Co7VBYp7CXoCV5MANXSZrO3VduYug7nbsCC0YY/uc63MlrHHtVB5Xm3HMb2
         BS06j9/Qdo6MOeI6Kl8Sdz8YA3w7VUMGPVsmvRL+2Mm1P1jBfDzJXchlTCt8+XRZnomH
         NHJZJ4gDiCcqQNbBqS1E9+NIksmc+SKsmexick9mcWUqW4xbluSsbtaP/O7C13aFRp6J
         Y9Vfw6OEAL4FlWnSZjK5txeZWMww/e99fqDl/U+EEHVXSsG2V6CdZURTHdU9JYlFIQtQ
         +rtaKyMKia46+Dv+1b42uYNWX2c9N1fUpsC321iNeKSzd3of4pUU0xeQQgojjESDihhu
         +bCw==
X-Forwarded-Encrypted: i=1; AKwUvBxd01mvRM2xts06ZRxgzvSgNJ+WNH4b7GdDIs76R1fLwxV/KY41Zo/9xk4hIZpGmJhrmAk/1mr21/Qk/ilJ@vger.kernel.org
X-Gm-Message-State: AFq9FYJv8wmWfyJMvR8d3zdbFtQywlFTaWjOf7S7T5o5zgutl5Dkl09s
	yuovHwFp+lPqY0GdmCLJvqjmFt3AohbUYRsgYN3LkR/UGQ9eKRwWkv3BUhoYIbHhtXc19CY2xet
	G70fKJyNQ/luMpCYkQXxp8Wy5WP+Of7dZqnFV/tcfxbZoIR6LYF1DSkJn+iG/AoLT9v8hMW53p/
	VO
X-Gm-Gg: AYBFou2bwkl/QpRauJK7SC4qycQU3iRVlgEJC/ZD+f8mOt2LGWxxsEnFBoAPO8077VG
	ipHapkGLt2hd6xBzwrurMZyiR3JPGFFAYOzv0pU23c/E5l1WNCX94/7FtfMyc1QkefyyTfZpN/l
	gNR/9Pgc//iTGkJZVlP8tqzlUJXW5FxfCrsv7eWFOg+83NnrzAJ83FZRTYHjQ+pTs/CTe7z0myI
	wgBFcFquZPgtZ00I6skcjXc4GHtALcmaWdj94Xzig8ynum6404npp/GC3JLNtDlW4SotyEZ3D2b
	WGY/P/L88+NUzB0ZsJ/eTUmwNpWqXyGCqekurHvTo9Cm6vvsOKHhL7caScj4UIMy/8uMCug3yh2
	rpxshVrcE+cRT+tg/YtEtowY0Fkz3K3rdoaF6tPl+eII/NqaGLuWFULvoXxiWgwPxIk2yR4k=
X-Received: by 2002:a05:622a:ea08:10b0:535:1e4b:53ed with SMTP id d75a77b69052e-53fcd67de6fmr35057411cf.5.1793188850117;
        Wed, 28 Oct 2026 05:00:50 -0700 (PDT)
X-Received: by 2002:a05:622a:ea08:10b0:535:1e4b:53ed with SMTP id d75a77b69052e-53fcd67de6fmr35056201cf.5.1793188849349;
        Wed, 28 Oct 2026 05:00:49 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd649997sm587051766b.42.2026.10.28.05.00.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:00:48 -0700 (PDT)
Message-ID: <08f2bca4-621c-4b99-b9ea-e1871005f7d6@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 13:00:46 +0100
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
Subject: Re: Adreno 829 (SM8845) zap shader: PAS init rejected by TZ under
 Gunyah
To: Venkat Yadlapati <venkat.yadlapati@hotmail.com>, james.wilson@posteo.net
Cc: akhilpo@oss.qualcomm.com, andersson@kernel.org,
        freedreno@lists.freedesktop.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, lumag@kernel.org,
        rob.clark@oss.qualcomm.com, sumit.garg@kernel.org
References: <DMBYHSAP8KY7.K9L1DON3KDR4@posteo.net>
 <TYCPR01MB1184706197E878D59F9E82E629F642@TYCPR01MB11847.jpnprd01.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <TYCPR01MB1184706197E878D59F9E82E629F642@TYCPR01MB11847.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0NyBTYWx0ZWRfX6ny9J1vcMh6t
 OOJT72iDe1U3IP/BUDnqo3Oh2HLNT33tGt6BB+ywUB0X3BXoRGFrhL+xbT2RL5S0WP8tfNjm78Q
 uSCGPR8cahUIxKOvA8luLtTmVcNsnM79qsxzbqtOH026b4HVMn2chHjFZWIR6JeRTrw1e+qn+yD
 AcyoM0xHCAgQGEcSSzTCo4IJhpnhWaZFmvifYHt6qd6Dj9Yva5RGtjpSiMUh3cK834z8zEukabr
 z5JsU8uerP6pssl+gAmfPMNKO0vHiwdPPMv417H/RmKWriX8ol+g2KvsYAnsXvERtD6sM5h4Kzg
 7Etp8rJO/4nLc8w4vZSMVT6VZq/R/5ZuLbtQPabfmTbh2p+94jPFw4ZlJ59yeMSod3B+4+35C3Z
 oocdexEYtkugWqxVsddvBWNKGUUFT+MSZZ+nYN698Kg4bhXSVpC1oBXph5ri/bstjsYWrg27ITq
 eacyePkzStVIxiS4VLA==
X-Proofpoint-ORIG-GUID: AM63MdigWgbYfk1kilbs23i1YnnWpNzs
X-Proofpoint-GUID: AM63MdigWgbYfk1kilbs23i1YnnWpNzs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0NyBTYWx0ZWRfX6YgihUDe1FSG
 GeUQzdRNt5gFJYn3yL/Cz1uO6TzlkK3fJuIFQQF7FqaYlZdQ3xGrUIqG7UdnciB5EV80fysDlCj
 8vD5ogj8FCMzpzTNuUxd0lVJa7M3Gzs=
X-Authority-Analysis: v=2.4 cv=JodkP84C c=1 sm=1 tr=0 ts=6ae1e3f3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=lWCXY_QA7bm2s73i-iYA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280047

On 10/23/26 5:10 PM, Venkat Yadlapati wrote:
> Hi James,
> 
> Thanks for the heads up. To avoid duplicating work, here is what I have
> on a Motorola Signature (SM8845 "alor"), none of it posted yet:
> 
>  - TLMM driver and binding (205 GPIOs, own GPIO->PDC wakeup map), alor PDC
>  - SoC dtsi on top of kaanapali.dtsi, plus the board DT
>  - gpucc variant, A829 catalog, panel, touch, DSI1
>  - UFS, USB, SMMU, charging, audio and modem work on hardware
> 
> I used the downstream codename "alor" for compatibles and file names.
> What do you use?

Please use the name "molokai"

Konrad

> Do you want to post the SoC base (clock, pinctrl, interconnect, dtsi)
> and I rebase on it? I would first diff my TLMM/PDC against yours. Or I
> post TLMM/PDC since it is tested on hardware, your call.
> 
> Separately: I carry a hack disabling icc-rpmh QoS programming, because
> with it the display dies at boot. Do you have a tree with your
> interconnect driver that I can test?
> 
> Venkat
