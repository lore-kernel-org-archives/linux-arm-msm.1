Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793377470;
	b=wDFZ58VN03OM4cVU+Ub8VFW1rOsT2Yv1pPom1PLMU4mHAZSVn5VMFFos991mbsytvaIr
	 aM9vVZz3ShZRWv7cIdDHk9HXI+fw7m8TXC6WO7qqpvJqz9O+d0b8FF3QO9mkhvTaKEJtO
	 XFcNSCSHBDXSqfH+cnMwilMA06LYhc/WoGGvn2Yg3IUFhDgVrrW52qR4Y2DK5BHMVjVqN
	 PfjGZ5dQ7uMMwA+OTYqfeQTOCpXvZwie4QwOq9C39bc/Kw9pdTyXqSh3Awu+VZqiiKRsV
	 yvQtbhox9XIj8aeaEcR6BlPU9MevoPq+mg3bPZbj+P8lZdgZeEgSpbR/QoAkaOwl+sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793377470;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3oipfx/6lDsxtTjmVcBVztBT3vIDGaMBFdEc2DAlZLk=;
	b=Ejr177xCRdIq3dZ9G65mqQiF+eJow5aYlT1oj3r1B69TuQtWDh4dw6Ltn3jiu2q70fAJ
	 wBbLfvBBFeWSwjxbQFTB8w/2CpgrsIF8SPY8cQ2WSrnyjZpiFktyYc7iFWEDRhaY+wowc
	 Hml1GCYRa/OvU1QwzOCjSD29AwohE38/EHuWBjfeLXDe1Hz3zMJ02HUHbzYTWD0VNIr5L
	 pKqwxVRcxt+z9lld+gRd6rCaKJ9lgdd276uU0G5lGcCScn23JYOWG7zugUu9q1ebOPpNH
	 Koy9riDmPfMF2qa8FPQ2gLVlsW0IUoLxEELW89WaLs+L6Ya5miYFpvMOWV31oG9VLgA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OggLu0l1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MYObWsBT;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EC3606A320
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 16:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44EC3606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OggLu0l1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MYObWsBT
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERBIX3564329
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 16:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3oipfx/6lDsxtTjmVcBVztBT3vIDGaMBFdEc2DAlZLk=; b=OggLu0l19vB35JfI
	fw1RcPInZWESMKS9U5DKkhLEG8l1LF2tT7oPbrZqjqlxyoiUqe4SkHI4x/X4y+yb
	qQgvSaro1se3m2HPvBtmrEsPVbw6OOtH86KDauTo0IuaWxdOf246PhdSIBAU+AZE
	+2QsV2/wjAY/dLX8I3aXfpirf6dCWaLzxELZo3GoQVP8+qYPWaE3azP486Gl6oHg
	fK+Rbp4349jfPxRGwU4KfTdw55vTMP1YTyu4YG51gMwqQwXQsD2J9X/539n+/IXI
	6TVvflByLMzCF3rqDgYVinwsjPd4/KuiKC9EEPt25Wm1HfLXLTK0FaR2RFYWA/Pt
	AyHkEw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qkxr6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 16:24:28 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1ab289bb41eso717053c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793377467; x=1793982267; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3oipfx/6lDsxtTjmVcBVztBT3vIDGaMBFdEc2DAlZLk=;
        b=MYObWsBT2rCngOHupw8onZpt3eWJgFKK3mnsMINO7YyAEcDDX9CummcyoerQm287MY
         NTePABRckivOolrEaPgB2eqgLlwjRyXPn9UVo1DmeZ0mpzgPx52e6tVGyPLKp2SEbrQT
         JE47pI6pc6GgldL2BLmxoy9hwBe5UfaEohWRGKbwh46mqtF8KjmDaKDIGWaZvPLtq4/I
         pY9L/fvH1JJ6Vp9L+DZ8OU+Z8CZfH8q002shk+zQLK6u2DPDzaTaIM3lhoPsiIBKIbaT
         HjcwPkVsJNmFAxkORd/eKefd9tPcDRsQgNg/qmukadQnV+4Hl1annFXPXn7YFFwU9X5r
         33mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793377467; x=1793982267;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3oipfx/6lDsxtTjmVcBVztBT3vIDGaMBFdEc2DAlZLk=;
        b=Jvnt4+FZzGNmmAsrWiQaPzigIcnG0kXp1yqX05e0yu3lLCD52dPs9SOjhdZfrCxsbc
         dqe3hI2Q5m7RH/SWot9tA9i1eRbxlyU/oHcQ8UnFPjAhaR9GWL7G34rXM56ShpPNTVbR
         2CtyFYZVJsrvVNOijaD5uKirc9+XOZvoH78y/XQRh/TFyOVprgG2N0yZwicxHVmZz8jq
         JvNV8zlJZHcbNNOyO0FVU4HmKpO2iL+BJ3okvYbpfO/bIjuRCO7UYnnq65k6uo+rtnNv
         ++EkMNIA6FP4d0RdBvbrRK9Coiqt6kMEn7M9AiJdLxb3rVVETh/z+XWO9i8j+VTivpo6
         I3qA==
