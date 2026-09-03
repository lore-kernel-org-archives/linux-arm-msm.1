Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DED1469830
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 09:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788426143; cv=none; b=DCEk0/zolm68knA/JAG0XJUQIOLU1PAmu2ZL9jX0hpQucVRglyRtlBS2OSE62bugTwLEpwStkRV6xRYS0T/yG5y4I4Q0dkgZRzKee6/M8VusQC6xsp+CjFelrVUTw/zquSQdZMQFIWF2O1aGHkSu4zqa34PCyse3xx6OhKyrf/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788426143; c=relaxed/simple;
	bh=xy8aNWgnRdRY1DlWK/SxqljKRpkWft1mvEFWwBjDRBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rD0EamUh14ZLlbRJh6zPXm+Hj+Ir2hBUAiNLyChr0vkP97ZVqwmUCdip3jYkV0B8mPKgEoI5RB+l8Z4y6mPCVcCd0Xe71ST6KRsPPHXz8iXWYcDc/k4y06XGisdl91irq8FlSPGnRMopuBamCcJX0QEDZISiIDTORf5+mBz3sd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C8cWCKc6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A0jwzaIW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C8cWCKc6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A0jwzaIW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68392DFh3612605
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 09:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8KYmof0zRRoEvEt1jE0okMuXN2Lk9B5rQ+5AqdwNXGI=; b=C8cWCKc61Ft9Yhem
	nFhK6b4/VPHl5oGbuLcKXnF0W6iaJ+x43knEjYXdaxs/SpMVThuyXiNxsp9D/DMh
	xYsqAJfWsu3G/DB8QshstYvP6aQcCJv+TciEfNug3G3L3iX3lhZM+1Z+fgA6ITd+
	wHhtGZhdJ7Nu9wdhjrMV3caY0kfgdBwl8AdpJpILdN8bCM04ro/8xexSDM2iH+iu
	df9nLhHVfJ+G6H5Jt6B4W3LuWWIHRCYA2R/iy427iRvMv8sx6hsfS7ZaWv0d74Ke
	RsuGofUSV3N8VnL7em/TLSCRjJiNQhuFdwwbRo9wxErUtBucVRWPqFwYyXME8gnQ
	71MstQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf5pdr21u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 09:02:20 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7530aaa7212so95982137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 02:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788426140; x=1789030940; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8KYmof0zRRoEvEt1jE0okMuXN2Lk9B5rQ+5AqdwNXGI=;
        b=A0jwzaIWEbI915hxik49VWLmjv1L0hh9Xc2Ca6tV/D0gVyILoaO/AMGb3bAC+2LmH2
         doPI/NiKcZt8uLyZUz5qf5NyCG6IPt+pofuKgGta3H2zcvpdg/uQfk60v5nct05mFExP
         FVkL9FpFleTut9ASDswtk52f/MhrX27TQaG9cZMLawLzExDCZNMysL6//K0XgclyQVDa
         ritImXsRx+EE8Tt6KiqFfMt4n+eVKUQUEFVX2xleAhXm3pOaFI05foXIhnOwwaPnpR85
         qVlducE6h4mVK/HYYjxUOmnYx3GEf/hU7HVqXpcdcMXPjTDej3pWS5JLATpmlWTCVZML
         xS1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788426140; x=1789030940;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8KYmof0zRRoEvEt1jE0okMuXN2Lk9B5rQ+5AqdwNXGI=;
        b=dxl5OQCcGnv7QzRAONSARAbHMyki5dJDhH8pL4t+aMy/uKPvQQte/4BYlBJQ75zQV2
         zjs7UbHwnEvEBrMXMRox1y5ONPRlokNm7Z8acsbnDtTJEJ5MtscSR0hlpQRMTj1y1tV9
         CnztOvjXdG5TkjO1Hg+/TgHdNgDFSlBHXEs8oegPdRHLfJ3bmOIfZ7Dy3+uRvAgEzki3
         nPcoDGf63BQQAbPTqc0p006j9Ki9RVRzK4YB5A6W92bmL4BXRFgUYZ1XxblxoEDrFGJB
         fWm1s6av44D/Pk6MbshdDrymct6ePJrByNLl/nRLEu1PGcMwf2uGv/KYHTuK+PQyF3mE
         FiWQ==
X-Gm-Message-State: AFuF++mnMItTsHJokPYoxdOnRYf+Qjok0aGrz+d3WEopI24Fwr2xzsI4
	9Fk1cV5pV+OjcCcma6+U3x0fqFD9totymz8VMXf/ykR7oIuJ4iPJRcoO1Bt2KqEJoQouZvAFuWg
	KcGM/30eW+XOsjj6lGxc4MZOsPJL7B4JCTGaGDfBeDBWOay3PnqMkbXddG5acSqa2R7JT
