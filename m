Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795789651;
	b=yyzrvX/FQfEYIi1FrSButOsGYXTxjecSdpBnjFNP/QPs5w63+HxIWKzietrRPgKKTUCJ
	 gOgSTQB+Vq7tWwwf6Y9giP2o+MRD7BZQMqehFt8JRYp8oNhfrJEyfHqhLNk2P8PNSby0Y
	 yAz1X+eZd/OLsKVc2n1rilOZMQwn3kxUYzBsZtbvjsISqR0UIxQicj+hFw6oYytSSKqVN
	 cwS2aC9T4yQtZs4zVyZ0xa2mawIj+I5YPOOZ/HFOSD6qU0JODuttLI/eKdYW7s2T27Ydr
	 kQtslCySxmA2lId5WoLvI2UYQVazDXeBp0HxrjwA+lLmNRf+wmhh1pu4OxhJF9D7INw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795789651;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7a5Q8MPtSCCW+xwsPzibCdKb+02lsoWhVNp9a3EuJKg=;
	b=fpvMIgd+YfCwI1S7EzQk/KHDuzgHtaSPOVdGge+r3/Xz88KIc1iQc8lFQk1aUD4P5tS/
	 TbW204fSxuwhttMM1YdFBuZjJv8gag+jb448/qULLjspypYPYfJiW/Xzxy+KKX+gbEzwZ
	 yH6ChKcPBviV0jcmpMnP3mTaFz5K0S652gvXU2nn45xlxMnTjrN0I7vpXDDogEPCRlVwq
	 r1O6aRtNJkqbAsorLZcfUw9RTrYF3suLUB97ErGZq6ELbfk2XoROUBFOu3dAhMSuD8Rzt
	 pDC/zLEawAK/tb6RtmqqjNmZvE4KZZK7UqGJZ2K93GuKCpBkqhxe+OHITNmO8W8BUkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cIi3g66+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="b9/KAsjr";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2792D606C73B
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 14:27:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2792D606C73B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cIi3g66+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=b9/KAsjr
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1ZMf1971375
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 14:27:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7a5Q8MPtSCCW+xwsPzibCdKb+02lsoWhVNp9a3EuJKg=; b=cIi3g66+bwoqhM3F
	3d2o0zwCGyXUmNTuYG44OuMAi4OppCOxYlvs7WgYEJ6xLR0NzuKf3xnL7sbjUUbi
	GXDcIiP+oarqZwB3pZuohtrlPrCuU8EyckNJqhfxMC9rbuipKjSBupceyb7Achdz
	7kkvpn7uirLfIksWSR7kizv6Meh2jNt99OdkYn/IJpDYwwA4pFiIuE23KGB/VqQr
	VF+bX6l4Mglp3nDwwp5ieFFBXDBJpoaG39hvbY4N6Rqp5lkSEZ8r2OjkPLRFzepA
	GGmqMi9ZJw1bYOnC+pAQkcyEnlfn4MJOl0j2BpWQUSMfWQZ+BtZW64kTjVHThVzW
	dS3+Lw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55ubx8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 14:27:30 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495f7e03b9so79259185a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 06:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795789649; x=1796394449; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7a5Q8MPtSCCW+xwsPzibCdKb+02lsoWhVNp9a3EuJKg=;
        b=b9/KAsjrYvPmTdtvC63MgRwhntd0u4hLKU3HEjV6iWtVWrnVMtpm/u4Asu5o3dU0Ud
         gzJQli2quABTI0I+kFogCu6Rt8MagAtuiNd3AD41swXthjAurIVOBB8PK/Hxd/LDNsdr
         l6GKrgiHq0TC0xsSbx0PFYjnlnFt+9n5lFZHT6OdkTDrPfta5hJK2pR9T1B96N5dBoyY
         DRPBjMcUwGRNT1d3wKcYJLZJqetdR/MHfjmjpbitvkCgze1MeA4Hll8sAh3I0u4EzJkJ
         FFydfY87DjfRnyt9xywQKM5VyovQORme/JzwvdGSVh5FEGFz9J+jD4mnRwMLmb0PtAlH
         UWLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795789649; x=1796394449;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7a5Q8MPtSCCW+xwsPzibCdKb+02lsoWhVNp9a3EuJKg=;
        b=hg6eRmr466RpMZV55OVPHKTQfCq209BsJGx0b1MUzFWaA8YyeMhAIuiKiP7nmpgJKH
         RQhjQAz/GM9zSJ5Fzf9xnDqFSedZUVsKmQ8xa1llzZoTdZ7WJjbAs4fvKAKGnLRcB33u
         anune0OUxSJRpXPso4oyO8hE7Q9r2f2FSvGj+OZ7WT0yRvbzFpKKHgA5xqFAPBUBRlTu
         eikLN/5du0IgrkHbcO1qbGh19PTU7MO+YSMNuDa/vc3FEIR2/WIl0f2UxEwsvunh0K0w
         trveUhrVQWoeDXlZPN3CiFfWxejAPDheMo273K2HQrbFWdl9owvI53sOVcOdnXSOc8mm
         fK6g==
