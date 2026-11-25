Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603817;
	b=ZNTXAtqXDRlSRjlyueZCRCHjVNmpME1HM7sIY9n51idHLh/atMTAnKrWCg157sz+jg2s
	 7ur+SlWtAzL/Xk5nbuBOr3WqCyijaPRgehokFPVSYwIF7h/LOsHcwVKWWBn8ugrxE4jLT
	 oOO7hmjAAL13BzGb+IoQcaLv/4Z9Dkg+epKExopg8r0MACDhwLCJWuRQfFoTG2dTFf0hp
	 JNcZd3l5HiGyWEIBZTbPUPrhSZbCDBPw6U2cZibc+Z7gh8ARAyQ/i9tunE9Lw3btxSQib
	 pFbWA0byjkNWdsauHdvSoHLKUvsGe4Xk+kevlq9Mk1Z8/eWr4ELZx+R8BRDIeemg/Nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603817;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xpTTvHWTMC+bszUG9v9rCk1gnYFkDPtYUSwzsM4Filk=;
	b=eTyP8ltDn/80v3NXlaJHf+zFZWbU6IB0fQCPykTQiKi/xYI9pdRbvQuxzaYBXOxv7SAz
	 duL4FmOqmf0n5qz/KHgp8sZCkPGSmfvjePMtpX4KTl1RtHVAcLFw20jOFD+BOV4ZdnELe
	 kzlcv6jc0utQKLecTIArjFiZBXRkSBbO686QF/DASL8aa0zd3jVSswbV5PUf6dOI0lGsa
	 0avWeo7Q0iuNPfhmleBqtUxEVl6UBtG89zC+IghrxmSiUJjvWO2ZD4sKfK7S0up+xG27Q
	 TaBlnenzLdNvUIkCQA9gXhMnfnvm+pJz8a/I28k9s2Zh/TCXWCmA94JNlIZ8trfRsIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n5GGHLPR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ht60KZMA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8115606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8115606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n5GGHLPR;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ht60KZMA
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mOS9555534
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:50:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xpTTvHWTMC+bszUG9v9rCk1gnYFkDPtYUSwzsM4Filk=; b=n5GGHLPRCDbvmpY5
	oQ1FCw3JrlHss9ehReHHP13EWWaOr7vdEMvf5N5yNJ+A6xU+lBOjts0zbtcqclRC
	ZrbMjX5IapYo8/NGhXiNf7LhzuqznK6thBXszY5ekbFGkSSimzZJhO1DtlggkdTv
	5W8sfKCr4ot3jn5CL2xP48Mssf5NGeLdr3jlSTk7jzkChGwyFvLHdQYTP0d7bk1Q
	YH18NB35s0qyWSvxBY+ugXp2LSE/xDpIk0BcZPwEw9EtIqVlkfnxNQUUCKaMeMzc
	qyvePOIoJv4LxXgKqNKF4J+mJYT+tzj/VlNzwS5mlRz15UCwfGzndd+ABdxBFMFS
	EmvGhQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vvnrdqn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:50:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5476f5bd009so19081991cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 02:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795603815; x=1796208615; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xpTTvHWTMC+bszUG9v9rCk1gnYFkDPtYUSwzsM4Filk=;
        b=ht60KZMADnBHxNJd6igVGoRVsL5YJe+sDS/W0ld0IUhpDj7JviczUCVIT5Y+7/thQ9
         xVw/1SmoigmKvILhdiMNQx54kVrbO51Z/4iYK8ppeOPT7Av+S3W0sUd+btQoep9czHmM
         +tjRMjQIeIPXxcvHwkuPEL2sl9K2pSAgKJ79VAgVflhi4+wAVWz5iJZEwIum3sLaCJuC
         6VtsvFE/RSotIeB5108+kE76JZW0qyyIewAdjPm9LkwIhTpnSOXfz8AKmioJMyiL1DZp
         RTfntkmODyV7dHh32x4SW0SWDIqImEwEQqFvq9CeeJJLmZue5cBJMqiOm20B2wPLvgAx
         nt2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603815; x=1796208615;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xpTTvHWTMC+bszUG9v9rCk1gnYFkDPtYUSwzsM4Filk=;
        b=kruP6imhddyfPsiTRfNxdl9c4+rnYRe2zM3I72T2k7rU6F+rCuPZP1mponDd/Yby9m
         K2PYIb+eON3jFv/NNqAwmwpZRIarekm1kEbDbgtIvPLPMyuBl91tvqoJ3ebitk81+jxB
         cuSP4hBg3CSuKEQhp6e1/JShLXY/tbTypdnMNXjfHSa28tPUjvcVd0XBy0w0TgnKinN+
         vpmCheT9GZy4N2bGs2TGCGsag3Mf7sWYZUv2MzzjfDF7OFLDkE5KzL1ROrowAaAKfosG
         zCiL8RzVyc0l4rQrr7KVS7tU5XftwXRextoMQT1/5KjzsLaB+xnghor+c7GeyhHA4LJJ
         rnOQ==
