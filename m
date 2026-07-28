Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B80B240E8DC
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785230994; cv=none; b=F4qZogYPloPki05yRi2dKl6Yb5VlplkDJaNwqnFOmJs68aZb6a2wJjNFLrRuwtd8Zf/v7tU78+aD0t61uLg6CrHlPwOmAO0RlAMhqKR9jyEembYcFQJDdVRY5pWGg0bX3Q8QY0wChGoRhDjzz59/16f6FvEKq9xK+hKbPUTRh5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785230994; c=relaxed/simple;
	bh=+cJ6lA0Ry4sm9jxuVqVS+Spb1104T8rj0lLFUr9YixA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eBuuGtuPqtqBRfKIPLVGsAGyFuLmvokbsHuikdfSwuJZm3CNTyH7kFMBoXDR88NchBvVF9uPNO1cJQftAk4rKfIF5l8fIuC0RpQPkd56r5wHrfivjfFwo/wpHCwmKhNXc3cbWMEasXU/uokUrfo68ZlBGwBlGu5xfo0lSbHxFe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bY4mFudN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UC8VbR1C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bY4mFudN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UC8VbR1C"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66S81wLJ1663525
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:29:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GC/ZuBK1RLJ4ibzTXEvYuoddg6a2oCrBqfBM6hC1438=; b=bY4mFudNCbDLmTw7
	nT4W1b1w1tiKDSBRPCjiDIc7tdENyfJx6yQYk0dWIFO+Inbfrm1Wt61QMkt8pZbR
	TpQS9XdL7JGwiPPKAG+Wun1cgssUIZIbGxXtziFw/Ez00ksCRaijwzXxvBI/17Ys
	oIn/PFinPIrulCNeNYtAnHCmCXrgt3+40qPEVgC4ElyWIBHNZ1WaSrtH6Mzx6K9g
	VlIr2NYh0LrAqwG6YZGGrrUuWXjgZzrVdtxs4wxHRtJLmJFUI9v3nvbFSDaBt0mb
	GGdJJTbKezNB8fHxKtnGYQK8q0ayopddOmKZeT/ioGAldiJuxBFCenp1X/dtmfwT
	rmGvVQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fppttrtxy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 09:29:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c15c77619so9147991cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 02:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785230992; x=1785835792; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GC/ZuBK1RLJ4ibzTXEvYuoddg6a2oCrBqfBM6hC1438=;
        b=UC8VbR1CK8xO2QOfA+1eSoMQ/N2hH449LJ8tvuyib/v89J2/GKhv9pe/BwcNXPeTaR
         ve8qa7dmvBK4k/uUNgZFUdjPpxXEUmh8LTXMaYEjrpSeNBWyRZqqlUl2k4jyQqq1WVoQ
         naXBQUrOho1PJK/hjWs9GFtGLaiya6hw/PRbZBY3e9eY9L188dgO1Lk/UyePitEvlOlL
         gX2MotHzkHxW+9y48vi4qzWuyjX0DhYCW/0vbtHeGI0fdpeUVXgzWvAcMjnjQUfcO/cs
         2vfV8r0IBo7SKjktZWqWbge093uTGEQjozY+eMo6Wjdz0jqr4gXDTzcF2VKVMKb1NidO
         1cDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785230992; x=1785835792;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GC/ZuBK1RLJ4ibzTXEvYuoddg6a2oCrBqfBM6hC1438=;
        b=fmY9Ojwxjy5rMxHQYp/mabyTrfgu+nNCGzyjhonSJUh1MU3mhnulvoEDYqHKqqU1yg
         pbtno9AATM+RxH8MUeiGMS8x0crylpdDRrv7LWBXnXjgApFb5ZHdhbhPMUCqf3z/Ci6s
         B435rQtbgXFvhO7MaNtfgDXzPB5W292JCPNCvnnrbch3OZ55VJByzo4vTYaumcExfgV5
         dH4HBvT+25hIfevIySixp3Llxgyv13iEUy0qFSyARo7QVztOb+zs0Z3DdhhJxcr66Rlr
         83x/3KGn6tBUeihogDfM2Fkb/q7VHO1CEN2WQqX1qXylWoZ0y2NH+JVDznGQQe/zu17r
         drrQ==
X-Gm-Message-State: AOJu0Yy6evHC3JwRYf/6QjX4UjCiHjV6tzkt/gNE+gt7dIqUkkvzd4/S
	0JoxsJsUxhmGKQ8COBJFk/+YotXPms0CrpmA6AWwivsNIoJ1YYvci7VMX8VuQBtcGYck3RWWGqZ
	eRaa6qIZ10FQqP15HezbqbqbzjfWuUb3Fi6s1KagHQdguYKMsOrS6zBLHDIgHIVCgrIpm
