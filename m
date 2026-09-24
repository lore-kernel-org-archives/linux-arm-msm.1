Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D593A5E89
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 08:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790239829; cv=none; b=dsBpa/ZFMWd4C2SkzVSMHpZBzOlGqMs6+/JWXHTB+Qt2qx4Lrip0Hf/YB8c6hqIgGM9M15lf0BNVw7L1j1NvN8+HteUMkOrGw57LPXSFR69gnYpAQdMohLfpsB22a6xtAaLlmmGJpR7Z4z3q/l9BH3aqOpaNEzd9ULsU99zrlEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790239829; c=relaxed/simple;
	bh=hPMLvh4B/qutHl/1Fl4MO4beSnCtt+tFPmWl1Tf0ZII=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DNBWE3jvWRCWuWAyAaY9ct7qKKp40qHIIAFcqvd/6cfCittJ37jOPmf8aZ6roKIoPFq+XcJPMloZfL8qxB18MqASgLwbynkbufwXvqhLrL+wSuEdAnZkqfQF7aBZ5MKy0YQwD6Mq8tTvtufXRY+ffj2ppFWJbIZjNFUykGESY9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XHGTMWb5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mn+5tXq9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XHGTMWb5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mn+5tXq9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5eRpj1278472
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 08:50:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=azU4cXOkIOMdloNfjSq8Jjao
	n75fPsiVrta7+Ugvieg=; b=XHGTMWb5F8EBM2lbERFdlwJBxN9bhaWMv+yAQKXZ
	SyC+6OBvmo3c76liw7hiNHJKv0pz1IIMRVL4FKsu6QiXv5o27OHE53PrsM1zj9O/
	h8xhzLp9lYc6RokGdgyubh44p20TmeKX/5P2VFHxRcj/ZW/7zs3+QrBcd5DlE7mX
	4w1h2VVhm8S1YVPCNY5yGCN89FeD7HJX9fhfbUG8hcYlyJhSD064xiBqTbEgwqjk
	CDXKsiUEr61CmI34PchFcwDRJfpuF4Xjo7m0NvgdyUKZ0vfIgV7etsUBtTRjxP5w
	Nzf7jpYNThbqZ+1PgMJgP7HXjci5tRWQdJ02EmTlX52laQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvhsb3gtv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 08:50:22 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1416f32fe11so2787073c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 01:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790239821; x=1790844621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=azU4cXOkIOMdloNfjSq8Jjaon75fPsiVrta7+Ugvieg=;
        b=Mn+5tXq9RtkIV9AIr0uC4CK3f2dANTZgBRHbVO2ENgErZOGf5hVB4VUeFUuy1Fsu7Y
         gxC8nrvdR0RkdljJmLzYl/fRCFAx+WIiecH/LaAtkPlFUGfEnSFUPGy60qhxke3BQ5np
         hJY5+X06RWKDl0ZS2Wy/gW+DsmUDIhoJTpoR2u3pbdwboaIdJH/OKZeMEOYjkTPQ9v39
         ike/MzYbbRx0x4qpZSvkduMdrx5kvJYBl5waBY7V0wWLqIitMIxrGpUF/pYwPhOMFxfm
         mmvx1oDxVUMc895PpyahyW80F5NkZLwP9s0l8HIlBtJoglx033cbj6pUItClyXq4SFcn
         o0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790239821; x=1790844621;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=azU4cXOkIOMdloNfjSq8Jjaon75fPsiVrta7+Ugvieg=;
        b=Ex3AhfUQAXgizEmrGh5OKU/w/sswPDAXnQWhZzMQnT6doZX07kzdY3nr/JJU8qthYv
         aBlinPehMqhXS7XjuGcI6N5csWE11yV1hMh291w28vxtu9LApxAAkarye9QRu9xK+wyD
         D5++51sYFNewO+jr4zBq4gNjwNVDrqQaaEiCPQrL4DZeMLybsNv08JzLM8LAomqnc4ty
         TJXF1edbLW7aGtBFIArXs5pxx1WbPVFJyu4dB1C2QEkWte64ZpvTOf13uAZk+BYz41SP
         FCWcqDaEmD0Sar9NH/0lWaCVQaoWDOmnhWB+JP1LJRH4xtUeLfzi8X0vjoAA7dmFLqcZ
         K3Yw==
X-Forwarded-Encrypted: i=1; AKwUvBysW9Ky8rQoqSMLLEeRwmxuw+p2B0YjTfiwyrekPVz3K7UOrVZnNRm8yvUBcZHFt+lJzN1oJdqBQadxmzAQ@vger.kernel.org
X-Gm-Message-State: AFuF++nuFkYppr8ksF8FSQlnyWyMoM7imqSFMUxJOd+P7Bp66+qSZxrk
	nPnma+MUV6gNu5wwsYJs0QAQBDaeDOBpVEfgex0xKxaKn9aRxbeO5hwobHYw8ScHA9l3lRJoeU5
	gtXRthKtucfYvVeXYUaWyLckx5IaIRfGtpeipf8TZw5zRakSIoZwV/c6cTvJfnsIkl+Xo
