Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793271440;
	b=srTIn3NZZaZ/Fwe5aig0KQ03ZWedqwHJfTE5+qhamt3b4cwSpO1cNu+hWy96+6G4R4SL
	 zjBjGrgcXZF+zjuFr2J+DHUwJHXCJH874scUWHRwJSfDv36MhYFcKb5L+mipvITxJqeR6
	 UfxRC6y8Y7qqDhf7jj6TfFW+fqy69AFap68yjNX/0L1th0XXkj7TGHd1lrGqYsrvgqC0P
	 AxWaL/+68c1GFHkDWqJAnxI7/ppK6mZsn9bHKz39ZssBhi6XPwRsgJ3dzAmamsS6VaXNl
	 OgFc82gUN5IyPqpZgrOmlcIWRHNs3lYIs+DD+T3S3F9dmALAWXByy6wBBiqQHRmw+8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793271440;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dDpjcq/H7pAjXv6ufJHIhui4B8oOc+vxhCDZdj2ZDJ4=;
	b=TVG81T8ykiyB4PpLC32lzABmTa4Hn+VwZ/ntYDkPqpzRcKUv5Bl2JdW+7cbfbrDRXzWu
	 8lsQtC1NMXtjr0NK7TT5ISmBmsFO8l4SeuuTLqMv6/xDamoyM8ZIKpu/EG5WQLSB0mvGa
	 FNy6nwm+liALVjS5kd5uY4/fI1E8X7K+uWV53E8yqe44bDvsOLgXx0g/5crdinpHrrh0B
	 9p9ovkW9O78/J/EWWVlOUQUiHiPRGf3Dk2o+umqSrC+JmCTeQqwmYz8tNya46OQ9CNotG
	 B0gNgx3d7/5DmOeVj0wuEffkLNuNSyh8beoke0FQojjoEeTR4FM9u+vDU52JV6niY7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="i2MZuy2/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A4yLlYON;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 383D0606A327
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 10:57:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 383D0606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=i2MZuy2/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=A4yLlYON
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8vDYB2912447
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 10:57:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dDpjcq/H7pAjXv6ufJHIhui4B8oOc+vxhCDZdj2ZDJ4=; b=i2MZuy2/yK96cTff
	Tb89mgWGzwkD/bIkDe/ptWarvCjxPg71VlfwLNYa2tJkpmSYU125ypVl9vbjNhht
	OgkynYu3i13PLqDWVtEwzxyHubcM27fz7cCRigLbcb9aYe8Xi2+fGLzgk+xTdOes
	teBhzNrs1FyvGEt/zfBXJiDP2dQ+lqk8Qb2BKEcnptVeVYFjQ9ixaGmmDJ0+XhJB
	jfZIuHJKcd8wf+epUhVimG4Ch7ymfslIP6Ffq8ie9hDSovae7RJ55PsdzVaHxqBf
	Np/K3JfbsVTgu7CWRYy6+bQH8egrBeXFV61BDDEMkLqaVI/qxe3MV7ZfN3vJ5uXi
	H7gFZQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hknb2bm4n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 10:57:18 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so4243296eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 03:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793271438; x=1793876238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dDpjcq/H7pAjXv6ufJHIhui4B8oOc+vxhCDZdj2ZDJ4=;
        b=A4yLlYON7sXgJCjE37zIQmykFs7pnYaUCMusZ4R7nvJ5IDLlKbYEJ51nzqWS3Ji1P/
         BtvgwYu59MZj6u/emQofn3Y0/jcHC5RJrX8s5a1olhuhrLPQmwcNnPRV/Iyrns28h9K6
         T3hHalSVBgZK3sfFOAjyfBeImnEZbyLRb21Dtx6ZmFYxCzLbPgNjaEj/yl6pT2M2q2UN
         enhNutdido0UYGBbpDCG+vojXekVa6cLyvet7nryaF1ymulQY7cvIggTbfzHWIQmcnpC
         9gVnITPMWGlYuxBdsoSjyBbmi3p6U9q+j3G5BF4t9bDSqSXR7K6tjcS+tlFIQcTUg7XK
         YB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793271438; x=1793876238;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dDpjcq/H7pAjXv6ufJHIhui4B8oOc+vxhCDZdj2ZDJ4=;
        b=R4pHQc7BhK6YUjXn7x+oSWbdKy6kh2q1K+MIz3ow8Zhz6th0Iyh+rxO+HSgWw0bQZb
         MozCInlKWjS3Rw2F9P+JYFk0rlkcbBh3fY8geeqqvXd/mXRMNDkd5lItvZXpgji8EKWe
         tgsfzk4ZskC5ypgebGORKIanAquO0jc+Q/S8LGftzIRc6Nvv0psaKNesIc5bvYcfr2ad
         fbdt+tAPJHiXj+OmxkPI6SdO687m4HDL720vrBp59/Bs/mbL1pKiIS5bn33d5Z2YLoYj
         O4yTukAdSpvj+y0iHsfgiJJQrl1JxwoWJtwiMIkrPnYJz1+qNyZZqsfV7Lz+cyIffu4j
         E27w==
