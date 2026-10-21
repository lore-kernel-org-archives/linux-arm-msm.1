Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792577117;
	b=yxMTFHXa4Y1oxULk1LMvoLeWl051Trfd1kPGBsMU7Z0Tp0SzSHr8VJVs6W/3mrdIdPlX
	 tw6sHfdHrwt/4GmfJgEhN1YmvGSknxYdEcnfjfBtKsLrKfYZjbQX/mk3Isz9xqaFi5UpG
	 eBAB34MPEu49hYUjaKXsZdvcWYajdR3oM+bPmzP789Deupqcy2M5Vg8+Qin67tf1GmwxC
	 nB7jXgDngssX2eha+vpPX14uo+/WwrZBEdxaTIYWScX2QKnSpARYhcixddnh6HxenjGO2
	 sWSYrw9ivKnpwRqEnCIgHd3b5xtiMbN/XQsssGvrRpKxMjbuVO8WXiq4KwYCXpjSUyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792577117;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3k2GQpfyrf50S1Og3Onht9ZyUhGxFZcHms6etOpKY5w=;
	b=P42jpzYjEOJMlfK3S9KiJTZH9RETpzjqs/CuHXDfAe8PpzWCSHGS6h97hIpHF9kxu+7K
	 plpGXEeyJG+89Ba2m+6GQxYRjXj0v1ZXIPNFygwoiNNURHR3eJPxTunSKLG0pbDL6R21E
	 IJBni/KkltWwcjMGcrWSA5WY+0T0ovw5OunSUpW8TBlFaswbVY56yOD2i+2FG+9ZJQfHn
	 KQP5lHGUZy5n3VnGYCgbXOyYziDN6IMG7CTTALvHUvZxmKEV3ikUhm47uRtstzZwSv9HO
	 UfkCswBuYGAVfhD+7E4DAtbPHtLDbNDOuhuOjCkJ4JEnmf9rd7aFYR0bWPQQ0Twjyow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mnha30I9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JQKA542l;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88723606A31B
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:05:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88723606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mnha30I9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JQKA542l
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jaV33573438
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:05:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3k2GQpfyrf50S1Og3Onht9ZyUhGxFZcHms6etOpKY5w=; b=Mnha30I9XBjqyqwa
	VwBDAkT63M1Sh3jOTM8rJCKL3Fb8ryU1L2SsZ+sfKA1wav03soyvan2ILjpvRJbL
	smBfLJAG9M4NqKlaAXTpNUq0IYe+ZeHukXEMfTUYnx6LNxGR0AIpB547ZbuL391B
	Ae7vJrXcyP0qdePMxnUjEJV0VCbLEoP0tlG0C8h8jW4IXFTBptI2g7KbC+BA/ziE
	mDAPFllhzBn0pu69kMi/0mqnv9kPTJbvcHc/wNZSZWcK2xGNM00tPe30iAZuIKx1
	5U0/DbYfyci7jvveQ7TRcMaf57EiHmpvRMwd8r8ZrbDmPWHJisLeQX/yBOsFZLXn
	50GC7w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9hucgk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:05:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f1f1f2ecfso16260285a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 03:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792577114; x=1793181914; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3k2GQpfyrf50S1Og3Onht9ZyUhGxFZcHms6etOpKY5w=;
        b=JQKA542lIk1uORq0LH7N+aPMRf0R9FTN/BX2xAP/PXiV/Z79LbFAtQ+iLqSpPvUJPB
         oEiK870jvr6fkEgCLlW+IItGldYNb7BMNj3gMEomA3ISnsGw0mXW5yawskYE5jq+J9FL
         lcZOLdVUoJ0WqC8TOQgBZQnKlAQIKMKvYKMsyKV52i3GSIbsLQOflE47SUId1g5beVJn
         KToNfBUo+sYWbBqMWzrNtmW0A4+ptITimGtNzsWLtyIM9besU8by7SrS++fvpxjj7ptJ
         j7cpzURJgPbhumI0/HsM1hq+inaczRtA7rx2c3Mftd9qEG1M+1UPgjAdQMhtyQ/jy7mz
         bu/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792577114; x=1793181914;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3k2GQpfyrf50S1Og3Onht9ZyUhGxFZcHms6etOpKY5w=;
        b=fZKEt9jg+YDQ1CGTx9sAwR9scFjx04eQsfjQ+5wsjvnUtTtSgTPKt/+JZZJ0A2zJ34
         YcnnieQU9WOEWr1YyWdfWU7FEWb4TD8T44t+9WfCUl4fr/Dg7slC1p0Bu2hqQKXRJEoO
         OuIF9SbC75agUUYR8Obqel86/3o4IOsMbffNs3vcAuhzBAUNAAXg2YCxS3M5Hbk2iNHR
         hVQM4ptjUq085EOkHNR5urrlfRf0vNmkT63U0jIa4rGNkqPrzznkDm88s5EJvTt0QHpV
         oNjIwVOlRgTCsBOXZlVpQzSpt+W1wMKViQkDV3WYCB40weSiNT73DI4A8Th6pFruCSLo
         wqRg==
