Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792421613;
	b=AiCGBaFZhiONXu7unPcHyztzV33ACrUNiROv8thW2dLne1Plqz2huHjb/5ow3yPwmZz/
	 0q7RR4WqTFCknCztJugNNOT4X7fs5MGzsECAYbgEOvHKAWxPf0vTz2MeK6iEMyym31T0A
	 0SETgr3OcgofTmtUBqijjke6cczWNcmIjI//zRajYpoAyBsey7YNuZSlN+HPn6DpQfUb+
	 tGFWFwi6wO0eFgw6vX/HUHnPHBFBTDUyKQoGFWR+4B2ugmk7vS7qGweNRY3cuqcGcKeoh
	 BZH+9wphRfvrUKLGTTGuYddWi2/4HlkmDdGtpHsgAkPb4GXOXTcdmMt5chVI+WxRi9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792421613;
	h=Received:Received:DKIM-Signature:Received:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=;
	b=fbNlkStkN5Te5DDxwaREA8NsNvp2pDdLqHa2RCpW7XJyDhyaRaFwNuoqcZVyp7taFJ8W
	 qJWsF/Il7Tmmra126LO29zgJeIhxBx5Lfad8Yaxwnv0Lpui9X4yD9wdDsoU4HGdU0rnSJ
	 ulA6c70zD+XeVHlX1lQem/vv1emunJtZjMJmKVbJFd4PnddAHnegPgR/DRDZqFY5MEPHt
	 HW+GK9lnsxsDcdsPUwgXvy62+RxL/cb3EEi0aZKwUENV01wDwqisVqPSLtGN5d8KFDTBu
	 CS1rG1+jQcBUViuAXEWDRW/5IEcETnNcKmwT0IdI41eD2nG8xgz1HgbchFTEBvLC8dA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="P0yGY/me";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YIoAJzoB;
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=10.30.226.211
Received: from aws-us-west-2-korg-listserv-1.web.codeaurora.org (ip-10-30-226-211.us-west-2.compute.internal [10.30.226.211])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79EBC606C146
	for <linux-arm-msm.vger.kernel.org@localhost.mlmmj>; Mon, 19 Oct 2026 14:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P0yGY/me;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YIoAJzoB
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 316614D3BCD
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792421613; cv=none; b=BWkZ2grHPJvS+/31qFadiaxs/EUBctINDCrHxMKUoGBhH13+yuQpygl3ojqvpdGIyXZmuo81PVLl+XVwlEe6mzde4vHAiSXxol65gvUuaE5cxgNyqkvuAJbOnt8MPIf6bjGRNpk4ZJleUiKfoNS0m8Y0ABdzl6WwkdQ7SvJKQW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792421613; c=relaxed/simple;
	bh=8QzhEza4cmQmxyVPqaeJPOjfbUX18+JD1Hl1uHqCQBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NcbmPWD0eBU2Ue74j+9Y9J+IORE+cJgBdlQzMAovvP3SyHcBFbz7GWJLjYpAysvBi26NAmBYt3bpma3/kM6jWxPDKzovoSLLSreJZfDuMfmPT5atmCSPbHTl9NzUYnV78bibAfQbUky38RC3/FGbPqNA6ebHLCmyFBQblLJ95LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P0yGY/me; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YIoAJzoB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0hdG1904082
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:53:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=; b=P0yGY/meToCkfXMD
	ERJxZldNG/3CN4TYtWvURt+Nj3E71DWN67WF+qoqtKV9jmDIwtOuGSTXHsNVIXZC
	R73aUpsQJPaS6FKVK1j75E1T4zr4eG6zOWWl3KpIIcA8+sZrdeHX7w67lreawtvx
	gAtR3+GpkMogP9gnAmYj7LKxD3GIyQ27V5V4etMPOpG3WC5hHsiZQfwcSfFJpm2S
	u8gdHYJ6vToL1QZirfusd6YW7L1Ap3zydnHU2M38mY9DGhFE+wKnOQpgr+5up8Mf
	tbQ2FtusEFlkKqRY4bXw2toI3frV+js12w+cqlk3bZrZ9DFKjeMzbsMNPigx4tRp
	yRsswg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf5c9qjb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:53:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f1440e081so32633685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 07:53:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792421610; x=1793026410; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=;
        b=YIoAJzoBzAZOEr7tRnwcN5WijY4FhiRXcslGi0gyCMKMOoRxOs5jNGj9y/BE1j/6Rm
         DmbLjXtG3UNgA5AyKV8c+liIwgahwZqJjfTXDPKLE3MSA5LmvEujgPuxbngPqNs70W42
         PWQqaW17ILJ02BJ8220hXbVlqQAbreauniOoyEUByafJ8vqGhud041H9qy9ojOrwNZvU
         uVjGGIXABvjf1yUqX31FkFd5UTgdHDYji2pUrVmVZ0WS3gtyz5oDobMmwZJwXMysSYPm
         VMBdTE7ZQPftA6QOCaLSb+CWw2TPWQp2IedDOG3FGRU11ejYwztFWctnrB865eTUwDV7
         xrOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792421610; x=1793026410;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pq+k5Y+P9f8Jl4xUrEanJ0HlnhEWdX1ZH1Xf1jr1Nlo=;
        b=aRvV6Xd1eg5aKLtYgtbZUNSDMlszjzQ6148lWL1E5io9aom15TJ/8mzEN4zSRk5YtZ
         +5yGdbmnZtqw+naSVnQW7LfjjMAsvXUkAwkKBkh8YkGcK0uCiFXLeacQZAlJTVkMKAIp
         ROwwr1iva8iHDpLsOqc5TjsmDsxIWfNQi5XxDNYWfUdCRq3toyDCTYexDGPiFb1F6ZVV
         OBXxeCcaDxLXvBpPIZnkiYwq+aPT5yWIAFDWHpX9myJBeo2MgkxysWWfKS6Mh3qZzsgK
         cLvOCHOU2TUjZyzz2ny9kLTi/AEYLrmeB7oDWEWw8lXYWazxnFnaPT71LlNTi2Td21CV
         ZZgQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpEi2XvG9fF5Bu1tOsMV+GjO/HzPHSHZgwZlli6HKIQTp1ReN8qjlqJTcw75Zy1NN3/A4n/0SiL2AKV9Gw@vger.kernel.org
