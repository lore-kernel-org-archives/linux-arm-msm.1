Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792656398;
	b=ubR2gorqUJnrgcPdjJJ+ASDMiXSKXw0iWAP0mP29apOvqKlsMxp3hNqx41dkbNc/Kuac
	 269nhYtSrNwHWIxWNhNaRAgnD8XZu0216azX9BDHgSKnk/vQXJLU5p6nPavQCBzxIpP9U
	 RKkinroDI26g43S9WnfgFwuqoolhGuMTrGh/Weg/CJGKokxdS4VmZL6Jz6wTNTm7NqW53
	 CITTHlq929gwegbxd8kLgaI4EbsCoVN4KhSLxnkVfKeVIGjhwV+l3DowV2GC18r4KQ+Bu
	 9qG4dX3qvMD7RESjHQUHrvCwgSOgd36pWJZPbgxhgDlHd3rwwvQANvZCWDthdzlXy4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792656398;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PzWL9wbyB9BKu8/5KZoI0l/gUO+TONtg1mz6cnzHEwA=;
	b=00/3YFYXO9Im0sxXorpZfaWDxxmTKi3a90EV8EoCDBnYAM+xDhOFYaqrdfYfKFmI7scV
	 H9fJJv0hVzdHbLQPBfNQAk9pQOAgkYlmA1NU9aB8kC+6Nd0ozBBA+03thawQkP4JXie7i
	 Xg96sU96kG35qGPk4dnMSQ2lrUWaBNIpwztsSCrCt4a6sR4c+Kl2Q8Ofu35acyA6YBo9w
	 QGOSGO1tR/wHPVa0qqiAxuWMfDqyLobLvT6CDYhb1DN9OIMc8nLbhFF2GtrhXAWH1qDq6
	 64NNj848kiVveiGnrLiDonJkqnX0g5gmOGYBHaIHnO2sbTlP8zGYfpnDfNnpF2FBA7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="gJsLT3/1";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FNtjyoqG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FDF606A321
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19FDF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gJsLT3/1;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FNtjyoqG
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M707oH3591188
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:06:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PzWL9wbyB9BKu8/5KZoI0l/gUO+TONtg1mz6cnzHEwA=; b=gJsLT3/1t+6P8kg8
	WjfolO8NkEf9NuXXYOYi/ibaJQElqu7U7xuhvvhb0WI3Cx/pmRSSv1uR6GPPuHdc
	joWkaieN1xjaB7mX73lFUgFKjFUoDDjLCTsB9bFLFD72UHXJn/HdGw5VYTSi5xB2
	xyFxvyzZY5HpUPPVZJtZ91Xcq08qIayFgb2pGYz2tI+Z9WpEVvenyJ93oxz0X2R5
	XnGOUQlUFwb3rxBpLrEhC6LVdW4N74wTeSGgTbw4Qk7UuQAoOFWfChEjaN7HOn21
	d0ZOm7W53FjEfZFaKs0KI7qLzcI93PYZ2jGJUjOAYoupiwDSOhFmZMi+gkwvgsRR
	Q4kr6w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93c9agr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 08:06:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5362ce9df1eso2427361cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 01:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792656396; x=1793261196; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PzWL9wbyB9BKu8/5KZoI0l/gUO+TONtg1mz6cnzHEwA=;
        b=FNtjyoqGlagUNO72W55xLr0C/c2PTcndQotxRgkLLqVUifEFO1hzAeMrmkFa2o79cM
         YozQPNWbnl3cjCWggWgQIDB1JtnWTYCyi4kRMeExy94QSKWHWAAV4vuj7qnySdMpxTfJ
         t+PvSo7S1gSN7axdfm+4Wl+e4GGbUuoOJBJZRKpCuWPlyYHdo7aH7JRfRoanvZHtdyOn
         xLb0/us976aAwI4PcEPSgjRW+ZaGdNOLYuPIYVfI6A8ju2I504uCZ5o+KKCrEx/OW9z1
         Q+DlfvZ/XhM3oKeMW3piUoGtt4J2KldnPAk5qtOQUf2ym9dBjXUJNbP0AXebo/AuWlAQ
         K7aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792656396; x=1793261196;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PzWL9wbyB9BKu8/5KZoI0l/gUO+TONtg1mz6cnzHEwA=;
        b=APdm305AeuZ6bjG35qi194e0qKqFOwR92wwCZ9IHFOKkGLZ/KZLxH4SDQn9ZR5/PMD
         4agBuyAhQWgy4CRPOFnuqdlcrMZMcSV2naS1qCSIiS6ktmFi4q0Nt9YNBw2v0wya4SX4
         zIbDOPOr/bld0woFFvNi6gmn72F+O8y2xmmq765oAhPlrsPAbGv0nyHPi+h4f/yrQsqi
         h1eULWJUu2JDvdQV7FzC1SUdni3kB+zKghrJPzdRi9X3Nl4/cImIsolMX4DJKFGLxLZf
         SBi9ZXewjvVXh9uD/NJmB1n63gmySgGgdrtQcZmpXbYItoyo3xhwMQ1dzeagan3ZGLy9
         MjZw==
