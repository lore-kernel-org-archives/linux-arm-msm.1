Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF54947A892
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 13:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788788073; cv=none; b=jLbfTV9/W3tfAX7xXWFHwiLOR6Sm8rxFYIJ6mCOUz8BDsp6mpUDw+TkFehJTGSD1kGAFds+BfmDmtq24/qh3Ggt9yhpKEx9rQYZVbXJefzNqq+F7OMZ1+Vr+fZ+OLtfuuCLvDkUCKHiIwF4l21Q3WkCsCf3e5IRrmQ4mD8P6J+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788788073; c=relaxed/simple;
	bh=oRUD0n8TDjAUwxbhtvsIcjMFzxikBabyo9HhFVuIleo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EjIeNZCwLrUqhNJX3AyikMG/TsUSpdF63lOdUAXQmiDILBi9EUIWfmZ42XNu+Bdetd0dcFJV3aQrIuYVJbcC+BlXvBi9gpwLKjc0tnu4C/ABk4bzzApVX422l5A0NNrpd10iKldYN4gvGmAM4cKyXTf/fzNGICwF4rM9YFno9LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g2iA3b2Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XdN5uCSl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g2iA3b2Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XdN5uCSl"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687Amu4N2652505
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 13:34:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IkfSStE7YmCOzRx8ifIvDbY4
	gsqbXj9bbz6lxb4vGBc=; b=g2iA3b2ZxpC4RsHCVH8Z2cCYug6+/eXJ4dIZ61sH
	LAmpkq0ffkmOEsxf+NVd0Q68p1zYAblZqCLuMrgzpnwRnS3snpiDuj0nv4Gq2LHr
	905vq9B3Lm1yQwbrsqaUgXaYie/2REKTzCjcrL6aMx08JTSOZf3/WMdMSuwM5OtZ
	lJJGEIGJy2rKhu37auef+Uv4WjFXlc9AgWWf4cG1yQwNyxFLRUmRa8uTS7Q+nUh6
	0mW1V2YNRnePtTIRc90avANmvRTWpk3med34z0CcCxHBJDpFV6NEsZxAx245rAk/
	pwDZEdkIEbgHjdxX7KkroC8JMGGdnT7qoF/S6fvLBqNZBQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtty0umv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 13:34:31 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-980c5766c74so38778241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 06:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788788070; x=1789392870; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IkfSStE7YmCOzRx8ifIvDbY4gsqbXj9bbz6lxb4vGBc=;
        b=XdN5uCSlazdBqjKSehBogX8xITx754fgLpOhzndfPjCDOSVEP92a52+kGFqoL4wkHH
         SunNZEycDPtNQ1XvJ2I0UUzQiHs5G0a1hUS8Uv7xroa5obcEnxcJrSLf5zZB3lUnQbTe
         B5DZOSxbHNS1cacAH7+xwsgmBJ3OmObg7s2QcdJdraX+ZTvpudih4St1gvBSWlaW/AFo
         YDPdNw27x1n1Ng/hYrflf7vLU6hYENkPxnDma3PKFfavOGcAM4zkzP57Or9y+4wRXEMC
         QslOpnPNpWNz8Yg55Ox/5k/sUI8A3i95hRuKl2SDQzXP5d1LnBA39qyh97AavJe+M4B8
         dXDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788788070; x=1789392870;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IkfSStE7YmCOzRx8ifIvDbY4gsqbXj9bbz6lxb4vGBc=;
        b=GrAx0qyFvZ8ODPlHWHo9y+RRZywX9MhpQSn2P5sMN8XYe0Zdn4PYdDD1+doJ0qkRiz
         gPXMeZVJGJ+ZcYEEmoXeSEk4y9heYPxEc/QgMMRMOiEGcsMAe43GjLSE4xzYRKv12GTe
         kjqqS5A17WoiABNGv0xKDHWApnvhq6yYNge76ozBzuqgEhYOSS5phTKxDnpTed3nd+y/
         9wadWxAwD60iJPD6RhPHlQX6sxvzLcfag9tH2ukWLOa8Y/Mwuu4OHr+ICExMkOkfYmIc
         6J6L8svZ+cIAamLq55rlodU/gx9VxXWPPNRaNo7menaxq1N/YO5/W+2aPHN7+H4BkoYN
         5YTQ==
X-Forwarded-Encrypted: i=1; AKwUvBwBXVmoVRJkyAOmprFEXl7vcz1lynZGEzTiZMLaT42f7i1ITmMvr27Dijq5FXvZGyF1lNS/MiW0TKjlJTlJ@vger.kernel.org
X-Gm-Message-State: AFuF++mjI4sjA6po3DlBXbTvPny8gRKU4oDnIGWMIv5xj3z4OASBgtoi
	FamHTgY5R+k+toqqMU37XiGO2RFJWCJQhD4Mdv/N0BGiKAYU0oOomMMvSnIgb/or5H0fBwvUY/d
	3JUsZK5Uue76CxQFgdAn4AzxTqrkbbk2noedMY5rSNNidK8qauw6iFoWC/xuBkJzR1bHY
