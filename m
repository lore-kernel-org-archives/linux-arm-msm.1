Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8771347505
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 05:30:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785735049; cv=none; b=rOhEyqq0D0visRNfstrLrSAc1jZfJK7k9sxUYWg5NXDyJITY51lHyIXl37tXr67ldIJtc7BVq4JgJKVIKCuoCM63oRbFeew6mXUL+DJNGpo+c46qtFNKoL7CKA1HaETs3XcOhwodsJko9gobS4U5SUpBBjTtK/TlaexL+tBAUAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785735049; c=relaxed/simple;
	bh=j6lKaQqYoghcUSxUK72LGfNZIW2lj/2YL8jtsC6f2HM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X/4gv67ITotzz1ANMmGCM7guoZoW7ounHjs756LqNkeNqGdjIRurUEnTmVxRGNpMF3I26NT0GywcdeiLRZrvrwD5+OVomTEiknDgUIHxHahrGZBLfuhfFYD9j+Q5Jh+oMeqGvRdMHe6RILN0otKU/YZE+1QMsEV3jSydRD7hq4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CEGQ+hBR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q71FlFBO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CEGQ+hBR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q71FlFBO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672LVrAd2792195
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 05:30:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z7PN3GBatwIXSPZ+D7ej6e8ycXZxHsTg6kh6N1ZeJJA=; b=CEGQ+hBRpFdkyDea
	qRHEXkS2YcW2tBnFF5mf5+W/8TeDgn5jgYHuQ6+9oFBZ2jammmpmfIgEIXSuOrmm
	wrIDhyGlz7DpT+IYBSQy+QZ+pCHgL1dqZhVU1ivaaJbqyrcL24ZwefckhOCdlDmX
	ZFCjNrqcuyzy4ZwrbJbRDbLchQgDP535McH7x7bv7tEYvkMV097ktlya8Myf0CEm
	C28f2+NPxYZClTwHiVJk7NozbR00pX39T55TPhqWbwfroDc9nnyeNTVwzZ+rlks/
	vRzIp4g6bEXZDgdGaF58Sdt/WFWSRWUXE+/xjLMKqUgYHjo2/BEhZA5UAI0D0178
	CWgjmQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs8u9cn6u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 05:30:47 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb4bd11ddf8so3546319a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Aug 2026 22:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785735047; x=1786339847; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z7PN3GBatwIXSPZ+D7ej6e8ycXZxHsTg6kh6N1ZeJJA=;
        b=Q71FlFBOM7NyLDfgLGxMcYKprxxGzKy1rWACGBIK7F1De39n34NIK4gElTKfUhKbne
         p8pkMv8mAa0CWwumR3SmAyiovngciQBaW8Fjx757l6THsU88k4WOgPDMKSJKkI0rqC7G
         HF9CBRT37/VrJjlI8BSvoPZguxJM1mVxKCbH78Ng5K3c3X9YQqIGMXPuPRUMP2G5qzK8
         2Yhq7DJr6ZvTS9JkLo7SR+hoOFfJqWAb9awU8Cvq/jdndN4hby24jWI40Irgp/X38Ak9
         np9mJekE9XPCazY8OgjIcOMGuQode6NMk0bWvV5nhSlzox3whuMgpzFoV+A0VTkfBaWO
         iOdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785735047; x=1786339847;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z7PN3GBatwIXSPZ+D7ej6e8ycXZxHsTg6kh6N1ZeJJA=;
        b=UXbLiIzVTIwBQE+1z3sYyCWiW4N8KhkLd+6wcTNq5oZgd0B4vQJZxgNsefwdrjI+Jk
         uwR9hjYlgHSEkvnxXY7UKerQy76KCoDU8KK+kz3gBcQE7hfQuNv2p192jOWWpjtMwwnp
         7szDd+/cGpGUndxzalem0jCZxa4zCfk3GfIFqXKHt9LAB8wCTTiBChtQNiCQY968I398
         1Mqar6HApant4j3VPWubrWxAYIGyrFOkmuT/WtFEAGbPiPwzpOPpjl6vlnbWtI8EYTON
         5C5YksGb4Ktqd4qtTJwaCkoSIjFD3ArkF49HTRfGmvtFEx65TeaAIDhzR+3nUj27nKWy
         ZERA==
X-Forwarded-Encrypted: i=1; AHgh+RqoM+DISHJ81z3zcyaHisrhPspEMFXwWaU5pRNSSIBZqiB9IQUn8XLJiL/Kyh4uuNRnBRFwJKs4b80ifi90@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6aatqMyLgfjqCp8P6JTzuK5wBF1oNTz2sfGiLwg8wPGZkM8Iu
	tjSlZcYE5YeoJb9W+8wKhAVYHhH1fzsgfGvg6wOusuAMSnpFwmlNPFhMc+EGhhpPKbp/7n/qR/I
	iuCi6PonRtpVyo9aq40m9jR3PM8mZ+zpmAGO0FNsRms0REjJ6k9KCLSQ6WvyDCNwH8viu
