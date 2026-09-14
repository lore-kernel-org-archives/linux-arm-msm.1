Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CE13BB57
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789344475; cv=none; b=MDy7wAJaQHyZjJXh7HIDZ4pQcBIHPqAsUIJdmpn9hHQuGm5TEQQ57QPWU+Dul8OEbgeWGXD8WB3Z5IYH6HZt8ppZbjIsjk1o6/n1yjptB46RdlxuVGpr3F/IU488taGCnwoh+4z+VCxNrmhV0/xyFQKsXqhwv2auchO5t0tBWE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789344475; c=relaxed/simple;
	bh=lYUuIvyH1wzXCp7GuV4HvE+YLRr/OHaGhwLibLg6PTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dg4a8by2QkaFHZv0M9AXfWFxmw2gb5zno1M4ZhAYyIM/9XpkBSG5EBnbVL0AeUkHic7gXe/bRInLFGiZ/KyfhRJrqHpGp47U7H4Zev9ps4tWJ1oTDFeShJlFbXx4St2DUccFDQSXbCYVfs3NNkuAgwzdkMYsy+wjDYI46CiwtXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WAAbncT5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GV9Rff7o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WAAbncT5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GV9Rff7o"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E062nb4020686
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:07:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J9bwiN3dUdd9aP+bWdeapn0I
	UEMXk3IGQ9B6+59SCMk=; b=WAAbncT5aYE4iVuA26PKrx/TkOqCQuGMD3P8i0SW
	zXs3f58QXjx8entbqCuWonjnQjafY+bXDHP9pYslQlL3RNMAl+Hs6LWAEinbidpA
	Dw1Ga0pyEMbNlFtvj2sIm/GFcmXaQpWG2hHRg1RE0WbBmSNS9i9Q1iuP0Q0XgRic
	B3pTDW+w2to7Tyc4T2c2wzsm5D04r01/whGNtEd4hDEZlqOB4gaUsNBcerHZ+ztC
	7kZt74zdus8/sPk8aEH/yQRp2R1jZaPbC781Cde85xrcvhKGi0eAQ4nyk8vixDhl
	Zx503zZXrH6aayjKmCXUOA/zsDMxfukQuCFWp0H0zYQ6KA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k087ww-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:07:53 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78fbc5a4cf8so3130725137.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 17:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789344472; x=1789949272; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J9bwiN3dUdd9aP+bWdeapn0IUEMXk3IGQ9B6+59SCMk=;
        b=GV9Rff7oeh+hitwggQBJyWTVw9qWe5imBzEBRKZdYcraf9N4X3DzdohmUBeRQrPbFb
         G9EdHMRTbVp1ETRdRCzKnvRActTeDlmnPVXg9AiIDOuE0gEr6A4d4cdm+k5XpKgHNXVN
         lud5001WN5Cra3evWIl3NCX/lVjD+fsvUUN/2MFzcHf+TFMe56KFd37VBqjML6Lmb2bR
         SPEyjKQ200MKDQ1dfXVHCBfcfiLMfBa/go08snYJ4ohjLS8tKphjKQBb6w4c97Uux8/+
         a3gubaakHOhF6Qie97FBeIQFmew752N+Wr39yb+IFL3z7TcxaRWniywEvmMeLWcwykhi
         iSlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789344472; x=1789949272;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J9bwiN3dUdd9aP+bWdeapn0IUEMXk3IGQ9B6+59SCMk=;
        b=sA1lYzc4NwlkG8v2mTawrCOALwfbUamfKod9JM+uTNOP287B9S0vw19WcjpKhdH6yD
         PIulYotcRa2fhyv9R900HPuoq86uuyAHdLpZuGCbe5ILIDObR9jq2+NKvVuZXGEmLwCE
         pkhOMT29s6vxDjciS+BsVgyx6c7Dh0GzKPEZpyksTmXD/P6Hggm0mNzXqM6o/jp0aCr3
         85gkdbJMol0o6+xLxSpGFEoRoSGvt1B8QzhpUbNh65B9RfwU4W/3moYG1xwHceSm2r0J
         ODfEOwrTjOEgz2+FHREJBDAx8axtihUyyqRq66gJi1A9QiBQdbdERmn/1/AlZODMw8zB
         Uxxw==
X-Forwarded-Encrypted: i=1; AKwUvBxA6XIA8DLedgLRx23owGB4pUJSSQ2rbVVuN1eNEVsyy+8z9b2Om4I72UOkelXzAEMv1bIwkJzcrXFzwGXV@vger.kernel.org
X-Gm-Message-State: AFuF++n+dx9IuTsXz7+66OKgXTYitN/1Nptt5PKwp7QOLqapYauKChR/
	csobC9AS/GgkoVPmwFuNWiSiCQOHX3oUxlfG07lNltKeZ142CyLjeLUR0Jzr7vY2l02NikB2lRB
	lvqBqHk9N9HF0+D787qITZjCaqKgXRF2h+eRBpW7gkUgtZrMI0K/WCJ/edLoIo3J7N9XW
