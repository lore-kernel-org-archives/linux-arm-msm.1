Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51642F83B5
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 08:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792140744; cv=none; b=kyhmuFISyRFJDOgnqY7gGwR8Qd7aiQDM2tgHjthiHjgoHfTFbGflwHXEFFWhjR/Nh1tC2BE8D0noX2Mwp9FpF6/Vc+0vTHZ1PgVTUsM9btVxHn4U185nOQ39VUoa/KA4KONNNj8C0uUR/1tnAtcFCOto2s5YmSeDdU1rb5dOFFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792140744; c=relaxed/simple;
	bh=x7/AS9iVt+OJOWTPrR8wHUSuCZH3x2iwRo22tfSQynw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uj6FZ1jvwHbS0v31erJmzqeiqxl/5GEcFAJiSdgHR05FUKBz6+KvjrLQI14zftKdrKNtAekX+V1d94O+9YM0y2lyT0DzRZmwGIoUgGpL4Fhq1znAAQ53800bUIlhTouZDvE7KFeHUVuJ8y1rkz1D87zKsv4vycj/fZLAJ8ZwHvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LxBbF4Bs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NUCku9OW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LxBbF4Bs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NUCku9OW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69G8lh5i921375
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 08:52:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gs8MqXiIagnk3m9amtfI9vqhEwjhCemiwE9F3FOFIUY=; b=LxBbF4BsrXEgr6mc
	ACjR8P2WGtJ6iwV7mIXyhKF8KFwUlv/ebN2xS69wuSfQuL94270CE4ptIuHln5IN
	mVeIWdcCVOWKkAk1r8w+TFERulU5eSbShg2f9QtOVH2jaLi3j8Wj+jBEd1rIOMra
	HVv1GprGV1LAEbV3RMj2snbeY1fnUckFzmT+7HvUVOFg3ua7VcqWJxkRFOKyQn0+
	s8TaqcJ+3eI47QOQtaN2RyZjPVH39Q5Y5jmquDmuG2S98dlmXZxgafV1tV5ZjMJG
	TT7Ws9r8TBFor22jnF23naCmARA5SjcS17euqkQAyrWLWyFXpJCSsVX6CvpWbZxZ
	zj9Jgw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hb3r3aymm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 08:52:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5362ce9df1eso1064291cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 01:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792140742; x=1792745542; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gs8MqXiIagnk3m9amtfI9vqhEwjhCemiwE9F3FOFIUY=;
        b=NUCku9OWtYtV+Wjt42wVCJtS1LgfcrJgBbboJq4oojrIiUrqcHN/6KAY3nyAjKcPm7
         H4qM5EID3RbK9kbydv07khThRsW47Nd1TSw+tWnBBoUy2elAVkwsHm1ylvD+dSpwnvIy
         qJTnJbP7gSfI+I7pbcI9IUDET3YK5WR1qBaiB1ntbjr5zigHiy8piA3TlaFXK4Q/pYIe
         kw0lYQuKpV6HYlePRXwCN3ZEXnVT+oPHxcNh5UiHwIjPw8BmFMkF9Qel/XlA+n0KsdcL
         3eeksaAOckHcv2e+Uz7qV8uYxIN8J/WZegnEO8wFSA6K31V3bZ28N4JPMrVexfBMZj/E
         nhKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792140742; x=1792745542;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gs8MqXiIagnk3m9amtfI9vqhEwjhCemiwE9F3FOFIUY=;
        b=bFdoXkps76OchuXPopi7FtvARSuny0IoWZ32tcmrjT4qVUzkXI8K5QAwvUN3y1b3/q
         SiQOf9NY85RaLgvUSkym2fEfKd1/bT9oMSANpcNxu5ES43Se9XwasmZrZULELX9q9Ro3
         kxb8zuHMzQ7nhnJ7IqbX65fNJ5GT/+P6S2/RblEbPf/txEaO+YwTJ6ymhFr9T4gjDxh/
         LuRyg3vNALAIksClHqOC9h2SBWzgluMxvU2UJzFnV69evLgzlf78QUrlrnT68TmSkXMI
         TUPsnMHxwuLpM+lz+SjdeX2p8BiTygPkvGQbNV7TE3+VzSoWwsZSLnfz/SGYzJqBYg9L
         jBZg==
X-Gm-Message-State: AFq9FYJ8HLyLMItAAvs5GbvNQWHHpkJ/yex2Q8PsvfnWoU7g6exIte9f
	bPi+3lxlPT3a6QX15p82AeRP1fO3YyjCoM1+S0m3tX40RB+sqUBPp1k42g188Llt9Tbb+RBArl8
	tPwAsXXrTa6mToI9gl2+ValQBIajn0K6SGOKDm7ef1UFjOkuzfHNrq3isNEvyv+wZ0xav