X-Gm-Gg: AR+sD13P4U7xejVBJOgBDqwErE7joZRLiix8Zsb+wWoWTl8/wlxNNM12HpXJTqVZ/U1
	51IJ5X4JUi+wRsUWJIv0AknrnkmOED8BQ2Mru75tumKjXWRGEG+BZAA9nlszardGc8PPEPu+v1S
	Gf3EmIbkEvag1/f4ageqP3FZYmYtwI6hzr28Bt0U87FHpV1ZL5CTjZ/k81PvcY30a5CtMMHomqI
	YKjo9JVEih5wih/dt8QB4dpQn16dSz7atpRGg4ssGmGSEFkq8BvUV1ra9Eb5fKLzHZfu9m4aGQg
	9ejeundjaPcRKUiMYWM7gg8ENiqjSIZQR9KCUiQClQedCl+Pb2lkxhurmiqRyImtsqVTeGx3qJ6
	u7gip0+ETx+XWuKd420BFhiNj
X-Received: by 2002:a05:622a:15d5:b0:51b:ff78:f229 with SMTP id d75a77b69052e-529d6feaeabmr10813671cf.5.1785230991926;
        Tue, 28 Jul 2026 02:29:51 -0700 (PDT)
X-Received: by 2002:a05:622a:15d5:b0:51b:ff78:f229 with SMTP id d75a77b69052e-529d6feaeabmr10813591cf.5.1785230991598;
        Tue, 28 Jul 2026 02:29:51 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb5543370sm3675170a12.15.2026.07.28.02.29.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 02:29:50 -0700 (PDT)
Message-ID: <a907cba4-c276-4355-986c-44f6e39c310a@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 11:29:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/12] clk: qcom: ipq-cmn-pll: Add NSS clock support
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
 <20260724-qcom_ipq5210_cmnpll-v1-4-a8b8679d215f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260724-qcom_ipq5210_cmnpll-v1-4-a8b8679d215f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA4MiBTYWx0ZWRfX3zIqhglbOSOp
 cj5tJ1O0zuLdk3EklvbvGbzQKpXwVs2Lf6hm09UVL+PvE0373Sji0DFwwVQRolo/I++eB10kWup
 yBJL0MIgXWTwas5vpOm6efigWqbgfyo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA4MiBTYWx0ZWRfX5xHrD4o5sjiv
 b0YrTbsrYNX/kLdqr9x4lScqW4plT1/qFkygOvardboy9SYjRzCLi4+eZnYuKegeq7iOK+NICa4
 DB5JaCf6aUubFuyC2V+04F5tExCzEcTjFCDtW8YeS7KXMN60IASLubf1w8EYo0RnyXBIqYeIWoe
 4uUYTwo7EUpw1qrWmCF6W07onLNQcE/VbQ/0bzpAElwQQVU4nEioP7/Q3Rw9U8GJ8bFOMpwNW65
 pdpgGiEMwdfcAthYv/2i9D4CZwqHj5SsznBGaP6wMss1Z53gZgYJr0tLhXBRhGKnaxujpYUbv3A
 1Kfs9bBmaODCJxl0v9jaalvlTDOyLQKVmVML8t0ZJ3dflWdFr6vOM5T9ymWWm0rWqg+EkZecZIH
 JF/0TFPD8PBT9/MlUQi+Myb4DSmDjli92FWBarM2U9JORO/QpPREVZZgymRyK3TQSB9mRdJS5Pk
 GOw2jYbpw6eookRLtFA==
X-Authority-Analysis: v=2.4 cv=aa1RWxot c=1 sm=1 tr=0 ts=6a687690 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=rcriG_6vuXrZ4KVOdM0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: LNNVyZIyB9Ekniyh73qD4LYgP3E3p1W3
X-Proofpoint-ORIG-GUID: LNNVyZIyB9Ekniyh73qD4LYgP3E3p1W3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280082

On 7/24/26 5:00 PM, Luo Jie wrote:
> The NSS (network subsystem) clock is derived from the CMN PLL output
> divided by 2 and then further divided by a configurable 6-bit divider
> with a valid range of 8-63.
> 
> Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
> ---

This looks very similar to clk-regmap-divider.c (or at least to
the generic clk-divider.c implementation).

[...]

>  	/* Register the fixed rate output clocks. */
>  	for (i = 0; i < num_clks; i++) {
> -		struct clk_parent_data pdata = { .hw = cmn_pll_hw };
> +		if (fixed_clk[i].rate) {
> +			struct clk_parent_data pdata = { .hw = cmn_pll_hw };
> +
> +			hw = devm_clk_hw_register_fixed_rate_parent_data(dev,
> +									 fixed_clk[i].name,
> +									 &pdata, 0,
> +									 fixed_clk[i].rate);
> +		} else if (!strcmp(fixed_clk[i].name, "nss")) {
> +			hw = ipq_cmn_pll_nss_register(pdev, cmn_pll->regmap,
> +						      cmn_pll_hw);

Huge "no", this must be a compile-time constant and not rely on
some funky detection.

Konrad
