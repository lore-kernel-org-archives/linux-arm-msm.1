Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551C348F016
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 11:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790769221; cv=none; b=Xidm0b90ujGw1SH3F9SPZEJcbHalkjMcF9gQtZUyZD5m/Mj5g0bF2n0qZh72v3RmzqVguXQJdosqPiXMc2bK6ddF7mZdtYBWS+LRhIXy4fofT0RsmIyeOfWJw18Mbhsyt1AIyHBdLCeRX8s/nGEq6FmGlbfUrVvVGGBywXz2VT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790769221; c=relaxed/simple;
	bh=2cnELlXD+d8nHeJy2IMCMnOpquMq+7sdSSGzFyMc2Ag=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d7J8paaxgU0MpRvFp8mUiDX+0HgfavPdbUQDQ6KoSJUW+1N4vrSZS4L4l8afNUVFYpowxdlymGKqjXSePCYL5FLNTyabmu/d1/uwOlVAFr4nM+MucvxKzaQ8VGUBxireGxfHfJcztrxgFrOkji1W8V/LzKc/WLFTpHlF5hO+vlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SmqBPQXh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E5cCx2iW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SmqBPQXh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E5cCx2iW"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7hvj2584061
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 11:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KOfw5TQVqizGtKblbz+l2126JGzlJDbm91qdzAl/n7Q=; b=SmqBPQXhbipmltUQ
	/awXWS2ERc58qQNMMm8atgOnp9iTfyegw67YPn2R1xEEG6alwJPjLCqD+3655j3X
	I1R6PAVArkc6vexEX7cpgp7tyJUw/JXWlhNJfB4SznF0sDeUQIcIdI7rrq7XJocb
	daeRe/DvchiGEEZfbNihWLBkgEzNZO/J7F6LRo+2lcx9PVrOGeojQG3Qvq6y2iwX
	ojWNPzIN4o682sIaAaxGoH8pAe6gJIC5Rpojm4nhZR13eFhktcRM27iZzmiRoNHH
	0Bi0u7d7TJXQnnkyQtfDQa9Gejjnbm5E499M78WbzhdK+pF1NF30Qw+xfNcApO0Q
	pGOljw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rhejmdj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 11:53:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939f8e7ff71so127520485a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 04:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790769214; x=1791374014; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KOfw5TQVqizGtKblbz+l2126JGzlJDbm91qdzAl/n7Q=;
        b=E5cCx2iWDUwVfULt/WyUvhylZYB3BDtmMpiXFnV8EsUXIGbL/Xs7LMJDWvjKc/QcUS
         yVbknBTnQCDk3e2NXwgungEy645RhfcCH87xzrPmGkdzV4QBArOF59I00GnOtbmPWVFz
         gfpO1aS1iBMPS4hoRGL+KLlH4uvzcziyQUh7o/Zxojp75TxMUqsrj0m1nHA+oLWQ3Nxh
         6cRAwawSvmwViHif3q7V5QZ50pSnjkz9KqfCfcY+h/G4FHfNf21sPU4Y5vaxf1Bc45gq
         1f/ttODzb5JtkLzRUx6R0niUpSQpftPnveHJWYuRdsV6kOjL1qp4J8tU7x0CWYiw4GNU
         IDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790769214; x=1791374014;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KOfw5TQVqizGtKblbz+l2126JGzlJDbm91qdzAl/n7Q=;
        b=mXqvOKBynvIF4QfbrpNvXvH3zOqrUiGgIRctOdUWenbvvj6tBq1rmc1qDX+SYxfNmD
         ZCxr378pSNDjz0TfElLqBKE3wBDV2Jag0bFPJERcdAwidDa32kJSUltBXGy/b/ZZSAPM
         IV9d26Uub6jRUpXs1VHeYI3GBJ4wHvlsRM+NmxeyhWvyIgoXwHITlEyGBq+R+cNP0Eqq
         BfVR3+pvZvWf+EL/VaFfACA56/6c0PjgOewHnrE4FzmXGOUAyD9X2e0q7oE1YTFirARd
         RsuRQZPQh6L8ld4cquiplnLy+v/mWOyWO953KSdMxNy6vc7lB5wFMhLay4/OBU59gydZ
         p23w==
X-Forwarded-Encrypted: i=1; AKwUvBwLs1cmimwf0CeRJPlMh3G+bOxVG88PdiDw42Nul7k18+i0sfNpCw9MbwTRuZJbIEuJt/irey5Epc0CR8l1@vger.kernel.org
X-Gm-Message-State: AFuF++kPR6VmP0snmYz065gVJ+niKrZKAf+LDq6lhHglAzXREjy3Gt8H
	njB/TRMf0iiEiE2ikKHpR691CNoFCfxjSjdE4NU2Q1oLKTbYcqW6aFdO9q3tvKxiyK/r6kdU0U0
	jK+XHBjARrJMbr+UvZ7SYMNFOIeNzDCpX2AMc2MMS5bCQJoPM13ZCdZ2mpXdE5JDUM1wL
