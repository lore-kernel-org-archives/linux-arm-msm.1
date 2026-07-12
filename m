Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B0336AB6B
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 18:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783881793; cv=none; b=almAl5SE8PohKmc0EXSmMFbw8CDTmr8UN8jZ0JRTBuNQt2vPuzjKB1tjeHGdb5lDsaWy1QRO9oQCe8bcq1YetCGx7FECM53XX4SOwd0hUh9dI5lTrLNSkx5HjgyCVAs4MkYTCDk1OSFqOY8yIzX1qQ7RS50TgFkd/ekIA8wR9YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783881793; c=relaxed/simple;
	bh=lwIf6p+g0PEohaSasjdIu+YF6ydMcHsoHhPLwqCXWjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GzM/cRFWuNodMt1qSsdq3OOF0UMN3PYSe1VZ19TEMDrbzQwmAe7PJsuSgNYXJLFR1+KMEaRv31VfThZsYdZ70aOIZRayG7bCLt+dGAAC7QHTvPZSqPZED1dFMYAilsEU/NTGxEOfGU+QiTH092NyLyJozZzRBnSbJOZR9RuHL9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BndAxUmz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U/83dxtW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BndAxUmz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U/83dxtW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CGscb43218281
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 18:43:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Dd1HYR9i+2priB7NS9AsVQef
	+C1A76nILFZcby4DIrg=; b=BndAxUmzbmpurBbxKk/tOWqMtzJdcUB5eIexgvPr
	3EnRsSKua6Isf6goDqTE+dOt2GAHZ0R2U1N6SyNFq3QFb1oB47Db34wBMtssCqAb
	n7kCptK4n4ohFmfDFz4zDkaA1RZnyFbOTRZpSQlUeO2Dve6g+hRAI488lcdbUZut
	8xQyi6FezGs4zdXOhL+8FGDQJ7htnPV4smuI/2yBX5CRwwGPkVoaostptBhuyWLe
	yE46iPCCIySDn70qkP+vwQhtV6VdrPT27ciP7b7pNHnu6LDJ2MrzzVIBqUtBxT15
	KKCcYaVFA4sSM8wd2ebaSbyLwKWnq4llhAl96b9JigJJ/A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeafb9jc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 18:43:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5174a23afcbso25272811cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 11:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783881789; x=1784486589; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dd1HYR9i+2priB7NS9AsVQef+C1A76nILFZcby4DIrg=;
        b=U/83dxtW6sX9dp5bZta34rMHQApUrXOfIuL3q+jJxihV0usqDtRUTxOrBBXUXBajSW
         JnDGRkcL8kG/0pJAeFsAylNXcj7+m6JiAD5FoctC8xJBuRZXui2wsN9b/OLkWMBSGUDz
         UGGXZyYHRGwcMCATfCAdgVq19Ulvuc6rQvPNGHUnY0dZv0FpLuIOoHn2KhxSU+Zy4CXK
         o1qP98JAtED0KWtYty98HGXsqXRzl4hK8nrkxVa5Duk6bw4X6LVk5CpSxHifhISIId4m
         /WJeKx3eMUJQCpoVo6ZVkigBTE+2aOkEnOQujc0oNKH8ZsGO2sWpDyjbXn8N/P+MbMHO
         eCAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783881789; x=1784486589;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dd1HYR9i+2priB7NS9AsVQef+C1A76nILFZcby4DIrg=;
        b=tVQ3CYlhiybP05juNq9bHTqBLarsu7aAj7ofw4bfL2Mn9+r5K7TePBYB98OKLWYepN
         onVQ0k6RXHP5hBHDUNV6E9BO7qFlgv6uzGPJ2yt+SDQ+gdhDImXINdQJRHXox0LzPb9p
         Iy0cAIaW3eXeOR25ZDQt0NC9LKc1NOaSBvXZkPYBORw2N0GX11F9jcQcAzL+FoaAO133
         5xOmb3Ihz2VeMu6sHO747P2pT0UvWfhMXC0c7tfodqi9YXI9ZzMkeaD5trh7yM5R135F
         ycksIZJsI67GVfEFJDYSv3WFuao3MjMPRelGSEO0VDYD5q6yb/V+N0U+36ZKkPyGdGs2
         YaCQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpu1SkO2r/zVOxIMHj+2WMjXOkcsPWHde8DaA7F9j9iv0ORT2CBFJnSDWCTSyMzqfZYfQNqz/raaskdBQCU@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9PItssb5X6J2qcFyi+O/biXbyzZROR1qjMR0FXfKZIq1dTfCX
	lVHCC7b0VbYIuJphq07w1s5Dtsm9zgeDOrvpwcljk2P9AHsLTMqoDEHUfts7FXBvyg2yIB3j1/f
	0dEZO+4x7rJEVyr14NMG6apLafqMHbAr6XcadW96+9Njp9PgaqIpxLAQb7fwkjDVY9S+S
