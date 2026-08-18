Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861423C1D40
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 09:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787044013; cv=none; b=slhGe3BCP0nnhjOp2Jw0fz8vGeIFrK25V+ubsFOw/wmObOsKh4UjYRP+0OUWQsUmTjsw3zflo5aWP1/TuvxB/uwOAHEOkzDxf1hPh05ZDZ58csGcHa/IjtTITP/fAxL0SfmLEJZcyPG4gWGWy3HFu/HBhrmTwm8l5z841I5ZKZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787044013; c=relaxed/simple;
	bh=z50Dwbp+KUqqg693Z4+fUtNTAtaDy+2EmV7rI7a0Zx0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TDZ5f3ZfP3IfpZGkb2VdsQmcBoe8q77RAzf2cYhC4knhabF3NS0+cQjyjwr7zQUaLhve7+exv5YIeIYuO0qC8XbM42rrR4VL+04Mk6dBYd2Kw1vVMXQSwsuUAm7vvy10AC8ph7Cpm4QgrD3ckHZ/B9L9ugwdZR9PVzBzl2jl5Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G345N9gh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jAxvxvit; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G345N9gh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jAxvxvit"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I8BTRc243257
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 09:06:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q9xW6coXHENj8pGdnUFBq6uIzAz9ShtjyQGjynV6M8Y=; b=G345N9gh/SFKyB4U
	SVhrtb9xePJszi1CVrMpyXPWaCMaoHoMJmL0etlaE9gt8oUi83kFV8fZGq50WgeY
	JhQZsQ4yheYCfcwNibUm/ASYX2MfA06Pmhvwe6Qux3C2fm8js3mo8roxjDpVvUNr
	MHdDc2NRR3fneCEhJnLehXNCBrZHRIY4M/i3ouvMJfQv0h8bHxOp8HsnyjfVvj6D
	B65slKFoPSIVlOdY1ls6+6RPPL2pQGKXaHfVhlLluvHrFz4h44ZFahpcs83u6Vzj
	H1EJdj5jOJG7ewaSjXg6KAO5UCFt4F8cH149SRFVwPpPQrEnXueF8QXf1dW1NPlU
	bI7RdQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4ea2hpt9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 09:06:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e5e21552dso31033685a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 02:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787044011; x=1787648811; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q9xW6coXHENj8pGdnUFBq6uIzAz9ShtjyQGjynV6M8Y=;
        b=jAxvxvit/1LC04HerWGJeRAbvnnqPWK8pfHpKj+nq23R0Z27dL5Z28ruxc9n4cMCS4
         fPAEy+AUP6KpQs/SLgFwV974JNWkCY9048Z/g6RZjJraBpBg8DbtEizlDKDrxsNM/LlU
         WQKF6S263dtMCh8cYgrPl4t0lcl2JAmguuRAnYHFP1ueUwsK6AJNi9yJN2huqMeFERei
         ZmQ8txgtnvoLL9B4yTF7iVZPlYBO1cX8Da+MzatCox5tZObRMnkdYq9ABxMwCg7W5e+S
         IziRmmZNt2X1XymwYO0///F017EJHs2FZZKp0N930ScHDYhRh1CEKr6pMd81Hiz/fxMi
         Is/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787044011; x=1787648811;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q9xW6coXHENj8pGdnUFBq6uIzAz9ShtjyQGjynV6M8Y=;
        b=d/tMDSxLfxE+suLleXUNY/swtE8n2xw6ZMiaDMn0KeoPh/lwpgLKBv2gxZBPLXwA0C
         0kFYfKr/WXFgIWyaxxhJgVOnI7ErY1CCnqEDjXy25RPw7/VIO1mZSuiQIcsN2tuphTkE
         x1h3ELXpbml+FOHB/tTa+nfUYiTJlua6cL+Iz7JXdgjJfmxhSLoa0nDla0CAcnWtHE4c
         5FR7qLUnrz2KhsQ9u3YQbAabh6Wp/3C+92tPzWBF2cACouuIlusFXJkpCabrpZSfqhZn
         +h04dGix8aF+NloD5lc/Urv2K++9Ku08D5pR948NurerRp/8tJpOz1HhBUGGOpnCxKqu
         BZPA==
X-Gm-Message-State: AOJu0YwsEwzQysi0lRQQzbkGkvAOWbDvjuS5WwoUNdqKKJr9B/Qm/GhV
	oBuR/OwhbsIbzFjqETHefrtF2l5zXrKhvzvHKS5HV4Tiz/WJgiH8QUB+dI7S3NyXUiROM6BjHpf
	ND6jvhqrqjdN5qloX3wKNoVtT9UYY4c6mumg5hUCgEuu+9oMp92m5C9a1JHSSlkE1Ee2u
