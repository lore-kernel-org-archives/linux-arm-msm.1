Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794578391;
	b=vg8dm/FTtBF/G6XWQf7937aYOxXdWt1dHE1hbVDff9AtjdqrEQ8xrOEkUDsMz56nCan4
	 WxidQU24frRQPmu4xWr8rClZqd9DuFRP5wfwFnNJy9tsFs+s4GCFerZCQl6FBD5wHvy5F
	 nUafKiZwJjrOZjePkaOqNTc9lRuxTDfWUK/MZe8pKXQqHMaCSaOVuwxiyJf9Bax58BwDF
	 8u4rL8pK/XcmScymQGsau2KzJZ7DJZDYxBxOvTZVw9xjSp9yVWG3DJ6kJTtO57yQconSG
	 eG+BcCaR0JW0g8WLSlUiYUUz4+hdzZYMho6193hz4ChuyuLZRrU7et6wLOF0hzC6gRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794578391;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wWzAUjZknh4jZl3NcGcDKL8d9zuu/SZC4rP1w2kOxz4=;
	b=dMnd2FdI2094GVNU9Bd1mquAATTAM2uu6ytjzVw20DMKW2ShmOYt4br9rsCAQAhFwE83
	 tZyaNOVlwcJL43jdA5OJAiBmWwYUfz4ILhroA6WcsZ4QjCt48WccFJ03hixgY2zJDZduT
	 Czx6NzbOUQjAHLGXfIyyRjOG8uF1DKfrlhF71OZarGFig3DiXmnlxTMN4WBv49yh39zbh
	 ElLr6bus0v0I8i1sLcBPaDne5tOh8xWjsbNxJ6yUMI6nzna/+eVJt5YlA7Fp8Q0ztO3ky
	 3BHh7HwIPnP/rR9X0QqTvCI04FWMNlg1oWFdRyApkH6uTV0WARJCqyP0qi8CWD6XYpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BHGYa9dw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AUfiTykE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612E5606A896
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 13:59:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 612E5606A896
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BHGYa9dw;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AUfiTykE
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADCJcFl688976
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 13:59:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wWzAUjZknh4jZl3NcGcDKL8d9zuu/SZC4rP1w2kOxz4=; b=BHGYa9dwBFVPl3bH
	262z7vPEMx6Ep/+o9Zt/ee7SXdvIkpmkK7lS0UL3XibqX3ypzttHtwtcJL8z9YPE
	XyHL4t7/YWiiXzNU2XTmdN7ZqgT4s3PumGhG/9ksPU6sBn0cSbJLDCzIxJ7X9YP4
	B3K8MWkecn0doWzpI8EyFsotiYTeqhb6ZsyBBD1U4u8IPbWPVtps4QFEU3ZBIH8q
	MUsLx1CrsH/4D3zhYiHfI28X5PUR1k0mrMa4XgHcjeXuJR6+TvpbGhvni/g+R0s9
	Wgb3yBNkrfZjYv1bx+u7rvsr4Cju5hGf2NHvPFyaYSIQpCoqgePyuJg+z9jVLgID
	fWcpdw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufjmf5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 13:59:49 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91f2e2c3482so534586d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 05:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794578389; x=1795183189; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wWzAUjZknh4jZl3NcGcDKL8d9zuu/SZC4rP1w2kOxz4=;
        b=AUfiTykE1LQCJ8DmFcDd1zFIHb5SCiK9MiHiKLv/Mv9tj8rqyfxAJLyiqo4JUf3j1S
         mv7JwR0EP+7UBVBJ8x8P2h/rrYCKUigHMVKdRljNFVavARqO6/M4XhRyjj5dV36B55Iu
         rw/T6yPqgw8zY7mlOPNGr/czymAn9aZ+6+0TzigTr1pHSqZsEZySDenmaSmO/mUudglh
         KUwHicYd9udcVVK6FyO/yZHzASRmEF30TmlFNl3qpsdzUpYf9xBSvnbqJkh9Vt3hTI1C
         Dc7B+EetOilA82ZYCu9b0UfEV8jV1TwotTtOF0TNHLR1aaXOEufqQ8FNeiL+DQdFix0a
         0ZSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794578389; x=1795183189;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wWzAUjZknh4jZl3NcGcDKL8d9zuu/SZC4rP1w2kOxz4=;
        b=K67utl6tWoH5Y0suqwxr1oTKm75JSTcFEbgR1tPkt9PWEmmuoevYuiEM+rZWJpHNkK
         p73fuCkohvQjY6RBCeLb+ujIY0oAnmbCx7Ulxdgkb5na7gMXV9IiBXwTHXyQmXv4wp5+
         578W4ux8pjkBihD0wt5TQGAZ+dT7iWiiDO9VVSdGA1z29+u52FfmEyFXasYhYgIGINKI
         LDmTX3TEx3BIsBPGbs+s2vDyM0abUQ5pzKe7buv67XC47D4txPdn25r/gUyKsuzyeHBk
         kkPa+Nr1mkyrmoSsAF4MNQu5de6PF19ity0tBi2CkmwsnyrOnkUduIAx6VFz+j+/nBMn
         LL7g==
