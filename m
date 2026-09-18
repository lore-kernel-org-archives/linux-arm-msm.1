Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8384B2034
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789726094; cv=none; b=RzVu6DGyT/AZnf1JJLV0ZV3Ztg1umIorku+Bkct7SDVxJuDddXKI/kl7tyo7SZkj+/NJ3c5IG6aSvJE+KI+SKYfKv45fE3U1L+9oz6tK+Ujcy/xlXJCVhyfLYByB8RtSOb+y9Ql3rF/KeuBuZkEQjYJg1rLNnh2alJrz3H6lmNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789726094; c=relaxed/simple;
	bh=eUwC8be3/khvk7K9EDwCC8Xk3hI60FH649SuZD1y0Y0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QEqAxkOPUSsTEpgx8Sp/oSyiUItMlijKV4Bfns1D/VpfMv/xl/ElHvj837MOIAMQlVrnLixfgHJYwJxg0CYGcKLjixddwX8jjip2bYV2akFe51sFBl1ndV1MCO9hVl5F1xNzeEAfKurnBpXe6AhnF9WxJ0F7y3jZuAcZbl3XfQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hNtnWxV8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SFE36Wsc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hNtnWxV8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SFE36Wsc"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I9dd5H3801911
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rftdyrf6xASPZ8hDpl0qhQWdEVQN+JzzYAKQSW/8DxI=; b=hNtnWxV87HdL8Eh+
	FS18DA5FV/xRE7AttMjMglUDOVnMry6dk4Rofm8YVLa9Jx+JWnCLizAEeC3deAse
	BGpQCyqpIDJHnJl5H/brHRU6N2JN9zESachgxc+kgOvNLAAEjKqLT6aucMT40Wax
	62Kf26e2O5HKUU4p/9YuCc96BLSwBnuSXUfhdkBtKsSZ7uKlpG2qHAlEnslX569n
	St7OeIGKdYxhkOR65jNJDx0Y1AgdQWd9LM/AvGEoFE7w3xWjI/c/3AihUX0swRON
	7nhuifCzt+Hm3paPtkCPFj1F94/pDN69UfFaFQjZ63D450j4dXr380h6l93+NXDt
	8Tc/dQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grq2ku129-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 10:08:11 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9349ba88188so11452485a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 03:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789726091; x=1790330891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rftdyrf6xASPZ8hDpl0qhQWdEVQN+JzzYAKQSW/8DxI=;
        b=SFE36WscYTTAVmkesLeaZCWLuOrjjTd0Pd+wtH130Nfuo/WUTn+XQAiBchPw1AvPNr
         qVRvigEfrgcDHWvvRUc9zN0etcDEBWzM3iwwpMDiHtFrsOMHXw61zBR4FUXZEQwnJI7/
         5oURBE0V3JdnD4EQHoMKyZ91Jrl/Fc1btL8KEGhJ0/swY11jLIbw+tyXTHsPDM6Pi/hT
         /LiY1yYCazFUmdGyPRgAx8P1cOMH/3YN7kZhjq4aY2ZGMngIwdS1hY3wEAblRw2wVswO
         dFz3NwIkw3hrwRt4usjxQczRtTRGZb6uhHaAoQ+PpLk0lCYlVyg0cR6sOVo7WVM+bo8Q
         WZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789726091; x=1790330891;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rftdyrf6xASPZ8hDpl0qhQWdEVQN+JzzYAKQSW/8DxI=;
        b=2JHCbMDKJUQmmGM/9CpIu6OpdwwTuLMI23Mh8XihjbtI4ZlCmhTf82DS0d5X4aZN29
         LgDDSiprmGFL7d+sfjrBCjP+90o8k/AQRmh8bCBjGIf3BNpY3zM4lFlxGhDV8Wl85TGU
         7st0SFt3cpmwMEOylH4xY9QZ8eLOVU8u/gpx0An+ouBA81tG8kzLQvpyizGplc2bc2DL
         WTSubw1LLS88cepfAHQEU2egpLuR506h/A8fkr4ZEM124QMRJlHxVImlVQ0NYpi/b0ck
         OsUNtLmeYnu6tI8h50uSRZKvDnWgyFRdLIhgT/vyjtHPMKDpxBdn2L8Eehg1/WRn04Ug
         ofag==
X-Gm-Message-State: AFuF++lBY7/o516+vsLXVc9n+AKuD+vAdbeBEovBJH9ItjbPFgxpSiGq
	yIv7ZOBq9sAxoDx9exWmy8fVTfn8k3jUarvUp8/n51m3HUvziIIDjMqPTMHxVMH3ueGFJfPI4Xo
	zNxN3oAMBhvD/u4kTQZEAx7jgygymZ7UUu6CD6dCOGxH9oYQz+1/9IijbIE1ZklQKpEWM
