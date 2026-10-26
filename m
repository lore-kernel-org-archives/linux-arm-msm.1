Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793025282;
	b=NAmDeOUAc5dz3v+UTJI+hUPwim2tCj6SJfGWDWxM9SO8pNa6AlCOTfoGnEnISV/YLNaD
	 9pSC5GCSpLSbW/KJsyW9lV/8CjHlCnLnzKYpFjQeUKZWiYQJdX/LfRQMfWJLxuAsuBjuu
	 U4vu3Z1jV+DMiDcdmW/DeVjllDmkC+DI9lRpLJLT5tQDmHhzLOawYmYPcfsbvtfeT7IjY
	 2mABLkNR0y92gDfBhxB87VeaggmWKKUUX5ypuMG/StnX8/RfOVS2qvQZ90X4a7tbwqQj0
	 ROnnZwzQ3zVEnc30I/oiJQLBQQ3J6jGIQ2F3g2NMjFF+WFYMQMwtReSfBY22gFQaPRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793025282;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pJz0q/j+a/Ss/3BCRCnhr/q+DN+SscbUuCywmDGVV1U=;
	b=5JRttBA4TwZiQyH4DAnLAbnc9XnSxYSPL8tlMtUVNEiPAg7nKi/1dU2SyaXGl0GA0XOk
	 CO+mXO0SG7p6WHBNYLSoJE5GaE0detFPsJ4/6uvywpNdqEDh+jjlMmH9Uc/MjG1mMRhpr
	 WOTuylVQngoM5lboFg4ytcTMDo5irlcK2BGlUI2Ppf5TEKQwv4IQxfUya2YkXE2OubWwj
	 4brpfjdw6bLwGANpcLdDbjPMMsUVd0BV0+hzztQb56heTVtBWDsvtInZB55wk+OejAX9c
	 afArQZIlU3LwAvP7U7xnCdhCjzv0Nz3X2UBHm4h0pd4n6K1ylfE79BaszMWzPJyla3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M6OOEvqt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IIwekA51;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF5F606A31F
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 14:34:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7EF5F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M6OOEvqt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IIwekA51
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAtM1S2541998
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 14:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pJz0q/j+a/Ss/3BCRCnhr/q+DN+SscbUuCywmDGVV1U=; b=M6OOEvqt6/cOKucb
	Q5OZwST7lwdGWa0CSwaN9mN3wvTl4izer2/55/0Yxz5XAKBB5yBCOXNb39Z/7Q0e
	Shrps8jXSHZ+7swMbp5qt6OSKKGfg5x7OErAi+hO33NTjwcmKfBvrA9BWE1NeA3T
	4WfViqkG2Wd1IU2zk9xVpVFVcYuu/waF9Zrij3BRqS9rSqU0cxSG5Pgc/xdyg4iB
	eaflTv65SmyOjzkhMl4SuTkIJVc2Jft3XJFXdyrNnrPmFSoZFAnNgQhg6TqbO89L
	N+196sbu32KAvWsTrDFHvkLRxeARlTe5X6RTiA/ogPIb91kRH93+xhkZe/xp795N
	Uz4tSg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsjdavr0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 14:34:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb71b1443so695788885a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 07:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793025280; x=1793630080; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pJz0q/j+a/Ss/3BCRCnhr/q+DN+SscbUuCywmDGVV1U=;
        b=IIwekA51XcYa1+QvoNklFdWCHCbwv/GmjLj3fpRPChYgpz0DwpQ4YdKACmOc9V8DXJ
         9Qc3d9aW5iPABXEldKyA+D5o3BfdqQYwAiWylv1andKBUN2rS3//ezB4q9V0PAUoAn/e
         0HzVv4A+/qDEOALDJFjRbWKTX+E5aWsOoslOCuiGeAgroReaocpheHHPLcIyOLXHLyKA
         Pwc4yVJ1BPJZ1xAWnE/FK7jB6yAQGiDabuRbtPi1K/WjED1uDvMRmC0p0j2VDZ9BgOLl
         gUADqkr6ylDYXllwRdkLtR3M2UfEa3DMLYoFwgS2upkLtRoYyzwa3xEGmYUro9JTuRyr
         H4Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793025280; x=1793630080;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pJz0q/j+a/Ss/3BCRCnhr/q+DN+SscbUuCywmDGVV1U=;
        b=t9bHQ7SrlB5Jlzbt/wy2DbiVS6lc2zQ0fkr7QMu1oMzW4cOByQ9wdNV0K6xqxw3Ub3
         GRU0GmdcTse4f2ph4j5VY0e+b8cYxuNf4tLT56RwRFvGPdXz7DVptIuPBYal93v5ySWk
         yjA0BJOLCRzxZ45i8S5lgReB3CzODbxlGWAWzDMWYsZ3S1/V+JAyFAfA5YrtTScFBEyU
         qBUMCtP7r+XDkW7yfBG/IN+Puha3EaCC0GhKWAaTszsr1CWu23EPpURqoYo9TH7XfmGf
         BbvLb6LXxZYikMb4HHC2kxILD7XU08jf84t2Qtr1pGztdFwC4x3d1BVCcHYZPu+0D9DD
         qlLA==
