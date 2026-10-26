Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793018366;
	b=5fXzNYrbFX3Ql5z6I5SadyX81mGbDWD3WPpuMpf2o9GLCARWmfQlGOucsndigkwN+hxE
	 c9QCryrDd2Lyo/suMG9b3/0NienAzNr71BcZfY4OOG+Jp/Scakjor1Rbk24/LqIhuwy5C
	 0g2SNdMDq+iWfsz4Vewro+etr/NZyVAkW5rTg5JLGaRfxLiqCGIqtcMJpldDnwKgRo9UK
	 XH6FK8UEBXTzVZykWrTWsionS105qBw3wASzI21o1HVycD8bJvUwmqjzwpHcZINMaL1G8
	 UcVO5oCCjxRSZvnsiWgMESCBFH5t4uGrHQeFoalJeLnk71xSmU7PnLXYnveG37YuFyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793018366;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Bb598JIaq4miGwMJBaFa+6pT3HV69s7VbiuHdfyulYA=;
	b=abpiMUclAw1DDiOdlgUcbcXHQixNOCbnUQu2BYuLThhodQplDenFad+SXSWdwy7MWzx5
	 QP0qayJ8mDz4bUgixGSefyqy5U9dbzXAbYoVlExea4WF4WlyrPf1O7Qw3eIxLJaHguP7H
	 5gOyiUIbUNoF2qgYevBf7b9xQTv/wG0aRGWyAfCmVRSs18rL80cThvB4lsYJvohL3VMsl
	 EJswyULDG1rXZ1GY+VlMP9Qo0tZ8x32A4beKXtktBDX9TrokMzCensh3zwtxmARc6DgfG
	 rTVRqK3+vltghfFjMXwkEKjAqzcd7ED93MX9hrrWSK/9JO37+Q/D+7hg7fZrFDHVZQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WTzzFqLn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SpZzmsqg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2AD2606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:39:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2AD2606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WTzzFqLn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=SpZzmsqg
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtMiO2541974
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bb598JIaq4miGwMJBaFa+6pT3HV69s7VbiuHdfyulYA=; b=WTzzFqLnwVYu4HrR
	4MHLjMicCThMVoWiMc6rYZhLuGFM6mLBo9ddNlnWGsbyHybL0SbpP95E1mk7M5v1
	fw4ZVK/BKbdUECrdmzG7FEA9dHYmmf85Sp4pAkjFwKZhHr9eE0w7ch40Ul2EezxG
	8y77P2R0QL3rXTjrAfsm6OZuNIjzqDdoMo5nMMKyvU4H29+DJzxwF7vN/GwdtC/L
	X01BZUf1AkZxpLKT622MCUmrZAFgFT/S4Hb48CVy/AQCAv/fih0hCLNRZhZqPUMa
	WmKHjE2XY+Y2cEB5kAa2dZ1G6IYLxQaIRuoVb18OnE7vv5TY5XYj52fFuEiae7Hv
	TH82qA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjdaf1g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 12:39:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2bdebfc5so92989085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793018364; x=1793623164; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bb598JIaq4miGwMJBaFa+6pT3HV69s7VbiuHdfyulYA=;
        b=SpZzmsqg9YEJN01lH7OxCQK5ZAtZPjABZnB2VQRFv88LS9KMIFCX0abgwwCi4xSc+r
         VuO10VENHsaRNe44178uj0ntScXSeqKJfTWEXj/Xo444hdgPHAKUN+yC3RjYd0QtMr2u
         YlBEAygME3EOEItCpnrNSmtR/Y6QI6W6w4clsSHW/AP77LbHJBp3gUUiLrqK2ib46xOS
         6if+PQ+e9x6FNLge1Q/aeMgOSMZrqzVgN7DEWATBmvPPv641WkEBHWwbWYeNZjlYOi0r
         phWY+cti8mdlBHlCJanxv2V70ZM+4qo9nnjY1Csw41KQRPC+67gwwv/Qjj1w0iFt4MD+
         JTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793018364; x=1793623164;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bb598JIaq4miGwMJBaFa+6pT3HV69s7VbiuHdfyulYA=;
        b=MYLaDahwLXHcYHsHLuP0od/4yeeb+jgTHqKokWcCv897GurPFsJ6dUOVggEwDBGi9h
         oh0t6+/sd0kxf2yj6c0E7vgSsyqrP1lGehkiLXinXd8uAYe9UJtyYKVuCyljPeMovZIm
         3K7KcXTuNZss7Lyh6QqETjI7LrnMhAM+DgWGf3kOSMwQqmGCAbCgY1fTnONS+2ZaXnD+
         YQjAhRhH8YjNA1asZ3orV5iiU+3XkZTgc2/ipjB0tLXzp0slWRWYjcIYkADUGFLARW4u
         08b+GrJQkEfFudleZq+MXTa1R2lg0hB7c5d7TQ4RsEj0xztiP/73wJ9yZ/AipO9ocCFY
         D5fA==
X-Forwarded-Encrypted: i=1; AKwUvByLv3pnjfHCBn/YWOF3NeSgQxCUlW278JHymKGoQbrB3xwtD/XefQdy+JzB5Kq/Fr7EMVGdKDB1pNkRR2K3@vger.kernel.org
X-Gm-Message-State: AFq9FYJetXpcaw+5KZ/MIu4rA8tm6fngXzkhmT9a7aWsK06xeRa+hgBG
	PHkmHwxixMlxhEdeSZOFcUUYj329pb8Dhn4hg+GPbwFfsaUb50gVHfteLe9QriWrh0a2YUL13F1
	wicgknc7zIRrHy1cV4F3+0PISBcnf2UYwkWoFVLEjdKolxZeVLi6IBtAxEDNPiueVW65QilJH09
	SE