X-Gm-Gg: AfdE7cnDbDZ6Bk9IfPmxZFHT4jqkN3ctNi/0HH5zNEdUPOniUSMja//U2a4aIpUi5iq
	svJmVJyBaRwGydlww8uDRyLdV5DD128PqU4twzV1bYTkFsQGlJiSDQ/vmqwfvhtOzapCrtyB1Fu
	NeaZ2fS2jQPD2EruNdVcIhL+4R7vbUbuHwFmWfP0c31owRyGlFdk4tpWoENT2LzmL3UrHQmqK9n
	cbaVpc8fT/QjNSP8Ecg9UzDTyn/ea5Cm9fH9MIJMCXG3c9irWhBRNyc/XvgtrIzdp0SYCnyZyew
	7/1NyK234Z8M8VghxPZ4oW8eAICXrYlIpDYIIfntdy8qQmN/EX0ojwy4Ftk7uwgo/oQST9HBFsW
	PcqQ7ncQuVr6MMC2WFkCRMBHlHVhoyWcvOjvEdY1LuINPsYyzF90wKQrM9LiefnHq1OxNnHFzRG
	Eszs5bHxifGJg5GOcipFckYgBt
X-Received: by 2002:a05:622a:10a:b0:51c:207f:6524 with SMTP id d75a77b69052e-51cbf137976mr69664951cf.37.1783881789519;
        Sun, 12 Jul 2026 11:43:09 -0700 (PDT)
X-Received: by 2002:a05:622a:10a:b0:51c:207f:6524 with SMTP id d75a77b69052e-51cbf137976mr69664741cf.37.1783881789026;
        Sun, 12 Jul 2026 11:43:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca4a2f4sm2239528e87.10.2026.07.12.11.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 11:43:07 -0700 (PDT)
Date: Sun, 12 Jul 2026 21:43:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH RESEND v5 12/25] drm/msm/dp: factor out _helper variants
 of bridge ops accepting a panel
Message-ID: <v3cg3jip6vvjvytnb6de2c2ivcoa6gdbclxto5qgwziyfy5dvu@tt65oy3xz4zh>
References: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
 <20260629-msm-dp-mst-v5-12-2ed6aee1867a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-msm-dp-mst-v5-12-2ed6aee1867a@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: 8sWp2YTrNquJMmoXSnEq7GGID2vEo7LR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDIwMSBTYWx0ZWRfXxtKi2IJXhBZZ
 U5tKvuuX83iUm6X8acfoVUkwgUhOwV8U3nlk74rTqCpH6EkdrVdrCcjAD4B0wvHdiJFeJCkkHka
 jGrJJynTUZ8uSQUdY2/G0PI3d/vJZJhgL6hsPOQbP2y4bbfSm+XddUmwRzE/5e0WZojpM8rT7at
 Vi9mGmLwKwUo6Oy+KaXHhJ2Yuv1vnv2RcBIls92Lfet8K1uB8N9KfGvZLdZL2pn1o3dKRysTnZV
 S3fFkLevov9z8WtjPsuEXJuoeLsI9Pj9iaUgy8Y6kPSHB7J4+Od8nEwamoqfi+XaocXFLrwfaya
 tOpatYxNAKov/nJTWxdpmQj9YHMk8sQ0y6i7wlL726lYbfre1p9mIFmCxx0JGxRUyb0fePVzvQR
 O0f655cGUJZUtwbo5wYLCx+hSDYba3YPitv3CfI4HFt75jS4Jz5kbzdXJe5ETw/NhUfndTRYezr
 6IVBIUNxowcbH0OtvNg==
X-Authority-Analysis: v=2.4 cv=O5MJeh9W c=1 sm=1 tr=0 ts=6a53e03e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=lnGR3UyN__oGQJQYKTQA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 8sWp2YTrNquJMmoXSnEq7GGID2vEo7LR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDIwMSBTYWx0ZWRfXx8pvsPBnTo4r
 fvgQOX6dbLkj3aa/AhX2A1yjl1+Hbaj5N3qge4B/AO3z9GeMg41UuEdxUrSXKysC0diNTLtQGVY
 jbdDOyMoPLKy+gbRLJFTHY77ILcsCrw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120201

On Mon, Jun 29, 2026 at 10:14:33PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> The atomic bridge callbacks (set_mode / enable / disable /
> post_disable) on dp_display currently hard-code dp->panel. For
> DP MST every stream has its own msm_dp_panel that the MST
> encoder owns, so the same enable/disable sequence needs to be
> invokable against an arbitrary panel.
> 
> Introduce *_helper variants that take struct msm_dp_panel * and
> reduce the existing atomic_* callbacks to thin wrappers that
> pass dp->panel. No SST-path behaviour change.
> 
> Also drop the static qualifier from msm_dp_display_prepare_link()
> and msm_dp_display_unprepare() and change them to take
> struct msm_dp * so the upcoming MST encoder code can drive
> link-level prepare/unprepare uniformly through the public API.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 93 +++++++++++++++++++++++++++----------
>  drivers/gpu/drm/msm/dp/dp_display.h | 12 +++++
>  2 files changed, 80 insertions(+), 25 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
