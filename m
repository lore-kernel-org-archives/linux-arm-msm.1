Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E0A3CCFBD
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 07:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785397357; cv=none; b=TuFO/Jdfptw9FqZMtIReds7FxQoomEdxA0hkncuW+uD+Fd+QIfXm5zLesfTg3VrlqouCrItcaS2swAtyW5sDm39rQQTkyUjovNxtWhE45bplDm4cMR6RQ4vc3KJsCBf/dUl2CsrQxgJwPAXzB5b8IHC2KKepVQ+cq7gdTklLA/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785397357; c=relaxed/simple;
	bh=28ZLWM/pIAuHM+vAC8WI2Vv9H2XW6bKXry8d3aIER/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N/OlxZ54QEzTYVIIUk7ZAzeMH69F1n6ppK+HNHZHCb/bFX6DxjFevV8QCSfYDFB8/Vp9ImZ7wLIW7KiintWxahTGUAGB1vBopEGB7SI4WpZ6tENU/ELclXGDaenIOT8heiPx+Ipcsb7eu/IYqF7VB/ryAOgL4jYEx00xoy7wx6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cMpM2Llx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vjb/y4ah; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cMpM2Llx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vjb/y4ah"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U7OkU81300440
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 07:42:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o8hNYcnTlO2sEp+wOOaNROgXRLuhpC/AD2RNYMOE4VU=; b=cMpM2Llx/3TaRzEk
	5n/xZ4RN8j/H7gFGCXJEZ8I49KPSnIb++JFW5DNcuJJT2p+ucWozOi4sAAKoVWHQ
	vvFCVdgYc7c7rTa19I3axMmNWGn/xJ7i+DnDiQSPcTWlUNvm8t+dPxHCJGKTsmdi
	5DzJxzl77JdCQrGkiYEI3FtxD/WQBGmBNQ3Rx0idWXJdv3d2I71Rc6gHnYM6JRtm
	xNz9e33mHuNIEISjNAR2JOvJqtfQvDVTU/mnQxywqYtEXyIt+wCv3aClpvcyRQmC
	LSlvFvnGXOAxFJ9bWYN+C9EqG4glFT/Lpu7myP3dcvoU+v86WnA4O8va/01RgL2N
	uxmTpQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr26t82cx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 07:42:34 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-903694fd3bfso3806426d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 00:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785397354; x=1786002154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o8hNYcnTlO2sEp+wOOaNROgXRLuhpC/AD2RNYMOE4VU=;
        b=Vjb/y4ahmXKxpafbYC6+1yMAG8hM1+SvYOGsnZdOzARbZLPe/AoM5cSx6wtJYNE8pP
         6B9JgEtprXg8KWCTc8zD+Wj8JCdEypzSRr7S0D7EJHnZy89QzGuCwiFPTCbt32nbp6iq
         VWefYidUvHbG8KTCpFzXr16zeDdmROOiPy6buD8ICx4vzz/evxH8c6G0nr2NtIftM1OP
         MWJ2gRD067bZSFzAaD8AsKSpnrGKB9xj932+RekS4Btaml3fvDFrDVy+L9aGaDm9ayxb
         lh+7nuC9uFbqxsUecwNkk9ldGFJb6naNOOspHsnaDiea0sAlRTtVsJRDy7YtCGPpDRtw
         UFrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785397354; x=1786002154;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o8hNYcnTlO2sEp+wOOaNROgXRLuhpC/AD2RNYMOE4VU=;
        b=nhFcBU0wUuo1Ho8Aq/FOKasK7r0AZs6puF0+nC5MkkABB4cRgnAC/VPC/BX6/O/iTH
         1LPjFsE0qHgG+F714V/a0sDi4kRjPsmaBeKsYBYQ+Oqx7mbV5vIXDryYbpQ5lTR+pjDF
         u0zsuTM5cJSXNhXI7YkTRY/h0ACkhcxOnYhULsWmJXF86NZu7vLgNQinTcmp3UV4HFZR
         KfUSCnNMPESc5t0H0u73Be5S61DQT770RwtFbjuyfx4GOqyQ3JsoDQz+T4NcOtbqvJIV
         awHhZnxVnVTWMqnjlKiqZ5W/psB7U3I231Djwj5QpGlJ3CipCIoJF9506mebgFvWzE41
         kE/g==
X-Forwarded-Encrypted: i=1; AHgh+RqyvKEVNqnJkCW8WEC7gN5ffv2VqI7ERHccvmpNvvNCZrnd4XLm127lW3x0i+etTRsBTYj5oI6/RLD+3yiV@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfh0pVjCVFs4F7Tm0cAeiZaNIlpns3ql3fRVlxRuctKM94OYek
	hJFkpgUmIE//aMHAY3CO+BWZITTcjEGQJxqQ8tmnOSw6w7VEIvOxKr5dROXtoM4icBWYuEsUv2Q
	5FvxyWiFzdtHipRHiogiuUfD+0whOD49sEMvdaQX5JKjahNawgpcrXCGDyVCzOKNc6M5C
