Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793175967;
	b=TepDJFxq1S25y1VOb9KO8IlpWXdZ/deKRAG37ACkqqpvja9G00J8r/lC3glosKWo47NN
	 Uj+pIZm0eeJmxqZlwAE26WLgsuxmWxymm0u8vi+x45+ccaoSaak+f5h2JfE38nRhL441X
	 q29ix/dJIb+tl1At000ILCZ4sCLwOvTzkxtL+570dvKl0ajvRRxwxCEpZOn6HdmBdSZYA
	 lGKamYGSyqdxMiOkxhZkPQpMSoPksa2sBd/XkM/7L2OPr96nOvLOVi8Llau/VrWrXhhA9
	 kX5kzbeL+5ke2gj9WcQc9Hy/rE2DRNVFEfeP9miKeoLXqVdbW6WX/04uMrJ9c6AtQ5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793175967;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sf1TWW/3HG4QfIaVTVwxXEcF5anGYYDsxbkX9aPqTg0=;
	b=lEXd05jAxZ8HZ4EWN6p0C/a6JnQB3N6gq1AeB3sUa0i8J7NIDqPwGinOAOcU5YuWGk4C
	 sG/fOyIupSNYDsODjt3pGIn2ZrtmyaCHqL5kd2y4iSps8l3PKEnfrmbfbQ5lTln7BBecf
	 gs1ee6HbDx+6qbIk44pzvmjF5QFsKV0iL8Ngu/CNBwtDYUfCVzF7G1Tj86D3RwcLo8K/a
	 ZwUI7a/FAzm6S6Fg60uPfttgLxXWAhGgVP5mXMtUXGlmkAd+sjLhzfeFzYEz3bALGz8W3
	 TnCmPFq6tZFVPef/qphg2NGXhcdD53X4QBvKSLGX2if66/QrflrqBlKzW64fcxVLYeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BZZnV1Ho;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XMgwwsY7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E07B606A31D
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 08:26:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E07B606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=BZZnV1Ho;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XMgwwsY7
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8Ks8b1101773
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 08:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sf1TWW/3HG4QfIaVTVwxXEcF5anGYYDsxbkX9aPqTg0=; b=BZZnV1HoTJPOHFH6
	lR8CYjd0lI4eTFGocQe+uV2qoM+H7Y8hMQ/jzFxDJ5MFHb4IwTtFrCcfsng9hZbB
	XFVxHXEIlFSYU9b7XpV9azCkHjuHXqe0S30b9UZU/g6NJzoebK2fVZ31uruW9X+k
	4OFfzMt9nxvasYdjxmyVTbfdZc4mI6cVNU8P/HrQ+hvi1Y7MhCRkkIyolLnp4Wsp
	QdeUlVP1s0OJCLqqj6oj8xmnIFAwHPvgZnFaudTrCuSekkl7HIjJSgy/UUk9e20p
	9IaReO+fXZs4oaHOogiFzx7WGeHKuznPksEqW7SJjFTQRtFq1EJRo8Kul4dQ8D1X
	5frejw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7r0mc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 08:26:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93caf6c528aso88161185a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 01:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793175964; x=1793780764; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sf1TWW/3HG4QfIaVTVwxXEcF5anGYYDsxbkX9aPqTg0=;
        b=XMgwwsY7Ln5jhCG9XHDjZqzM4DCcMDbdYf/J1MutxMWLNzznuFAP60HrZ8QpB+rgfU
         JqjHeQnqHLKpj1ntSleGZe7ZK10VU0tJeuYh2o70rCYN5sT9bfgzoIqnX5XJS31RWHwJ
         NGsWlmAtQMCV5hMi5istZUqYBeeADDkRiwatt2afeXy67m47Um2mkefCsiDYxqjTS7Zs
         w4XLcYvNV1oaSTs1BpgYyzWaZwrcSD1isbpi0V+Z2/WdZB41c6p70GWNTh7MdSbtI+QM
         QDu4c5jMfXIWSUKZzxd+zg+rCUwoYRo9W+I0OqyZeqUxigIalM4jMIbs+OleAcdb5FGf
         EQXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793175964; x=1793780764;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sf1TWW/3HG4QfIaVTVwxXEcF5anGYYDsxbkX9aPqTg0=;
        b=h3aPnXHNzHXPHCQSAFAfRtRQ5rtbLkwAjVL/KRmBSbLds5eejdJV2Ak5Lw+DIMOAeB
         XJQ9Hr+Su+6DZ4H5bBxoGxwpL3qkedpymOrS8HiNmn/OwaxMFa9kRobzCoEeoT0YSAIO
         YutKbkcceupYmCdERAf+lF2my/U+0JAgbiCqbJi1kiEg9XZ6j3mAN+zfn0kRRC1ZWunn
         +aCEBWFxrdJsvDAHg9jwRrGcXXV3NCLmV+iDFo65NQeYD84RjynfZ87j1+m9wnJadoZ8
         QdiCkBUwjaNFxVmuKk5xq6lRxPtCC8paS3pmz/HM8upp8aW6aA9EUcy5/fma6ZMeZ8yH
         1Eig==
X-Forwarded-Encrypted: i=1; AKwUvBwKk8maI70Rxs5mAqjiiD2/+BP8zXIUz/JQFJ9qa0m5KsXYvCbWSaQLbCfu05QP7i3ZkC2Kb5/tEUrliCFx@vger.kernel.org
X-Gm-Message-State: AFq9FYIk1UkesdY+8NMY3anz62yr+752HAITWtzzOhHppP392CfJrXqm
	oM4tDr6LW5T4BpWAGPdESMUBuHOIlLQAzbC7BniE/OlvIZeESiyI1Bb1ok+CRG12Q9r3HYT0F6w
	n9hUmYvShFXrh6ZhwcsXon1UxcmeBCl3BecoZaUP2nl9/+kKCZGBlxo8iR0hLiTtY64DC
