Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102466;
	b=VCFSw5ceO1B1enM63PaRvtJQEF0E6lIj1dKVNP0z0S461ZD3NppThrbT6XBvGbS6vN50
	 g07kAUsIVVOt3QEhCU6kUWFyz199qGTjra2swhFWvHtNiZm4ABX2rxY8b8NXBfycw8gWP
	 Km7oVFHJxpuEovi/Qq93bsxis/9cpJdeegkVgSWDiGBYGUeKpWKPOXUCWUD583rshdvr7
	 uQwQNZ3hDK6+4qzwFRMAiaKNKwFVX5DY1Cibs1TvC3Gg1S/5LaT3f3w3aOkCu4ArAyzIx
	 shnc2SSqwoYhhzaIdCkzVb5sJnEHEf+3M4yCShBcR1kKy3Dg3f79ziXN1sgf7fkzEbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102466;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sWt6v7dOd/C066uGvGJiwittXamwS8tJI6B7PLI1Mxo=;
	b=ycedIPKAAbQjp/YEavyvN2Dgx+OWU9eHRmpbCYXhflyxew4JA+xJhCF3Ga8yQlpRSvfM
	 gpUAzrzVnqxjfTFi1plVCVh0UGY6A3crSG4zaaMWY78qadX1E5Ahmnc8OAgXx+3ttTOqj
	 u+YVkB8XxppbFMqEqdOcDGfjf6P5OuSsn+97SwX5viHEDPyRuZ9oTQXGmx/pybw7TchjD
	 m2ID8r3iPhBHq69KH5Dui/Cye7rqpOB7D12OJbfV1kA/TZrVLtYdwwoWzD/95/vCkXKBg
	 cuQhUGgEwgSUnm1T0fV+/l0AhWDf925WonxZjOS7mJvhX6g8a0FsnKdEBDNkf47gmmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YIHhEyQt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QKuuTjTJ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8BB60A3803
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D8BB60A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YIHhEyQt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QKuuTjTJ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeAvW2524940
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:01:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sWt6v7dOd/C066uGvGJiwittXamwS8tJI6B7PLI1Mxo=; b=YIHhEyQtbEq3/pfI
	fCZVi7RXL0brQWGAHrRuNhcZq256lm3HPoS5MqTTitHUzsHf/fNxeazvP5hd1I2L
	cTLqBdiF2wFd62rKhbduZ14cakEutnpP0UtQKJZ2RrVr26xbDLoZdcnr0K5+yg+Q
	AVTpACF1G2ldixS88cE1XRwHEdq0hLpocQfJ66eKJA7up+eh1xRzC5ulMb+/T+cl
	6xIzahoERVFxr4IUQUfh0xc2bqecpLNZVwVMGHvgRshKVGJrKuKIr0q/vx1EK1y8
	zo/nnsFUQJdsvmr4ipq0SIkjs0DpD0G97ssXsukGVV/RDOBSAtGM1SM/adHFBJzw
	bAPIqA==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjqw20xns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:01:03 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-73a1cf1638fso71997137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 05:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793102463; x=1793707263; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sWt6v7dOd/C066uGvGJiwittXamwS8tJI6B7PLI1Mxo=;
        b=QKuuTjTJsFtYCohCvAIiQef3v5k8nWgkByrQbRHPr7/LKKZ2LgWWGqaizCWBpjCFPA
         FtKvpCC9a9NndQOYmCL+xQdNtA3ORQxUKAZfEC7CNweTij4pQF0yKSRtc42cuJHgfvJq
         +8Qx4iadJ3mYOm/FUoKz37Lao8QyNmmvubKL98qbuy09AFmwtXkTINpJc+SQVj1AUafz
         oSyxbN4CYN6Tjb96H10xjf6uKaaN/bHfUb7lO51wASk4ejEM6d2BAMLeecp2W95gg5I/
         bQA366KKvrCiPA+fNuOd+67y7/ESOulMizyn0loBodvEMmbXWn33eKc04n1b+LGbh9zt
         Eafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102463; x=1793707263;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sWt6v7dOd/C066uGvGJiwittXamwS8tJI6B7PLI1Mxo=;
        b=PPugcvcOa98wVMti7lf8Br/XDN8N0XG6O6T5BDBbQjm7BIQEU4mWHJXU7ymSgtQsgD
         ALxa8us3e2z5K0DCxk5+hidphX8Yna5pw4LK1PbUC4Gt0rOsLns2O8GbwTnDQkTBiOn2
         pRWxHBxSF0CKP/RcJDQmanHnllxgE6jzz3gcPbk7xsgHBmsYG8AjbPUzgV/coBl7/rhC
         sG8MK0T0JiB/UIXPndbo11+N2pNj9rJEp59dD+w5KHYLQYLDK6GPmmcXC+cT5d0TZRw0
         xZRPEVJzcyvTwQjQrDQQUt6tJCFPIXtP9yTviFVw7yc7ZHdMo7qd/FdrUAS0rLATAgGK
         5Oyw==
