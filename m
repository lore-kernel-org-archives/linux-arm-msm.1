Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603832;
	b=SyDuyn/+MSFeBoMIhz/Q2HKrl8dkprw9t0nrC3TGmfmwB3UVeKBkkI02XM82H2xgDDCW
	 JFmZrBSANdtRiccx05uecSWfYH9bG4GPeGmOQpNzhR4dfaLRcgfEPLipc+RbWyCZfdR9I
	 GNK6cRFaAlSdcWJMY/RTgcwfLnlIXTTwEjhE4Glyfcw+/Uiz2d2jnMngZCshXXgkO8x4d
	 ypLtiqrlVhNdQmz5jno1djavv1trHFkYc1BJDlHhCqgOcKaXPtVo93bx6prfsAkmIY8Uy
	 gKkYw+3gpr/h+I+2HGiyrtBOroisiAz+sGLS+K1aIvx3PdGWYObsjZ5rKl+9sf2Wl3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603832;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=49CboyRwJrQkruFwwfQsUjwEUvNx0vlLN8nCmWqmhX8=;
	b=eYMVTQ8zU50Q4F8ELMbTkfaGgFdMd97MUSZf+8IADVKTh16wmNlQ1wnx7PtJWocGPQ/b
	 W4Bi3/2doPwVUWt3MmUPPvqLX8uijzYLF+7XQgZBhy0OkPiTEN/xtRwtiCj8BusTmRQ9e
	 Q1GUwhhA3wLxQ67TSbtss5fHl0lslTjFrFkhI/NSDdK8GHBmuIzHNVIBMj+sl/ali/Blx
	 V0ocX9PeD72zDaNFsoiDZq0mha3XJbWK4a4YmtNWp1jao4rGq2d396CU+h6Ln1/yi/FYA
	 I4E1BfI9Mvo9Aq14aI1/f1i4maS+kGiXUakK/lvtSxCb0BHKdY2o0smVpQrNIovAspg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hB61JRxs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AGH2n7Nd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD71606A323
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:50:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AD71606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hB61JRxs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AGH2n7Nd
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mQVZ3764050
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:50:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	49CboyRwJrQkruFwwfQsUjwEUvNx0vlLN8nCmWqmhX8=; b=hB61JRxsX8FfHAST
	nuSPnLvl/Et3RzhY+S4vtXxPMVhGcfRM9gxNBzVh8Dfzlr8h0SRTSidsxj1waO8F
	C1kSl/KaEAkH8b647LMM19KRWKt6HevMM4krRmiTi8/9OBaqt7utSEoOWwGR55DB
	+cjFuwYw8MdfLTc2zWSnQ4NBpT6DMfYWMkd7fqYTnG0DiFNCFJrsb51+fVzB81Tx
	LvPLx6yZbUWAROHQY7VVdx0sHBEO0duTTP/xHqHURPR0PGyNnK03rU33xBS9DG9H
	q+D3lnCeQTn6wIC+tj2MRcvKCva8ETJNDIhSsdTwdoEBzCMiEpe7vqJaTcHkgfuw
	SerH9w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vv2rdpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:50:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-55d2d54356fso16936481cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 02:50:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795603831; x=1796208631; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=49CboyRwJrQkruFwwfQsUjwEUvNx0vlLN8nCmWqmhX8=;
        b=AGH2n7NdMuiGVTSYiR4Jhxlk59jv+RnDvlqYX+oMK2Ck8/DP9+TxulgLgzlMgPzSu/
         3mOdUqNca/XWR/+byDAYi1Ku6LmbiZV/HKxoPYvGDGubzCzBZq4DMbv0QP9DHm0ebHgC
         JJM3ryS/1qwdw+UkGKzo4qxe7jk1vk1mc8f0o/5u+dP1NMIuY9FvcbVOHKK7F3YbVxu4
         VbJPuJzr+bLCZ4bi/tHcSGvnkBmzbSNp8mkd7dviMXD7oPSWbMALdjva304WfVoBgjNe
         ovv0T6kAmhelOb92YXItPuy/9Jl7Ge/N8trDwC0I4cFPDi2mbtM9h68vlcRidgzfZQM7
         35sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603831; x=1796208631;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=49CboyRwJrQkruFwwfQsUjwEUvNx0vlLN8nCmWqmhX8=;
        b=WmDDhZ/CnrROqRNhCQx9w5EO7rGCUzqugK9DmR5CLUc8TsVU9z9EHcvPeY1hNeixu/
         /NqSMY7eCEN04XV77sAQFhled2inRWzMUcAsvht4EB/4z+TOhd4QuvhXjNSNLJlnaxcY
         7hGngOd4pU7LwnBfn/unS1fBlDC/jA7OAkPezakI8EEkXsMfo3h+HPCfFAmQab+/a1LY
         EAyi93xvKgKWaJpPdTjIYe7AJHOHlKg39dWf+O7xpHQ7Nq5/Vq46tLCHr3WbFrPUhxtm
         /70V+PQTGBNEx4yhjA8N4G9qhyQH5x7YW9jdU44mUL9SKC8D8qCJCH/ayHcqPNf6Ixyj
         BOCA==
