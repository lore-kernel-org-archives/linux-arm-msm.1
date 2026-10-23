Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792751176;
	b=HxUTk/eh2DtbwSDn+JEwsSItV5RVwEH/gp6TE+5LfvEbCuS/0CYaerxJXuB6qqorYK/D
	 UHlT05BTEmwkICkE7p6mBvR91XVf1i7UVpztT+ECwj8PCh+kE1NxceFRjb6484RF5u37o
	 cipfKt/YLQMtuXmyvtmY8avHBm36yZbcNlWnb0T2XTvVKH6UL+AVIi6rP0wUDVVqS34Cz
	 1Qaqn8UeuVRr//ZznDucptJBxwHqRJFOyQcLEITbnRW1lpsHghnJAKbUuq+LLbOKybErw
	 nUmCmGXN83R5zwQbQWkgy/B2l1jaNu17hlSVRoLsgCnfWava89+7XwTwJ/lQeA2WzZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792751176;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=t38QF437OGSZbU1LgmCYZ33oL6v3P/HVKC+sKk2KKj8=;
	b=KQyD9yRqpX4GV27PsHECcxT0sRL1mD4tN5aR9ytzltREdL/THdhdhJPT5MLsr10sG4Bu
	 ZukSOLoaVGHALeUAg51VvqNaDRABfQblppfy/lP+Gx7XBwY0gEwBPOkndJKkt+yj1gT5+
	 cXHkMAT8kUhXB1CX5sYxp5CAtiQeSzwUKOYLva1V+eGlE5gt4I5OQRJEdkYKXeRIdLyd2
	 FfOH20YJvf2i5AdWRzT6pW/bb1yQd+aLCxa9nt4fkp8vEGjwx525S5Je0+C3srXC4za0e
	 r2/STA+Kk8v3y+Sj6QBFfTH892n7NjZ6lQjBBtedqPZjFQErfizww+mA8Bl/kFKpbqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QgBLDPCZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jwbdT4rw;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC91E606A322
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:26:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC91E606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=QgBLDPCZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jwbdT4rw
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAATKe2164235
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:26:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t38QF437OGSZbU1LgmCYZ33oL6v3P/HVKC+sKk2KKj8=; b=QgBLDPCZRKnWFt7R
	GQySepEZHhLJwvp9cpFc1+XalNBUIf+bv6eGjktc3F7///EVijMuSwVuBL1OzQIU
	beDPm6e3dZCXtad1VbQ7ZrjSiwtQKRX7TGDlo4YS+Z39vTRkJOoEue4ztF4To91h
	oNPxy7VHMwdnba8X0SQrWr1nXsUIny61g0Yb5wJta5Te6CVoBLbk1msoBPew4e1c
	NOprPZKQTHaN/t6u4bbUuvmW2zRsl5W78TKWZCifjcLnkybNEp4GPBjUCzhx59tD
	50pMBcgKYPWhJ/wpQvxcyotIspPglT7QnofnPr9nHCyUkdh8ieEGNhBmGjJ9W0m9
	qxJ/Pw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfpahunme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 10:26:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93edac58b24so18708485a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 03:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792751174; x=1793355974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t38QF437OGSZbU1LgmCYZ33oL6v3P/HVKC+sKk2KKj8=;
        b=jwbdT4rwDiC2J6hxTHfvkqUXCsjVoFP157nK197lidnh2FgMeJMDyefrhyFNwwpSOM
         b13u9VC7w8sRHTazYLjNWRbXK02QbI0/9RTXgzvz73wi85bOyqH8NJrZbhS8cDDrt6vj
         mAcdfqlIUspd6e5ySasfAw6dqe4nxksr/uCL2suATiC0/mV8xBsz6Rma/wS5HvRvH5Lu
         p43a01I54kFbeuFUwdE94N3CDEaAqEPHsQXdDp5iFapmOreKisp3vpihc16c3Hif7uSv
         XKm6G0XFVZqzlEHC0soKCHDqOhvzOsDl/PYWHR3wqN/pBFEEhx/hbv2G8JhkXSJhhQL7
         j6dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792751174; x=1793355974;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t38QF437OGSZbU1LgmCYZ33oL6v3P/HVKC+sKk2KKj8=;
        b=Qxsy+KTO7sxmS3QdRQTJ+jlQh/zzB+3LphlQ3d9tOlOBgeuSyygvW56TB45oJLmhIM
         6NmCYYH84KAOiqUPp78kpI1baWkFR8BuqVSGW5LRlmsGyOSba83e/XOeCYDKtSv3xkQV
         B5SW/LrFH3FtXVaVlWmvtZwW0xj8N5MfRPG0d5l5caCRuIHtuQBJisqV9gN6jhxcv0Pc
         Cq1yHQvbkqG7ScZ/rXo4It+2U+TSObIATeNUANXgEJyNCZoD7CkwD4qXQZq+xc8iMaVf
         FsDmNwKL/R1DlnPWCVePMuy99wmdsmL16WVRb0MuryNSYZJFPoMB+vIfv4R0UlrnZF8Q
         4klg==
