Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793349430;
	b=n/1bJ5lDeCsgL3rhBS9ItFrnM5/RZv4pZgd9DGejifbK0uII6GfhlCYfP91Fs7VKPEcZ
	 92E2zp66Y7b/p06Vlnv7VyUne5/kdOV9QERauCWbaGf75r0qGKN/jd9oDTJSj5cXrB14e
	 Pb7bOMDYZIcv3hA1CwN3KOl+npQh3LOlIurZVA9Se/kpKw2YcblNgGvmGeJL4Arquvp1K
	 6Xmbj1khb2pdwC4WeEXbOkABfo0LR/y6N8Nijj/QZsrZUTTygU1rkOCLnlVgjQK7RX3Vd
	 JgfON6Bx1HzayAIe1rt5L9kabkyv2xAVQsHOZvTh/FiS4RK797snqGZkmSD2xsWHbww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793349430;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=maEaVUpqUTDE26hi+JSQNtxqgOMz7I8G9wR8nPlX4Bo=;
	b=HNPZBHtPNgsL4LjxP/jLOY2GI+KoKGPR2yCyJ+MWKn6IJd6ywOpb/0Pb50pcU2JFqY6A
	 OBMguOY2ze2FP+kk0epAu1L4HDyAvh3f+nMUHZe8ku4gfCtbxpaxVP95kt/j1qT2aQJi+
	 HpMJSaHzHzMt4gydzd/AR89gXh4cBRsUpMj252q0kekbSLubQiiXkPIplKBY9XHKES2L+
	 gpjNhXf/5YX8qxf2BIR9IvMDsxBXZn4ihlRhLsCl7tJESvE4Bmbf4fn0A/Bo8lYjNvdO5
	 4V9MWZTIAlyHp0P4HeKjBf3DvvraLSjHWyqygtVZTFulAA51B2++suoajs/iPzneibA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X+PBhZTz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OLJcIPXy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1EF4606A326
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 08:37:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1EF4606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X+PBhZTz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OLJcIPXy
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8EqdQ1761597
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 08:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	maEaVUpqUTDE26hi+JSQNtxqgOMz7I8G9wR8nPlX4Bo=; b=X+PBhZTzsT2bbHOA
	jCzcGlz7AqJCqcFbHqAp6gEWqyn8ytJDGWMmZMhZHC8wrcHNxypK0C3bK/GklafH
	sqF0sd9JQMR/JXrOmtbEsCSsdH21IfNCcWRyRmiWXBDfkBWzJp4rYA2NhLVkDM6w
	15JJuJ9T7JSutyZozwJD/OY9GYmgV6qQUISPQRRXTYpxy/QuG1hQ3fmjbPMy5FWM
	WVUBnYn0DtjP1JTqOJTLbCtaiX/aen61I49nqu7qe4amudDJJwzKhu3SGg+np8XZ
	51U9+bS81FE6xtZSEXyhBzNYFS/4EXKTY8me4OQAtQaAu9RG8KqyPnbOZ1K4jB1p
	nPFzyg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p9ywd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 08:37:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f2bdebfc5so12734585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 01:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793349428; x=1793954228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=maEaVUpqUTDE26hi+JSQNtxqgOMz7I8G9wR8nPlX4Bo=;
        b=OLJcIPXy24cFhsMg0ERNJDadrLkOqROLv6IereptNbZXfBNjLeMa9bbWnPFSxX1AjN
         bXcC0/5d4mcr6ocCtUGbjacZDdqBh2BTjneLzPgPxVD3KkjBz/ouq7WHqk2hqNkQoHlk
         5MOvSRw4InYQnKTtd530DzHapmiOZtuFJV1qRedO2VpC3MjCUpo2zyb84pfnQVMEYG2a
         2KXXmqkOrbc6uu4Pdn5ynL+B0JzeXqGoUcrs2v/F8Th64xWw9og3GC6LPZYOQTT/Twx5
         5gu3hK5AIU4AjFSKI9gxAbrvhNXF2nBtX0jcg4PQCOPXUKNEjpltIuLrQ46/DwR4NDXp
         NZaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793349428; x=1793954228;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=maEaVUpqUTDE26hi+JSQNtxqgOMz7I8G9wR8nPlX4Bo=;
        b=sw8Uj+gFGJ/aHRcaD4OcaqWY/WTkNQQXD/D/O+2dq74e0Me/9CvkqpEwmBKoObtz0s
         L+DSZcJIZDB9SoAcVgCXxfnGTd7HA7OzcMK0gDi+wS4XCEpqjPSvqtHHqI59u3710O+j
         im7bkscI4KVqB7rdp2oA7JRci75CSSW5e8Kodw6dL4fSoxVR+QCORWsJcM+0K9IrfgvL
         d7H+ok2rcPB1Zr+kGc6yQE7Gju+BabF626jZLUxwefPzJ7fq9geXD5bAvfFj5R7w6UPg
         Ns+7yGp4ih2QKCqSJxgiByBaaAjA/+utQ5+RpDe3YISwb67eA4IfEsbneQHjRaU/BFm1
         KiCQ==