X-Gm-Gg: AR+sD13t75EWcS8NAwvOOoqMl94pRgj+v/cUfvaZaCYVCo0P2sUnsyvr+O4A1mA9BnD
	WtQBkQlupxe7qTtqh1/nhwjHlzOHh6H3HLqh1VvV8DhExj/Y8CYuqddRAISprF/G4wSCc8Lqd7M
	ENqbYArhJwowln+yVMmWaX1szaccK6EJPlgTTd0/MEHEi+CM26LLaEDmDnMSLm7IDlD/OLta89p
	4C7MZ/3YzIEsai9YNJfMMUcEbW/z+ClSKEEi875RiqSByj1m/GMQKnPcMtnamS5O9FpB5s9gY77
	W22g7sI9YidpoJNY36V0c5Qw7MZ/k1Hfz9KtUXWtTtAyoptBDGC1O3hkVkjFBqIT1213VBbjg/J
	t+gpfxhay9sH6lcTZagT8rE7flFM6
X-Received: by 2002:a05:6a21:700a:b0:3c4:203a:c334 with SMTP id adf61e73a8af0-3c92a8f3f93mr8422263637.55.1785735046796;
        Sun, 02 Aug 2026 22:30:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:700a:b0:3c4:203a:c334 with SMTP id adf61e73a8af0-3c92a8f3f93mr8422236637.55.1785735046400;
        Sun, 02 Aug 2026 22:30:46 -0700 (PDT)
Received: from [10.218.15.172] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c96asm35050311eec.7.2026.08.02.22.30.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 22:30:45 -0700 (PDT)
Message-ID: <520ce780-8935-4f72-bb62-e1db58568a1f@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 11:00:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: interrupt-controller: mpm: Document
 power-domains property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-1-3d858df2cbbf@oss.qualcomm.com>
 <20260721-lurking-polar-macaw-b4abba@quoll>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <20260721-lurking-polar-macaw-b4abba@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: iNZgfspQokJ7qHUfgSKbGXBMqJHWnDO8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA0NSBTYWx0ZWRfX5KV9DSR6BvcN
 wP2/CQrG8gMXENmvlnIcQ82+S/acwpLoofOcZn+6sMGfY6DzAGEq8FDTAAhQ8X1VjgkVMsV4Q5C
 f7keN8pIrSsV1FXZRqcZxi6VN9VHPgWh1Vmu1MfUDG3nsPaL0WDfCQ3OLUdjjQkjhGRYqTOjYgn
 X6semQNXs8dIkZrGtIJpSeMLUi4aZi8FKqAUFgtJRMK6NKnJEHOHKPyWOubmDn+ZWyPKTpWfbpy
 /3P6PeXNWEAe07FgjK7SmtVHsC/NJ2XyDSktfBwGCFOjR/HEbgQSHPCemyZyS8grz2LUmkp0nPM
 lTOXtpLZKqNQxZnbdUVGpquxhgRMxeFdDOV4m1mqyUiTfo3x/BMhzKZVI+qJS8h6ieOfkQPpHv1
 yH2Vc8KyEDSzRBhq3f5hzfik2MtH6FIURaIhJe1VOtJNce52ApVeKYHZiqW2K1KIbbD3hluFGwp
 KfSOkAJG7/uyNQlkdjA==
X-Authority-Analysis: v=2.4 cv=LsCiDHdc c=1 sm=1 tr=0 ts=6a702787 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=aJKyoP8-HFX-j1aC8PIA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA0NSBTYWx0ZWRfX7LFXHMHWIFEa
 IrE+x4OXN7ecSz8tcd8fprEV+lov1YFHQTENFqWGEij03hXXeRkwQb2xVGwDbLRv9h0nlQqPJNk
 GhaxPVNjvs+hDIqhSIxKsjJJkIm4zW8=
X-Proofpoint-ORIG-GUID: iNZgfspQokJ7qHUfgSKbGXBMqJHWnDO8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030045

On 21-Jul-26 2:36 PM, Krzysztof Kozlowski wrote:
> On Mon, Jul 13, 2026 at 03:55:41PM +0530, Sneh Mankad wrote:
>> Remove #power-domain-cells property and add power-domains property for
>> MPM device.
> 
> Why? You just repeated the diff, so not really useful.

I did not mention since the explanation is present in cover letter and driver
change, but I agree there should be a brief explanation in this patch too. I
will add it in v2.

Thanks,
Sneh