X-Forwarded-Encrypted: i=1; AKwUvBxsmA/ogDI7zczdhuA0DYdoTB4j3212Sahbv911OiiEhV4fAKgxwAJG+7FNDoYU5tq0+Po5aaIIVOEMeXcQ@vger.kernel.org
X-Gm-Message-State: AFq9FYLVG1eJ+HnDR2JOrQrmYcBww4KmCi755p/hYi2RWkugWvaOL4aF
	SmMuvKMeWyFe6wnEM+zWkNoTM1/t6q6CtysuuOVoakN0P2RvbWlY8PcXOW7CK/su0nzuIZIVtWT
	5sqwoDEuuwknpm/x2BHJW0AQ1XJSL4wrxrsVtFY0zCYk/PQ/UinjptAEjMagH6w/pxUwX
X-Gm-Gg: AYBFou3Dw7GWbbISoG6QvMmRsRGpXRe9RkbwLk/S3XagCu5z9KilUrciJyNfbSKY1MV
	Wb5IRdfhrGvYogwhESucTnkqHUpv6fwKqSNGcxrALaubzYH+pNvnZRGtZYa67pRIh7yTDhM2Qt9
	wiwJMa3hZcY00bvh2qtzD0tZU6eJ7t9YowybQ8r8XUMcyQYae3X06iio3R5gkvfoybideCHlNxy
	TLCnytEjhoNyfwG/xiZCkmWXVW78XWX1LrgXmbNolRHf1hvB3lWf1g0mkgTiauoOfjJcMpw2jck
	cQK1ZmGATYifBbxsFQX/LFKcytRvHrEaFwENmGWPQ3BfQjV5rIjSgCz8+qLzqW1Eokz+b8GaJAI
	jjpUR+GtX/2VmlmOZ4gWt/5hXBRg1yDp9PIcg1PnC53dMUpajDK3HnSBR+bHmKSNz0tUdrzv7f8
	C2vg==
X-Received: by 2002:a05:7022:7f03:b0:166:9e0d:3b50 with SMTP id a92af1059eb24-1a6ce7cc6f1mr6591295c88.42.1793271437509;
        Thu, 29 Oct 2026 03:57:17 -0700 (PDT)
X-Received: by 2002:a05:7022:7f03:b0:166:9e0d:3b50 with SMTP id a92af1059eb24-1a6ce7cc6f1mr6591244c88.42.1793271436760;
        Thu, 29 Oct 2026 03:57:16 -0700 (PDT)
Received: from [10.217.217.199] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1a76037e2b5sm20562986c88.21.2026.10.29.03.57.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 03:57:16 -0700 (PDT)
Message-ID: <fc2c4943-0482-4c72-b713-5a66c9995c5e@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 16:27:08 +0530
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
Subject: Re: [PATCH v2 01/12] dt-bindings: clock: qcom: Add bindings for PDM
 GP_MN clock divider
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Richard Cochran
 <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, netdev@vger.kernel.org
References: <20261026-b4-pdm_clk_gp_mnd_v2-v2-0-ff8e4bc8d567@oss.qualcomm.com>
 <20261026-b4-pdm_clk_gp_mnd_v2-v2-1-ff8e4bc8d567@oss.qualcomm.com>
 <20261027-inescapable-rough-viper-6cd56d@quoll>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20261027-inescapable-rough-viper-6cd56d@quoll>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yu2a1IYX c=1 sm=1 tr=0 ts=6ae3268e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=LB2yG9bKkngd5w-dMicA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: YQkHFUhqFc3eEYPN8egN5ALNwuOtlat3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA0MiBTYWx0ZWRfX4sNWOLbIF5dX
 IbquKEnCE3kSCvtrICE8wYd6YmFWhf51VPLK/J3kSgLpv3uDma/X0tuypiOp98FdlksO8Frcvsj
 IobERWi0GXmHRrBMffAr9YCrriUlJEk=