X-Forwarded-Encrypted: i=1; AKwUvBxB6rksYjCVnVivVYH3jY5BnjEYrs+JxR3wfRFjemfBQNjr2FSQtn4/f4ZDjipvloGoC9OoWGO7IypKbJ/X@vger.kernel.org
X-Gm-Message-State: AFq9FYIlwE+OLN9TDO8CONBsPrhRd9+iJOErp3wqc6ZC6sUHv00Ua22u
	KEK9h3N0LOG03Qnkp6H15sfYX2ZgUGXgGhVEmE9DNx75DYHUfPPMs6FULz22kRckkCBu8i7CnEf
	gh3bjYnbyudFmPjMX/6z/106lw/j7A4vjEAqgRPMLEQs30bl3ro/THoQ4HjlbwBzgGlGDO9jwmm
	jM
X-Gm-Gg: AYBFou35f01eICh9xZLeooEtk72X6jZYO8YT/ALqYXf38UwAAd2NqW2bnovCY3rg5af
	jVQfMN2YvnGEXDkDDyPQ/DbyJa97BYC+p5eW0zNdFYDl3p40oEJ6eEeHYok0XI2qfc1Ci8iHeVN
	w6IGYihx5HGqLVQQ+Er5eVX/Rocbt4ih+Wt/O/c4HnbZ4dwh/Giv/iydUplN6QIL9oE039AtwX1
	FBArYpFsqC5qlJtcGOUnGiya/rV4Kx6rAx6fABV0+5D11gaZCCNlwOtPuc4EoMldVfmAexAAIz2
	YhVKH3L/npzwhk0ncRu/Jotq83aENWt1oWGWohrZA0Ee98AtDpwD7gOmWXxPS8srUnl+CexGvK/
	DQW2991YCqc27Ua0Up/Hjbg==
X-Received: by 2002:a05:6102:8699:20b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7ce5cc59d5emr2997306137.2.1793102463116;
        Tue, 27 Oct 2026 05:01:03 -0700 (PDT)
X-Received: by 2002:a05:6102:8699:20b0:7c8:3b8c:82ae with SMTP id ada2fe7eead31-7ce5cc59d5emr2997246137.2.1793102462214;
        Tue, 27 Oct 2026 05:01:02 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b4459713f9sm4988292a12.16.2026.10.27.05.00.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 05:01:00 -0700 (PDT)
Message-ID: <7e4763a9-31f4-44cd-b3df-3404725a6dcc@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 13:00:57 +0100
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
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: nord: Add display subsystem
 nodes
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260920091930.2215803-1-shengchao.guo@oss.qualcomm.com>
 <20260920091930.2215803-2-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260920091930.2215803-2-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX3vklMatBaflJ
 vH6oR+mLZdQ0uhaXJEeqBGYgrfZhnmA5P04qFkbvTvMiU58kLYxmJVScGg4vn3Hckz5VAUNFwuK
 wmTVeAWONCwhTMQ+QtfB5zvRKk0YAPX/eY1bW9Nz1SN8uOfjAPwx/tSYwcDVv3NCtrMLaxazna2
 LP/djHejoLlgsLCs1wmA1NX3LYy6PRZ20L5d6s3BXH4/A6m0pQN8W448dpEWZx+7jP+Sp7lUobF
 /42eC+aT8TqCy44Fzs6/i3S9x3GISOSC9hMg75/9pMS5hTNXrWSe0B9RV1JeBCW0o2JvRbj1e9S
 j1F1rwqzR6Yl+7ajfLzOo2ST+yHQSME5AwaQfvOVB+5X5nknZhFsvV54V7z+R07Ne0dtoauffeo
 EroekjG1uw4KXJ18BrQMjetteFHfhW9j4jsq8uOjupg2uGQyUW6JdhqMLwXZKuF6FN5/iOHLJRr
 xAJY11wIauxTAtYCn+Q==
X-Proofpoint-GUID: TQhlKRkU2883svNcjoCJhPDG9MdT-cF6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NyBTYWx0ZWRfX88Gv5nImUpyn
 oNbGGvKSwU96ui51QQLog3uNLEHkhHiJPVDmPoO/gYKFkU2iFmP2T1xhTy8W8vSh0mA2eeRdnvj
 A/lZTV0KbLzYkxIa363gyhrZQz9WF9o=
X-Authority-Analysis: v=2.4 cv=PsYG/AM3 c=1 sm=1 tr=0 ts=6ae09280 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=B70xErdyIbx__L-6yYgA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: TQhlKRkU2883svNcjoCJhPDG9MdT-cF6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270047

On 9/20/26 11:19 AM, Shawn Guo wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Add the MDSS, DPU, DP controller and eDP PHY nodes for the Qualcomm Nord
> SoC. Nord has two independent display subsystems, MDSS0 at 0xae00000 and
> MDSS1 at 0x8c00000, each with two DP controllers and two eDP PHYs. Nord
> is DP-only, so no DSI nodes are added. Wire the DP PHY outputs into the
> dispcc0 and dispcc1 clock inputs, which were previously stubbed with
> zeroes, and add the eDP0-3 hot-plug-detect pinctrl states.

[...]

> +	dp_opp_table: opp-table {
> +		compatible = "operating-points-v2";
> +
> +		opp-162000000 {
> +			opp-hz = /bits/ 64 <162000000>;
> +
> +			required-opps = <&rpmhpd_opp_low_svs>;

Odd \n above

Identical OPP tables can be reused (both across DPs and MDPs)

[...]

> +		/* Display subsystem nodes - MDSS 12.1, DP-only (no DSI) */

Both of these comments can go

Konrad
