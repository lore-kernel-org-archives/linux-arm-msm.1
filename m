Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6BD472085
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789388879; cv=none; b=OWwEdTD+HwTSKXiEx2d16tY+Px87u+GzIBNHP8+zR/C9BAy9kgZyb90S8Nr7pML27D4WWX53n+kW/6TjTQyaST+Aon8g8OdV8rrGDOclUG3mb1YTsoL/UPl26Y4gA8AUDk52QuPaUV88Yi79KJwe0DnKKuCc7Ba0fz6Ams9Uqms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789388879; c=relaxed/simple;
	bh=3dvdlqTCgW0xyjqmHY7gt030XSmXBe1FOIXQX9wJJhk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m+o+GILzGX088z4QG0Ey1Tafwqr6191+yIlOA6iUDpXZiPxt+RtdMGQjZ3KK+A1KfGN/c89r5Y3MgIwB8p/9I3gbzqZYRbUUjPYAaiPPgVFGLOVvjYwIdY1IB8mPcGPMs7F0A6R4Z8MV3ZsYsygaQIiExwxaOupnwYdMq7wrPRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JYmFp61l; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LiMKkkhr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JYmFp61l";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LiMKkkhr"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAm1dd727598
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:27:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uZIdKSxfOJ/PI2RORMPMKxcyGG3r0lPC/XwjPbafMnA=; b=JYmFp61lnN8mJ1Wy
	S0emWZM0Y4RrjaJxcAIM8sn5hI5YAB7PcCR6ldmSnWKHdPDIcLTouqHl1MXXY0Y3
	HfzChKsWk8bf9yl78oPKbMSKO90TuHFbkVhr76qSg3ZYhMMvgO25hUbxGvcnkt17
	Giir4KWUQl3aRwx5dRSY3r6kXXY03q//qPG8RKYM0HPpTuO5I6VoRHZhbOPPVNBS
	OFkkOOJD1GaTpUtu8KfuFGo7jxA9HirGXeEx3FsFPg+DChkRZBwpF/TLqCc3JPN8
	He1nHUvgtQJaLO7ijY7cUqqhVQO+egG0EqaUN/rcY8QAmoWEzhaGwuYZO2uD6xJt
	jXxuAw==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5rvca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 12:27:56 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c665139c92so115584e0c.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 05:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789388876; x=1789993676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uZIdKSxfOJ/PI2RORMPMKxcyGG3r0lPC/XwjPbafMnA=;
        b=LiMKkkhrAxCHr/K5EKgQxnDYDvO4mZPcRMH1LMXV/wYbFwR1MXW7ueIXQ5onjtJhF3
         AHREOLBkP3PPs5xbqPOK6FtFPyncXX2TFKtClsXZWFc7uACUjpQCWc0EZRthiH15izvx
         sHuCmTpWW/GJEPNDLyBH8Cdo/InZSZg8FARyIwvn9jHWIbLpRlEGyrFXVAcqvR2X2BJ1
         i9bU0OBToPod3xf0MAM3r/safxsBQX1Vee6ezMH8o+CeIdYAD+OU3Lhjx+4QV48Yvk7Q
         2DHUQQyLFeg/XtKyWI0BCcfZEkZdPY0+ssEMJhJaKnb8YJ/R70xSxiQpfFH3kpVEtfWB
         Pdbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789388876; x=1789993676;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uZIdKSxfOJ/PI2RORMPMKxcyGG3r0lPC/XwjPbafMnA=;
        b=au0m2dPLXOCtt6VTyEj1QE0txt9FRp9W66QaoU7v0f55K/vgLZ8H71R1v2CALtfml0
         AheATaDFVaEnmxr6rFcVfSA1M7t+jolVxOQB8/rQPvAF5mWQT3wJhev42SYrLcQEpse2
         tot82y1w4YxcZEqiGPwst9Leb6xCHqRt7ms9sT8ry1023tgXKdps6cQbLWUTnF12I7TS
         KP2O1R+WFuN68J4dIpn7pniGHqyXR1R49cPyOCS4u77wQB4TQVr6GOnZHHobqD1ad1Pv
         n/ielUfRiLfXx0fvNkbd0b3Grj1VHUmvcq9/I6GJz17quvYL/We7ky7uDAw4SUEPGcka
         KgDQ==