X-Proofpoint-GUID: YQkHFUhqFc3eEYPN8egN5ALNwuOtlat3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA0MiBTYWx0ZWRfX86eGC/ZzLBb6
 4ljKibGYC78LK4YbIun5GV85NeKxKp4zDSaY9MwtUwIsytAmYeANXgIy0ueyp97G1iCMY0oM2As
 b3QRkCVPtACg2LMxRJK/dYrV1ehJiAnOKkBDOzfwqR5X04JAU0bYQ2iWbGUmWVBowZYOhU40r7L
 QhfAh6+hMUV268GHG1j8SIi/liZ2BG9JY9JGdqTpqmxSalSDBpIx+rqX/69rbC76fc81KqbLT9V
 2Q38N6jFMF7YoRQ1hhWXIM+CZ66s4pWdJc1gmBYRYbo7khLLyQWvuCsnk965YWGXR72YEYZT3Oz
 3BAPwPWx4EG+MwaiwHP4iFwXCvl/c94TUeBaWl4Q7vY2v2GgvgHzTYTo0NQInuAk9yNZBvJiqvC
 ztGoT96dG6+pqPVTbUNFjh9fh7D1d35G+Z0iIDExxLeW7fssqCTJtB0Bop86zqalPBgmfjo+UFY
 jWLjXYmrIONVlgfTNkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290042



On 10/28/2026 12:17 AM, Krzysztof Kozlowski wrote:
> On Mon, Oct 26, 2026 at 04:59:27PM +0530, Taniya Das wrote:
>> Add device tree bindings for the Qualcomm Peripheral Web's PDM GP_MN
>> clock divider. The hardware generates a fractional output frequency
>> from a fixed input clock (typically TCXO4) using the relation
>> Fout = Fin * (M / N), with duty cycle controlled by a separate D
>> register. The clock output is routed over a gpio controlled pin.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/clock/qcom,clk-gp-mnd.yaml | 98 ++++++++++++++++++++++
>>  1 file changed, 98 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,clk-gp-mnd.yaml b/Documentation/devicetree/bindings/clock/qcom,clk-gp-mnd.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..8141f392c5d70acfc42cf1ff4b1722e1eff23afa
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,clk-gp-mnd.yaml
> 
> Use fallback as filename, so qcom,sc7280-gp-mnd.yaml

Sorry my bad, should have renamed it.

> 
>> @@ -0,0 +1,98 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,clk-gp-mnd.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Peripheral Web's PDM GP_MN Clock Divider
>> +
>> +maintainers:
>> +  - Taniya Das <taniya.das@oss.qualcomm.com>
>> +
>> +description: |
>> +  The Peripheral Web's PDM GP_MN clock divider receives an input clock
>> +  (TCXO4) with frequency Fin and generates an output clock with
>> +  frequency Fout = Fin * (M / N) and a duty cycle controlled by D
>> +  and routed over a gpio pin.
>> +
>> +  The divider is configured using three registers:
>> +
>> +  - GP_MN_CLK_MDIV: holds the M value.
>> +  - GP_MN_CLK_NDIV: holds the ones complement of (N - M).
>> +  - GP_MN_CLK_DUTY: holds the D value.
>> +
>> +  For every N input clock cycles the GP_MN produces M output clock
>> +  cycles. D is the number of native clock cycles in which the GP_MN
>> +  output is low, counted over 2^13 native clock cycles.
>> +
>> +  Hardware constraints:
>> +
>> +    M <= 511
>> +    N <= 8191
>> +    N > 2 * M
>> +    M < D < (N - M)
>> +    M and N must be coprime (no common divisor)
>> +
>> +properties:
>> +  compatible:
>> +    oneOf:
>> +      - const: qcom,sc7280-gp-mnd
>> +      - items:
>> +          - enum:
>> +              - qcom,sa8775p-gp-mnd
>> +              - qcom,qcs8300-gp-mnd
>> +              - qcom,qcs615-gp-mnd
>> +          - const: qcom,sc7280-gp-mnd
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  clocks:
>> +    items:
>> +      - description: PDM XO4 source clock
>> +      - description: PDM AHB bus clock for register access
>> +
>> +  clock-names:
>> +    items:
>> +      - const: pdm_clk
> 
> pdm
> 
>> +      - const: ahb_clk
> 
> ahb
> 

will drop _clk suffix.

>> +
>> +  '#clock-cells':
>> +    const: 0
>> +
>> +  assigned-clocks:
>> +    maxItems: 1
>> +    description: Parent clock phandle used to set the input frequency.
>> +
>> +  assigned-clock-rates:
>> +    maxItems: 1
>> +    description: |
>> +      Rate for the parent clock in Hz.
>> +      Supported rates: 19200000, 9600000, 6400000, 4800000.
> 
> Neither assigned-clocks nor assigned-clock-rates should be needed.
> Parent clock is outside of scope of this binding.
> 

Sure I will remove, but the parent clock input is a requirement of the
Hardware and the output of this module entirely depends on the above
ranges of frequencies mentioned and that is the reason to keep the rates
specifically. I will capture it in the description and hope that should
be fine.

> 
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - '#clock-cells'
>> +  - assigned-clocks
>> +  - assigned-clock-rates
> 
> And these two should not be required, either.

Will remove.


-- 
Thanks,
Taniya Das