X-Gm-Message-State: AFq9FYI1OutoEI3N/kR5a43mAoYxvCKs/kw84oARqCaM01QEmgT9fGt6
	e97m5Ijkf1vUfrBH0DN920lxZCxBYT3NK0WchE8u0W4TZzVzj6oo4eUt7xKY3WqprmOvMorExV5
	//yQmTtWBJgG56w9i+PFjPNCyjBO07DZ+k9VHuZwkusB7r2KLTkHAuYMMc5lEh2jpIxEt
X-Gm-Gg: AYBFou3vcF4meC4ovPdiufFNBmAVGUR2ookz3tq3ModsreBN9DVc1WmpAqQyEAlU1N7
	xJa2sXB1AZzQb2eWHwZ8ZaN/KzHITY3hvFoOvmMj6necVSxWt7cZWIUNapuNwxbKwzYFb2VAksN
	CmtEokfBRVuuc0uGa2JS42FTvOz8RaWuNqh1nnG0kMutCCGpX9MshGaRmSQ/vgIzxSfJ7C6K893
	i6Sy1k2k6Vl4ruLLaRrqK3nnBp4znOxFiR3LsSlENdzEUVTUBq7qsJ00BpH60esPw2mO1OHzxKF
	u1cICAvRI1NQZuWmsOgyO6bY5JrS2OeISANTGgRnhRG4+/+jZA1vYER4VX8i0j32A5vhzb/OwO/
	1yZNZ2/tnLK7J9c0jIE/dotxZwIeZkDu2T/ZBeOaVn0PAqaM0WJfBCR2J4j2gNYPTY13ZcOU=
X-Received: by 2002:a05:620a:a0db:10b0:93e:508b:7800 with SMTP id af79cd13be357-9442140aa25mr263598285a.0.1793349428320;
        Fri, 30 Oct 2026 01:37:08 -0700 (PDT)
X-Received: by 2002:a05:620a:a0db:10b0:93e:508b:7800 with SMTP id af79cd13be357-9442140aa25mr263595285a.0.1793349427936;
        Fri, 30 Oct 2026 01:37:07 -0700 (PDT)
Received: from [192.168.226.64] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfdc7bsm40134566b.21.2026.10.30.01.37.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 01:37:07 -0700 (PDT)
Message-ID: <9e8468ec-c9b9-40c0-a219-1c202a5e7c6e@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 09:37:05 +0100
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
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm8350: Mark USB controllers as DMA
 coherent
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
 <20261030-usb-dma-coherent-v1-6-3147b8f7aa64@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-usb-dma-coherent-v1-6-3147b8f7aa64@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfX9r+SnYXzyVpZ
 mzcXL7X99/lzGIlypfODHy4bhBpYNJlpjoGx4b0HR0SV72cKqRjaqKOzg2YnZJML4bF8HyYzkI2
 LOm39XZo1xFUZAWwtbgKanJzPd/C7a4hy3QiprUaRzPXQ4QnJuyD/Feyz39Y1ENnzgVc4lLnqOn
 xuG+IN4+IO7yzgrCESqKeGYHaut7mZt+Wc0B2qs1dfSUwaJ78H3qqwXKHfcfeKDMNepbKUB3ryz
 AA/ndH75hNYy19ftyd7rvny8+w7YvU953rBKOPRmTo7re/3oLCuMkO6Cic2SwXyl94HyQwqCFN/
 vLs5k3TTKR8k0bgeMPoc276aX7cf+7CZgdykpTU+caFQKg8XmTjO6rkG/yetUpIVlm22NIupQYa
 4n1t4O2E9ZRY0ytaUEQmxacqeUiLYXH3EbA18OeG+xKj3AKjKRWYGhpc3/8gO7XjfTNVzkmfk5z
 GF2GT5Jag5j/zQMEwGA==
X-Proofpoint-GUID: x4PKpbK_osFD8eWtUU-NgHcLoE2qElob
X-Authority-Analysis: v=2.4 cv=Lp4HWXdc c=1 sm=1 tr=0 ts=6ae45735 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=ekXOaHz3wcDJCqmUXkoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: x4PKpbK_osFD8eWtUU-NgHcLoE2qElob
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzNCBTYWx0ZWRfXzrh1t0Hz7w0x
 CPXDL4XvfFFXbhjMNfE5PD52Y2tbxw3ndC8VyR75Jjd9zkE2CD86IrHJHWBhHFLAuUj3TEHb8Qh
 rAU6ELfvFZLFrxOEs+MYzMn5af64R1E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300034

On 10/29/26 7:33 PM, Krishna Kurapati wrote:
> Both USB controllers on SM8350 are DMA coherent. Add property
> indicating the same.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