X-Gm-Gg: AYBFou3nXG7iiUrVemBS+FnbWRTKg4WTVYEjlLYIIJiqkRQvo67KaVfLAgA/pNpx5VO
	rD6oa4LP6MrA6XbQ3bbJAP1RUvjPKG2f8l2PF92U6vW8y9pa848flLa+vg3xnXdO7G9ZqIRQam/
	n7ULNx+YWPns2J4ATPxUA1+8HiEZmEwVMc/5ofC/U+fYrTCuGzG7CsvGkXutu5r3RgnFsfQPYrK
	CgXc20BHxUjux4hUZGgmowu2e3gwowl4AzxFkYWZUu1uIdcjXtqtHWEmhGPn9eV5rUZF2foqEV1
	4tDg3z/PdKOjMcClns3mmApVclUVlD0tR3imGTigYEBAYEgGAV3WoE4Y1jF6JF67Vr3P9/+MgO3
	ffqvz2zZJvxNAuHGybMintfBwSm9tbnFHHKjaoqZIVg==
X-Received: by 2002:a05:701b:2919:b0:139:90ab:36c8 with SMTP id a92af1059eb24-14503fc0640mr1286496c88.1.1790239821339;
        Thu, 24 Sep 2026 01:50:21 -0700 (PDT)
X-Received: by 2002:a05:701b:2919:b0:139:90ab:36c8 with SMTP id a92af1059eb24-14503fc0640mr1286485c88.1.1790239820824;
        Thu, 24 Sep 2026 01:50:20 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f986e465sm11885603c88.9.2026.09.24.01.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 01:50:20 -0700 (PDT)
Date: Thu, 24 Sep 2026 16:50:13 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] clk: qcom: clk-alpha-pll: support a 28-bit
 ALPHA_VAL width
Message-ID: <arTkRbBda_yzklux@QCOM-aGQu4IUr3Y>
References: <20260924-nords_dprx-v2-0-fa4364e087ef@oss.qualcomm.com>
 <20260924-nords_dprx-v2-1-fa4364e087ef@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-nords_dprx-v2-1-fa4364e087ef@oss.qualcomm.com>
X-Proofpoint-GUID: U_e7g150Jgmt6Q8rZKlg7a9sOHqNj1Gw
X-Proofpoint-ORIG-GUID: U_e7g150Jgmt6Q8rZKlg7a9sOHqNj1Gw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAzNyBTYWx0ZWRfXxqBqlaPM9ZPZ
 CVs/paCj8NaMMVvVnpjG9sF/CrCIwyUKYJas6vJ9WvHMeo5nQKlks3EbwySSvM+2ebdL7ubG0nC
 CZkRTtOwsjw0PZBntyoEbRFGjyp/PbtP46711CoaHBTvTdp50izE/272MREm0Ay7eO9HLqhsqi2
 GspgGHvqis+nn680/uqQEC6aMm84pPCqndctpqAEZm9v2RIa8rpeNhzHLxNoHzzTIB5uv+8XIhr
 f1fBb21zAuO//8U+4aq8L2EEkLNEZUdhjgK1qTPBNOvmL602jftB3SQfW8s+6wA/W4tWSP8ze7y
 OrZV1sK13em56bs4TJdZ11nExgDs+Ce93+mFZqxj21jpeW0WKQzlTHn3jzeyp5u+6h+2R0t8CJ5
 BQXt3nZw/4DCeHP53KYMVDL47hUocf+Ndc4TbJErdG2m2Bdlbjsi3UMlZN9rWkN9jPAEBT477Or
 j25QgrN4m/z4sYGjwsg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAzNyBTYWx0ZWRfXxSDlMiRY1gn2
 rpLAK9MrZdXiHlwHKxlWT+SR4oRuikaJ9UotJ0AW5W04Ojj/hIVaQoZvbkARRbao5ngoEWj/RUL
 p+pFc6cujwrLYY6/AiAofjtBbASZ9XA=
X-Authority-Analysis: v=2.4 cv=f7vdl+yM c=1 sm=1 tr=0 ts=6ab4e44e cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=q38Eq4LkVyZCF8x0k14A:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240037

On Thu, Sep 24, 2026 at 12:51:31AM +0530, Taniya Das wrote:
> On some PLLs the PLL_ALPHA_VAL register has been increased to 28 bits to
> carry the fractional word at a finer resolution, for example the
> ZONDA_OLE instances on the Qualcomm Nord DPRX. The alpha-PLL core,
> however, derives the ALPHA_VAL width solely from the register-map layout
> and can only express 16 or 40 bits, so it programs and reads back the
> 28-bit configuration at the wrong scale on both the set_rate/slew and
> recalc_rate paths, making the PLL lock to and report the wrong rate.
> 
> Add a way to identify the wider register: an optional alpha_width field
> in struct clk_alpha_pll that, when non-zero, supersedes the
> register-derived width. This feeds pll_alpha_width(), so the recalc_rate
> and round_rate math scale the fractional word correctly, and the Zonda
> set_rate L-adjust MSB check is derived from the active width instead of
> a hardcoded BIT(15). PLLs that leave the field zero retain the previous
> behaviour.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
