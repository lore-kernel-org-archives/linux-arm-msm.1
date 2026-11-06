Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793954892;
	b=PMHXzEpS3h6zbbU+x3X1zLv2oTtjXGaIFjE/NwSPsnQu286aWHyqE9pJrS0ek6y7U3Fp
	 pNKXqED0UfqMUYccjSRQ835c43CFh7oaMk2h0m//3cWjFseLhrbjKwW1CUy5OuuTsZPPp
	 TWlg12TAllCNmBRHSDa2Z0wOvI/NtDH0WYNIrxZulZqQBODhNz3MP++6GbIviDV5NiEp/
	 6u04E8X0rCNyZrsLjaPriSZK86rWGiuJTqqGBcMl/1GHzTVGqmFJvs3uwQrxP9Wz2pmEZ
	 lXepv5kD8nh0Xy+/mzIwOhyiVLh3z1y9Y7LMDnaeoo8DZcnqbAAONZBBfnv8GE5pq9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793954892;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=k2FbAyux9MGdLB8gSy+e7iMBMpdgqsliTMaQr2Ms7z4=;
	b=XLk95wBG3N27LU/xctM5u5TZnvIcrVnPqgguw6GT3k+JsjzoTkQT28Lt0Yvht3ihgNBZ
	 HmexTcMPA8eXQITlaa7B6gMSYcBbN6K4ubUZc3T2KCtTvd+140KzrQS9Y97fC5cM1ElAk
	 wHpNQf/M4BO6QtHo/m/4C9jDhLADVmPgI1QnfK3XszUwM0r7S5Lcgi+NbhmvsiDEv9KOB
	 iLujYFAzhCnyw/QqmFFW3R/m9Gs3tZH4CgtiHJa5F90RbzbmcpK5QN5K73HK5aniewLCH
	 t5h8R7sKwEYyMcS6CcA3c5Hp+W5mharFq/kHgDjzDcqA6TGOSe+JnJKem6a+Gzems9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eZZK8WYj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KKUR54J3;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69067606A329
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 08:48:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69067606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eZZK8WYj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KKUR54J3
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RSMV2194563
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 08:48:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k2FbAyux9MGdLB8gSy+e7iMBMpdgqsliTMaQr2Ms7z4=; b=eZZK8WYjuuP2/fLZ
	rGYutrJAe8m1ZiwNMwRjzAiU0mbshZjNaUGXok+JEBFwbFkWjBOUNco7RSycCygI
	TLq2Lmjfu12mj7W/vCOqvmHrsZp0O62aRhNt50aXT2YNyn4L3Afj83pgWsbwH9u4
	epd+KcZtbyD2ge9AF8EiagjR4CUIms8yKR1X5oZvVTuS1A6/SgDZacM7B7B1I2DT
	iWHjvatYEOg8fgKmJb1tBeb1xJ1QU+jlTFdAyGFLxYLjogmj8OCTcD/DA4VzEaEp
	XiVZHd7LqZ2agUaT4kk/FTmYMOCTE7+I+ra7Xb+Uwd2G2bD2fy3n3gZMCVsJUImG
	MIRmRA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa9x74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 08:48:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e629c7b16so10877485a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 00:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793954891; x=1794559691; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k2FbAyux9MGdLB8gSy+e7iMBMpdgqsliTMaQr2Ms7z4=;
        b=KKUR54J3FKaZCxRNQp+3Gogi+fMo+EXtq4jWF7XAnSXRIqt/GESvjwCU3Ld/ewGv4z
         ipOOlV+LuGPFzbIkQJ3FMwiUdtssSemTZ4StMYhhZ59Nsa1ta74GB2KvA3jePh/W3qUc
         UhoTd+w226LIcSQQe463ntnwIAtE3CqNlAim2ZFwXibHRJT2y7uFUZ/AH7RG9F6OSPHo
         DUSQIRSNZfNHYCdiek9IynkiBpodX9c1dsqa9WHP/1hDuedkjYTzqukGMbKMhl5/wNjg
         U/dcClyIYHLOr4dVqoa6JUxLnSqIVQoCqtUJArx5lhHdFQDfXR9nE+PuwX5aWiCIM55G
         gLkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793954891; x=1794559691;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k2FbAyux9MGdLB8gSy+e7iMBMpdgqsliTMaQr2Ms7z4=;
        b=BbaTbjASofgviz5bIxK5Tg+8EmrEmH2k25s8qfEiFaqgIJQncI4mLRAIbsWPs2Fdik
         BTr2nX/CcEwYVAwe0LQm4d0w8RSV3tbHhfVqD9HbboQ3yEheOA3az3ztqA5FyKbEyOFO
         JPiKgGA9KFqav+HIQwDJ5+/6NPROnCAXFL8FHM/H+IBBIdAJLxnxINWGhyVsTV944r8x
         w2gzkpc9BJNQnhZdnE8eMb8jdqYMusUyeQUt+WB/0WGmioTCA2GaxGPUYgxDW0A9xAyw
         rfQtagnAesVfLh8/Qxqm3rrc85bDZM2oOBqEfFdLcFzGdeg4kyC8G0HtN+EQ/rMaa/TB
         FU8A==
X-Gm-Message-State: APuU4Z8PF18p84aROm1ln9pmygFE4Wo6J4H5XbZpAH2cnYMe9vrVE0Bd
	Mf6MkP4Se+MWZkwcAkFEgFSgEMXUilZ/uUGjgzXm9Yeuw5ZvICOlq/HM7QTfoccVr8d6XZwExIY
	JIsGMdqoNXjjBjFuraJAcbGQZYu5ALvo+rNs94QuN6g/4Rjq4aH5HVisqE/oSCGm7hR6n
