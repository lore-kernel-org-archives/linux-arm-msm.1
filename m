Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48BFF4A3D41
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 15:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790351404; cv=none; b=ha4nVC7T1fu9C51psp6Ji/xEFyQtnEf1O0oNFPvm0SB1Q4rIuZWr5OmXmKse0gNz7v8fAnsZJ3GM8FNM+XMBW4HhVfxQ1I7orJcIBHhGFHGQzewYnoEBSdwdZRnRLhNZ62v2cmi6kDsPbXoqLZQHwgnluiU9J3Wdn/6WPrR9x7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790351404; c=relaxed/simple;
	bh=oL9x51PEBLfHmQbHRNyTBoADFNFh07BHQ6Ff44okLJw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KwisQJi916V4uEOJ13eoBIPdAtT3b4mN99Ikritfdj/Ix+SmUtgo1zARhB6tYJEGoMmR9ZV06CUj3dYlz44dwkLW9hclc5CmZSUljLfhUCcPe9KvbPDfuxtiBx+D5IezPioO2rlp+BurNUKI4kQrRAZGobuuH/mAXXwF00IWcKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oc9Ss/sk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NcW4QnRq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oc9Ss/sk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NcW4QnRq"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68PA4Nhs609372
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 15:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1rCb94k3VkKhCrxCNCXwFs/lYdfkRp35r7QhubIVMUI=; b=oc9Ss/sk7qbHjQ5q
	JHgqGn4+8Em1lxpk/JSyqyKbEbRGvdqiRudnjMIhGGUtUtLxWbPdV8W6xkQgijRf
	v2lBDS5PfIs7KmdPuORa4JMtkGKlxw916AI7ydcw24YL8Bmz0aptz3Kss31CMbIG
	5urCg4F1vjx58uy8+rO1A9knIvvdJ/tiSMK1HgSPvK6RxBBgyS+79CCeY+OfR0ds
	YTDOCFjZI1YSJDX+A00sJR2umL+GbM3V6lRBqsU3wmPn6JTPt6c+3vM9HZMsL8AF
	vkz4MYm/1ONavTjxl9Z8Wp0XAepXRIqSp2YDcAdoXw4DbN6wA6mkYl58wP+sNDpL
	LHUYkA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gwpvns5mr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 15:50:00 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so2721384a91.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 08:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790351399; x=1790956199; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1rCb94k3VkKhCrxCNCXwFs/lYdfkRp35r7QhubIVMUI=;
        b=NcW4QnRqMrchHn2s2VSXeCvM7GpEdB7jJdwmoCSIBfbessfWGQCmh58OnIHbW5QeKK
         LyFxH2V1GFH0cOEx8PVRkExZrEI13R24dZHBkC4O0oQ3JvtFXoK5oRHNCOOPzpMsAiFm
         Pb8Se9WSn2sVV8Fe1BVxrTJqkGxCjDFkyGVhveR9CX8QciGH5fiS6xi0fLLG6yDxFP3w
         SZGk/9dljZCCKZEZVkK42sp40dK+JD2LE3MeuOaobt8QWdkh/1wxaDLbLwqkkLIpbCWm
         p5IfMOtzt06MUHH3cWYfOlyyl5KxjYuxHfhUrXKnuwwytMYGfSQNK4K4VM0uPOqRuUOJ
         z09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790351399; x=1790956199;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1rCb94k3VkKhCrxCNCXwFs/lYdfkRp35r7QhubIVMUI=;
        b=AOvvUZe7qagxSUdSKHya42SsApTsIddle1J+3QRZek5RsE08nspjfqJsEKh12V2yQO
         0OJdyUResZNlzj2O3k97hDBDwclo3oyHQu0Y4GoB62CRTgChfU3X/NZEyg+zUkI2o0oT
         w1YHzB0u3kRNa2FZ7LmYVCzIMWTNuazZrG3WD0oOfMDAfV4FSmvBN6qCA/w4ZaSldzFp
         siH5ugjbdL/eS0rvKpAXEFt6AN9dmhm2gud8XTlDxUgqWn5IJM4O5PYdEJZAYW1SEBoZ
         TBoFDYbzMYauPuoSGyaLhOr9hioR9UX61WpM0kcbt55pVYoTSAX8NuR6Bg2IMxA/7P6L
         Ro0Q==
X-Forwarded-Encrypted: i=1; AKwUvBwZ213T6HV/4v7Yy27yNyodEYOUVzDN0W7xZ7BFzLZCZdb7KAaxWuiM1eLsUYKH2lmcpQEBGhoYKdBNYMAy@vger.kernel.org
X-Gm-Message-State: AFuF++nLuIIPU5T8/pz4rwv8qa1Zk3I1kKBE7r2WA5HDyb5YeGtfEZ6g
	zRFfMQT7E0ZCWW94vgH4FFD2TnnqGMrdDkDIrnvIDuF+ed3iGtgo38lWQyXcpORmv8bTcbEYBLr
	gLkQAwA/40YPZZIHUgEgHrCJf1MczNTQM2Gz4ZeLiYXA7d4G4I6wVGPuo5vhMhU8i72UO
