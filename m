Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446961;
	b=d1rGuOQh7JHAZVJj4m35G2dhy+Uf1FrCVRLynxlNQYeOZGmtoXR/V3yf9RLTokAg3/Ua
	 NNBQ9Fg0qVKTzIqO9sKPKTwg3jKahb8JVjitfzvwvd82RDVduhKxgb0jn5t60iE2aom7u
	 CruVu7OzErDdv1+heBHFiRRcLeV7qnnIj2e6KeS06APR+0TT2vFI6gB69L9DXKwLdckDa
	 Fgj96EaMkmgncyph3L4PtnCmBwYJekzIsUzKqI58SohdPUe1n8V2vAAuojd5usWCRYX8h
	 aeLBj7sOkKhG4cbAIE3XkyxNECX8p4JrAlEelwr/63HM3O3Z2SV0S4Se89WkGjy4yiw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446961;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=aH5skaSph01CHMF172DkDm1ty6zFx0XB3p8KLyJRcPQ=;
	b=uQPJqT2KQqgSxZH7qhBu4jzMph8euQF2ZDLacGCu5F1y0eQeubFGoS2JJaENLTau+eav
	 DkNAb0icM+HHj8BcmhKwQ2OU+ISeFFdQ+pDwUgk2yRB/bD4EB76mjn0XiT85fHY2fTASj
	 MLc2QHxnyBb4IbBzhfWhtf0yOcGyYcXo0BwtvmW+vo+PZRuA9IN+FvgXK9v/X/0ILOyxG
	 7EA5aRv/9DxWuLWIao1gHLK10QMyz+dbdoq8bK8Nralf6i0q9bbJ6fFA7V7T61l6Zgk9F
	 OEwvAbtzMudhNGwCO+wnQ1CLI19AYibjxjff5UMif47YnbyTvYX5K/q42SdTfCL6+yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Zn//tdSi";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JCsMCOlg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9272E606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:16:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9272E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zn//tdSi;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JCsMCOlg
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKqEU2369022
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:16:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aH5skaSph01CHMF172DkDm1ty6zFx0XB3p8KLyJRcPQ=; b=Zn//tdSib6wwKJZO
	PcGbi567sXU8PqUTuXI05h8BhjcFldG1sAH98T+5PnDVfOCU6IquHB61JLm7MxiD
	abYTfWomy+Zzmxu4yqK8zBrOsKOBZk7a9DK8AkkTc6PyL1tJSsx6Mf9DeifC9cVY
	YUyhgaU9VKqlYVGds+PRbop9RS3KLjFhbGF/Q04kJXqeD854tI2+dGYLE/aBhwXH
	QFgKC9dmaDJfDFEOrYmGt9EOj84Su8bCUH16K9vHAOpR+4a4+abEzhT7fiaqdPER
	f+31Jmw7b40Nxanm7ho6KVbmfXUEtIy+k9HbggPKbfAnORA0wso8HIPrp6RL3zsz
	/RlCwQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1p9yu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:15:59 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b436d37123so499851a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 07:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795446959; x=1796051759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aH5skaSph01CHMF172DkDm1ty6zFx0XB3p8KLyJRcPQ=;
        b=JCsMCOlgur8rZV/YmfhIhODnj6iIoClFNylVOI52cVK417p7uXIE2uUCp1RxDvZSeO
         rowX4fnYBFQQhL5vv4lNMyE5HiA0oj+Robtn6wDUIbfBtMmC4fzTHdhdSCMNTTxTsGbZ
         dClxD8HxPXkxrNo5tBs5FUzpqzbNJMyLsg3AD31QIBuLMhL67tYYjVWOSgEe2/kv9CPP
         oUUYwETQ93HDMugbcm6weBtKkORKkTa3YsK9N9BcfTDbGoqDzF8cmCLiqRgMZGbtER2F
         OwvB4ueT4DOFe+CgtiNACMHNAtJnLmENnjoDYVXzNHlAAfS3VobFrWMsQIPBBD2upUi0
         A5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446959; x=1796051759;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aH5skaSph01CHMF172DkDm1ty6zFx0XB3p8KLyJRcPQ=;
        b=rK3QPG4D729YyG6O6lE+ulgylCtvRWOc+oOA8LXcnobh6rP3kr5C20sr7GjEHwI9BG
         7JzypVKT5CITSfyLlKWaBUsMI48RM5JUu8yJtK9CkyWZUVPj0RAgrqgFqbVJJRNLxF/C
         eqiPKWDWqxNUZ0I/WR8gNSszsp/ztfmr1i1LJrrPk6vIRw4tW+kXtkIuSEoCVdh4Gh5H
         GcNxXmss2bhtuj3NerXAg25hngUyYVM4LOE9BzUwrBFRvQBhM+k1n8JsCRIcAXwCweuW
         fjjuntjqrSsKF5M/8AFCFVfpFenh2m9SEjxD/HgD/n83rpD5Wp26d5Meb8pIhBMlyAe/
         1SBQ==
