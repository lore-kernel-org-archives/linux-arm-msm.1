Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629213;
	b=pTdOL1QEgcRcMJeegy1OTxOPuDZOmaw/wmTRXVaWPYXxpDt9ZxtgNbaNn/FS8HbvIELk
	 fJixcLE5ciNhrsHPPkoGuwu/AQRX7N4Wm5tal1nuhQVQFK4UkLX1GjC0pcORevsQ2ShKo
	 l0PEgsZSO2e0sqpQH9t2O/Wtbr7XSefTK0ZHv3PaLKIeSJ1DJtR/uDYHcB2SQtjV8TcHx
	 fNG6QiEu47tjdJiubkTDVJSkrsEhByXlBvhsmvRFs2WDmguMk/guXlWHU6gpBMEBUegjJ
	 BzsCy2eAc/f/GqPJfvN55eCwyMv55LGbRwHFz+GaeU6yAtm6TD7c4NNxiirAOK9Ol6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629213;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=pB104KqZBTaUKN7vmPS1EN7/2xD2Vu8oCe8VJpr+yas=;
	b=rxnLaPkmrTkjHCx3y68zk3nV4XqivAOQOdkgP3eSAu3e2kMpoVGX/NEt9PxT8NNW3zxN
	 Y9mRbomp9Z4EfiKov8DmUDhtHI45a3SagnDPtJq1TYuEhddO9kg8q8qNsfbMJT0Rur+Wd
	 1Y+dYhm3SXQefr+EEj2UmT+PJQ/aUPoHkMG3i+lC0Ry4Kpmf4NEBgsNatarLH9ubbQd0/
	 oFQWwQ7lpoeoWTGirWP4rWpYSaumznD4YXxmNobAoYf8bmx/P2gROYXShxRR7LYL/4R8A
	 KOB4rjreUGCTK0HYfnQFLdpd14rUqOYGL7sJXWlw+KW161oLZoizrjc75zvFqSxxgKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=biKAKHmg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fP5xaaTf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC190606A324
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 14:20:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC190606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=biKAKHmg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fP5xaaTf
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpNBZ2448846
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 14:20:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pB104KqZBTaUKN7vmPS1EN7/2xD2Vu8oCe8VJpr+yas=; b=biKAKHmgJPbtOesS
	VIHTIvQNfOcIFSdHRQFV6umd4p1Iu7/i+cPSG4/LpJAPTkoDQs+8H70NKarRvtKP
	WycNWus8JJ/n7Fl4J0EBmMHEgDzpBRFx4Sm6bcYOMCGHo46K/N32qzmPj6oB/79i
	zUl1K7rVlJre37xjRWTGqIpepdXXix3Sr0FIyADrKErJ8mqUEJlfvHjhkFvsndJp
	wfUViHEcAI+PQr5gs00ga9MtM1/xGn+Sv7emn8Lii4o9GfyF17eebPctMGoMoZ8M
	lTxjWb+bcIP8VPFdjAYIJLm3FmbTsdp/HQ4Buv0TE0oN9UpE7Br0ymQ1lHaM5WAb
	iwGDgg==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4j26w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 14:20:11 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5eacd73e83bso155221e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 06:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793629211; x=1794234011; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pB104KqZBTaUKN7vmPS1EN7/2xD2Vu8oCe8VJpr+yas=;
        b=fP5xaaTfBmTb6QyTNe6V0qDlj8bOqhdSYFa+yQhRS8HFWLIOZ6qWPEz/ZDiqThXkl9
         G5kH8BytN9Pkmzcdqn0Dz3PizIEWCdwD+8XsNdBGrsjXqkBXZGUUA4MHz0S5LCHcUV3v
         KChzwH64y78n8AHyJrptSQiA2Tqi3EmrtOCY25zgU+cgzlRGw9fbPdh3jsrWDEsr59qK
         dZYHeRWjPCsmA4fzWgxv9bLQBtWCIn4JH80ex9lwDpOjET/S5t/BPKqmuwPBrY8DG7rW
         +Xo54haZ2QNXah/mCdOED+E2QyDQ7JqEPmZq9o7/rRav14HmiKWuhYeVEkONcCe35e08
         U8lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793629211; x=1794234011;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pB104KqZBTaUKN7vmPS1EN7/2xD2Vu8oCe8VJpr+yas=;
        b=a3CI3LooRkxhEamK8QX1K4pxF963FmrXr1gJCdtK5PeWZuHk7s8wu0laTGqmPlNuni
         zFyifytYnwdabiojmJtsOJxmE6EOTENkEzHbW0j3oqSg4j2/mkzEFG4AbVUnbvZ7uIpw
         WdvaeEMzFJPjL3VOTz8MZR1DGuvz95D2FIRguyXPEFsglVdoQ8kQhTxm7OMOLFx58Bqu
         Fa9hClo11tczlNG6N8mSoD6284kFqlDzh7q5WBcao1dTHN4N3KGt433tTlPiyGPnH0eH
         ZmUam78qjMkkLsoSQsWIwiW4b36+rpmU2iL9v6AQ/xOoxWdufibIqqmY19G9Y1p8uKVU
         rpzA==
X-Forwarded-Encrypted: i=1; AKwUvByQ6hL73GoI/NWHSsba0a72ZtMzXb+sOZn/HupBXidUB0vBYqEpdXGJcqEgugtkMRK4zNIONK7bDOMvpAZM@vger.kernel.org
X-Gm-Message-State: APuU4Z9HO3ZoBwk98lv09D+4UonDK5kKR1XSAnl8+CZeM6ENWrczJuPE
	MNkHoTGCCUi0jhr6LMwKUR2m9VRG5XQDHn50TJdXNPTm6zFdFQsUEjIwUj7IP1cUZHTSVLNQTUS
	yrt217CjdUz+ISQizIfqklyJmXaYAJgvcmyjNU+By28cNUPWd3zf9KUOmOVSUqTsFipET
