Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB413E7BC7
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 20:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784837316; cv=none; b=T9WiC7WVXs9CiYUWWDkAuFgR/OHR9H5ouH62tz3OHbtntW4QxCH6xS3dDiD5j7VjKusRQWzvNzttdOM1ACCS/2WcIbuq4W/3Xni3yIkC2wS0XPZPGF8t1agy4XZFjR+GU+KDY2VtTP5UMRFMzg0/ln80iY6HtTjSgx7loZL8Omc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784837316; c=relaxed/simple;
	bh=X5IeEyHhqfiU4vax8k/q2znLh+HxOwXq1G3aQlCC6zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s/jaJA4j8ZIyA23FihrbyDewo3059J5kesVcsD7SHdFjo2VgzNkksIgpZ5bkthKSYrwJ8bSMA1khOGy2KHP4OVKdSywLYZJmFJmKjHlx4gb8cPYkZVlVxyLzV2LUXy65WY+5zVvVwcZZWV6nLEYFDiyqwB8Z/2ek6k2ArxlNhCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y34WaI91; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LJOiaIS6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y34WaI91";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LJOiaIS6"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NImC3A224325
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 20:08:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QJWpxrpCTfCoev6TEWx7VCk5
	Z60cqaA3jd7et/AfqGA=; b=Y34WaI91d8baTQmfP2a3vb2ToVONN5O8IYu78dGT
	oJuVSa6Ux8g8StSy3zjpmDUCq4cHADsixaIp4kaFr9ABCRbVxT28C9AY2xeCoWhu
	Ngr8jcc0tcqos+gc7ujoyGll+edsVobbPu+8/xPzRGWqnlg/PmCI/eOZUntGt24c
	CH/iOApr+Yj3Nm4XZOMvEv5dkD1nPpquy8ZtFm1xxCHiDWFYz4iyfZ2IfDTZ5Wqy
	/vgoeEBJTrBRao/cxmmUJiaHUv5WAMnzZb5cWc5dYdfhF/YVK53CTZZvb4Ip6elL
	I3HEr8zhNB/dxj0Wj2xXqRsOUxVXJtgbbOklw3nDz0dpzw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkeuqb5sr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 20:08:31 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c19493ac2so26608881cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 13:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784837310; x=1785442110; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QJWpxrpCTfCoev6TEWx7VCk5Z60cqaA3jd7et/AfqGA=;
        b=LJOiaIS6rFXbPvMQebq128HW+nMoA+0PtHDzf5q5fjLAMhlA7jGHsNtwm83DaI5qw9
         whEYEZSkGmZOGnjUYc0m1V0PHDwCuUpQLmcG+PJpjMa57bjTNl7VV3zCfMMCLDN3ixr2
         5Hj89Fa0BORH7Ir9+OrLOX684S77wHkhe2apHNyF3eGxBudev9EbDiZDqlK6okz9K2k5
         xXKHkbf05+d1BD47wuyVi5BePoHxSfMXeJVBF49VjL236iDoNv4YT+Fva+3Mn3/M9qDO
         I6+YUpKHkGcJ/GH9BmHCDESqgNsvzvgPs65iufKzrwclGXWq/l+iKlupy7z4dNytP1vg
         WEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784837310; x=1785442110;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QJWpxrpCTfCoev6TEWx7VCk5Z60cqaA3jd7et/AfqGA=;
        b=cyrtd62KwZsFXmtMJuz9YZXZ+ltAu8G2TF165y+iL2Qjy4iQk1U+4biYhMAZvojWzf
         HNi7BRhBG7Vtlq9coiIqbR8nJ4nVokgnbUbtVv/3h92R+4iAi4yPfUX1FrdIAD2AiXXu
         KoDmTMMkTsKCFygGS3Knuaz2W32QJt4YXU7wL0KYdjODfD+ATF7g+ulz/ZlgpmGhCiMr
         O38IB/RyF+rw6E82ywNTFkAo/Goy5cGa2mp5tt34uv9g0GRmVnfwINQR2yMyfXsnFraW
         54X1ROHryv+1LF1gfWFAMQ2mSttWITOI6KpWol2gNc5ThMc1QZeLo9n3WXdaYB/o/UOS
         242A==
X-Forwarded-Encrypted: i=1; AHgh+RrAXBSZ57UGVCtdxI/0TjoRRnHlt84JgGjKZV/wPkCm+uLGvTJPSlBm1RvknO0tQ82spFWBLmUWyTeuhI8j@vger.kernel.org
X-Gm-Message-State: AOJu0YygkucZqM5MWlxbbroyZxTh/rFP4D/m1A7R4Tjdwc+SGyOYtjT2
	s3h1tzcqa8wKy4GSYydeUvIkFLBT1h62I+SU1pk3UBssTU/605zER2J9urXdpblmxYDLKJBz6dY
	DwuXO4UTctnJVnwdZbcN3m9CL2m8M/FayRojlxb/gVE4yoFv5Se/Hh9mrfo5uaaYtvtsc
