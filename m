Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795703537;
	b=tDqAZ0AAKL6YbHyE00GtAGoxrNaeGkXhajAF+MIGv0VCfGrwEyil0bmcdfjq8WXgNedh
	 AJhPI3Gul8UJFayCiyQm2v0DxKd3g0oCi9Ce/54Sig7fyLhAFXAOuh0yz+P9oxk+vsW9C
	 wCP/NEAoyedsI4XNPWq1chvcrydzDt8wi4Y/w3C8ZaB3zreqvyLX5S9p0l8bYJA3ySc8/
	 Cw3yR5DOgsZOGb8GefGLq7TQyTzMV8WY0kqSsdDaYx1CcdCQNY08ekivJts9nC07w8rxD
	 sH8mW9BXgan7w84jLGMJDWRnxtpesUoWDXSNgiUcRP8WEffFV2KDkXEyFLiIjEykaGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795703537;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2O2AI1/Vkx7CyITACfLQUlmlo7eAKIgc+T3zYHs3WNE=;
	b=DINtwrBsIUmW+xFP/9S4WJLAvssXjWyQVeeLj+AlxVv4/fESMlr6xmqvfCoxQmgCM1VU
	 P5iTcZpw6HBpzw4jVM12HUSvY5R6Bi5Rm0spOR7Zvliib37hj2ogYMrDSFs0FGSkOjrar
	 dYIKRg9FGjFQmZqgSfNr6jWe/m83kSk+ClNwq9P3Wg6Z9lZk9Rx4eIfPAk2FafrWtI8cW
	 I24truXLzSdFjVmOhRepfqagBB8lOjQ7mbdk823RwoCdYVFHY6tjggS/JITLC3a47tW3t
	 Hfo1+I/uQNa0z9lK3ziwPuNt7tovpjg0u3J0ize38DdQZxRB0kkmf8DmvFzUhSabFfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zuic+b+Z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P8m9wcIP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DB5606A695
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:32:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 30DB5606A695
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Zuic+b+Z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P8m9wcIP
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEVAEn320315
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:32:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2O2AI1/Vkx7CyITACfLQUlmlo7eAKIgc+T3zYHs3WNE=; b=Zuic+b+ZyUBYCnYB
	Ye31Y4qBd2rm+sfBodz25oJpX2oO8njVZ3iT96cRqLD8R/m7BnbEP7wTfYBRlJ9m
	pXTy0u9zfxXuJJ7QD+Hj9MgnsGHdl/ZtQkcDWCA9EEDYTqaD2qKzdpkB46Bh+Hg4
	uNtratNK0owXs+ywKZ8YU5q1oiz3O5ddToJLkSJQ7dSyvnZUhxnQWiX7uBkNv8Jd
	wWFYC2RFQKK/01Sy5OHaeh7BvkdKsxwPJITg5FWTnDUXWolrZyFmFXwNXVqNEbfg
	Uu54Wdu73yaxZACxCoxO1iJbKY3mZdAA1T2dHhE468o2DawfxaNAYpfsYm+d1c9i
	mDRKOw==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vavae1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:32:12 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-57ce11e8723so739203b6e.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:32:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795703531; x=1796308331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2O2AI1/Vkx7CyITACfLQUlmlo7eAKIgc+T3zYHs3WNE=;
        b=P8m9wcIP6IgcKOB1s/ujb0wz0GvlIxz6nOZhsW45kTekV5dp+ci8AU4UAIErO/sD+5
         9lTORsEF5EUbZhSqhXVZuUSHiZSZ9O8SIMjO2KerZH535dYVJR5gSR3Vfoy2wYjEyWef
         Sys8b858PzHkqTSmoBBex58feo6v8c7V65E5BtU9eTFkDbBsZTgeAXxsFzm4J9bvYcjC
         KsQ6BO10tKsdJt8D7PfcjN6KmhJ6dJaA/2g3TMspLTIJFvwjuR5Uf+SIaByjPXfKBAik
         szgtaoKv+JZ1YJIeABO4P2BVqqC4MXAHfnc0FGv8dVLANd3mrPEpMDU+th78TA56QGvi
         +eIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795703531; x=1796308331;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2O2AI1/Vkx7CyITACfLQUlmlo7eAKIgc+T3zYHs3WNE=;
        b=nL3mRKSCopocA9SzV+0TrdSlEKpd3AwO0S0l2sFnBTIgVkkNg/fdawV+LBEOxXAQMb
         Bohi0xP6/yam3m4VhkZByoUonb5UMF7psy326WZpK2OZO7gtMAeuBmLFEs2dQhaIA86B
         Ffh8zC/U8vzZqAGG0J/rg4VD4/n2PIU/cfpFgVh7Lft69Dr9FOm260I0RIvN5Jt5ZTdB
         M5uUBqlYGVh67RN50o0OLpKdgAVmj54bxH8QShpFLjClXfFnW0brmutl4fSM3jSWHYvF
         i6AnG34xYO2iuhs1VSJX/MvPR1Tz3t/ZwgqsGbYyAmZC6men2ZIhLvAcTBiHmodKDMHf
         /9rQ==
