Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E204399C0
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 14:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787581155; cv=none; b=sFiajsiZtYB7O0GvPrHr7ws4X5JyoBupiZq6EfOTHWHs1PPzZ8z9DXwn03CNCSTFvm68O6UzjcegkBVLELWqSBZp5XSbJywNxhehgHe7pw0JPz5CC2S3YEfZPhO1KmUa9npOcP0le/FbhRhc6erfJTjGKqtJwNrARjkrMMZfuS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787581155; c=relaxed/simple;
	bh=uGBZvFe03XTRnDnScoiVwUfr6a/QNJgJCLL5rZ5Drhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q6ZR7t+DGmdwyc7ZFcqDvbP3qJYIa6w6Dh+UaWRuMm4qo94JdGfdyJQQfvoMeD/PIttAPMDSNxlPucgFgqCMiY56T/TtpbpK2iDBSsMrAwGefR+m1NGNPiG22I+ZbFgmwg3Yun3yi8zgzi2l4OfOzg59fETtG/S4Sc2P/TJfusw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fd6Iz2t0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dg+uUqCV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fd6Iz2t0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dg+uUqCV"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCvHHr2006969
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 14:19:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iUX2OhZfsVuqQtVDi60W0GQY3wPaJ8rUSyWA44gD5Mw=; b=fd6Iz2t0/BUeqbt5
	YJnb8iyeIepriOd/Rd0itaNS1YPq/EgRMZL86MRM38s/D/WwMm1aocnmW+UxSE2l
	RqAbm5oXG47xkLiyYiLziMgO9DYCgILYcWV7j++4qBQTB0k4DILM0ekAtuBGtic8
	Ucb2t3ncQzGy1N7y4ln4b+w87xTnyJyL6KJCsiebN6APXrUcRaJEazkKt1P030MA
	ss50uvN+YcGG0Zt4xKc7eMSqg3nlzsgwobg5tGCDwcR8TXmB3HKVyzcTsqqVof0i
	wPdiPC0LGm7k1Yc8bjjDT8YF+TLWfkLAaQRQmiHhxD/N9dDffStnPZ955QbECQt/
	mpTsvA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kv790am-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 14:19:13 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-73966c839bfso81478137.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787581148; x=1788185948; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iUX2OhZfsVuqQtVDi60W0GQY3wPaJ8rUSyWA44gD5Mw=;
        b=dg+uUqCVmIYG3RJKP1IUhZNTwn2o2GjMzHORiVjU+04EBUHNelSFcX/+R2RJf+grAK
         rlu9j+p6ibaXhVwHk/HMiIWkQJvxahMIyYgoC2YutiivNf3APKVsz7s8lKcEvbweYyLF
         TDibnhJC76ql67hXSvjiwnqAhEwCuCyftALGku7geP2GIn2FdcXvZy94n8YVyzUeSbzp
         NUZqhVwbkfBs4rFJ8Axabdk6odIqxVE5pRxvZscPo9I174N7JGMuonHKTUgWOuGdwHRu
         V0R4Yuaojc5wbK3USaQDGuFOCMFifgM3Muvc/we+4THd5viEEaWmQxJ+G8Otmp5A6YyS
         PJhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787581148; x=1788185948;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iUX2OhZfsVuqQtVDi60W0GQY3wPaJ8rUSyWA44gD5Mw=;
        b=fgxEchvevYB5/CDPddp4251JofvcKxrbHmJ0ArvtpnZKBcMLuWBjpVui3LuJz1Z5VU
         SzOpH+1kjp5q3BC6FwEmkGkCS5ObtO5fIRxvzhK+22FJ2qGfXexXfgghtsPkCvRBoLKX
         0xga81bd7lWAD5HC/x14i2mt/S0zS2XeKkOuKDduRitFnRW4Rl2cbmi0grc5GkneV+kC
         qANje3Oxy8TskfrlQxeVVzb69uCyi8dXNS5mHmPtAdPZZIIMm8pgdrEOKHLYUyewWNo9
         YhGZA25ZqeHw+hacps5O3QsdXa3PDnvNnx3aHxLKui0vwx0XB11jB3vFhgYcfQnf+Pv5
         T7UQ==
X-Gm-Message-State: AFuF++mhzLoboWMl+sf9e7vLI/Ky136HC7Z5YptURBWMXC0wPy4nqZAb
	dFlvaz6J5hot/XnMKzFXA1ISSwaW2CQftd0PolSV8GPxjnaZqFjYWrj8qA1Tw9dGGEM2Kn0yEDk
	3Khe0zVNtf8Cw51U9K7tTJhfI4OJJKzX3k//j6XIbbo10DZ5YjxfksC2n8WOvGKcmkymc
