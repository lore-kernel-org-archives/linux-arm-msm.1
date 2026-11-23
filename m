Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446915;
	b=jWi/OA069Hr3NOg24IA4RtVQcmszFvQY6NIzPBv31RrgUZMCO6sxxHP89Pl2t+FTOP0G
	 4W82cy1n73WFS1bv+DF++GvZyj9jgRe0rsehZIBabL6EX2oioa0XTMG3TLfGtlGxcEZmq
	 PY2nqZSjQu4Wl5JKh6Tl7BI6l/LFLsyYKrGFH8BlCpaLox7nEogP+DN+TpH6PxQ+hkOq4
	 QbVDeF08/t676a9KFrlX1TiqCHzgldNSdmjVjFId590B7viB7xUgCekVRLqy8DOBgwQwJ
	 nFI6WOZLpzH8nhiYP8ON4NsXeFACjS7FwDL3K/mt03v5fTN4tl95gpwamOJaDcQcueA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446915;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HaBeftMUnhhxBncFQazPbThqnWVC4P2eztZbGx3F0P4=;
	b=GeV2S6hHBQkbMUssP7KrsT5eRUDxlQQ/14ae/2s+zQl9aq7O25RSmn2hyGmD0/NgQGML
	 xHHrRCcnRsfJemsGghOXwrVBI4EuWdemF6CfmS8bntFHjTgDz/afe6e3CS140iqBYHWCe
	 66hDWRjDsB7YB3QfXnW4+GPp1VWROU8uslPRzXpLqIGyQVeOV9Of4HU5T2R/ELY7Z+JXx
	 jACcRJmMhC2RAG9tMK04uGeECqtCal2jWwL1xqIzYqvCOlfNDZ5Ux/KfGyQH+Kk8gi3eR
	 yKGhj5q+GfMP4Hp/J/EpjNB2syyZVVs7Terq97ff7g3sikzRvUtu29vMR3QvVkwa3ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=miUWy5b5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AKazSnZJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B50B606A32D
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B50B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=miUWy5b5;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AKazSnZJ
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANDKpVS2621967
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HaBeftMUnhhxBncFQazPbThqnWVC4P2eztZbGx3F0P4=; b=miUWy5b5ZANW8IKp
	Na2r8bcMSHfcln7+zoXd0GblNMXm4e1yjRLhErWUBO+hD1/vAY3LnbKm+BY4WZS+
	/4d8K4xgWjXVU59BlYH6e5+lPlr3l0U7sTYYKXgE3ZworqYyJeq/vs7FphF1UJ/u
	i4szEixBq8fb1kEC+nymrcg7PnT1lG9kCLdQmBIeakHJ4XYUncgm27qamWZFO4Io
	5RcqvJNl8QCw2fmOioysZA6c4GTEqkbLbEuBFeeHBElvLeBgka0rBjW1GeSbivGz
	IT365o0f4e+j+csRjCn9N+a6nEDz5N9PZ88lsWTTFeFz0n3UtBrLXhNdsuRuT6Wk
	FmY5Kw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1pa0xt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:15:14 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92eebb130dcso32103085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 07:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795446913; x=1796051713; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HaBeftMUnhhxBncFQazPbThqnWVC4P2eztZbGx3F0P4=;
        b=AKazSnZJ4k6jlbbfPGwKQxb43uPx8+SFUQ9QoAfAQLi1I22rlTjxKF7AWggQEAkcwW
         RW6znDuNhoDi54yImd/tN/QUQbvnaOJ0/KXgGb4MaY7S95nJEFexWks7k1I9o2bp7ln9
         QVjHDYFvmHvghykP4/DXQiq1qKDD544HOzUc3sVKGJ7zroLilpduzsJmF7w5xlZPzpNf
         HX92nFOIVogWMint8kzry228vfQ68ZnKGOT4V33/Z6fUBJEN1OOG+2o4q1Jd6blt+vkQ
         oc2aaDAwvx0TkhIod7MUT7H9BlZHuxBS31GXVZeZYWLNAGIrjKksdSJrsNbrCNlh/bf5
         ZuXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446913; x=1796051713;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HaBeftMUnhhxBncFQazPbThqnWVC4P2eztZbGx3F0P4=;
        b=ERlwMpgHOqeqCYj21pyJpiRaCEhym3seMJfD74YoipbqvCjk+QyCjCGUpw2OnKVLm6
         fnl4oFPdTdLmHT/BWtGN0rx6muo9fXNt7hdI1aWBAGZTX3l8XWUDW2SRoWDz78XdXz+i
         D8ATB494ygZElbw/dHwEm2nUQOe67hdt2Q38dnx2c8TyUeNByD31Hr7KDcbfkpUPrSqV
         LpSDpKanSWnB2xroNgf9XVgYfxYzxD0H/ciOCXrEh2ideYsqUo+4Q3afZWRmnitTyc1v
         +noQo1hX0cevg0K8okIg8AumZ4VOxXV7hrEmovFD9H6xulJzzjtJtMSsVeJAya2YuRvU
         i1VQ==
