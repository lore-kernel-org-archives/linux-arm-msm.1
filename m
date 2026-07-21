Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F0022E3F0
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 12:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784637416; cv=none; b=qTE+vzbQdmF2D8L1/T0lPR1THMp0TYb7lWf4hta7ZPzFGIO2Bzi+f7bY5vos8cHtKmuJjdxB1qLKcUgvgiJotlFbIcKID0WygBzrsGPQUEa8nEnAOqsn+ovEulHm2pjpXe2k0W3TYqFGoP8Y+MspRPzieIwHWo+aP5RB0QR3Z2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784637416; c=relaxed/simple;
	bh=bhNmXrhFvaKTam+ofBz10yzIZUgw6ydcn1p9PpA7Mu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cGgFBkHa0rJN9bDjJPg1q4UbQDWQo7j1NdeeuawbXZw8VtftYZaKiRfN/y071dLnOT38nA5Tr3uWhOigV5SOkQHZeI4bmKypBwVCbLwySzgC1omuq2nneCxf9pcvBlkMzcudLpyo/w05ohpC/wiLxSxNnpCBSEvKwADry9rogRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eNsc/q7y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BXHYqb/j; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eNsc/q7y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BXHYqb/j"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LAR69Z1349405
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 12:36:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MVnqQ5mVLOQX3eA/++nkwkxnU4gvBABzd9RYvTIMudw=; b=eNsc/q7yNwt86RdA
	y2eZdPs1hu8WWYKl2UqpJSju4uefKJLbW37RZgJq+KnXQibBPcJ0fOvg68eXAr+I
	QLMsedQ4NV8u1fMZsRq9ZOm6/fepjVfdgTkvBhqYz1whho7VP39hhd5MW/VHaAEH
	Appjf0c0eDB09LMZvvICSi/RdqLUydnjN3huq9PBAlJ5Xqqy6hLeoE0TSn1M53mg
	i5Uhvairhd3t3/wNwSA7Yg6mds1vCJYBUEYc51t8GffhgeoqUSCSnqm+DqqPhT5g
	qjqg7OYygcl9zhqsflTC6805iPb5TMEBTIjCbvokguOdtbm9L7BkesaYDJ20eZIw
	ByC/VA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj6pa8p6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 12:36:53 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfa45b280so25531681cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 05:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784637413; x=1785242213; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MVnqQ5mVLOQX3eA/++nkwkxnU4gvBABzd9RYvTIMudw=;
        b=BXHYqb/jek7J7tVfwbPZ9xq9L8ZF1je53b/BJPprHl5RuUXqbaQEnMqWmfAu8m2VBA
         cPJQJKJbWQURJ69BYc/7yJovcEr9wMXVcAT4Hy+4ITK8ZcfrNY4UpxMF969UXTawkHsj
         NSmRz4I6UY+IKbTSyhrhNXkxw98GEssvdH5kEVe/ggROPrjETeKmexesh5P0wvlvOwPl
         JziX9lq8lQji2L/nIUbrpOC98233QJYDRfG2Cyp7RynOsx9XGQJNyGfKlZdvvjoZPTiB
         0f5wLgF1glSx2W0AOL4vcPVx5HOmF4LFLyiRHMlt/Tdn2IQ6/+91n+j3E0lvcb1mqg4f
         Jh5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784637413; x=1785242213;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MVnqQ5mVLOQX3eA/++nkwkxnU4gvBABzd9RYvTIMudw=;
        b=c1e+q8qArlefQVdVJ6UqalKyDXul+kO6U5YGkbl8vzV0qASmB/1oMiK1lPe2wq72oQ
         Y6EMqEKEQsYa6sAACYzgy1jEdUmd84F6OhokoeJ1mV6Y2v6xSH0IlfCqK1MVvTe+QL2g
         /06kXIIx1c/kLQte7L7/nXSV5/uUPXoxu6+6OEkWWW57GSF0GxKguNKJ7JUHkLyoaK88
         q74xCm4t7sJWJuuNIAkLa2/lwNMXYPoiNBlb/arygwUkTxg/7iT4BCdqkvN8ZIhWyLld
         iEspVeZQ6yvy9KHXjGOElYw9S0ZvQcyNV7OOfLpqW0A3tOFYlp0BZyRLyodrj7dPOXIs
         BG8g==
X-Forwarded-Encrypted: i=1; AHgh+Rq09lLDg9q3vUwSRHvrKCwsqOKpYFi+0pVlwfayY+dAlzs69x7SnmhWUXaLHXiJAqJOkMhBxWnw763y0vXi@vger.kernel.org
X-Gm-Message-State: AOJu0YwzU1RdwNRuOaJSQKWaQVQy2yqeMucPrrX94QDEXD9KVpCWMpQX
	Am9TTQN/YW1n3YrS39xNCJn5w+tFgoT8mSabXZLb/gWHZGLWAiUwQHk9ABxc6DzVK6ui8LVxyN8
	WrEU67wJeNnOif+KiK0JFYc08gcSscoalWf58UlGUgMDWZnI28aYJgq1EzPvA7l28xT/t