X-Gm-Message-State: AFq9FYJpV1GkU+kDpYJGCxASgH/8U1cMIO182jhBIR4FGdNb0EoFC7GN
	rBy0yVMnBP9UTBAIPjkf/NBgxRjEAjgIulJWleQ5rx5VDO0dYJKgtHk3J0JxSCIvm8dqjs8m24T
	NMEFN7IH4VPh/WSwQRpMOZtOvU3DcKg0X2KleqEO5sIsvdDNwATG+1yLcXGWZCjvG1OPn
X-Gm-Gg: AYBFou1V6h1LfqgxYxPj/uekKAEKKDM50vUXj8m4s3h/DeJy41mQLsyiu85G8Z4EEap
	DsaNPw6r1p9dhOrWcfLVI+Ehw0ov2iCLsCMsuf2q1DzMQMOzycf6OW7GRk8o+J4SOCf6aiSDZhh
	+wygvuJdV7vwEn3rfKHqrzi6ohaldXTwrJxNq7zhyNn8mIZeYDs/YyAxEHkXLM0ki06QR6uSWdp
	MVXq9xWgBfcXftd9srcEIpp/nOeMS1GwVrdFERAXW9Q9igXeCmDbZI99ZeaHG1NTnCUaySLyiZk
	Ap99N7zgjwilna6OUVioQbffK62ezyC9/gDz45rA+rIE9CMwAanPiUz7McfZYm0gaS5fkMO+xXh
	oA3jqnQVUnWLTVF9Jd6fztw==
X-Received: by 2002:a05:620a:6192:b0:939:9ef4:79eb with SMTP id af79cd13be357-93f29e50356mr1470500885a.6.1792421610293;
        Mon, 19 Oct 2026 07:53:30 -0700 (PDT)
X-Received: by 2002:a05:620a:6192:b0:939:9ef4:79eb with SMTP id af79cd13be357-93f29e50356mr1470495285a.6.1792421609756;
        Mon, 19 Oct 2026 07:53:29 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4091eb2f64sm365653366b.77.2026.10.19.07.53.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 07:53:28 -0700 (PDT)
Message-ID: <2d491ab1-b7b3-42db-8302-5adf4d1a48fa@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 16:53:26 +0200
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
Subject: Re: [PATCH v4 10/12] arm64: dts: qcom: pmih0108-kaanapali: Enable BCL
 sensor node
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-10-50b9a8c730b7@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-10-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX/0248Ov+G+UF
 u6M32o6phZ4lFOhSEsFopfwpsMS2t3dthb2aXZ8+LhCO9y3qEJm/Jk2WT6lD1JXUL4o2iRyDjru
 c7LRQFUE8S4ikznINYF8Vekvjg6YzOU=
X-Proofpoint-ORIG-GUID: p0K5yN05geX61GLyjW9IuU7-cgsjIcsJ
X-Proofpoint-GUID: p0K5yN05geX61GLyjW9IuU7-cgsjIcsJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1OSBTYWx0ZWRfX9PfKsAOGjXK/
 Ho/Tx+0W8XB9p0/WEulC7uAaId8TiDsfutyWRn4e+Lz9qJapTr+/85Aye5e1IXtGZAQ413LNTBe
 3/fwP6nTuO+PXnwPZeipiZmWvASe888qwOVi+YkOklKoZLPb92C01IbZSoRCZ/9H5ytntOCxq78
 ktT4AAluxk4slR7Bpeq/bjHYD2jWaWJnts+54xtGlkiYDQld3S8DD9v/qrByG0rCYGSqxFkxd6Q
 hC5sVf+nGXr6Xj77yymSsr9dpID7+1VZD12/Sg9BohOMEshA2EHr2a139B6K+l/0zaKJkeOrAon
 R1soHEQ75I5IBQLXNT2CuRCHjmMJqwxCPztUNG/EXHS6OGLaOVXru1HVSNems6Nvh+yRAOBw1e8
 +uZG1XzDCyPdVVb8NGop1zN9zmQDHCsDonbauv1bq+U+DK2wgtm8Oh2+sYfiIVmVkgtXcHQGL9o
 11tpyfhGGSVdHk4gYTg==
X-Authority-Analysis: v=2.4 cv=K6O3jCWI c=1 sm=1 tr=0 ts=6ad62eeb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=_ybYkvnUm3iZRZ9voNMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190059

On 10/5/26 2:24 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
