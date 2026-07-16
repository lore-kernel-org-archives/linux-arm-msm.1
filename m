Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03C743E48D
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784223885; cv=none; b=OtsAOQDG0O3366mdinbVTJqde71OcWHoyvUOxVyNtmIPvn8HLsb9yRfwAfFzuzLk6RBtgg0m7p3aHdZb2rsHI7Y6g8c9h5OuHlZdB/ekr3n41F/ckTA8J0UmY3K4T3JdVBonTNCuIXlk+cP4iHPXBFpVLoxFpz1lnfqQ7Fa98fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784223885; c=relaxed/simple;
	bh=8gRGck/CPM+mDyna/x4Z+bVM95zYh/qMbgDY8XnLj3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UtxcRlczJEXqC5cnv4IZtCWFgsQgFkNSxhsspsjcaPHGZQd2purM7kxCcfnzkA69m8sNsB4H/+Jkxv+L8HgmA6JGkd1IYan9+MYwKiQlLr1lwYMf9O4iq+fJTKw8NZ7qq4VsrUtZzpsnKX+DKCzorRhNVWQWLWj5iUGChBiD4Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cy3CXKAV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RxVXhzQt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cy3CXKAV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RxVXhzQt"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GHZaw63544337
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Zlt3WjfywfZcqxp35j7nwTTwzqYUsZk6IdE6jAe2Zs=; b=cy3CXKAV+lWNAeS1
	BbYv2wt72eR2rVXCPrbj3VbochcYJB1vC+UcfX/VqnhHG54zSmInldOQUHbvSJJU
	VMTuIT9ANhH/+6bK+IhJ7vjQlcmb8eVHVBnlsPtvJ8kXy2Krw7XHffxF2cr0Acyg
	jUY+7aPpn9m+32Jwp1nUj1P5kP9+VfRUV1YJYuKWNAXtswREKywUOfJicEa88BDV
	yaro7cVdCGwS0QJ/I90+lmSoPEvs6TvLCPUel+xt+4VxH8DNuGBAg0/xq/DpSvs7
	3oQvMa6UeYUOwixXtjGk7NW3a/H5/gtuKU822qjgafkT/2+akOlzYlc0mhhPiUhS
	oc0xbw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u8019s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 17:44:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e566bae1bso137185485a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 10:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784223881; x=1784828681; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Zlt3WjfywfZcqxp35j7nwTTwzqYUsZk6IdE6jAe2Zs=;
        b=RxVXhzQtS6WIXh1Lz/kdo41/QtWC/YFvhMxouCEFlkJ+xY1URGYSMqQF8nOSSg4mqr
         XIQJPHNtHMVdcwiWy3HNZ2L4msNa4Z6Af4AkF29fvelCcYXNEBUYuHFvtlR4O+7XoqHX
         uvsADjnPlKgoyVnEQxtFi0zUSsOJxw7JB5A5OObQEVPE79DhxcfniQdgNWdgd2s/asCe
         azCIsijEPXsxIEG8ZoFHwMCkdZHnZfvKBP8wfEhiGZxNKNi4msgJERDwvVhXVjn4aJza
         6BUt4dZFtPTyp48EiquLhkvP7k8WLP/pW3duqYAvxYvm4Xm8L9+sRO+A9BCjww5xRtze
         hG/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784223881; x=1784828681;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Zlt3WjfywfZcqxp35j7nwTTwzqYUsZk6IdE6jAe2Zs=;
        b=aoTMv1BOyS0xiSvdRhQdZxcxBGEu3n4kQVmo7rFQbiMW6WFyNiqiz6Hs009jnhQspP
         cuhxNOL0H5LxDHf7/l6JaVaUEWsn8JfqCw7EfdO++71qRwoP7jStVu3bzjqZOch10nkk
         vbZ254S2GFNcgwc/yKEJvHCFc4m8M1Pdbhe1oN5srD3nA91+lqb5KSGi/GeYlaLK/+Xi
         UgCnKH9mUBBgUsbc8sA58MlPuSsJTJUvUys9a/Wm70oWVVJpfgeFsRSWQowGw/IOxg5N
         eYm0iDWXK45sWSGOf5PPcz+UxujlwhgGfEAs5jYE96jQBJ76SGmi/a4oyuVvjGluZ/tG
         9h6w==
X-Forwarded-Encrypted: i=1; AHgh+RqLMv3JJ6j44ZyQ5EG1F31zECAxTCqkLOHZBlq+Tu+JV3F0mSYbBQ9zokbHWpcWMZAhUVrbUZA/7nZ/ny4J@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwjr8YzLLInw1msgZgMN+GTSjECVh7fc11mXih9giEuEl05WOE
	R4KYRvZihGfI7I1oeDV2xNYCUEwA6vHs4t+4xKW+eoB98TRT1/VkjzbIx37AanuzXKAt4UNHGtI
	EICphcG+DxYEPwXKtDOZ5/solMACIOcyk2QcHYRw6nCf8z5hFb0N+95ViGQgKMy5Cz8Mi
