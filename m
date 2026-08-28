Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087B244AB98
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 13:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787924541; cv=none; b=XM2RlhTcGR3KZTgnzbSH8U7L1slXA2ilgj+4SWPW0k3zBrXm608LYwlosczc5YhoeL4l04AEs5RcJ5iUG6BIsacKApE8U8+FgRMb+ewZJeftg3lCSF1u3RHLk38WDFBDLj20BA9sH6f/gnX4TfGABLeIxe1whX/jKPuGOLgcXfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787924541; c=relaxed/simple;
	bh=P9sorK3EnMx+N0zFoDx2cEg7M+adcYf81VKFyiOOUD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oW39kXmbpOSu1l5hFCZqZs90UZbmJwCxIRtBplWo5NDTjhflgMaF0iXTEE6z0tcia1kOG5URqtK1R+QOytLpR5v2TSaOBhXY/OC5L0zSElzqeLzoa/GPMH6TRtz6NhTxQz1yl1m+Qq2oKtfVqf1169X79kRysOx5FqS5q4plKrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bjIR71BW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Lib4n7iG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bjIR71BW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Lib4n7iG"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SDRf913746693
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 13:42:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XjGRFZVnlfyLY74MHaSAHoyZFlwEBuWlJGFGGTbqtQc=; b=bjIR71BWu2jN0L1Q
	2i1gfAGclNEsmVZpWx+0aiEhHYb9x/QB5EWLrbxWoFON+2lCOntlsTL/rSliU5yu
	x+Korga1ywAKdsrK8/zcWWS3oqiTJnOG9Fxt89CsBUFH2AHI28RuU94b2lmmqwRr
	nyI/HQ7VfSAcUrmi1utj+zZPy48ylesDJganpz+8VulcjavQZXiN8SBeDjG1Rnre
	sS20ww6ZH7cHmhdrl8pHlvSnrDSqlWRwcOiq9xJlt9vK1kzM0PNMYDTPZwS5jesX
	RBREj9ovoo2DAzAghwSwF0RJ5GlUZRRUM8zH9Tl4CRReb4UgCZf3Cty533TqPbIb
	GSvtrQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb42p9tmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 13:42:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52ff0dbeaabso697861cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 06:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787924538; x=1788529338; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XjGRFZVnlfyLY74MHaSAHoyZFlwEBuWlJGFGGTbqtQc=;
        b=Lib4n7iGNvGzInYn13aiTKfGOrH1JO4l+MJZmyq02Dqzdvoxr9rFemPU/CDN+xh0lP
         KqpBGVF1scUAZEfO76zKpnb0/Rds8olDvBHJFRvNiyKxC7Z4JVO7P5kkQhZZCG8cfXEz
         e9JltzwJFMoO1Ynp1kUDSoub5KLjOfT2kAJ+w9t0sBTmQwMPT5ai8OT5XTxdb1F3MZ5j
         xp6U1XT5glrMqTW+ZG3H2nqBOVfadsG6SOHM/anJe3QLOs309XnozSeUB5WDdd+R/zQx
         p0UmymXNlPmP5pHIrPUbsZdFtPKYmQWhkpQzeabniQecWgP4cTKSlmWgtyk7LuWdUQpR
         eVLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787924538; x=1788529338;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XjGRFZVnlfyLY74MHaSAHoyZFlwEBuWlJGFGGTbqtQc=;
        b=nZOhI9gcot2sTqrcpf0SDu0ELstvhoPKy0E37QkgAISyttuQvfMYtOedCej0mb4dFy
         vQW/Y0YKS6RXB3G6l22Br03cNK3MsRcUqtKm1E4x8n09lQfq+RgTzo34eMZ3vd2oKiDM
         2g/LoVPPE6JapaYfVxrMohUkzjT8sN25YhWk/7tlu0QTqnUa7DGyBC8JvWsK+3fNJ/8a
         zuXE0Lwl6/7aZEK3lbGZN2g4Dd6PSmFfN26pgQgNttC9m4f7VXki90IIY+9KldxIM45U
         ZqWjvJlvy1aE0QCx3Q5ToBcotxQIQACtPXXRqW1caEqpRqcWz/l9EkKeZKh/MkaXGzAL
         Sl0Q==
X-Gm-Message-State: AFuF++lq53J8ioHoNVHb3TLoGlFNITHNNN1GP3mElq1RWdJ2pGlO1H/x
	Ffr8dNj4Udlil8BFvvjOTAoeFUeeanMR3wY6L7P4DpXBdABazpVzM42yW8GpIJwlZKTnKofIOd2
	XEwtcdDaR3pzrWCeb3yAPVu1HKDr/GAbuYVCyLgquccQYTVewM0vZY9XE3LnBC8267p1p
