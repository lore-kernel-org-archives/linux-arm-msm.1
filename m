Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2BB44CDA2B
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 13:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792157835; cv=none; b=Zy/kds3avCKVSvLFEyZ8lBGCeDlsl/XDfoxOl80WSs1x5IqR927NdITNq1dc3fV7oSS8sDOo8HgkWRM1Zab698n7+HS5JViiUEMz8xecVML6cRRTilsDkOixEoXbiLynliNOOdSBvcAUnVn/n4b3h4LB91mLDz3BPzGKMcYg5po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792157835; c=relaxed/simple;
	bh=gLufYT3FPW2NEJDqme0F2uoTEeuYJsbUQaqVrEZieuU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VcPNbG4Qjz2kIQ4cfAufkme71plBFnRG4kjAiNosRuMRLuAs7ISq5O7gEciyzroKyoSu0hFj8oC2HrBlRntTtWxzAM8sbx5l9mhGCk/Q94dX8QE+3TCpKUfTw04gxWzaB1Qs6cd1qn1fYisGT+wNM7Rx3y8S1eoN/xWHu7639pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ClItlAil; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jd37xcMY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ClItlAil";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jd37xcMY"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GAATfu3069372
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 13:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vdzBxvayCpF4yq4HHRlx5KzhM9wzjUt8kSXAllcT6As=; b=ClItlAilPvUWymga
	4bPzxmJd0d5Wf2DHR2sA7qnd+kTqCwsYfAkfQ71INAWIYq6d4QGBAyrHp8DTxgLF
	8aYh/TOq+NY97z+YgapxkZZScsPtOBemN0ShZulD4ZTlgIpZ+dx+VLV0YwcgKJLi
	t9gBN9F+A29qG2qoZbjbdfGK8Rd3wHJ3LvEsVS15bKCcCT3TrGMqSH88AV7KHvEf
	1pUhJ0Ni9ElgSlAZ+wFwlKJM0smi8Wx2O5temgBDjNgXGJzXssWUsg3agG2nlPj9
	2qXgL/H4du2ys74yDDgYVsitTDAhj05DLP2qL44x2aTa4bQhCMLGIJbbzyjha/wd
	TY3OpA==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hba262h20-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 13:37:12 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5e915fd8a61so172965e0c.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 06:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792157832; x=1792762632; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vdzBxvayCpF4yq4HHRlx5KzhM9wzjUt8kSXAllcT6As=;
        b=Jd37xcMYMTm4Agr6fO/EeHIiYeoSOvzx7Fi1O0zd4xhnKJTXDD2BFnWKzwyanyWoI4
         tfb5KA+zHJNwnLNLT6bY/9B3e44eg4C6Afel6EOJAjhI1b0uX4NbUYHVDskeVzlQ8X4y
         r1zykntSV3cVQ9uB7JAdH10q1ZGy04d/jtwVeKgz4VS2rmENw84BOfIYKqEkYRgwa8fM
         +XgFzGzLPCwVM7Y8RxTw1Yi5429+UH0OHF+RlZnUK14muukjmUDL5Kale/+gJSpu/VOX
         r+WOAaNTzvRHnM6tiP3Db3ugQZyDwv0orxeWlQvLr+E8zyFDwdVWUoFdqdnfto9TEQAQ
         NHMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792157832; x=1792762632;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vdzBxvayCpF4yq4HHRlx5KzhM9wzjUt8kSXAllcT6As=;
        b=VLVxzskI++iJ/88O95gZoX9VBVIXCyTSnH18oyVpDEHrFyCopg2phmKWfN6ADrWLxg
         xgPiwJPmjAB9xRb3t2JG7VI0sb2CBPDqZt7lEuF++VWH4priJ9EsvmGxXoHaSnL69iqh
         E9kKUcoc4Z3hR6HRanMjFrQ/OqLHlsihtWh/ANiXkGvBqzTEZO/0R/wDH3rigQQUtt7G
         WXgxmcToeizdNp3Penr0xWgAfOQEIGLGUG9Dyjalto4SqJrPfQElhZuF2jpO3n7EorQh
         cU8Jz1P7j0ccpZHgx1mgge4F8fgNQYuHEZYiWZq9XWJKvzyJEGQWid12RLODnhdfPADP
         C1BQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/sWruQLPw6QKrX222zK5h2SAnftZKuLF2r2C6sNNKiRCD71KQPiMcJssSjUMM5g/vD5R/gsJlqJiYxLqw@vger.kernel.org
