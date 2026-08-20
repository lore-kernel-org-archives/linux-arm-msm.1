Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C74044331C
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 12:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787229509; cv=none; b=PxNsZqcU0XRa47BBplujlXd7+BXjX+d+WAzxhhivvXvuS4M3D9IwXca3adaNEYr3pANC2ql6IQs83cDgNK2Swdlduuzt3ptO903c8kGYrucH+Zh171c/jliBgG1oyKGAu+sxq+obLND3Ie53iBE3FvUh5I9OXE2/LfrQ6PuUcgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787229509; c=relaxed/simple;
	bh=l/R1/gOoK45ubjLpI9AENYiPKBHJHxzJitxKvQeWDJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mppNK2y19Vd2MWXMf8q+1mD1sbga3cz8c+Euyp+P14CAs9WBIXOuGdNIfraFYocrxD3Q/MQuj6BZ3FgO6TRndruH1nvWguC2NvQWdbfbJ0FDnYdy8OO1HrzFudh1k4vhqvnMWdMDRJFYa8dMMxQ5KqJH3U5z8Uz7kPS75tALzzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EWEhB/XT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ktDd3B/t; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EWEhB/XT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ktDd3B/t"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K8KscD1680719
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 12:38:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v7zLYjanpfp9TIHoeaGe4PsU
	F/pgzLalO9L/jWNZMoQ=; b=EWEhB/XTy40L55d3I6BqgBjSG3N0aw18Kz3B0/gl
	xxbLW+GrKld4bOzheSIU0xKDS5WcCDWw8WVLoiS8D3mpteMjwoKNdyQJKVD3yIJY
	SOo0O5wAP0snDMmr0aRY1o9kn83EBFIIePsLjynzeoKGjEI+FJNF3SrByNlkdymP
	Os5N0EdeDX3H3kfrm6fExdK4Umv8gIpY70dM8gQE3sEF04usrhqS++SNdu2EJrDo
	IGt1XlYBL0vwPpwoRVt3WFW9gjGL467OReWvYYcVHmxKSIac6TIFw4OBYQiddFY9
	Q8rX21I4xPSePqq2+mfik7asL22lqy1H48DlvP4MPmNyeQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5x05rxjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 12:38:27 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e62e3459fso255127685a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 05:38:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787229507; x=1787834307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v7zLYjanpfp9TIHoeaGe4PsUF/pgzLalO9L/jWNZMoQ=;
        b=ktDd3B/tRKiNyQEUwCUqzWvgZmXQdOw5UOjKn54+8Dn5aW8Yj0qrHs8cOC1ix0fiWd
         DIFAUVvcdj0vizSCWPX9MQjmiY5hi92/sYD3j+mZcCb3vcMl1wFw3gCpR3xVhW9ukGMX
         Mq+A6ShoOGec+kIc8ZsRAnjIyPW2q6D/6YwIYyySEXjThWGqGclpbq6ZnDLyXf3tZYry
         qY55M39RyfGK9v1/5h+8OjmzKj8KfxbEFx4GQJVbymc/f2FYS/obvNPJCvSnN53Jdpk9
         P9CZZFg0m/kKIbhR9lHMxrKq+/gQ/HsTWD1/ObPGX1+HflmHhdZQFK2E42WFjOPWhTGw
         lDgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787229507; x=1787834307;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v7zLYjanpfp9TIHoeaGe4PsUF/pgzLalO9L/jWNZMoQ=;
        b=dE9ywg2jOgQ6YfTt5dVGjky0qHuej0oCoeQj2p2xAH+IDTPpTEvpodFl2Q8Y3AzONH
         ToefSHsYa4jTlgPplpmOXezVLoOUW/wUCfjwOqe/UyKWyvif/Jfl9AOemdxPJ+Qs/w5u
         K/Y1ErXZj5CMgLa0J87ataY+NADxucybCua88gsDFfC02+sjHFPNfUGCSHMhSQhK/+5l
         K2w+Y289HRAs8ByNLOIJ9Jus5ROCAJ5UybZtwye8lUpxJEzNTPGzMTOal652P77tkDA8
         eXaUgUURfnkJcNGVPSsTJtgPVDgDa597wdtTEJylnO8lR6weCHXxZSwSJtlul7KLSMkm
         FPBw==
X-Forwarded-Encrypted: i=1; AHgh+Rrt52M89LU6CRaS/4GeI4hAY8ofMwo4NyxFz/fyBNaqn0PfSxPOKRUr/C0GCXrwR+ozf/2WhSjX4AevCxiY@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6R2ioYZ8m78eO1e1/JmZOD49nOCW/cmXal1dw8G2TjIWLDIr5
	mCxAbASTk+SyujO8ozZZENPdbu4ddhJKUQKdDt8uuW+bQzFYdZwoCzb/BqyeYhXz9Fuf3Fd3VDx
	A/p+MANvo14YeEhr3Hfev3fC5Wt2i26FTbUnSD/YgEFWfPVlPwyQBV+znK3L6Jo7yh9QE
