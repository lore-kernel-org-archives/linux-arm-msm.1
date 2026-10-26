Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792991973;
	b=oHn6mhba9cszQ/CvOJM4omk+r/odPLadATGdKwrorjaeZnBB5tqMBn/GpAjUiS3qrUAd
	 fw+5UBaZLR7NsM6P418Kp3VqhHdwRtSDzJ94T0fLWE86Hdz52Veh70QVwLGnHwuGp9Akv
	 eQCRBGit/BO/Gsu+WakTDz09oNAPJB/MsttHQiP//KSNPyr6ftc7sxf3GJwJq8BoZxq78
	 n6bd2kHcuHAfETbg7THez983D9M55v46hG/fnv4cun9XZl2f4dxA+0RPlCpfoL0p/yohk
	 Dm8kZaGCFtYWrqHBEhMEUHlTeumcWHSUKUFhFMNuGJInTYwpfmpZ4NftyItwqPOoWVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792991973;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OHOM8Cu7CdWrDvbIao5t5J+yLFREYpGZJ+T5gds31o0=;
	b=W86gTBVVmvN6G5XmghPmfDyNMQPUYUVUypRM+Gce3Pwm4+DJDBzVBLoe8DB96M0dULpK
	 wcUmCux48HpymJN3coJ0q8vh5KvIr8JEol8eN8WSQ+Us5bmnr5JcpGm+aQ/rnnZix3h69
	 V5f8jax84nK8f7FW/hDhVAjvcrWdaYpw9aGP2I8n/aHcS9aMaiXIlsjA8zbwyjGaKnBPF
	 vVVJ0IGFx2ybWJ6p6gOb5Zvbva5At6xP/l7jic5lOkeTUxXL2s7ja8YPQEMRaeOlfrVtU
	 UK6vFkpGdZniswso4aMwuxXc3jsJ7B803mqqAwz9imQWYv+uBkSskXaxx5AdK26DMnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FAvxXeJT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TpzJx7Fn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9811F606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9811F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FAvxXeJT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TpzJx7Fn
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b7vY1907915
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:19:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OHOM8Cu7CdWrDvbIao5t5J+yLFREYpGZJ+T5gds31o0=; b=FAvxXeJTkmgLobHK
	V4DG018BE55SPh9JT+LXRr7nDfgVUxBpmnWfGGp4aHj6y+aYGPsi2X6stGLf0yTn
	J0ifJiZ+MuQxO+nlb88zJgKtjp8UvS+NeGZwn2Yxtwjj9RPuC2SlbYKzV/sfZzNz
	U+vPwS2UaLNaze6Ufmpi9E5CLd/lHma+QLwagSAS+P5tqSYP7CBzrRnaGVBIWPZj
	qZHdzKJa/yrNT8CRQvhd1nijXRfjpGdo7/D1ku/DoaGB8p17044GoYlGEZfOCee8
	kNS79AqL8IM+Zs9ipz5sdWlHz2R6S/N55EwSGOkkZI8nK611ty3NGEAecaanVDGr
	P0IFzg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm0gmxet-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 05:19:31 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-169846a19aaso3614703c88.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 22:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792991970; x=1793596770; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OHOM8Cu7CdWrDvbIao5t5J+yLFREYpGZJ+T5gds31o0=;
        b=TpzJx7FnVHuZldFTkR2JGkcpiAO5ue0fPzgO+UuGlUZ3c5IOogd4iI+sxzeWfhmeiP
         7NqAp8pyEqQBSSMs0SFEirICLeMOMFBGG/wjehNH4RNcJElNKgddbamNDKAVQzYgbtkX
         G3AWpTZgSfIca3Sd32+6RzYg0+XR0+g1FVdLMbtwXPN5WLEV5CZ9s+IrOyQkFnum3W7c
         Gwa7jPvdS30GWgtSEIQ5cG8KVJMudLjtqAmCdhkEuq318UUCdYPk8vB0Evw2/fQNCuav
         JFbpb6vmXTTnCDazWM4DlVNAIMhGIaod7mtHIPSs2ABkcR+QydJE9F5GqJ8B//Oa4LaB
         a2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792991970; x=1793596770;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OHOM8Cu7CdWrDvbIao5t5J+yLFREYpGZJ+T5gds31o0=;
        b=g7mwZ+ITaWlffIr7t8bAUvXfqibRjrLTs8HnnuTU/VVAkw4gXW3Wgry60crrQzPzeM
         crIPwq6ul+ub2kForh15VFfjcmkV7baaDP9RwbgKMrnkir9fqiDngIf6ex0jFf+ctH39
         sFntfWKa/tq+y3aOhO80LdPSlOTfifYfkuX0460fzWpq8LoWSuROey7ujU+QWI8XFjP/
         dJwXnM4L1NAzqN8T1/uEVr7mbVob3+cGFRWJrhcz7iwVx12hcBoF+eS7BHauSVTI9S3I
         XqS31nCTFPMxje4t1jjhQaAGr+37Jm2XY/UdUAb+DB08a3rAhmP+OdTKdGd6Jw6nJ0d4
         O8bA==