X-Gm-Gg: AR+sD10H528Rjx2oDjNSEMXUxV++lZpLEJ2dl8f4th1Z49hN+K+U5dG5JC1Lre7NA8x
	P408Z9icF0V1nGawHFDoi30SNrm7uyZMx3HZnIJUkGrWv3E7BT+BdDy7wOt9b4+WYfLa2rZN3Er
	xXihxeNcKg8yUCRRBC3x4bcGCT9FJqS5NGJ3SOsIIkkUPZpR4MKx46LBP647m9HVGuwBeK8dELN
	SIdtYRHcDvc9+lzcAQLrOl3C6YUdpJpCMtdi8n7TyU7z8Q6ym5EMTkAgh+5lbFJm5G3D3DXE2Sk
	yB0TLrA1eaHcXnEddl//h7TnvNz1RO8CwIW4kSsfjTY8HL+OzTh/pNmm8Cc8xI1cT9LLD8svQF7
	rk2rZSzdaL3UBOKeuKnzJuRuF
X-Received: by 2002:a05:620a:a21a:b0:931:23a:83ca with SMTP id af79cd13be357-93486f06b41mr187325885a.4.1785397353701;
        Thu, 30 Jul 2026 00:42:33 -0700 (PDT)
X-Received: by 2002:a05:620a:a21a:b0:931:23a:83ca with SMTP id af79cd13be357-93486f06b41mr187322385a.4.1785397353313;
        Thu, 30 Jul 2026 00:42:33 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa851b322sm34493866b.7.2026.07.30.00.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 00:42:32 -0700 (PDT)
Message-ID: <9a042817-3a3d-4637-8df7-466ffa380403@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 09:42:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: eliza-evk: Add PCIe1 with TC9563
 PCIe switch
To: Manivannan Sadhasivam <mani@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260730-eliza_evk-v6-0-40ece2d33114@oss.qualcomm.com>
 <20260730-eliza_evk-v6-3-40ece2d33114@oss.qualcomm.com>
 <ofkvwrvfpyhjflrmbyi43gd4mltrqdmf3pzdvxwitrqshtttvo@r3xpfq3m42ha>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ofkvwrvfpyhjflrmbyi43gd4mltrqdmf3pzdvxwitrqshtttvo@r3xpfq3m42ha>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J7aaKgnS c=1 sm=1 tr=0 ts=6a6b006a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=FQzAjSPMhRWCFvqDWQYA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA1NCBTYWx0ZWRfX45SHIrEpXwFi
 9JkjP15LgkF8/SZo+1/BvebQQLcXrP2nQF/FoSZGdI91mVS95E0IqB3zm6i5oDncT51/6uCFWlG
 Gcmmtzf0Z0TuYjZiIHY68y7hPzN2dd6PsQ3omMXdVvSRo1/t3kwe0CjrUCguZA7Oe3OCn/eTCky
 PiIIhRC6r/LtChZN1KHfObpvcyonOrNW0UTBMth6Oj/RNnEzBF+himc1TL39rXz/nWy+NrZl/nH
 9H3YT36grBGCm8GWlkfNlxqgs6PsV2GtJczDzeUVoB8jlrfo6nRaGMSumGfaMS5fZsRnGjn4BUi
 pmEWyFG3N6inLc6kuOwNDHpcIbT/q9Yoj8wWmaNH97D0ICAbGWIjtLxLaSGSnoaHTTPa7J/xcLS
 AIWrGRbHtrd2npQzA9rcMCiOLnIqOppOAQ2B7alSxi0IDGKthTuRiXNQsXvtVhpm1DFjFjX+Y2D
 uBwuL5V+36gcw5RbwRA==
X-Proofpoint-GUID: fmSyBJHD2qAGLmwIpyAXFGlSBiCiYhWY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA1NCBTYWx0ZWRfX0A30Rf8rtlAy
 eDnXMl/J/EE0qBniy0Lgq+RCXRd2EmEOOvhDWjtLPM2/J9zxmOxZ3EibrZw07VK4WSfqW8rIO4y
 VQ40ob6oFaY1tXlBbZTqHT1Qm4E7weE=
X-Proofpoint-ORIG-GUID: fmSyBJHD2qAGLmwIpyAXFGlSBiCiYhWY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300054

On 7/30/26 7:25 AM, Manivannan Sadhasivam wrote:
> On Thu, Jul 30, 2026 at 10:18:55AM +0530, Krishna Chaitanya Chundru wrote:
>> The Eliza EVK board connects PCIe1 (8GT/s x2) to a Toshiba TC9563
>> PCIe switch. Enable PCIe1 and its QMP PHY nodes.
>>
>> TC9563 uses I2C (at address 0x77 on I2C4) for its management interface.

[...]

>> +		pcie@3,0 {
>> +			reg = <0x21800 0x0 0x0 0x0 0x0>;
>> +			#address-cells = <3>;
>> +			#size-cells = <2>;
>> +			device_type = "pci";
>> +			ranges;
>> +			bus-range = <0x5 0xff>;
>> +
>> +			pcie@0,0 {
>> +				reg = <0x50000 0x0 0x0 0x0 0x0>;
>> +				#address-cells = <3>;
>> +				#size-cells = <2>;
>> +				device_type = "pci";
>> +				ranges;
> 
> Sashiko pointed out that you are using bridge specific properties in EP node:
> https://lore.kernel.org/linux-pci/20260730051031.20D8E1F000E9@smtp.kernel.org

Can we harden the bindings here?

Konrad
