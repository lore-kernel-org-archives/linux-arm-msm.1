Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7976849C4AF
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790160139; cv=none; b=QrFAPzu6AcaRwgwQPTp7YFcLNHGZWMhVg9X39LKW79gsWgWXzxZrfeC2sAcO0La3ftbHYiS+U9GuwhmnkYZVnVbzQM1Yqyrxh4yyJfU9LR1vpJgk2ZJ+F+ZtgswHZ/SWV1owAVjNNaBUrH70BjRq9B++0GNm9r8eMKz/Vc0ixZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790160139; c=relaxed/simple;
	bh=esAFI4cBO5gZrgs6kcPYz6vVF/4XQ37sisj7UUTHfoE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fu9aCND9sjWjcifnPT0+6Stx+6eX1Prpcpkmkhd2MnWNqkEoGgyD8nzJUZuJllPQ2AdIIhHX+6vBsTxUJM4XhS6g0vqMXFosLYIxcjYPxdCoGfB5ibrBYagjVqc2TfPaB8kCwukntKKcA3BT9Jqb8sKrzqQhNsgNNp3X0KSR/tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oA8rlAWw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AyrTF35Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oA8rlAWw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AyrTF35Y"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NA30744087729
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:41:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XRklZaFveois54wgeLU6HrDBAGjajP7PcFqAfsF4MI4=; b=oA8rlAWwaiJ5ELhP
	eap0eC2k1dioRZ/iS5X/0iyvGfepuSAwfv3qPpUmNjDHB26Kb4umOP80Zmu3WPms
	UVLsVlnvWHGKyqNmuQ7m0NYz2nmj1+codE8j+bVmXqhOTecShCVCaKbMWOiI/QS+
	lGEXci7PckEYy5w6MSs+PI15iFd9V5Ed9IHdXjQmcBhzCh6DX9sJvOntk42z25BL
	cXwL7e1YPtoMiOp0RIyFCJ9um/3F2QZFdeXS4/tnBtFfBaloMyDNh+TWGOM9QSCf
	qN7P4rxQmNF+JFGDwMWeV0fk0+xD6+3zKgXjwPe+zyN3wTl23ctRSOTwnwPm8y2l
	ZrKauw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gux8c3xgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 10:41:59 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9103db79014so1644356d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 03:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790160118; x=1790764918; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XRklZaFveois54wgeLU6HrDBAGjajP7PcFqAfsF4MI4=;
        b=AyrTF35YTAkSu+nG4VKnfeIiH9PZ6qGSAbE04E1JxI+nPyiHkTTVU8XHYNlYXfCxFs
         dhlyPJlkGKA87OpQXSgHGA+f2zum+97N7vmk17OGuQbu7/LpQCMKUjYsC3CKgTpGObEx
         vRzugzHF8zijqaEJaqr7lohFeGGmWP+8FY0vS8OgWjgHe9jYyax6VUO4ijfXJLhqOhQR
         qsa8JYwcf/lm6FPK4PUBDgPUtQtQX/CMXbwuZKMthrVvpfSikf2/fVtIyrxA5lNOkANj
         uX0RkdUJqnS+RnugdBVUg6n0oh0me8OnwUcTDzg6j4fAnHXTWDAw8F2LBDGWk4JnWl9c
         dzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790160118; x=1790764918;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XRklZaFveois54wgeLU6HrDBAGjajP7PcFqAfsF4MI4=;
        b=Ek9/GBqaEZrcnL6yLOkdvWvPE0h6OQ4bxLhH+qjamoYzO/xX04q/r0TvbTamXNl4Iw
         qskqSCO/WUTQMLgVNxVzcdOf4YFyNmwi3vvUUJ7rRpIrhDTruHgBKLofDQfia3QSVxh3
         H2t/d/sUwN9kWkU2kpwUIsiya2pGPIa24D6eGMEzpdZ66NhDX1K2P8Vwz4BYE6mCgMcn
         OBttMVueNMGstQ1h+EOV+DaTqLR3Z6kpxfVdVTXCPhXlScIc9G74vE1NQa+7/LxAD0Cn
         lIv6VKGx/Q1gf3uakbN7y/dJuBWAMR/QZ6U3VRcob5X6nk0kM9EHseH4ayN/24ddjF5F
         pMDw==
X-Forwarded-Encrypted: i=1; AKwUvBy5rg+9+9Y1vldWbQtgoL0per7a8CS7LxQNGUSz3xSpuUfA3HSbSleouoGMdnOz3P/EZ+3l1fej0ktlQ2yt@vger.kernel.org
X-Gm-Message-State: AFuF++mzCpEOAExoWRrLzhXc0wiC5aXbQQV8DCd1hDdE1WhuWW+n+eoh
	lEmbVzqKToO9uPq0Iz5RoqftLftLtujnnIXSxf8vlmmdzBJ6NK5BJVmphGHTm4r0MRqFJkTGO7f
	gJKhZPyIROFL2TQXFrycxQTTQI5zVPJukzr1glEV5Oe3c8IyyX9fgwM4toZTe3Kw5YNxC
