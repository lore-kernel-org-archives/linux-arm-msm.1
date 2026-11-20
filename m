Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795165959;
	b=jh3YFOnytyWYREV6fgoNbuCvYmI2hK5A1jbntTbxdTfhe0VE+n1kadsoAoJhxMuslQEr
	 JJZec03SWISHb7ZSEoiak7w/Crzf2wSAMWPLmzYao3WDBZIYlE9GBrn0AjXc0qfWGJI7d
	 tC1xZxanjIkHFOctRgCf4B2OtYLi0UMdEwy7O7U6kzE4EEw06aa99tUwSX4qNJnDdr8Sy
	 hszfE4iX2+1rfWf34bWLROBuo9q+bKkZStvmDE4tRyeB8lA+5j4A9x1grgblODm/h7PDQ
	 pviUhC4RUcfWVwVmU+YdJNVy4YzE1TJ15VtAHnhURphhCjbfYgFbHake0g96H39B+vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165959;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=d3BZ10q+BZiu4ItFZt5tvNVcjVf93WkrVqzDz3UjTWM=;
	b=iP1sDa8RIos7XqT5Hnf0pK7xD85sS/Y9d6kRX2Emo5mWFXThQOHXaRAAsW+OpTk97n6u
	 G5VPqRb34dco9o+nCmkmlpizkuaAMnIr/Z5NXA1XW5/zRp5ylB+pVj4NejoDg17jzRl3W
	 DYbBCmzrNZzkDgG+UsAJor88VIJ3cAxh9N7NXL2fR23fYZl1S8wTXcwv8hXEtSdE7DPXg
	 EYleHmEhLy+uAlCNQ/PqJf3pcCDxXFwrkvs1Bei7Kx0gzbwDm29ReTD7rUmuUR29jUKAu
	 REZ/xdHrZu8HgAqSP2GGocpsnGiQYBmZMBq6igMeMUEYrZFgRtBB0b2zTbTSdzREywA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gVmAKGJ+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eW3Qo8ui;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C4E606A326
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:12:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36C4E606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gVmAKGJ+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eW3Qo8ui
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7exkD605993
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:12:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d3BZ10q+BZiu4ItFZt5tvNVcjVf93WkrVqzDz3UjTWM=; b=gVmAKGJ+bahJTHDM
	2Q5EMVxlNljNWHr5+3+5k0Kj/AS+2b+xDCkX7V3JNA26pZfiwl5qg+zSYgbuzCra
	T5F+/FhO2o1HuwI8Q3VQh7Ygj6v9U9rg+x5DYySeRj2ocL+oA/ddxmYQfAeDPrI0
	fI6zq2cvljcn1ONBrR1dCE8bhD4Et8tjGNVpLcfJkEkodMvxaju+ct3EXu5FkY6U
	ZtRsgNtZE352+kkE8H534/8c8XW3HgBC2CA6YdqWHCtZ3vTKzLPBKRbBaQ0DyCg4
	nQcZXCbuZqSFHMMq5IdXJI08/e4decKvfpkDYEBhfC3E4Y4SVBSfyjtgqQN6aiMk
	Y4QjDg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2ggqrs14-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 09:12:37 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b3a9826f6dso792385a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 01:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795165957; x=1795770757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d3BZ10q+BZiu4ItFZt5tvNVcjVf93WkrVqzDz3UjTWM=;
        b=eW3Qo8uiqxjMDKgH/wEW7yBPXsyMvciW2yMkJJ2z3R8UVdyrNa3aIZZs9vop/LfnSL
         9GKwYGY5TjrVDuer5mP3X+CefYs5IFtfVPM78GxBLAbFjBhIKoXrtj9NbnI3nGLxsiV1
         F2H4Ihy8rDlId0G0LmQ4itX8sOEIjSFw2QVXEHQk2rjgzW9iRQiqInMx/4hWsYtQlX1x
         yxQKzwlypTvCtiZTC8BsalFv7YO1+rzJ8YNvF7Np2dPvJnNzNIwSdtyhW/dP90Hc8DsM
         4EZYg5JOKGm9UM1GU3WqugNBhnQD0Q2Aoq7ENWlwhNqhYvIw+jp6ueOqnbqw+lJjoRv8
         /+Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795165957; x=1795770757;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d3BZ10q+BZiu4ItFZt5tvNVcjVf93WkrVqzDz3UjTWM=;
        b=GJTi3fZL3Y+5HxO6Ma/6TIHAlAIWWyDXkPZeusSYnepUZ5eEnyJN/vFmE/djv7kgNI
         t93WCrebkbC15ov6+RVVInCKeeWqlHjVPE2EeaVztFcaIt+ML60tPtTfqiVoV1pPYHRA
         Bp0/5dsjCtLhNSG+JsPjMnQ2mnCzDyK4NnIEf8xxH9K34CZnICoFz2GFRN0LMkFloZYp
         hyIm+IdORcffEWcfoyt1HMUgv77fY9EuYqJu5uGIstWRFJsFkY7L6Jun0poDEH3syM1c
         V2utTuBH/UmHF0LWF35Dfj13wdtN5enGUOxjI3sGf58Z9oe9aK8LHdXjOxJNuMa4qaGN
         eoPw==
