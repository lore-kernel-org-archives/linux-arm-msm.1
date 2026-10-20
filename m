Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497547;
	b=T+/Zqtk9n4iVa6XyI9hF5FRqlPs9Z+eKahIqYL6Ty3/zy1ZRZx/9QpgCdXgukUWSvIf/
	 NR2DCvE1MF7lf2mrXF/7ZN8Wgt/Mo4mnnRp/RzBL7pXmGn/y/r2d+gRZG1emIQQp7vYN5
	 cNdKXBUnDZWPkWLZHIhiyIKH8b0rhzSkrRhx+b9Edg/wpL2jtgt9lcw4JhzHt4BGRrqx1
	 WvjrrCzz3EuMqQS2yLKxRleDkBWBOIP+FpfFT3Xr+pAdLn7jrawe4TzgndO66gRQkkZ9M
	 idxLKMp4FRYujQNzRWUU+U8WWq1Nb6ZJ40FKdslRm2ml1gzC0AvpruurWfwoQLduPHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497547;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=B7B0ogmG+yI8zgy4iQeMNyHKfdE1d/1H2LE3NA6bm4I=;
	b=Zd8b6lrHH9CdL8LUjIeWFqelWpL60XQhzVj8EwCiw9KAWNwUkm1+JbC/v8p5fKjOoGrU
	 WOVdP4hyefIybsfNJuFLAcKXcqq+G60jaGWAnV0ui/X4KjxdfRYk2O7I+rzgH78eEQGPU
	 UtLUlja+PbfCbZv7P0F36gHB3pEJDrnwBdgVb6MvCE6WNuQ6j/13n2t6qR486og6/URIc
	 w7w/CTYebLAW4hDRgAmBBtqtFUuGCW8b0C/qrFjva3eCfSRZwrIFEoGt/+dhN+UpDd1C8
	 +B0chUYGtjLsXRfN/aLwi/phN0VpV0J84q31HGZMq3fLt5YHCHIDihMZL9kxd3x+ttg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CP2iwbvo;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HgGCpnxE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF1660A263D
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 11:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBF1660A263D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CP2iwbvo;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HgGCpnxE
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAx3jp2562780
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 11:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B7B0ogmG+yI8zgy4iQeMNyHKfdE1d/1H2LE3NA6bm4I=; b=CP2iwbvoj9AxplqB
	XtEYnOAUryPZSXQz4b96sLKEmHLqgy49V3FSllEBqwBhizNXO+xoEJBm+/bkr0W7
	CCc7PrY5HGU6jL6GUxJ30LcaQFSiggwWq2ll/apkteFfT6rXPts1PQN/9dnF9OtM
	l6NH4bLEyOr758vBG0QovrfpdRgPMfQrGn5LmKDxbtqBV3ph/H3CvAAa3yOmaBXh
	+LyksrSIHbFLC1TiaJP1fKYAsG/SAmDiRuo0jm1CimGtqPy+HQmVbhm1MmBBhAIW
	8AhZgXdKY7PxKoHn4idEsUwoSkvA+bd+xW+B1PCq0TeIRgYbYPQc6WaV8qu031Wt
	/qctwg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5naapb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 11:59:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5362ce9df1eso4038661cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 04:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792497545; x=1793102345; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B7B0ogmG+yI8zgy4iQeMNyHKfdE1d/1H2LE3NA6bm4I=;
        b=HgGCpnxEBhkge1Z49EB/vhEsdhD5eMkHr79IrTXLfgO8apUtxkGbp455cpaRctktyD
         ymHeGB3N9kFZ37Mtzm09nXf4I8i0yXsIDE6+fWIs9SmhYwG1KM9cnYQHwj8Y8LzwMt3I
         DWT8CL1Xe0IkNfZ7itIcLHXMcozf3fgOcXypUR8FDhZBYgkKN/rZmhnoguPZ55ZFwK0o
         V4aN5R19CJ77J77Jzrr1CkZA5z+JfuFX+jYwgMtrXy46qUiMu8tnA9IKrhGsnG2nURMR
         g/3xNcasxFJ/kngRK7oIG1fm/ETOtEKol8tOfgi80e7dwAsqgLZBXza8REu+azigZzsf
         GS+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792497545; x=1793102345;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B7B0ogmG+yI8zgy4iQeMNyHKfdE1d/1H2LE3NA6bm4I=;
        b=JP11BUC39eGkqQv6j0paLfxXtIc9dnTNMVMkx0/ZAUilr5VIQiPANBMHlsNQn96jx+
         DVokEYL0vyasfbazlOP8ExkyUSx3TI/yYiLAVWPZ8pGARsdRIXe9EGUFBwhu/MiFU57N
         +yGdVpN2TM5orluLK/SD0+IxW49YqGUiR7wy28YkV7kYaGEThpAcOtjkFKaTtOKpFKDT
         ODZLYmodZh/vRn2zpJiidqfqtPn0qZi+OBEwyIKhfGB1Ex/8sJyX9YJ5C93AGvqFYPAr
         BWAAecn9vbJ+XP/mZOkTDeXHjTI6NJCSzDnXc6S4js4hpAPzgjsE+RhJaacF6ZYY5J49
         mSfQ==