X-Gm-Gg: AYBFou336qdI+EjeuGr3qs+50t9orvIpLE1IoUx2AUG/nSXkKlN5nbXyxGKDR9aNlfu
	jB/qsXW2xN0kwp1oBphpBUwGA+wkV4TJ+EdYkZwkYl3H0dK3V8fXzau5HHoB/ob+Fl9vmrszMbL
	YDtGqVT/rhNn3qLfosD8mXiKy5fX+ZSQbUzICF4/otL9QyVQlX0iRt7fER8VWeCpTHnA6E5gm/q
	NqhrThQ1k8fyHrOYXYTJv+PMGB+vD/lWh3l00OpEzFgNSKFi65r4UpyRynMbaUH6VOZrzWSjZT1
	fs88NSi5e4BowqIPMFhqmSzzWdc6q3BHKXFmCobDR0aWL3NEMrptiq4oBFrNRVXZUTwRxGeiM4j
	RtHArKIe4olvZgDwx1lbqfg==
X-Received: by 2002:a05:620a:8a87:b0:93e:571e:94f0 with SMTP id af79cd13be357-940ef8f51fdmr949470585a.3.1793018364157;
        Mon, 26 Oct 2026 05:39:24 -0700 (PDT)
X-Received: by 2002:a05:620a:8a87:b0:93e:571e:94f0 with SMTP id af79cd13be357-940ef8f51fdmr949467785a.3.1793018363655;
        Mon, 26 Oct 2026 05:39:23 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a9d459sm1530307e87.82.2026.10.26.05.39.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 05:39:22 -0700 (PDT)
Message-ID: <2c20fe9f-c117-47de-aeca-2641abcb4b66@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 13:39:19 +0100
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
Subject: Re: [PATCH RFC v2 2/2] arm64: dts: qcom: Add a minimal Xiaomi Warsaw
 description
To: Zhang Jiaxi <Z1529105815@outlook.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20261016-b4-warsaw-minimal-usb2-v2-0-1b03496396b4@outlook.com>
 <20261016-b4-warsaw-minimal-usb2-v2-2-1b03496396b4@outlook.com>
 <d5d28d79-474a-40bf-b511-e20fb0897b91@oss.qualcomm.com>
 <SY5PR01MB10600F961AC57A32262D99ECCA1662@SY5PR01MB10600.ausprd01.prod.outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <SY5PR01MB10600F961AC57A32262D99ECCA1662@SY5PR01MB10600.ausprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: j852_0e8MR-2Fi24SW3Kax_Rx2c_fxxt
X-Proofpoint-GUID: j852_0e8MR-2Fi24SW3Kax_Rx2c_fxxt
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf49fd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=cNoKYFeJyS4W4/1HdvzxLidmn8o=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=UqCG9HQmAAAA:8
 a=SGK8BKh5EnIYygesR2EA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MCBTYWx0ZWRfX3XHbyQU6eMMF
 ZwrqDCY2jI4WEOOkD5JcFDhKLRGNQxh/PmNhHFwoY4neElVQNf9ilUJvVtdltLvnJbobRkffBi9
 Iqw43OPu/tSy7NKg4wVuWPLjq7O3igQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MCBTYWx0ZWRfX29RnUXFugW+L
 u7tUv77Q0XVjDN+c0zmwqDzR4qAs/t06d2G3eRm77sFbJzOXjobie9DQMPFcb79NsOjAxRUbqa2
 rQxbHKBKBslFBPyr5sy53MBkvquMmZhJRWW5ux/XaP70t101wLtuRGeSApmy8uau4cYxng9+T8d
 X3En78Ad4N8PXtd28lj13Kz9Tqpyt84jEBLenR9DOPogdoTkEXfHfGvC3fz5Snd9bMudT3m8hED
 yTlTLyYpDo2XwfveEkFMl5fN1NmqzBtK3fSoAHudlZBiL6x1uZOTdUh3RWyXoTmLJBgLtssrnBi
 6/waPi27geauNmtVrAZHqTEHlqa2jxF6W+/jYGv2P0dBaxjkPsFTPlaI3IBNAjreQSoNjhT/d+P
 B7Wb6GzAkJOisJfLYfvg111x190fbB0Q+ztOvUS7YDVIn1K7vDzrg+8NJcpidSvRk4Bhdevtmc1
 BQaqsSNPo1zRcdITR/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260050

On 10/21/26 2:52 PM, Zhang Jiaxi wrote:
> Hi Konrad,
> 
> Thank you for reviewing v2. I have posted RFC v3:
> https://lore.kernel.org/all/20261021-b4-warsaw-minimal-usb2-v3-0-9f4213ab83ef@outlook.com/
> 
> It updates the model name, node ordering, common PMIC include and GPIO
> reservation comments. The cover describes the revised DT's bounded
> native core/USB test and the Codex/LLM assistance used.
> 
> USB remains restricted to High-Speed peripheral mode in this RFC. The OEM
> configuration retains OTG/UCSI role switching, so this is not a claim of
> peripheral-only hardware. I would appreciate your guidance on whether
> that explicit initial restriction is acceptable, or USB should remain
> disabled until the dual-role board integration is included.

It's fine

Konrad
