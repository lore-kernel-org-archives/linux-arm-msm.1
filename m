Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D390431E67
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 21:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784584754; cv=none; b=bo4yNkLSkK9XS77StFDMQ2J5StQe10THIdcSgGYvdZMXKANnstDkI+yzzomJt2rbeyckxd6NUahSiqInI6fT6prPdOwpB6oyuS8D1MR51inVpttnU05/KWR/d7TOdviCplQSJRiEi58L0jdIGvx5G3s65YQtvNyifnk/iQghv1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784584754; c=relaxed/simple;
	bh=ScZCTlhudscLdLP3Oe4Bvzrgs1IFdDUt1Y5wMtWRIog=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQg+d76gYX0V0W4h13FZAgCg446++PfJUIDX4evYn/O0oXYVDS/ChNj39kRFlJiKaMoXs0NP8+IIyouVRjc52LhPwttpZ+SvFF4rEgcuAMlEWTiIeUL6QipUwfzD+BjujWPa4u8ytcchxijCF6y6a8slJecR6Q6ERBmVdH+yPtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Utl3LSUu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=de8EgkqB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Utl3LSUu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="de8EgkqB"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KJTWGw3397167
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 21:59:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gi8V+ZNTWokzBcEzU++1h7CE
	hGlLLcxxFZrqT9eib/w=; b=Utl3LSUutijiXpGxXHC2C6KAWb34N7+rWtjvDr48
	cLGUV65UTZ6PhYrhcx3wRSrk9lJkZ3YBuM8sCVBb2Qmw69NBDJYIEJUPpKD3AsO1
	CwdyT1h+x1Q+tIRpapTpMkoTBrcA5Gs/V9XP9xlgL9rmms6cMoorw4VPUhZxU+at
	OXyzu3eiZubMcCVIebaiT24Tx0HFUVHml4w9TAQ0ST5N76POpksE5ThmhBk3DSS6
	KIJtOZwaz0w27t4gCmRIFdnG+PhGM4jArPc7uxmkp/l+ibLiwaaxhaAKJyt7dPk4
	dAndHwIEUkAZX+rwK1Z/4okTOM7EozlgkauexYwza6znng==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqvc93p2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 21:59:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-520a00c7a03so113204951cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 14:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784584751; x=1785189551; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gi8V+ZNTWokzBcEzU++1h7CEhGlLLcxxFZrqT9eib/w=;
        b=de8EgkqBjgcsVoKMRkqghKhFIy5Uc0xnTocTZM244N45/NJYGfbieteHaBbPJxCU1F
         CWuNc3pScmvd7q49K5XTwKnYfliiy1nFheETgQm++nnJvqj1jeODnmY25x5sX7i3u1E2
         kKa3ezgDJFxDk3H4MYUQAJ9KyUOID2UBsIUFTnehcGn4Ba6g+0mbc+i5KpwdCVCI1pyy
         EIYrZ0xzDrShxeW2IlJl9cogk/+9PRrUVeDHdGQDAXpHfxJBbKagLjlbuJiMz00oyegR
         SZpcW1QPd31q+pDg0fOjakPwxL2y1FttxF1o7oLY2YeYU44vI94KLG4lR5jnQQQorILU
         03Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784584751; x=1785189551;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gi8V+ZNTWokzBcEzU++1h7CEhGlLLcxxFZrqT9eib/w=;
        b=RvEFdpngJ/+gXvpczmxnGPdfqEzgTYGxeSQ+VkQ+KcpaS4RYu703gjp2QilJTbLl9J
         ULqNcNUZgNehVvg348vMgB4lAKQSt8rgNod2DiTCUtqrbYPyVimT8FW7qnDitRiL/EHv
         hUJ4XMae0l74DOcuedJzbkNNF0S7pwBx4v8u5Bv2eO0DUPZ+kl5G4FpVG1jmtKPu8PLX
         ul+LnP4QzdxWUdxooMMvPkkWboZ3U7lMJctfmgeIQ0EF5AriqJPZMeFR4e8JmVg25jLd
         OGoLzV/p3uDZkdxJOu4BPJv7Tx6ecnlwPdQjdBctD+7FFfcwZQ/2HzXTLsBkGbOvL+zF
         yoqg==
X-Forwarded-Encrypted: i=1; AHgh+RrLES0KRlwiT6ibGZeQfh8LttWc76F1Eoos7ABrSejXMaIxCkJWWYBn58XS3cQj6lfQirWEfwgrhYZYohdV@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/25pB5uaO16BzGuerXi3q2TJNF2Xdv+TvC+A8yvLKKhP/B+NH
	V/ckORQpwEXlPvyEUXUR3Ue0QzKBBm/sseS3BOoQXt/HTtzbs6dLFq3jqRo4GcquzKc9oDLnSrw
	/6W1eNymCzIvQQr+UXRGgQCRn7Q0GZhiAG0YdfcW6jVPYWxZ4OqStEL3UNiHdPexwXSku