X-Gm-Message-State: APuU4Z+RX71kUALuZMc5GNgwcDsE/JXDg6tOIjnjAAnK1aQc5h8gz9dV
	O+XHWy1ZRDyeSgiCQr0v/2v8eWW2PrPbW11aIGZs5JQI8SHQaN6KYLvxjXJ1ZwYq18mC0rOHAS7
	SFx31Mpf9+NOKhue7SP4jEJQmuSH2NoNwlK0VIvUcDmM8GKJLZ3yLs18qYTg7UYIh4D6q
X-Gm-Gg: AZFdTZcLCs7MleK+dj4aiWtfuOMAcTC/eJHXyGw4x3v8+QkLpGUhGwrAjo1SAuWKASN
	Bq4orPu5bNfpT6kfRm1V4tc6FoS6imYGrWy95zX/4dHlmg1WyL4AYvd7wBPK0NhWw3ijW1FvXQL
	bvgnl9HjnKJjRmgS+UbbHlrZdDAN4UYYmyGqvgRTE31F85oYsC21A+65P9dqTyT3933CgQ6uD1O
	Wb0kc10S83TZHAnNDkg/GDl9Zmsy4G/wI+y3k0+KE78Nrmmd4vlJMPWIHxG0QDf3yyUkJFyZyV0
	JQYM3nOzSe8Ks1fNfc3rJ4wSUcHP2qbpVbEU+8tlKtMgkAIxwCVaDuzBQnRTh107s/ahDgb+shV
	59LK4dgZiyrT1DmShBp8bjHWhF8Oxc15AodZrmRhy/89OW1JmIT/GsHSqPeigZTX1NzMMDXA=
X-Received: by 2002:a17:90b:1dcd:b0:3b3:bcc2:490 with SMTP id 98e67ed59e1d1-3b41c7c77f8mr17890626a91.1.1795446959122;
        Mon, 23 Nov 2026 07:15:59 -0800 (PST)
X-Received: by 2002:a17:90b:1dcd:b0:3b3:bcc2:490 with SMTP id 98e67ed59e1d1-3b41c7c77f8mr17890551a91.1.1795446958492;
        Mon, 23 Nov 2026 07:15:58 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370cd368sm5502638a12.8.2026.11.23.07.15.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:15:57 -0800 (PST)
Message-ID: <5b7fa9d6-f813-4de7-9170-a4c21fd845e8@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:15:55 +0100
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
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm6350-lena: Use QCOM_ID_SM6350
 from qcom,ids,h
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261123-sm6350-msm-id-v1-0-99482c9ecc48@fairphone.com>
 <20261123-sm6350-msm-id-v1-1-99482c9ecc48@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261123-sm6350-msm-id-v1-1-99482c9ecc48@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MCBTYWx0ZWRfX+ipD+/KXDwiQ
 CQA69qbVqRktyz7VJq2Dfl+0+VLkB9YEQShIm5ZFpMlfGM0ysLcjVARZ+IAPfc0vPyOJg87TLuP
 ZVU5oFM7M11nL2vUhGpvxQggNGnbv3dxeERrIng2bxS0D4Ic9hsJTxvDpdhuIXgdu9XB3bAADHm
 2wPUkLt/biUoBsDHHd1DKkrfBhODQPFoyLFVu55ohRJSsboctlP69S9RPJYQ3QPZ3LdtHTZoIN6
 CihGS+5Nef/sqO//RMp6iYLBvxLTjE1xKDRR/U/SsUxX8tNJ5h5mX+qwX4JjSLGAEwrJOBGACw4
 TTg3D7xUqFVBQAM3+1W3vfR7Dr+GWCHWlzcf473Szk6Mip4FuN0RvhfbHcNEuOMJizSnlM3EplV
 jAmafznkrGkshPbHqvaN+kMoRlRgZbhRVGJCne8rXX0eBha0JJIx7gh0tEOZQnHm990l2V6QzsV
 v5CGaTWg2RUEuTBu6Mw==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b0458af cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=ecAgE6h4Pg4Z-y-LirQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: XDgry8HqY6IGGtrzrGGCiuy494xWTJAP
X-Proofpoint-ORIG-GUID: XDgry8HqY6IGGtrzrGGCiuy494xWTJAP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MCBTYWx0ZWRfX/Y/2vcKLZv18
 KLRSdxGuxi6mYgJZJOy+SMQ9OAu0bnSYvnVch4ziYXQsCUQy/7TGYf0bh20wNRGDRDXn95/jJVw
 beHRf2JoP7hetZLNnQgi8wvEr6U5SLQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230060

On 11/23/26 3:46 PM, Luca Weiss wrote:
> 434 is just the value behind QCOM_ID_SM6350, so use the define to make
> the meaning of the qcom,msm-id property clearer.
> 
> Also while we're at it, drop 459 (QCOM_ID_SM7225) since the Sony Xperia
> 10 III only shipped with a Snapdragon 690 5G, not a Snapdragon 750G 5G,
> therefore the second value of qcom,msm-id is not needed.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