X-Gm-Gg: AR+sD10OuGxvHkl3fwIgS2+tL0tkBIqWbW1iB+GThV+u+CE6ELK8MRkE/jN/jCpgT0K
	xDdNGfHADzB3qlji9YV1SqMl9XZMauf6Ve5Wiy9GWtEk07vTKzdceXTrTG/W+VIvyegPdpW058b
	/RHWAlBEbICs2s5vx8NPpnN081eRjeP7p4PjTCh2kSqneChe8P0KUz9g4bDlacv6TvHYj5ES4Aq
	O1rFBWK2Lf5MOxzeU/cjT4Fl7P1Xyo7ffYGxN3RY2gmZU4Do+PgcxYTg5DGB4SMBWUcdq4I+Z4P
	EGlGrNaCYISUAIpCwVkx/YOj2by8PKP0WRL26tQFHbGn/3WO/GKbDciXTaLw2aeVypKbJeD/n7/
	MR+QnR7wT3ZpEChOdm2gHDfGy
X-Received: by 2002:a05:620a:6910:b0:936:2f59:dfe4 with SMTP id af79cd13be357-936d1edd4fdmr2349734785a.0.1787044010706;
        Tue, 18 Aug 2026 02:06:50 -0700 (PDT)
X-Received: by 2002:a05:620a:6910:b0:936:2f59:dfe4 with SMTP id af79cd13be357-936d1edd4fdmr2349730885a.0.1787044010319;
        Tue, 18 Aug 2026 02:06:50 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c217fed68f9sm155764166b.27.2026.08.18.02.06.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 02:06:49 -0700 (PDT)
Message-ID: <dc555512-3161-4c4b-975a-7ec60a8f1a48@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 11:06:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] ARM: dts: qcom: apq8074-dragonboard: enable the
 USB3 host
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Andy Gross
 <agross@codeaurora.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20260810-msm8974-usb3-v1-0-1a47e1185524@oss.qualcomm.com>
 <20260810-msm8974-usb3-v1-10-1a47e1185524@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260810-msm8974-usb3-v1-10-1a47e1185524@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA2NiBTYWx0ZWRfX6sMmODkVh/XD
 1knUQmk/zTFogZUGHhWbh4vbD6K0DUTOVd413Om87AYeJWOG+/4zffTktn8TRNhC0VXwjAFfqgk
 gKSAQ6wUHkcx/Khsl3Kq2NTfngLz3COB48vBbtcK6CJVxJwBvUsI+keDWUCQ4y1sz1pyhbO7Gyx
 8LwMrmM1VEUj0dEZSvCXpuWRxwpG5Nr96QrUds2ROpLN8VTNQi0ajBRdGVaHjAr8MAzu/m21DsN
 J224GyDL72c+85H1r3DNA0iL19+AIaW9eDe1XYAlv3j5PHI+J5cUV30p48vD/gJxUactYY9DcTQ
 ClTowBRh42XnCJjkotQY6BRMrr2i8urrK45Mbtl9hNiuDcA+ClD8qGIF7PGq/JGVZSfkHco7/4K
 frXScOcyRoBS652Zq+5K7ew/9h1IDYc8nzxXcKekAWhklgPnvyMgLZCXP/sYiSowQ5r+aDXaHPU
 5z052Ws6XFxWXgbVpaQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA2NiBTYWx0ZWRfX+ZkVzSRtpF6r
 XHEwUqhgo1UQMwzdyJ6x4qk1N4L+wVdHP87qJ2r/jwsAlWNnSV43Y1S7E2ksDYTjCi/D/IF7nWq
 u5pmUxwO2c6teP7APVSC1sA0GC2wUmI=
X-Authority-Analysis: v=2.4 cv=XtfK/1F9 c=1 sm=1 tr=0 ts=6a8420ab cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=LTL54F7UJFTHhO7zyW4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: IlSdfjghFQvd7p648JJwxSU7Qv5NYRAC
X-Proofpoint-GUID: IlSdfjghFQvd7p648JJwxSU7Qv5NYRAC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180066

On 8/10/26 1:42 PM, Dmitry Baryshkov wrote:
> The USB3 port of the dragonboard drives the onboard TUSB8040A hub with
> the AX88179 GbE controller and the PL2775 USB-SATA bridge behind it,
> but the controller is disabled and nothing describes the devices, so
> their reset lines float and their supplies are unmanaged.
> 
> Enable the DWC3 controller in host mode together with both of its
> PHYs, and describe the onboard chain as device nodes under the
> controller: the TUSB8040A hub pair (with the EEPROM-programmed
> 0451:8041/0451:8043 IDs this board reports), the AX88179 on the DN2
> port and the PL2775 on the DN0 port, each with its PM8941 reset GPIO,
> all powered from the always-on 3.3V carrier board rail, modeled as a
> fixed regulator.
> 
> The SuperSpeed PHY is required even for the hub's USB 2.0 half to
> respond: with the SS PHY left uninitialized the hub connects but never
> answers enumeration at any speed.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