X-Gm-Gg: AYBFou12G970/WTg0ojwzzPGFdj/ny1+oCQZspw4GLPzyNYlgQYA/h3CABQaZIUCdh+
	X7Kj4rlfAOiZlEk1TbX5CkgLRsOytCb+Hj/itcrWFJx+5NXP9522UYzKKkDeR4pP7zdaZGJnGZp
	J3OkOOXPqoETEGYgwp/jSiC5iR/eCba5/8q5X3P6e3I4oxtiwQhUUmyn2PIcX2F5POkobGZwJg+
	VLv9bMx9Q9bwMsuzwwj01jMkTnBu6ctVlJ1oskn02mhaunV6wP7NYiCCaIS/DdbtX94wxNTOBLt
	i7yPzVfxUmqpdZggeRwR7nsUyV85+8nE4oYIaRphwtWfNbmtDfvpy077Em7uSvpFpPWiCMxC+Qd
	CCjyhRGwq++Qwep2FWaFoJA==
X-Received: by 2002:a05:620a:6f0c:b0:939:48e9:51a1 with SMTP id af79cd13be357-93ca956cb77mr153881685a.2.1790769213491;
        Wed, 30 Sep 2026 04:53:33 -0700 (PDT)
X-Received: by 2002:a05:620a:6f0c:b0:939:48e9:51a1 with SMTP id af79cd13be357-93ca956cb77mr153877785a.2.1790769212834;
        Wed, 30 Sep 2026 04:53:32 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae047e9e8csm746673a12.2.2026.09.30.04.53.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 04:53:32 -0700 (PDT)
Message-ID: <bff27892-eb57-4c94-9c47-d641e64461a5@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 13:53:29 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] clk: qcom: Add lpass audio clock controller driver
 for Glymur
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260925084635.112399-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260925084635.112399-4-srinivas.kandagatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fjfoNlekfVS4ZoOMfjWsPXQ5H6PjAqY0
X-Proofpoint-ORIG-GUID: fjfoNlekfVS4ZoOMfjWsPXQ5H6PjAqY0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0NyBTYWx0ZWRfX0GGsIH498XEo
 CfmPKfnOzurj9xZWqb0P/X93//EsbRMQ6zJWQSu4nEDcBwc0J8b9upquNQW39HTmfmKhRSa9QZ1
 gQbAFVFmiXjlfa2GmHNzxFivoNbhB+zYh4eC/u4Lrrlr7MRWudG0os72a0iWiOjdGDPGhClgxFl
 aqbmr/3rgBRKGvPXWLnlslBrR36CkWclz1YfkliHC7N2Qatbgm83ZJQpsftCoPFccnM4363ph8U
 D8+P3fbRi2UGqP4xZ0rKFGR/AE5DdgMA+nWHaVKdQFKYkbDWVpvHJisks/0hpNT6RffMZZAToA1
 RFLhw2VdoGl2jUhn4l8CdwgMexk4Fh8YTWZCWW3dPGbTEMTfaxhUAN0x1VcjJYxuqJE1SQ8Yh1S
 SQsE1cEeV96BBaeeE+Lm046kYtqUfohs9DoE2D3S1oNSrG1Mb6IAZ4tMl0EfnkJqfIphfL/p6LV
 VKyJdINgMdJAy8kWosA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0NyBTYWx0ZWRfX9hY9dX/vSasH
 dWNdrxK2/uhnzA+aPhUHqT5WCkgRIr/IJtyd4tbERk8GSjAl4CrQwb5hQ1HqfL212UdJZ7KW2DU
 LS6kyWMqB5+RruLAyo4PP2y70nMVYH0=
X-Authority-Analysis: v=2.4 cv=Tu1zFzXh c=1 sm=1 tr=0 ts=6abcf83e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=hDswOLquOSrkhpMzeLUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300047

On 9/25/26 10:46 AM, Srinivas Kandagatla wrote:
> Add support for the lpass audio clock controller found on Glymur based
> devices. This would allow lpass peripheral loader drivers to control the
> clocks and bring the subsystems out of reset.
> 
> Currently this patch only supports resets as the Q6DSP is in control of
> LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
> channel.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---

[...]

> +static const struct qcom_reset_map lpass_audiocc_glymur_resets[] = {
> +	[LPASS_AUDIO_SWR_RX_CGCR] = { 0xa0, 1 },
> +	[LPASS_AUDIO_SWR_WSA1_CGCR] = { 0xb0, 1 },
> +	[LPASS_AUDIO_SWR_WSA2_CGCR] = { 0xd8, 1 },
> +	[LPASS_AUDIO_SWR_WSA3_CGCR] = { 0x300c, 1 },
> +	[LPASS_AUDIO_SWR_WSA4_CGCR] = { 0x301c, 1 },
> +};
> +
> +static const struct regmap_config lpass_audiocc_glymur_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +	.name = "lpass-audio-csr",
> +	.max_register = 0x1000,

^ needs a bump 

with that

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