X-Forwarded-Encrypted: i=1; AL+hErH8izFKKkFxe1j2ZoWgmFHTnO3wrweIL7KrAMApAx2r/xocWqhjw6n7JzEudptlNnaYBt6HRwvSCNB6jNpN@vger.kernel.org
X-Gm-Message-State: APuU4Z/eqOE+kDcnwrfo6AuatIZ2nWSFOJNNy32LzdOa331O/0IwUFtW
	MCKwgzUJ4q8ebgENp/65hE/pQcVqR3+/xd0tfAyE2BzWuOLokWG7Yglxdb6L5uCAJgqVf6ivpD1
	MEOXXOMYZxzf/tOQo7Z9fy+wRJEu0IiRGFejQnCgtzX1xOgbXv71R0eOnjFGOsdDoQqSi
X-Gm-Gg: AZFdTZfNxRKJbOL3MqOaSnlzH6Yk532wib/wAbGIndQDwCuwtxnERw1gxKvGBGo8a2e
	pJNobr+E1GaTB0MGYt1vhv7YSVJDsMbEcvNDsTfR1xhl0OJhIONlofSfvebCoIJvujT4k1CzLzV
	I8t9U3yIR9UvAdxVWsV681Psr5/YKbOkKTIlZIQPazL+WI2ypZOLNbVWsJzUSKDf4QguHCszNbz
	7A/SujPLC3F/eMItrWu4mOlGFL4ThCsJTRBwX52BAgVBGehnSlWYxUcjsKsj3QkdmFuVnOhgseu
	ik0NquhG3epgC5WzrAOB5gd1cS7JRgn/T0F8PMo6s6HISLEouC38064tMZNqyWRGMwT5w6P4kL8
	8+I3Tqc7Mp1MvvrAduGXZ0F9+LvGAqZJzgL67j0oZkoWwuVF0+O9IMWmEq738+DR9PWb9
X-Received: by 2002:a05:6808:bc6:b0:4bd:73d9:85c7 with SMTP id 5614622812f47-57a024f2218mr31443860b6e.0.1795703531631;
        Thu, 26 Nov 2026 06:32:11 -0800 (PST)
X-Received: by 2002:a05:6808:bc6:b0:4bd:73d9:85c7 with SMTP id 5614622812f47-57a024f2218mr31443826b6e.0.1795703531228;
        Thu, 26 Nov 2026 06:32:11 -0800 (PST)
Received: from [192.168.0.242] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm676995995e9.10.2026.11.26.06.32.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:32:10 -0800 (PST)
Message-ID: <84fbc195-8e93-4d25-ab0e-14c3510edf40@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:32:08 +0100
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
Subject: Re: [PATCH v4 0/2] Add pinctrl driver for Qualcomm Halliday
 (SXR2250P)
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20261124-halliday-tlmm-v4-0-3e3a1d0fb4eb@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261124-halliday-tlmm-v4-0-3e3a1d0fb4eb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NiBTYWx0ZWRfXyP+RzloWArx3
 egInkEce6cgl/tUcMt++WIstUvci9/OVYY4GJnPeQpjD0Uj/qwdOzj1idkvnq6+ExmdYyd4Q0bE
 P1VNzBJQxEmXAAaH9m1eDOBUSi94naM=
X-Proofpoint-ORIG-GUID: BLBqM0fFXuz8WcDHe7MJhj09wO87Diu9
X-Proofpoint-GUID: BLBqM0fFXuz8WcDHe7MJhj09wO87Diu9
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b0842ec cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=pGLkceISAAAA:8 a=dvIHkycpzy01oOa2bCIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NiBTYWx0ZWRfX0kPg5kOCRnsw
 Z+mPKH/+1OMU+ygEc0sE9hBEVZRGiTz1DN+RNlK77fc0rJq3vNYoPw4kogeqtrwjNpsqxQvdfnn
 zZZ7pQzqUa18tACThZDOEoply+WkBbxEXr/l80HVpD2peMTfwJhKpwXdHp6PTd0G6iKMvocj9tJ
 8fYkNYFATevwL+4paXJom2XD3bm8BMU0V0F8FV/XrSgMa2eYiTonl8KpgQ4FDEexopqtFBzm8zw
 1f3XdM3pTTqV2hWhGdgkPfvujYquFKdXzeXlXNX3vwxeg03mqJ33nH4JUemPcyb3Z/He/SX7fKe
 PxjVQxR4x9VgGXKNsB/BhkmG33S1eAWe/3IiR2NDFFGNWMLTSKThO1sDwKhUwIc4X1L/JNfW5NF
 aqIPlVZ60VBDXecEK5NDcoyU2SoXt9c0a+2UB+g2PUlUMszPczytApHHZYRxQmafzfYkN0rNQ0h
 QagcdTOb87vufxnH9SA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260056



On 24-Nov-26 16:29, Stanislav Aleksandrov wrote:
> This series adds the devicetree bindings and pinctrl/GPIO driver for the
> Top-Level Mode Multiplexer (TLMM) on the Qualcomm Halliday (SXR2250P /
> Snapdragon XR2+ Gen 2) SoC.
> 
> This is part of the initial bring-up effort for Qualcomm Halliday
> and Samsung Galaxy XR.
> 
> This work was made together with Claude, ChatGPT and Gemini.
> Reviewed and tested on my Galaxy XR.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---

Feedback from an LLM with doc access:

gp_pdm_mira: GPIOs 35-37 at mux 2
gp_pdm_mirb: GPIOs 88-90 at mux 2
gp_mn: GPIO63 at mux 4

Konrad
