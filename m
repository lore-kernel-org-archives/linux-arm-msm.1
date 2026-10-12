Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E384D3D9524
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791813496; cv=none; b=flUb7D66XYDZowaE0Xl0skGd8LEoDC1NXXu16m2YAAX5p6YszLdzqYTmL2rzQAoTTWLVmCgrBfOoc3HkdhmT+xeKKHYRx/vE4EPS8orxpbTi8kUa399UgAsWBSgs7RC/uLu/1CnjWo1C8vLVN8bksAKe9s6f+4ZXzrTqi0h1EV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791813496; c=relaxed/simple;
	bh=CfYNbW4bF72moLoG80+MZvlQLhRZENNUhWa/04uO5oU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WM2ID4QpZG1jVPZWOzKw9vRRCkzMhVYfgdoQOz1kK9iznL3u7BDMINOPdbuKiJaVXdwB/E14yCQTkzLL35DpBS5Mf6JkhF3SjgS0aIjfysrxq8M9H1OozYIzOiu9n6MFwzNrGR6WPmt79ueB+i6F9MIz+n3ZN9nRkZTk93f+zVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=McQZBpnz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QClbwnbE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="McQZBpnz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QClbwnbE"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0PxQ2088501
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:58:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kAShzI9oYCosClXrlOpN4O/t5+JIqDoiZLXZsE7u0ko=; b=McQZBpnzZBZOJLF2
	+eK96wEs1aQHKd9dIt7CR1Dnw/kT9ZH6uo7yhTtstuQLNFq8MJrVE+XqeHJXFXKy
	j44flkhkP/zh0sgRSP30I9T8nLvdrEBYTPReqeXPtaMp5Y+nomoqs9X/cjqk4SQA
	jwnwlPWkoTYU6oHBA3iv32zXQo0prDSQXeUXYVJO4kglJzYiFZSeByfWRdWowx6Z
	v++WKWcnItNnHeE/n055KCw5DGRKvfyfjRBVHyhXNxxXZNqmDRTTk1qm97b1Ms0c
	z/GMgAx0Uxf6LdhsUNpnzbZI9KwOeu7UmHmo0MH7ke487ulUujK65KD0H/tSV3Av
	8dxVJg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sgu2792-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:58:12 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9179fb39cb4so5719866d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791813492; x=1792418292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kAShzI9oYCosClXrlOpN4O/t5+JIqDoiZLXZsE7u0ko=;
        b=QClbwnbEGQBXiG8ynsc/Q2fmS2Pj7xcS3rIziEbEEp01Ey2XqvQ0Ro7WYxnr4l3iKa
         x6LzGzt9eMvBdFooHjguQ7z4MYVHwtGOmbZ5Ba6FwvoWrBS/L1fhttdB3klBoewaGZGX
         QJkRatCOiyTfXPl/lre7pUGpPExU/z2CcWf8KBnK/FZn+5DVusS+4uw3uZEbknIWsPs2
         Vy8GJXlF1cL0huLzS1HDjvHTV84br/jru9dr0H3gdrYCcbS40hwjiYdlR+MQWBo9VhTJ
         uIdecV2VEIRlYl9KQ0Fh0ulPS5mztef/kYw2HnDJ7UAyZVi7q8KEzAbDvFoEsVo06Ct+
         waIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791813492; x=1792418292;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kAShzI9oYCosClXrlOpN4O/t5+JIqDoiZLXZsE7u0ko=;
        b=FaVlpA6vmKR293sRx/4/kGgti//GGemj7O1wsfQw6HwSq9I6XU9c9XNA8f/2SfUACo
         QZI4xuG8rWtVwv8pmSq/DsicKbroHoF5vHKZKYhukQVyDF/TBhyef3LZJKq7SgprxWeO
         xlWbWZBIs0OU3l2rwB/FsOTImpX2w0ZYx5UHt3R+Iy8JQizlyCbYBK/muetsvctMFOLD
         z4hCQC+1ccKywCvUQYXbrS7o94FvN3UYuPlp+SBQpph6Zxhp/c4v/OufztmaM3PhCxRE
         DNulh9WgccP5tJKqAXFpkSd/RypxdBMpMBjSq1445Nl4aLlWr8yf1abOpE4gvaGij94S
         wdhg==