X-Gm-Message-State: APuU4Z8utoQ9MugMcjFi4ITECBGWAqIn9guA05ZUH6G+mIcaC5f6ALl/
	gYdb0sPTXA0PxEygjKGacvmibabZqNjC+yaQV0sCW5zQlWwlFVrU1aPNTWwjH2kSw5t/L3HXYXM
	tN7iSteDiZKI1U+kYEx/jw79XgEOshDGqzVSVRU+vXxPagnDgLYgmPdxh4phxZ8PlXK6n
X-Gm-Gg: AZFdTZfyaYFGqj540G1sff+U1TYbeUcZPQQfXACki3KXajblR+U6VnCp2kqufra+llF
	Zau/QunjUssyLyScE3zqAjdDtE+Fi3jPJewqu9y6Wv4VM+OWRKhIZcP77mXnB5p/G7OLLN84PCP
	yKwdMp3cJCa+9mhBqr+c/xwE8n8VFcXeTl3tU4Rw5UaL6ZUrba81xCLxYnTw1VnTSPKPwgJmvKf
	bl6NoIlSgQer38yTSah4fQlnNHdajmPRc7/KCLg/G0aMVEpK1AhXGeqnKN6DhkMJ53jQVUFasq6
	vQWsmRko2O8s7wta3wdkKyVhj0015D2KEFfaDy/mdXSBtuWT54yVMMWsbj+aNrtRZbZckGvTywZ
	ZJIUMdEFQjECzvKkdXxuJ1LHDxiLNU/EPu3yo7cOpRQflthazRMpdYvLFuG4Xd4B1S0Ye1RU=
X-Received: by 2002:a05:620a:6695:b0:949:a3e7:e0e8 with SMTP id af79cd13be357-949bab1195fmr1767818085a.4.1795446913005;
        Mon, 23 Nov 2026 07:15:13 -0800 (PST)
X-Received: by 2002:a05:620a:6695:b0:949:a3e7:e0e8 with SMTP id af79cd13be357-949bab1195fmr1767803385a.4.1795446911796;
        Mon, 23 Nov 2026 07:15:11 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba37109b55sm5294415a12.32.2026.11.23.07.15.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 07:15:10 -0800 (PST)
Message-ID: <320255fd-75ee-4a4b-8399-ee185758c71c@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 16:15:09 +0100
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
Subject: Re: [PATCH 2/4] pinctrl: qcom: Enable by default MSM8917 and SAR2130P
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20261122-b4-qcom-kconfig-unify-pinctrl-v1-0-f0068f161636@oss.qualcomm.com>
 <20261122-b4-qcom-kconfig-unify-pinctrl-v1-2-f0068f161636@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261122-b4-qcom-kconfig-unify-pinctrl-v1-2-f0068f161636@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: mC4dI3Q-lL6aPumH-BTMEbTKJxUYKrlJ
X-Authority-Analysis: v=2.4 cv=K+O3jCWI c=1 sm=1 tr=0 ts=6b045882 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=qJ9BVZF9c7qZnBjrwvsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA2MCBTYWx0ZWRfX0DmCqe2KWj8X
 1YBvyJ3ceXTHB835snHKQL5XOsXxupAEhpENcBVYNj+xAxtCCSAe9+B0cQ1vIihuoyFcKyKZ4It
 y0L3qG4VPcy6DJNrDQesOy8OPD+UPhE=
X-Proofpoint-ORIG-GUID: mC4dI3Q-lL6aPumH-BTMEbTKJxUYKrlJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA2MCBTYWx0ZWRfX+E7QWhnyXkJm
 MeI/ilwmIC2dMW4lAbkJNBuRpVrOY20Dm7RxkGsqlwmRHLs5RduJwjkY/LceyBqZoix7J78ut4r
 ES2ZxeCphQOGIXskSi9cYtu+JwNQ6E40EhaHEz2umvuNLqrwwf4G390Ae9Y8cGwpIUD8Mwd/pkj
 GhEyz+C0nzvDFtTLyCS/Dssl4gQEfnLrfajLxTxkqQ92nNVwySvIwap/ojIWXApInY64gQppxye
 A9xKtv0hZLnb49Wl1PbVBjCJJPB+OhzjrM8nPeIe8XIkv6yywIwiQJ2Seh5HdXHxBJaOUskzLxX
 PWxFVMYWN2zDqTqAyUNbJ8uwQVkgYIlc6o5d2MjDVrw9kx2i9xe1D1BzogI7jmBDvaqguM71dVP
 wYGx+p/CUSf5yrn8KE41b007RUUScwqyDn9/w4OQSmJHw4AbyzhIPmXceoWnxMYfwLGDYIkm6Ll
 sMo/JIE4jypqsGDpVnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230060

On 11/22/26 2:34 PM, Krzysztof Kozlowski wrote:
> The main SoC TLMM (Top-Level Multiplexer) pin controller drivers are
> essential for booting up SoCs and are not really optional for a given
> platform.  Kernel should not ask users choice of drivers when that
> choice is obvious and known to the developers that answer should be
> 'yes' or 'module'.
> 
> Enable by default pin controller drivers MSM8917 and SAR2130P SoCs to
> match above expectation.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
