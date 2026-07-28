Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3697D3C3F7D
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785231146; cv=none; b=P+kaZwj4S/u/vPJ7mqLEX3A/ZODzDcMIEpCiWTKTOpd8RCYwl6hEi3IPKHldMX5M1L9vxwNfOaEDQO71Vq3SIKLK5xqP62idiVTeWL1cjnxxUMFZCmG9vaf1oljElyI4MQQjrBNBAz5dBoRCN2px8VBVRG8K4Ecjga7/Li5F9H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785231146; c=relaxed/simple;
	bh=U76fj7KOyjCv+TI0P1EkomwWv2FVIj0e58YuahYfQ1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G2+MVVakNu+5pM4riW56WQLtrEJpipNB9aNyqD9tfYj9r52q68/jPNM4mGkfIjTvH+lbwpeN4usELdIlb2gv7sRA5FtZitBePz7+CP7fQtcH9nuwjUyhQBa23Tat+1mGfb9/gC846HFUh5ovZVW2kpD06jpQ4ADGxk5XHnUtyws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FwGEsm9L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fqe/zWcU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FwGEsm9L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fqe/zWcU"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S82G9A1908923
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:32:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U76fj7KOyjCv+TI0P1EkomwWv2FVIj0e58YuahYfQ1A=; b=FwGEsm9L14tIqU34
	8JT86Xw9NsHPUDED6BSAzbeV77w0HJQTPPIc/fXecEUHiYR1IuaDMAMIXeWeUxi/
	feZNTCesIvr98vPyp8uHXeGAQfR3uotybbL3LnR3tmdW9p0FC9IF+Bl5NwYL3GEc
	8910FyR1+lxHED9MG2NHYh1HNTxVjaKO5E9ZDGKQcSP3nYNYtNHfUul9RDmkAPKv
	2tBpQMopzrmtd1IRDACOwVIw70+A2gWlKKUbvuA4WC0IAvwWak8jyoyJVW16LAUn
	dY3gSig19aIsvSj1LqADyMIWnyd14qT/K5HmAuTZB0fPu0yd1vjpac5kcpQ17Ryi
	8WxIZQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbp8bkbs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:32:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bfd1772d8so6805441cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 02:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785231143; x=1785835943; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U76fj7KOyjCv+TI0P1EkomwWv2FVIj0e58YuahYfQ1A=;
        b=fqe/zWcUinBO6JNzpSdTRXKvR4AOxnGKvK0jAuZ0/UGM3vpUuIs0rzf4hn0ivmYhNr
         0lkUKI8wnGg5oo8k6dusOfke6mAxgHEWFl2jwxs3zMZyyJipkH3fq7WpBFje9x4iWei4
         qhtrwQxz5BzmO5O2gQn1ZMD1L/1WUhdwiyocxVyU7WKfXbuiqSOZXs9KG2yQRfPL/n6s
         CEIQsgWZVyNsqPIU58VgScDxEn+V7bgemYWIXPvlTHJAs9p4wgDtWvk76aV1VMOYQbZo
         Dzb11sBznGbchpGqWqoArqWOD3vjnOAr6oCTSVg6wUt1U6NpHugd8q1SHFXVfnlhzj/c
         pIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785231143; x=1785835943;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U76fj7KOyjCv+TI0P1EkomwWv2FVIj0e58YuahYfQ1A=;
        b=PK3ZsVe1qwxC1q9JosO5HS1SkZtlOTIqhSvPq73NZgsswMyETJbeBaUpxgxGvOABOQ
         1iR0jbEQPq75RATNpx5IV1yzu6BA1a7Rzz2vBBr1M8xjOnZ6QLPYdxHTGaSLRO7k3LKU
         D5cSwSuq6pP4wuOnQb/IRSwOySuTUO7uhnYEosMhss6oOVrvbgA7k8r/j7UaSVmiEsiO
         thaPZKdb2/1UhT3x9LHi7Ardjpp637h0D+29K4VEFfia5vvrxOfjOUiz2HagC5zZLIbQ
         WCzEgIKu2k6qmrY+IYYLPLz9EK14spW25ibgk7Z3ogoRC2kCpY6AFxc8bfdee7Ke/q30
         eAlg==
X-Gm-Message-State: AOJu0Yxn8Ul3yYQx/CFeZnnBLBuFYi1deVHYooyHdG1OJU6tjECu42PV
	cwzZVKEmejBlyDZ6fcbrO91F4Nd2RJyNodI8hwiU4k8mVVLyNc4gnNxIbmHJZaFB39bd5O4pm6z
	/eLHYTdAIixR8UCOHarIMF7at4VcC4yy4est9OnUJq4ZhHz20JPgxV3zLdnIJNUrxuacf