X-Forwarded-Encrypted: i=1; AL+hErE2nFMGKqeMwAAnp+Uvuf+tGnyf6q9/KqfAT1WaKXBZelpyDL3Whm9sld54S7TvfNbfsmsqJrzfnlloGCor@vger.kernel.org
X-Gm-Message-State: APuU4Z+QEcuDyl2R1HmcHezS26L1mDywUysdL+msSodk35mL7bCJqvUt
	18bwhX9WltFa8EPxcwM/xfFvTNU9V3glyZN3yW9RT4hFVgNC4qVbyV+J2+lkrdBDDAi1asW3WNz
	FCK47bzkohhY2Rv59sI2zrkZbaU7IOwn1TdaP0hkaBGed35g9heWp0EBqqmJGMNZaTk1z
X-Gm-Gg: AZFdTZc5wbujFPhneuhGwORTP9Dqd/87fzacy8ctQWJOb4v+PAywjj54PEo5aLQs6su
	V6ESO7cM1DWOJSpfnABcdd+egbhcbLdHuQt9E+vehN0y15PHU5tjlbne2829LfuipSj/KAkSOqd
	TKWD0l1LgTkKMXKo5OrPAUlA0PZWxjb7wNTgjbyM+Tj05p2wDfDbeLeaNoz9BZByctcr0JmJMrI
	BBOXupf8xa8QkK9pweyTVSvbgc1LU+9jBo9nDesGElvCSGynOhUyaaAYGuk3TzKchUKsag0kx7P
	IqzLIABgktr4DnSWuImaZ/vbZNOjAn9kcDz28uoel6Fn4Ig2Vb9Xofv9V3S9KKK6WhsP1zans5Q
	+jG6Mbc0DVxV+WYVo/xJDu/Gqyhcm2gLc1jflHtAJvGNxaDHV67bslp3ntYLcSsTxHv3NOnMPzp
	ZCBJ5CqQ==
X-Received: by 2002:a17:90b:4a48:b0:3b1:4018:bfdd with SMTP id 98e67ed59e1d1-3b41c7d5cc7mr1980986a91.7.1795165956832;
        Fri, 20 Nov 2026 01:12:36 -0800 (PST)
X-Received: by 2002:a17:90b:4a48:b0:3b1:4018:bfdd with SMTP id 98e67ed59e1d1-3b41c7d5cc7mr1980952a91.7.1795165956350;
        Fri, 20 Nov 2026 01:12:36 -0800 (PST)
Received: from [10.217.216.47] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41ad92c07sm3483495a91.13.2026.11.20.01.12.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 01:12:36 -0800 (PST)
Message-ID: <8d7db2dd-6338-43d2-8eca-fd6db3e7c512@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 14:42:29 +0530
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
Subject: Re: [PATCH v2 2/2] clk: qcom: segcc-nord: Add I2C and TSC clock
 support
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org
References: <20261119-gcc_i2c_tsc_support-v2-0-dcb91a0b0013@oss.qualcomm.com>
 <20261119-gcc_i2c_tsc_support-v2-2-dcb91a0b0013@oss.qualcomm.com>
Content-Language: en-US
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
In-Reply-To: <20261119-gcc_i2c_tsc_support-v2-2-dcb91a0b0013@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNiBTYWx0ZWRfX0iaF6QsvfbVp
 s1+F2dSirk1mbGMf06reDqgO8DbBfyL71Gdg05DOsIxogFXqcYrK3rC699gU9RrAsb2B5iCVV0W
 LvVCzWGMJw6fbNB5D6eqNPU+RkMo8LGvad/CMzokW7aQsWJJIzchwb8yJXhM/TdIwwIEL5+zlxz
 zY0tVMXY9SZa4msJH2yS41O6bCeSEPA5vyIuVlYeEZ39awRla9F/jnNf34wwOuYcZakMW1F52Bp
 qhczpquUVVLROGtEgwwlop2jqg3StU3vDA32rKyTmYiGyz+YATy5RbvEwyv1SY9LyTxYP4F+sQI
 gbqRxDVZVJ/8VdsgYzdLILuOw8LObFjD1YlDJLxZc7k6JDlH90SKtOv8djnAuVV21nzTcvYAJ8b
 nL3DEa8S+PwCnYXUveoLGS2633EtZhUWQQgrUX787y1n5RTbT2cKvwQ4xPNEuPJRotXYSsSzquH
 wPFw9BQzFIa3tgzSAZA==
X-Proofpoint-GUID: vzvLp-5GRcZSupl6dNnLnRYxrnkPwgCD
X-Proofpoint-ORIG-GUID: vzvLp-5GRcZSupl6dNnLnRYxrnkPwgCD
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNiBTYWx0ZWRfX2TonPl3Mm1j6
 b46APDb3biiUEUFvt4vFx3wC8kKxdVcNxHrJCoz3rDiAh3RalIClX4G0GPOxBG7VqFctYaC86po
 FqIVNnYSRy0RPNXRCJQqflghY0VAxO8=
X-Authority-Analysis: v=2.4 cv=CNy/zhrD c=1 sm=1 tr=0 ts=6b000f05 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=-HzP2oy_C0ZWqF548KoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200036



On 11/19/2026 10:34 PM, Taniya Das wrote:
> Describe the I2C slave and TSC subsystem clocks, reset lines, and
> parent PLL needed by the Nord SE GCC. This permits consumers to enable
> and reset the hardware through the common clock framework.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/segcc-nord.c | 135 ++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 135 insertions(+)


Reviewed-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>

Thanks,
Jagadeesh