X-Gm-Message-State: AFq9FYLFRnYvNCUsJ+IDYaIQsAGxERK8DL5VSC+pC8azCraDOpYAt+Ui
	2jFe2DT9Ys7zz4ll/79c17JrqrZgKN/fUKmGQ57tfckuRKc3nB9+bMfkwETAc58P6/4fUJbM/bI
	o+g5kiLDwFKKYlHYu+9lMl3OWkpywtZEeHAB1mnvA4Rky6HzhuHsGndp68eyu+VjT9hm+
X-Gm-Gg: AYBFou2xcmLlaqIZkQZ7vR/6giljTxty550uiuSWVKfuZNfJw+ANkPp93oWxSCkRF7w
	0U4g8hRVmyvSmYFVwC6EyosrnJL1UWkkI+Ons1HUJRwLimSoQ43AmbBchlFphYn/vwB91PZv5re
	X5gx2jDq+dOiNeIDcfZhUlMZlnQNPIDmo0vp2gH8MjnPFQTuial3JhfFky1/yTOWzg88ZN+JFze
	rNOCoYLSO7JK3x4V/2ehRfn1RLZ2hvjWC32xcfUsmd+JfWTvVdo6/uXQzKP1nT4KNc6gozSkit2
	fVDzhjrxM12a/sKl0Ghdmhx26c1zQVpfibaVpsDG92O2jW/rEDEcgH5w7SLpy2Xxf1eQ+mfTPnl
	Gs3KgV0aNtaE5IH59bJ8eFA==
X-Received: by 2002:a05:620a:19a0:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f57f72681mr365325185a.5.1792577114334;
        Wed, 21 Oct 2026 03:05:14 -0700 (PDT)
X-Received: by 2002:a05:620a:19a0:b0:93e:54fc:2c79 with SMTP id af79cd13be357-93f57f72681mr365320585a.5.1792577113705;
        Wed, 21 Oct 2026 03:05:13 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4679005390sm59881666b.70.2026.10.21.03.05.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 03:05:12 -0700 (PDT)
Message-ID: <aac44711-c2b2-45d6-896a-540aba9e3500@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 12:05:10 +0200
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
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: hamoa-iot-evk: Add eDP display
 overlay
To: Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, vishnu.saini@oss.qualcomm.com
References: <20260922-edp_overlay_for-next-v3-0-2758d46ee174@oss.qualcomm.com>
 <20260922-edp_overlay_for-next-v3-1-2758d46ee174@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260922-edp_overlay_for-next-v3-1-2758d46ee174@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad88e5b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=FpWcO8zvdDYuGJGNxnYA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzOSBTYWx0ZWRfX44daZgzwYgww
 D1PG3K6gUB6Zb3tvuc9LDc5xdyN76TWwLjeHSpus1XObhN0wTYFzcwJi8fw82X2r4QKG16zbk0D
 1EPS4EzefH4z9mYhNlEkY95C//zpR3o=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzOSBTYWx0ZWRfXy9ShgWW4C7Wc
 l7NlGiOFJDThEgdJfWQG0mk+KmK7aZLq0kj9Ey95S6sSVbxVD1oTalmGk0jJItz2/56BkGyPxWh
 DqN9ygHYi2gBhrrSJpEv9xBLXWXS93HMt529ob2LTdWNEiX4NPC9tC5hPIpAo5joe8iooGkuL9Y
 Ylq+JU54ug6CwLaGBAK8BmYfu4BVmMq60t7iyujTtmzYwvKnpCayx4CnsFiDzpDIUddRHeGKcr9
 YkV23WJLBNhyLhheh2Balc1vVdgmg+rJdgpwCeemX784TTDIxFYGdSO7Ier/jXLhxGBbEkdZSvc
 o2jq2jcLqyHfyP7XzDvGZ62jzb7zafx+juv9SKibSayksDbGsNk8KPN4A1K9obeKydYQJOKHsMi
 j1pZ/2ivrZGxKTucs+ynt8xuo4HO/VwfXwMsi2DF0YY8ydvR32Qf9B1IGkGNO4DERHquavYyGW1
 0PO0w6LwwJTIe2ku2gg==
X-Proofpoint-GUID: 8eU079DuDNsVBjm2WAHPfXOy4Hy7SnBF
X-Proofpoint-ORIG-GUID: 8eU079DuDNsVBjm2WAHPfXOy4Hy7SnBF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210039

On 9/22/26 12:42 PM, Anand Tiwari wrote:
> Hamoa IoT EVK variants are available with and without an eDP panel.
> When the panel is not connected, DP3 is unused, but the base
> DTS still describes the eDP panel and display path.
> 
> This causes the eDP-panel driver to probe an unavailable panel, resulting
> in AUX probe timeouts and missing display modes. Userspace then attempts
> display commits through the eDP connector, causing repeated DPU vblank,
> frame-done, and IRQ timeout errors.
> 
> Move the DP3 and eDP panel specific nodes into an overlay so the base
> DTB describes the configuration without the panel, while the overlay
> enables eDP panel for boards with the panel connected.
> 
> DT overlays cannot remove properties from a node defined in the base
> DTB, so keeping the /delete-property/ of #sound-dai-cells in base DTS
> where it takes effect.
> 
> Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