X-Gm-Gg: AYBFou04ZmcFTAPr7/m5o21F99TyRNtvfsZZ8oW6dIdEbCmufnvPwUNPK7nOPBEJy61
	XMoYen+hhQFvbFNZ6X4jgplNNCVeFdv2jLI9nG/pgpDpnnSE/HwiMGc01MPWjjlqhO1s8erjCrb
	Jb9xj8OjpBPz7BtXLVZljP1tvegggEj/Tfv3ijJbYmYUUIb22KEP2bE4E/UajCTw4PqkjNhdq+C
	80UPhUDQIL+Mjt1MDnpHvVCurHxOGlerBSC+fA8dHEGNeXY+KwtLgctx9Kle7xZL0/MXXCKSB37
	7eQbf53owR7DcSfiAne2/dx7wtUjDy9stpkONneVYug33CnjG1NtENCvpWYQf2fjT+I3H/r8kZW
	JvyP8/0dvDMiE
X-Received: by 2002:a05:6102:943:b0:782:de7b:eead with SMTP id ada2fe7eead31-78a4a68089bmr7492054137.1.1788788069863;
        Mon, 07 Sep 2026 06:34:29 -0700 (PDT)
X-Received: by 2002:a05:6102:943:b0:782:de7b:eead with SMTP id ada2fe7eead31-78a4a68089bmr7492035137.1.1788788069225;
        Mon, 07 Sep 2026 06:34:29 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d07a23e85sm193290965e9.5.2026.09.07.06.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:34:28 -0700 (PDT)
Date: Mon, 7 Sep 2026 16:34:26 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: george.moussalem@outlook.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: Re: [PATCH v3 10/10] arm64: dts: qcom: ipq9574: Flatten usb
 controller node
Message-ID: <hyerrktnh36crgapyim654dedsbhlu2k3tz7ff7dn4qybbijrb@tgrhu7mjcpth>
References: <20260906-ipq-flatten-usb-v3-0-13e4e0f63123@outlook.com>
 <20260906-ipq-flatten-usb-v3-10-13e4e0f63123@outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906-ipq-flatten-usb-v3-10-13e4e0f63123@outlook.com>
X-Authority-Analysis: v=2.4 cv=QNBYgALL c=1 sm=1 tr=0 ts=6a9ebd67 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=YHxE36J0psKEVs_6LRoA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: yl1ycOU972ZdXwDUWmH09TqBEogldUn0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE1MCBTYWx0ZWRfXwoRP/gsxUtVf
 mhkGsC/Gt5RYI3aKleHn9pKyns+0FafFgoD+JSphPWEiy3eogTh7wl55dqikvhXynri549PyvBT
 t6owYuk32a3Mcfd5oFps3oBAxZOMkCA=
X-Proofpoint-GUID: yl1ycOU972ZdXwDUWmH09TqBEogldUn0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE1MCBTYWx0ZWRfX3PZXVSQrrPQ0
 FlUKlxRodgzQMcX+FJtmqS56E4LG2T4mX+fV0wuCFXi4huQfZttiiQRusWnumSOUn9WqCE2iROg
 rAX8OEhi/iZ658Rec34DkWX0yHFwJgUVuBzRJSq8cHgJYOlF6vBmvI2xjj3qJOLEYTWTqZrqXGb
 Mu18He0pq0wHOiUwHF+nwl51DzKo0GTF1bSSWDuKw9vX2FnG+Q1ekF5SJvkvXpOICMvoTy8s5ib
 nMtS9F7h5ifoIsI8kEFFYsL8D0sUgoNLqBRVxJLnhNRTdroqGBv/HAUUh56zMOWr5LZwkitxFYG
 UneU5Pl/B9SnakNpdVQH2Mm0j+QcYBNRqX/xa19GChiK45IMjHfhz4ychVOGmhdjI9nfIALQAwu
 JlT8RPwRNVL5ewUj+Le5Ah0ExkPyPBjEsX/Mag6T6NfDSeJKErQ3NyQzRmV5EFZ9Y8fmHiP3GFF
 RutUoK+uhIIUonRb8mA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070150

On 26-09-06 08:46:49, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Flatten usb controller nodes and update to using latest bindings and
> flattened driver approach.
> 
> In addition, swap interrupts for dp_hs_phy_irq and dm_hs_phy_irq as
> per order in updated binding.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