X-Gm-Gg: AYBFou1//YpK9KbQoCM3XPX/MUjl6I98xJLjCCgKyyqhFMIJ7j0TcbWCEN+VMOCKy2s
	jN3rVLXDVe4x8Ogw40g6/3Xm8VYeHLm8tugZhTwA/qOkedMaFXqQzoEquaEcAcaojXLtafk1xsz
	bUH2cPH/Uy08CWlPAxK58MRH6Av82ddGkhXHU1Fo0xJJSrVlmWF+sfRYe6R/09sMqGv40qpWNyV
	2zQZZzMpO8dOokipJKUo295sq6xtODcmJGSqV8DuaUWthzJ9Dw7TiCPtkHdAOHeN03wYw1J1b10
	7dfwtKcWcUQQLGdfeJ5zYxrAq7FYfcSiFriIx5yQkUqeUpJQKTXlUMvmgWM+QohG6OohHU4Hd1R
	T70LqFGwyo+INdPQ36fBHKLUapEnVkuqtC0wb0og0lnsMWA+g07uvg9e3oGm/23YjANVPNScqua
	U=
X-Received: by 2002:a05:620a:198d:b0:936:df48:d507 with SMTP id af79cd13be357-94408a26947mr214971485a.18.1793175964255;
        Wed, 28 Oct 2026 01:26:04 -0700 (PDT)
X-Received: by 2002:a05:620a:198d:b0:936:df48:d507 with SMTP id af79cd13be357-94408a26947mr214969085a.18.1793175963800;
        Wed, 28 Oct 2026 01:26:03 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97c9f1403sm30752595e9.9.2026.10.28.01.26.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 01:26:02 -0700 (PDT)
Message-ID: <4ffc0e05-f6bb-4b3d-9281-1930a1d83da8@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 09:26:00 +0100
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
Subject: Re: [PATCH] dt-bindings: interconnect: qcom: Relax child node name
 pattern
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Barnabas Czeman <barnabas.czeman@mainlining.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Danila Tikhonov <danila@mainlining.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261028081243.38562-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261028081243.38562-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae1b19c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=DKZtW8Xn8zsu_FwnbecA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: z3xUFQyjn-WXQxp-umdakFgahU8s4-gU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAzMyBTYWx0ZWRfX/Cyn5wgyWRnf
 jKV1uLbq7xq+yAzP4UmK1foewLOGUFgqRhBzNgmrfcgihYHNc+qMWyfxqG9zhl0RZlm4H4yQWfD
 Vqq+ZA6Dlu6XBCbP0marHK1so7zxsk4=
X-Proofpoint-ORIG-GUID: z3xUFQyjn-WXQxp-umdakFgahU8s4-gU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAzMyBTYWx0ZWRfX60/CRSkDPSZV
 RT5pTlir8PjHnEbH+7nFd15bYUaubUjNywKlb//aqtRXWA/B6K8H/CLHFXDySj0Fv06NEUoeCBD
 /H2qYzuff9wxSEoM5VYmuKwcUQI0NaRz6XaltbQEbLkk7MkV4QI+Yp0sgF2S0cHNZ9NtR9GRH4V
 eN9QN/tmeLjNXBH3UYdfKsjKbxROKx1QDcnL0SEm3yTEC1KNZH4gZ5iiORo7xs12vaB7qtSTagG
 zPfhJNL608Zxhn+cHVkA4woYD5ByRRa0HGrKhBJPbWsdpNNLeh26WBkWWTeS+3giKH4ZhlPp/BQ
 HdfraWkLMzWjbJsbIBv37+YO513QB2N1+YfdMNkLS5gLR7vZS2urtmauCg3MMgZ8X7RktV6wFIg
 vTtuqkQo0GMM1cP5R4t+t+O64DxR5KQvFNVtzwS+YmG6v65N8LDUl15JwRb5Wn9nwrVT4925ZuQ
 7wOVySIdFlGNpiaArhg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280033

On 28/10/2026 09:12, Krzysztof Kozlowski wrote:
> Some Qualcomm SoCs interconnect nodes have a one child, thus that child
> should be named 'interconnect' just like the parent, not
> 'interconnect-0' or 'interconnect-foo' (see Devicetree specification on
> generic device node naming).  Ideally the child should be just a
> property, not patternProperties, but that would be an ABI change.  Relax
> the pattern for children to allow the correct naming.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/interconnect/qcom,msm8939.yaml         | 2 +-
>  .../devicetree/bindings/interconnect/qcom,msm8953.yaml         | 2 +-
>  .../devicetree/bindings/interconnect/qcom,qcm2290.yaml         | 3 +--
>  .../devicetree/bindings/interconnect/qcom,shikra.yaml          | 3 +--
>  .../devicetree/bindings/interconnect/qcom,sm6115.yaml          | 3 +--
>  .../devicetree/bindings/interconnect/qcom,sm6350-rpmh.yaml     | 2 +-
>  .../devicetree/bindings/interconnect/qcom,sm7150-rpmh.yaml     | 3 +--
>  7 files changed, 7 insertions(+), 11 deletions(-)
> 

As Sashiko points, this needs updates.

Best regards,
Krzysztof
