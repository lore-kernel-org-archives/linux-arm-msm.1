Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793559974;
	b=SlUmWfIcnupRRiTjUy/nZDh77hHUKk+jCvAvIX2WChiZqcjN+CaGJq36CeAXr9RUbn3w
	 xtL/JSXlCA8E/G1UMdqLwl9UQqRIXA+TPd8Fh5KnSkL/YhK13AsWq14t53zdu8FsHE0MA
	 Oa0h6Q1p4jnD91Z/rZZxaLpBi9pKuTb1oeqi3boWIUWD+91owF4Q8bCZ+yBDlkeH1+lPi
	 kMCJ9j7Gio1of/RnPdXdkrOBcGd6Zr3/hxtpiKqwkcUtLOAfVMxA1L5Jsi/59sJZxGLK+
	 3g9jNl8xn654LtQApDRVWCoqYM6sHD1RH2ZM7EHI6JVgjU3Gxd/iktTB7xJEQZgO9Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793559974;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=33cTqS93VQUbbVeIcCrD75pZNgE7Uh33rHjvWjbfF90=;
	b=O/Yx+MPOza890D+kXXQ0IFTU3hpua0hEZjYeDx4uVPgUMc9G3r9b2oSWlejYLumk9+dI
	 Z4bteLu/Uym/rKXDdDQ4AYB6nPMNpa+m50kyDdI0u2FEsxlJqqfQR70BZ47dfQFcLZedu
	 ieSa7vE95cs6nrPH0VMc93c7MWXsJCicnfRgs/qfm6Y4z4pBPuCOSnq0iilIXTI78+rof
	 g83jh64qepZLfr1OGlsxx2VxBsrttOTJeHksWwJDXWHp5rwjOiFCdbELBKx2Iz4PRRg5O
	 kAVPDztRbJVk/dbAnP/wVxiX3g1HjyJBDqyQuYaAJfdKZjE46czJ7EXNMnLqedDLjFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EMRKsmdC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JFr9r6gi;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F6F606A324
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Nov 2026 19:06:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70F6F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EMRKsmdC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JFr9r6gi
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A1HPxgS2019560
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Nov 2026 19:06:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	33cTqS93VQUbbVeIcCrD75pZNgE7Uh33rHjvWjbfF90=; b=EMRKsmdC5woX7Uxv
	jv57183TZNgH9vN0WFV4bnXr5Lmg49w54lRk8ykXQx/Zjw4gAxQT1EWaIgqM/P3D
	G+7uHDZvRj7auKNKo36OIXN4cXjtNNLH6mgSG4wprpXrRuztiKLel4VbJS5ZfNzB
	MRROH2ai+wG8cj49u0REDHUD44jB2YRmkPJAzJhYaqtQ58sQwaULNfs+ocp3qMRF
	qD3SMortdMPufwuzEmmSBWNvofAV0t3U0uKdWVxIAEgRcdPrz5Xj1C5PTHVRWEIR
	D9fp/K3dh08G8cBrICIFFobK2KX9wIsS7iCZbyn4lm2+lfE14fLjaMw2tImJByds
	Wy5t5g==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6m4js-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 19:06:13 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-988c7363ee1so2155049241.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Nov 2026 11:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793559973; x=1794164773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=33cTqS93VQUbbVeIcCrD75pZNgE7Uh33rHjvWjbfF90=;
        b=JFr9r6gi2riSRIxDhhic/9hICwhKLS8MmpV+HZkmK8pRWr9ylADOzWp9sIlYgPJL/M
         1PhrRib6Jm0jE9VorFV/YBJxVd6RIJwRqWoEUks7pJMihu5J7Aqee8cw2zCZe4M16SUx
         MqmO7CdOI6JuFfa3hy/GwjLjyCcHTd95NMj1xMPUjFmMp7MPf5JtJY5db+A7hnz7dAg4
         +SxBJqhD/l6VOru0sOi1f+NeilU67YBNAgk1DZ/7THKJ5NolF3UNZ8dbq1FRjDi0u+sb
         AyZItlAcBtuDw29V/cpCU4GLDYPp8jz9a5+UTvLkmM3awKauLh3aLY+vnzoVJ6uOD172
         exew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793559973; x=1794164773;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=33cTqS93VQUbbVeIcCrD75pZNgE7Uh33rHjvWjbfF90=;
        b=xsy3RNlmwPY9bJYJ59/GWc6/QsfUFLL2pzSqmN5dp2qvCqytJbiuorbyiIlrICDe1G
         ZLhagwF18fq1POBMz9lHkyOITVFbZpnLtTdZlYpHIDSBXtd9Mn9GgXyujRw1oTWONoZD
         eQHYBYzyv/qK1sZ62l3S9hpGWFrz2ewsUYYDEa7BVXmPSeBXXi62sNl4KrnRfY09vi17
         A99eDnfwX5fplAVfmAfNAB55fe1ucbhCbqg4ba5d9WTO6r6klR/YPoD9I3DHOcF+Pak8
         yEaTrmLc+4L6VJbcpUQad3XU4t32BxM7zzvn9r/1yKGOU8VezrComaZzxic0Q/JhXZ79
         wSVg==
