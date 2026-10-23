Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792742763;
	b=dqJ6gN0AGd3N34QBpKWDSl/cFOTFsaD4iRmqAtXnk5KZemD3rlfeGHTPUn0Rojr5gCmV
	 nAyYBPvwXVxOhNIZ5PcBAR6oAG1or3uXAbnVppZ9cpVKdRnv6dnwfBRL5XKfBsKb9fZIr
	 BXzYZuNEIKZa3rJ4+ERDulr8ThyT+Sn67YeE22PLFgUUCsKcuBYgctYkvn5ql5TuzPstk
	 5lPKfmfc/RS6hJmR2eufey9thH1YCq5Cskjm86xbgX6Yw6PwtC1IrVVcvjKtQPwnv7dJP
	 ACJqcw216L69MZPBxHku9NlVTYlj+IrzTXgvsUxukPrX6KL1bTVWE6Xr9JmZd0dH6Yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792742763;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=uU8ryexn0I7UdpzqrHG4lhMSHCO1ccEarOJ2Ag6hyaE=;
	b=z9D5X1fsIzyCNcmSwZjnlEmbgng0YwPYJcosxeXx9Uto+7NabhlI4VfmdwhxXQtwwgA7
	 184xx2LJqKvhbQM+VXlWcge6+VxuGr9k/BNzaY4RMN/5NQ/eKTXzJvbuITJIu6mB4vzj2
	 eU/e1umRYIdciQ30FQGD2bTV254HVNRszfqhV3Tgeq+kq+FyNiH8Kk/vqYq655i+jZYIx
	 D37lQQ21maQVIzn0IqjeRHqLdXlGbg7i/ND+8yUdzVzxAvO1Osm55FrIAVDFBBPM78Pla
	 Tx5JzhFFKmEHFluGqpRX98oTBI19SUU6i5tkJEy0Lp8BSoYc+A0lYEvJ/qj4ci/ICzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kG4s0kT2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z6tUCf1Q;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA86606A31A
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFA86606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kG4s0kT2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z6tUCf1Q
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7F7683153899
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:06:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uU8ryexn0I7UdpzqrHG4lhMSHCO1ccEarOJ2Ag6hyaE=; b=kG4s0kT21uYk+jbh
	LbLcYMsll56FYoJQubZo/rQGOLrE0wF/AQXBWTQkW6AdTUcdAF/brlzuqJ2XpfSq
	J+D62aeNuNhkSWH5/iKjWcFRuTet9tibPVDZ2JYrJjCinplz1eKGzbMbrdyM5iY/
	7v0ord5ZH6FjxN+bdcylNfBatEDB8ne/GzCQaRe4mPW9jTGnKOe3ND4N3iFmN3rw
	RGzsM36qpKChaDjdhZyFfv+Oe1Vue+/1SXYOSgIiQ0m0Ok6XfW5uzRmRmQfTQy+V
	ZuI/cPo9MQZhRV3edOrsdDcnFE9YPVcMFuU9u0R8QBZR4VbuU4Cj+5gugdKSUTwm
	/5PFmg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmramc1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 08:06:01 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9906ce36960so34734241.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 01:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792742761; x=1793347561; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uU8ryexn0I7UdpzqrHG4lhMSHCO1ccEarOJ2Ag6hyaE=;
        b=Z6tUCf1Qe24S/l9pnoOdyW27NgnQyScVvOVOuK/yhYyCyeTdSh2aoaZuHNwnsHB2AY
         JJDmH9hTmd8XwIbT4zvVGkpqKQAWh+pyXsdyaIlC0cqFD3P0DjNodLfVEYNOmNA9Aua3
         9f7UqEZ9RhUtkFESTNWAasmIYLc+wcOw5WhcI5OHpmJt+51TbKL7cQqLHrO2JjE2KNr+
         e+4S3LzIGn0VbiC29qE/JOk1swoorSluN2XBVS2mQcC9BKgDAwIDz9qiKyqWYRj84BZ2
         y5Iyikq/cfhCsvGp/gJaYk7K6KNSnjPWOl/p9vWU7v4xKj/eTqIkfNtlypC6btb50npf
         3+fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792742761; x=1793347561;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uU8ryexn0I7UdpzqrHG4lhMSHCO1ccEarOJ2Ag6hyaE=;
        b=c7PcQkGuozTeKDfI373B6sqctx5LYK8dEyidNHFOJaSFRayxJFFH6y6zljHa9t1U0J
         YEXprwTJRBIYKKZO1SGtc/3msRy1zUdw3I5zl2KZBFT0kjPEbM9WhlzofzCuF00ruv4L
         ugsFJhmlvvUHrMG2A9Fulq3m0PFjoNM0MicOIFgxxSoFEb81NQ+XhuuDWU80CaPXcyL+
         r0GEQZqfHPc1Wr0sJAAGQAgnUFNnflxPmzG2ZcdwqYF1TV4nLZVkcpte0N2eoBEGAiMX
         Wiixe+q+orK9mifQkNfu0cuS0u4Lw8VaGB/Pk+Ix2nfOlPlrn5MKfkpQipB64VkhoErM
         MBmA==
