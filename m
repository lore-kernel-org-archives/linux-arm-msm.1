Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E98437AA9E
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 10:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785753481; cv=none; b=JRRvVYPkkAs7GhiO0Z7UGyfWvb4CQyA5Te0AovLg+AAX9bFGcxXE9pYDvSmop+r9IZ+z5LEyf1WnnGcfh+EI39qGC0/w5iSvGCyvu1DpORPFFTJL3GS0wttM9MahjtRa7V12KNstUnSDAf7d7Khn+A4LgMvlrz8XI8OERKnrXZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785753481; c=relaxed/simple;
	bh=wU/TAOc1TtMPYhqSHJDjjRYz65PJWykTYH6CY0pB7FY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l+IaKgvlu0VQTbPxlYNOdt6LwKUeo7qzqz2j1VahNJiY1zRjSRLbQ2y6xHjIeDv5F0/v4IpTDh2gUAAS1G9NLEiOwo/N2NSqYh6kHK2VRrgz2cv3iPgkHHkMcrFr8LozwAbVwnfxYRLRbUI6RroqljKZ/uVwjtaUbFZaZsKJg/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IlC27PSs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U82zbGtp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IlC27PSs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U82zbGtp"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673A8KnK4014138
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 10:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VZwXkx3/G/WZzH7p/djsIXMDi9aY76L1iwwX4qu3TMM=; b=IlC27PSsm1WmgB9i
	PCCwaXtHjKfXKmzMCCuXaWbH2SRfUEFvor/MQYbmaj7bo3deVrHR7gzrZJSnTFti
	DKgC1NQLVqXrMPEWzUC1AetY40UPqTFo2YxgL7SBJ6MPdsxCFrx+QiTZHU8IXMj0
	tkiO/jsQlNhIhCutmpMwFc6xm9EtxowXndQc7IZFC/PJf+xilhvLSyoljN/wTvX5
	Dc4gL6BngvtE7tJzTsuwHkPQbTHr42gIzzo6eU9PWfP2rG/QVJbvF3EeqBYRH4g/
	f3XVtSr1Wfk0pC1KlSWYjXA8nzr6XjHEdlYrYeJ0EHMdGgzUK9S0+qjshQnSJ+bx
	sxfR2A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrt935e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 10:37:59 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb4cdf95b5aso6621787a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 03:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785753478; x=1786358278; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VZwXkx3/G/WZzH7p/djsIXMDi9aY76L1iwwX4qu3TMM=;
        b=U82zbGtp+bfdQaxTKqDoMZN7zLWJGH5Aa8Hpt3emB82km992LQCRN7QJAUqoy5zynd
         4PGRsziG2ZUITzeyZJcfGFYUL/qrVed5cs3davCWaN70iFqJz+TOhxHTY+piKOQdvPIl
         prxLPB1sRkEV6RBjXOFgmfmn03+xscyJwisb4wDM1lZ8iozJiHScQk6W5MnOXS0q+Aex
         p7DI4Vh7dythnoUfFNkfNtiu2W1TSLTiqeRFbTjMpctWNHsxWveyWhCe/yQbyjkntrmx
         erJRDnK/IZlIolGaGWKtqkhQUU3rszpCps0QIdZf8eXtMJAkxaAr26f7AuAt5hgN0yLW
         6UJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785753478; x=1786358278;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VZwXkx3/G/WZzH7p/djsIXMDi9aY76L1iwwX4qu3TMM=;
        b=HgQfXQ/KIIAuaGvzqKgm79j4inYyexnTXmONuaEhlvLLOHOKZ1hHonji/G/4hPZsIo
         4dL989wRGSHnJjElH47dfM0712jl8ggxTcSyrPSlHuAN+SN0HJS0bxC7yIvBfY3srSp5
         ydkQwsCZFsxOUFbE3cHTNtC2TjadRo3s+xizOZbfKefIWz6qmHu87fMxv5z8/Tb2Zv5c
         uLtiIPkUyM1Y5exTDRuzRm/4tcBi6XKVm+aXAZib+wXwRdPaePngd9zBSuOG9SK7/NNT
         lRkVXPR1NurhjoJOC8qAhSVbWD+GxBBYZ/hV6dr7ZNVEDJzn0UjimslZY0qwUcRhfxxa
         m/Fw==
X-Forwarded-Encrypted: i=1; AHgh+RqeUWzbNdM5wuPbVG7wLvhZAX59W/ERV19e9RLCJiJRqPaC+vSfIBB9xMHq0kmAisrRS8374HPaZ19S7yQ6@vger.kernel.org
X-Gm-Message-State: AOJu0YxPNHTwcErbZFsNjqdR6hTQLbyG8HY3zSLEs+gH/M7j5nDkFzV8
	jQ0pc2LxrxqlCvcR70YI7hLYJTy34V1MQRZwcuEtjE6zL5s7QwutfNh5WhFVrJ9m6fYPODf04Wf
	3Doit2TVs7RGJP9ebhBLQehPHP+ANbF6qIzJe6VV6FEPgOm/JfaiJitgO9BkW+0vcEwOr