X-Forwarded-Encrypted: i=1; AKwUvBxJjMiTWJyPyylomVgP8qgsshhmJEB0ppyNE2aPnEcP4jm2QNMGw5zCwVOn2mHhQZwqsgJui6k539R9Al1u@vger.kernel.org
X-Gm-Message-State: AFq9FYL4Sv6WJHEuWUogK61PktCBWfz1fGpNrFybmp3WhXJSLN0diN6j
	o1BwZ7E3Xu56ASL5bkmxweqUpr7ZtuIKerdcs5DawHn0In905sahKGKk/LuRhIqyojv/PNntQSf
	Xws80+/vSwO2y6z5HaskU+M8TsZmknChIyaCX2nLe7q+yijFLtNBhBTlbU7Q21yQuhGFS
X-Gm-Gg: AYBFou1WDNz2qQkn22ZtT7ELlLBYuevu0VD6ujFTgAKvvxwG8HCG9rsYqLyq6QhLBPT
	Bo+N72p3P6vUAkik2SxlkvhTzMapYcI6D0y8fnIv4MiYdj9uwUeNidJILdH5YOL/UxoyLgIox7l
	qzS61dU5CKmbfz2zzVw3hP0jMFuvGZgCrMNeKPO31nIItIhLpQeQcXf3glm+boQEWZ1/IQfJyOT
	Susuei/9AZvLDL5QKSoeshC9xsnAPL0macuseeKuUDxwvQ/6agOOgPl7UC0zrpVQw5fYDYhPu9i
	4rmfNgecEh5CWHXd1g+su4TknlXPwJvmw6SzCKimRBRNsMuGnM7nVkv4Mt2WvF/Gqc9aoVE+UE+
	mGLnkx2ihiBqbMnNTgB4=
X-Received: by 2002:a05:620a:f06:b0:93f:3978:481a with SMTP id af79cd13be357-940ef90a7a2mr997538885a.51.1793025279563;
        Mon, 26 Oct 2026 07:34:39 -0700 (PDT)
X-Received: by 2002:a05:620a:f06:b0:93f:3978:481a with SMTP id af79cd13be357-940ef90a7a2mr997532885a.51.1793025279058;
        Mon, 26 Oct 2026 07:34:39 -0700 (PDT)
Received: from [10.40.99.45] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b445984207sm3552132a12.22.2026.10.26.07.34.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 07:34:37 -0700 (PDT)
Message-ID: <bbed82ed-97aa-4b12-a8ce-a4f21ed60595@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 15:34:35 +0100
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
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH v11 1/9] media: qcom: camss: Add V4L2 meta format for
 CAMSS ISP parameters
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org
References: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
 <20261023-camss-isp-ope-v11-1-0c2937195298@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20261023-camss-isp-ope-v11-1-0c2937195298@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: a8BnU2-w8BuI2GtT9053GaU7Nb0wc7Fc