X-Gm-Gg: AfdE7cmPdboxj0nzf9PExcnkV0zjr1ZeKyURR32vIXPS1pU9youbLNQPdjJ+KJM/6ea
	aQRY6qIiDNcscPejELfmJAyAx/TLXocOjiVW7oOcXxDhCPsonZr2PiiAtQD4rxp6r+dJSv+kCVx
	PbZ3jUylXWVYZd8LOLja5CttPbWUCuviry7hnJmgruD0c1oe8/jvdASXo9wpdNzxehOQYKRMpwr
	BpU9EvtvWycgJhR9Gc1p3/iZoW9Pt+dwzaOOW2buxY/5aZE2ds4brYEAkf9EVPzfXDaB/EWJ7Wy
	5hyKhY1LmA8JJ6cpQJVKPfdApORQuKeY//VENwKKTNkfminUGeb1RcHQHLmGqUOxqo3cIzFTq0p
	39belIk2u4abfDlsDbirb9B4n
X-Received: by 2002:a05:622a:87:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51cbf165447mr183848721cf.5.1784223881432;
        Thu, 16 Jul 2026 10:44:41 -0700 (PDT)
X-Received: by 2002:a05:622a:87:b0:51b:ff78:f229 with SMTP id d75a77b69052e-51cbf165447mr183848501cf.5.1784223881035;
        Thu, 16 Jul 2026 10:44:41 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69cd2922e42sm5209311a12.19.2026.07.16.10.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 10:44:39 -0700 (PDT)
Message-ID: <6ace3a66-3e7c-43fe-9581-fbd6cf4c51de@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 19:44:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] clk: qcom: negcc-nord: use clk_regmap_phy_mux for
 USB3 pipe clock srcs
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260716-b4-nord-pipe-clk-fixes-v1-0-e4f583633356@oss.qualcomm.com>
 <20260716-b4-nord-pipe-clk-fixes-v1-2-e4f583633356@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260716-b4-nord-pipe-clk-fixes-v1-2-e4f583633356@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE4MiBTYWx0ZWRfXxMY2xtR7i+o4
 uqruVWQxL85IrRLMN5BOj8FEGJKOUcnQUHbM/r23Hs2cCDrTm8K9ZxJTtFD4BrkIiyI5faNS623
 moyU2Jg7j6P7Ms/ToF5qozci1x+FlTZFMp4GICViu6VTlN35UjSMy6y0suxTQHVNMY8ZDkvAZnO
 tKOJsMPwC+lHx4cBOf0eYIQn7M/RUit+H0TEOcL4lgHV2+AAu1X+a9ICyVGVt4evPxqhyMxM9oy
 ixlCeycx8CP902czuCtZfnWytypMdjhTbknbN05YwPfyCI8U4stpW9HnHm9gfSHYUyWPmXogPL2
 5aMr1HuJXjhsZxlwQZilbR/9/jVIFlTtBPsmzI9kBmyWthJwrw8vCzeS+zhah2pvSN7EUC/W3OO
 pnv8itudz921H+1A5HSwTLCHXrJXmex1wgbYKP3YHTXj5PQp/Y6v09AblHLis0Tv5Rie9ZaQlio
 HBQSAP8axthQn/sXIdg==
X-Proofpoint-ORIG-GUID: GuUdPJ70JqwMdRQsCGbQG8cpEGp180jB
X-Proofpoint-GUID: GuUdPJ70JqwMdRQsCGbQG8cpEGp180jB
X-Authority-Analysis: v=2.4 cv=VMvtWdPX c=1 sm=1 tr=0 ts=6a59188a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=CyjPzYRc6_wJduQYL60A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE4MiBTYWx0ZWRfX+6wAfuW9Z0ys
 C0sZxZg+ZYiQIjPHxfb9wLus2SwPDgfiio4ki2YMRh9YxCAQZA9HaRPT3OOjOEIuVwFV7IXupLh
 /eNaxnVPhiTvZqIeVcbjx92Z4FThY5Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160182

On 7/16/26 12:59 PM, Taniya Das wrote:
> ne_gcc_usb3_prim_phy_pipe_clk_src and ne_gcc_usb3_sec_phy_pipe_clk_src
> are 2-bit muxes selecting between a PHY-sourced USB3 pipe clock and
> BI_TCXO, implemented with clk_regmap_mux_closest_ops. This requires
> manual parent switching and does not park the mux on the reference
> clock when the clock is disabled.
> 
> Convert both to clk_regmap_phy_mux with clk_regmap_phy_mux_ops, which
> automatically parks the mux on the XO/ref source on disable and
> restores the PHY parent on enable, matching the existing UFS symbol
> clock conversions in this driver.
> 
> Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

