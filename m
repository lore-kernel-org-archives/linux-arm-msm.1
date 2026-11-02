Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793624800;
	b=ETse2D6ODlL9FUKABgwnW5jGOeRmZr6T4a3JopOiihpRM9SAIz9XOv7Rji3f1NDqowTS
	 BSiq9nRoNM4S0y9jnfQ1tmAkALBQCCwxDIdcWA7Vh6cqcd2D+k2J/lR+rrDmcPe+7dzjN
	 c4sNytWjEwBuriGRv5vwIX3+Q8C1ZC5NAVW0wlfxbUSqYl77q80xj61IH2e4X03dhS8qE
	 Lb1ge3i0Zick30Rpp0ccSKGRJ/kdREHUckx9al9h7Z5CDKGFCoRue5toB8Q5RIbhxiauw
	 uHLl+dltUfcJxTFWKas5IAjxrodidATfUsFMav4AdUl/60YTPeK8Ti5JWEViHnovIRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793624800;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3o0VXu9bpIpJX5ZkWtYZhlfu7R1IyftxP8YGHOrZtfk=;
	b=j+v+Y7618mE8RqVDL0ZIOdWrLqk4ffVYl5XHtarZmS0kbavf3jyu5aZG21EC1Sf9jvqX
	 RqU1iqifAM2oIool8nEu6wXuam2YlxAJEIS5R5xWSPdAJjKxA4SddcK43z89XB0LkaE55
	 5HdkqeKF51rLgzv5/uiR3oONA/X8rgW2nkTgTIcFlI0h4aeRoL9254WAtVnRGdp6yK4k1
	 aFh9HHCyU9B5JAPsz1KPn7/G6qKVwCvkNs29FudhTDLF1oOFJjsZnC6JSnnJ8wfqNDG/7
	 wQguLa8mP3GnWqvs1k7V/tReZpCtdPtBNZ+Vkuz2isEXB3qol3vDH8gr89bR/HWTL+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NDsGjcbM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YkJ8+6W5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525D5606A338
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 13:06:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 525D5606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=NDsGjcbM;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YkJ8+6W5
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2D0RdF2337726
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 13:06:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3o0VXu9bpIpJX5ZkWtYZhlfu7R1IyftxP8YGHOrZtfk=; b=NDsGjcbMTbk37MeD
	3eYr8+mo7g5GMNTPToIaxFw2Hy5u4l39seDueMZLJadr/3jcK5nlP5foqSXQa6uc
	vQtXJvr8HNGX0AwyFlixB86APMLmugNthXbAJkme8YuE9CfRKZMGu6VtyCXWAGU5
	lKhkyYDeYiC0H0vcGCrRVzAnhXyxtPaZcqeXylcHO/H/sAVriOrlwB2s82B5Gucj
	JUnKQeaM+MhcSjBfBXYvtIfPwnLF5kyQFI6T4zjEBeDn1y+6AqpacCnypG45rNNa
	nVtQpyPAd/vmTum6JBd/GTslQtsM95EMSvcaheO7t/TGlhhIj6nyWTSB2ftEIyU2
	mbCyuA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4hs76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 13:06:39 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-9906ce36960so102040241.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 05:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793624799; x=1794229599; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3o0VXu9bpIpJX5ZkWtYZhlfu7R1IyftxP8YGHOrZtfk=;
        b=YkJ8+6W5OtFMAoZ9w6cELB2siAaupaYdupwiN4cOuyfUCTkDDS2ZrAzSACV7lbOpHq
         MzVu56EHtWuuVLEDml+R+NQ5kdKS+3C3KVYMu7R/HSx7wxGSgmNVYFYyeOPSxhfig1Et
         Ev4BUSOepetq+FE/uLJghj+XPSmwlrsdH6Dx5HMtZ9439cJiLCngzFbYoxm6+fmZBMvV
         ChV2F+N0Zc+YEYOZDIeBkqLAtyCl/DHGxHzFX0ng0VyTbyiUAXn2raq3sZS+9wvS6lKq
         rWL8LOj0NWcRoWdaRtJmibzELgGkPOnzNp2Dy4TeyCzqDUoCRNGqlmh/yigPxW/br3e2
         Zcog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793624799; x=1794229599;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3o0VXu9bpIpJX5ZkWtYZhlfu7R1IyftxP8YGHOrZtfk=;
        b=WxDfiZrD/c8eEU3rjIMjYz6SR12pbOi8Wz+Xtk+tE1/WHJidvh3hazSgCg2MEM//TM
         hrfvlMSTfBTrxAEJrfazTqNOFbdbN9az6rrUREzI36n2UI5RDlWIbw3DQHwf6dMbHhCh
         eTclpuLo9ZQFEljwT5BdRV1zE4ZF+435/SHXwugXLR6BWYWdOMpJRe84De62TNaxRuh+
         vhvupXvtbAQmOpshYwNdAnrsGqxkXfBfgeaMzpQKUyNzWlFloROfVp76bl4q2Gv7n31m
         Mzwk+N1sOsP6imVh8Y8rFCKSlG4W40DA6+nXZLrrJNa3U332k9h021pRhkY/wWhwRWf8
         GLAQ==
