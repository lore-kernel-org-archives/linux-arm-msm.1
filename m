Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792575213;
	b=MuBZd2rQJ+G7jY4cVmk9vUGLasdtmThm0tt97PO4jPdiatayR6Q6hII64zdQTPVsiQda
	 5qSaaCPY2b3Zn2vABCA3clLRv/aUrUoSwUjllfFbFHNAT4KFLFTOYyRRTSoLNHHdL/1tB
	 kCTwqjrgeViPgSDy4D8iFtNfmUO/8K1yOjn5InN3JUZxidtoc0lf3U76As2hPIe9yZaBD
	 eR/wKaURHTb73THbv435LAllgfyfFSsxhxJWKvPsTG4sLCL3kNNmUw7pITt9JgM4aq2m+
	 URTHosvvH9ZU4n7fQsM8y1ynEne0KWv4dhWfiLlNzfwW1Oar3ltYyxep8X7XKhE94KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792575213;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UOxlMxCeeV3aWc5tsW//V2qhk9/BquEemWrF1Xo4tEg=;
	b=ISjHf4hvmhNqnHNg6+3oONdAyVvu+36ftZNj/ZFQTWc6dvMN+nmMPAC8mjjiP46dtzlX
	 WdQSKhZPxJPNM0LpLp6qt3Jq7C6nZ/eCSaBJRlsfzPHpZKrCzb8eqa6gnSoClwy0SDQ49
	 DefLR0VK87Bn7CHLNR818tevjVtDKGdyiglQMO49cur/F9cHrrQ8t6xEjPf4OaWI1d+2h
	 FD732zIIBPjIOd2Gt+17HHoz2rI7iojSEg2Zd0fBQudgMbndZBns+h7hoYXUc4WrlB54h
	 ZpIqyhQgKlKuTRlZ2bUQEIHRV1OgfP4yULY9QInC3fgzcPMlcGDQNHRV6/67m8HdIZg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AUfvKoYY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hamLPNm6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C33D606A31A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:33:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C33D606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AUfvKoYY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hamLPNm6
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5iwvQ164993
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:33:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UOxlMxCeeV3aWc5tsW//V2qhk9/BquEemWrF1Xo4tEg=; b=AUfvKoYYLuz/RiNj
	fU1JeE0ZX3dBvp0QOJ7aTeCslxnRypJW4z6rhGnRLYP2bfK8vtNbjBTJCuM6SACE
	MnRhIVpcac5AWC1PgE+1g2C6zPeQE+88VI/LYGT4CayKD5STdtkD4njtw9bLrmK2
	1Rv9En7HIksLlJmW8v2gwM5TOYlLpLAxserJsFppAktX5LlPcRjQ0VMFBzHe9IFR
	VyAMqD6wkbXQ+YGTm1PDgMyBbkkEDmgULpd5qEb+fKu8g9x7QOXtuV0W9+o97nNC
	qkmHMBdTjp5jwdekhrgcLBYGKkxCFq95Fvb6n67X7NGtyzMoTPMW+6w1xJF9LzWX
	/sgpyQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hegs02g3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 09:33:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2bdebfc5so15636585a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 02:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792575210; x=1793180010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UOxlMxCeeV3aWc5tsW//V2qhk9/BquEemWrF1Xo4tEg=;
        b=hamLPNm6h5U7OYSHnmXUcCqCWM3/B61WoKwDjGqpXpOx7+3PNTxh/DKJ7ariZUMwDU
         FqGKi/BF+5oGYa3S1XRPezVwFKUnsbjE+3KRUyBqHk0b0HIqV9L7R82YzhLqUIigogaH
         n6M/J+yMD3ff0qStBUSfvuf6NzhKnLYBlVL7CW6Pq0tX4ODyj/iDrXaMCAy3B71HXWSN
         07OcH5Eps3A59vEyy/RVIJu8TBKcCIg2XWU3DElLM/xpsb88Mh7Eyt8+/YtwV2n8pJoa
         bzYN2vVejuZWtumXxz3fiMkjMlXk2kMCdPZ0ryoupakCieTe99HAZWncPyCTzAbUqjvd
         b7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792575210; x=1793180010;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UOxlMxCeeV3aWc5tsW//V2qhk9/BquEemWrF1Xo4tEg=;
        b=djTfLu916aAdeG5GIDvLiA4V6fkaY2YZAtW53ayP3a8Nuk1qwHJI1/BsPubvnxJqlN
         L5zr0XKZYHXG73EtqyreRUiKwtUln3Eby8I3QoURsOeW5D8MDhu+vGEylmx3QunsVpZz
         Qj+rJdRNXC/bc24N+3V6/1b3IA78oaJw08kv1vJ7agUHLq6iKotgiaX4pZXRGVPbP3A0
         slb1qRdqO9FXBrdo0HMRy6vghL4cQgrftQTgCAzYoLUNJOa4D7D6zIHNKX/L4ctr5gnV
         svkIEAau+1yelYvcHVpyfsELGN1cgag1yMB1pOLmVwFyxDkbmO7TfcKY1kaOvc0voBtn
         gMfA==
