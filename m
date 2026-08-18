Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C9E82D3EEB
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 01:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787014984; cv=none; b=T/8dP21+uhOhNdztqsafqD3PffbakgDeYM7nu8GgdLS/upNBUgYSmgxIR1+F1PaabU+h3yeNqsj2OmWJ5lT3Xvt9Mt98gr3oWm0wo0ezYKqTJA6dxUH97hKKgwtiFGH5uZiUun0sx5p2ZLLM3XmueMybR9UE9aD8F+mdD/+HQ9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787014984; c=relaxed/simple;
	bh=mfyD1rtsfWwWtpBpzq6/KqrwDENReA0Q9JY7YjYd6lY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fbIfJqnPnbt/u6p3HmMe4k+VrZikX+bq9Re08tjRwoc2SwWX5ojN9tL1d66YrlHt1UdtgFWDor1VcUeuoeiId+C3mOK/HI04iedhZAL8k/V81gnQ+S9RBRK2eUXbhuIhYyWSTmAF8WA89Ph/8iz0La1LLnPZzy7QJvLld/LqUi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fU4p4VXM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jna3Pkya; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fU4p4VXM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jna3Pkya"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HLkiaG3370359
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 01:02:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BRdYqDpXtU3ICy18QUcE/Vec
	i8R0rHUVNRiP/8/gXeY=; b=fU4p4VXMTSHntnmxTUSrPuD0JapwYq7iYCC1pHhM
	gCK4e5+Q9YDsF59ZIySjQ2km+RH0aQr7JAUNaBAzBbXTq0S0z4HzWt/XeiEGP/4Z
	4j8pjuWLap+LBV0/J9KGtfJxdXsyTV65l4TF3e+nH7j9X0EmoNjzSodqKl5mLc/g
	3IGo/9cDbulmoMIfxnA7YU6bIJdCW6YnJEWohVzQ0fB+B5a2XsQC6DCkkC5poYF6
	v3PIVAiJ/I3Qum+dCO+UBIgsL222dPx6ZfpFXoDhfegnsCAkjfKLG4MvxyBQSSCh
	FF6y8sKLJg4CLjG/l7B2pXbji8TmnNsOJqkdzF/cIdCw3w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xykbrxu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 01:02:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9349c5af52bso676226685a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 18:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787014979; x=1787619779; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BRdYqDpXtU3ICy18QUcE/Veci8R0rHUVNRiP/8/gXeY=;
        b=Jna3Pkya7/CecSRuUeO7sy/CLIzp8Xq3SUT+MF8RHJXY3PtnWBjpPx/+8d5kGVNzql
         HH2+cRxNJXLb7zd72qINySrOFZb5cCT4s141NJsENpzS8yrTP9fk9ORKmNT2WV+CHkhr
         C4gIqmo2yj2uNSmirXNij7tDCCz6M9yIXFLtema8u1a8TB2q3kKkAp0psIdfm7Ir2QGc
         1hfszOYITCBaKbSTt9RxuPCVlzRTNCUyIzcBH3ibJuptxJH1iPD4cL5qKmAhFbTE4iT7
         001425igoeGRDLjxiixmRML/MLyBmvvLLFCNZ3JOfZLLlW8CZ671mWjcBVv4WTP3JeLi
         bVCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787014979; x=1787619779;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BRdYqDpXtU3ICy18QUcE/Veci8R0rHUVNRiP/8/gXeY=;
        b=IQI/m3eVoxsgmN+uAfny2eWlYKZJHA1t+vzicy+whXzyu0UwCGgYy/BOMmyzsXS5hh
         pS49CksH0rXOPF+2cpXcdAXMeAC7gkwnuJjvKspOG1kjhxJ4qdLF7Ygz8PAZVjfAPC3d
         t0H7t5Dh2Ofp3UA/7GYl3tBvQjFtFpB+iMolASCCRSNXtAfB93VLJfe7EMAi9wnpjmQa
         3TNk1yniz/Hq6ilPUzXWbrlIOGBDqCpTSl7QLCM56YFZCRpjFMG6Gsmky7lyWtd946Dd
         5oVv43E6QVw6qJM+qNd92CgO6MybHHxv8a5/slTBV4LVyjOwdPuZlZxoqvqJNIkmEvVw
         4hcQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp0l6af7zF0BqHx/9lUgRbzdDjZzncG8+eOqfIzMGzory1Ea4ds8PRK1/LghgguH9fRqQ6EAh9k9YT+3XCK@vger.kernel.org
X-Gm-Message-State: AOJu0YxHEyt21NfCapVGsEb0XbLJ49ssTx+ix6RwJCqqy9walTv3uDfO
	XVROY6L0Mp3ooHnqhWFNtjVIleETC54x4dWFwXF4N81XGNl4Xuqb257b8UZs+kAUXtTleNize3H
	GSK9V9MCvthBjJxT/NAxS343juANjs96z9KALIG8hRNMLHf9nJPdvYr/Iebq0oH84cHTt
