Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E514043553A
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 14:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787581071; cv=none; b=O1t6BM7R+OvUnCbfbOpEEzNqKTjvthsXbuP9rPWPkjXQceyjy4gxYqBIULf3jqq/mFjpB9UHODfo7cwTr9NswXLuLYanxR6xd8lafIGsVmcD+BJr2pvmd/fK1noTgPk1+RgEXsD7FyOJSLqcPzs4yKjDgi48bpRdKrpN9Hi+9lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787581071; c=relaxed/simple;
	bh=TvryIBgvCG+IvPSiuyEqxDbZRXao9oq5INN8DtPiqn0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HnNXf8dkQ/uECj9LjOrqWDACewGPGvOnjRFT5JxiFApCV9GNKfnNG8c4ZYigHSIhILdkl51tkEQYnUl75KF2Bgjnl9wPdCwC2G22gVNKcjuULKtozvxLWPex77fFwGgZLocIHA6+nwn0YT/md9C4zWTBzPV7MUcCe/53sSZyFIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V3GEejuG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DJHjevcW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V3GEejuG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DJHjevcW"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OCuwPY3402282
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 14:17:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nay4ph6sJ6t9Vrb27RfArGCx2cz1q5GIFB5U1F0+RMo=; b=V3GEejuGocWXPJoy
	sGgGnF0VyB78kCLJ4VxL9tLOdkRyGFUSQfF+kPpPU57toCLoobkpE7pxvUIzOkNY
	lj6JT2yxWOEVIK+4Efza6iyzHR16ZN9e1b3ZvKS/ogJ3/IvmUMvj7bneP7hA18o9
	POg2Y57s5lPS0MuY1oBLsgf+LzSfLdYAiKTfNz2OqT8m/5kpJA7mfKfnvVDU/5kV
	1vZSy6x3UMpXO244R5qV/yZmGl0EdKf23+qUseVkBwvLMeakXxpz/ZfY/ZLqDJHT
	cnAVxDKKzTj5jRlkh0RdbKrJYMBvG7Q5OvFUTmGJJ/k7Yr3qp+uAzXnShUCQ60S7
	xjmzLw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8hjgspm2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 14:17:48 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97c957141f3so17766241.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787581068; x=1788185868; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nay4ph6sJ6t9Vrb27RfArGCx2cz1q5GIFB5U1F0+RMo=;
        b=DJHjevcW62oow1w3kWq6Dvil6k/O+xu9yTD+0h6CHkN1qeBKBZSqcnKYkCRsR7yu18
         PHyQgOBX7b3sMEjNf7+FQ7NDoF2MGNmge4fnrySO4e6wcAvkL+fPXg5gHZot+CtPXjmY
         J2UKcKUsYU4zM3gwQ5YzjZgy7VoVQz9uD12swBTnbbsF8qL5stG1Qe6/Qk4VrVLyJ/lf
         OyFB5FyVZaZjiV7/+LnNc0es67r6uPdDsMV+sMY6yQ/HyWRRl75fU0fZpgs23StTic9D
         mrXKIxa3+OX2Ovr+NePLlioNf6Uw4fNIOGfKK2AB+nqOGgL9U9tu1bRJbwMF/N5DxGxb
         TrmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787581068; x=1788185868;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nay4ph6sJ6t9Vrb27RfArGCx2cz1q5GIFB5U1F0+RMo=;
        b=iK6/J9bxvzIYZPEYpYOfFwsDLxdpBI+WrosmrmTyw9kpbc5NTKXlDomiKzl8S1wrD5
         hceM5oEIJ6c9eajoZsrigRw+CwsaGV30gaGeB/FXeKpHbE3iw7yT492fkBYx3frRYbBO
         RUSyRZswUJJXHGIqJuN4LzxczZmOwf8tp+4LaWvGYSCDPiZmkmvrCFMnh7vZio6+6jup
         /cnUwoi2sITQyBdmHnic6sQluuxVTXeGq+x5jStjVLhtUMoQ+sLLzCFu52R9itP6r7k5
         9/jtx+oK1orTTtTLSnrrb9UHQztTCymiDMng7aQdUtMBztalavfKnNA2JletxfOy1HsX
         C71g==
X-Gm-Message-State: AFuF++kQFuu9FevIm7F/V3f/NF9TUwcfjKQvxDsf6Ij+D9oNrIduJzGd
	uVSSN/DI6V2Fn3cVGzr2meLSeg1KKk/lhHv6bSasxSn1HdJyugeGHJVXI9OkGqvXjLC3Gubnq1z
	ZQ4fw/wdNY+BDOxUEcUU2rxYByWtn68tUJP8lYEukrWSBsMUkX02nzbRVsg0Tssvl8BqK