X-Gm-Message-State: APuU4Z+nqIOilzFT9IK3pJH9NdCjlf/oWWDPf9NtMbDN0MWfG5vGVtLz
	Rt+OUEQUOoXNNjgt2YCl1T9CTgk99+YE4rO+HejsAu+MEXWcXtQRrKyYLaRswUFdp4HvBkrqU/E
	eFUyrW1vBAHeGaGf/8M0OuOVc5fm/L/LtG1wO1wObECNISL5UiA/je+jN0LZqoD3ExHly
X-Gm-Gg: AZFdTZdbVQXw/nIbFNf7QxLTnIREllZBvieRCzdiYh8MaUlwcIVrOT81jRPn9c3neBL
	DvHMjZkeLzYMJeck1wI5OAyrimB2mBbwo8y6QamA1PwIPsJPxt3B4shRTRP5LjL9Xc0AGqonIaG
	Xgf9wYWg9grrF1wIXbW9UZ4tp2/sRWzOLuCSMTDEms5BvyTtCKaP13fFOE/kWB5gcM6PttjtMnC
	UxFgw7rYwz0x+JJ2LTek214XEsN1ov7ha9YahETeMNaz0vs/ge7I7bK0WZQmyTs09Jsr+A1VzMh
	+N7abA/zsV0B3Dc0qBH3tLXVKXYS8OXAqJb+5FtxVpL5vteKShisw1nx4pxI6ynfYb5rKqjnSO6
	eMdHT2wW4b/qmVjgJCwbLFPMRN6eMP4jpAKYnfmnw+BCD1O63a7giq7CCxsJYtxea03KiEqM=
X-Received: by 2002:ac8:409a:0:b0:55d:bbaa:fd0b with SMTP id d75a77b69052e-55dbbaaff03mr17324781cf.1.1795603815294;
        Wed, 25 Nov 2026 02:50:15 -0800 (PST)
X-Received: by 2002:ac8:409a:0:b0:55d:bbaa:fd0b with SMTP id d75a77b69052e-55dbbaaff03mr17324401cf.1.1795603814869;
        Wed, 25 Nov 2026 02:50:14 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513aea31e4sm624414666b.39.2026.11.25.02.50.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 02:50:14 -0800 (PST)
Message-ID: <57fb06f9-8e64-4f52-b32b-7987eb322cc2@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 11:50:11 +0100
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
Subject: Re: [PATCH 01/11] pinctrl: qcom: sm8250: mark egpio as a GPIO pin
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
 <20261124-qcom-pinctrl-egpio-v1-1-34f2c06b2658@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-pinctrl-egpio-v1-1-34f2c06b2658@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX/+qSfmO9y5Yq
 xXdTxzFF1bpjwVN+XbOauZ0tGtBMguPj4zCEypMFUZa+cPT3ebDUmw3tWfg6GwSEqvVGJwtq1D2
 Eo39ZI2ACxRKPPYEOnFTuqefpSEsSeQIXECDir3FH8yPeC0ef03ObI56+L3ZpKqxcZhL/qcSxJ9
 VYMO5BYHQg8XwPaJ2jiHvULtKBhdOaeLNxiBLuWhImDtPKjaZw1Z17ZhMRf6BevX2WQ/jkEE2o0
 tpfxFrmCqbN6gnmz4qQj0AN0u8KwKvItpghwQTFsCzaiWaUzhZrw/xtcwDlgx47+fAl9hU7NV+8
 Wmy8rhhiSOX+MPNRFDSLJOjQSli/Y4Z6q+fIOT9Jr8yr8NbEctgKmVSeEpfcuqsScohxJ0OUD3j
 dF/jdiFyhv3RkO72rZpkJ7HuvdL149hZE9TuSFBjWmPKdteizNUqX9kpHMMn7jd7YDTz2lpxXio
 LlM5E3W54j52tPs4k3A==
X-Proofpoint-ORIG-GUID: HZNb7DMCfyRywxi0TaK9EtMDjGgpqtMi
X-Proofpoint-GUID: HZNb7DMCfyRywxi0TaK9EtMDjGgpqtMi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfX6/6LNx7XhkSk
 Q4cTOs8t1lSyzkYDfswfNaRf7WLqTopTEgmZTPaZt3IBNRy8FKgRZIBIgVlZo6FEhjIx5o8eF+F
 fNIMj4TCn2UvqNeYyBIGPRmqsZZDGnE=
X-Authority-Analysis: v=2.4 cv=R4mWitRX c=1 sm=1 tr=0 ts=6b06bd67 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=y7CeRsGPqHAPMiWuVMUA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250042

On 11/24/26 3:29 PM, Bartosz Golaszewski wrote:
> The egpio function in the sm8250 driver is registered as a strict pin
> function. With strict pinmux, a pin muxed to egpio cannot then be
> requested as a GPIO.
> 
> Use MSM_GPIO_PIN_FUNCTION() to tell the pinctrl core that this pin can
> be used as a GPIO.
> 
> Fixes: b39e9199fbe1 ("pinctrl: qcom: sm8250: Add egpio support")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
