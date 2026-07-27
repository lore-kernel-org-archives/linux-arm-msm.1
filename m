Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB60641A543
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 16:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785169262; cv=none; b=Cs8opKNW8gETpt7hX6R10YhP7ma4hgIdb4CNvUcj4ZWD6fIhRH8XvcJa9ocrOLDMPZ+tNgI93AcjKUAvIphdBH85rUlk+TldTG0GDLOYiEo5XInNdfcPnIzK+XGOF9n3WW+GdX9UvMZUgoP9RaEnybywjGi/Mbw3ged5u3/QVy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785169262; c=relaxed/simple;
	bh=VSoZ/Yvflf9njUDjolCvrlg1UsMLdJVo0IyB+F5fpBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=supOqIwGgik0ls2FMGfLXzqV3o63vZMloHWvIYs8Zqi/xlZDpwDGO52V1Qw8bDR5+//jzdBu9Y3VhShPGrPRvKMSBzhNubpRi9GAcNumcp90hUmOuZboYN18xQH1J9+kwBTUy/PRakuCopLkvQoxqk/kQLTZC3/M4s/y8b2IiWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Il2U4CBw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eYJX+YIT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Il2U4CBw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eYJX+YIT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDm9wT3823625
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 16:21:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TJC1Kk4z0znuYuI85iMSAY+a
	YCrRRnb9JLjoaulIkSw=; b=Il2U4CBwJh4Khum0EV76v3dE8/qPWLka3e+nThm8
	Q6NU4mESW0cnXRQuf0fsvVFgvioIA6eharIUaE3Q8FqWd3HiIEMHTR6uIUmMYZKE
	cZakg+L2qW5bCtm8uWzSjcDjX1bLMceaDM8ibjD4KS23A2YaOdV4CPSALfx/BEaX
	/WfYX8eOkn13MPH8obMMxa1g8RzT3/ioAqKCtAb4RCclbTnfbaSq2VFesHddCZvC
	Y6VaVvHh7MifSBmOddgSAjKKhQdTR6eE/DQgscxPAAx5NWVq2fUF7x3Q3UIUIdFb
	hcKTiq8nNHVthyt13Niiz/KYzAqqpZGcJiM2tXycbeENoA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4nbsrud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 16:21:00 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-385d2703b64so40629a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785169260; x=1785774060; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TJC1Kk4z0znuYuI85iMSAY+aYCrRRnb9JLjoaulIkSw=;
        b=eYJX+YITrWF9oHrb6oqd0RilNZKqmuMKQr/KoA75KPx/bLY2lTr4kAzozRAbUtLglw
         7bQZh2uyAIlHzfYsS/w+JFzYxp0Js3sIvfXLAYqH3yn6WBUHr2+3zi8tCMdr7NJIjJU1
         015lBp88yR6TBSPTBvtSxS0UDvJ+mzn92FO8y8Basg47HGtzHvqSZPs3phT3Ys0YkZLD
         DhJHP5JOhfN+Aj5a5gfBAlKPUcjhT/4DEhXodHu/BsUwefbHW77uf5n3ULZFYFSg1SBE
         +pg1TdFRAJJ/S0P//qn4dDspjkUFxMCRacnNEGEy/QlIQVDiIsNu6KdjnAfPVLPZbdbQ
         7xaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785169260; x=1785774060;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TJC1Kk4z0znuYuI85iMSAY+aYCrRRnb9JLjoaulIkSw=;
        b=Z1slY04CJhKrYQThGQFo2P/fYbgmMnZ9Vw2QmZv9DDaVeHYfHtZJivlNC91vd3HFbp
         qe964YDmb9WDstroBcH5thMRS0OlQvUaEqpbo7UPyacUY42Epqa3gXQmMDnQ1dOhrvr6
         GdPpUbWOO1T8yEfD9bfcZSId/5aLvQ9w3JQ5S3RBMpg4JlwHeKi4ifsyuL0WnCoKvHvT
         G7wiUgBxxepzORx2TnMBCVZjG+DLlHjRB0Zn1eHSrz+hMeZfj4f8VMfV1n3aaWsaYUrZ
         cT55NCUGK2E5UjKhjxC3fN5sZlqhIVdughCqXRSXUzpYbMLfdvc9eajyfbNuj5UCMUeJ
         yf+A==
X-Forwarded-Encrypted: i=1; AHgh+Rq0wfAgnHu6IweSF79vNVyPeCJ9GGEOSeHC1el5Est3NPboR2mrLZE2gBKuR+99+J96/pGv+x2q5DA0fw9V@vger.kernel.org
X-Gm-Message-State: AOJu0YyyVAxAHEoo17ZLYZ+wKMSmjCDaK1eE/LXPU+LRLce2RMwhDDK+
	X2oaQttU2CvKHZtcpt+D8Ni1mf9Vn5h0xAuhGmjtOc+hLnFB79UxTTEdv4VK4UcRkdpMh2OXWrO
	vQpcTCFczaJ53sIdvKCHNR+zAW/YHX6j7YpLChOx3maXqxabyiLoe6qZCsnlsxAj/UVxh