X-Gm-Gg: AfdE7cmPDSVNgrI/kEOec9hT5EYODF5+v7pdu+w+hOldVj2RsPL+EVQAD2G+RZoJKUz
	LI3AjtZqaBnl3q1z/K9lzhPTZVtI5B7I88v8qG0+TUuXFi3RzBQvGFemGQ9mWYI7IlJyj/nEeD/
	3JYVY89LXVDntkB2Yn5K3ybN2fUbvyvhst11a7jrAkSq15oUhb2t69a0VTsnkgy6NPNM/UXhzmN
	pjwAv8NEbnVY0Z4DKPn3A+3EyAEEogFqsHJ3o86b7Knwbp5hBt5UBMQ566JbRgnX+vU9YYnDS9Y
	cfoJoIaT/vIl+hw+xZck95aqVsEka185NHQbC3GiIYKJjea2k+MB2WQYCVKReo5uEOqC/QfP2Jz
	LqZ7HEuFPN/GJKjUWzCY1e/Ri
X-Received: by 2002:a05:622a:9dc:20b0:51c:223:3c57 with SMTP id d75a77b69052e-5213f375aedmr104331311cf.10.1784637413443;
        Tue, 21 Jul 2026 05:36:53 -0700 (PDT)
X-Received: by 2002:a05:622a:9dc:20b0:51c:223:3c57 with SMTP id d75a77b69052e-5213f375aedmr104331151cf.10.1784637413046;
        Tue, 21 Jul 2026 05:36:53 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1705afecc3sm581269666b.24.2026.07.21.05.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 05:36:51 -0700 (PDT)
Message-ID: <a5d6f840-3849-464d-a540-634dc3ec81b7@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 14:36:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: sdm845-google: Add dual front
 IMX355 cameras
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260721-pixel3-camera-v7-0-82d323c6c5d2@ixit.cz>
 <20260721-pixel3-camera-v7-1-82d323c6c5d2@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260721-pixel3-camera-v7-1-82d323c6c5d2@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: a34Lzh9PeFxvtlfdsX5wmzH5bkzFMHI1
X-Proofpoint-ORIG-GUID: a34Lzh9PeFxvtlfdsX5wmzH5bkzFMHI1
X-Authority-Analysis: v=2.4 cv=eYYNubEH c=1 sm=1 tr=0 ts=6a5f67e5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=5ZtbFIxHr3uJdDL8FOUA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDEzNCBTYWx0ZWRfX7VgoNDPG8XEM
 6wC3RaHtGRGHAgbj2BEeRfzk04+rtpN7eYwx6cTan8Gqo8mKO+56HfWdDPz4+pW+A7MoGKBa58V
 39pXi2qKfOh5te4h2ZJ0iAxM4Lc6MpNf5UiTamaedfvO7Z7Ta+ccR64OUIfZHw3T58XK1DNX44Y
 B1lLImG/Bhw50bMLZy/N8DcauiFxmQldqJ1UwjF2dFoD/1p2UtXJei2cszEPxlY8VA15jgnhlS4
 8QP4qgSWy1ZruOEw4sL8fhwvdhWtMdDwK02fM/vJcsAdXfG/cusFoPQeAYEXwk3U2joR4f9aIUD
 apNrgGOGWCN1EDSSHdx/4Ijy0Kgd6RQhTOIz8E568E5zZmeovHItXzN2ifDZm/ed6abqK1KrS6W
 bQaO2AwNKQOXfqlFm3AsXggbTo8b89BBbtSl86gnD6xYKkXhgj09+bLWFY7cl0vxW66awIDTfyN
 T1LvS4sWdPmSETwwxLw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDEzNCBTYWx0ZWRfX3tA3y9ZEHFsf
 VOtlZWrQNLh6uM2MoHUEtWDc2IgI/6rqWddo8D9x3BdXVr2L5ulJQ3qxU0vKEINPbH9pzbD8Hf6
 FsrwOtB/kN3C/k9BtQYsSQ04h4Xnwmc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_01,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210134

On 7/21/26 2:33 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The Pixel 3 features two front-facing Sony IMX355 sensors with
> different focal lengths (standard and wide-angle).
> 
> Sensors are connected via CSIPHY port 1 and 2 and controlled over CCI
> I2C1, using MCLK2 as the clock source.
> 
> This enables support for the dual front camera configuration.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 172 ++++++++++++++++++++-
>  1 file changed, 171 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> index 9368fd6b87515..c8a28133fb38d 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
> @@ -1,16 +1,18 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  
>  /dts-v1/;
>  
>  #include <dt-bindings/arm/qcom,ids.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
>  #include <dt-bindings/input/linux-event-codes.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/media/video-interfaces.h>
> +#include <dt-bindings/media/video-interface-devices.h>

These should be flipped to be sorted.. if you smile very nicely,
Bjorn could prob fix it up

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
