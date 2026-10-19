Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B844E5334
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 12:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792411724; cv=none; b=BIMWT3qn8W6eDL6kon4YNYagEcRdM0egVAfD9Xv5hPSW1kjP001NgiQLH81PcRB26IfrY0NYgwZeRYIBn03WBLIJz7wm/aRl9fMpIrO64AD8wAK6JsfFpkCCvNO8kVTJhB62ZwBkm2TAVnxoP4UyO1ALPwpqasSaVQtUIFgKEBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792411724; c=relaxed/simple;
	bh=CQ+LxFQSBmtnuVFJPPeu22Sd8E/FkQAEssKQRfoeiO0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DnVjCvEAIY3qyXkZ1TToViQLwFCszjbqgc1QksFf2Ak+7M5Z0CxhFWNfgpRFfDg0D7sKQXTXmvud0uD2Md2kU8X9LPE+EDDsdFO18SUfZi6MSlDKmdAtAPMA3o91JuZIzsOZSXv5KgsfPZ9w6ycWEyHXF9o2QZWiCLJ7Nb0UFPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F8YQzDLN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V2Jbyh44; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F8YQzDLN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V2Jbyh44"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OqPr3256585
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 12:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MPLcVEpabOhDQf+ydVhM3A3ikEBH8XfqoAA71Iezzx4=; b=F8YQzDLN93moeEZX
	KFLp9Pu4x3VfjGAFjDJxGm+FmgzN4G1bXSJKt2/YXvZT8WMIY+J0Cg/Py5wy48wH
	oRRmI7zzrmeIFP7wsLktFj6LOL7tnRkvLvtoXkjynydUqzHob8ynRMQI6qN/dgxO
	DCkNsIZFpNGl4KzbKI6g8sTMm2uj634y94kRlF1nX3FFeqBM8JLBISRVa1ZfqMM9
	I7gGu7bpjnGz+/D7Fvm7c0SgnL2EXksv/9d+MXjcWKGuXYdNwnx9/ApZUYjteqX0
	xBLwZ+yNLJTYmQ0jVGACPshw+guoFF7z0aTQ7eMwUVIO7MAjjHcsv1ZUk04s+3+W
	SJIVeA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3f8yyh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 12:08:42 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7cba2460f8fso40493137.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 05:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792411721; x=1793016521; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MPLcVEpabOhDQf+ydVhM3A3ikEBH8XfqoAA71Iezzx4=;
        b=V2Jbyh44pnPsArhAUcvdIKn4kbN1IXKzGXsZzPEvjLovBahKYZ4aYfp/a8JINvmANk
         XgznrwpPDdRAvUYsvSHiUwkOTOvKCUVuN2PAnfPGWzeTGvINbb5Hnc03klrRyVsZ0OVl
         Q54UE6lPeDBQL8vwytJQhSsinDYs+TfxcWMyDV4drFVD/fOOuOzDiPFkSW2aZp2uLukM
         ua0N2f/qFHW2Rg8upZrggRz6i0g8XakO+eQCOHKZMFNo/4UAiWCWfpm9ONqasIQz9qgV
         92nCBkEsCxPD+VFBREG59hPaMutejh9NwxGuIs7hk8+rGhrQMYCCKL2Mn8mQPIOuxbtl
         EZfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792411721; x=1793016521;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MPLcVEpabOhDQf+ydVhM3A3ikEBH8XfqoAA71Iezzx4=;
        b=karyZfNPhq0A/2v/uJDllWIQDVAHrmYvr0WTWjXtdF9GAmQvgwtmkIoKxhOuYSwQWQ
         oetzZkVGTi5UxvavV2bhz0XIj0nyg9bfZX7HqV8BBsh1jUwEoP0O4egg5WFNW2dg3kli
         lctnTRrLoqghbNkKUGQbCZMO9NkpQkGXFkSIjL1we3iNjOOgT7JM8vfo+oSYUGgz8ztv
         IoTMmV67gqmewUMyDY4yW5y0EY+GKwZpT2/lw12l4vhCW4Ny0TuEBzkqWozrBQ6mwpof
         6xrQfwQ79Wqu+n5XYfaJJiyZHIBxLFL++XXBM02IXpXPTqB3NaVU3aaUIUCwtIUGtrqo
         G1Zw==
X-Gm-Message-State: AFq9FYKROY70bEBxQj6NV4AKdeI2mfAKHaPLuCLdl0tAkF8CFUQdpcB4
	joinqYwacFm8jA+JfaP2Crc/KBSUWO9Z+ufSlDvLIVRdXKykPfMTYdw/8663WUXZ3UwcKkeWPFp
	NEH86POeqH18lYtkZXtZlQg/Vq0p0+uIr1Z4bcPR9z9KrYbvMoEah5jTW02uyqkAs3nyE