X-Gm-Gg: AR+sD13CebQ2T9k4ZOR3tIUQR8fWeENRM8MYYaVThdi0Heoop1z+PuHUb95p/sPT7aI
	w/+kytvmbf+ea3LhTvyFLLUBGq+xFxnX2zV61sx0AjKcmiDoty03xidqjUSVdHjvuWCjbn96q+o
	d0zVqVHb2EaWkHXOJxLuZgaEzZY7FnOPmVigD8gDJytTFh/XD31+g63n0TgzvaskFtDVVvPPcar
	t8HJliliRf6zZCA32NmeqIb8PXuRt0vrafFjFkWZmhJ93SFIqxENSxQkTBoNPKryi/DEp6JqW0y
	MI26XYm3KRvCZzaMamWiZdN0o0bfLs9rVSJCG22DHExTho5Dsx0oZmhcX0ClyJFeVHVbKa1g8ih
	dGPoH1L7tG1pFaUU=
X-Received: by 2002:a05:620a:2590:b0:936:f9f5:61e3 with SMTP id af79cd13be357-9371e1e0984mr1097071285a.1.1787229506599;
        Thu, 20 Aug 2026 05:38:26 -0700 (PDT)
X-Received: by 2002:a05:620a:2590:b0:936:f9f5:61e3 with SMTP id af79cd13be357-9371e1e0984mr1097064085a.1.1787229505983;
        Thu, 20 Aug 2026 05:38:25 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa074740sm150341215e9.7.2026.08.20.05.38.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 05:38:24 -0700 (PDT)
Date: Thu, 20 Aug 2026 15:38:23 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: shikra: Enable dTPM on EVK boards
Message-ID: <kagyozy3pnlmslc6koypfrhnqutfiruusnwkklkxpfvkizf4aq@eevs7ox63jrf>
References: <20260820-shikra_dtpm-v3-1-93cdd4f3e8dc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820-shikra_dtpm-v3-1-93cdd4f3e8dc@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: EImO0Ib-tzgiW6k7FVP1fUaM9ME3bvQ3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA5NCBTYWx0ZWRfX/PsirpXDtQXo
 F+19mcx9p/GekicqX/iGJpxupwBy3JpHSnjDB42olK8XJk8XAufisKHGESclKSh7x6mzhgbyPgp
 6oX8MQ4zyaImJQdUvpTgqiTpHBP2fRWYgn7sOnIMPL3vA3hjs0lKDu08fHWGo6snQ/7A0CXog8x
 2DURgEFhZynoeq1M4cWIxZItquvfbSyuvAP9LpyM7GPiWsU56yU5mjd1iVIRAFaI0LWME3JqZXE
 lkWCHrNS8LO9RyGon2ojr5By9frW5cAgrn7KxNxhVgM6ResYvZxja1kSpZbmM6EdBglhztDEwq9
 lJnku6N+fIWVYQNujlWtvVUE62VVdhGqRq9HA3irhOfrEGbt3ypf2IDqpxzXAAOW0d5eln0Ix3U
 KZ0YPuHriJ4gzaaDZvUpFD9PSjGQydYwPoRDIKnNWG+2vdKb8mfWxDkVFBX+IJTQCiYBPNaK9aA
 Ib1e+r3hS7CIYCS5C0Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA5NCBTYWx0ZWRfX5faaleqYIJSD
 gBl9wqDN8SK/Q9w0L9K4M9JkXD2ZJJLY7fDmtk8T5KvOIbdw2mFGKVIZ4xouyJhoYRiZvqRnCeE
 n2+D6BDfZ0XeD9ozNDB3B58PrS7X6Ss=
X-Authority-Analysis: v=2.4 cv=VfPH+lp9 c=1 sm=1 tr=0 ts=6a86f543 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VPIKziwejObZ-StCHZ4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: EImO0Ib-tzgiW6k7FVP1fUaM9ME3bvQ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608200094

On 26-08-20 17:46:56, Khalid Faisal Ansari wrote:
> The Shikra EVK boards (CQM, CQS, IQS) carry an ST33 discrete TPM
> connected via SPI5. Enable the SPI controller and add the TPM node
> with the ST33HTPM compatible and a 20 MHz max clock.
> 
> The TPM node is kept per-board as the dTPM hardware may not be present
> on all future Shikra EVK variants.
> 
> This change requires SPI5 to be enabled in shikra-evk.dtsi [1].
> 
> [1] https://lore.kernel.org/all/20260820085347.822-1-xueyao.an@oss.qualcomm.com/

I don't think this should be part of the commit message.

> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>

You have sent 3 versions in less then 3 hours.

Wait a few days (at least) between respins.