X-Gm-Message-State: AFuF++lh2bGkm+6LRnI+rg1lK24cr5E49BSIMBd34pmH8xTl1pCkr6Zc
	miyl1rU8Bj0KLSc2lwCfSUYteGM6nND5y0tRL0HKVB+JpqFxfzR5CGsQ4XabigBOjIwzJkuU55j
	eVa9Jl7f/NY1A3nJufbikb6jtQ3ILxODJr1PWmSIe/YBqBwWNCIOTNGDiRYT9m3DvGpM7
X-Gm-Gg: AYBFou1KqUpbDNOkwxSSzNjneiAM7WkFFbohpdbhrdcUVN28U+FYHddIRnK4fCBeiI9
	JH3ge38W5OPay5EXh9VGwe8TaaRdUOd7oHKkDUoLQwfdi7PTILz2n0gG8nfL3hzNG9LX0XjZl5E
	gngSVBAHn3nHE/8AMFq7Yx6eBIdHPwkQjUmprEFM5K2ddGvGrDS/ax03AR4Xo35jmxUReEfP3Lh
	7FmYzeARM401Wi60go3Yeuz9jTDynkZmxDhQERIjF5o1fjI0ba1SwX5vlvW0O1IQy49oF4V9NH2
	SdquF5NRlB+xlWp8Pt7ui9xVhIxOylEJt56Ygr0ay7ktPfOzXEmDAmAx9ZakjF7mwtPu15PHct/
	pehGmNUKXkLd+X9NiTcsTog==
X-Received: by 2002:a05:6122:10ea:b0:5c3:b339:7b19 with SMTP id 71dfb90a1353d-5c981a8de22mr379842e0c.1.1789388875623;
        Mon, 14 Sep 2026 05:27:55 -0700 (PDT)
X-Received: by 2002:a05:6122:10ea:b0:5c3:b339:7b19 with SMTP id 71dfb90a1353d-5c981a8de22mr379832e0c.1.1789388875181;
        Mon, 14 Sep 2026 05:27:55 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a046c5fcsm2388912e87.52.2026.09.14.05.27.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 05:27:54 -0700 (PDT)
Message-ID: <4c28e436-513a-4c1d-9cf7-3aa89cd7b819@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 14:27:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 24/31] arm64: dts: qcom: msm8917: Add domain idle state
 names
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-24-660c31187819@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260914-b4-idle-state-name-v1-24-660c31187819@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfXxOKWxvoVtSeP
 +iP0fhxKdq5Hv7sRi8qOkD4DOJDTkHZXHKiZ/EPBeWUm6++ByoVKjErQWS9eJz6unx/7DrMskjH
 4KbYLau/pe2e8X+B17DDpjuUpFl4qSU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE3NyBTYWx0ZWRfX11icz7zO0uqX
 b35E0OopVKBFCwfKNxdTgZU7Yygkr63Msiw2c0QTttyCvKPrIPD+lC2tnRdg2NP4RM07iAFtSuh
 dxwcXG93+ubwhWHTpRHPmMITMwUBIb8Qw12jdnb7gdn6lXY8yOnqSDVkKoxMrCgUHqEX4T0Nf6x
 WaoOK9E4bDQVn0EuPH+PrkgatnMgSHmynZgGgrOOBGkFqGOcBBdR5S+isvHaVclGhw0MPfpbVPY
 OuQildKTEpnHLRyLAbkjYUDGUOj5IS1WevwDgPgOIEoNlFpF+Clr2v/czVIzzzn6FuHlzZONNdU
 i2FmJFEYkc+h9DZNSv9705nF6oCnWdnv6UACETjrOK+mhBQIR8qV/nJTkWRC1zXZfjz+ZVFzK/n
 zh+IHjt7JnlVYUg9JMBsA5RXuhaH+L/PnjG2ubhHqDhK2+TDIlg4bS3vxumm2gGC7sxFCrikkoo
 cIqoYprzAdH1N+KsTlg==
X-Proofpoint-GUID: 1gl7ZwdahjVzIr88y4uYGl4hMDFagRed
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa7e84c cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-ORIG-GUID: 1gl7ZwdahjVzIr88y4uYGl4hMDFagRed
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140177

On 9/14/26 8:59 AM, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update the CPU idle state name to match the low power mode
> it describes.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