X-Gm-Message-State: APuU4Z98MDU/bsckFZ+cqR7UyteEGKSCg+fVpp4/yGw7GVpqtYnDUOav
	CNxjyFISoGWnCvF/KqNcEf+cYyXI+LYC9+Z0etxttpC0Np2JDy1M6jnd0els33e9TZ4eiAbZdWY
	JR/Rc85kKWVAotpwKXhOhtDj4BTMDtnL24GWEByeyr8apnwF1hLYlbHKzd4B2EE1g8o82
X-Gm-Gg: AYBFou2BnHWn+jHhYf9wZPHn7SttiFXh5TCqAzcThCdlZuuWjB++QOT5w6V4futy5pt
	Wj1cYiR+wlB349eMROPrLSvEJ6M1FLYGmowxLiMZs68eoIajl201LxA7D4YHGBhZdZLiAxHjaz9
	aQ95abdVCQMImZ1W5bU+E+7WcErAj6Tt00GqoHJwYRnmtJkn63Yw5C3a8UdiSRq/zipzh1rusUr
	rCTrHXbtBb35jWfbvTpaAymaqS6LX39ye5es6vuCKcD/3IrOfYRGeFJBHCxjamqggUE3ffZqeO5
	Iqsyihfxx9AjkyXqvtURIFVnAP4+lqJKpWwcw+SarPnK04MKhm7OjIsmFu+RVsrwtZEY7CVhWkz
	be2N50H3v4FdcAPoIg1K2WS4hyH5zXkEGusF9VSjCB9E3iH6M5vVgnepQybv7cw09zEbMycA=
X-Received: by 2002:ac5:cdf2:0:b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ec6896c00bmr3914163e0c.5.1793624798633;
        Mon, 02 Nov 2026 05:06:38 -0800 (PST)
X-Received: by 2002:ac5:cdf2:0:b0:5e6:589b:eeec with SMTP id 71dfb90a1353d-5ec6896c00bmr3914116e0c.5.1793624797996;
        Mon, 02 Nov 2026 05:06:37 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe2d6700fsm1540121e87.29.2026.11.02.05.06.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 05:06:30 -0800 (PST)
Message-ID: <8ddb1fcb-5d16-4a58-8279-a8f574021626@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 14:06:27 +0100
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
Subject: Re: [PATCH v2] arm64: dts: qcom: Add PMIC thermal support for Agatti
 QRB2210-RB1 platform
To: Raj Aryan <raj.aryan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261029-pm4125-adc-thermal-v2-1-8f405d9dac96@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261029-pm4125-adc-thermal-v2-1-8f405d9dac96@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jd8dn2378QwUHUZ_O4LfjBwODXsRWfu3
X-Proofpoint-GUID: jd8dn2378QwUHUZ_O4LfjBwODXsRWfu3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1MiBTYWx0ZWRfX8FpJxcszKjOa
 6s/0ad5gr+CBWSVIdu8JP1sdpGuQwZAXrsOclF83DubUnUnAnOsrYD+I/7QPqtP6Giylfmxy127
 IastdxsDh7Yce7rZ8bgqzYAumo1YNGs=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae88adf cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=7vQ31RHkpAPUYO8WQUEA:9 a=QEXdDO2ut3YA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1MiBTYWx0ZWRfX2nl7lvZC8oIV
 GM4qOtK0sInF0rbJ4t9CymFyHVKxvAH1lplmy3DDEGVmYc2kbl8WphQZEMK4CFgK1nu6u7EojCq
 gxITiDB51BlGJFVN79QEh/zZnBse652ecNm2XPxw0LT8NYlYJD61upRjrDY9WZGvg5x4U3bGxoa
 6NhSg/eAYMBoux1PsqXcJv+bti/PMc9Lid+bNXScGUZv8yUFIHBa+17HggM2wHvQZf5MMJa33KO
 VR0Ko+688acVC6/0GuCspsWhREfqWNOJYXahkXyrs1vAadx5AzL2nDIO4Cp3/EDljLrreL7YWVG
 Yg829Js9x/bydDVi5FdE7RzMAp5GRHCfPqyytQ3j4UvkYxDpXFKj1yx6Ret/rigpV8hcPfp1oRz
 dmfZOR4RKDpOl+a5mpPSg0ov0ufNaIDfnjNfSFImMqB4Wd358GzSPSsqXzAvPU+RiydNMWKpSJl
 r8xzbeLU+aPJi7zgqrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-11-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020052

On 10/29/26 2:47 PM, Raj Aryan wrote:
> Add ADC channels for msm, quiet and xo thermistors along with
> their ADC thermal bridge nodes and thermal zones for PMIC
> thermal mitigation.
> 
> Signed-off-by: Raj Aryan <raj.aryan@oss.qualcomm.com>
> ---
> Changes in v2:
> - Moved XO channel into pmic DTSI file. 

You only moved the channel, not the associated nodes, please
complete that.

Konrad