X-Gm-Gg: AR+sD12s3yo9dSDRfLPqxr1iipf25Ed3cBPBeokrlmljsoPlVwV2SnG9/9HIEI3w8on
	N0uTT4UfBvEJA6LFRDYySb+lvlwgHxbQ4ZEqP1chTkHzTaTC0GjuhIguxR3CHQQfvKykWgQZqMW
	C10vtvd2V7cXL8+JLPce533oqWIt4HCa5pGUlgNCuCZ+va2Y7akYFro5qSwbxED++NTEBwGsNP+
	r3t2Wjf2haO13P3NDtwcswgHD7PaON/I1YqpjNtmQEqKTMYGczky2OzIWAFZGlO4f1Kls7JufYQ
	Fh/RkQqY/RCDmy2Avva05XcjbgNehPxcGJi4uzJ5LTZY3icA9aYKl6G+LToCM0Wj/YxjrB3Pcct
	5vKGDg1q0oK2DRkPp+n5twD/2
X-Received: by 2002:a05:6102:f90:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-77a5edee8a5mr4020967137.0.1787581068112;
        Mon, 24 Aug 2026 07:17:48 -0700 (PDT)
X-Received: by 2002:a05:6102:f90:b0:779:7d3b:1398 with SMTP id ada2fe7eead31-77a5edee8a5mr4020939137.0.1787581067732;
        Mon, 24 Aug 2026 07:17:47 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e001305sm9565004a12.4.2026.08.24.07.17.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 07:17:46 -0700 (PDT)
Message-ID: <b471a134-397a-4f0a-9d79-1777ed067c54@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 16:17:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 7/9] arm64: dts: qcom: talos: Enable CDSP cooling
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Rafael J. Wysocki"
 <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Manivannan Sadhasivam <mani@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        manaf.pallikunhi@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260809-b4-qmi-tmd-v8-0-b15d47adc379@oss.qualcomm.com>
 <20260809-b4-qmi-tmd-v8-7-b15d47adc379@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260809-b4-qmi-tmd-v8-7-b15d47adc379@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDEyMCBTYWx0ZWRfX4rpyZo5Uvjb0
 uNWfpB45nwtiEuBIXa8H6rXEF7FZB8AyM+ZLSnpsWckkyi47KBa+G65h9sDGrR4Jrx39k1c278p
 lDH4zADM701fAr0Iev9rf8X+bkapkDg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDEyMCBTYWx0ZWRfX/6RL5D4cnRA4
 jWVwS9xeB/B9uBXnzYCsroFSWewL4MRvu4kSSeiAig+vUlNVSPNdke9wLE+NqX2JIXGQTzgoIx/
 CmAK9sPiNA+Jvodg0BZaCuxrMOvwPgRUA2sT14ky1ZwpAzLoMQFDsZOKwWswRjKYZpyPkoMKA/4
 WH1OkTIhvAQw26JhKrbMoLND4xjd6wZNmJIr/qxpd1seEfiBI3Rt+Bxkn+SMtRG64F0fSLxiHCQ
 X8oyaL+xE4zi+DydZEE8NYzjcsgTQ1RcSSZPTo/1sEhP2KtspLZNqrbM506BDC58RE0Q9E8Talj
 TLjSabq0FSKif0+hDu32z7+K/DWaARWVkQB74Hsa9D8rQ6Q02hdKdn70M89sVbmtv1P8xLQPNxS
 Lyb1VnJ5+2/4gOYBpGDb926uXi9ib6OIOdfYOM29FA1aC30NsHWnJSHAB1WjKFW0QSV8x3712Am
 gLXdwk1oUIHaOZKQwiw==
X-Proofpoint-ORIG-GUID: H7zSypl7rlDvuAB4cl-tEl7eBDh-0ub9
X-Authority-Analysis: v=2.4 cv=CoCPtH4D c=1 sm=1 tr=0 ts=6a8c528c cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=mNkqgjryeaPBWjMOkUYA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: H7zSypl7rlDvuAB4cl-tEl7eBDh-0ub9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_04,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608240120

On 8/9/26 2:29 PM, Gaurav Kohli wrote:
> Unlike the CPU, the CDSP does not throttle its speed automatically
> when it reaches high temperatures in talos.

[...]

> +			cooling-maps {
> +				map0 {
> +					trip = <&q6_hvx_alert0>;
> +					cooling-device = <&remoteproc_cdsp QCOM_TMD_CDSP_SW
> +							 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
>  		};
>  
>  		mdm-core-thermal {

Should this sensor also be bound to the rproc?

Konrad