X-Gm-Gg: AfdE7cn/fYlG41fvdFAomRLwepIvW10WPxGYKkbI2B0WUHb9USUu3BW52pBDeFwjSpr
	1AFtbKRPbwJF1u5wtnbMRBHi2nnLDcnTcGRh8KDmQ9DBy+diWnrIAbrPabjsnYpGKhP0h5+rrzq
	QcNwqBN3h83dWRGsR/MsdZAiQec3lwu/IcWt+XK36e3ij3ZpjQB/CMg/5ym5tMmU1twSu3QPm1P
	YNfXIIoICR5lVCBOudGInGayi6oDb+y6oNVZs2CClYx1JQXEsx2MZ4KmW+pCqSxDYcg5zPhLZkW
	aAylegCbf0wGn2NqNwjvjZ4t6L2ck0Fv2hpCwL4Ha01tbaSynJq8QbrIrR7VChd4iLaCsVQEZZ9
	gg+8+TZi6gUqPvNR6Ys7LXNHoLs703HpsfovmRZm5/3UgsrB7ZZii0QcVDjX+Mzt7ubTJ8xn2J8
	Y9VVKWEC3RVE1ALw==
X-Received: by 2002:a05:622a:1b8c:b0:517:736b:e0c2 with SMTP id d75a77b69052e-5213ced00b1mr154688911cf.27.1784584751409;
        Mon, 20 Jul 2026 14:59:11 -0700 (PDT)
X-Received: by 2002:a05:622a:1b8c:b0:517:736b:e0c2 with SMTP id d75a77b69052e-5213ced00b1mr154688721cf.27.1784584751057;
        Mon, 20 Jul 2026 14:59:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291d8a833sm2455317e87.9.2026.07.20.14.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 14:59:08 -0700 (PDT)
Date: Tue, 21 Jul 2026 00:59:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] soc: qcom: ubwc: Add Kalambo UBWC config
Message-ID: <aalzx4bjrydg7ro46xlpotzq6lzarjpftiygikofp5o57mgjjx@7pzzq53bwxhv>
References: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
 <20260718-b4-kalambo-crd-v1-5-a1069b5a2757@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260718-b4-kalambo-crd-v1-5-a1069b5a2757@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDIzNyBTYWx0ZWRfX1T0myxAUAIzM
 rzoGhBkSu4Qjq9MNMl3pJhmQWJvlO6rGvpnV0syMMH+zNHzfvEiz14HpC/gwioevPO4I2U28YGS
 fvOS7U/NVS3w1BkN7epeR4vQhAiQ0Dw=
X-Proofpoint-GUID: NwT2pgpKlsHNCowG6lvkjDuhfAY5B_eq
X-Authority-Analysis: v=2.4 cv=OMYXGyaB c=1 sm=1 tr=0 ts=6a5e9a2f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ZAuWv5OiGsYHQS-HHhcA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: NwT2pgpKlsHNCowG6lvkjDuhfAY5B_eq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDIzNyBTYWx0ZWRfXxBVetWAQJb7c
 QbDe2jS4HO/rhJjyejygnaFYszl00O6pComedRzR+xC+T1iX407DrbjSx2a1VIqdLDVdR7mA0Mh
 joSou6Fi1lFQI55kMwY+rD1u4EeAz5UHkKH2PEkJB0+A/h+GDgV9u43pCb/cCi5DA/Zw3/KD8/9
 uCpZyx/INe5E6Pfbq7h8wKl2SWsYOVbfxrIWBEQZHvkC+zIewjkeFLIbGhQm/B/zIrEmglIUsCB
 dAPEy+rb6MBNfOBLdQWS5WhQgtz8dyssXCvR5N3zgt/DuThRZI+ejqQe1+7KtRo3+bejsgeotpj
 gDp3ca+AxmlHxK4zbtf5g4tI5KDIQlupsDsZOx990EZUhFgpYIdB1Iv+O/3xx9kMEm9Bscs3inM
 Up4XfD6II+JJv7mG0E1yfl/zvVql267JB5t5LgmlkG6lplzaQDMlmt9KpHQ6SGXbiIJFYlqm+ID
 eyYr3E8xgJqY6VTzFLA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_05,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200237

On Sat, Jul 18, 2026 at 05:06:25AM -0700, Gopikrishna Garmidi wrote:
> Qualcomm Kalambo is a derivative of the Mahua SoC and shares the same
> Universal Bandwidth Compression (UBWC) configuration. Add the Kalambo
> compatible to the UBWC configuration table to enable support.
> 
> Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
> ---
>  drivers/soc/qcom/ubwc_config.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
