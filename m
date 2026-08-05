Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7CD3DAAAA
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2026 06:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785910091; cv=none; b=YpXCpLByLney82+gJh3DDciFGoFim7wxar24nLEJYGWbqEkr+L2xj3gdIn6b7MU0hLL2XULhdcRypvcgaJtoAog0xA3OkDScs4Z3DRnSmb+5tjK+9i/PuOyahiiGJrSqv/ZKhwJtcACwpInK6e23WaBvNKhOr12bHbjw37hekgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785910091; c=relaxed/simple;
	bh=LhcM+flR6UXEo+DLewcQXKPSp3BZ/ntPhX1vdgOmaLk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ci0roHrha6p5g8j5djG1vZLLA8wQF/NFot9oITH6lUh+6SbeMYGm+qoBSoht6eo3XKz7gJ7CYwEBQJlXjluqzF1G0H11k5OBSW9v0TR7tHCR0aLx3Cenbn1E4DnUsZAXazMRj04e5Zkz7DTIBtuer0yAS3nsyDQtdz6w6/gU0Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fLGe87t6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NSvUE39E; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fLGe87t6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NSvUE39E"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6755l5lJ1960771
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Aug 2026 06:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	96o0yh28F+RHFrBvV90doH6mJ8BQJ/GtFiqrFDPd/z4=; b=fLGe87t6SdtVNvIH
	HS0k0Spro3TGv1DMLDyKgoWsb0cNoZTeJjBmEWSYk3TzjLDZ0Z4u3zSycWZ+2mMv
	jR8BmSgqhZhB9RB9Jsm8wrMfISXOXiAj+dw5U1g96SDT6eDR9Je/WT+ODf5QiZIt
	Rl+/+1ak/FbamC2ZV+S/5sRzipCyHNsoPCYqP+9A4rqmjopcCRgZ6ncXac5eycX0
	iBgKvN5RS29dXZZxZ6MrFM01YKE7x+19+I2LC27ug+LBCeyohCTQS19UNgasqSM1
	s4Kde6x5nvf/nb/cc6p7eDmpim0JN36UYVCv5tFvCd1qdioH+ujLz7B46HZLll6E
	DJysDw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fujwskbqm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 06:08:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfc52ddc55so8694965ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Aug 2026 23:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785910087; x=1786514887; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=96o0yh28F+RHFrBvV90doH6mJ8BQJ/GtFiqrFDPd/z4=;
        b=NSvUE39EJsSdV8lS2Sr9Qnxpp22sJ0U4TjH6iv/yq7IrL3zrx2qwzztGoQGHjv6+VU
         1OTGTqyQcLMRSiK6JYHdaEhx+kEZaxpQt5vAO6kwKGNG4/7p6Jkw6MLaNmp2n6nLw7lf
         Srnj4fKovtC42RjW9AzuQhTaky7kpuY4ixcFXUBaUzYmohrk6yxm8c9qh95Eqt0bqhoG
         Aqwf6rQ0Surk5WNCFIpKIJg9YVFTyY+9gn0EgIlZ1hpMVkYH0pMyUGtq37mOivRP/ry4
         5GiJWZM0AOq1WgvAtv626GlgF17Pe0uezn+FIQfZCtUIPiSe2WwDicQxNtypcLP3CYbj
         /JrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785910087; x=1786514887;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=96o0yh28F+RHFrBvV90doH6mJ8BQJ/GtFiqrFDPd/z4=;
        b=RoGtEVQFjyNOYMzjJYMpFFjDpnUzPlpzOdTeaxP5woGewwSSjlbdVDMYT0GpPRKbk3
         7wqzA79PXxO2RcPcfxGjAHt9nd1Y7XykZEgL+ticaU5UipIBILerUEeieNxLPYgODlh4
         Yih7rm2hZcV2yyBzMrb5ScomYJJ9+trPelCwAxpwsnasr9x1tLL4UVMzi7P7o6K1KDAr
         tj4ElGNj2O3V17t5VdK3/yNHzwtcxeAjRbLXPR1eiV20lP1vm8vIKX+TlrjZPdlUVAhi
         RUNwizpbRXV4SK6zWz+7aUz6BQmpgkYIeAOfmQ1nERWf9NRrUc7GOAkPRlAqV3saFzlq
         Q+/g==
X-Forwarded-Encrypted: i=1; AHgh+RpF1ycNvANCZzDNoxneCJ4c2VG2nGViNjc8JsluSpLPUpzrNpqfpWj+LuY/jdibNGeQHH4F14n6v69oGxrz@vger.kernel.org
X-Gm-Message-State: AOJu0YwEVFSdJm34UwhkcO52LJ7PfYpZDcG+jHeEjJfyCTmBJtPnWRbM
	XxWBsDqPiJMW6W/GFev9+ICTijFTyrsgaEvXpt0APSBURIU7z7sBmTbXOIJ+hD/eqJ1vvGc3WKz
	8QEiW7LhXw52xeZeT773w4uzsU2gNZzNaTk8dKFm1/md1WRHum0Nimcb1NJsUYrnP1w02