X-Forwarded-Encrypted: i=1; AKwUvBwgmshwdFMgJtP9KUAKSKuJyUXbZhMikiDdoGsoFkx8IGaOn9twk5gSEa8K4mWyza3w7URhfYhnBHveKFC/@vger.kernel.org
X-Gm-Message-State: AFq9FYJNbuP6SD+MLYKz43pafbaNX7u+OktiXm0an/Yake8Q0SBOYpIA
	pxjnrw0ZiK5Nuf4yiNGlDqfTlXmLCCqv2nMNlUxX4gwMIR0MtWX1IVojBRf4+fxh9h7rDOTynif
	R0UE1UNjaGOyRHswpag7jpI9SUeHYzJivkxkf9QK0yKMfJ9PD5c98FNKOEMO7xCdcQE3g
X-Gm-Gg: AYBFou0fMvqz5nRdU0BSvM5D9BdpOR3TCX/o4AhPrGdniPgnn9mdy0uWrSzlHFCNj9w
	s/fyOEHYqhrva+z+OpT8FktN8yq/Qwx9rBAWg0ELGzGIDzNHD+3Xx9F5j4wG5FfkG1Ll+QWVrRu
	88A07GiGNd2R/5uCFT5v4SoPB+S7Ivo0pqT7aWyv66D91WxqXXJRehiuHMCKN7mJb1aZ1u9olql
	mYo81pkzmT+5S+sZI1hGyV/Gpe0E8FS+ROX58kd7ASsa3zbOeAMGe8TNRT7tmlTwC+8d805NpV9
	8oHg3gs3cG1BwbHdpvoBRj+nuLdHEkkcA0FLAd6ucD1YLif+J3sPYry+oj1qO7CafyqScBlBGwX
	fACzPJb3A8o4DuBAEly5zYg==
X-Received: by 2002:a05:620a:8017:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93ebcd2bc8fmr1648079285a.0.1791813492036;
        Mon, 12 Oct 2026 06:58:12 -0700 (PDT)
X-Received: by 2002:a05:620a:8017:b0:93e:5a3f:ac13 with SMTP id af79cd13be357-93ebcd2bc8fmr1648076185a.0.1791813491552;
        Mon, 12 Oct 2026 06:58:11 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c355555f483sm94092766b.23.2026.10.12.06.58.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 06:58:10 -0700 (PDT)
Message-ID: <717d9cb2-d7e5-423b-9d0e-fad307385474@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 15:58:08 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] i2c: qcom-cci: Detect capabilities from
 CCI_HW_VERSION at runtime
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261004-cci-imp-v1-0-227d12cb4829@oss.qualcomm.com>
 <20261004-cci-imp-v1-3-227d12cb4829@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261004-cci-imp-v1-3-227d12cb4829@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QdzzLcbv c=1 sm=1 tr=0 ts=6acce774 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=DxevoQKOKOntZzvZR7cA:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1NSBTYWx0ZWRfXyF3KkTEb7Z1e
 hncHCm3ECUqrTCtNyqhC3CwTGePo9rElED/eAmgGisUkJkhYE6cLmUkde7Cb5RznHaj8yfb7kUp
 vDFqIRymu6ug/jSawWKozm+IDJdSPCN5mUEOhO7E7/cVKWyXLCNYBdqsoOyXVpz02xOorN4kL1y
 3a6hpO2C1Kl8HVbQpcb9J7pAoGNJUz3v7NtJedyFK0bqyRdLyQa8CNFjLa0yhRO587mrq+LrAHz
 o6c9zQ+9/1ciYxmKFieGICSqOCSURc4r9NW8v1oSjWo7TrlMppV5ZDw7qMnQK1aFBqReotIncTK
 Rvhn7UlbMdkRQeyE6uDiP+tE5AKNSJB5BL8VNMbc7+GaoIi+30+Bv+xNt0RqR6yz3Vp/sZdr0KC
 tU2vs6wKr8XAUpT9hhzTHQeiWP2WcaiQvPSB4L2SoDwGRD8iOstVIFNRUwTlXSvYyDKI6pfWQBV
 L6NpfpaI0aXoeBjliWg==
