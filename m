Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBE4453A50
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 18:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790275021; cv=none; b=iv+y22ZCj+x+zLyeDib0GucfuQrlc4QdjswCUzC4nMjY+v9/qNTBTl1CkhNv8Lb3YgsJaO2rdVxyBaaOMEhqTcLDgoR8Q/rQW9GKoja8CrLp8Oxlohz5fO3nfeTCqVKf2mzgj2tFhpRcPo/fj6OyKWl5C+VO+klGlhRq03z/F3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790275021; c=relaxed/simple;
	bh=Zm5ldxmbcNQhcHRY+0U+0ysqbQPxSjq+VFK68TfEGF0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k+p/XpXPsHrm6KKxcjGBWUI5QT9EXqvRrPva3N0egOXFbwUFTx5oL7zi9aIss7Nf4MdliThygjy4+HQXqu6YKHKpdnVF39YP/+tnQbnwZUeXuNqiTmT1QE0+IX2iNnuNcC+NmANxwcqle4V46zqBEiVL4Ia/6GrgaG+Xj6dWzyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d/SnV1iu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PP0BP5aa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d/SnV1iu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PP0BP5aa"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OFeQos2101542
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 18:36:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	41LukkMXTeVAHv1EIq6Q6zMQywct8NJOviLbwN/UtRg=; b=d/SnV1iuTx+hgTty
	eAP4qOmbq3d4b0L0y60wdiGxF00t4kjPES5bO5MiikdGvmjUG9NIqjZ0+PYiBA89
	fa8IgVNZaSJN2EPTwMRslEte3J/HUVfMvXrehg01FSHqGy8RV9UPIF9b8zGy6Ams
	KIMXPuexfnkc/erkcQPouA79+sm9X5vy00OJh1Vti+5JtdCCfagxKrb1Z4I3Qrqu
	Gd/Co3mbSsVobRhNolbE+VmacIRQUKV0Lz8SSBW9O1FcUAA0vEKWqEoH7/EtG6iX
	FEquWtM5AZZXr3APziGivXU2m7fpCufG/W4tqK0FLuKZiYJEXIS8YEci+LVAeDw6
	ItnVkQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw68e10se-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 18:36:58 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-32861f5448cso223156eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 11:36:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790275018; x=1790879818; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=41LukkMXTeVAHv1EIq6Q6zMQywct8NJOviLbwN/UtRg=;
        b=PP0BP5aapjA/OFtkgA4qeiBtEPEOx6tlSgtDXKe6QCVfRH+CiQtf7FWgfWrPIe8gXU
         xGreYRt0E05KMZXX60gcLZDt1MrUBbO3JM/hEBrHS7rl2ZsxGS4AtvfQvAjZI8rINEzz
         f0XR4K8WIuwursiM5fy323zv9KUa6qxyWfhUlAhiG8ZD6HiAx51WFnP5XgTcnFBVoFrN
         d/MVWqfdhhdGgI/YcC7UzNIFi5VWdYy3vVn3MglEp78uS/zQXN46V3CP7Tkc1Ha1xVQO
         X/YtDV9zo+Mpa14j1rY5CLv7xEALcn/lDrSjt+acfoVG2HfCIEqhVq50lX6BYcJwSfmJ
         e7EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790275018; x=1790879818;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=41LukkMXTeVAHv1EIq6Q6zMQywct8NJOviLbwN/UtRg=;
        b=H+S9wxk0C/zWp8zgDPfsBKF7qY55XITK/WvS/yO0/+b8k5zvUIt+3uWTdca7wRm0/D
         39i8RWPM8q18TP74jKQkHwBDrjOWQcWyMBmaAjSkhiwqHPftoOu+0c3GFLzR2HLF/ufh
         xLFOeqBYjDaUwDvoGrKiZcbQhRBsVGXM0KyyilEGWNwjvuHIlNI9gjc7Uy3n/6ItQrPA
         wcfae+UPxd52RbPuttUIgDh/8Qq64koVAWh9+lfC1Wha9GYipNAnVYqbNCA+JyEuRNks
         SdKOcz/3//i6W8fBoPv3wwyoVH5vMqg7cRhM9ppocBee1IZtw62nWUfHX016BXd7Srom
         W3aA==
