Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792685845;
	b=F3RfdiHIXFQzMLycAHMm9P3cQjq9L2XTFuS2539AoOluF4H+cwIoJXpPgSZ4P0Ck6TsY
	 ra+8GjkUCg+GEBL3W5lYfSY3MmPUuqZUdM4O07+Z3nPDOg1PKEyYtPINev2pOb3F9ZO/N
	 jO35XAJwdTL6divsMOSU85PPejFnIW7mqmCCNbq7U6BYtRtRcg8gsN5vBwOcqfKQs4q7a
	 8HoUlFNx4T4q08CVHxGmJY3+sxh/+R2pe5InNwpvoBQhAfgTfIOp9G3N8SbniGrqEDPAZ
	 2u6UMFsjbAhHV+1h9SBVa2nC1GialzRKfUVFjf2E4W+gu36vTYPZX7CC0BRI8clvEtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792685845;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=W8TGDKZPm9HRrn6f+ybF4qtH4yb+sCZXj0xYIYP+WZI=;
	b=q8ptGDXHmfMBOV5oDwPajKdNGc2crv4cyc94EBPhVmOgEQuxxu9sSiw4hSVxpXuLL50M
	 nApzQs1RgStxGdUji7c/73HJdFAsOmY2ZD6YBDpbewvGmA+WX/gf3rF5u0B/cHCVWSrd7
	 rsM1VBdrsPCtMakk1Th7C0pJBGYtKKc0ayenZ6HQifQMHr3zaaZNUItgJI2/dSFvXIkAx
	 KbxCjVl84BC1cPNXVgrQDD8RNx+tL1yUXbBdnl6ID5AemogvoJQUW5cd8sl/GT0TtMoJm
	 w097wHeAmEf1ahbTIt8uYIT8svYdokq+3P0A46oqn2uo6XgcgfTkxReHLl51TeSBVHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="ni/5mqHE";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d3APwiJ0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3509A606A31B
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 16:17:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3509A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ni/5mqHE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d3APwiJ0
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MEFErP4115470
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 16:17:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W8TGDKZPm9HRrn6f+ybF4qtH4yb+sCZXj0xYIYP+WZI=; b=ni/5mqHEPn4Pg9cK
	Yzbv45AgeD/32UA3TR4NIaQ7nWsiltS4EiH0GBcHQsBF0D6wbcwCKR1u8VZOnwWm
	JO9+H5rhqD4J4rr+jsv8LYF7ToZiyFWU+htfXWjGLC03AmF/ogEidZMQMWBHa/H8
	RbuCFtPxSjLu8LGSdpB8QlgrAJE2z8zoq50NcqJ+eZkqe7o1LmnrBCXsJCQLn95Q
	du6tD1hZkhkqPkSpzTBPdqIHH1O/Dtt9p9gDvfyoeyUPtuyNLDSu2knkkDuSKZXd
	oVWG869g/BaihcpGBPdi70w96uY8awruxq6YLkfbsoHD3lZb1tzjWD8kJADVpPDQ
	UOhe2g==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93a4f5s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 16:17:23 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35a04491c56so904513eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792685843; x=1793290643; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W8TGDKZPm9HRrn6f+ybF4qtH4yb+sCZXj0xYIYP+WZI=;
        b=d3APwiJ01oayBVHB4/OfTRjN5HMRJWsngMceHFwKtFz/RSia8EhQIksbWAo99C8vVE
         QPCRwfSXXVSREVpARQHhp8N7Y4J4n0D/qXCw66GCfgHSoGS9ObZxiAk2nbGNQTGzSFk+
         VVlzaxpZsCO4a7vCE9tb3oRzaLidPxmbaDq6T18g6RBZ24T7Pntq2/n2HgN3jS2KRXvf
         hfYqYt2j66aJMBEgdgvIjmAIyvw4/GnLjD6JbYWWWIgGeH8hzXjS7fxuSbJmMSKkFUJC
         RoRR8h3ghOCxAaupuNxUtAsC1X8nV4db4VPv9O9jGrBQB4sPjUilOYcvhlhrZj8bM5HJ
         z62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792685843; x=1793290643;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W8TGDKZPm9HRrn6f+ybF4qtH4yb+sCZXj0xYIYP+WZI=;
        b=xh7Hzq0yqrdAHXTKuAfNbtU3S9wH4fA8xwec4ySrzol1Z5nQCsg9b/OSIPXTXxLSqF
         gA79qZhfAjPiYVQfUvcdPN2i5KP0ox77s1kF6UFEnOYg1yBPswC6SoTIgwDfnmUiCuIO
         mJ+Ze7kRZVzAAcOzHitKWBIHrwqujEDoRTczQtveJX/1smTBHmtvsmNPUvjbFFJKf/PJ
         zDMb+repCC/QG7K8w01u5tF5Zh3tNxzOLZwVv/+pHfdvMbimVwf5MSp0noQbJFdcUYpz
         pEWX9lP9LTBgzSobjCuWaSl91bG+pWWvFpUm2V131e+do1UtmJY/PFL4afYYs0iHLLJT
         HZTA==
