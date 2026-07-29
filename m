Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3002B443E4A
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 11:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785323311; cv=none; b=Kw6MJLNRNhKRAOhJLgMBBMgKdKjziV0eFth+XOZLeeG+81TTQtA+GPH3ICYtLidyJA4oADKWR6x1MUpEw+l0Mt7atytpcqBELa6dvdcv0WzzG6FQcQp/unJisxytGCNGiVwzBPiyIGgHJaspe4cViO8k6UyZsWE05wrTgQcYup8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785323311; c=relaxed/simple;
	bh=jwLSnPHPhs07q4yGQ1uUTlOrqbgHeEvkeKKGcscaaMs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WTsqMwxL6zoygTr/XZ5fyagO/jI8dtxLh2RWm9hU5m7q2XOYPtvT/Xx4R0ZRxngcv9sfxDydRnuK048+ries4AFlBk0MJpynm0zTiDncQ/lJDRkT4Xcb4fUc2H7fKrVx1rkM31y+pgJQ0uMzeaE8l9v/tWBcr5VHY/49Y73Sewo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kbj5Ei3i; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LiKT8cLN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kbj5Ei3i";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LiKT8cLN"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TB6sQV1421262
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 11:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XsF4AYt0q/thRJpzFo1gQ/Z6B82oRkzfDmlpGkTlKmU=; b=kbj5Ei3inFRzMxsv
	ITEqZztJFJGgTDGcNM1ZBGcs5aJLLiHEQKVT9tfGb2k/sOooGPeB3Jyq6Sf+9dPz
	wAf8R98ICewKDbEKG9Xtiinmzy1pfLKsq2dro1Cs92tfUC+rIN1yteIReVeYWafJ
	O5eet2M+ruFj1Zqsa8GwqHeeIMcIx3d8Rkpth9JWytASoOb/V4Wsx2WWW6tKB1Wh
	AHUBAjmLx6i/I2eP+nqf8impZnzOVDxTLW1TPzN9BqqKPwmvfoVdtdOojQseVdS8
	8xKKHGDtAioQK1WO+J8Cqml20i0sZdc8O+YddVRR+5XQ4pftz8RvuimWxR1u8vuw
	lgNy4w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqbmm1bkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 11:08:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51ca37ce4c3so1724071cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 04:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785323307; x=1785928107; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XsF4AYt0q/thRJpzFo1gQ/Z6B82oRkzfDmlpGkTlKmU=;
        b=LiKT8cLNtcgY7kLq1/BFaibLbw91e0E1tifDofoNSx6yPv+pkOofAQDFNuaJ9UE3Tq
         0z9xJrteZtzlbqcASvdQLmcFmZMzL5/NcLHUITJiu9xsBmHPhRufbZA3mP/NOnPE1fQH
         XRWgyPpcRqsLp0l1veB0vPduIB0FMdtqQzgWoJkkSDlgDlAKB1prw7qY8YqMtg99P4Oc
         z5XQPcfb/oBHm7B+5GW1kBmaN9cUSBpuHrTkR9I4jMCD7AbqnLdRqWDc0sT3BjcAdJ5h
         XsUcQounn1DwmHbF6XOe5JUQe+6qm/zXYxTopNoTbJTwE5L6xHYCHwBOuaV0NUnPyosz
         obhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785323307; x=1785928107;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XsF4AYt0q/thRJpzFo1gQ/Z6B82oRkzfDmlpGkTlKmU=;
        b=iyTntaHXDMHbp60QqVNRBsRAFCia6PUsQvDN/rvp7Suozo6Yu4vO9o3niNvcEzgcc3
         xzEvHY6Rg9u+WiMRFAIywGYX/cNjq8ZRTx4OzMlUH+SmHv9abqaX5ez4/N0lk8kxEZrL
         smMX9eRm1aQCaCikyJlgSC6VOAHnx60yIiZq9fr4HIX60mjOgWsTlbiZNXK7lI6LjTuK
         DpKpDM6zNidp8G8s5qaUQOS2AtGkoac4Np3QRkNwOwOWQNg+xcy+MqVMIvrtjgqw/+rL
         n9G9JjuX2eyorRzP4+qHwFudqBZVdghhFmnyqmztQssF2uhNtyc1VwyBfaOu2kB8ES1g
         4ynA==
X-Gm-Message-State: AOJu0YwxaODr7b0PaMTKbs6xjgOxntHRiOAifzPgwqFYEar+lvtx4eyz
	3YdxiMhldSRkn75VVO6yvISxipXkHS1/93yXMX3ksywqYKX1gsH2U7GGWx26Pukb0OJb85I29U4
	gzEq9GVJWhhcRdXy1XDjA/1qVnh9CocebuYDpTBTCq3aUaBn+z66DKDfkF+FG2nPI/r6f