X-Forwarded-Encrypted: i=1; AKwUvBx3oAE8kcwPVbbZbdLbhS8jBom7YNEbbB0DE+P2MIhuDgitP3E8tauzA/VFuXEtR6PmVZl96X/IoFzbAQ+n@vger.kernel.org
X-Gm-Message-State: AFq9FYKyv6yioACZV/8At2QrEocaonojJchYIVc3JIVzoD6ku+AxsSiS
	p+lkaa3NejRKk8ngG3SzAbnrksSnNTjjH1+sbrJzxSSbBSMUPuXSGnK6P7INX5NP7h67ITWXVyG
	YwvOqzZWCuj1xTtydPgETf6MI8JJR50Ahpsh0hPINOg7t0syEMRYBCv3MEf3YsGOaXziR
X-Gm-Gg: AYBFou2RoyVMtz7CV7cyMyNs/5WTHkmIQkw54ESyuFh2M+8NrA1FBDiGCEeiqwEYIts
	E7INdUlNXgzytu65kEpsHucnxoeQobYT0uB/B6zZo2D8/5GcG8JcEGkXSbHCyhjoOlsyGLrwu5H
	UJF2Mf2crpDGgiviBlBoSziIzDLKnnnR7vrQXxPFmk2MXysz8EzwvuxgEH/+GsSz44QSgJDjD2E
	glVnRJlgOTiwx52uupV8KULY3lxVCf6iCfL6VtWiWI/FoTLH3GQGJyijArs0l9rl6jKKbWn26JS
	K7BXPdfvDUq56q7aSA5FAZpao8ppqCW53Ej2Q8bJEnYdnETct5LI3/y+SuIEY8N/nKxR7+o9a2s
	WgjbT1gmM2XpASTg4ffMpBw==
X-Received: by 2002:ac8:5f83:0:b0:536:27d7:abee with SMTP id d75a77b69052e-5369b4fd888mr26713131cf.2.1792575210461;
        Wed, 21 Oct 2026 02:33:30 -0700 (PDT)
X-Received: by 2002:ac8:5f83:0:b0:536:27d7:abee with SMTP id d75a77b69052e-5369b4fd888mr26712901cf.2.1792575210042;
        Wed, 21 Oct 2026 02:33:30 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4679037543sm59783766b.85.2026.10.21.02.33.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 02:33:29 -0700 (PDT)
Message-ID: <9981a633-4788-4b7c-975a-77c3a57c0352@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 11:33:25 +0200
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
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-google: Configure qup_i2c2 pins
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Joel Selvaraj <foss@joelselvaraj.com>, Vinod Koul <vkoul@kernel.org>,
        Amit Pundir <amit.pundir@linaro.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Marco Mattiolo <marco.mattiolo@hotmail.it>
References: <20261016-pixel3-i2c2-fix-v1-1-6a527d52c865@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-pixel3-i2c2-fix-v1-1-6a527d52c865@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=S/NMU4sP c=1 sm=1 tr=0 ts=6ad886eb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=vbdGY0My6zaIDZyNjYwA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfXzmu9iARLeTW7
 BVMNcCm5GQMQq/9WmhVXCsiwH17U5I4hVyDqU6SBtt1PhNdIpm/6x3GDmCZ2q8UN9PG9SHDFdir
 2jwD9+WVo1dn+IODJfZH6kuPNMEIs0836MY3DM/PTTzFG65JQF8g49niGMQ+1gvx0otHF/OnuCA
 4eXsDcAAlPWzdOe5rPZ2LGayfIgOnvQXMBoFSTKlD+mZNiGBVZCD+uj7x5WkPjPHTURDVy87PsL
 HuC/GH+b5DiYSN/pktebuEOHYGTxSPHocfSg3gwxrdrR7hlD/aMOrwI0dF/wGXqQj82iC9EeGpC
 tPUo2+WRPPbhJ+UsQS1lDVxCN+afurFG/kjMBiWzv8t+dmzgsDLbq/xnJefSd9xQMLhZwJ0hJIK
 4JxvZRL0F6Gz3mPrzGM0lf81MFV/PrPKCQ/eGZAqKnw0/zhYma6aQscXvYWszSj6cSkI8J40h+e
 2lm1O6Etdwnq+aBZIQA==
X-Proofpoint-ORIG-GUID: 8eprTkvG4RKASHLl-deg5Lb8vwnMDGvp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNyBTYWx0ZWRfXzGGRaN4bo4D/
 ZDJFRJbhbCzg/942BLnHUCgU6cz171VEoH1m7M90/E4lIKNpPmlGxtkNRFXUaqpsADxxkcz4p3h
 MvkHuMXoipiefFsk6A5gCBDEsBFuu3g=
X-Proofpoint-GUID: 8eprTkvG4RKASHLl-deg5Lb8vwnMDGvp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210037

On 10/16/26 9:37 PM, David Heidelberg via B4 Relay wrote:
> From: Marco Mattiolo <marco.mattiolo@hotmail.it>
> 
> Set drive strength and disable the pull on the touchscreen i2c pins by
> amending the qup_i2c2_default state from sdm845.dtsi, as the other QUP
> users on this board do, and drop the unused touchscreen_i2c_pins state
> that duplicated the pins with the gpio function.
> 
> Fixes: a678adbf2d22 ("arm64: dts: qcom: Add support for Pixel 3 and Pixel 3 XL")
> Suggested-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Marco Mattiolo <marco.mattiolo@hotmail.it>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