X-Gm-Gg: AYBFou2KsA8l/MwhM1oYOOZ+TVCBdQcpbGh7J3Z4hbKspSEg5VnQLzhCuRU/C2rxBkD
	dl7jEuQ3GG7lUKpKGdrxQ6ycUEXIlzuZHqVEe2zCdSrmQ8rUG6OEE+yZNTX0L48gPf+jS6S3c4V
	hAf73D8f7qsSxevuUY689e0nHaPK9a36S5v1PEW6knKFE5k7/6ZQei4m657xbSTpKsZLrWheJTk
	cB7W7M52fg1+4Y0AxmNciHh1KDxqo2BZ2nzeukWKG0FI208ze8Z2Dcnm4JIRPLbjNRz0+Dp4igN
	3xCE/zT5edJAVA/KplegeO4w3JVIuF7CrQe0CtLFoLyAmgztylDrqX1Lk5rvTlehy5dyM4vKLmv
	RdBXn8WAuADD9b08HTQJz7A==
X-Received: by 2002:a05:6102:510d:b0:780:6fc7:2181 with SMTP id ada2fe7eead31-78a1f68e0d8mr1655444137.2.1788426140078;
        Thu, 03 Sep 2026 02:02:20 -0700 (PDT)
X-Received: by 2002:a05:6102:510d:b0:780:6fc7:2181 with SMTP id ada2fe7eead31-78a1f68e0d8mr1655435137.2.1788426139512;
        Thu, 03 Sep 2026 02:02:19 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f4172032sm67248466b.22.2026.09.03.02.02.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:02:18 -0700 (PDT)
Message-ID: <9612eec3-dd70-4ad0-ab4e-d90c921a94b0@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 11:02:16 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Add PMIC thermal support for Agatti
 QRB2210-RB1 platform
To: Raj Aryan <raj.aryan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260824-pm4125-adc-thermal-v1-1-3b67ef2eccb2@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260824-pm4125-adc-thermal-v1-1-3b67ef2eccb2@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3NyBTYWx0ZWRfX15Yb9ryDoX5P
 jn+Tqm9zxREzxYLz2d7aZGLnynqOBQ9jCmLumjTPaP6dB3fgdi5tA2OzvJOHRDnmAmxiZiRl7y9
 KBXI0cAOeTFL9XlqPAdg+SpPviQAivA=
X-Proofpoint-ORIG-GUID: sGOhwOoW2jgZFBo5RvV-kn7nKmldesfM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3NyBTYWx0ZWRfX1d8LQdW95w5E
 dZyVT+vu/9LXgi8cZaJr7fnklNuv+w6hgDlXuLFopn+anh0oDv2A9Og4UVmhq14B+xjqE0nzj7O
 EWqs9pQCtu+Je2j1J+8mjRog50K2iL7uwxIIcYPRYdojzp5quRUlY6TxvMyAPPQ143w2WU9FTMD
 If3GuPtbso3PMcSTxgA5JomJOI/ZTlYtlA7QDGurmk4xGyKGzNMAyRPT4q+z23TwIVNTsRNLLGu
 y3A/ATGL78mzVkwmIPVMbtgtkJY9S2pD+tPVH3azIAOGPCVSjShNlUXr2a8vIlyijhwhm3JeNac
 bWuyzCrCIDXYqfurfV6XB62J4U24URQ+tnlw39TJCjDm7BAm430eb72wnq68QBSFftQwNc9K5Kz
 amY4dENt8Eoa8VrZoxxOoGsexG8rnClw0ia+SLbGq5sCrFUEKzbEXFYozKtKrWWUzByVI31G94Q
 OdO71S5t61U+HZem80g==
X-Authority-Analysis: v=2.4 cv=RsL16imK c=1 sm=1 tr=0 ts=6a99379c cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=qI3sZz0o0dxpMlL5iVwA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: sGOhwOoW2jgZFBo5RvV-kn7nKmldesfM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030077

On 8/24/26 4:49 PM, Raj Aryan wrote:
> Add ADC channels for msm, quiet and xo thermistors along with
> their ADC thermal bridge nodes and thermal zones for PMIC
> thermal mitigation.
> 
> Signed-off-by: Raj Aryan <raj.aryan@oss.qualcomm.com>
> ---

[...]

> +	msm_therm_bridge: msm-therm-bridge {
> +		compatible = "generic-adc-thermal";
> +		io-channels = <&pm4125_adc ADC5_AMUX_THM3_100K_PU>;
> +		io-channel-names = "sensor-channel";
> +		#thermal-sensor-cells = <0>;
> +	};
> +
> +	quiet_therm_bridge: quiet-therm-bridge {
> +		compatible = "generic-adc-thermal";
> +		io-channels = <&pm4125_adc ADC5_AMUX_THM2_100K_PU>;
> +		io-channel-names = "sensor-channel";
> +		#thermal-sensor-cells = <0>;
> +	};
> +
> +	xo_therm_bridge: xo-therm-bridge {
> +		compatible = "generic-adc-thermal";
> +		io-channels = <&pm4125_adc ADC5_XO_THERM_100K_PU>;
> +		io-channel-names = "sensor-channel";
> +		#thermal-sensor-cells = <0>;
> +	};

I see the SoM also has a PA_THERM0 thermistor at AMUX1


> +
> +	thermal-zones {
> +		sys-1-thermal {

Please give these meaningful names

Also, the XO one can go to the PMIC DTSI since it's always there

Konrad