X-Gm-Message-State: APuU4Z+bVWS5PnUhs+ak7eT87fjQdUiud7QZHVM3IRo9/V3bszBlOBsP
	wYbL7vxBJQ8y64H8kAeQktNwNNBdmSpth8l5RFTkb2FPyFh0AMTbNqCyR/6VEoCU6e19D2vdB/v
	Uaz7tD4UDUN8S34rSakCA10ZLWI1VsxLj7/MCOnSZ0B6JViPdBpzawnIbknh85w51d79u
X-Gm-Gg: AZFdTZcWALVTSu3eRTnr/e8ojFSvk/Q43MneuEX5p4unGBtNBNvQ9bGHU+v9yCSlNYx
	ehhjIZII6TVnWH2IcwDp+tmTLQqF0KHc+UEBAwz0njYC5chRLGbjC75FB3lIL5/pQq8WC9ej92j
	JpKf+j3D2XNBvIpSnqP45xlfcSU+d/LKZIIhUQGwldYNPIbyGk/1vUnPHHB8g+WDT9cO5kkdUfm
	HKpalyY/I4RbcpoDUhgBLwFKhdHtDTo/GPwfAR0VZTLjzvkX4PqgFlLvh4R3uL1eXJzR8S+IaY0
	7+t5rQEcuSkHByFmv1db7b9hacZaMDW3gbDmlGoz2jvC/T+ERh4qLZ/4rmNQCnRsJhG419f9eXY
	sW3Ssb/7dNmKsZekX0q82tOOBunq91/3AtumN9fTbDKjtBsbNA7Bw49HExFsKBXLB10d4ivQ=
X-Received: by 2002:a05:620a:219b:b0:949:aa1b:1243 with SMTP id af79cd13be357-949bab2c992mr4628946385a.5.1795789649437;
        Fri, 27 Nov 2026 06:27:29 -0800 (PST)
X-Received: by 2002:a05:620a:219b:b0:949:aa1b:1243 with SMTP id af79cd13be357-949bab2c992mr4628942185a.5.1795789648977;
        Fri, 27 Nov 2026 06:27:28 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba7b9570e9sm9285824a12.36.2026.11.27.06.27.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 06:27:28 -0800 (PST)
Message-ID: <0a37b7e2-2489-4d9e-9ba0-f5545f962ab1@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:27:24 +0100
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
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: msm8916: Disable disconnected
 DSI
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rob Clark
 <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Mahadevan <quic_mahap@quicinc.com>,
        Richard Acayan
 <mailingradian@gmail.com>,
        Danila Tikhonov <danila@mainlining.org>,
        Robert Foss <rfoss@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20261111-display-msm-of-graph-v2-0-fdf8fd97f49d@oss.qualcomm.com>
 <20261111-display-msm-of-graph-v2-1-fdf8fd97f49d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261111-display-msm-of-graph-v2-1-fdf8fd97f49d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfXzDVj2hvZCsw2
 U8f6yqFWNOPbAOgfIFJn87PewMFBAEgvA+/bI/CNQHvpP567G+/aiSvzAw6CIHL2BFyevIqX21y
 PEjKleFbShR2p4wNEDErQ6r8mZdiEz0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NyBTYWx0ZWRfXwqyR26g5ZC4b
 mxREbjyepcgYrwOfGthZctibRGWoWlPt4t/Cj6iI1g5QR/CF4O8P+RF4gPzJ5NdbdzId9ZvbF7v
 sH+6CJsGuLfa3g/l0dTDNgY9C9aMmWU80o41V/W0gricpk89jtXWZr8BbPDs41mIIh301AkIaTU
 nhq59wTpyAsqXZYJM95JuQ6hI++r2rdTN/GtefaXvpsilKcfq6dU2ABMQNTgtwcJMDHbA8MmIeJ
 Ij0gI8D/RBk0Fpmm041yUjf7NF2FnM1gsC6PRE7zGStgQXoHCUmNsZrCVw93qxnSdTAn8K1xm2k
 D8lbsDo6dcuO3T3DUN33vB4jCcbBHb62EJuq3tD9gMVDGkL/GRIziKLtMm4YihFj3BkKaI1aUYq
 gNUjc5uMVabOk6GsbaTOFhnCjHscL0tfFnQI/oXdjaaJM4BHnWAdTAXWDde3Sj6nm3+0wcnIdN/
 /P7kKnugWb/2+DSLVfA==
X-Proofpoint-ORIG-GUID: C_KKgC0dPXJU4LlAIYvkyFRYT83NGSuo
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b099352 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=BO6MpYfuLILTTXtsdh8A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: C_KKgC0dPXJU4LlAIYvkyFRYT83NGSuo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270057

On 11/11/26 6:45 PM, Krzysztof Kozlowski wrote:
> MDSS DSI and DSI PHY is useless, when nothing is attached (no panel
> description in DTS), thus should be disabled in DTS.  Linux MSM DRM
> drivers will also fail the probe.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

It's not useless in the way that the hardware could still be cleanly
shut down (which the driver could be made to do), since even a device
without a display may have the bootloader initializing parts of mdss

Konrad
