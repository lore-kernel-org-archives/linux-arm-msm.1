Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD5C43B3FB
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 21:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784669907; cv=none; b=pHGOba0D74QFNy5b4molTzNgVsTL36f0S5MV/PpW22qx0bZZ6pRCNHE+AunxJdlzVQxBPu/cSl2vF+0b7dX3jmlQZYOwJhZYDgZVJv2lFMMaX+8rPRXraZE5o4YTw+r0pDf+QoGAgGSZsv4TKd9VnuMypd2bRdAlD98zRsfiQww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784669907; c=relaxed/simple;
	bh=J2VvpjPnsxjwupAxw1lEeUVhEA4+litNLFzGdsiAvLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CJlngsJPVseVeZbyzBPXJ49nMlGMH3j4mVdN8c/ONmwrLKoQy6RGEHE+eCqsz8hlpnb+a4voompSFLTQPsf/qszH/XS+x1dyke8gYisIbyekpLkYyUuy4wNMI/BMgIx1omRonYGeWkUPVQlc1nHPY8OylFpFN6R/AOZEKAfTKPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZrzEWghZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DUGK6nla; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZrzEWghZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DUGK6nla"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LKlwvq2702005
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 21:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zWNycNElywlrJIOOq7emCvBG
	Re6YJDx7/o3jeiyuC9E=; b=ZrzEWghZ+0i6C7WBJ9EkbnJV8kXMR6L78bqCujIW
	RcbuFOYA0ByGz1YivzqxW95wYH6eDcQg/msN6L0vnElzmtRrwgW21exSRXVAO/UH
	VQ1uG+qVlSS3OT55OroUNwDN91wSvXDkVkuHlurWLegBUPOduFeCQV2sHbzfI2o1
	QkRHyvHIBOtzW0Ofx8YyZ9uPyEdauEc8dKkk1Gvxh+JCnMQ9MCgKq+Ktx+Slm1m7
	k+KZizWIt06cxuNiNWJYmuwGMK5s7gMs9XcYXlsJPZ+0FoiuFnwG/w086Sat78sU
	IvBP0VI33SsoyA1U7x7DfwrkR0vSxffEIzBdv1t5OeIwpw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9aeacch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 21:38:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bfe3fa93bso240466611cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 14:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784669904; x=1785274704; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zWNycNElywlrJIOOq7emCvBGRe6YJDx7/o3jeiyuC9E=;
        b=DUGK6nla03c9RezjHnc2fgx3tjeIckAIBaZG3+ZMvodU3XLaAwLY+0CBojpXwF3RYZ
         0XePTYbRXFW96r9MsbB/c6YAVT3pKUvvmI/cwotBh2TiYZgQDNMq2eexHxdt8jDMdHpt
         az1HiJpi3ooYCjuNEFmRaqB9z/Xb4V6H/CYu+j8W5jWXbwdhbBJqBMbF79C7za1ksgig
         DreBL7NfnApBH6haWHcjnDF7LhY+ZMUoARaN2dAdTf9HTHK8CyDJ7Z1HU2J7IwJ2cD2h
         IqF0wrSRVOKCfJnfrTRJDWIxy8qijucPmG90FGqS3IdgwEzwGq9GRr54QyB1gGkycPE5
         nt5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784669904; x=1785274704;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zWNycNElywlrJIOOq7emCvBGRe6YJDx7/o3jeiyuC9E=;
        b=iJuR2Q86LZrTaHX+jEvRhmzdvPeQssJcMzzWaeVZFn69VgvwYQHFGVnIhhem3x8drZ
         pzyQB9wUpKgtHbflNpEFeEYzrSdl1gQ8kB4VlgBY3cCHCkBAoShn5GiaGzyQKE5bzq57
         76BKVibJdR7gO3Dhpkd6VJkwMdL4xDAIwHRqBHJu6aGfYScDomNbuOr8in8kGLN0/aE0
         K8XyETlGjnn8Kj+ue7rejVRCxtGJ6cXSAi4qvijPAVMW5gJwlMLh4ggNfxjTH4DK6QSY
         ptr2GJSUz8H0Z2t9zsMmnki0bHef5yd6VJGktPOcwZCGWRvYUV4NyFi+ZOpqKWuvEZNE
         fn1A==
X-Forwarded-Encrypted: i=1; AHgh+Rq4iRffbYO98vLLra4AB4uHEMtMBkGa/Ymz8xgV9R4qyzW9k8c/WTx6d8aWtX0WYm32PpFmZZnfP7AOkZO1@vger.kernel.org
X-Gm-Message-State: AOJu0YzG2GnR0dH9uuquod3hCIFBw9AFZ9tj596xwZsrOp/S/BmLDWrr
	3a/+tbcblAr23ARwD2zFxNuhVqwgVQMJA3vb9mLXGdQo5s+iBNWn+tX3GEkGpfhm6Pkszu8FuCK
	CkMbxHumHULlkX53vY08tCSNf7v7OS6zIz4xAJnUIqmSj82XtOeWwoHVNnE5MMaDq73C4jcDuyy
	rR