X-Forwarded-Encrypted: i=1; AKwUvBxhShtIytYIZnJtUGZtdexe+CamgVXb9mmRNdvIsX+Vh7S84BcCcZEDqSG1Hb9prgz0TqcI3pZ0SDAfzyuZ@vger.kernel.org
X-Gm-Message-State: AFq9FYI9rcxYVemTARaEsvm4T3UbBIWPwm9gTjnnKuVal+LxU8U5GT/E
	wmNuEuSFwhEtqKDOHd3WIEXq6cqFtpZoVXZCUqZTk1k9q80vZLpnPUJGtf2T+ZYaTb1j39dOOJ0
	XQrRloFkTaq+mRGHPdYafIdk1shGf2Mnw7GPevv8oXB/31wZQsK0fxBZzRxEBSDrR3wj5
X-Gm-Gg: AYBFou0B6vthqjNDfImdRDRYPO+qp+IYkk9dPmLRFfF9eo/2zjoWjG/mdknLp8hmAJd
	G/jf2eTL30RluSYP+VnNKwiePcjWsu993sAsVP2wEFkfquCiQZ1bXExcC0XYRgbTLiWXoFDI1Tk
	bgKIB1tnVmD9a1H82UPBRZzfzxpolS11gtB0WICUGjtpv0hTk38h1QpYF+mvmDtJDQ/PcAlrSL2
	Gph5Ka8olhKo0I9jckTHhiEOYVKdeyEilFGSlsm2tlPZ1sbWals4hOtrOiPaVk7NOWHKCsoM/6C
	YpadADl0/fUTzHoa3Pzhd3pQhqF6ipzdnzRrJnv0d0RSuaZA6EaVzCIXdd7LkyqEY1WApG0DeCT
	AbAiwgCnuKBHlBDwyyHPn5XyqEPQU95KA4kVK4ey5K8VzL/Hr+20CqaUUIlWgPbm8GqyjIWKCsB
	QWH0Z6PfAn1D9w/6Uq+I5Rf2Q=
X-Received: by 2002:a05:7022:ed01:b0:143:808b:b178 with SMTP id a92af1059eb24-1a94b0a801fmr6857192c88.26.1793377466901;
        Fri, 30 Oct 2026 09:24:26 -0700 (PDT)
X-Received: by 2002:a05:7022:ed01:b0:143:808b:b178 with SMTP id a92af1059eb24-1a94b0a801fmr6857150c88.26.1793377466102;
        Fri, 30 Oct 2026 09:24:26 -0700 (PDT)
Received: from [10.226.59.182] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42902649sm9468350eec.11.2026.10.30.09.24.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 09:24:25 -0700 (PDT)
Message-ID: <1cb4d497-73b7-4148-ae40-259c57bbda4b@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 10:24:24 -0600
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
Subject: Re: [PATCH] bus: mhi: host: Shut down the health check timer on
 removal
To: Myeonghun Pak <mhun512@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
References: <20261011185134.1759331-1-mhun512@gmail.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20261011185134.1759331-1-mhun512@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ET2qEwaPDYEU7fGOPyq-p9L5cbRb8pbs
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2NSBTYWx0ZWRfX9mP34aRf7rhq
 ARXMNYGOAXxX57nJr7cbR56jj2xp6Jh9ZDa9soV+AIq426rKZqA8+LTB0h/xOBRdlzbiNZ6iTwl
 t9cOQeeruPrEkYfmsCFXa2SfPxrGutI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2NSBTYWx0ZWRfX95ycxwW4VinZ
 7JGp42TrUMr9Dtiyx5p8wWgIybimTfhySRzEgP7otIjGufUzEracLrs7xpVTi4nS7lNBquv5i/W
 dCrGsq01Bcoxw6Vt5SkuKMBBf/wo6DIO92Im72atUy2uNdUnZ/NU2QqlK7O+GHyaE39rai7nkLG
 eOSvOEVvDdEYFZWu7Lam7+tEhEy/gJG1Y8+Mn4x36WKKmeU/C0aXCQ9R0XGUKmOgTvNtr/DGw6s
 wd99J1JH8zurThzWJ9uV0K6/0z/YdmEpPFFSDRK5QeMPfNnfP6RV6JPn3V70mRn1cdf7uxchprb
 WXTzJO4wNJeDszYlgdNlmMYYDfbF2oDhH1XweLhr2LiRHpr79XU1yUlHslaRI/c2Nzq2vkX1HxA
 XXQJayRhVwzapPXRYsFB7L3OMOuqrP6srF/FgFAA+RCHGieGub+IxQ8ECzIj0LrvYJemWidzUgX
 Sjk89TJeFB2LaSs4fPw==
X-Proofpoint-ORIG-GUID: ET2qEwaPDYEU7fGOPyq-p9L5cbRb8pbs
X-Authority-Analysis: v=2.4 cv=TpVzFzXh c=1 sm=1 tr=0 ts=6ae4c4bc cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=JxfxcCzmXtKzj0Cw3IEA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300065

On 10/11/2026 12:51 PM, Myeonghun Pak wrote:
> The recovery worker rearms health_check_timer after a successful device
> recovery. Deleting the timer before cancel_work_sync() does not prevent
> an already running recovery worker from adding it again while removal
> waits for that worker. The timer can then run after the controller and
> the managed mhi_pci_device have been released.
> 
> Use timer_shutdown_sync() before cancelling recovery_work. This waits for
> the timer callback and rejects subsequent rearming, including rearming
> by the worker being cancelled. Keep the reversible timer deletion used
> by suspend and reset paths.
> 
> This issue was found by static analysis.
> 
> Fixes: 8562d4fe34a3 ("mhi: pci_generic: Add health-check")
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
