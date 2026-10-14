Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB01502D72
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 13:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791983245; cv=none; b=cvitrrGp6AtqGSQ5erzyFVyQgToI+ZxaqJLaETIVLY+J8LaVj2Ski+e07Gw1PEyrbkz2SFXaqMPDfxefFeSSLLRo8hSDTG0wRMZrv1DZpnmEDCbMeL+WnfouPwS5VLAUAkTGqlM6L/G/4VTBl5paAZtfFN65TAumkBrSHqYT89o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791983245; c=relaxed/simple;
	bh=oYrFA4t31yCg674YIEYDO9F8U+mMumF/009INbF+nFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A2bCTyuqIe5n/AcXmnPCyGnmBYXEEk/v+Mu2aJLLsKOJdqa5uiC71QdB5JHy0ccMKavUDualn8B9h6b4Nptg8ruzs0MZF5bdtGBcsYGYKcy4yjTzAolnJSGVpgH4Lv/wQkabLQPM/zTQd3lukrJTytLLnRAmUkiYYbTSjOhnHPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZBzzOGDm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CrWSkHKU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZBzzOGDm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CrWSkHKU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E9xsko806654
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 13:07:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yFAm7tVViM03YaMVoiHFMLbigh11a6nI9bZ1zf2fwe0=; b=ZBzzOGDmABE+CyEF
	GDoxcNhX8BywaxXhsg328GCSXAbF3/E6MheZyHUbkhTuZO3HEW0d3KLGan9TUnFV
	4f6GNHAjaGB1BjIqHkJNmtlqm9JyNvxgXHt66TIgjvBMithL0FIGiAJczl+iqq+d
	QfHzfwNKVw9MP/RCkaEWDxD1Q4Kn4ry1rL2Dnxj1rc+EQ592yxxL7GKGg3eAjObB
	CknP5pUaRTS9MGbtO0g7zUsV3WpReQDNCwhwZQIyy99wotKK8m62caAnZbfeM5nX
	mtWYpjeTiWdtMVF7TRMgsbuGlPiXl8vABg8nu+gV5FQ2JPJLLDHFjf6McFdc9htM
	Pv1/AA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9ud6bkd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 13:07:23 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cc50fb0d2so78331585a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 06:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791983242; x=1792588042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yFAm7tVViM03YaMVoiHFMLbigh11a6nI9bZ1zf2fwe0=;
        b=CrWSkHKUQ5BB0A2OvvDLsi/l4kI0QEJD+4xOs/VsQJunwTt25NHH1TbK3cQJJV493z
         oWh/le7UkvJJnR8mrEGXPDGJ9IMfOkrjShGxyahLzGjr8rQkxwH0lVNX3FqTtNyMEVzN
         ks+DPmTWTrQokuxs68UX/09/oNiGgrL4mjAybuhjIM/YL4qYDk/qDzB/qZE49G1ovrs/
         BHKbP32w8wT8+5BwCP+kysm1wFw4XzIzCdma7UfdinHc559rFrdr5rIBpX51ueLwoBzY
         +sTiY97AWeYhOuzDwZCkOUxlXxD71+7xGHOS497ejQxdBeIEDjYo73LDrLF8/eSSBZy0
         2sHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791983242; x=1792588042;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yFAm7tVViM03YaMVoiHFMLbigh11a6nI9bZ1zf2fwe0=;
        b=tgNu3vgtIU2O1hokOXD6JvQw0Q/IHZHlyjkEywVz+llxjugrkNC4MB+CdHNYQD3a8K
         St8Z0vz86iuulQa6kOlgZVxzRuIWvPLgSDItRK5/iEjWPp4wfNByU+oyz7v1kO3Y6Bb1
         P/OGW3RH/KGqnG47HdqiYJ2yUnkXpI+wLXgD0UACfzE9VINpJlzJID0RKST3o5KJodSm
         KQ5LOpHjpO/7MdWyf+AnpAGjVwwrlmtQRY/FPBi9Qr1aVVlDJPR/gY27UOZ2Q3CgaCVl
         6r/3/1H8b477WDpYN3R4fYL63UQHt2pCvQ0T3ScduRAGQFrzSuIVttQRTJF01g+kHPWj
         cBRg==
X-Forwarded-Encrypted: i=1; AKwUvBzK1J43kFGjhKf3cBAv1bDAnUUqw7rVz+tUfadvCGY6yqaCqSH0cn28fcuZgRfnOUa+xcMzUDoSO7SQTUZf@vger.kernel.org
X-Gm-Message-State: AFq9FYJWpgHXMNcmkI/w2je3iktdN8FOKeSTtsdifVMgK4BK8i/0QDp7
	qPm5TVK9A0XB6ONBGyoY+G1UeZkH5bliHozsVMEs44W5Ue9ds/oLhsSfM+g9b+3Agnm7ckCb5Ep
	P/9+Y2GK6LbaPa5VnowEtMlHDLHn1Ou0izyv17yEshglrI5oHNVkx9zsRa3bnKgbivJmD
