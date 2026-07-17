Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BAF344DA4
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 04:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784262506; cv=none; b=SVfSjwBi9dWVnzZSb7E8MBYOrSAqatvqpVtkjjnF99Ol8CRDxQ1iheHNjcU3CK3EojEAv3txRNPh+zLDZ5C+iXyYIdwecf70pV66c520MhQEcjMUCRx1wwBge3aaBa+uAr0CeEmB11EQPCkWuy+ejZpzzMPAO64wlY4wOm0fjdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784262506; c=relaxed/simple;
	bh=DzhAG2YI9xTMPvrdH20IqVoJTnqArTM+47edfCG6Eiw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ezsFUy1F8/njKqJDF2e4ZvLvfGmVYEk2Egf0syDF9RC8b5mW2UmSyPJWLq1TICU+GSWliuzFHLiGAbyAuIAk6Qs4nt1iboLNE43pmENYaQkMlSGpXhbCck71E6WS3S1DqY5aRrj3UnJMTT91Gv/WuhE6+01FdZ6fhFDNVPY1cqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cHoo70F4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P03WZFAh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cHoo70F4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P03WZFAh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H33mmr338109
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 04:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mQLxIz1yfdNCzF9ILA/PZfrZCpPFDJPkashwRc6fKKg=; b=cHoo70F4htHOYxxh
	qLR3/559wesM56iddCSDhCyH2xvFN4ntCQ2i1XUCC7+3/P3XNTGICXRDUwLfJzkK
	6VcrqiSPWa1bJP/kQ1MJz4rIPCyze8ltV/Ig5+nT4J+mogHThTQrVJ5AeOr4yD9T
	E1vp2zLbMzFSjxH1rvrEI07CkNeCYxhCfk0MjM1zBEQi9murYmRdQqep9njzdkp6
	3wMG5klKmHNrWS35mjY5WWW/HduGZKMJ8lRk46dWNvzuLRX3YRqSuQgu0+Uc3BqW
	sVCb+LGe71gt+VQb73V5NMlhYEHL+dhvpfSKkLK02zUL6d6ISkURyXjujeOvxD3U
	1hreUg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff1weaja3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 04:28:23 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8894570b58so3060247a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 21:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784262503; x=1784867303; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mQLxIz1yfdNCzF9ILA/PZfrZCpPFDJPkashwRc6fKKg=;
        b=P03WZFAh8UOI7CN37RdrZ1J6lMxkha3BnMOTq1ilk94PvFDltk6pSmOgLZiyDF39SS
         VQacRSKQzr2FtGZYcHm3PPQNrVAmibIxbzucMs9zgJ7hsxe6QXG5AOP4QWtKcsjHyzqY
         EbhlXPLMGdyvWEALaBDDSWSr+pSXoqPd1y9DWyxZQlDIrnheaXZl5V9MW2CAOSCrwfug
         NMHAk8jtwelN9oSxp/hqoAZlrMYITFXIf6gncc6fe0CMDvmg4KXMBTl6jPmkJAmMlpoM
         KY8vnHqFxSTfZcoHZuFEY/xpDAPW/NlQnqhvg7vXfKd/yrJG4gT7C33rmCFsoYZFvMCn
         bbxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784262503; x=1784867303;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mQLxIz1yfdNCzF9ILA/PZfrZCpPFDJPkashwRc6fKKg=;
        b=jXs6TauGq+sZdwN8KiNEg7eWbS4h8gkKr2xrIo4nJ2xsUlLas0noh0fm6LbQK/LHsK
         ZTTqzPP7fEFlNWkY0VoI0U6PtC4hj+OAkzVhXlq9KQqGARRcMwNGST3kqfZiCNYR38rY
         iXbR5Mm1XyH9I2Kup9uVVXoxeGV4di70v0xpo7L/mNLfKb2/je5wUnDxqb36O0HbFBSo
         MZxJVuV/9f1BPlzlRJeYAYDOWpIIYAgi9wgKCQQkJcRkXMwQoz857YOgcAJblwVA0XoY
         BSlUb2V9+5Am0zeSgktZ8vFoIaDRNxUoWb22qHBOb+A232P4saPeyPzBtFs+r7OKvkCI
         qjww==
X-Forwarded-Encrypted: i=1; AHgh+RoxFVXtOTzMspunXJpYXcB6ZxLFMyaD9LN0wQMPoU1O56BVkZWB/ACJWiMADQV7vDtMBko9iex1D7YoH9oD@vger.kernel.org
X-Gm-Message-State: AOJu0YydfQUiJKX33PC92vike+FjVnFxWQMD+MLvtGImUHGCCZ5hlx9Y
	onDWzOaDaOFTnlG01b0vtHEDZ8aExnbqcimhWwTgU6+F0XvKXs9sTs/EAsb8a1yUUoKw9h5m115
	FnUWDQgOo537P6vbX4bCGtJ/gf4GSFhSrRx+r0K3cn5JSZY07zBxFinoXh0yHulgSiwvq