X-Forwarded-Encrypted: i=1; AKwUvBwkPa3IBgzUVhM043AfDbefum1KFtoajM0+dqT+8BSTXa8e6SAqUIGJ4hUdFeuQEikXDq3lLOhUENbNyGwT@vger.kernel.org
X-Gm-Message-State: AFuF++mIewOuXgYoDY1TxJBGAZnV1FB1zErRCoK7EaWbmBBCbmA9pGrl
	LDs9jKlCaREYQcCE71s9TMh+OjT5/6iL7919HZpL6QDidm52TfbZqroOkeChbSSK61wWPkyvZTl
	qUpYOckKPMo5yTifoHw4jXibFq4SZvovu5hYpRl4BCL3ssCBmiYuWGMk/QDHIlcjhjw2Q
X-Gm-Gg: AYBFou1yWHl17TslzID4wusQRrR5GCp3BDl+zIujKXMXWr3KFkprdoECU8IMgHztR/Q
	JTURPoBNwkh1KFtyTbm5cxudpuzrDMr3gBJWWLAlcPIP3fUMBENQ4Vy6LQcQOiQDV33E6HnXXsT
	cWf6qjtFHPeYCb8054cZI5Sfo/f/PvYAFcPvKN1U3UEvhPJSoHgEnWd+iWmnXvxQ8vpa57Cvg4d
	rFm4pUis38YSMwrsxMqKTM3bAgTT9WlkuZQIbuVRPLfO22DpYnOz4lsL5C7EK0c8JO6c6TtpKXq
	l2t9gtNBC21W9KR+SQtxgzV8G4hrUpq8nYhflRyg8xvLB2vwxHSthcpk2NdH4XxgU+aDs26lO/2
	AnvO/4v7h2NycY4IHEDE43dC4qfP+nw==
X-Received: by 2002:a05:7301:438d:b0:33d:29c6:3445 with SMTP id 5a478bee46e88-340035bcf1dmr2498228eec.31.1790275017963;
        Thu, 24 Sep 2026 11:36:57 -0700 (PDT)
X-Received: by 2002:a05:7301:438d:b0:33d:29c6:3445 with SMTP id 5a478bee46e88-340035bcf1dmr2498170eec.31.1790275016317;
        Thu, 24 Sep 2026 11:36:56 -0700 (PDT)
Received: from [192.168.1.12] ([122.177.242.157])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144757747sm432684eec.13.2026.09.24.11.36.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 11:36:55 -0700 (PDT)
Message-ID: <c5f178f0-a0d1-4e38-b663-6f37ad26b999@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 00:06:48 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260916-shikra-dt-changes-v4-0-d5d5c3ffe070@oss.qualcomm.com>
 <20260916-shikra-dt-changes-v4-3-d5d5c3ffe070@oss.qualcomm.com>
 <5som4lcux7m6fyawwhjyrdxxiys6dh5ix33mtkxsseuv6uyxez@jb4m62r7x7i2>
 <7ef413c5-a9fd-4e75-bb02-b3d7f74c67ab@oss.qualcomm.com>
 <e4uqn4dybttmo45gucxdxcgimfskuzlqvtdo7u43ixlyd3yn5v@aifg7nchvc6g>
Content-Language: en-US
From: Arpit Saini <arpit.saini@oss.qualcomm.com>
In-Reply-To: <e4uqn4dybttmo45gucxdxcgimfskuzlqvtdo7u43ixlyd3yn5v@aifg7nchvc6g>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA3NiBTYWx0ZWRfX2cxRNoK2WJJ6
 imJPg5iXKAX7dxH3m4TJHHlx7dSXbpRy1z+oTPLL2LTdA4bB2KDf7mz6YZFSWFolsWd8djBpBCc
 DMRETgITuearQSQTBfGcIuHxxoIfHfEL8DnQ0HcNLothTbS0YMDnFU1OSTY37SFtDC9ta/05OD8
 PAuuhnOUksSb/QG4DD7YLxXmlu7xx8LGq89vtnN1Yw8RC0WJw83CJzvzsFRSfeNIRptedB4Oyfk
 dbUoUSzGQeKEiMDr431uRwcxsc27J2dwJS0pOTtkqIo+8TYoO8QEhMU4arvNyfC0oNKzUqqt+Ac
 hKSwJr6fHIyNFSKGLthLJNxsh8JaUK2m3/nzJrL5aCEGYT5JS8QNJslqBTfAxNuoJNJvaLYUPb0
 DcSKmTjD0WCqwE9pixHUvisFDp8AfEMo4wZNlJ7UmOTy/HYM4+bpDjC+Mky5N6vW2luJpi0dqTt
 5UFvAjaCMea7QxqKOhg==
