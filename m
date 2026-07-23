Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8A74355F22
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 02:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784773915; cv=none; b=c9gvDDApO28XcTlO2ZqdKI4Q1u7oZsHc8r8BqQvHaXRwBeZ24Z//oFVkT1iDdFNqRRKz1lBTPm7RUAqnTrMJG/eqinPUqOq4jMViFUfhpSjs2yT7FrU14Ec1YxwpFvOjKf+pti+QeDm1ukbFU9BLyBPfI2OleqeJxtdkI0EuZ9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784773915; c=relaxed/simple;
	bh=TZu5cnhS+C9bzH15pyjmJ4fuAkhd61i8gzo+xVaYGvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iWevnoIrGTgsDSuCXkO+W8qQ18BEdEb1MUlxj55xnZxasMp92fC/mWYvZmflR8V6134susfLB/dRfkMFTTiVyXOTxE26ur7O6L+z8rrGwuwDtW5l+p2m2ASUzQDUn9PYLEYtxA90blcNMf66zeS9RtCQRHOow2Z2cAi5mrczEB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d8MZJyIh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wdg6Glap; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d8MZJyIh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wdg6Glap"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0WnAZ2140999
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 02:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KrH5l0GX2HhPownoyMjGvAZeDI3QTDXXz7Ro6yCrE5U=; b=d8MZJyIhfJvHjff1
	7pNtNs8rkxfT7RXJwccHFdIrjjEhdhIR8h7vgP4XIodhoRWGxQw0ptQqF3qbkfu2
	qaANRi/HsEgeH7lVzZJAFDlInvaPAsbADv0uya9mUK1sGOm/h4QrkuCMQcoASRXr
	zUYuDXeI1b9SxNphzraWDITFaxwkpjgmHLUdgOn6VIeqKNLX+gzT5qy1GvUNCgr8
	ErsdfNEUkoceDYhGq4eYMNZ9Yr1whGcrgOou7TX500Nf+/W3cCXZwqI2VROitDpR
	PBKQErqi/DoR6muLTJdif8eJs/OGEMruYsNLo2iRl5NwjCpLXG3XC3wsQZpnaUdp
	m2CxuQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fju22bxaq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 02:31:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e52306621so29653585a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 19:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784773910; x=1785378710; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KrH5l0GX2HhPownoyMjGvAZeDI3QTDXXz7Ro6yCrE5U=;
        b=Wdg6GlapXZy+4V1Ct1AnwFn89ZF5XwQVN2IXzTkLWSpHfgCCSIvVqTx3vMsrHTs9Bo
         sshYwHs/O4G+tWsSo2yUafq3d0Hun7aN6lJLXE+T7+WL11VqVUTq27K0oxhD+Dw3PFfa
         0kQsDEJ0o8JWTUtGlau56SA01ro/aVeW6ghmynvKCDfQL5wgc/hxRN5k2wV1bkVlXEFE
         ciFOYYI3D1GGQfDZnhMo1+vP2PeuqD2ikuYz8/pWWPeRhtJjMXgz5cKO6wNygIl4+pOH
         vaWqWx20d+A+NJ26wi7fLbgAgPL/RlxYLcIyPMNR2IPNULfUpVUz6jRMydZQhIA97fXZ
         65dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784773910; x=1785378710;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KrH5l0GX2HhPownoyMjGvAZeDI3QTDXXz7Ro6yCrE5U=;
        b=eBJQbvzbDgpbgyOWAMx7y7H1DtsZDJ/xxY1B6a5QrH8jNCXqrm24ivmxx/nhmS+Tos
         PmLHzOvTZNQEKT5YRIbRGWu7pYTM3WOPUoDfITaBXuDDbmHPMznlkVw3SsAz9e8YDlFV
         /F1AENzBKSY13pF0HjgYQ1FWEYAZ31w8ZwhMNJMShiotLpLqVJD2g3nTAkx9/cCgXA4r
         RYT6I9FEg7Yu9WkJ6ZNgb+Qqkq9U5IQw0/+xZZJdfeI8wOZrFLz1i4RGpBuhOUsAoaGG
         Hn8WTNe5vDNwlXxlWRr4cX4MHfBMO5ojbEXFxX9mv38GdpBMXuGU/CXL5c9HUSLJH7h1
         tTVA==
X-Forwarded-Encrypted: i=1; AHgh+Rrgz0w9Y1YXMWAKeRgTIw8dJvY+p46wieeYg0AMpto2aREyYznr7pibh2A9BqeIuu0Q5fIpPElpEe4rNPph@vger.kernel.org
X-Gm-Message-State: AOJu0YxoS6pgR4hV1cinSIqZTeo89kRZc9+sfRpisvJ+skXqIEOxZIQb
	RlN/s5mypsXsGFYc4m6qYViqLZrl8mi/EpVXLAmSA9WKZViWX9MgKuFT1YIF4e3mrdxiKfzM3gz
	YSeN7DAaBPn/aWsSvAyZcOkIqV1hNda385oGh//fbNVJGmVL5rGagxStlGBgjx8oQjjVoBZYv2n
	zgmFiuaA==