X-Gm-Message-State: AFq9FYK2NBWQz0PUaESHXgyvdpgc960JObdpj1DXB36am75iInUKKv/A
	6OdEAzVF43Fssy/RhdDOKSrlvvdl6gOjTQz2rBrjxQRNHcaCPCgFrZdZUXMJMOk8FvgGK3zd00K
	YAPNGY63k6ThSPAtWtb9J75uPqtGfqXRM+rx8LBSYYXY0AiPE/qcKi0vRR0GYTVm/kRCr
X-Gm-Gg: AYBFou2LGhZTRfRz0gzV5q9h4j9S3wWoYAVKmMAYKqHb32dnGq0BV0BBHErWHTYB314
	7Qfk3pegxviBxUY56zPsR4D77cxG8ApyEtZU0gbXfEuBTy7mxY+vE+wWpeJhuXJrFnvuZyXKlhF
	B9Vi1hKw5aZ9+2UZojfgWeIy0S8eMNuJziHuSyeAYaZOCAd307V3TlIJAc4mjiqwqbZFMUymo1z
	jtsFz17f3pjmQRk9ZgSXFYZlvcUANLrSYF0QCv8smzXXnCa2M7T6wg20XDuNPo/UBfXeq6fdQAf
	i175ZJheIOfDr1ig2s2w4NR1rNefVMguoWOzbU6P+5hzl718hLbgpNiRT2l4MMogoxecQwxVwEp
	L0Il4Tfmb0UVOOpAhKJtZ4XZLsLtl
X-Received: by 2002:a05:701a:ca0b:b0:17d:7b45:f91f with SMTP id a92af1059eb24-1993580fcd2mr9596182c88.32.1792991969969;
        Sun, 25 Oct 2026 22:19:29 -0700 (PDT)
X-Received: by 2002:a05:701a:ca0b:b0:17d:7b45:f91f with SMTP id a92af1059eb24-1993580fcd2mr9596126c88.32.1792991969030;
        Sun, 25 Oct 2026 22:19:29 -0700 (PDT)
Received: from [10.218.7.34] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-198a249c331sm45504857c88.17.2026.10.25.22.19.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 22:19:28 -0700 (PDT)
Message-ID: <9d247a5d-5afe-4b57-997f-b6edf6d0a3fa@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:49:21 +0530
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
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: glymur-crd: Add PM8010 camera
 PMIC
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
 <20261015-glymur_camss_dts-v2-4-e7b1f403146f@oss.qualcomm.com>
 <f9de345f-ae9a-450c-bd49-3598fcfe3137@oss.qualcomm.com>