X-Gm-Gg: AR+sD10gQaxWBaqgjT45F16182fBCwIXcF1NxouuKF88A34Oqv4n1HzMLTDfLHBmqqa
	JDP/ZJz9sdaBfVgOLIV2raFlD2MpCSvwNMM2Y0AQXYUeIKKhGqhp9i22qbB+0raOkcSZVqbSEny
	H8s/eNAqmC9/B9Wp/t49uewjz6WjYTn50qCXtHUZlT4oFeAEocE3PFQ6apMJHHdugznl9Zr68BT
	EY8Su5cT/bMx7InvXhl/XDc78sgUBBHvxA2QQEh7ZwzurG//aMAm65ExcRWxcPUzO3fD7klHve4
	7kXKKsHO2gQDw36L9pRWXQj6vL4i4GDtCg4DUi3DaD8g0ychPTc0zC+cdLDd3yV4VIivvfDZNmP
	EmtiKEyjgBdaAj3fx/fyVVn5XSbofqUuXPg==
X-Received: by 2002:a17:903:18c:b0:2cf:7fab:3cf with SMTP id d9443c01a7336-2d0ca981a9fmr43015825ad.23.1785910087232;
        Tue, 04 Aug 2026 23:08:07 -0700 (PDT)
X-Received: by 2002:a17:903:18c:b0:2cf:7fab:3cf with SMTP id d9443c01a7336-2d0ca981a9fmr43015375ad.23.1785910086736;
        Tue, 04 Aug 2026 23:08:06 -0700 (PDT)
Received: from [10.217.219.72] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d0aa4b9bbasm13965485ad.60.2026.08.04.23.08.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 23:08:06 -0700 (PDT)
Message-ID: <a8fece75-153e-4461-8c04-d26b332b16b6@oss.qualcomm.com>
Date: Wed, 5 Aug 2026 11:38:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/6] arm64: dts: qcom: Add device tree for Nord
 Embedded variant
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260729010022.875799-1-shengchao.guo@oss.qualcomm.com>
 <20260729010022.875799-4-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <20260729010022.875799-4-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bkkCAW65I-euZFIOWfBdcqz5Pp2zkqO7
X-Proofpoint-ORIG-GUID: bkkCAW65I-euZFIOWfBdcqz5Pp2zkqO7
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA1MDA0NSBTYWx0ZWRfXzljlXF0f2mDs
 ZxOxrpDkYz7XVmwnraHIijl+tlm/YEob4oaBHRZ4DA5hQbspJBfAR049bpmP2QOp1SKFfp1fR5r
 6Tx+fyekUcd+shC4ZW2tB+8C+jOwBeI=
X-Authority-Analysis: v=2.4 cv=Lu6iDHdc c=1 sm=1 tr=0 ts=6a72d348 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=nighCxVWtA0h0ZIh7bYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA1MDA0NSBTYWx0ZWRfX7bGDPP3zs15y
 xUPtG/9HNknSGG1wsulGiVuNCemNYCTu1AriKntMaz4SU3A1uuZSOGK3GuyFViXOdKoEJUjxUkZ
 jbHQy9nAkeQx+OH70nFFTXRjpoF9fSIxslbYctkF9hfj/0qpLFaeGLzq3SjpAutCsaoV6cgvfWi
 F+Co39ZuIRk300uoBjPqibrPkQxNEJm3kYTPYUKJXZMgcq1iLpTso1jj+zS55Oxu0BR0D1KmlaV
 HgH3tg3ZexBHy7a4moLSzF0+Tnmp7g1KvE7WEeSG8A4jDVFcuidEHG2o0fYm9hqyXqm/av0TlE6
 0MOzg2gWLLlIama0NBvS6wm8v9P4CYSISq5z7TDZIKgZyB0ZoLojds1a66CHnXZ7mDxYLd6LxEm
 x/cr0HFZSD43bcbQMpyW8ccVqAz4fmsHFZm9NtyAL0mVzapPgenYFNI/E3bhbdmN8PO7hGcxH/J
 PYJJYl7qkwz0cQ4bKOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_02,2026-08-04_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608050045



On 7/29/2026 6:30 AM, Shawn Guo wrote:
> Unlike the GearVM variant, Nord Embedded variant has platform resources
> (clocks, regulators, powerdomains, pins, etc.) directly controlled by
> the operating system. Add a separate dtsi file extending the existing
> top-level nord.dtsi with nodes representing these peripherals as well as
> describing how they are wired up with the already defined components.
> 
> Co-developed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>   arch/arm64/boot/dts/qcom/nord-embedded.dtsi | 1726 +++++++++++++++++++
>   1 file changed, 1726 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-embedded.dtsi b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> new file mode 100644
> index 000000000000..032d384f6eb3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/nord-embedded.dtsi
> @@ -0,0 +1,1726 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <dt-bindings/clock/qcom,nord-gcc.h>
> +#include <dt-bindings/clock/qcom,nord-negcc.h>
> +#include <dt-bindings/clock/qcom,nord-nwgcc.h>
> +#include <dt-bindings/clock/qcom,nord-segcc.h>
> +#include <dt-bindings/clock/qcom,nord-tcsrcc.h>
> +#include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/interconnect/qcom,icc.h>
> +#include <dt-bindings/interconnect/qcom,nord-rpmh.h>
> +#include <dt-bindings/power/qcom-rpmpd.h>
> +#include <dt-bindings/soc/qcom,rpmh-rsc.h>
> +
> +#include "nord.dtsi"
> +

[...]

> +
> +	qup_uart17_default: qup-uart17-default-state {
> +		pins = "gpio152", "gpio153";
Can we add all 4-wires including RTS, CTS so default usecase for 
Bluetooth with can be served ?
> +		function = "qup2_se3";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +

[...]

