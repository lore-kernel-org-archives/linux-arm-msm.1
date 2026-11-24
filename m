Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795508757;
	b=qGlSLFzLo7XI9+0zmfGz2w4WJKRNJcRhdrY16vhyYGgUQbeNHkZB8SKEVQng7f8w4nEB
	 go1eDEn+gXTwc/mzZUfxqTDdutnjQ6E0RIwxE3/sP4kc3RcfVlB7Wqdsy8rS1U9VG+bEs
	 hPi15iq+raZIhOPL8T91PgWW1l+cUhlOgDc8iGPqEA2aGDgMB8xv7WQE0uckkTvdgTp4x
	 DyCGG/5NiZ3+YGAU6SwbUqlV/MlfsS4DM3BnDMiFFPTrj/JLt5mkwP12iTgqedZCK4Sxk
	 rlaarCvWz4DSsoJfu3GzfiPAnd41jOREyiuVDRexlWUBM4B/EUAFjgtPMUOlrkKtTDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795508757;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GCTNA9xgCHXdB81WrISHqlua/lWBZnpYRxHVBs5lH/s=;
	b=OaVdy6hq2IlKIYIvuEw7nkriwrhrWsbyOcCr+kvvTRKZWcjcOYwMleW0+T11N199B2k8
	 116/PYtgEWJn0wlbhBjAHUKQhNhA7YUZuj2Nprn4/NlvdSNSiBCHt5CGqOB0QoQglhy71
	 FOXhrRg35xm3KWSfcFldCtJz8GskqAl0vGs002tkFEBZF92jex8ple5UZspeJplPVbUkb
	 +gLGSKt7k/326lZ7czjD8FXq9LEbeiT00Z+SqfTjAOnjQ485bQW0sAjjaFAs8O9EPRIaO
	 z0/aqTE+mJLgglPdD8KX3SnshxdbJDG2u8srYPJpirm6IWw7a3JWHC9YKr6dmFx59LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gc0jjAbA;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HkCMqgTP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53EF606A31E
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 08:25:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E53EF606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gc0jjAbA;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HkCMqgTP
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO5lpNs2848086
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 08:25:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GCTNA9xgCHXdB81WrISHqlua/lWBZnpYRxHVBs5lH/s=; b=gc0jjAbAvL/zSslc
	utmB9/45kGAqVWnWEKLkVkANHSp+F/eDR8HDF47GBRhaa6P/Zlo1knyDckAZtx22
	gLFb6QV08z31iLEtSn8/muvnyj5dAvb3vX+oFkBNNdxLCK+QD4izuZ3tz7lD2A55
	qK1bzWfhLRyQuv1q1/wSIFzU003NDgzv0bsruifBYaXx00dM27jWQSBO+9sSG/eB
	Tit7+yPMmOQJvFikdlizr0bj5OXy7LKXjGifGlumL5cCj9sNVkw2iziPMWddiQHG
	JurgFCfgXaVyV4RVkURw51ofjxSgMHaqXayXPect3KxNuZyGwhJO+K4Q1zDa3lbR
	6sAo2A==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j54rh8j88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 08:25:56 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-89fb6a45c48so3273253b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 00:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795508755; x=1796113555; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GCTNA9xgCHXdB81WrISHqlua/lWBZnpYRxHVBs5lH/s=;
        b=HkCMqgTPTpd8uWgqkNr6g/4dDJc6GOtZaHQhGKJwC1xfwaSJ+M6l5+yBJ++SbuGtCj
         jQRA0TlFWSflIc+CsQ+UZTxYaqJNeqtqxD8yD+tfW9BBn/dL1zoBGnYqdPpnTUBto4Ol
         gmJADUgZk8zfOELRCDWCYD1sbxLkw743YPUYCMunThFYnNfQ+cXY5juC+63JGQWotO3u
         PmK38Pku8tVqTvH/ja4eHPzV370XdCV29USAY6kTcLwcu591CuSj/se0BKFbmGTDnBzw
         p6S9uf78mIOKgbU+kdGxUJD/Qa82NlwjpPsbmnuvBYZ7jVTjsnsqx1ufvXyB1xABjjaI
         cFng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795508755; x=1796113555;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GCTNA9xgCHXdB81WrISHqlua/lWBZnpYRxHVBs5lH/s=;
        b=Rohp8oHObWZwIZefoaJ9vJMtt2o1mukYyVmfayRA3acxJrzZZvvCldfAf9dbU82kAZ
         FXWISW+W9Fs2t4KZlq/XArFB4Jtnt/Un2LhJ2HX6fpb0uodKKEc2PjACSJPZqL6FRX4Q
         x9QO5kgX4rAs+1ygAlDKRY1uca59mi9HF8hH1Cq3NwzDVpVCHRArl3S+uoXAnjLJfc7k
         hIWBb6RkvN5J5jVkn0EZk4DU1iTU5x/X6CqrJyyDPO211HOUl4ZdyxPaKfNcFbtdcJLF
         jImaKYtSjuK0d/85Dif9YZT8GPLjKw7j5qn79BUa7t7znw0fDlidjD2bbz2YBkw3IDHi
         cj0w==
