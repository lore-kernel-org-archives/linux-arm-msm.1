Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793839744;
	b=Dlaz/xKQ6fbzb2Achd824pnf1GHHTXMYsbAm0N9kuxLbHWOmHb1kZDZeO555ScfBoTFo
	 yllLGy+q8gPBkJM8AA/ZsK4cL4h7Rc0GrbBfWwlu1Ftlxp3SvRshosrvfhVU2UBlE2FeV
	 +0GHm+ble8Uf4H2Iu4EgEV9462UbElKPplxB0Sh+rTf7PdzB2lQR3LgUaiKn7bFSQeoRy
	 tD12mP1i3GVs8q0sUGnz33R5biUa1lg5INLaVLcY5qTUe5rZzgW0rk0cS67DxYGQpgEFS
	 OtxEpwWkBn9KKOUfTh1sKCxDHv0niMwpA0JLjYdjhNzQgr5675Jg/mJNmvdDHpWqmaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793839744;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XqAWGD7OCucT8InwBEeCfRvI36YPHr11mO+feKHi2q0=;
	b=v1LOGNFzGcYbwXu1soaipLp+3RnK6jKPIRoGnyy0x+BnyOfT5KAFnBW9YWa2AGBG3Ctg
	 l3pxN1PzZVfnZTmejlWHEFT8vXbZRvX8ny5EaK42PEy68UaAWQrw9+h0zjIXtiggivwF5
	 +C+YnKuo/tHoUMKCpjH6zRBPBZRdgfZjIuz2ExOEooc6jKTmDchBpgvvAVK5NzdE+uyH9
	 cfWKyKDTkLrkgSSPf0PQCusotLquROzJR5TlRy7X9cfjfJ9T+bYpL5YlbCzUTUMrPD6dU
	 F6ahQICcOjzi3PjLLIjrLHxnJGHBR7XUwHjDT1lPxw2T7XOEqbJhR6qd0qqh1CQTFng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mi73K9DP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C5wBzvAc;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD1A606A32C
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 00:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDD1A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mi73K9DP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C5wBzvAc
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4LDIh22210737
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 00:49:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XqAWGD7OCucT8InwBEeCfRvI36YPHr11mO+feKHi2q0=; b=Mi73K9DPa6E7vBkJ
	bQdUeEsC2XXy5CzNcLHD3Is9EV+IokS2ni3s4O9NDJfPlQC2GyzqrcKzQ9y+nf+0
	j5KXnB86hJEjKK3EHX8U6UDsMb7kIfOjfgk6VRxVgl+2ZZzNG1NBd2nkwOAI9ZAy
	YjsZR8I8Os4w3d0kzitHAUtfKXzVL4cMFwnEPtHw9472SQOA6kJN1qjO7+9OT69u
	9svl8dDf2ba4LBV0i/En4Wpz4gBxNd6+DJPtDVtVEJnhMYiI6mFMEbaBBym0dfJ9
	l2TXtDKFkwIyXBbc6kmu1eR1Pkbj3l7mGogT1thHhQbgEsFdZ8seZvR8x/HyMA1H
	OU/pTw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr6bdtdye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 00:49:02 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e9995cea88so13565975ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 16:49:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793839740; x=1794444540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XqAWGD7OCucT8InwBEeCfRvI36YPHr11mO+feKHi2q0=;
        b=C5wBzvAc3rZOpG2n9Kas/K1SHBOFInIzHAGLiYaOLMeB8WokpUsDywo08dUuYPP88+
         1txFpS4lZuQJO20FGr+tMGCuR9b27BSE1mmHOTwY0BDzCdsKrj7gqhT3E3kgsWcgQjDq
         cUsY6S5VAkRGLqJmas9uVAW/0g5+vCxZ3+UjPhrrgqUf/A+TNsVDKKy/nWrKgA7QALEQ
         aCnkb+gw88DMxykwr09f/T1g9wHuEpyhBmm1BT3CSikU9VxKq/RPSYxKjvgykMTKXOVo
         5tbVKoWe9JCMCzfx8/pHvJBoQbmVGiwrcDS3nfbVvogvRxWsWVRgFQ4B9UqUjnneNe9E
         wYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793839740; x=1794444540;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XqAWGD7OCucT8InwBEeCfRvI36YPHr11mO+feKHi2q0=;
        b=LoLbCtr0VH+5l/JcquIiYNJEwPr+dH4uA5UF40Ot+vWEjgCd2eaQRSwm3Jml7SDoNr
         /DsR0GnnWrVR7miouekaUDOQflHyOx5U/a6wvu2lJ+RzI6ZFxAlEeSMUj9btForma5NQ
         Kge864jI9cglg8kn5yFY3B1aFwyQ+Yhnjja9EhVRKAO51PsoCmhU2UVNg0ZXHgAUT3Gs
         i/BkczxXq11ftY5w6P3pz1sA9DQmqxlODBUHZPXUjWzNMSvruWCso0rE6JupHmpgHJYO
         LA5skD6dusx2OUz8hwPCQBxEgjZDIMubMY8pzvcR+d0MpwwU4PnkNeRZfcyf1Dh/LWdg
         tBig==
X-Gm-Message-State: APuU4Z/C0hI5oLIiAD41wlEqqQiD75PfpflvMFJ6onhmryGbyAdkTa3z
	jM9a7Kxlctu6iuWNXuMPvV6V01N2D9voVRQmFDn7GLQx28PZ+xYs7/yWjyOAnGmpf79bL/f+iPJ
	NlB57Mlbl0cc1X9IBHOCgIGg2pTO2ytjlWVGvbnq068p/QycY9eFIgTJn8XK001uoAqMB