X-Gm-Gg: AYBFou1NwUy/icc1mAmdR3rJj78r2J0lZ+lq21hfVW4FhPnh+BpVYWDDQMCL9D1u5KZ
	XbUtadmbl/AOy23zuEQVl1/4+lm+o2ma8f1LeMji4Lxu1q4gX9JkXoQWcMUJfC6Dr1s+On7MZSk
	NXtlhdlMmbxHELjLEnmh9RmQKfg0ydsNcSLdROLINJeV59fWDBC1zoiJfiNVd+3nQNs6Ol3yGLI
	vVfXaTL2onEgCMmQWn+Ac4QCqGxfXs58oYhgPW8DD+15tz+hGTKaVlD6AxJlewSAIqNFh4JpUPM
	KFB/E0irkEr3/yihVtVbXjxL7+2CNGwez0vOUn/pG3juSfR7XyguU8ppfpy7f4H1ugoQOs33xF4
	ZgcUv69wGQlZrrFInlbqmFeSenKQSv3ET
X-Received: by 2002:a17:90b:4a86:b0:39e:6a82:afd3 with SMTP id 98e67ed59e1d1-3a098feb5c6mr5878781a91.37.1790351398857;
        Fri, 25 Sep 2026 08:49:58 -0700 (PDT)
X-Received: by 2002:a17:90b:4a86:b0:39e:6a82:afd3 with SMTP id 98e67ed59e1d1-3a098feb5c6mr5878751a91.37.1790351398188;
        Fri, 25 Sep 2026 08:49:58 -0700 (PDT)
Received: from [192.168.1.8] ([122.177.242.141])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9357f64sm5541774a91.3.2026.09.25.08.49.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 08:49:57 -0700 (PDT)
Message-ID: <0e80efa9-9377-474e-99f5-d458d81bfcde@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 21:19:49 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: glymur: Add videocc sleep clock
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260924161152.1162301-1-shengchao.guo@oss.qualcomm.com>
 <20260924161152.1162301-3-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20260924161152.1162301-3-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 8YHPlcyUmuaOJksBCbPOZHGRK_OsnXJY
X-Proofpoint-GUID: 8YHPlcyUmuaOJksBCbPOZHGRK_OsnXJY
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX9hh8WJXB8EXy
 Q4z0fbjjdmYtPiHxjpbcj1znpnIj1XWas+loEo5OAwQC7v7OEPJURP1uFg6kMLcqDRKd+1er8J9
 3h2Ne+Cj8k9EdQMu/tVVHr048uNxVb0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA2MyBTYWx0ZWRfX3QvyZ8RTtXiJ
 tyb+DqweCNsrJFhRV1OU+WaBBHfgWIGX5wDzz3kleG1jmlZmjqWAOWdO55uZZzsvr2PQGQmrLwX
 sNkbXTpxFkbgPfnmRAsgH2KG1mCzywGP8FG8fnwnDaH6PI7UY03hFtsi06S8CkuEQ964nS2vvhA
 4cQK2o1LACvfE+PddSVegiN2nWGsjh9soLLPSgMIFXxVj3OHZxaBkFbwZUPJGDB+Y3BiXlDYGPK
 D4P8SH0vlAE6kree9xWFZmU/JOtQ69FohlOxkTu1WuM7Z8TE9NlMogF6V3SBMP5TspM5SD1EvyA
 w75qcHhT5f3mwhOE7BbtzQ+8qSlTX0yAIdzTlUToA4Ianbiy8YAQ60/yVFOUf2Jfg+VMMYVebQH
 3UPj7Rj8EMD6VR4eBWG1Dh5PyTawxnydxu9db7kIqTKql7+xQYD9Rg68W0gUeoWrXkeox0r3Cj5
 h+CRIELO9Ycokkv0uRQ==
X-Authority-Analysis: v=2.4 cv=eNmGH3p1 c=1 sm=1 tr=0 ts=6ab69828 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=c6pmHQ1/mDMFVLCaehS4aA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=cRXVm2DszLkgEr1CbDgA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250063



On 9/24/2026 9:41 PM, Shawn Guo wrote:
> The videocc node supplies only the two XO inputs. videocc-glymur.c
> expects a third input, DT_SLEEP_CLK, and uses it as the parent of
> video_cc_sleep_clk_src, so that RCG cannot resolve its parent and ends
> up as an orphan clock: any clk_set_rate() on it fails, and it shows up
> parentless in /sys/kernel/debug/clk/clk_summary.
> 
> Nothing is broken at runtime today because VIDEO_CC_SLEEP_CLK (0x8138)
> is listed in video_cc_glymur_critical_cbcrs and is therefore force
> enabled through regmap, bypassing the clock framework; the sleep source
> simply keeps whatever rate the bootloader left. The orphan still blocks
> any future rate management of the video sleep path.
> 

Hi Shawn,

The sleep clock supports only a fixed 32KHz frequency and does not support
any other frequencies. Additionally, this clock is not currently used or voted
on by any consumers. Therefore, leaving it in its default bootloader configured
rate should be sufficient, and this change isn't really required.

Thanks,
Jagadeesh