X-Gm-Gg: AYBFou3uUFVZbQ8ZFTubuTKZOzctDR4wEGtj+sSUxBhdqlArUlDqwIZmuuBsP2W+q03
	HRgoiMbOqO0/KgnNVBFlkD7yiB/Tn2KJgllXxluRddOZmOwka5CGBk+OHdYc/d8ZZYxpLpbdJvt
	eTArgyk2qR1YX6kWoODhkQ5nFueEsP7Z80FXBCI506P4cmQSc1GyWDwXGuWdy2UgC1R7paFbwst
	jzUheJn+xD5dc+vcVHns4wXWyfp6+FN3faMSZkrAtKXZlt+cp9nIeSufzFXTfgguNmwwGySgDhz
	RrVE2yksdZgZMFSAyApbSElQ3IYcHiyOjqv3jNAnb+8ya+liqZCicYT0BuYL9rTLZhzeNWJyiQN
	5l6PBLSnbOJIbGqE8naVBWA==
X-Received: by 2002:a05:620a:4449:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ebd27cc8fmr4019482585a.6.1792140742281;
        Fri, 16 Oct 2026 01:52:22 -0700 (PDT)
X-Received: by 2002:a05:620a:4449:b0:939:9ef4:79eb with SMTP id af79cd13be357-93ebd27cc8fmr4019480785a.6.1792140741852;
        Fri, 16 Oct 2026 01:52:21 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40912cf02csm51471266b.37.2026.10.16.01.52.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 01:52:20 -0700 (PDT)
Message-ID: <82b96322-c6e4-45bc-956f-ef21ff4bed5f@oss.qualcomm.com>
Date: Fri, 16 Oct 2026 10:52:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/3] arm64: dts: qcom: nord: Enable SoCCP on RRD board
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
References: <20261016-nord-soccp-dt-v1-0-ee13aef55d8b@oss.qualcomm.com>
 <20261016-nord-soccp-dt-v1-2-ee13aef55d8b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261016-nord-soccp-dt-v1-2-ee13aef55d8b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfX0rjHziNnxCRU
 cNruN505ZcgeWksUM7D+lFpowkrTBoqbWlq5l+5YCtX2LuLMGpS4Wl9HuxxbgQkz5gzuqIsSRNE
 ZrsN7nNero5xlHuPNg1YcmoKYSnHEcgBObidTE12MTBFqp5/VZRtG33V1yn9vKWLy82RCzskED2
 DUIBzydhrTPRWkgU6kKbgXs+LwG0wxYXL0JbeUYHEpfmAAOiroK1ibrTXLxLPf4fMiAiPeVAGZE
 SFZJ1jPySpjs0HdQbOONOJqG1WoKqbWDwhwKad3IQf9sxe0VcmIJv+W6guaG+zCP52Oy3p5Os3H
 opDQyP9vQzLgyTpq1jBoAylXsQLaEUOsiuNDPGnxl1MO2e3jIxB0AjcbdKYMaFxIEYKfYhGhQFF
 h9tSbnKQ6uZSD8d7HO+IUeb+AJaZDzq/9IRY4z50MGb+tptOP59Kj5cc1RdMqXWkvpkR3jb2drh
 YHjnKbe7MDpMipngecQ==
X-Proofpoint-GUID: _PSDc1ffXKbSLPmjjObhOrsd6HhH1RpP
X-Proofpoint-ORIG-GUID: _PSDc1ffXKbSLPmjjObhOrsd6HhH1RpP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDAzNSBTYWx0ZWRfX/DtU1fVIrbPA
 8QOY/Up6x8N8Eq0CvMZZQdMRlMqDebXhSSMOb4uoQAPzgGaZw6LQuyHtSjlGPFmzw/c+nAeFjUF
 qMRh+fy3GJ3mKHouG74V2zPF0wHuVJw=
X-Authority-Analysis: v=2.4 cv=INGXmQvG c=1 sm=1 tr=0 ts=6ad1e5c7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=mI9klGO-NMSZWYpAt-EA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160035

On 10/16/26 7:39 AM, Anurag Pateriya wrote:
> Enable the SoCCP remoteproc node with its firmware path on the Nord
> RRD board.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/nord-rrd.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
> index 47978df0af92..9db94c3b0c91 100644
> --- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
> +++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
> @@ -434,6 +434,12 @@ &spi16 {
>  	status = "okay";
>  };
>  
> +&remoteproc_soccp{

Missing space before opening bracket

Konrad

> +	firmware-name = "qcom/nord/soccp.mbn";
> +
> +	status = "okay";
> +};
> +
>  &uart4 {
>  	status = "okay";
>  };
> 