X-Gm-Gg: AYBFou2bXR1hcM5iqlSZ2xS9iiGvhEyrRO9vtzy7NeTywSd15KpNSCREKvmLR+DhOOh
	qWDrJpuPQ9ZJkPfM+gWdn8f7A2k5OV6n5eUaVJbhdEAsQcQKINNsCuSmHIE2nTjRgSOKcXuZ1dK
	d6NgJ2+Rhurbv+bM18vt96XclgSAZHNF5CAv8wBV60BABNEJcKD0mfnUV3HvvAAM7Lj3qbSGn+J
	h3JECmqRs6WS/OqODMC4Olc9Hs08rV5c7o0a6U5U/Tib2n+nM9JSVDSupN67XoSUuAeI2RiOfru
	Y6P5ynWNvtq5c0JTvyqWy7/sHq4+3pwOJGO6HffJM2LlLUWNcD/g/ke+uUpoy/Om935Le4vIL1v
	4FcW8ullsSg2UndXQjpN3FuPkkR7XUJr3bjTHi/bX6sPJP+Mg2IsqmcYWrYLHdK5jsKw5UxzOqD
	7LSbJJ2wbs7EPB
X-Received: by 2002:a05:6102:638a:10b0:780:c9c:bfcd with SMTP id ada2fe7eead31-79894637907mr735036137.17.1789344472090;
        Sun, 13 Sep 2026 17:07:52 -0700 (PDT)
X-Received: by 2002:a05:6102:638a:10b0:780:c9c:bfcd with SMTP id ada2fe7eead31-79894637907mr735027137.17.1789344471682;
        Sun, 13 Sep 2026 17:07:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a0461a05sm2019561e87.37.2026.09.13.17.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 17:07:50 -0700 (PDT)
Date: Mon, 14 Sep 2026 03:07:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH 12/17] phy: qcom: edp: Add Nord bias and clock buffer
 enable callback
Message-ID: <4z2wtovf7uzmomgoqkjfgcuu7jg6l5rsojiwtg2f5t4tmdqynd@szbd7qtdb5er>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
 <20260911-nord-drv-dt-v1-12-e25c073cf1b6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911-nord-drv-dt-v1-12-e25c073cf1b6@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDAwMCBTYWx0ZWRfXx8booJ9BbRSy
 v/OptJtCg+QmQamwYiSHAaiSXcJEatmvMwcWBmga7w76qMAtzvIR8Fdgle6TcBrNodvILzzUqtJ
 C7EwK3/QXZL0HknIKhtmLuvkTgs3bTE=
X-Proofpoint-GUID: gcsx4XyHTxR-40-UJ438mm0hnBkJs-fp
X-Proofpoint-ORIG-GUID: gcsx4XyHTxR-40-UJ438mm0hnBkJs-fp
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa73ad9 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=JfrnYn6hAAAA:8
 a=EUspDBNiAAAA:8 a=rJC6BC1qXBLC2pyjZnYA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDAwMCBTYWx0ZWRfX3C2LMULAPQrj
 ozu8CqfKmT+MMxbn1C1X9992X57J0bqCjgaFSPjvvsFeSCsWgncQSmKh26k/yBO0awjm2OdVYUy
 814ior6D0g0U03x7UzLKV0T1G4zn7naA0Ik9CKhiMOUUOH5g5Cyxs06+p7CgQoIR5sSlo7a08jR
 vlx514uyi8A2zOhD5IkG2Y9/QoDJXf5sXRZ+UUFh7kYkd0WxgF+Csp7guP53lNO2qIguZFVqrIV
 9o7un2dOm8q03t5eI7AAb7xC2uQbP0IQayhDP4CS9kMhPtM8u/14jMw+2+Mr/LIhkSgonxDl18f
 80dH38Af45vO42IMoDW2PrJhOXRUKilvsMv3cH0xaWpqlw2qQL4dzbo21MhhoL+atHzxbH5YfFd
 8v/da6usQ84fkRHH2xNiS/8l3yTdqrT+EnRFLtlD1g3GgzF9ac7Mwztu9sgh4rooGdErrZUSvwM
 yYBQS2hmXTo3R9DfYMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_08,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140000

On Fri, Sep 11, 2026 at 09:06:43PM +0530, Nabige Aala wrote:
> From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> 
> Nord requires BIAS_EN_CLKBUFLR_EN to be set to 0x1f to enable the
> internal bias generator and clock buffer, which differs from the value
> used on existing SoCs.  Add qcom_edp_com_bias_en_clkbuflr_nord() per
> HPG Table 2-1-d.
> 
> Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
> Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
> index 6cac4b55b66f..ec4220cffe69 100644
> --- a/drivers/phy/qualcomm/phy-qcom-edp.c
> +++ b/drivers/phy/qualcomm/phy-qcom-edp.c
> @@ -1637,6 +1637,14 @@ static int qcom_edp_phy_com_resetsm_cntrl_nord(const struct qcom_edp *edp)
>  }
>  
>  
> +static int qcom_edp_com_bias_en_clkbuflr_nord(const struct qcom_edp *edp)
> +{
> +	writel(0x1f, edp->pll + DP_QSERDES_V8_COM_BIAS_EN_CLKBUFLR_EN);
> +
> +	return 0;
> +}

qcom_edp_com_bias_en_clkbuflr_v8()?

> +
> +
>  static const struct of_device_id qcom_edp_phy_match_table[] = {
>  	{ .compatible = "qcom,glymur-dp-phy", .data = &glymur_phy_cfg, },
>  	{ .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },
> 
> -- 
> 2.34.1
> 
> 
> -- 
> linux-phy mailing list
> linux-phy@lists.infradead.org
> https://lists.infradead.org/mailman/listinfo/linux-phy

-- 
With best wishes
Dmitry