X-Forwarded-Encrypted: i=1; AL+hErGvYpnFIqiFxng5HcRbkqStNUhoQyPf9d3MS8oaNYfLuVuicTdf+OHxHpE+rEkX7PbJ//4sYMHJGpTBwNUb@vger.kernel.org
X-Gm-Message-State: APuU4Z8KE7G05uV0b8fckjhBptQV3OYlw38hJuNCzqA8uUagNeXmb4L7
	fXIdWH9+JsbMe66q3gb4CQj3HjtpIjBH3dnbscVV5SVXs1eRFM2cZ8iESufUMHitmolP4wsxa3M
	tpvvP4jpZjyLJLiwu/bF6pD4crNLCjSpJZK92VIh/fj65lhrYpbej0uproqJnlRM7NYy7
X-Gm-Gg: AYBFou307EcME6lepHDBQ9+tP7qNT3z+pT+/2V6ozvhW8zjOXAjpI0WfeiJQAg6Ds6t
	z86aw5OQXFh7QfgMHB/nyEso+XARDaRFIyshwU2LSj/NVfhGgxClHsfHAo8fmhR3R3feocayCmW
	VcCxZ0UZpxjLts8sDwS8Y+HzeE2OfEtT0RgPYGwvFfbVDZLGJg/d2WlBn5olGb9cdHI7KfS/PX+
	SG9jB+k5PwI26JBSNLVmAc/OT5uZF3FJF2Hd6MLuwV0B2e/BI1epwC+ygH+/ifXopUmXurUXTJp
	XEI7fHhUxwuJd+3CcwWiIIp1ODWR3C1bl8CUcJb4InZkgwPHWloSxFN9Mz/TYFpCNnnnpHYVU0x
	WsiHTnydZ09oEJ4T6WhAvGdEBpzn3FlhSdVAp9qUTKhHd1HdypZMNLPYpgtKOiTkXH2wAes8=
X-Received: by 2002:a05:6214:3103:b0:914:521e:7da5 with SMTP id 6a1803df08f44-91f2405e286mr55050996d6.1.1794578388465;
        Fri, 13 Nov 2026 05:59:48 -0800 (PST)
X-Received: by 2002:a05:6214:3103:b0:914:521e:7da5 with SMTP id 6a1803df08f44-91f2405e286mr55050386d6.1.1794578387916;
        Fri, 13 Nov 2026 05:59:47 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae2b76b6b1sm8150891fa.6.2026.11.13.05.59.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 05:59:47 -0800 (PST)
Message-ID: <182a6790-90ec-4083-8da2-14be30803740@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 14:59:44 +0100
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
Subject: Re: [PATCH 2/3] Input: synaptics-rmi4: Support drm_panel_follower
To: Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Vincent Huang <vincent.huang@tw.synaptics.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260911-topic-rmi4_panel_follower-v1-0-c1b2cf1cdb62@oss.qualcomm.com>
 <20260911-topic-rmi4_panel_follower-v1-2-c1b2cf1cdb62@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911-topic-rmi4_panel_follower-v1-2-c1b2cf1cdb62@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tq344yFQuRTANBOvzO06iGK4wW_gMPS_
X-Proofpoint-ORIG-GUID: tq344yFQuRTANBOvzO06iGK4wW_gMPS_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA1NSBTYWx0ZWRfX9NDRj9+ETXkN
 GgzoWS/lHjb/+/JhwvU9MVWUMXUNf39eIA7ZIgvtMMJIZnrd6wDrqEMVMdOVacZ6n/yGENzWSu1
 jXuj9NPxthAZLLBBK6+xVgNXihssU54e92vBAO+zbc9neyLkBRuCrEQRGQRBOHnyHf5aTLB/8ea
 PYmjyDaLmRJAlIQYiDkgwvmM4MKZNwfqT0XCrvmYdpE0l8b2IAifAbJy/6ZiLWqsYj0xKhIZA8y
 Ix+mjdV0JIdo2ynKZfyPFO0wiOFoIfZbnvDgcE7G1rEpyi0GyrCBWfLq3l86YOE7FmMqnWo/JrY
 hfqWGId7TRR6zYkz7fUaEqXN+rwwIfvoU1SKnVkZFPmsvHHmCcjDjA2G55CprGYjEovgE6WLHQ6
 qiGVGYCW5PSihtwvhADfiFnVe0WnaxHwkaEjGQREOFuG4GRVH0R2wylWk4PfPmHfVvP3SU2py/V
 PcrCnG8BDHM2B9Mudyw==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af717d5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=hBt2bvH4Q003rsbsdR0A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA1NSBTYWx0ZWRfX5g69E3Y3qGMk
 5D+kT0PSTE/UObPJk2e7ZXPlSeZXz9M3f8BQPRNJWxFWevsNJFVvRa1wMeoRCOrpVI475UEa3Y0
 umOdwRraj6IIG+Cq8NCvWsjGEmd3XQU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130055

On 9/11/26 3:18 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Many RMI4 implementations are present on in-cell panels with very
> tight power sequencing requirements, normally handled by the DRM panel
> driver in Linux.
> 
> If that doesn't take place first, the integrated touchscreen IC refuses
> to work properly.
> 
> Add support for drm_panel_follower to take care of that dependency.
> 
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---

It's been a while, since there has been no objections, can we go
forward with this patch? It would help us remove a DT bindings
violation in the qcom tree.

Konrad