X-Forwarded-Encrypted: i=1; AKwUvByn1uoH730vXVUI/Vj2rVxBedGovrT0QSal3QgTHpHqMA45Ek2HwM42nGNmp4cXJJCNJt7q3rI/FNmfxJFo@vger.kernel.org
X-Gm-Message-State: AFq9FYK3Ep9FfbtQViV4pG9TUZ2K059gSWi7ALH1ba45zLgsY5bZvljY
	OLjaQYXgbX/7W6nKPV6cyth1sduNRSsGMRSK43OsRWadSYs0FKDExMOmaDADQaPeX3ZHRMjvtnU
	lLMGj3TL8qw8X6WR82V+rwH0dR3XxeI5KLGX1QsFE2f6az1KZy0AQHDTnEG1Lh/sMWHNB
X-Gm-Gg: AYBFou2k+p/HyqX/V1nvfzg+is1YvRW5SGC/QPEiTH1l23IZu/IZ/Md3LtOhleTz7zz
	t8mL9IePc3fxzySZUe0Fc+MnQIMJigwRN8HLOGICPoSi0Z4AdmPWZKXR4E5cful8433i43wULdI
	OSyASNoky6uB9guevufUUcNJ3RcjasiflL5qHiUDRmrz+9YLu6JDu481mhkiiLTtswOBZLlPqex
	qqZeux3U3fhGXiHxLzj9XBa80V93PhKDVQuRBIwiv1ZoeFYmzb8OV9ZnBaKI81KbKSCP0yoezJ/
	UV9u2WFGu3KV+/m4QRdEQnGZn+/j+I+RQBdF+u0kY5ScjJ9j88dij3OdBbajB9dQozjjI5QAwgA
	G3hHpC0wFUe/AQlXIsgk7ATJu5A==
X-Received: by 2002:a05:7300:ec8b:b0:368:d722:48ac with SMTP id 5a478bee46e88-368d7224a10mr2854582eec.14.1792685842475;
        Thu, 22 Oct 2026 09:17:22 -0700 (PDT)
X-Received: by 2002:a05:7300:ec8b:b0:368:d722:48ac with SMTP id 5a478bee46e88-368d7224a10mr2854534eec.14.1792685841743;
        Thu, 22 Oct 2026 09:17:21 -0700 (PDT)