X-Gm-Gg: AR+sD11Wv2SHTdsFWlbrnAeumCJwYwO6bf59XA91BUMyGvs1Z6sgBhqlOCHDI46EVpS
	MwEPHONiUXjJVCiBhle9/6/QqbP6NNV0SZ6IXYzkYT/SHwhu6YtyeHlaKgZ9Q9cIsobd8jVbbHb
	7AhSjdvhIuAgtxh9QeH8I8xvSPghgxAZDkJ27lwA9ERxIpgyzNGB8zdYvi1neJ5ipRVGRG7rH26
	FcwLoMqzQ9tEiBVPVuy4X3KNHvLQXdlYYUrsazoBRg4uBFnQhh5u/P0p/NX35kYAFbNGOlt0liO
	bVuQgPogyuuoJxaR1JyhvhzENHqG4PHtvY7u0x6IHIiQECj5/B5/5jOW12W/7sIrh9abiMjAPw+
	wAG9jPNPFkNK5+xB5XoRzllxz
X-Received: by 2002:ac8:5e54:0:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-529d708f340mr9811201cf.1.1785231143405;
        Tue, 28 Jul 2026 02:32:23 -0700 (PDT)
X-Received: by 2002:ac8:5e54:0:b0:51b:f40b:2fa2 with SMTP id d75a77b69052e-529d708f340mr9811021cf.1.1785231143029;
        Tue, 28 Jul 2026 02:32:23 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb59468dbsm3835627a12.28.2026.07.28.02.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 02:32:22 -0700 (PDT)
Message-ID: <c08192fb-7d5a-43b5-93ce-f17c5a0b3cb1@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 11:32:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/12] clk: qcom: ipq-cmn-pll: Add clock gate support for
 fixed clocks
To: Luo Jie <jie.luo@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
 <20260724-qcom_ipq5210_cmnpll-v1-9-a8b8679d215f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260724-qcom_ipq5210_cmnpll-v1-9-a8b8679d215f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4MiBTYWx0ZWRfXyCegk399CcGA
 FFQofwc3S/gthTxC2le3QtXAqL3br139bbM25QPR4NIykR2LWPTrLRTc63At53PK1Ei5m8NX1kr
 qHg865y92BWlKvkrGnUxuRl/PAsOFXc=
X-Proofpoint-GUID: o8SzZ6Dln-_H_ca6iqFbJ98xP0XtVgcV
X-Proofpoint-ORIG-GUID: o8SzZ6Dln-_H_ca6iqFbJ98xP0XtVgcV
X-Authority-Analysis: v=2.4 cv=KLJqylFo c=1 sm=1 tr=0 ts=6a687728 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=XRWevJX1GK7jOFrGjf0A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4MiBTYWx0ZWRfX8Wxav5iMhpjN
 En6MlTwY9sEpt70KNI2/lK3A3F38+Tcz6X/HjUGz/l2fXxgrf4Dl/qnApQEzlEAFXOpUTpq52Zp
 GiV11x8eIfW3Y22XdSyljR5HT71GeXIbRB+dJP1N/qkNCP86xQ7FDQgbvwJUACRsWkWZMGs3QiO
 Lq1ZCfwbiEpjyLXKXWGLI/FUkUV5RxwJWq4MfTCScDd88pGEXfx4N6bgdCW1RXGZ8cPIP6LBAQq
 T2QYwYxvBfPT+3wuhZg3rYe0eY3etS7gQhAK9ZUDb3HsgKe6droUi0xZc7VKUlae8La7iSnEIiv
 mrpvo7DCQNqLLcTaVMpyiLL6NbRZSeSfAo2AUVDwtacmLP14ywPVLqV8MB5sISldIkdTk/mYUmg
 ck7YHcCSWD789VApf5ldDEnMaCVQDEFyWPsbvp8ToZ8YW8yruLOVVLYFXhJ2o9F8Z1wDI9oCJeB
 e4nmg2Pq9m4G54BTSGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280082

On 7/24/26 5:00 PM, Luo Jie wrote:
> Some CMN PLL output clocks require a hardware gate in addition to a
> fixed rate. The gate control bits reside in the register
> CMN_PLL_OUTPUT_RELATED_1 (0x79c). Each such clock is registered as a
> composite clock combining a clk_fixed_rate provider with a clk_gate.

Would toggling this register in .enable/.disable not be good enough?
Do we need to register a separate gate?

Konrad