X-Gm-Gg: AYBFou3N+VZQLU6bXcADNBDpSHn5lHWKHdIB+I4te3dRBa0D1mLb8dT7ev8Js0fz8VL
	iNeAdZfnCbfMM78uKjdbDW8vjpnn+BkCN8A5KJzERgHHlP12KsHncOlbvtkDpb+d/y5nWj/QKDp
	3JkwNQo908SxWVWtF6gGSADHdS4iFFagcEjNAawrbeiXh3+0sH8sw2U995hgBLRQXtICCpE4Qvv
	mUcLIUxQhwJl6Gu+eSoVXYZjZzSLzW4yAoJFo3vnwiWdEtI3+DHUoZLViONzDEez9pc3G2OICFl
	25pNCJXPLtxzVDWVl6ePpcRGvNU6T8d1bL/HkRJUgxVki+5po8zSN5hbuPn8Jnps4PDt9h1feBI
	goK30Atba1OSpVjHsZ/iNyA==
X-Received: by 2002:ad4:4eaf:0:b0:912:1f0f:b204 with SMTP id 6a1803df08f44-9140c30c392mr36584826d6.1.1790160117872;
        Wed, 23 Sep 2026 03:41:57 -0700 (PDT)
X-Received: by 2002:ad4:4eaf:0:b0:912:1f0f:b204 with SMTP id 6a1803df08f44-9140c30c392mr36584556d6.1.1790160117437;
        Wed, 23 Sep 2026 03:41:57 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2aae5c5524sm93803866b.21.2026.09.23.03.41.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:41:56 -0700 (PDT)
Message-ID: <17ea3f77-5480-419e-90ef-9c51c2c21da7@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 12:41:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Introduce Hawi SoC
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260923-hawi-dt-post-v1-0-e41473b6298b@oss.qualcomm.com>
 <20260923-hawi-dt-post-v1-3-e41473b6298b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923-hawi-dt-post-v1-3-e41473b6298b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA0MiBTYWx0ZWRfXyCAAqMRdlPzU
 unbR9qMbx8hDUwABT/qJykTqrtSTdRWqm6YjoMTiPJUrJo64dvCTxtQ7j4vtl7sNAWjcGrZynnl
 IkN1YfXceKprOrj7QFE2t5aWfu74AyHN2m3EyXfUz7cBpBqENqqQwMBvWL0q6tHoEyPymWur38n
 sZkhcsQEZF/XIMSsjpT5D6yqUzyCbGfP0/oUu9W44qEbpSLg5WIvGBUNfKx9BZk8eyOTMfraq4r
 aWBJK22tvbA2Co5kOXZAHEKz6xBjV1t1KekhkfmkfAAm6zrtui3Xr4QjHscd9uiBXxoZ6rlKdk6
 7jFA70shA/zOSveOqxiTnlBRbg5/1PB7ohXndp7xOgwfXoL97/CYokOb5gA8jASCUQayUhbbZwj
 15xHDAKPFQYIwT8LdVRohucAWdw3CstLX+WrR5Dj3y37O1vvXNElMmX5Knbrn31rVdqnRm/y8IS
 uxLOuZPLd9Wn1ifxeoA==
X-Authority-Analysis: v=2.4 cv=P9evFSAu c=1 sm=1 tr=0 ts=6ab3acf7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=0j8QO1Iwqel7qtPues0A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: oySrxVySjFwwH82A_wCg95VSzJecRBZR
X-Proofpoint-GUID: oySrxVySjFwwH82A_wCg95VSzJecRBZR
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA0MiBTYWx0ZWRfX0G+qw/DX1aAn
 meopdFFeYYwEAStt3vuqXWYPt65fDQE2ILvik4VkRc4OXMwt2ITWRCzdNHykl7IeTQC61CoIoYW
 whHMT4UrwdexHK13bq2kATRXTuOKK6k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230042

On 9/22/26 10:18 PM, Mukesh Ojha wrote:
> Hawi is Snapdragon SoC from Qualcomm.

[...]

> +			qcom,smem-states = <&soccp_smp2p_out 0>,
> +					   <&soccp_smp2p_out 8>;
> +			qcom,smem-state-names = "stop",
> +						"ping";
> +
> +			status = "disabled";

SoCCP should be enabled by default

[...]


> +			sdhc2_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-100000000 {
> +					opp-hz = /bits/ 64 <100000000>;
> +					opp-peak-kBps = <160000 100000>;
> +					opp-avg-kBps = <50000 0>;
> +					required-opps = <&rpmhpd_opp_low_svs>;
> +				};
> +
> +				opp-202000000 {
> +					opp-hz = /bits/ 64 <202000000>;
> +					opp-peak-kBps = <200000 120000>;
> +					opp-avg-kBps = <104000 0>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;
> +				};
> +			};
> +
> +		};

nit: stray \n above

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