Received: from [192.168.1.11] ([171.61.216.5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36741e71eaesm37045478eec.26.2026.10.22.09.17.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 09:17:21 -0700 (PDT)
Message-ID: <33ee0863-3e11-44b8-8d66-9a2e0e6b1161@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 21:47:14 +0530
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
Subject: Re: [PATCH v1 1/5] ASoC: dt-bindings: qcom,sm8250: Add
 shikra-iqs-lt9611uxd-evk sound card
To: Karthik S <karthik.s@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ajay.nandam@oss.qualcomm.com
References: <20261022094313.1074873-1-karthik.s@oss.qualcomm.com>
 <20261022094313.1074873-2-karthik.s@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20261022094313.1074873-2-karthik.s@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA2NCBTYWx0ZWRfX5GQv2RAJCdSd
 z1TnzAne8UTIEn1N+sq0m1GeULB2ChkLvrQVdU05Gr+h8kGxxyWShD+AABTq/w8f2YYg5ZVwoft
 JdFr643bEaytY/1wDyKGxcXfRjhwLB/ewMjm6K/UAr4eu0lQ3O66ut0FLMtV3tlWbRmmMvmefIB
 QbFxu3LzIsbcb0RtMywSgfr2LJ0UPnIdE+qgUQYJM5AHuVPya8jl/zpbibGjcbCdhQxWImWh1wm
 iLm7Z+9gHSht4KMihbnJTA2aFgyRNXDsYnXbVDJVxw0Cz89CK97lDH4XJNxG1g//l9ZKcdeoghV
 CQCnZhCojPbbXAa+5kiiKDg4M0BVF5sigU1YJAbms/g3+wGUuMprbDMxr210r/WzW7Qhq9hwAEx
 NgzBgdEm2dsazOub7WbuBQgWuD8ZR7KmItQHrkBTsT7tds8KOKmLBsT6WVulNXL67rvRZoRb2gx
 OBj5TiXTGxUX61bEiQA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA2NCBTYWx0ZWRfXz3R883sJ9Sa0
 8iYYxTnJ1mEL8Wm0Mm4WJ29yzVdWuV7AMh8Pxk/pIM9wTd2R7v4WJRfaeVMUvqWVt8KyHt+IXcE
 4/wucmZ14kDgU0Vr0ITvefb533IPzEU=
X-Proofpoint-GUID: aJZYZC_hZqLo32wxM8yPgb6JSujxyenO
X-Authority-Analysis: v=2.4 cv=NaFzRGD4 c=1 sm=1 tr=0 ts=6ada3713 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Vglx2bvqrojy+vbCC2YzaQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=poZCmOCFEqE_XbxgsBQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: aJZYZC_hZqLo32wxM8yPgb6JSujxyenO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 phishscore=0 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220064



On 10/22/2026 3:13 PM, Karthik S wrote:
> Add the shikra-iqs-lt9611uxd-evk sound card compatible so DT can
> describe board-specific audio topology. This Shikra EVK variant does
> not use the MAX98091 codec as the base shikra-iqs does; instead it uses
> the LT9611UXD HDMI bridge as an I2S audio codec. Describing these
> variants explicitly in DT allows the machine driver to select the
> correct DAPM routes, controls, and clocking behavior for each board.
> 
> Signed-off-by: Karthik S <karthik.s@oss.qualcomm.com>
> ---
>   .../bindings/sound/qcom,sm8250.yaml           | 43 +++++++++++++++++++
>   1 file changed, 43 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> index 1536fcd96d68..d1f948a14c62 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,sm8250.yaml
> @@ -50,6 +50,7 @@ properties:
>             - qcom,sc7180-qdsp6-sndcard
>             - qcom,sc8280xp-sndcard
>             - qcom,sdm660-sndcard
> +          - qcom,shikra-iqs-lt9611uxd-sndcard
>             - qcom,sdm845-sndcard
>             - qcom,sm8250-sndcard
>             - qcom,sm8450-sndcard
> @@ -247,3 +248,45 @@ examples:
>               };

Nit: please keep the compatible list sorted alphabetically

Thanks
Ajay Kumar Nandam

>           };
>       };
> +
> +  - |
> +    #include <dt-bindings/sound/qcom,q6afe.h>
> +    sound {
> +        compatible = "qcom,shikra-iqs-lt9611uxd-sndcard";
> +        model = "shikra-iqs-lt9611uxd-evk";
> +        audio-routing = "VA DMIC0", "vdd-micb",
> +                    "VA DMIC1", "vdd-micb",
> +                    "VA DMIC2", "vdd-micb",
> +                    "VA DMIC3", "vdd-micb";
> +
> +        pri-i2s-playback-dai-link {
> +            link-name = "Analog Playback";
> +            cpu {
> +                sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
> +            };
> +            platform {
> +                sound-dai = <&q6apm>;
> +            };
> +            codec {
> +                sound-dai = <&lt9611uxd 0>;
> +            };
> +        };
> +
> +        pri-i2s-capture-dai-link {
> +            link-name = "Analog Capture";
> +            status = "disabled";
> +        };
> +
> +        va-dmic-dai-link {
> +            link-name = "VA DMIC Capture";
> +            cpu {
> +                sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
> +            };
> +            platform {
> +                sound-dai = <&q6apm>;
> +            };
> +            codec {
> +                sound-dai = <&vamacro 0>;
> +            };
> +        };
> +    };

