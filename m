Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483413;
	b=Gp1IqFDZbm3IgZqYoRP3QBdWU3fCpwOAsH5keC+OLYoo8XMGsay8SbwhKV08rDIEa/ti
	 v7BofiSz0xOUCpuj3TX5rAhWZtCpvJUM+TBbbsu2FsKafi1qaD9c1u972pKMzk7cldqoz
	 n1p6+HEK2QOPTmNmaSWFOmCQwN+VCf/op4LIhugvkTAasZJP/Hci8QrVabv24khZCVQ7v
	 hXDuaxc6MxMW3QM2rCdeVT0Mo/QcG1AjxmUSViwgWyGuSi9/WoeIdR5ZziKi3v0F0Jv0v
	 CD+iNhnop/d1pct4GpsTnotTWZsw2hIzCdKzYpGYtR4dKIxfxmWLM2ZkXOZzIj9ChSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483413;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=f29Q3ZfnBob9EdezqKkkesN/jdQEI8id6w6S8zkChjY=;
	b=WLf/cfBp01SHxVuUd7d56+JAPi+hZLYP5GdwstoA6L2nHxcnld9+SNmb4WAG2UVNKQfC
	 N2V89YC/n1w4NlpthKNxdZv8/r6EpOUzKwc/P3Utml5v7hw2VEs5m+ezSNNGTcP4MtpjO
	 McJ+cbT2R4OOpaeDkpGg4X8E/HbaP8f7mrznNTaJ4G+P/qXQQwSMqBHpAwTCpJ2EaswPo
	 dVO3UgIKOG3HEeJTbdnLVSrp6AA/S+SV+BLSJnzjey9Gkw9yrYPkPOF/toipWoBBoortq
	 P/jNejfb69WCUEwOUmkfBgl7ZgCAAqVB5Gffl8Kzycsn2h0Ryqg5rSXEN0pBW0UHL/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AwIW49qS;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="Bvxih/zW";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96298606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:03:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96298606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AwIW49qS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bvxih/zW
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K65sJW803528
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:03:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f29Q3ZfnBob9EdezqKkkesN/jdQEI8id6w6S8zkChjY=; b=AwIW49qSYs4fGCDL
	VwFeNJDN7IHzBkHSnFSTpR8xzs+O9CbaFMAA6TXvDlQxZZ+5VrutOEkGYwc09Yi+
	ynaGEduK5MdNSy6n44A68TTi5B4TTaVVrs1n1AyBlx0z95x2z+IYVdo5PFQY4pp3
	wvPwf9tC6NpfcbVjId4CC+TV9IPERa3TeoD3ZNgyaDf7Pwx94LoEUZ5AI0Aux8bg
	wWNla66lhwhxS/kc0mBuE7tLF8qPeMr2EiG1WRXTfTq56NcKD+j6T3JfJYBToBKK
	b9lzH6uVC7Pp5cjxt6uRAps7kBC5mxQqFQZh3Lajh7VRGLzmikUPwI1NiXXgzjri
	z3/3SQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n1hqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:03:31 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53568f05f8bso9248801cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 01:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792483411; x=1793088211; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f29Q3ZfnBob9EdezqKkkesN/jdQEI8id6w6S8zkChjY=;
        b=Bvxih/zWUEWi6Vdsj8oN1MgxaJYLHO1u+Tq2apj4PP9JeVt8d+mopMfxpt3Ycd7T87
         89kdDuSST+lvklvfeYpuzhvE205NTk9f/Ke7vWyylDMqB+haTZD3YtmSV4DoJgE74BYn
         ZH3UIwd49VzQdUDoe0cIjY1jAmjW4Si6pYxTPAGS+R7QMbPlJiSbpvHRBV1oFLPJq0s2
         ZQ/ut9pD96s50W1nHEqP3yw3kU2bHjgRHDrzR4wndGixeXSsVyo+RZfqBasH1Ni0J1O0
         qNhdQ0UOJoFFK5p41E7FN3IXaBVfA9PUzKpbUqtCYY+l/unXX0dxudNHprQcB0JHUhOM
         sg8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483411; x=1793088211;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f29Q3ZfnBob9EdezqKkkesN/jdQEI8id6w6S8zkChjY=;
        b=ti+2ux4WjqR1pSY2R9jB56RsR/uxXd/dKeLRE+2AvZc0LndRTqrUo5x5/ImP9EYxn6
         QXHCT5PviI98vRc0xUMDfkFIXwV6dAM4n5j3Lct/RierTFMmkXeqroD9EjaCRLUa9h+f
         QmKQdCLvA/Iv+8QGe3gECHmgW35mUouTYgs/PvCaeI+WF6tilfqK8RGG+DvrLhzGrXLB
         LS9ggxbxQst3Xpes1RVTb8fD/cSZ2vkHPJNi1S9PYWLn1RGk8pvtY6EJEKhQ4zvWEYSc
         S8QOKy2YIJ+2AFVXQbTyBcfNm9GtJuyGa8rlLjrbE8yUK0ykflgthvlBFaALHZI7Swrg
         vrkg==
X-Gm-Message-State: AFq9FYLsHCC+GW9CGujOD2wS/BGlhfcoWeY1hWzbLj64w9k2cSaIoXN5
	C6HWmCNknxa98uft70xtrAvDR2phoXlvO5A7toPKpg8lTJF9loYJ8Arxi4VgYffsxaX8q52gJaC
	aLZnd+qAUP0XFm1E65tU5tgfCdMOQYxfBHthkC0JTACWnyGuHzjikUqJ36psKggoJanbt