X-Gm-Gg: AYBFou1AcGXCwFqeiYXDcoWom8n7JqC0IFLy+nvDGqFgZBuUibB7Hd9e15ItsZ3EU4V
	s006bkD0T7W2ymDhSAXu8MZNWMVdYGiGy070zSLXLEOV4g7TdYSQjVeNaEalHlu1eVYqudcnnPi
	wy0ATjTT7GfFyPSU42VrjmvbQHZT0dCDOLHtIWJrPP0pLY1ZZPVDR/vOPrF5kNnrJxTkR8SdcdI
	+I2fr56X6adqQdEjEBhkUHcTatWyJQOJgM30XFYM6V3dEJZ3irmjsjob9hyt7ipHr45lnkZgRRR
	6V3RTFZxKmovvar1c0itKO03Cne/GfOF3tCUfAAoVf4Vc5opbzRX3z+k23RM39hSWrvIHGbI7Ct
	I8YJyVK5rh8mfPf3UE/AGQYfhFd5cQzQ+miND2hezF+rj9W/R8z9H5mQSJSX9wW8vTANx
X-Received: by 2002:a05:620a:3c17:b0:945:e612:cf59 with SMTP id af79cd13be357-945f35e5863mr220662585a.5.1793954890670;
        Fri, 06 Nov 2026 00:48:10 -0800 (PST)
X-Received: by 2002:a05:620a:3c17:b0:945:e612:cf59 with SMTP id af79cd13be357-945f35e5863mr220659785a.5.1793954890185;
        Fri, 06 Nov 2026 00:48:10 -0800 (PST)
Received: from [192.168.226.1] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d3566e050sm61977266b.32.2026.11.06.00.48.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 00:48:09 -0800 (PST)
Message-ID: <e53010ae-6347-45df-9574-a121aa4711d6@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 09:48:07 +0100
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
Subject: Re: [PATCH] pinctrl: qcom: check the return value of
 qcom_scm_io_readl()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski
 <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Ajay Kishore <akisho@codeaurora.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20261105-pinctrl-qcom-scm-fail-v1-1-a23f96c6b313@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261105-pinctrl-qcom-scm-fail-v1-1-a23f96c6b313@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Q9zdvWiiS242YXUPTZlhGRkdtk2ADFRg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNCBTYWx0ZWRfX9biVNPT8eM//
 lq3pKGRMXv+Qok7hDiRsroC0fuWwSoqISBFfFFXlPjpurxVhN2DEIcKqBbUZu9bkjB/wb0oXau7
 u51/XuWDgU1fXKSILqZr8x7eqBM4JZusVPBJCpV/uMeTchA0LL4l9cAEcZrMrIfEDtxhOASSVl5
 atoRW9j/fttjkgLn+7qvqGY1E3eO2YTS8u47RBFtdRVRfM5dQHOCyQWRH+4LzFEidJ27FC9rerI
 nkQ6lTXDXXVcIPIHlTFDmtfO2/zWzVFJgTznNWIxiFL3Df75qp0+c2ER160oCCpVWnbeXbn2ChQ
 3WRKAqLV7I1LLQz06y3kAT6iQO3V1ckO+nuxn3IgC47vvXMyuN24sB5Td8i1PlvUQw2AAKQXxSj
 FymmcyPdXzfVPaXY+RUiLlCRA2DyAq1y+UUSE3qXiLTgdkpnXZVQypx8+hOhQAiVxmsrd7UuHgH
 NgKSxJH+9+FHFuogYvQ==
X-Proofpoint-ORIG-GUID: Q9zdvWiiS242YXUPTZlhGRkdtk2ADFRg
X-Authority-Analysis: v=2.4 cv=X7rHu2Te c=1 sm=1 tr=0 ts=6aed944b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=c92rfblmAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=PcXE8KnCS75fSRLkHuYA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNCBTYWx0ZWRfX45qL2KQ1mSow
 FCj/pNw+df5a5APGX4UPAeyU5sFyMwi6qMZ5wRdpdFZClk8hlClm7O0jwFwU8PhOp6/BFLK7nLf
 Eh/5TdaYerncdWIe16acMA4bTJF8wjM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060034

On 11/5/26 5:18 PM, Bartosz Golaszewski wrote:
> qcom_scm_io_readl() performs an SCM call and may fail in which case, the
> stack variable val remains uninitialized and its contents are written to
> HW registers. Check the return value and bail-out on failure.
> 
> Cc: stable@vger.kernel.org
> Closes: https://sashiko.dev/#/bug/linux-a5545ffd-48cc-4856-94cc-4b2dd7968f50
> Fixes: 13bec8d49bdf ("pinctrl: qcom: use scm_call to route GPIO irq to Apps")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 32aa7b919e24a0e614078ddc70a248c746e4813b..0053d1d927dc134ee81377fe480befa2da87c7f5 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -1117,7 +1117,12 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
>  		u32 addr = pctrl->phys_base[0] + reg;
>  		int ret;
>  
> -		qcom_scm_io_readl(addr, &val);
> +		ret = qcom_scm_io_readl(addr, &val);
> +		if (ret) {
> +			raw_spin_unlock_irqrestore(&pctrl->lock, flags);
> +			return ret;
> +		}

Linus already pulled Lee's fix 

https://lore.kernel.org/linux-arm-msm/20261103213002.1673560-11-lee@kernel.org/

Konrad