X-Proofpoint-GUID: JcqTyAF5a3Ks6aK1sDR5K12-dqEDypI5
X-Proofpoint-ORIG-GUID: JcqTyAF5a3Ks6aK1sDR5K12-dqEDypI5
X-Authority-Analysis: v=2.4 cv=XawcX455 c=1 sm=1 tr=0 ts=6ab56dca cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=9WqIVI+dqUtONkXyCURkzg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5Aoo9DEluPtx4pQJSMQA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA3NiBTYWx0ZWRfXzAgBQ89WVDKm
 1C3z1tDlNTbORMyk9Wqw1zAGpfUzbnGnppjKk8nIobnPikdO0GWijT49yc1Q0V2/+ZT5YceR9B+
 eUEaWe0JBPy77JMIMX9VC9MPcvcnIig=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240076



On 9/23/2026 5:38 PM, Dmitry Baryshkov wrote:
> On Wed, Sep 23, 2026 at 04:16:21PM +0530, Arpit Saini wrote:
>> Hi Dmitry,
>>
>> On 9/22/2026 9:33 PM, Dmitry Baryshkov wrote:
>>> On Wed, Sep 16, 2026 at 02:41:20PM +0530, Nabige Aala wrote:
>>>> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
>>>>
>>>> Enable the Shikra MDSS display subsystem on the Qualcomm
>>>> Shikra CQM EVK board and add the DLC0697 MIPI DSI display
>>>> panel node. Pin pm4125_l5 to 1.232V with regulator-allow-set-load
>>>> for DSI PHY PLL stability.
>>>>
>>>> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
>>>> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
>>>> ---
>>>>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 118 ++++++++++++++++++++++++++++
>>>>  1 file changed, 118 insertions(+)
>>>>
>>>> +
>>>> +&mdss_dsi0 {
>>>> +	vdda-supply = <&pm4125_l5>;
>>>> +
>>>> +	status = "okay";
>>>> +
>>>> +	panel@0 {
>>>> +		compatible = "dlc,dlc0697", "ilitek,ili7807s";
>>>> +		reg = <0>;
>>>> +
>>>> +		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
>>>> +
>>>> +		vddi-supply = <&pm4125_l15>;
>>>> +		avdd-supply = <&vreg_disp_p>;
>>>> +		avee-supply = <&vreg_disp_n>;
>>>> +
>>>> +		pinctrl-0 = <&panel_rst_n &panel_te_pin &panel_bl_en>;
>>>
>>> As far as I remember, your panel_bl_en enables an external regulator.
>>> Why is it not described in this way?
>>>
>>
>> panel_bl_en is a Qcom's daughter card specific platform signal , it does not feed into the panel.
>>
>> It is a board-level GPIO on the CQM EVK daughter card used purely for
>> platform power sequencing.
>>
>> Adding panel_bl_en as an external regulator would be misleading and incorrect from a hardware perspective,
>> as it is not directly going into the panel.
> 
> Well... Aren't VREG_WLED and WLED_SIN1 / SIN2 directly going to the
> panel?
> 
>>
>> for the CQM EVK, the backlight is MIPI DCS driven and panel_bl_en is a
>> platform-specific sequencing pin, making pinctrl states the
>> appropriate binding here.
>>
>> Could you please take a look at earlier discussion we had and let us know your thoughts ?
>>
>> https://lore.kernel.org/all/29ca6303-4368-4aeb-b82f-039aa252780a@oss.qualcomm.com/
> 
> Exactly. The diagram there shows that GPIO 91 (panel_bl_en) is an enable
> signal for the WLED regulator, whose output is then fed to the panel.
> 

Hi Dmitry

Based on your feedback, I understand that the daughter-card WLED circuit
should be modelled as a regulator-controlled device.

I am planning the following implementation:

vreg_wled: regulator-wled {
	compatible = "regulator-fixed";
	regulator-name = "vreg_wled";
	gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
	enable-active-high;
};

The panel node will reference it as:

wled-supply = <&vreg_wled>;

In the panel driver, I will add wled to the existing bulk supply list:

static const struct regulator_bulk_data ili7807s_supplies[] = {
	{ .supply = "vddi" },
	{ .supply = "avdd" },
	{ .supply = "avee" },
	{ .supply = "wled" },
};
The existing regulator_bulk_enable() and regulator_bulk_disable() calls in prepare() and unprepare()
will then control GPIO 91 through the fixed regulator.

Brightness will continue to be controlled through the panel's DCS backlight implementation:

wled-supply controls the WLED driver's enable signal.

The DCS backlight controls brightness through the panel CABC/PWM output.
panel_bl_en and panel_bl_suspend pinctrl states will be removed.

Could you please confirm whether this modelling and driver sequence match your expectations?

Thanks,
Arpit