X-Gm-Message-State: AFq9FYKw5NRcVufuFiCoyYmnuM7SlzTU3PiyeoYq6IcJuRzE6V/wrj1c
	KmvR6dwVSS702vhGgpl9jjeoq+VQ90M1STLycz3n5RcWFQUN8s6w1aBJO/s4uE13TCiuifBbINB
	B6UdCZSxZVCsCTdgYhBtCZD33INSepBFln3dq6/5nvv/DW5mOSJ9erfZHvZhyn4HXMylC
X-Gm-Gg: AYBFou10kYXtgq5cTSgdU3C/yM1q9Gd95fYHnhJQuL8H3OVWbZJckV7fcYpYflzkEUT
	T2sRJx/tYAAPcL4Kx1WGbZZMVlxtBWrF85eb96uC2Qlnn+0IgMlsElcRMQ8cGRoyxDCNpRI5Rw7
	9hlgTCJmFamXatnywNS3fK3f5J7RB6Doy+7Bq8AIKtDZXE3PmrwLoui+gbHVJIXxvcq2Zz2Z+qQ
	UsyXfc09ZivCZ+5KUuNEZ47xVaHuWNSy8zFhoPYOQLL//BdXt63qpPT0g+eXYErAqqJbXXL3hC0
	H5KVksfYcU1RpekuzEwA8dis327965NAUuAMkEevdsfIJYmfgvu8qWk+Hy6uQTJL5LFDL2Wb0J4
	rgOCUyprxwE9AzIBNUCj5jw==
X-Received: by 2002:a05:622a:411:b0:535:162c:2e81 with SMTP id d75a77b69052e-5364616cceemr192543721cf.5.1792497544947;
        Tue, 20 Oct 2026 04:59:04 -0700 (PDT)
X-Received: by 2002:a05:622a:411:b0:535:162c:2e81 with SMTP id d75a77b69052e-5364616cceemr192543371cf.5.1792497544441;
        Tue, 20 Oct 2026 04:59:04 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c408e32bc33sm476375366b.5.2026.10.20.04.59.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 04:59:03 -0700 (PDT)
Message-ID: <372be891-fa8b-4d17-a9d4-2d7becf1ad8f@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 13:59:00 +0200
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
Subject: Re: [PATCH 2/2] arm64: dts: qcom: shikra: Enable CDSP & Modem cooling
To: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        gaurav.kohli@oss.qualcomm.com
References: <20260911-shikra_qmi_tmd-v1-0-96c1cca82f30@oss.qualcomm.com>
 <20260911-shikra_qmi_tmd-v1-2-96c1cca82f30@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260911-shikra_qmi_tmd-v1-2-96c1cca82f30@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: i7WoJyJKbvSSKA_ZtbcS9bsoE1PI8UHG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0NyBTYWx0ZWRfXzGzoz52e4ezM
 83oquozZ9LMxCDPe699kmp2krRfPCestIxzBVewuYVJZzIUSrhjzZP5Kw/szk3vFS7l180q85Fx
 t/JYSghTbeFWPVsBnGoGJ+uF87UAdreNHzRLAnbRt7a0QNLPaY5fFIJmePEmBaVso5buyX4clli
 P+tXh94MLWR20wCQIl9iO6XnO19wx+HBPIXMb/uM0+4ocDH7NaB9vgLGoC6kh1uIEICQWt+kwLC
 fD+uJao0yRpYMDCmoh0K6yRnhpVgRyjTEbMOsi9PJ6NMeh9DQv8XRbdwSj2x4oBLQQyW1V3bUAv
 6O+s9dAM1Dk26afcoLeEMOGqADFNOBvzUzs2NNa3uT+eEPs+tCNgxFuY2EW3dU4vIDdM707Ct09
 95czIqZ2SjAiNSzJMahjQti2ftSAtwSwOmKTsSQjXVJeDvsndOwMALv6fmucgYNsRsE7eUUF8Jx
 hi4FwvoJYem6AfDuhzw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0NyBTYWx0ZWRfX7rO9zrVyFrKS
 cIQyh9xWmpYPuHgHFjhpHACYZ4GtFq2v8A85A/4Y4aE0dLfLbPWVrhWYHeh3cTvzFKrjlWJS25i
 15xuh9QhZZfMzKBIvSRbpjVwwvnn3mE=
X-Authority-Analysis: v=2.4 cv=VI9IDNPX c=1 sm=1 tr=0 ts=6ad7578a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=2J1e7r4m5WDM-kp8FRYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: i7WoJyJKbvSSKA_ZtbcS9bsoE1PI8UHG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200047

On 9/11/26 7:03 AM, Dipa Ramesh Mantre wrote:
> Unlike the CPU, the CDSP/Modem does not throttle its speed automatically
> when it reaches high temperatures in shikra.
> 
> Set up CDSP/Modem cooling by throttling the CDSP and modem when they
> reach 115°C using the QMI TMD cooling device framework.
> 
> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
> ---

[...]

> -				nsp-critical {
> +				nsp_alert1: nsp-alert1 {
>  					temperature = <115000>;
> +					hysteresis = <5000>;
> +					type = "passive";
> +				};

No "hot" points? And no throttling at all until 115?

> +
> +				nsp-critical {
> +					temperature = <118000>;
>  					hysteresis = <0>;
>  					type = "critical";
>  				};
>  			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&nsp_alert1>;
> +					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
> +							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;

Please align the arguments so that we have:

<&foo bar
 FOO BAR>

instead of

<&foo bar
FOO BAR>


Konrad