X-Gm-Gg: AR+sD11s4UN/OKcnokdML8VcreyKjJlqC1ByySL+3IIuEFW8JpaqKj9i80cnk0VosW7
	MDKkTfvwjhzydUPNigWd/TxA1fH82pT99pML7BwkCpX28PfU+uJ2yOUpZVTgnhizb9SAaZzbsf5
	fQ0JUV4IwiEr3I8xy3Ok91cRQsreG+0OzlaX7qx7/er4YQc93ffA7RE7g+BRk0YPu6ZJ2YJDjso
	0fH19EX0HMAxwW6vti1x/LIZlD4AsSCXC1PUateYtRyAUdX0HY6z3M2u8ROJqAOFglA/Xt9WujU
	K2h2nygC+kN1//3IngW8DXETyy8cXzLngoT7ru9ThI6eXepihJNygB9D72Y1RYQa3uEsRulvBgA
	eHo6b99rhz+fK/w1al5w2pyLg7hBYcoYQaC/bjlSGqUG4druHprBLmQeF1LfHBGt7
X-Received: by 2002:a05:620a:2305:10b0:92e:fe10:3f04 with SMTP id af79cd13be357-9310370ce45mr105394185a.53.1784773909982;
        Wed, 22 Jul 2026 19:31:49 -0700 (PDT)
X-Received: by 2002:a05:620a:2305:10b0:92e:fe10:3f04 with SMTP id af79cd13be357-9310370ce45mr105393385a.53.1784773909468;
        Wed, 22 Jul 2026 19:31:49 -0700 (PDT)
Received: from [10.111.167.143] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f6a8af5esm307755185a.41.2026.07.22.19.31.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 19:31:48 -0700 (PDT)
Message-ID: <3f1492e5-2c79-4084-bc5d-adfca230506f@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 10:31:41 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] media: qcom: camss: Add "gcc_axi_hf" to 8775p VFE
 lite clock lists
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260722163658.409872-1-johannes.goede@oss.qualcomm.com>
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
In-Reply-To: <20260722163658.409872-1-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X4Bi7mTe c=1 sm=1 tr=0 ts=6a617d17 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=dxeiA1o6bZYjeYBo2nQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: f2Juy1_fEBHumF_CSjlAKVigr9FMnTOQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDAyMiBTYWx0ZWRfX6GP/kta2/L5S
 4+FCWaJGt8+V9XGBTu4oxXv8jdUicSlSRInbJqL29F6xGQQC1DWe2tBfidfxPfruSSEAo3cAcpA
 bPV2RcaLnIwnqzahySMEpvoDpHQxM5E=
X-Proofpoint-ORIG-GUID: f2Juy1_fEBHumF_CSjlAKVigr9FMnTOQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDAyMiBTYWx0ZWRfX3+tDHPi7Kdjk
 tQuUoMk66CX2dQ1d6XMN2cUZIrHBURvQ2hHXSo5hZ6BHMmIUG02ctM3TXD2+fWRqdE+dvPifzyO
 k8hrzQP4/RmsfwP7uRik6hFPaj+1da8j7nUrYIqIfg95ZPuHhxfgl8aIilok4rcvHX1qOLtpCDs
 yZPtCP+1UurJCcZT+zUdtXP0SKt+QWiW+FbOBEHOMnXgMoSm4EdcQDGIZCx6S9VO74ZhYu5Cgj7
 AdN+5YLLKqWmteyIuc/pXHfgXHNX3IUJirTSKeqTwY+wp9eJw7AW2WKcZDHPGnH186NX0gv1d5R
 dhf6R6tsYRinMY8r0qAilQLogeIC1/3NTWxOk5Ji1IPybtzLagIW61ZAXHgxvQPg8fqruOwUkuk
 Q0cVpoHr+8fjZAxC/TscBPwazJOtynAv2G4MQlAsmvM7pPh6XaoE3jg0SiyiRHKPDLJeddfRWox
 2HibR6ooHw3Pz4QeZ6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230022


Hi Hans,

On 7/23/2026 12:36 AM, Hans de Goede wrote:
> The "gcc_axi_hf" clock is correctly listed in the clock list of the
> 8775p 2 main VFE-s, but it is missing from all the VFE-lite clock lists,
> causing these to not work on platforms where the firmware allows turning
> off "gcc_axi_hf".
> 
> Add the missing "gcc_axi_hf" to fix the VFE-lite blocks not working on
> these platforms.
> 
> Suggested-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/camss/camss.c | 20 ++++++++++----------
>   1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 2123f6388e3d..3efbf2fb4472 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4037,8 +4037,8 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
>   	/* VFE2 (lite) */
>   	{
>   		.regulators = {},
> -		.clock = { "cpas_ahb", "cpas_vfe_lite", "vfe_lite_ahb",
> -			   "vfe_lite_csid", "vfe_lite_cphy_rx",
> +		.clock = { "cpas_ahb", "gcc_axi_hf", "cpas_vfe_lite",
> +			   "vfe_lite_ahb", "vfe_lite_csid", "vfe_lite_cphy_rx",
>   			   "vfe_lite", "camnoc_axi"},
>   		.clock_rate = {
>   			{ 0 },

Please also update clock_rate accordingly. Inserting gcc_axi_hf
in the middle of the clock list without a matching clock_rate entry
will shift all subsequent clock-to-rate mappings.

Thanks,
Wenmeng