X-Gm-Message-State: AFq9FYKAqLMsLW8l3T15085VWEJIbvUpyh52KBiTAR2vNgtRdr+Mt2TE
	5LdvbOIj2opCGRsNm/FnLaLzitq5GW2sIIYENpKJhI2/c13edoj/FyEtOtTVXV6PHNHgcxdzbIk
	4Xn/LRQKle5VFaoUMsD8FY4Gf9tjhxzXUuzazCadVu0JEBwf5cKdi9oMS/gZRQI7zv2SX
X-Gm-Gg: AYBFou1QR13FPU0RXU9ZYrrHpIRwX93Lr68iylBXTUhP60SXYZkHvxoaQRI0PXqHUtK
	prOQiATEmQpQygCN+b0qHWQP9v37aYkeNOUlZVxOC+QfUVtYqHpaVDerW7qEb9A5HTZZmX0f4m5
	0ILK+ZWUlLbhye44LJ/mA+EI6unaZPp5PzcWTzh1qO8WogsyZwngUZOJHLDHmVQVDxBBPLesNsP
	8UBEw2AG4YKyuQ7Q4smYc6k95/54ftKnI9hnWEbxLJNX8TgflC3DvrxXXaDc+53oIM/olTd0COW
	Fv7J3G84nlBQWtquzngLGUk9PetSyKwucPmwvAUMst+aXofYhLoHAgLPxxvIdExtsRLivO7ZenU
	zvdKD1FdpI0qwXTLnBvTJzA==
X-Received: by 2002:a05:620a:8121:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f6f96e833mr361780985a.5.1792751174269;
        Fri, 23 Oct 2026 03:26:14 -0700 (PDT)
X-Received: by 2002:a05:620a:8121:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f6f96e833mr361779385a.5.1792751173857;
        Fri, 23 Oct 2026 03:26:13 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5cf7164sm85473666b.76.2026.10.23.03.26.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 03:26:13 -0700 (PDT)
Message-ID: <2bcea2ae-b79c-4138-98ab-aa401466f9f2@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:26:09 +0200
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
Subject: Re: [PATCH v3 2/5] drm/msm/dp: Add DisplayPort controller for
 Kaanapali
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com>
 <20261022-kaanapali_dp-v3-2-b5ae8e6083c3@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022-kaanapali_dp-v3-2-b5ae8e6083c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0MCBTYWx0ZWRfXy65FhuWpzbbW
 fUM3qFfw1Fj9gQIlUlMO0vKNFtugMYaLIETSsh0Z8agJvz+rFcd/xlZKHm+i8APMAVX4wTuhr4j
 OWDLtEyAlh/Vfp5Zj9D2J5kbWU8UHj0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0MCBTYWx0ZWRfXzmYZAcGnjx6P
 q92Ynei0qPBgIQNtpAc2hzNiSjf96T7j3IK3MP2eB/I8r/X1rGykKTLHtnwN0UPLVCLz/tz6YdX
 NZI75ylhXPEL1iQLSKUk8tZgADHbmMbwrvamXqBF5hITA2M8Xs1y1fh9aOYdaIOKGpO1petbsvB
 dsmAePgxFX2GD+tXnl/tfokQBleMZbEdFcmK+yQvfFoX+6qafP9U6asbCjUOLYqhcbIIAY8l5n9
 jv7etZoGnZgNX/4eHRrjom37LzhWXzrnngoh5ZTQ/n7O7d+HyJZf0G9/VER3dvE1n865QyosRR6
 Sed3i6OIzPWjf4DvdDbWG3udD1op+5XZEw5YI1ylZid8X2FoPy5ya7XjbDpi5BUJBGwA8P2HDXc
 5vviu6qL7syW8+ELtTKP8+/LKKq8JOHTqTn8GRKwMr5uIAuQRyxu5g2CauHHPeiQEULQHwmwN7c
 RaeMKQVKAlMaQK7kpTA==
X-Proofpoint-GUID: 0edGsRoxsi0ZH32insHQH3cNWACMqCH4
X-Authority-Analysis: v=2.4 cv=YIMKWhGx c=1 sm=1 tr=0 ts=6adb3646 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=pYsF8wcMre0XH_84TdcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 0edGsRoxsi0ZH32insHQH3cNWACMqCH4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230040

On 10/22/26 11:49 AM, Balaji Kalkonda wrote:
> The Qualcomm Kaanapali platform comes with a DisplayPort controller
> with a different base offset than the previous SM8650 SoC, add support
> for this in the DisplayPort driver.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---

you lost the tags from v1

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