X-Gm-Message-State: AFq9FYINnN7n9bB+zNNXEoxFYTJRliKvLYMYfdShcnERBscmgwcBMZiX
	EvzO3xqIc2xWvXVWCjKXZeD0pmZRSHRrol2fTLgZS4he6GlX4F9HX7w79trSF5QB/B5Pcs2LR1N
	GmkgciQiHm5Br6LgkfU5kYJEaHbwsrAhkSXXlftR3NNtn3Q9pPTiKpn70rts43ZOo0+7k
X-Gm-Gg: AYBFou1908OL6n8m8a3ynYUdaRLD6D211v2V4EC93VeJvMqu+DIgQiWgWWo2EllMEjo
	HgmFCDzQV23XAusxjVfzixxNokrJxdi1skyo9qBhRNhDM1+NEFGpXpXXIuAvqpnvetjhjFg0TZu
	eF3c6V0bNoI6A4W98EkUYcaQhQwrjTEhfWmQWvXHdT+271Tq6wbySND5M8iT5ruWzc7/AvvYTzj
	amMZc0XTajXdpfbRrlQbvk8mEiFDfEt6dW+mzlF4ehZJ9Bo6Vd4Tpatwn/gLl6Z5McXFmYares5
	RVnCaOgmaTw7fGzOxWPT+zBOdDocU5Pkd5JysEH+X55WduI1m+UY9O7bfQ8pLFWHd7if7rvlQKC
	zOWzliPQsBUPniGIDENQCIA==
X-Received: by 2002:ac5:cd35:0:b0:5c9:91ba:5d7a with SMTP id 71dfb90a1353d-5eaaa0c8e21mr7157e0c.1.1792157831786;
        Fri, 16 Oct 2026 06:37:11 -0700 (PDT)
X-Received: by 2002:ac5:cd35:0:b0:5c9:91ba:5d7a with SMTP id 71dfb90a1353d-5eaaa0c8e21mr7133e0c.1.1792157831205;
        Fri, 16 Oct 2026 06:37:11 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c409239b3acsm73490166b.86.2026.10.16.06.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 06:37:10 -0700 (PDT)
Message-ID: <4994fbd6-9001-452c-9bdf-da5953a50a1b@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 15:37:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: glymur: Add support for AV1E clock
 controller
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20261015-glymur-av1ecc-v1-0-448a476d54af@oss.qualcomm.com>
 <20261015-glymur-av1ecc-v1-4-448a476d54af@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261015-glymur-av1ecc-v1-4-448a476d54af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bsHZl0ai c=1 sm=1 tr=0 ts=6ad22888 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=IDncKmX6BrmM4lnx9oAA:9 a=QEXdDO2ut3YA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA1NCBTYWx0ZWRfX/FXCLm88ExNy
 UrYmvVAbZ59DnS/ls/LlFV63SgNLqnXHTBHk6+bHPsyU6PBA4vhnANzfaiESiXqTRRAed+VDW1J
 0uiP44YQjQCqE4NJXXRVLPLL22nD5Z9/eJfizPXxJ5EDAnA8nktk+Luh2rncgOwc3jGgX0rXRER
 +XYxoTfFpl5Y6K0s0vGODwH+bthbzbIngqSykwBqSF4y4F5N0bW7d4Ce57qGazlUm+6MWoasrZx
 yYqUikj4CpAHg8dRBKQxKAQkGfBFLAtg8JS2y15Zuo2tCVwAm3gq9bAyJSBuIMZjdpM1RfItR7B
 9QuGF9S7rJOaQyWDpRW84rV5h+oB3epma34m7P8YY4fKkE4n6AWr5ZcLhVyXbFfkk8Jq+eLI+41
 emvZNjP7n/5C629nHCduT57uSsWOkD8+PdvMEjMtnLFlQrFXsyvFkL369c+qoLFmEXnq4om9loO
 IgHQXVYeO7Ls3p9LcTA==
X-Proofpoint-ORIG-GUID: E21Q5zxfRVdQzbR-f21L3my0OsS3PScA
X-Proofpoint-GUID: E21Q5zxfRVdQzbR-f21L3my0OsS3PScA
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA1NCBTYWx0ZWRfX7PrTwiXTZYwL
 qlVfOmlRRdW1mWTWGE9fZ5Zw/S6mcQj2ECRRWreiuzPwuZViPV+NdRZVo6Nus9aVW9kmSYqsEqV
 Xdq8JN4AcXQWFYkpe6Nlj7uoIHNxO4g=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160054

On 10/15/26 3:35 PM, Jagadeesh Kona wrote:
> Add support for AV1 encoder clock controller (AV1ECC) node on
> Qualcomm Glymur platform.
> 
> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