X-Gm-Gg: AYBFou1rCxuOdxuRDH7T5GlWXvLTvnUV4tg60AnP6D1ITIEnyYMNr2UVXRBw5dkEpIN
	CwCKA7rJO8Mo9RYrunSgz1g2giTFdqHRI1Tm34kLvE5vj+Sspha1VfS5AE7+zXZSEDaxL1gZAEZ
	9w1HLg/5n4v6/PkLTMHhshZjFbLTzDjVywNYdG5SWXMq+Y9cCfpkgKekJIXPONuXc8wpn63C3Y8
	ZZCqa/bk7obeiPdQFk7NnCx6Mbt0TnuLcFUvRBIAMCKMuYhHMTpV3jGjKBbMImmLl0kM+x4JoUs
	hy2ygBU8aU08edWqcFDzTW4PDeZGPaOKrOXK0YKMEh8Nvr7VYoYaMIdTgPK6yQ5SjAzHJebgWDV
	s/zt5cR7cTuwuny1+h0TkUw==
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ebcd2b830mr2616435985a.0.1791983241762;
        Wed, 14 Oct 2026 06:07:21 -0700 (PDT)
X-Received: by 2002:a05:620a:6506:b0:936:2f59:dfe4 with SMTP id af79cd13be357-93ebcd2b830mr2616417185a.0.1791983239714;
        Wed, 14 Oct 2026 06:07:19 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d7cf18sm612736e87.33.2026.10.14.06.07.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 06:07:18 -0700 (PDT)
Message-ID: <7ff7a265-59ac-4ab3-af14-385fd02fc6ce@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 15:07:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8650-valve-deckard: Add initial
 support of camera sensors
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20261002101748.2454305-1-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261002101748.2454305-1-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: M1eov-VUiC-UkBDo3AFH2_kQ3myoLZE3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1MiBTYWx0ZWRfX0jKL6faxsE0J
 ac+vi4H847mM23LwtuWl/0KH9lqIdhLZgJ2Rp2mxh/RDhqaDUpbwsZD2Hi7SREWrAoQTl3fYW/9
 vGnoMf0wJzr5Szc2EjnXxcozS1ozwfs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1MiBTYWx0ZWRfXzjTDBDIH8eiJ
 /Ybk5CTp29cEJMeLuKPhSsL9cgA4NywWmcqcHvhB7wsPbu5vzAzFkpxVDbhfdn8FZ2eQQenp0WL
 pI920nhGuMPXV2dBux9Lz41HIf3oy0pchmoMvPMzcs+2Eze4CMNc5Kw89mO8q+DRnzleaEoh4vG
 gFmSfQ0kU7ZCH4XyEhhTzHqV+CXe+tc+kUNsRN6gDcib6lpQJbOxEWOsbGh0dgw8KzDw3t6SD3w
 0bmwqxl6n8222sZl2pFdLqH9yT8WmAQFrs175vRa27N0Z1gXQ7FlXKWNnRxE0qD0VAHAmOQTaPj
 2cGmXGpCL5uUw1tupNRSm+pErHSF1/P3nJzcbTiUC95b/EcGTlOevMP59AYkQA84JqlGZFf3uYG
 SUycoi6PP1dYvWzKNFyjGN7t7WZfTMkX1YQqauIeUTEWDo5kTsnrby+3ofWdIHpvIVplkzkA/Ie
 8Yri8x2BKPwU4xXeISg==
X-Authority-Analysis: v=2.4 cv=fJ6sTpae c=1 sm=1 tr=0 ts=6acf7e8b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=F4o2vShMjHB1Vy3mdkMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: M1eov-VUiC-UkBDo3AFH2_kQ3myoLZE3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140052

On 10/2/26 12:17 PM, Vladimir Zapolskiy wrote:
> Add initial support of camera sensors on Valve "Steam Frame" device.
> 
> The change enables CAMSS and adds description of
> - a pair of OmniVision OV6211 monochrome eyetracking camera sensors,
> - a pair of OmniVision OG01A1B monochrome front camera sensors.
> 
> There is another pair of OmniVision OG0VE10 camera sensors found on
> the device, its description requires a combo mode feature support in
> the SM8650 CAMSS CSIPHY driver.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

[...]

> +	vreg_cam_front_left_1p2: regulator-cam-front-left-1p2 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "cam_front_left_1p2";
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +
> +		gpio = <&tlmm 37 GPIO_ACTIVE_HIGH>;

GPT points out this and vreg_cam_front_right_1p2 poke the same
GPIO (but have different supplies - l2n vs l2m)

Konrad