X-Gm-Gg: AYBFou2WijspYNdGbqn1IhhjDrEzEoN4ZSOCrsxvhJQ0Lz9zEfrNdfPzHPdyUULrgwO
	+OFG6e6H8IziBCo0wlrbAtFiAi8UNVck/GFNfP8uV49vIS8j2yvCbeg27xO1BGGSNkL6MNfXPtI
	uXy40DgG84ZDKlasa1y+0kClXv81OWLtN5ZlY7c2IrO9I0n6QnZALB4nkKammENeImQtRY/C6a+
	HcjL/3myBjfQtaEQs5hmFtRDfIA5NSp4s2IX4/yPpCNVASxK3y9NhOCwnZUBSEDlWikgaihU7T3
	ONM91TbPWi7zVkbClkYDLxwdCC8m49mA8m6slUt+TSOQUrwdT80w87ZVj7TDqlaXF72Ker3ZlNc
	zTTT+BKI2x6Ige9EQ8gJwXe5fR94tqBGrZUc1o1JdAukDqtPNgttqYC8+BkuPwjt+fzmC95ULeA
	==
X-Received: by 2002:a17:902:e5d2:b0:2e9:5175:2eb with SMTP id d9443c01a7336-2eb364024ecmr175302855ad.1.1793839739710;
        Wed, 04 Nov 2026 16:48:59 -0800 (PST)
X-Received: by 2002:a17:902:e5d2:b0:2e9:5175:2eb with SMTP id d9443c01a7336-2eb364024ecmr175302605ad.1.1793839739240;
        Wed, 04 Nov 2026 16:48:59 -0800 (PST)
Received: from [10.239.155.32] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed091f35cesm11791855ad.71.2026.11.04.16.48.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 16:48:58 -0800 (PST)
Message-ID: <4edbe80d-f1f0-4e85-9973-86da7649e9bf@oss.qualcomm.com>
Date: Thu, 5 Nov 2026 08:48:53 +0800
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
Subject: Re: [PATCH RESEND v7 1/2] dt-bindings: input: Add Qualcomm SPMI PMIC
 haptics
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
        Dmitry Torokhov
 <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>
References: <20261103-qcom-spmi-haptics-v7-0-418de67ef84a@oss.qualcomm.com>
 <20261103-qcom-spmi-haptics-v7-1-418de67ef84a@oss.qualcomm.com>
 <20261104-myrtle-kelpie-of-chemistry-de43cf@quoll>
 <6964d550-2ddd-463a-a142-9e8f72588803@oss.qualcomm.com>
Content-Language: en-US
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
In-Reply-To: <6964d550-2ddd-463a-a142-9e8f72588803@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAwMiBTYWx0ZWRfX1RY0WAPii4/s
 CWOyQ4+ndS3I/XfZFGzHSQ31X59zZMHtZDWQhgKeyOjdqg4LBoMAWkpsbkJfFbCofbvGkbvH7Rs
 yKryloi+Ygtu7UojO8Vhm+EyLpMCplg=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAwMiBTYWx0ZWRfXyo53tylPrSlq
 6/YKRuXDJZ8Ffw1iIMQTOJAp0uylxSCNZVGlVHanb2QDmAKFOhiXtU5xKh+REH1uepwHAvtjSGF
 gK0WJSsSG7trHM5uVajRDlhX8v8tRwPJxQsvs00o9TG+7glOyaHP1n7IpR+3fX/KZxokjWxZa+Z
 Rw8gCzrMlx5Ko2iXSeK1J2F3Fnn8YmVbhaw5/4ujiwOyAz26/WVJvILgMiVRRHpj9kZwPmdg2dJ
 4xUXvwdWm1FUgjduYXoHCgSg9Fh8/+WQQwznYyf4YrY9xCXGTO0CjM6ffNF13DRu+eTZYObk4hH
 ukqFnstvMKxNuvB30ustHVNgaNtSfDwhg9StJ/Xy2J6lx6ydahYDxAa5+dA4Qqzb+FbfROQpZwk
 9Ix5RgX46tZPJdsMkRGoY0wDNkx3Stz1/fqNcX4dzDbcmK/QULeQzOvC2VhsVhPCFZYNGyt6Yyv
 g7iAsoVKtszBXbIEzYA==
X-Proofpoint-ORIG-GUID: KOuIfcNGJftNGjJoWNDGeQpLSQJrdYBC
X-Authority-Analysis: v=2.4 cv=D4XSufRj c=1 sm=1 tr=0 ts=6aebd27e cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=DT_BFmYFbp2_FYglL2YA:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: KOuIfcNGJftNGjJoWNDGeQpLSQJrdYBC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050002



On 11/4/2026 4:44 PM, Krzysztof Kozlowski wrote:
> On 04/11/2026 09:29, Krzysztof Kozlowski wrote:
>> On Tue, Nov 03, 2026 at 08:51:17PM -0800, Fenglin Wu wrote:
>>> Add binding document for the haptics module inside Qualcomm PMIC
>>> PMIH0108.
>>>
>>
>> Why are you ending this? On what sort of ancient, downstream fork are
> 
> s/ending/sending/
> 
>> you working?
>>
>>
>> NAK
> Best regards,
> Krzysztof

What's the concern on sending them? I don't understand.

Thanks
Fenglin