X-Gm-Gg: AYBFou10+Lb+3n0fDTh5QFjSNfLZPCCl+dvhImoJ825VbuoSgQ8boH5d6ALPvAObgcf
	u+NxH8XObuuyQJjE62JI8zjZOCXWYzU0z2ACUUXbg9IwnvsNv1xl+zeNJZMrSmTqvgCsR7DtCTX
	VDwW7wK0oyJJT7poWNqEy5q30ZAGguLV79AnGx5F6jpdO+qJ0M4o/B2oid+evar6dV6Zyd5Xg3z
	hOG3MvADwYhDsuybrvF2Uzc/qUESt+njPlWb+NamxlAsaxiaKv5QNQTSk6XWnbgb350C2zBKGdm
	PFVmtClmaC9Ije1+ZpHosXwE78I3TgArBtSQ/vx08UmMIg5DZKJ68oHXgeXx4FoK0OZeI124IHb
	FeJl2Q8kCV3xqbz2nTFomfw==
X-Received: by 2002:a05:6102:418a:b0:7b4:f1cd:80dd with SMTP id ada2fe7eead31-7cc36731b1emr1233394137.1.1792411721051;
        Mon, 19 Oct 2026 05:08:41 -0700 (PDT)
X-Received: by 2002:a05:6102:418a:b0:7b4:f1cd:80dd with SMTP id ada2fe7eead31-7cc36731b1emr1233382137.1.1792411720491;
        Mon, 19 Oct 2026 05:08:40 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32874bsm347024866b.9.2026.10.19.05.08.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 05:08:39 -0700 (PDT)
Message-ID: <f9de345f-ae9a-450c-bd49-3598fcfe3137@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 14:08:37 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] arm64: dts: qcom: glymur-crd: Add PM8010 camera
 PMIC
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
References: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
 <20261015-glymur_camss_dts-v2-4-e7b1f403146f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-glymur_camss_dts-v2-4-e7b1f403146f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hqLR-rSEHUkd9fFKP4YdaN8N-HW266rA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA0OCBTYWx0ZWRfX54HScK3gwKhO
 woSIzQeYhvpE8+V1ds9XxuccLTm9z0yJShPisUN3x2UoUnofnBWCqF0MB0HIkC9gp+fPOOv3iPS
 CywOwYq/H3jI1gbMc0B72eU7aF5hrwe33uKkNK31TYliLEK45DFy5ByJKHcpejJWjgJ/KZJQQMz
 6O32RMYxxPI/4BJjp5gqgqS+IhP0EkS45t/XGR2TAGEhQDF8BmDzPR3v12WmP9gebA0J3WfhdiH
 fL49j8BRsK3aAx8xctfNUgA2Sm1D3aOCgRMA3WBUhuMUjocpHudWxKmQmeQwzZsvQLi4iOA97eE
 mdh7GpL0bg3vh+cxTz+2AzSTIyY9dGdISRVKQFUdHJLJcpfoSTp7ayhzoKN1BoIH4Wl4dYQFMQh
 DeaJeWmYPGhgTjrpAYMOiM7bR7yPvwvusy0fJEz1ei26315Zd3NTo3/d1V5RVnOyDT6CX6s634V
 vDmbVWLkbmXX/UEIVbA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA0OCBTYWx0ZWRfX/p167guvu2Oj
 EozA5PIO7PZFXRB0fWGNmGKUuMtwXLqcgsfic5oYAEsdhk0uddrCTvvH+0ysD1pmhkzV5i9cS0c
 X2Q57xpYayZbwFl+CPsc4VUOixKj0g8=
X-Proofpoint-GUID: hqLR-rSEHUkd9fFKP4YdaN8N-HW266rA
X-Authority-Analysis: v=2.4 cv=OaANnRTY c=1 sm=1 tr=0 ts=6ad6084a cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Ere-zjln2nqZyYFjUl8A:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190048

On 10/15/26 12:52 PM, Nihal Kumar Gupta wrote:
> From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> 
> Add the PM8010 PMIC node with seven LDO regulators and pinctrl
> configuration for reset pin. The LDOs are needed to power the
> camera sensors and associated hardware.

[...]

> +	pm8010: pmic@8 {
> +		compatible = "qcom,pm8010-i2c";
> +		reg = <0x8>;
> +
> +		reset-gpios = <&tlmm 106 GPIO_ACTIVE_LOW>;
> +
> +		vdd-l1-l2-supply = <&vreg_l6p>;
> +		vdd-l3-l4-supply = <&vreg_bob1_e0>;
> +		vdd-l5-supply = <&vreg_bob1_e0>;
> +		vdd-l6-supply = <&vreg_bob1_e0>;
> +		vdd-l7-supply = <&vreg_bob1_e0>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pm8010_default>;

property-n
property-names

in this order, please

[...]

> +		regulators {
> +			vreg_l1p: ldo1 {
> +				regulator-name = "vreg_l1p";
> +				regulator-min-microvolt = <1200000>;
> +				regulator-max-microvolt = <1200000>;
> +			};

Shouldn't this be 1.104 V?


[...]
 > +	pm8010_default: pm8010-default-state {
> +		reset-n-pins {

Drop this inner node and put the properties directly under pm8010_default

Konrad

> +			pins = "gpio106";
> +			function = "gpio";
> +			drive-strength = <2>;
> +			bias-disable;
> +		};
> +	};
> +
>  	sdc2_card_det_n: sd-card-det-n-state {
>  		pins = "gpio221";
>  		function = "gpio";
> 