X-Forwarded-Encrypted: i=1; AKwUvBw97Yf8XyaPu9DwStYitfIL4AHlb98yyRQL3eupP83YMx66/7xOvRRO8gVf5nWXci3SlXKs4u1bQ31Q5M8K@vger.kernel.org
X-Gm-Message-State: APuU4Z87sJMkBZvVt+hNlOtonQ5X03tTGQCBF6rTuKlU8Y4peIQKUtkr
	jzjNT9FT1jk8WTdo1rmI+OLNF5tWWuHCj2fFAjO3gr/AgvBlHJBX/ecAjEotKOVw6rgQGAMs3ht
	ywmRJEnnB2n5uscmkVCKGf7Lw8zZM7CIegyDK30jszJBGOD7TK6iL8UfXXvWUGjXWBpGQyVNsyw
	2V
X-Gm-Gg: AYBFou0qxuNEf6GPRN/ofxYkDU0KLNTPCfMEz5hymeER7VZ5+R9RAx8UBM513so8MuV
	NJW/74Pw6MBwAhxN1+0oJSUNYPWZtxR3Ed9A2JU3Mufw1TJs7SsiDvTW91PT8M8Kxr8tmHw0QrU
	PfGAzNT4XREwIvJZ1qlxLoFzmwFf25F0APz0V26o1u1vXnbAys4cmiGK4ZMe1Ljzc7hcrAIABbU
	dtnpTMz39owNIuQSKgX5mPPn3Iau/6J2mcH7dUhqDja0dBks2Zjy8HQRTiw1SPdCXxXguegO4Yl
	bBwLFLxiM4jT4zaOzKpjDt8j4Khm6OF/bBkrgVLVhWF2V7SvGhtt4ehTrWjqKiyFQTTOyAgyfi4
	rEBai3aeCHIUOeDoGgP/xlwaVn8n9S9Gir5shwwbYGnQZ0UnjLcIf63v+CFet4/8m7/b2SNoh6g
	==
X-Received: by 2002:a05:6102:6cc:b0:7d0:3eca:a872 with SMTP id ada2fe7eead31-7d072711c8cmr3652901137.27.1793559972747;
        Sun, 01 Nov 2026 11:06:12 -0800 (PST)
X-Received: by 2002:a05:6102:6cc:b0:7d0:3eca:a872 with SMTP id ada2fe7eead31-7d072711c8cmr3652895137.27.1793559972307;
        Sun, 01 Nov 2026 11:06:12 -0800 (PST)
Received: from [192.168.1.110] ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b725b8sm15616335f8f.20.2026.11.01.11.06.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Nov 2026 11:06:10 -0800 (PST)
Message-ID: <07cf366c-4efe-4a80-a094-5ee93a683720@oss.qualcomm.com>
Date: Sun, 1 Nov 2026 20:06:08 +0100
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
Subject: Re: [PATCH] soc: qcom: apr: Reject packets with header size larger
 than packet size
To: Srinivas Kandagatla <srini@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Mark Brown <broonie@kernel.org>,
        Andy Gross <andy.gross@linaro.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>
References: <20261101175407.110780-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261101175407.110780-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: lBXRBSTLEwGRW-37AiCZ6J4RrR7Enk4q
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae78da5 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5t2Un5gMkzPXvGO7pNEA:9
 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-GUID: lBXRBSTLEwGRW-37AiCZ6J4RrR7Enk4q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAxMDA3NiBTYWx0ZWRfXyLh7GBT83Phw
 gYNZ3hh+hvPhOn6HsAnvDetKjQwCDeQR/SQLRUWRyQZXdkCiesKu7oh5PAWV4Vpz1RhI3WFg8Mx
 x3WYY7OtadX+UaTL9k9zoEMNWBhp4G4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAxMDA3NiBTYWx0ZWRfX2Xi6ute6mDuT
 a2jWsEqy+BoWFjykhpEgydySpaBZJS5vBX+hdy/mWuRB5x2VfIE1ceJ4LUYs/euZzG6So59RRxS
 qtrlEieItgeC/WyQOxwrCMILjwiPoF2g5gbF6fCnCv2yqVoTtjVgVD6IxjdYHYlQjPv2/Gk4Tkv
 93gvD+YGcUMPjU14F4FKBFJIDJOV9xxRsuvX1ribALsA8q/NWSecDbUJyRscJtD5hkmnWvfwHFG
 D+b92QeCNDQVjr6kqGBnhGjGUQjdh1kYsCfUpsWL4VxFwuzjCQV3v5cIT5Ug9TNNsCiwl8Wox2B
 y1qCtupYiIQfzpWCXF8HBGNYjBCR11cIa8Ayup41wV9H+uJTr95g8DRByk/W57jzzgS+8Mphh+l
 Mj5fkfDKzZIioPdQhwWk/AZAVqXmJTCZOXjQPcID7pB88v5v9SGgQY/j3MyrBtlTeAeu9Qz9gxN
 EUqdjSHbirLkjEfMdxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-01_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611010076

On 01/11/2026 18:54, Krzysztof Kozlowski wrote:
> apr_do_rx_callback() and gpr_do_rx_callback() validate the header size
> and the packet size separately, but never check that the header fits
> within the packet.  Both sizes are u16, so with a malformed packet where
> the header size exceeds the packet size, the subtraction computing
> resp.payload_size gets promoted to int and becomes negative.
> 
> Further check "resp.payload_size > 0" would fail, leading to
> resp.payload left uninitialized (stack value).  Reject such packets as
> having a wrong packet size, although unlikely that firmware would
> produce such packets.
> 
> Fixes: 6adba21eb434 ("soc: qcom: Add APR bus driver")
> Fixes: ec1471a898cc ("soc: qcom: apr: Add GPR support")
> Cc: stable@vger.kernel.org
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://sashiko.dev/#/bug/linux-82d40745-1593-4c20-8432-d86099836525
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Valid Sashiko review.

Best regards,
Krzysztof
