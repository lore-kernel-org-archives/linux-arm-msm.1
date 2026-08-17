Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFDB3BB12D
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 08:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786953603; cv=none; b=vCcuL7Xffwj4QttmQcnv2SCDbhJ+nOhOzawJhtOOfFeDFJ1FpguUtud7cMAoTjAh4OR4NlNip1Kj6E9Fb93qS4x7KZOL3ea2pEGyjzZ1mjzVZOyqUH2HyPi7dfVzKhMI5nh5zYqqhp4+c97jIRblscPXA58AoR6/933jZ2nDwUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786953603; c=relaxed/simple;
	bh=XHIBJBcQtP55405AReUOwIueOCT8KHkIWIKyVLbqOQE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mRnEmKNEbeLHJQB63e7DjeWtYqFtj/6+86KegPsEzqYzq9X1DBicLOYb+3AY2HmACpgmnKSmbjuk0mZ5raJtb1pIur9otKgOsxuYDBNFuskZ4WtpOZt6x1BFPo38Gfs0dqaATas1wO+xc3n6a/K9fNNKo1ILYrN5dn/3bS87uH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcSWGpsQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WH6wubQK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcSWGpsQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WH6wubQK"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H70dVT162803
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 07:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RJVfZfJQbE578S4cccuDs4TJA55EmahYI4yGOX9wd/0=; b=mcSWGpsQeT4o+Sd4
	MsyESGcXgyFMomgS4+W9YtgGJ5qTr8vbaZUdFLt0RVBXh89O19H5mrZRaXt6+xHw
	RR7gZko7vJ8Rj23BlgGUDsAvSsm6YfCsAYpA9Wu08sN4s3Xq8mO4ni60IvRl6ufs
	3R30BzsK/n8zFlDeY2xIpDWAKvSUPauCx25a4sa9U8vdr0y3rMVodTJdyfD+S5Av
	xe/L9INJCyfu0wZH3Hi+0L3JnggZdqUzNACxsafc3biuM46jNzf3efrmMoS1cQ/q
	QwOwH3sDPhmuFE6vucbUwDceIy6Rq+xI0NeFyzAIWianP3TdcAaNHItB0kpv5kw2
	lp1t3g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g2ghk5xnb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 07:59:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c21be5bb4so8993781cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 00:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786953599; x=1787558399; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RJVfZfJQbE578S4cccuDs4TJA55EmahYI4yGOX9wd/0=;
        b=WH6wubQKNlHlkPYyMh0UcUXJoS2fPgpn5GhO/01TkppOgeVD+5def0SDGKiY16wEwl
         szV1x6rwO42GAxNlkMegmx77PyRWRbSU4pdf1AqxqL4UDWrDM0oMMiSac7nYXZaEzSLn
         1jB/XSNkSsxp/aJZPwpNBsDGxAoqKld0+bFZKB9uq7n/RVnbjE0ECSndhraNw9Zo/wAm
         2tucuizCY+0+XEdwLzFDsV9GLKrEr2usDBfzByw/8FLCcLGb/B+tUHJYRSN689xz9MaI
         r4DSc1wbni1J4qHy0DavXdASoflsMKrxH4lSyTQaUiAZYUzVqEGJdfNfxcn9OO6uRQ91
         t0rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786953599; x=1787558399;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RJVfZfJQbE578S4cccuDs4TJA55EmahYI4yGOX9wd/0=;
        b=WzOOjFQmF6faQccfUGKaokYLOzHTmTfZ9L0VY44tSd/fPjqd1gsshUJTn6zhVMMfD5
         0cMjCJXNxBHGCYoTHTKvv0foqfnV7tQdiQ1lIogOBVb3CkIRmiFw+eccb9u7NiorOtiX
         nU+p03JABv+E1i6/i6J+f33bRMLdlexej2T8oQVvZ2gOWwEkaXyKFlB3QPKrH8JE4YVl
         dX/oebA1pOm+j93rrSQDuMELR672UVy8QNT1BpCpenOx70XhBD4qpLXDCjyy1NZ99pfR
         N0wMmIuHwqz+JVwl+EBixm4OCxCaISSrFO4H7nT2PPfysCfp6ScarEDRHvydYsg5b0aX
         S2sA==
X-Forwarded-Encrypted: i=1; AHgh+RrbgE9DilSQ2s4xix/hZVImz5VgvVa6Epdj05obr9HFqox0LomQUbKlrQbW5OBbn/u9sZ5AgkKkrDs5Fjy8@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt/21x++gf9MYTD2afabOa0Dl8yQu3BnXZAsGFna1dWyyLRYiz
	npDasTMAWzqMzSepl9T3QLNswOpwtnQbPK+6FHNSNAQw2fGW/awEm8myUCzQLGbCP5pq3U8MJRI
	XdD1XDz53T9VkB1Z8clzws6bhDH3e31jdPw4+APylTz2hzO3jsXLB93XEhmhpUJ+mQToF