X-Gm-Gg: AR+sD10PduWIoqB0U9LHTllEP+H2e+PuaADsSvhHE3BdP0VAOfFspqLyTqW2roI64Ip
	c9ioYM4or3dSKI/0fSRM1WcsvPnqRqaj9OvFGxFqF4deJTJNNAIloLb4nscKi1hd+eYbme+avbW
	5CuiBogIUexefbajm1ICanYjc6yCrK5FlHFnC828Ua/ixxnvTYIhCK9L9oTIom+B2Bpythwm8L7
	QDOtXswPo8NBSVZaErepnp9v4UgoWYGSug6Z7gc3Os5bPzI6lMiQHmQ5g/jIlJbuLL2fGQMAzNE
	0YzzqzB8ZQImlFoii7LWNcvgOGanXiV41JiZSf0nCCTBXcXPqpUnXmtRAoQjV0noWwSnC+tFpU7
	QXPMGEeHjsN4z58RHHQZACAOB680ZDrjMQja3LikVh5SXJOHBmr4yC750LHLWb0OZM6iZ6U+dXN
	ZiNqp05COPu3sEwg==
X-Received: by 2002:a05:622a:1f98:b0:51c:7b11:41b5 with SMTP id d75a77b69052e-5283dfae386mr45938681cf.81.1784837310225;
        Thu, 23 Jul 2026 13:08:30 -0700 (PDT)
X-Received: by 2002:a05:622a:1f98:b0:51c:7b11:41b5 with SMTP id d75a77b69052e-5283dfae386mr45938151cf.81.1784837309623;
        Thu, 23 Jul 2026 13:08:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9b9a801sm1165095e87.19.2026.07.23.13.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 13:08:27 -0700 (PDT)
Date: Thu, 23 Jul 2026 23:08:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: dts: qcom: glymur: Fix properties of usb_hs
 node
Message-ID: <jczjf34ucekqisjjp2bo7sl6gd47vdk4mv46ueqdiufqzn57zq@dxbbnaxpz526>
References: <20260723-glymur-usb-fixes-v1-0-816357d5319c@oss.qualcomm.com>
 <20260723-glymur-usb-fixes-v1-1-816357d5319c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723-glymur-usb-fixes-v1-1-816357d5319c@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE5NSBTYWx0ZWRfX5rEckec3yd6u
 AuGlPBhTcRRy4ZnxSKVizqFAJYD5LDPRIeK8lkR8LMDPj3H7uWD2IXi3X8cIyidUunnviUeCZ7y
 QyuYapVrwLzUvNA0wCD1bpP1shqn5Zs=
X-Proofpoint-ORIG-GUID: GE_5FAM_YnZhxh1PltL_riJRXIZFM9OJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE5NSBTYWx0ZWRfX59kAdQWyrGjZ
 hhj5+qk94xhrOAR1Cw+Yai/yosnXWbQH0hL4EPVKuG92/RuWmd4YN7AHWfr5F509T74ARiN/2zn
 CglN54CzWalaxRh6s6xYexZeJ1elyGwxOx2jpvo97V3GTUr8UgShGsdPk4SsE47wbSRAiAt3/0W
 5uxiclB1kUdxTWAGLCZT37QePSEEDwA+5AFJw0S+yXxjPprOAXM9J+jcPAN+QytqLASFbwnU+BN
 Xr608jhjkS60ZqkYgqi9Gm13Kihv8SFHPr7AZ2HuBV9rCezXzYC52FobkkvaV5LwmKtdZadtvDi
 xIMlUUYxi+3cRN2hpYVMwyMwY8JC0upwN7pnjQ60kIsMyk1O9XBoqyF0jVbLFNpYVLShEdw74Hx
 CoVIqj0uQ1ExzI58u1Xr44T/aijgQMvsc1aTHuGBNBBT5iJNd+SlfoJ2yZIY3AQUrtQ7exu1Rrs
 iN9TsfNxAbLfzZPIHAw==
X-Authority-Analysis: v=2.4 cv=cPDQdFeN c=1 sm=1 tr=0 ts=6a6274bf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=QLsariRrJL-ENzfB6-EA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: GE_5FAM_YnZhxh1PltL_riJRXIZFM9OJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_06,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230195

On Thu, Jul 23, 2026 at 11:02:25PM +0530, Krishna Kurapati wrote:
> The High-speed only controller is DRD capable. Hence move the dr_mode
> property to platform DTS and mark the controller as role switch capable.
> 
> While at it, since its high-speed only controller, disable pipe clock
> requirement.
> 
> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 2 ++
>  arch/arm64/boot/dts/qcom/glymur.dtsi     | 5 +++--
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