X-Gm-Gg: AR+sD11FD8shx8Q5A+4zMjmnq3RuyNxTIu9ADQxt+usMcKEK2yTF9eAaEVOKjI54PBA
	D6ave7vwFcnU8JavbugalEkirILhfz80I+VxxtuTBbz2EULisuUDiSvQs05Tu76mjletwz5tW7d
	I1gsC9QuGjwZNIm3WwhzMdXKDHC76eDfS0v9MsjHAg0G3mNhRCci46kUfK5JpCCyo8360VlPT/X
	fdaAHsvH165wFka+WInt4KA3KPkJix9gt1nEF53WwntOVBuFSSWHXDwFoxVjQj99UeZLjilHKCT
	kQakiJvBoAGedXHDXtVipjeXIxQtun+Qh/fkcb0FZtRNbIWcNS6JWLaMn0Vq2unAgjX1oJy9iNJ
	wpDKPYuBamsGcMAAUxiCEd+1Dhq3K3lEmjVFP0v46WskPRELTHVvoaYTDdoZ+HqWw+U4CYzjfwB
	lKgmla+r5Pnavm
X-Received: by 2002:a05:620a:28d4:b0:922:d336:1990 with SMTP id af79cd13be357-936d2284f21mr2770801585a.18.1787014978723;
        Mon, 17 Aug 2026 18:02:58 -0700 (PDT)
X-Received: by 2002:a05:620a:28d4:b0:922:d336:1990 with SMTP id af79cd13be357-936d2284f21mr2770796485a.18.1787014978281;
        Mon, 17 Aug 2026 18:02:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cf95803sm772558e87.1.2026.08.17.18.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 18:02:57 -0700 (PDT)
Date: Tue, 18 Aug 2026 04:02:54 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Baluta <daniel.baluta@nxp.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        imx@lists.linux.dev, nathan@kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v6 3/4] soc: qcom: ubwc: Fix link error when QCOM_SMEM=n
Message-ID: <fk4na2wxwpgqdpy4atzswkovvf6zzthylhvndrc2qqkegfi272@hnydvrjvms57>
References: <20260817123542.48475-1-daniel.baluta@nxp.com>
 <20260817123542.48475-4-daniel.baluta@nxp.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260817123542.48475-4-daniel.baluta@nxp.com>
X-Proofpoint-GUID: ekwLRUdgU6muFscMyQDTW-S26r2s03p3
X-Proofpoint-ORIG-GUID: ekwLRUdgU6muFscMyQDTW-S26r2s03p3
X-Authority-Analysis: v=2.4 cv=dLaWXuZb c=1 sm=1 tr=0 ts=6a83af43 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=8AirrxEcAAAA:8 a=czfsfouh4VKptltzzNsA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAwNCBTYWx0ZWRfX/NiwqEflrP6d
 mwxqseB0tzkPUMisPhojJpuLZrdcnPeSWmdwA2+zzXIwa5ZGZNtMaQNx1RxYZiXfDQ6kHKiWcb2
 7YkRE0XJKTtb98psWFTg1IqGhrqo+gQ9sx/fjvbzBjP3n1qV6ZJZQiGO2eemZr2AXbf4fmpGzzg
 yz8c615GzAWKbkZDTRSIE2evl/15S9CaK24b1O4Ln5SkY2aLcwiF1ihYamIjFm5KCPTNZNjNNgf
 tqzMJyN1okWxkTTOeHZU6tMvn9ru6bx1W758vCJOlyhSrDQEp5isGQb2wU50cjj0cl5m/ovPMz9
 fzbuAqIkD3E67tq1jJdUBnpJS6ffn1aShD6hCfqS26C/lAdLQTpnol12h0GAdto2vCpiVhAWHqN
 GXN6SsdNAAYaylDw+G3McJsLwsjjOwhWXO02xWtKpkdStOoZdp+i/e4BTFt7CxEjydZHHpE4pkf
 TcokyWDNiHEXk18qTSA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAwNCBTYWx0ZWRfXwupS4wlr1SwF
 B6LoC7dOy9a8XNGus9EZouBe1/epNixo/Uemc6hLrezRRU94onO8P1e5cvsKDsasKymlxuqwIHo
 +6Omw9HRtQSuNZ2w+5+JU+V+3Ugp2ak=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180004

On Mon, Aug 17, 2026 at 03:35:40PM +0300, Daniel Baluta wrote:
> ubwc_config.c calls qcom_smem_is_available() and qcom_smem_dram_get_hbb()
> unconditionally, so QCOM_UBWC_CONFIG=y with QCOM_SMEM=n fails to link:
> 
>   arm-linux-gnueabihf-ld: ubwc_config.c:(.text+0x2c): undefined
>       reference to 'qcom_smem_is_available'
> 
> Add the missing 'depends on QCOM_SMEM'.
> 
> Fixes: 1b445022d1d0 ("soc: qcom: ubwc: Get HBB from SMEM")
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---
>  drivers/soc/qcom/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