X-Forwarded-Encrypted: i=1; AL+hErEVKu3aqjmrQkxUh3mSRBnbEzObfJ3V35AgXyZn206mmMTLEpEXgOpkzL7xtSSnvNQNBg5+XjygSeBeGo4U@vger.kernel.org
X-Gm-Message-State: APuU4Z9D2uV/rePix3z38naxTp1THtWDeM6naYQqVB6sfrZsokw6FwLw
	FYaX2zr6MpkDJf/LSHfMul9bRllRr1fmrCO8oxWpcGNsShvfuw6l+mQ6l/FTaAusVDh9uEhVlCr
	11tqv3jLLi737RGqq+7HwXLGZlMVwX00Gy6Hbwa2TwgZy6f+EMcCCKS2FrWUOqk7FrfIW
X-Gm-Gg: AZFdTZcZZ0rsQAFZspxoBm/cK+jrG3/OT/qLZo+QkjWM08sLtyZLTWDnT7eVI/z7gki
	gjIERxSYZ5HNk7HTNOhz4N/mAhYJnWfUmCCSE2I+dsuM1yh9pFztAYcZPeVhKzoNLUTBInUnCer
	2hXPPmDPm85FYsx9n+mlFEERVi79XUdeRarUBhx5cTx2X26bKNTCAZ3M5TFiprLF8uWP47PVxbK
	TITKKUWhMXGfctGv14r146gDBVN1LGbQGNhBUXxrapohWB4nIHQ+K1c4j4XvV04/43N99vbIX+C
	1b5u38xdgcoBlTCUffUNvrW7dt6BX8hfqYVHGR4bnVvQw8+ZfmlcY6BgIpQnMLcJ9ulUs++ZWlW
	373Le5VslN0WMWCzgHYQoGYURQE2MtZjsQTDcUMTPKX+X01pFyheYlAlfFIgDkt/oapMarrw9jQ
	dJ+sU=
X-Received: by 2002:a05:6a00:f8a:b0:89f:7a1b:2bf4 with SMTP id d2e1a72fcca58-8c87baccd9dmr12143585b3a.16.1795508755351;
        Tue, 24 Nov 2026 00:25:55 -0800 (PST)
X-Received: by 2002:a05:6a00:f8a:b0:89f:7a1b:2bf4 with SMTP id d2e1a72fcca58-8c87baccd9dmr12143555b3a.16.1795508754869;
        Tue, 24 Nov 2026 00:25:54 -0800 (PST)