X-Gm-Gg: AYBFou13W4AMyN2IShDp1a3XSXpMEVQVWIcycUVzOnnVBLQfdAuClIJJEWLUWfscWdQ
	BAjMH5Uf/wgDe0eJ/XSAxFQ5VglV+myeo8uVMdfePbLXfC1qxGfUY/thXPeEti0nfKWhJSoGT+9
	sdIh3bXpvkX3d0LoqJH8QG7+i+FYZI1mF1zNMemjXqeKng2+qtY6XpbX6b3aB12pU5ASWrZQzNo
	PMm4SD0d2q24sSkiUDuhhLzXL23Aj2OZiYCe+QNSDJEV9kQpcRvQG9+uiqygzUgt2d7FEVIaq10
	DHXD2o/tW3ywtWIlB5v+JBaUpRMgMdtKsspcF84n1ObA+XZ8IrkZMd2+TORA0heCoEuDTTWVNJc
	st24Af4UxPnH6kBxYnQ8xf57zVEBHwmt8b8xcHrGlXeZPatmYSStJbWt7UJucoMD5sItltV14RR
	JGJ86GGtoaZfFKOTjbK5Brtp0p5xvPdg==
X-Received: by 2002:a05:6122:11ae:b0:5ea:af6f:16e7 with SMTP id 71dfb90a1353d-5ec689382bcmr4385656e0c.4.1793629205928;
        Mon, 02 Nov 2026 06:20:05 -0800 (PST)
X-Received: by 2002:a05:6122:11ae:b0:5ea:af6f:16e7 with SMTP id 71dfb90a1353d-5ec689382bcmr4385606e0c.4.1793629205094;
        Mon, 02 Nov 2026 06:20:05 -0800 (PST)
Received: from ?IPV6:2a00:f44:e0:8d11:8079:3a24:c57d:745c? ([2a00:f44:e0:8d11:8079:3a24:c57d:745c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfdc3csm398767166b.17.2026.11.02.06.20.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 06:20:04 -0800 (PST)
Message-ID: <bde94c6c-1119-4bb7-be7c-a4772c6d0a6d@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 15:20:02 +0100
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
Subject: Re: [PATCH v1] arm64: dts: qcom: Add dmic45 support to rb3gen2 vision
 mezzanine overlay
To: Kumar Anurag <kumar.singh@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_mohanull@quicinc.com, quic_hbandi@quicinc.com
References: <20261027115115.1822423-1-kumar.singh@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261027115115.1822423-1-kumar.singh@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: BXIYA5chYyhsXGijodlUTlIxhsvuSYiZ
X-Proofpoint-GUID: BXIYA5chYyhsXGijodlUTlIxhsvuSYiZ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1NyBTYWx0ZWRfXxmnfgwaV+4K0
 CxtXjmW0L0EM8TfjBQbu6hDIO8XpZnmRi6KEUIcO9nGq+wUp5QMRf4NdzrkWjWS0JaA7GNTeUgk
 e43b4G1bSP//USif2noXvvI10ngivMc=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae89c1b cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=0PPGIIIRtHnt8ZtJf3AA:9 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1NyBTYWx0ZWRfXxwYUjXkmTiQZ
 Q+jt2OnQXWma5k5EH7Flx28+SlWKKKas2NvOiQxts7GpKh/40mFCEw2VQlg5i7pdlpiX/5ec2P3
 01nv5dqx7foYE7EIgpcq/jvSSdT7O7WpLRI+1pUQ5Hl2Ex7dKfewClm7e5oVKhTdkx8+XEuembj
 iseaZHld9uOQTKw5Xg5se9vuUPo71Lq13CQjBS/Lkdj/y7MLGMaruViox+8FaInxzq8VAeFvpaR
 GkbperqCoWCJ+pRLk2RQRt4HBEhHFiPGAgon7cQhMuvZAbh/be5/AF3gTLaNbR21abjrkpMDv2u
 PIkewq2HLr9xw5cUNZBeQxwB+FP7LROi96ur8A9lt2Zd3DIjZRH7lblcAB+m6OpWsQbP1q8MEsY
 DwYIh8Ocrn5LKGZMb4AnIDIdl4OHDqyxt52kVmOUFI18TqNHIPmDgLOw1GdU4h8JMf/S1u8975G
 yFQ+H8j1M32HHR3BIeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020057

On 10/27/26 12:51 PM, Kumar Anurag wrote:
> Add pinctrl states and VA macro routing for two additional digital
> microphones (DMIC4/DMIC5) that are present on the vision mezzanine
> add-on board, mirroring the dmic01/dmic23 pattern already used for
> the on-board microphones.
> 
> Signed-off-by: Kumar Anurag <kumar.singh@oss.qualcomm.com>
> ---
>  .../qcs6490-rb3gen2-vision-mezzanine.dtso     | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
> index aceafea45343..0a4e6080a2b2 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtso
> @@ -80,3 +80,42 @@ cam_mclk3_suspend: cam-mclk3-suspend-state {
>  		bias-pull-down;
>  	};
>  };
> +
> +&lpass_tlmm {
> +	lpass_dmic45_clk: dmic45-clk-state {
> +		pins = "gpio12";
> +		function = "dmic3_clk";
> +	};
> +
> +	lpass_dmic45_data: dmic45-data-state {
> +		pins = "gpio13";
> +		function = "dmic3_data";
> +	};
> +};

This should go to kodiak.dtsi

Konrad