X-Gm-Gg: AR+sD12cu4aBOVqP+bWWY5lh08r9llqHyVsMdS8GHRc2SuUaVnfkNxozPi1Mr/6W1ts
	nYeGDfAprhKr9UbAhRpCwrEti4sqTHBfxeplSmk6TlNhxAIUR0ev85NtjrClxEPp1DhRoAIxqQ/
	Ql0XeUBDmLO2DYy/Zx9Mpj9THvo9elMLYOhYM7HFgiz7oWOU2dbxVB1IWZZph8Bl0Cfq/wk7EsO
	G+UhuGGZ97pY6mKXPBUxJcoR9FvsyV751MYBs/Q47OuAGBRNguKfBO+vG/17cHdVxC/vBIb/+3j
	ZKA7aMhsLo6bWsWVsNbCHS/phrusx86aY1d6loNSTsp9bJB5Oej6nJF6gyTMWMRZlXoQoVYZNGj
	XKSShSZGKdZLt5oBZ5tUkQb3z
X-Received: by 2002:a05:622a:607:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-52d85492841mr170693201cf.4.1786953599220;
        Mon, 17 Aug 2026 00:59:59 -0700 (PDT)
X-Received: by 2002:a05:622a:607:b0:51b:eab3:4ef1 with SMTP id d75a77b69052e-52d85492841mr170693031cf.4.1786953598810;
        Mon, 17 Aug 2026 00:59:58 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d8530d3bsm321083a12.10.2026.08.17.00.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 00:59:58 -0700 (PDT)
Message-ID: <83d95b4e-0dda-4b9b-b3d4-843c0d1f4a21@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 09:59:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: ubwc: Fix missing include
To: Daniel Baluta <daniel.baluta@nxp.com>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: robin.clark@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260812132621.679515-1-daniel.baluta@nxp.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260812132621.679515-1-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA1OCBTYWx0ZWRfXxC7N5LzOEVWd
 YvriwmK8xh+1rpdraaU68K4tJD6XtY7OzFabZv5h3K0oTLgFx5bP8jDIztRJzr56WwWSQP/JaeV
 qVDduVvo1j4cwujRlvg29fJGWNaMrVc=
X-Proofpoint-GUID: URQCT_fVVH2dP1a7JZYzLtNc6s4QyvwB
X-Authority-Analysis: v=2.4 cv=f+14wuyM c=1 sm=1 tr=0 ts=6a82bf7f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=xo27-gyItSoTN-3JJZYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA1OCBTYWx0ZWRfX8ZPsHBEeEAkk
 Dfl6jjaPrkCkKlGENsflrrQkO1FUGFQrQ+Fx4pEWul0Ldzrc0pD25Efq8F+23vMmehvdIJCgodH
 DuoNjrTDwlD/CxhVbVsTwq/1Uv+mKbcWP9U7cfUnLo8J9zq1Ih9Md0ubVODDgb1OhbD2+zn0gWu
 Nvz3hcFioqgWFpNETojU5La7zqGwnZfYbB5bOj8wUhrqoCS7RZCcfYIdEteC+4VEdgHmuGzUK9h
 +AzjXdQeNpACT0wu/TS7m3AUXf0UUjiSNdA3zZ46ktfS7xqbM9H2R5/D9Y75ouHaDK0tVHGaViI
 WCMVh9RkOZxSPmjtr4tMWd8sMhwGArYAblletexhP52yREvmJ9bgYHDFsm/SUTBTbPOBxPXwmMd
 5fCMOOHzj5vOY4qyFxnlR7xj2mHanJmJ6RaE0/IaRiyV3SVn9XhRr6MH0ny4IUapANh9h/u9htW
 babZUzZqBwwkdrk9I2Q==
X-Proofpoint-ORIG-GUID: URQCT_fVVH2dP1a7JZYzLtNc6s4QyvwB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170058

On 8/12/26 3:26 PM, Daniel Baluta wrote:
> When CONFIG_QCOM_UBWC_CONFIG=n, compiler needs to know the definition
> of ERR_PTR otherwise there will be a compilation error:
> 
> In file included from drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c:7:
> ./include/linux/soc/qcom/ubwc.h: In function ‘qcom_ubwc_config_get_data’:
> ./include/linux/soc/qcom/ubwc.h:45:16: error: implicit declaration of
> function ‘ERR_PTR’ [-Wimplicit-function-declaration]
> 
> Fix this by including <linux/err.h>
> 
> Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