Received: from [10.218.31.125] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c87343f726sm7129262b3a.36.2026.11.24.00.25.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 00:25:54 -0800 (PST)
Message-ID: <f3ee6297-fb83-4b1c-b083-f3b15fa082b5@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 13:55:47 +0530
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
Subject: Re: [PATCH v3 0/2] Shikra: Fix qce configuration
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Wenjia Zhang <wenjia.zhang@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
References: <20261116-shikra_qce_fix-v3-0-9ae31470ef48@oss.qualcomm.com>
Content-Language: en-US
From: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
In-Reply-To: <20261116-shikra_qce_fix-v3-0-9ae31470ef48@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BKkmP1QG c=1 sm=1 tr=0 ts=6b054a14 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=4cre8Lmcb22TJlfxBc4A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAzMiBTYWx0ZWRfX1Z25hQwfE+re
 5hja0zHe6H5QpXstSs8w4kFaAprmSX1jjRFbA6hjGVlqFAtnmXRHechfMQ8xZqtr7b5AEunY++i
 gOP0gJUZxNiRdIPXcNzWMkV5oS7GCZE=
X-Proofpoint-GUID: 5_dqcsIvTNQEqvKWoDRXFIuT7_J_r_VS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAzMiBTYWx0ZWRfX9RqETo2HEG4Q
 Y/XuVxGRbowPRPDHdAsXCktRE1WTznww1b0OyvW8inajZHFrBosIAC3IcXW6Is+czPLFjI434vm
 p/UobkNCDtsc81cQQACvnCuCcUELxlIEAmwpjCo5tewG+sJPHK2RkBK0JE2G24AvmN5lkv2ep+L
 IpJL7CgWJqpadxHHFbz8p89/qi+ubk3INePsIpI7NLA1YUk93IZ9QWqkn/HXwk5XriyzV9zZZBs
 EFD4XyZTRNVvDCVBMEmG0EFmRKDD3TEiR/PRjektRR3rnFK1N+Jz9eJ/O3zOeI74Q3hRCVJQQzF
 KUey8GFxIczf0qYECMWJXU0JUR1goi9SWN74c9laY8SHmSnHjORbMJZC/TfV7837bojfF8Grj/s
 SbNz1aaHWVBoxb1N9bZGjrgZ7sUp+KGUZvjHMSX2mjjh2mgDkRiTX/EHMTvWV4nyt2yC/TsnCHz
 5HLO3oci/CXD5+GTszg==
X-Proofpoint-ORIG-GUID: 5_dqcsIvTNQEqvKWoDRXFIuT7_J_r_VS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240032

On 16-11-2026 14:29, Kuldeep Singh wrote:
> Herbert/Bjorn,
> This patch series fixes QCE on Shikra and targetted for v7.4.
> Shikra crypto qce binding was consumed in v7.3 but DTS node got merged
> in v7.4-rc1. It's important to merge this fix in v7.4 to avoid breaking
> backward compatibility.
> This series updates shikra fallback compatible and hence, both patches
> should go from same tree to pass make dtbs_check otherwise patches from
> individual tree will break dtbs_check checker. If dtbs_checker is not
> blocker, then patches can go from individual tree.
> 
> Bjorn, will you be able to pick both?
> 
> The patch series fix description as follows:
> Shikra require explicit clock which is omitted with current binding
> description.
> Also, one more reason to update shikra-QCE is, clk-smd-rpm was doing proxy
> voting and crypto was consuming it. With proxy vote removal, qce need to
> vote for it's own clocks explicitly which is already being done for
> agatti target. Adapt same mechanism to Shikra QCE too.
> 
> Validations:
> - Qce probe and kcapi_convenience.sh tests.
> - Correct clk_summary output as prepare_count and enable_count are 0.
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

Hi Bjorn/Konrad, Can you please review and comment for this series?
It's important for QCE to vote for it's own clocks as dropping proxy
clock voting(patch in review) will result in QCE issues further.
This series fixes that.

-- 
Regards
Kuldeep