X-Gm-Gg: AR+sD11H2BIaIcR0RDjKyatC9am6GxIDTgzLjgjZ0iS7/8YscjHmzJMYsa/TQs0BX39
	ptYM2jjw3nVtCKsdy5DE9BpvU0FWCMp29XLbp88zDoe3qQmY3oZuTWU5xw86KIIYOVgQsoKk6T8
	dmMojFAsT29yxUhBdslzf05b6h8ANLK84xOc5i4SpXB63+VZrFn7ZwZNfV83yXTepYyiWjVhPFf
	jOxG+h3XIpFnyWiQb9LZZ5UFdAcN7nTsZuv9M293Ne+6aVUq0/8kCwTvOwR/QGXMoNqDKVzlNea
	VBmcICKRsICWtXdFvmmjnXRcFa1jV+UfxxbLpPR88tJNZMuISMQ/xrcI36rMqgczKt25WS/B7wC
	G7KkQod7CENDrQsSRLENiev8foZNGsxS10udgn9i9N6eV4BHx3RBYpqIz4ArW972Y8FaEBeBf6w
	ARfRPM8LzxZOyIbQ==
X-Received: by 2002:a05:622a:1188:b0:527:8770:8fd6 with SMTP id d75a77b69052e-527877090f3mr22435181cf.35.1784669903833;
        Tue, 21 Jul 2026 14:38:23 -0700 (PDT)
X-Received: by 2002:a05:622a:1188:b0:527:8770:8fd6 with SMTP id d75a77b69052e-527877090f3mr22434941cf.35.1784669903294;
        Tue, 21 Jul 2026 14:38:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6c5e37esm1179921fa.28.2026.07.21.14.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:38:20 -0700 (PDT)
Date: Wed, 22 Jul 2026 00:38:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: Enable USB controllers on
 Shikra CQM platform
Message-ID: <5s5iz4tpyy4ccl47rjhrkqlfbaw6khkhvi6adgjyupbv3c6363@zveeikvov5mm>
References: <20260721-usb-shikra-dt-v4-v4-0-2e7a092d7f27@oss.qualcomm.com>
 <20260721-usb-shikra-dt-v4-v4-3-2e7a092d7f27@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-usb-shikra-dt-v4-v4-3-2e7a092d7f27@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 8-PTUrntQdTeT2YWwtMWtbk5y0jT90Ew
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDIyNCBTYWx0ZWRfX7N4OONDEgzHo
 UKiIRDsFFum67SxRtrno5plJ55qmVsUlziqusanDH3Gb5kFamZ2NLUJwiE9tRkqYJkny/LUvlMe
 jk0l3vfq+0Vbk2heJ3+wzFqD92ncBRA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDIyNCBTYWx0ZWRfXzy8+AjwRpLVl
 CipJL1QNX9M4DIpj/KcA0Y8+njzhUdD5n9KVAp3Bv4kEajGDXY2PDgik7T1AP3PmV+S3gfVKpoD
 ZENEOIIeo0e3mQQ49/dvMebnWLDTNQ3vgWtJrsFEmkRgbUNeXeh3fbkSnwwZg4ZlCcLQzmZCvlc
 R3J9MAz5TYS6p4nNnSH9vpev1qPo+0trh928CoND/7H338JLNJAPkK1rfFVDkjBMawKrlfJTYrA
 4bxISwN8eBm2FZYichG9zqRRBoIib3ksV/fR8/PT4TOnGZTCu3iNSyE/nd7+/9SzFl5hxFyugqt
 bWHKpBJau+8ipn29JTrbXzkaudb4FZQa2pQepGe771Q8TwCqSYR4a3q1YXgCD/QAa+C4mIQgRrL
 LKn4KKZCkvamFmipZUCoGgCE0abKQuyDHf6xnrgj+eC8OMO5dO2WuYrpf0QfSB36i4DblojyIO2
 9NWql/dRdTR05zHDltw==
X-Proofpoint-GUID: 8-PTUrntQdTeT2YWwtMWtbk5y0jT90Ew
X-Authority-Analysis: v=2.4 cv=Cr6PtH4D c=1 sm=1 tr=0 ts=6a5fe6d0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=J2N_nXOhfcilw9lcM9MA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_04,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210224

On Tue, Jul 21, 2026 at 03:23:47PM +0530, Krishna Kurapati wrote:
> Enable both USB controllers in device mode on Shikra CQM platform.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 35 +++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> index 0a52ab9b7a4c..e58b40389ad3 100644
> --- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
> @@ -38,3 +38,38 @@ &sdhc_1 {
>  
>  	status = "okay";
>  };
> +
> +&usb_1 {
> +	dr_mode = "peripheral";

Why?

> +
> +	status = "okay";
> +};
> +

-- 
With best wishes
Dmitry