X-Gm-Gg: AR+sD13eAXUDp8zS063T02thHeTwR+GORjwKrhJRSfx/AVaa3+jvlZ3EuOdUQAWK34l
	yOPJKM8VzRexqD4hkyoRa/bn1NOKMD4RDqQYQA8TPUfALoPw3QQRnD/8kuctm+IvCJrTTSAnvU4
	hdUVNHeSXiMW4wgBdnthr+yXugBll92KuC9Az8uypCoXmSVvt8NIRCtkV1cHNeeVELxe4F9Mhia
	u9hLctSC64fWPZh1+aC4CYwQTln5wg2D4CyI+iWVH7+nymAe2UrZhkXxuJuq9HsngfqORdr1Kfy
	PS8wHdLnxTE7PT1qsFbjm6EAHs5lxS776M2PsEsqxLJvUprasrG+z6Fkl6SZdGVGVK+ZM5Bku2v
	zoNsoQl95r1zoKVUp1UHEOK05
X-Received: by 2002:a05:622a:1191:b0:51c:11b4:6b24 with SMTP id d75a77b69052e-529d6fb9320mr55113721cf.3.1785323307237;
        Wed, 29 Jul 2026 04:08:27 -0700 (PDT)
X-Received: by 2002:a05:622a:1191:b0:51c:11b4:6b24 with SMTP id d75a77b69052e-529d6fb9320mr55113161cf.3.1785323306692;
        Wed, 29 Jul 2026 04:08:26 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1f83f4e062sm99494066b.33.2026.07.29.04.08.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 04:08:25 -0700 (PDT)
Message-ID: <b451e31a-cc1d-4e0a-9686-c04ba33720e2@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 13:08:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] platform: arm64: qcom-hamoa-ec: Verify required I2C
 adapter functionality
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-5-771abd65ee1a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260728-ec_add_more_commands-v1-5-771abd65ee1a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: usDcGq-C8nrFCji3KRs9KswS9ivSzmSL
X-Proofpoint-ORIG-GUID: usDcGq-C8nrFCji3KRs9KswS9ivSzmSL
X-Authority-Analysis: v=2.4 cv=R/Uz39RX c=1 sm=1 tr=0 ts=6a69df2c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=CFGf0PpD_GUA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=8kbzDDFSmQlM37ls7SUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDA5MiBTYWx0ZWRfXwYI68tZNoB0D
 0PABiuzB3iadHFJV8dlemB9ZYl70/SOTTdfwzYki94+pj2gN8CWY+qNc99I2QZe0kNsaQr6nHBr
 4fEChdjert1Q6T1yju544Zf9AzVD0oIUTsWLhEUMzB3Ucy8QgUza9FRZWfjm84fmjtijrMcaJyD
 2tblU0wNAOdJV6/CzcPeKiScSxDo3CGYSbjkfx3pFWsnrxwIj9JeYJPtiiWEb4V7WVqcfmHli6Y
 qqAlz7OJ/LTZXhjSS8P1Zs1yOHn9YRrvHeSRJerG1q+C5WYk0JI/5ePxMxtrplXCS+K1WUJd3/x
 JHW3pQ1KBZgBrDvMNj3/YjzQYGckRbwiLs9OBK/gjEHBZlNmMX8lxEZpOuRyHsSwntZWGaScFkN
 lO98tfkNmaYW/qYYcT2mnruPVRgItRbm8a8Dpd+fnqgDffdHBVqQmyNWuDTtSr1ukYwISeda6kV
 JZ1iqDhmaIb2UhFt/eQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDA5MiBTYWx0ZWRfX0BA/iXFx+C8c
 bohZ3CjqFTBd3cfmLX1pf+UsAHRCuiZw/DbwvgJKaJ6E67gjSkj5Wi2cQaT7qn5aohUDMBh3czF
 J1Mckq5NG4+EhFYRWNab4ifohqBPd34=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290092

On 7/28/26 7:44 PM, Anvesh Jain P wrote:
> Check the underlying I2C adapter supports both the raw I2C transfers
> used by the fan RPM/LUT commands and the SMBus byte and block-write
> transfers used by the other EC commands, and fail probe early with a
> clear error if it doesn't.
> 
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---
>  drivers/platform/arm64/qcom-hamoa-ec.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
> index d0c45d9970ee..a420a180a194 100644
> --- a/drivers/platform/arm64/qcom-hamoa-ec.c
> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
> @@ -1195,6 +1195,11 @@ static int qcom_ec_probe(struct i2c_client *client)
>  	unsigned int i;
>  	int ret;
>  
> +	if (!i2c_check_functionality(client->adapter,
> +				     I2C_FUNC_I2C | I2C_FUNC_SMBUS_BYTE_DATA |
> +				     I2C_FUNC_SMBUS_WRITE_I2C_BLOCK))
> +		return -EOPNOTSUPP;

return dev_err_probe(dev, -EOPNOTSUPP, "I2C adapter missing required functionality\n")

Konrad