Content-Language: en-US
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
In-Reply-To: <f9de345f-ae9a-450c-bd49-3598fcfe3137@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: u1ErnYcm82rdrYG5hyvlLiAg50EMoGp_
X-Authority-Analysis: v=2.4 cv=UfTE26SN c=1 sm=1 tr=0 ts=6adee2e3 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=IRdjy-4fp-2gG-jZbTAA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: u1ErnYcm82rdrYG5hyvlLiAg50EMoGp_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyMCBTYWx0ZWRfX7BElN39l590s
 pKaCdWO3PkLhk/8o1jSjWNh5kl3gl1HwQaswXpt+e4ja4OWQgWm3y2bkVTlyGJk3cqYGuKjRXZ7
 +U76gv95vA7UFIH8cA7MewNYjJ1xojCBXX/R7zsHVg1605r/nGWlUKw+Kea37cXMw+Raywsorjj
 SK6iG5AToXEUqftEQgTvzVsYAjTE6U+N5/lw/pV+fVqCUFOE5dc/9KgsPW03fphlDfbYAa3PsA6
 lurwD3ZABKBT1VlHXmlkrXeGJMglAOpM1n09GrAo1GtU3Bkk7AtkWCFSdXCCmfbAu0zhWQsD1xv
 5k1UnYH3WcvQh1sH/QjP4JNtN+X0IgWayYrTFFzaRknuB1F2Dqtw3SwaN8Igd3LPBnJYaE8Dtrh
 qY7Rb3JdGuxfYj0+aHUhH/V1mlS+g7XckLQLgRq5BwoCxM7ZqpJpcUXmB/6OBYWXfwfmDn+eo8R
 /6phTLfDVOpxsf9Nqnw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyMCBTYWx0ZWRfX+fAPQy63KCUJ
 Vg+u5yIeyZwVowFduUXwQdOR80/MLJhxHTEVmGXi6dFaJyjvc6acnDNw/5aSOtg5ZGHT9Vrw2CM
 O/bszi4hHAre+0vBDa5ZPSo3yVSCt38=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260020

Hi Konrad,

On 10/19/2026 5:38 PM, Konrad Dybcio wrote:
> On 10/15/26 12:52 PM, Nihal Kumar Gupta wrote:
>> From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
>>
>> Add the PM8010 PMIC node with seven LDO regulators and pinctrl
>> configuration for reset pin. The LDOs are needed to power the
>> camera sensors and associated hardware.
> 
> [...]
> 
>> +	pm8010: pmic@8 {
>> +		compatible = "qcom,pm8010-i2c";
>> +		reg = <0x8>;
>> +
>> +		reset-gpios = <&tlmm 106 GPIO_ACTIVE_LOW>;
>> +
>> +		vdd-l1-l2-supply = <&vreg_l6p>;
>> +		vdd-l3-l4-supply = <&vreg_bob1_e0>;
>> +		vdd-l5-supply = <&vreg_bob1_e0>;
>> +		vdd-l6-supply = <&vreg_bob1_e0>;
>> +		vdd-l7-supply = <&vreg_bob1_e0>;
>> +
>> +		pinctrl-names = "default";
>> +		pinctrl-0 = <&pm8010_default>;
> 
> property-n
> property-names
> 
> in this order, please
> 
> [...]
> 
>> +		regulators {
>> +			vreg_l1p: ldo1 {
>> +				regulator-name = "vreg_l1p";
>> +				regulator-min-microvolt = <1200000>;
>> +				regulator-max-microvolt = <1200000>;
>> +			};
> 
> Shouldn't this be 1.104 V?

Yes, you're right, I checked again and I see L1P and L2P should
both be updated to this.

I'll address this and your other comments in the next patch version.

Thanks,
Jishnu

> 
> 
> [...]
>  > +	pm8010_default: pm8010-default-state {
>> +		reset-n-pins {
> 
> Drop this inner node and put the properties directly under pm8010_default
> 
> Konrad
> 
>> +			pins = "gpio106";
>> +			function = "gpio";
>> +			drive-strength = <2>;
>> +			bias-disable;
>> +		};
>> +	};
>> +
>>  	sdc2_card_det_n: sd-card-det-n-state {
>>  		pins = "gpio221";
>>  		function = "gpio";
>>