X-Gm-Message-State: AFq9FYIWd/CE0m8fK4ff8S1v0cPzLGvxcRCEtk9PmYO2A5Fgvf7MEP8E
	wAj9EQ53ifD6TpxZ+dMsppLUOjTPHmVDLItvi8fitCcY9fMa6A9F6L2aJsuge6X3taOGDxPpfGW
	Eqi1qXZJ/17XQ2YexRBpSLhfce50c9ZUEAqhDIKildlQxPxgMbt4j0QhQPv4YIxJQHRBZ
X-Gm-Gg: AYBFou2bgECkG42eiUgN3rkegxf0NL3B/7rbfrg/KRXy94BdHQO5vcQtIKdOt66f0F+
	5v/18uXKKdiNL9aLQ5ZJaCIWYowAPv/y37gZCo1hlOaCVwUaObzcAZVzeV3pPpwe4g4k5VKg9kT
	InGmGjWCnKNTKqqFkOlQX60NymGRsB5ba7og8XnVkZXMbunjlAtx4jrMELbs+wZJdgNxDzbTjYz
	ThiRHpdOFyDAzYQhk3FwgrrMMCQ7aId0qU/d1VHO01YnV3HLDn1v8SjDK3GPzvK7DfcxaCLMwPQ
	t4FZuZ6ggQf2/ctFay1QeJU0544KzLDFyDHLu+jd6uoiLc2N1rvppQFMUVYxdlm/yhf4/oGEtju
	Hhd17VUaXUc8t1UIRPzSAeg==
X-Received: by 2002:a05:6102:a189:20b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7ccc32bcf6fmr479051137.2.1792742761027;
        Fri, 23 Oct 2026 01:06:01 -0700 (PDT)
X-Received: by 2002:a05:6102:a189:20b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7ccc32bcf6fmr479044137.2.1792742760678;
        Fri, 23 Oct 2026 01:06:00 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46a5cfba36sm74805266b.79.2026.10.23.01.05.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 01:05:59 -0700 (PDT)
Message-ID: <fea00cb9-3ade-44ca-8eff-e2a387074b4a@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 10:05:57 +0200
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
Subject: Re: [PATCH] remoteproc: qcom: pas: Release DTB firmware after load
To: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261022-b4-qcom_pas_dtb_fw_release-v1-1-d92d84a05544@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261022-b4-qcom_pas_dtb_fw_release-v1-1-d92d84a05544@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1sboqhxKM5I0iI1E9-D-3lpb3mLqk_fQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfXz8oy+aqJrOr2
 OYt4Rp8Aa9U96KTPGG2lJ4jUV/Gertl0daStJBlp4UNtNOuZ97cbN+z/BKGGttM6cJjYwB26iUy
 jC+wetyMR+zhlXpjL0RHngqq9j7Ql84=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adb156a cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OpgpJtwNEdfdaaOfhYsA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzMiBTYWx0ZWRfX3NU8yM6Z1LVu
 AX0zQvFMV2iD9dKbZB5pioZrmPWsr0cqW3EjFw0fjXC2tcmg6q0T2/d7XdM+08lXkM5D8rmuAT9
 qoQ46AVZHPs9YB618kalhm8n0x7EoGXRrWoYw6E5znFUxtiP9O3nLTAXRFnAsTCOooHNDMMZbQE
 1w4DwdFX5aTemMG+l3f71exp1oG1ERHrka5mJ8k5qsIqkfbQTxGqCCbtTuUX4DwnSGQgzriS+cr
 fmZp0CXwgQZB4uEE0y9xeUApqO72xP2F6NflZGz8LG5G0eu+TiCW62e16ZdZnXJHXNE+Mi/rvmP
 vP+rwjqqxeTW/OXywtjoHIo3zqAJ8lgAS9UXZfSBXRvJMavQaCWTKLOlLzbP8ed6FvugcBEGFc/
 3e5f6i6iTr8ZF9Z2MR7wuq/dpWqfdetzStdUs9gX1t9qaf3Ka61vZGjMzbNpghJOh6yLMupdZgp
 jvY0PSUyE7HqFB5a13g==
X-Proofpoint-ORIG-GUID: 1sboqhxKM5I0iI1E9-D-3lpb3mLqk_fQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230032

On 10/22/26 4:54 PM, Anup Vishwakarma wrote:
> qcom_pas_load() releases the DTB firmware only when
> qcom_mdt_pas_load() fails. On success the firmware is never released,
> so the DTB image stays allocated, and each later load leaks another
> struct firmware and an extra reference to the shared firmware buffer.
> 
> The firmware is not needed once qcom_mdt_pas_load() returns, since the
> metadata and segments have already been copied. Release it right after
> the call, on both paths, and clear the pointer.
> 
> Fixes: 29814986b82e ("remoteproc: qcom_q6v5_pas: add support for dtb co-firmware loading")
> Cc: stable@vger.kernel.org
> Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
> ---

nice!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