X-Gm-Gg: AR+sD1205ZLKgb+myPnsFQDjLiFPbIt3YWzGS0r3g43qgo2UtwX8hw+EUUPqdBGJGN1
	ZrUgEfnRxiu5XSIBVwC1DZQMIF48Kztqlhc6FdmzSLy23g9/PhFKUp2BqTjUu9squoxycvPapq5
	TnB2BUshzAvFzhZePct7u9Fh1yeJ473q80dlzoh0QxRy1mqxFkUgI56PLD/lsYWHPuXhxgAe8lL
	NHPBYRLMK46dvBT38IlUScRpQXCuA3mA0npXL/Lj8raElhPgwvlRVgg3mtKHdReHfNHFAeD6nJM
	UnFsPRyH+xRYhwzLAtFXW2m+Q5kaYcCnrEBLNDuQUz7mwkMYQVJsR/Z99Eht9Y27aJyt2mLT8eN
	JNDw9tYCED5wU7dy+i9zQDnmRRn80
X-Received: by 2002:a05:6a21:6f15:b0:3c4:1493:6822 with SMTP id adf61e73a8af0-3c92a59aca9mr9773916637.18.1785753478273;
        Mon, 03 Aug 2026 03:37:58 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f15:b0:3c4:1493:6822 with SMTP id adf61e73a8af0-3c92a59aca9mr9773883637.18.1785753477840;
        Mon, 03 Aug 2026 03:37:57 -0700 (PDT)
Received: from [10.218.15.172] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e666sm52984404eec.4.2026.08.03.03.37.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 03:37:57 -0700 (PDT)
Message-ID: <26fbe995-8640-41c5-b1a7-59ec82aa4459@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 16:07:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] arm64: dts: qcom: agatti: Do not mark MPM as power
 domain
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-6-3d858df2cbbf@oss.qualcomm.com>
 <df914537-52b1-4968-b65c-cdad1115a661@oss.qualcomm.com>
 <ljec46njfs4j44x7xcmzs7lxrxwz6pm6fymnkrvvki3oxy33p5@pqewduuy3l7f>
 <a60daeec-7cc6-466e-aa51-a6f4aebc8a3b@oss.qualcomm.com>
 <wx3t6tdk3dsgbfe4rexxdekbhtaryfjpf4dkwscyzhxnnsgzdo@qnvhzfai75nx>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <wx3t6tdk3dsgbfe4rexxdekbhtaryfjpf4dkwscyzhxnnsgzdo@qnvhzfai75nx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA5NSBTYWx0ZWRfX+0V+bdtK9ZO9
 qdO7zjmnIvaD3+xJ7ci0eKgHg+cU72qaiumHR3kqH0qDub960f24gYmRUe/Q1MtJegxhF3zVBoq
 3bJitHkcLaQSpuEkGojlEzxY363xw6AsM3brjOhDp4Qqy1csfy6y8mb7mY2B4wGLixLtgG4Y3fw
 v6jeqDbVImf8lsympEvLiD+hXGh5b+n3lPVTEJxzU5rRt7NiPfEJwBafVZd1buZIxxM56J0ryah
 ynv6XTv+hzKJBkP4DzLEGq1Jj0IYQo7pUvTzDg5nEshKVYOxsZUyEZV0RpK0b+SqqN/QoiJs0No
 s9TDH78v3hzdAl8bH87fTTdsOvfHIvxLs2ckRueHkRAd2YjRgeN/kHKYQEt9C2iVVB/XHK+D9m8
 y4kjaBy15nZMaE7CMyUx4qFenCtBae6QZC3fQ+xKWS7KgkynS3t9bL3Hhkncy/qg20KT1W7JSxf
 HMSMoRofvuo5PqvKHxA==
X-Proofpoint-GUID: _TcLDUrQ0h7tA2DD8pDgj08dUtPk168Q
X-Proofpoint-ORIG-GUID: _TcLDUrQ0h7tA2DD8pDgj08dUtPk168Q
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA5NSBTYWx0ZWRfXyVC42v+yDY9Z
 3tGi9oQGQeNqcev7YPw0SYE05P/0DmAQZLm/TQ9g7C+k905knwHLKHf4+6BqY1sxz11cslgVTQX
 0CyCKMhX39jDrdIE+8jKp9mFzdcaGZE=
X-Authority-Analysis: v=2.4 cv=Ft81OWrq c=1 sm=1 tr=0 ts=6a706f87 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=QjLB27GhoijPk9Q2gycA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 phishscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030095



On 22-Jul-26 6:10 PM, Dmitry Baryshkov wrote:
> On Wed, Jul 22, 2026 at 10:28:44AM +0200, Konrad Dybcio wrote:
>> On 7/22/26 12:22 AM, Dmitry Baryshkov wrote:
>>> On Wed, Jul 15, 2026 at 12:01:42PM +0200, Konrad Dybcio wrote:
>>>> On 7/13/26 12:25 PM, Sneh Mankad wrote:
>>>>> Do not mark MPM device as power domain since it leads to idle-states init
>>>>> failure because of probe dependencies.
>>>>>
>>>>> CPU cluster power domain node is kept disabled and hence CPU cluster will
>>>>> never power collapse. Do not register MPM under it in this case.
>>>>
>>>> This is only the case on the RB1. How about we fix the issue instead?
>>>
>>> I guess it will be fixed by the MPM timer being programmed correctly.
>>
>> That's patch 4. Can we test it out?
> 
> Yes, with the patches applied, cluster_pd reinstantiated and set as a
> parent domain of the MPM device, the board seems to work correctly. I
> was even able to revert the I2C-gpio workaround, the device works
> correctly and can reprogram LT9611UXC firmware.
> 
> @Sneh, please post the series, including the fixed Agatti DT (and
> deletion of cluster_pd + related domains from RB1), I'll respond with
> the Tested-by tag.

That's great to hear Dmitry! Thanks a lot for testing this.
I will re-enable the cluster states on RB1 and post in v2.

Thanks,
Sneh