X-Gm-Gg: AR+sD12eilNwLBrcmGi831SKnBsVj1+HMyJg1/IUFbx02gtH1iBAgsDsa34Ram7GZ7n
	iFiC1+0csjAGBltaqlt3KxDO2M9zL7I/0OUFqqfXYeeKaUifx/ZZXDoat15zrYA9am3KrfCEcoB
	UsYZ4PXhii5zHFsAcvpn4gbiWuWLL0VCc0yq2JFoY9RQmSCAz5/k9FR2o1sToa03mgc3D3w7WWW
	zd2aFy9530JhBn4uaRxfDNVNqMCnRdPa3dPZMM+FDYg3cnmsOnYA1SBLp4EG2E+j0Oe6KwV9SwA
	i+jWatoBv8qLdYsiGtoYsOrCLdxHuIVheJZXXh/FLpfUbPkLaOs/qqXJatrKybGv6a0fP1YoZVp
	8RqUSwPeicZEcl+Vdm2sdC5MV
X-Received: by 2002:a67:fa03:0:b0:77f:76f:2c58 with SMTP id ada2fe7eead31-77f076f3cb0mr479088137.1.1787581147660;
        Mon, 24 Aug 2026 07:19:07 -0700 (PDT)
X-Received: by 2002:a67:fa03:0:b0:77f:76f:2c58 with SMTP id ada2fe7eead31-77f076f3cb0mr479073137.1.1787581147092;
        Mon, 24 Aug 2026 07:19:07 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a1c2fab2f9sm14278301fa.27.2026.08.24.07.19.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 07:19:06 -0700 (PDT)
Message-ID: <01cd0d90-2908-42cb-9ae8-29828d4c03a0@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 16:19:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 8/9] arm64: dts: qcom: monaco: Enable CDSP cooling
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
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
 <20260809-b4-qmi-tmd-v8-8-b15d47adc379@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260809-b4-qmi-tmd-v8-8-b15d47adc379@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Cfg4Irrl c=1 sm=1 tr=0 ts=6a8c52e1 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=lpwU2ilW0SqlNkBhVkYA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEyMCBTYWx0ZWRfXwhoaNeSQAjaE
 R+vI8AaVOuwQbhth3Xh6Ca0OWPiJQxjOvs2lXAhYov21PyDMlgxUDbwyFWch0ewLFVlXRxCQweZ
 zDgFlfSg574gvuWn+RDasKbY0ok4Z8o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEyMCBTYWx0ZWRfXwFbXX+nTYdHd
 v8zKvjtnNLutnW6hNSb0/fqXM8qmF4T3Z0CHyOznXtbcWnDmEmajaZLbLEHdRHDUSq0VODRoNno
 WH+Kgmh2CsXYfg0EofzS4H7JGJVtNXf8fPZyqZLggdWHoBJ2XMnq0/iSbhTH06TCcUfzQIqOw+p
 8bKCoTwo/HIcwpcZXwME/HjHsFb3ljBIXJ3/S4v4dKdt8Z2ck/5nKWSbPu8c0BG1ejVFu1hdwTF
 8FkaWTgvvpDGrq2P3q27MM2cIealo2z9blydE4jWNpwYpZ6kgNq1Yt/C978WuhsHSMaGmI3cGrj
 dAily7f7QGsUeJcxUVcAzjTvbVAzapxs1b6bj2zyE9O2WHg51HCaiz8lN6Rw+6grd+2pcHMMXnm
 9qHbwWOcoEH+PH1zOzRUjKCJse0GYvw8Rj0TDLClhB9QxzEsSZWgJf8qc4E1te4x1BijR4GkNHq
 TI9zYZZhdMBlwBLDQQw==
X-Proofpoint-ORIG-GUID: LZmd-6bNK2n6910QyKn9QToScew8c_4E
X-Proofpoint-GUID: LZmd-6bNK2n6910QyKn9QToScew8c_4E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240120

On 8/9/26 2:29 PM, Gaurav Kohli wrote:
> Unlike the CPU, the CDSP does not throttle its speed automatically
> when it reaches high temperatures in monaco.

[...]

>  		nsp-0-0-0-thermal {
> +			polling-delay-passive = <200>;

..and here it's 200 - I really think there should be a single value
that makes sense, this seems no less than random

Konrad