X-Gm-Message-State: APuU4Z8vSDCi/AvivUvmCDjxeEGAidehlPBh1SgGWUu5LpCm45GHr+f2
	9L68Pi3XpJYxqjJjWkvs9HqR3x1EhAHYnDRzjxsVAZADV9LBU6rD2wSswCzpJOBcPda+BTgr9Us
	ag+A+YClF17HjcZCGNoCCCYAL8lz9xjjBGOyLmXhy5sgoxGNuaqPPMrqARxbUFaD//GyK
X-Gm-Gg: AZFdTZeKL6Db9HY1Ih+5qLaDDX0G4y2VHdoObdA1WqAmDbsg/wIYojliq8tI+Sl9eUL
	p7FRtHjrr/up4XV1643Htqn0hCUwzp/5+ZprU3x0nJwtbJ/W6ncrIEv3E/kCuQeBG8ur0lKz0+f
	845M8QYBgd6hLdGWREzo7ICzn6ZqAkusinwT8tZ43b30+mtCtS3/woAgDLF4ghF/YCX/bESLQY2
	rLCSd7RjSCGkwPguRq6L/AX1VTbFBzJr68ZUa9zlFkdicf2ox8WnISbvjcmGV9vOWSLRQZc+OK1
	qxoLXp9WQeTWsFQEQwN9khGfXc6REU7q8yZO2hQFTSiPmLdSqOC1H23EvzjJZ/lJUCBGxjk3RhH
	0e7OsfxQ/MuRHYAUtBAuxSzaFlyGAtHqFYk4EwfDHcGq7c0wP+jO86+NrhjoxLDgLboRq5T0=
X-Received: by 2002:a05:622a:e447:20b0:55c:c4:1f20 with SMTP id d75a77b69052e-55d76a64e72mr312121281cf.4.1795603830732;
        Wed, 25 Nov 2026 02:50:30 -0800 (PST)
X-Received: by 2002:a05:622a:e447:20b0:55c:c4:1f20 with SMTP id d75a77b69052e-55d76a64e72mr312120901cf.4.1795603830306;
        Wed, 25 Nov 2026 02:50:30 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea31e4sm624414666b.39.2026.11.25.02.50.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:50:29 -0800 (PST)
Message-ID: <25cb1a07-b334-49ea-9259-04c25459e8c8@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:50:27 +0100
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
Subject: Re: [PATCH 04/11] pinctrl: qcom: eliza: mark egpio as a GPIO pin
 function
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Sean Parker <sean.parker@viasat.com>,
        Stanislav Zaikin <zstaseg@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Iskren Chernev <me@iskren.info>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261124-qcom-pinctrl-egpio-v1-0-34f2c06b2658@oss.qualcomm.com>
 <20261124-qcom-pinctrl-egpio-v1-4-34f2c06b2658@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-pinctrl-egpio-v1-4-34f2c06b2658@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX+8ugcZ3Mb9Ka
 TMvlgi8si4RzjKvy5TVmyPXFaJ8BsgP5MX/W4IIFjLIRG+0TjIII/lvNeRdihExmm6wGg/zkM6V
 HhahbmCbj5yWVmap5m6EVq+Gk1uIwlM=
X-Proofpoint-GUID: 7G3Gox0NRG_iEYdICUIA0AlnZjbrnTuh
X-Proofpoint-ORIG-GUID: 7G3Gox0NRG_iEYdICUIA0AlnZjbrnTuh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX0IB6VowgI08D
 h42X/VDp1VvCY8OL9Rd/J49SAUisIbpguiTq+UruT9JGO6gFGWWsR6f8Y1N6m9LItEoxTIayvLt
 Rwe5NdnYhti3gzP8/GBr5vWkAm5Wf3Ir+/d5XkqJXiqDrqpiA24LMjcRl3l7AvBALW4gwHb+dWz
 qYm6HgHPnRBtA/aOaMedZZPD8X5Qwwcxrypo9UraADNRIdNtglMy8sgzLwzgls5vUZctPccOAAB
 dPd9tZWCMmTamuOjMoI9YU7ENBLSAbqAFuC6Nj/H4vCK/n/pMQBRfzoH0h+RXpfOPdxTi42RVcc
 VqVuloctg0DqzxP5hzEEvgJGWBkM+yW5H0OxK09WjJFNiR6NPztebikQVA+mI21IOBWkJ9Cygyr
 XyHnvRFFOqQ9ZUpvmGKb2yZDPZ50zont0pNbAiYDxQRONyz8lKjPjzYsjeP4sJvPA6eb+5WAOUJ
 asB0RoEUclyfgxz3HOA==
X-Authority-Analysis: v=2.4 cv=A/z5rKWG c=1 sm=1 tr=0 ts=6b06bd77 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=sghjjhV7bxI5PrJzascA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250042

On 11/24/26 3:29 PM, Bartosz Golaszewski wrote:
> The egpio function in the eliza driver is registered as a strict pin
> function. With strict pinmux, a pin muxed to egpio cannot then be
> requested as a GPIO.
> 
> Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
> be used as a GPIO.
> 
> Fixes: 6f26989e15fb ("pinctrl: qcom: Add Eliza pinctrl driver")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