X-Proofpoint-GUID: a8BnU2-w8BuI2GtT9053GaU7Nb0wc7Fc
X-Authority-Analysis: v=2.4 cv=a4elZkSF c=1 sm=1 tr=0 ts=6adf6500 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=rrvG0T/C2D967D07Ol03YQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=cfCy20KhcoV1EizUSHcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NyBTYWx0ZWRfXynecvb8Fn0/A
 61CrX7YpRC3HzDmLbOT3RIcv6rBO+Zsmjl1E0yYtNmmD/OZDZtwFg8lP4Str9ekuL13nq6s5UKJ
 AkaJXjlmoHWJ5J5cQ0EZjjqdYxAkDWQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NyBTYWx0ZWRfX/nTrMdMvXPGu
 eMDNOhIX8x4Xyy2XYKOFk88YH8SysTp9EE/Q2JYeELWB1lBV7rI48Ee4pc0CVR4LmFJ85GRAcdK
 abY+MT4eMU/nQcUjCFZmNOkPFsIB55BBL6vP7BrmSvrxk32XZ0GSVhXmlB6aSpBQiZgYv1loGRv
 ukbcmTyRilBz7oAxrlGLGbwo79Pvf5B0eGJnlo9P6bdcKObOY0ehkI9foWNOUJB4WgMPCrOCYB4
 aHETvSfpYPGFyx652fCXa4PjmfcKO2l5qJ1kYSajMVBuZqoFq+1Jj5GjKAHOrZfz2e8DpfoECSR
 JyEn3Xrl0B63v4kkwAnmMxq61pnNvPifukWx66Ifjxx9xc++PUmIeGdG5Eb/cLx7A9SVrBwNsWA
 Mw1yEATEcndWzTFiUNzXSX4KgUuK2+sLRfGj6ehOvDHrxND8LD7cdnlTrKugZc2980OV2ctC2Gn
 lSt0PRIZKU2m420wQvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260057

Hi,

On 23-Oct-26 5:09 PM, Loic Poulain wrote:
> Add a V4L2 meta format code (V4L2_META_FMT_QCOM_ISP_PARAMS) for the
> Qualcomm CAMSS ISP parameter buffer. This format is used by the params
> video node exposed by CAMSS offline ISP drivers (e.g. OPE) to carry
> ISP tuning data such as white balance, color correction and chroma
> enhancement settings.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>

Regards,

Hans


> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c | 1 +
>  include/uapi/linux/videodev2.h       | 3 +++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 17ba1ae707355a134047de646f61fcc2d1512d4c..cef1593c1835070f7b34a8b8c860738fb77f533a 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1471,6 +1471,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
>  	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
>  	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
> +	case V4L2_META_FMT_QCOM_ISP_PARAMS:	descr = "Qualcomm CAMSS ISP Parameters"; break;
>  	case V4L2_META_FMT_RPPX1_PARAMS:	descr = "Dreamchip RPP-X1 ISP Parameters"; break;
>  	case V4L2_META_FMT_RPPX1_STATS:	descr = "Dreamchip RPP-X1 ISP Statistics"; break;
>  	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> index 5373dba640fae3d19247ab1c74ba336e05dc0fe0..70208a9443d8ade569f130e2fc3d6beebab6b636 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -893,6 +893,9 @@ struct v4l2_pix_format {
>  #define V4L2_META_FMT_RPPX1_PARAMS	v4l2_fourcc('D', 'R', '1', 'P') /* Dreamchip RPP-X1 Parameters */
>  #define V4L2_META_FMT_RPPX1_STATS	v4l2_fourcc('D', 'R', '1', 'S') /* Dreamchip RPP-X1 Statistics */
>  
> +/* Vendor specific - used for Qualcomm CAMSS ISP */
> +#define V4L2_META_FMT_QCOM_ISP_PARAMS	v4l2_fourcc('Q', 'C', 'I', 'P') /* Qualcomm CAMSS ISP Parameters */
> +
>  #ifdef __KERNEL__
>  /*
>   * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
> 