X-Gm-Gg: AfdE7cl+x7hJb7YNEgv0J5YlFhHdIUuYf0aHjQlM15E6ALR+OWZQQa5TGKKS6sJBKSw
	lhbD7/Br0gKJjxo5fwkMJmqYqGrM8Ey/FE7WKXmoq3nAmptali+1kCbcQA9u0fSQH+Xa3LJ+V+q
	6JQHIXI6OHkOGQfyGTfHveCkh7+jQbSzaTnAOmGI83y454xmgdt0B+9rIZdJA1xrsqrkxEUUI03
	Q4Qe1syFhW//4EPXECo006nKQOHSSd8+VZ4VZxpao16x1+bfJ2vqcTKfgsl23TMxXkQAtDhIReP
	e6m/wxQtqIy2BcGFLgZpROBeRlVPuUcO+LeGzH0eBh220kKQR5utLQ83ufePmbzBpbFtW36IVcU
	QlGvDFA4leuF4lHvi5uwABEa6+/s=
X-Received: by 2002:a17:902:ef01:b0:2c2:62ee:5a0d with SMTP id d9443c01a7336-2cf3489181cmr11597105ad.14.1784262503249;
        Thu, 16 Jul 2026 21:28:23 -0700 (PDT)
X-Received: by 2002:a17:902:ef01:b0:2c2:62ee:5a0d with SMTP id d9443c01a7336-2cf3489181cmr11596865ad.14.1784262502812;
        Thu, 16 Jul 2026 21:28:22 -0700 (PDT)
Received: from [10.217.216.90] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cbb7c5sm887611c88.10.2026.07.16.21.28.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 21:28:22 -0700 (PDT)
Message-ID: <37b58fd2-7b4e-44e4-bc40-ce3054e6e89e@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 09:58:17 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: gcc-shikra: Add additional frequencies for
 EMAC RGMII clocks
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260717-b4-shikra-gcc-emac-freqs-v1-1-110966417ac6@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20260717-b4-shikra-gcc-emac-freqs-v1-1-110966417ac6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA0MCBTYWx0ZWRfX+EFUuUVyeqsd
 SodivFAqI9iyjunk2Kkml0MBmB758KSScFw4HTiqzlqQtemS1H6LhixgMEx76EsqpwX98VystGx
 SRATrx8pnUujPGqui9u/KX8vqXGrvk/4Z8gbAqKabvDcndRYDm3nuu7EFhB9Qa9/NNsmJ+50gdU
 la8mHko0s8RtRKBgP+OZtEWleMnFKoCtjiOU+/NYuqzWj+2EDiVK5SO9CKMPkmmn4fCenRibaCN
 2Ttz5Y3h/Ir5k0rZbIYr00x+F6UDQ/FRrhuaJLbzO/hdwiiBhEoshfwwNHefr/uqgCgpdOXCPYJ
 Rlxu7cFk3X876PTi4oHPYs06grxiSyvH4b8EZzVDysmscuxl6KDqEvbJnXpK3AYY0c/6JMN/GOU
 JVRtq1Kz6p5+X/R6p7GLCBIvHDMEjNAJ4GeUnpztfF/Uyr5WtOwGk/ZJwbzT7pYXeqtd4PLIl2C
 717bo4+Iky5l2EQbNrg==
X-Authority-Analysis: v=2.4 cv=JJ8LdcKb c=1 sm=1 tr=0 ts=6a59af68 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=0WVl2QoOaxImcyzKSnsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA0MCBTYWx0ZWRfXxs0Xw8ExTI36
 XalahyuTmjlnJXgnra8seL80EQpQfLa+7wChp/+IVbRDAmf539F5D1VELL1Cv4RFEDhlkPdM58c
 b06/k5ZD5Zu109McxKVjwKVIIS6DU9s=
X-Proofpoint-ORIG-GUID: oYTGCY1nNOaQS9zQyEs0fjeroKTY7jab
X-Proofpoint-GUID: oYTGCY1nNOaQS9zQyEs0fjeroKTY7jab
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170040



On 7/17/2026 9:33 AM, Imran Shaik wrote:
>  drivers/clk/qcom/gcc-shikra.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gcc-shikra.c b/drivers/clk/qcom/gcc-shikra.c
> index d5222756f214c356214039f95a93a28fc542801b..f2ab50209e1c037cb84db67951def053880406ff 100644
> --- a/drivers/clk/qcom/gcc-shikra.c
> +++ b/drivers/clk/qcom/gcc-shikra.c
> @@ -1244,6 +1244,8 @@ static struct clk_rcg2 gcc_emac0_ptp_clk_src = {
>  };
>  
>  static const struct freq_tbl ftbl_gcc_emac0_rgmii_clk_src[] = {
> +	F(2500000, P_GPLL0_OUT_AUX2, 10, 1, 12),
> +	F(25000000, P_GPLL0_OUT_AUX2, 12, 0, 0),


Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das