X-Proofpoint-ORIG-GUID: y5UTKMwSnp01hsoTpWfDhCgXg7NPRghX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1NSBTYWx0ZWRfX6fasfyxZVYko
 dJzU1pdthdMMfb/aCP0ujOwCI0X3hdqTFeXOBiLn0F+yS75De14itpelQs2f3UPdrPozVVVX2gd
 X2qfczUXqjMUTKEcgCGAhsxOUaDeBKE=
X-Proofpoint-GUID: y5UTKMwSnp01hsoTpWfDhCgXg7NPRghX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120055

On 10/4/26 9:09 PM, Loic Poulain wrote:
> In theory, every SoC integrating a CCI revision that differs from
> an existing one should introduce a dedicated compatible string.

[...]

> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-qcom-cci.c
> index 099da0069251681cc52e351fb656bd73e78a96c9..c0b39d419e296454a083d38ce302940875b8ad2b 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -14,6 +14,10 @@
>  #include <linux/pm_opp.h>
>  
>  #define CCI_HW_VERSION				0x0
> +#define CCI_HW_VERSION_MAJOR(val)		(((val) >> 28) & 0xf)
> +#define CCI_HW_VERSION_MINOR(val)		(((val) >> 16) & 0xfff)
> +#define CCI_HW_VERSION_STEP(val)		((val) & 0xffff)

GENMASK/FIELD_GET(), please

[...]

>  static const struct of_device_id cci_dt_match[] = {
> -	{ .compatible = "qcom,msm8226-cci", .data = &cci_v1_data},
> -	{ .compatible = "qcom,msm8953-cci", .data = &cci_v2_data},
> -	{ .compatible = "qcom,msm8974-cci", .data = &cci_v1_5_data},
> -	{ .compatible = "qcom,msm8996-cci", .data = &cci_v2_data},
> +	{ .compatible = "qcom,msm8226-cci", .data = (void *)1 },
> +	{ .compatible = "qcom,msm8953-cci", .data = (void *)NUM_MASTERS },
> +	{ .compatible = "qcom,msm8974-cci", .data = (void *)NUM_MASTERS },
> +	{ .compatible = "qcom,msm8996-cci", .data = (void *)NUM_MASTERS },
>  
>  
>  	/*
>  	 * Legacy compatibles kept for backwards compatibility.
>  	 * Do not add any new ones unless they introduce a new config
>  	 */
> -	{ .compatible = "qcom,msm8916-cci", .data = &cci_v1_data},
> -	{ .compatible = "qcom,sdm845-cci", .data = &cci_v2_data},
> -	{ .compatible = "qcom,sm8250-cci", .data = &cci_v2_data},
> -	{ .compatible = "qcom,sm8450-cci", .data = &cci_v2_data},
> +	{ .compatible = "qcom,msm8916-cci", .data = (void *)1 },
> +	{ .compatible = "qcom,sdm845-cci", .data = (void *)NUM_MASTERS },
> +	{ .compatible = "qcom,sm8250-cci", .data = (void *)NUM_MASTERS },
> +	{ .compatible = "qcom,sm8450-cci", .data = (void *)NUM_MASTERS },

This looks a little sloppy - can we infer the number of masters at
runtime somehow?

Konrad