X-Gm-Gg: AR+sD13pejktT5Tk3/JS4INcQaB4u8J07mYeMWReMy7ns6NIEx9EFF3pes26HjV8PUy
	3DEOGkme4AVPjDJMBepMfQEP+skb9//9vSTsUFGr+kWFLgjBJqnDioF4JlUagagA/KUi5rTv5Ne
	wn5fPs3AFQRkn7rdqhbVlpym4UF68ldCedPfvXCey2NC3idkvnyUyDicI8KP9kHhyqPrdwzfisM
	jAP2jLANMD3hdaIBC27kHhKvi880Xc8lI57vf0Ai27ojhCkrqZ7Mi7K6lAFUHHPECujDyFUFgWB
	dn0r/n22C7uZjKQfOIzotF0VZFyBD0uDJ/HPG/bV0pirjBVFC6khr02zHZrE09r27nPxGXPfH5t
	ays16jRBE5a8wHeipONamNVCy0eM=
X-Received: by 2002:a17:90b:3e82:b0:387:d9cc:7dc3 with SMTP id 98e67ed59e1d1-38f644f8722mr82528a91.21.1785169259976;
        Mon, 27 Jul 2026 09:20:59 -0700 (PDT)
X-Received: by 2002:a17:90b:3e82:b0:387:d9cc:7dc3 with SMTP id 98e67ed59e1d1-38f644f8722mr82502a91.21.1785169259365;
        Mon, 27 Jul 2026 09:20:59 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f55c6sm89142555c88.15.2026.07.27.09.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 09:20:58 -0700 (PDT)
Date: Mon, 27 Jul 2026 21:50:52 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v11 3/3] arm64: dts: qcom: ipq5424: add support to get
 watchdog bootstatus from IMEM
Message-ID: <20260727162052.eyvmubroov4fex64@hu-mojha-hyd.qualcomm.com>
References: <20260727-wdt_reset_reason-v11-0-eeedb22beefe@oss.qualcomm.com>
 <20260727-wdt_reset_reason-v11-3-eeedb22beefe@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-wdt_reset_reason-v11-3-eeedb22beefe@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: B-NAommh2XrJLq2J9mds9NeoKZbNi8gg
X-Authority-Analysis: v=2.4 cv=cJjQdFeN c=1 sm=1 tr=0 ts=6a67856c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=sTVwHD2wD88z-ZP_hjEA:9 a=CjuIK1q_8ugA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE1MSBTYWx0ZWRfXyOyhpnwwDiQ3
 LN4IyIkqgvP1yQuYsFCYWa5ip1EVz3hRPOaTDs2oHVQzL76sFZPRdOkkQwOkTMc+D8RAsoYl19x
 psno5LNdg89O3tdLVzSyhDqv8Z2pt8I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE1MSBTYWx0ZWRfX+yxBLNTEVcWE
 cYBgAD8S8xFBgHsmrmx8okyxmFPuPvlVPZpj335n196dZ8gPZQ8fEY5MX9u5ww+epVuXLXlFb1e
 EBHolPNmBYyOJ2/RCSAg6zlaqsB/9kydJM7+RCvSAKUmptHDsVCBR+aFJ1V/GjqELKZDZbuFhxL
 zvqwSDx3qYo3uqM3Dfg5ijV3/sa0CDgGZ85uGLPwDKqruvvrSEIIlve4OZfmuDI0k3uYBUjaan+
 1AKy4WLntx4dpMTJwkz2pbLvc5klO660LxyyDmcVd5d1fOsPDjwHfVn2ihllqjxUCYZTI4ycw6A
 dygZ3uN2V4kkcfH8J2LKVQ2yJV9FwyFOELkRh6CX0AVjLY8dO9vowX2nH8ju5Kq0Ba7HlQLJJ8R
 c8ZLARf5GjpxuFKnEGH27xVqz0qJAQ0yETayt6PawBAp2sTKNPMKZnB2uYToZPw6Rc14fT8B/1l
 0tqNED9bdlMZee5urHA==
X-Proofpoint-GUID: B-NAommh2XrJLq2J9mds9NeoKZbNi8gg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270151

On Mon, Jul 27, 2026 at 09:17:37PM +0530, Kathiravan Thirumoorthy wrote:
> Add the "sram" property to the watchdog device node to enable
> retrieval of the system restart reason from IMEM, populated by XBL.

Just checking if it's XBL and not TZ? who writes into IMEM.

As when unsure, mentioning boot firmware is a better choice.

> Parse this information in the watchdog driver and update the bootstatus
> sysFS if the restart was triggered by a watchdog timeout.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> index ed61db0749f8..23f851e9241f 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> @@ -624,6 +624,7 @@ watchdog@f410000 {
>  			reg = <0 0x0f410000 0 0x1000>;
>  			interrupts = <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
>  			clocks = <&sleep_clk>;
> +			sram = <&restart_reason>;
>  		};
>  
>  		qusb_phy_1: phy@71000 {
> @@ -739,6 +740,10 @@ sram@8600000 {
>  
>  			#address-cells = <1>;
>  			#size-cells = <1>;
> +
> +			restart_reason: restartreason-sram@7b0 {
> +				reg = <0x7b0 0x4>;
> +			};
>  		};
>  
>  		usb3: usb3@8af8800 {
> 
> -- 
> 2.34.1
> 

-- 
-Mukesh Ojha