X-Gm-Message-State: AFq9FYItylLNQaXO7F0msms0k/LbiKdUS1bYYxQJDZXX/hHsODD42Y5v
	b0Dw8QrEOpMO+7aSWEYJwb2kjauROen01RkIGlnfNzNV69C97sFHE1oPTd8Be/vzG/5Kr80EUQa
	lH7S/OYcgdL4RB7ac9hoZ8wo3b9Glr3o7VNmf9uTMfxR8TnLlceJon0ZlSBd6b++LzLkN
X-Gm-Gg: AYBFou1FsijLjoQ9sSUhvUEUFxAIUlYSYt4FanFwGs7Loc1Lrq67UrE7MqrqTdPanRv
	bhrgfcTSDIb84sKXuRppypIzYxozk3/nm59NuaqEKygGPhRBNbzb4vz/fd4Vn2YFtVL2YfHrQsN
	manq3pXTa2Sepz/4DvlvO866RfAZm1VhM1jmFm7sMrW69yWTa63Hl6/VxMLzYgmUN8O3QvbQfGr
	xPUX1bYq2sgSIqS7j/1nKsIM+POBCZolsnPoIKMGTBfsSPItKpKjRrmet+5fPQJYQrbSk/5WEXa
	LO3PGEwzVLWxDfV1F7omAawg0Fhz5wp58JiJcM6Rv4R5dqI54R0iUxQkneuPw5KaTrw3n1k5Cgq
	JJUP8TJJQpdUB6hzr1zBSdA==
X-Received: by 2002:a05:622a:134b:b0:535:162c:2e81 with SMTP id d75a77b69052e-5369bb640a1mr79438541cf.5.1792656396230;
        Thu, 22 Oct 2026 01:06:36 -0700 (PDT)
X-Received: by 2002:a05:622a:134b:b0:535:162c:2e81 with SMTP id d75a77b69052e-5369bb640a1mr79438221cf.5.1792656395805;
        Thu, 22 Oct 2026 01:06:35 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a59d641sm79781066b.60.2026.10.22.01.06.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 01:06:34 -0700 (PDT)
Message-ID: <d1e5541d-3bbc-4079-82a7-b0b4d1604048@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:06:32 +0200
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
Subject: Re: [PATCH 3/6] arm64: dts: qcom: talos-lyra-evk: Add RPi 7-inch DSI
 panel overlay
To: anand.tiwari@oss.qualcomm.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
 <20261021-lyra-display-upstream-post-v1-3-585caa39cd7c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261021-lyra-display-upstream-post-v1-3-585caa39cd7c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX1HvI/X+0TFwg
 r3mjhQ7t/duK4OvCkHwsqv87OekuB9OwsUZboEtFWfXaU1o5en3WZBQntOiBO6GBrtw8ssSywoP
 +AGnmDkswVVRRoq46NSgeRAtUo1zMuc=
X-Authority-Analysis: v=2.4 cv=ReAFmFtv c=1 sm=1 tr=0 ts=6ad9c40c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=y-N8J18KE2yr1oCy9oYA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: noXP4XI9qEPuL9g-ylB3xWH-yTp50QdZ
X-Proofpoint-ORIG-GUID: noXP4XI9qEPuL9g-ylB3xWH-yTp50QdZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAzMiBTYWx0ZWRfX64Ctgl89PE4f
 NtZ+kMzQfs+4xCXRxr88dPpc49rvagRLRr3nh8IkAU+PkVUgAJXLg1JSYbOmVcg+U/WWMRmGBa2
 6OsvRQCsyOMmzXPnFSVqGrFqVNHkg71e8YdUNKZJVU5bPPJToGVvWV6bneW6GZPzxF377nTGHNn
 GVfCAE9uUWflynKPzRHcAekr//JbkRD0atDzw79T+AuNExPvnWhNvcTvYXroqmmp85xfiGIAhOQ
 ty+X0OXGjVLQNpm/13xRpVjxM8AFkYRkdlQZYSNhPx+yZgY4AbpFJQ0PTgGn44sE60vUF91zbGx
 y1AjekyKig3d+AOKsRYDRq8ffX7dTynVqcZsuTRdeC3XLrxBq+ZoxRj014iNj7Xj64FYFOscm+A
 1T8U0sN9GkXhG4AfWAED3Y/Gd5tQf++Y139umj5SyTeo3iNLN9X3NMpOxFv/jHCHvx/Kg5KojgY
 RZ1HZo5OHjNv3nUh0kQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220032

On 10/21/26 5:17 PM, anand.tiwari@oss.qualcomm.com wrote:
> From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> 
> Add a DT overlay to enable Raspberry Pi 7-inch DSI panel connected
> to DSI 22pin on the carrier card.
> 
> DSI0 from SOC is routed through MUX which can be selected by DIP
> switch S1016.5 ON for enabling this 22pin connector.
> 
> Add the regulator and backlight controller at I2C2 address 0x45,
> Goodix GT911 touch controller, panel power and reset control, and
> a 2-lane DSI connection.
> 
> Disable the default HDMI bridge and connector in favour of the RPi
> DSI panel.
> 
> Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
> Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