X-Gm-Gg: AYBFou1lllMKtlP6SG8NwrDUvNGN7YBEAM1dN2RVpWWO7nxSDg8lOMyo1na4hcwjYOB
	LKjG0OLfj/2rjBMcLqrAfGy5BDtQ8MYNqYTLEWHBxoTZKRVx9GslkP/iNYi3ultDU1uDkTs40aR
	l29Uz4vIK2o1AXHu8xFQa4byBch20rFKaQdK627Vm5f6qfle5XTiESbcJJUWsLTVOd8o0I14Uq/
	q6Q3af3RIBQAcHB/VawRHsZuXF3hd0oHwJKzeJwZgEcFOxglXtRcsMxdQ+071MNimQUIjk7vSKx
	MjmSl0WjhT1b0VUwJLrj+t2UrJq95zYtWjliA/fnV2rvjLRGFHuaMnx3eh+ckvMzlO/tv2o/ZZV
	/rQ/LrqNQ2558X+hU/+kk2g==
X-Received: by 2002:a05:622a:1304:b0:535:496:56ab with SMTP id d75a77b69052e-536459e2a4amr180281941cf.0.1792483408208;
        Tue, 20 Oct 2026 01:03:28 -0700 (PDT)
X-Received: by 2002:a05:622a:1304:b0:535:496:56ab with SMTP id d75a77b69052e-536459e2a4amr180281231cf.0.1792483407204;
        Tue, 20 Oct 2026 01:03:27 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c0402sm460634166b.61.2026.10.20.01.03.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Oct 2026 01:03:26 -0700 (PDT)
Message-ID: <e77c0255-6299-4718-aaa6-04f4366fe749@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 10:03:24 +0200
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
Subject: Re: [PATCH 3/3] arm64: dts: qcom: glymur: Add EC thermal zones
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260928-ec_thermistor_support-v1-0-d9c1bae4cd0d@oss.qualcomm.com>
 <20260928-ec_thermistor_support-v1-3-d9c1bae4cd0d@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260928-ec_thermistor_support-v1-3-d9c1bae4cd0d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Uve8Ld7cEM65eZkuSIhw7ocmUP9TwEBS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzMSBTYWx0ZWRfX6XNmE0VSMAQ0
 LCMMYeZOxM0rNTMqiGNwp6376bOqzMZ32G9NeqMfZwgec8jqj8qo22nzM90ccRsLtvxoFv/+ek/
 hdMzFSTVBZsr8nZfT+94E5+grXat2jM=
X-Proofpoint-ORIG-GUID: Uve8Ld7cEM65eZkuSIhw7ocmUP9TwEBS
X-Authority-Analysis: v=2.4 cv=A5z5rKWG c=1 sm=1 tr=0 ts=6ad72053 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Nmv2DHgxKDD6GQ1_MrcA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzMSBTYWx0ZWRfX9T4pwSVHPR+I
 HuPM5q37RyW2XVtbCA9jZfH9qUgG9g9dM1V30Fvb6JQDRPdb1bbjeEfWIB1Kd7/gK2XlUsUwc70
 Ij+MwzZmXLpVAYwJi6UAtYXQVbL2MFx6ioOQzRJdoGH1WmziE3oZeJSBVqfHqA1PjlnED6cqvym
 uWiNMhQ4gDek8lUiCSSxj4PQNe6W+nVZe16lhSFIrVDsXBGoiRVj3c1bcWFPYNzbi5aJg0AdNTW
 a255jfExjywMkzkNOXDkLCyaWADBb5kV4iJqLGEswNL2wKmNbb3cufhDDmHSaUOejePom/VO92t
 NSoDVaLnJo4J/bfh0vz1IGsUbZAFhi2mwgeMjvOiUvYqGsekwSIFnBPaPJUlzCPLUKkuNSDeJth
 mrnhKVbgOZ+N5aL03bkneoLP+uiIvApbOyBX4S4QYxyakHzbikkd8wnj0LgwZG47KBSfG5HcnkA
 fK3nNslL4nIEoLqUyzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200031

On 9/28/26 8:36 AM, Anvesh Jain P wrote:
> Add support for back cover, keyboard, and SoC thermal zones through
> temperature sensors hosted on the EC for Glymur and Mahua CRDs.
> 
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 45 +++++++++++++++++++++++++++++++-
>  1 file changed, 44 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> index e27c697e3170..571c98124a40 100644
> --- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
> @@ -594,10 +594,12 @@ &i2c9 {
>  
>  	status = "okay";
>  
> -	embedded-controller@76 {
> +	ec: embedded-controller@76 {

"ec" is a super short label, perhaps let's spell out
embedded_controller

[...]

> +&thermal_zones {
> +	ec-back-cover {
> +		polling-delay = <10000>;
> +		thermal-sensors = <&ec 2>;
> +
> +		trips {
> +			trip-point0 {
> +				temperature = <90000>;

This is *really* hot!

> +				hysteresis = <5000>;
> +				type = "hot";
> +			};
> +		};
> +	};
> +
> +	ec-keyboard {
> +		polling-delay = <10000>;
> +		thermal-sensors = <&ec 1>;
> +
> +		trips {
> +			trip-point0 {
> +				temperature = <90000>;

Likewise

Konrad