X-Gm-Gg: AYBFou0e+xJCkjZZvFei0uCZmaKvyroSnE5hSAvstT7UAcRbWVsGVeJJU5czGM8Ka7d
	TuMoOdQoQWMXWFVDbMole35t+gl2ppNOSAJXCLkE/cqXwF5ndNpMqsbD8TSn8Yi8NUnEfCUPHge
	iKeTqbYYQxIF/4vX7+2dyHhBk+2xL981GNyIK3Klc3dyxLKpC+FgondVdQSE04CD+g0Tl+C0btp
	WOJDdCs936UVMBkpHLy8dZQjiM5KUH7Ek1au0eCs8qyG5bdk4B75n25wEZBKzt5Q3qPLM/76BAA
	DcUYYftkrq/VXdxcSUw+uY4GvjtqnGuiiOsU3Hx5DYRfdV5K4JZBGxJm9yi93puoT+sFxtyJkT0
	bphyvuhrZaHJt6kvu3aUsww==
X-Received: by 2002:a05:620a:2788:b0:939:eb09:4458 with SMTP id af79cd13be357-93be0583d65mr176542085a.3.1789726090925;
        Fri, 18 Sep 2026 03:08:10 -0700 (PDT)
X-Received: by 2002:a05:620a:2788:b0:939:eb09:4458 with SMTP id af79cd13be357-93be0583d65mr176538085a.3.1789726090524;
        Fri, 18 Sep 2026 03:08:10 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a1bb46f0csm40611066b.32.2026.09.18.03.08.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 03:08:09 -0700 (PDT)
Message-ID: <35210bea-98e8-46f7-8b55-aafb7ad43eb8@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 12:08:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/15] arm64: dts: qcom: talos: Move PCIe phy and GPIOs
 to root port node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260917-root_port_v2-v2-0-6272b7caae9a@oss.qualcomm.com>
 <20260917-root_port_v2-v2-11-6272b7caae9a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260917-root_port_v2-v2-11-6272b7caae9a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfX56ewf5GXf4pX
 boWBSZULfYH72xrgvwdB/ZVuqr1gprpWZQqOwp3Y3HXAUoUS+z1opy1I7N/cjUAUeWfW3iVDQAE
 2EBt5Ep3tzoy2vhuLm0MxlcxkhE25w50kaYhXN3XXxoJVab207EIv73xGhKiq/fDwlagofHYEq2
 77VIcWhqEerDXLgebqeVm15BOWTppOaKjAMU0aP/94Y6FEpe5gUFpis8h4yF4eX/9j3jY99DcnY
 3jemHzBWD3A8hehbegqWFqLAogWTpy43wLqJUkb5sVzZ9TNSknKL56oUEw+3OHcpx4HH3EEUlXS
 38u+eShL9ONbb+heZUejtbYBAs20ircU6YtDJnczJS/yiWsk1GP/JCJKLbYPOHsk79kA3yPlscG
 NCgh5zQ29u3pgpQzGNBpX/TIRvto25HmDq/JOC8u1NA5mBaQ44IX3d9gqP0VUgRjcADNtbATMeI
 EV0tFL902cSlsR9jY3g==
X-Proofpoint-GUID: vcMOF1azJwq8I37d-E3y-E0Da0f-QrQ1
X-Authority-Analysis: v=2.4 cv=bcD+w+PB c=1 sm=1 tr=0 ts=6aad0d8b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=fmVD6mvdgdatrdQPAe4A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDE0MCBTYWx0ZWRfX/CYCkSVRdZJY
 A2bZa42BF2HPG7AQ45FzdGnYuSpW9rukFUGekGTXmYcDd3dIaXfspWqUtxms2L3iFTxwihqGJG1
 6LaTMclDGJVvHkq1IFF7c4GjmL50NEQ=
X-Proofpoint-ORIG-GUID: vcMOF1azJwq8I37d-E3y-E0Da0f-QrQ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180140

On 9/17/26 2:25 PM, Krishna Chaitanya Chundru wrote:
> The PCIe phy reference and the perst/wake GPIO properties are
> per root port and belong in the root port node (pcie@0), not in the
> RC controller node. Move phys from the controller to pcie_port0, and
> move perst-gpios/wake-gpios from the &pcie controller overrides to the
> &pcie_port0 node in the board files, renaming perst-gpios to reset-gpios
> to match the binding used in the root port context.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts    | 5 ++---
>  arch/arm64/boot/dts/qcom/talos-evk-som.dtsi | 5 ++---
>  arch/arm64/boot/dts/qcom/talos.dtsi         | 8 ++++----
>  3 files changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> index 43f110ba3a7c..142dafb04324 100644
> --- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
> @@ -444,9 +444,6 @@ &mdss_dsi0_phy {
>  };
>  
>  &pcie {
> -	perst-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
> -	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
> -
>  	pinctrl-0 = <&pcie_default_state>;
>  	pinctrl-names = "default";
>  
> @@ -461,6 +458,8 @@ &pcie_phy {
>  };
>  
>  &pcie_port0 {
> +	reset-gpios = <&tlmm 101 GPIO_ACTIVE_LOW>;
> +	wake-gpios = <&tlmm 100 GPIO_ACTIVE_LOW>;
>  	wifi@0 {

Please retain a \n between properties and subnodes 

Konrad