X-Gm-Gg: AR+sD12By2CrlSLunNAf6dFUMUAogl4PK5+yoM9sfcPcwrrUv1+T2emo7MCGXUPiTpJ
	a5R6hTB/EtyprSGX1y53jm+KOyHOfQNHOLJPcPWWaA3G+OxwxrgfO46596/dY3SYUKHawZj5RN+
	W4ZKLmm5Op0hdiqUBsfD4OV35y6g7Egx66Jiom8y1S9cLffM/CmCCeHiq21auQ6pkBtL6lRK4Km
	HNqJ3YXRt9BvpyHHL4a6pLbmv7QTdebM6sDcYlEVmfH9tIsPHbFYe8qOrbZvqYG/sJ09QgdcPTT
	BZH8sXs3lUERrrCPbGQACG+PrSrfC5eZgwoGLZiCNZhRQvhZjHAiPIi/FSO9ZykxYKOf7TooeLr
	POMQmZnYzkEM6WXAlnCIJtVI=
X-Received: by 2002:a05:622a:1348:b0:51c:845b:ac4 with SMTP id d75a77b69052e-52fb961b8a4mr52113391cf.3.1787924538198;
        Fri, 28 Aug 2026 06:42:18 -0700 (PDT)
X-Received: by 2002:a05:622a:1348:b0:51c:845b:ac4 with SMTP id d75a77b69052e-52fb961b8a4mr52110911cf.3.1787924535956;
        Fri, 28 Aug 2026 06:42:15 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a611b5c572sm555948a12.4.2026.08.28.06.42.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 06:42:14 -0700 (PDT)
Message-ID: <b76cbc5f-fa84-4eef-a4de-c95ded152cc9@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:42:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 9/9] arm64: dts: qcom: hamoa: Enable CDSP cooling
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com,
        Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
 <20260809-b4-qmi-tmd-v8-9-b15d47adc379@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260809-b4-qmi-tmd-v8-9-b15d47adc379@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: KR1rUrzTswbzj07FYOLvMUsMeWEhOZyq
X-Authority-Analysis: v=2.4 cv=ToDWQjXh c=1 sm=1 tr=0 ts=6a91903b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=_nN_CDt7C_a4776dohAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: KR1rUrzTswbzj07FYOLvMUsMeWEhOZyq
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDExOCBTYWx0ZWRfX6BS3Ja9nxkKR
 BhJLZbJ+tHMWrtioMFa9q55iHTQhdziZJxT8bMOGUfF/Ib/zixNTVVAcb3+04heDATn1ivu2Bik
 QjyRzkolwnu26T1MmuVPfaXK4hFoyeo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDExOCBTYWx0ZWRfX3oym85VW5Tw+
 fwG7V2CxUS3bpcp7HIGpjM0FQdxDidL5HYMukaaxI/O2N+uJLq1h97JpAscWhP0otoM/xo1/fvd
 7uinG6PqDmD9xHYJJZMo3OTcfkXae/rBJdttzVPGvTISCuwF0qOYp9LjEyRXsnPd7cLjp7xBRLU
 E7/nu07CA9cleHkM8m4OUQ9/ElZMEcBo4UgTFnSCl1fG1aifdCUliyavFoclGe5ARfjhhORG7SV
 l93/M0QAIUOY34qqaIY/o6tJV5Uj2cdwvWw2nJa6bii33WvX81WiqtX9PsVS4+WA87tMTzwnEUa
 p8f6LTg+tEFu7dFth7f7EBTokr9kwHCXVSBt1H8O8S04DFBspSPpeCYS5fn739cXxd29REyaUp2
 T1Ug4QiRJUbVTqmcoGM458gzRQYKml/h/UJbbDvi6HKXuSdRaKv8dwmuBMb2ItPFgCbHPo3U9ly
 d0j9BQFCCdqw0BmAZfw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_04,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280118

On 8/9/26 2:29 PM, Gaurav Kohli wrote:
> From: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
> 
> Unlike the CPU, the CDSP does not throttle its speed automatically
> when it reaches high temperatures in hamoa.
> 
> Set up CDSP cooling by throttling the cdsp, when it reaches 95°C.
> 
> Add polling-delay-passive so the governor periodically evaluates
> the zone during passive cooling and steps up cooling levels when
> temperature stabilizes below the next trip.
> 
> Update the NSP passive trip thresholds to 105°C to align with the
> higher temperature specification for Hamoa IOT.
> 
> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
