Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793609507;
	b=NbB0yYOpBRPHnPkQOyNfK5Vp3DlgLaUczKUyB8Cg2y0I2v481ErVZnehalku9dANopII
	 PTA9mcFvneCnVOt7i/hvs3wnJUO4GWWC50OjP9UfrSuIAlPCuNFtyvMUF5PuKcgy59otk
	 g5neBbM7EhU2x8RMxHFvCoJkFu1m7Y6Ut/1k4J3rCLaO1+0F0e8QPn+hCM5ib3pIn62zh
	 BMwywVx1SL4Ytjm9IDwQngIc/PAuInrUaoPKcJ4nvUikmcsVcvDl+U3y6RVrt2Hwf9PBm
	 jsndD0zc0vb55aZ9DVE/P2qnMW9+vE3XEzzXOQAwoOGwt5Sv4yaLd12moXmPiURvIhw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793609507;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=JIjn8gtZQqWMr6bT/qxK7khzwhH+bixDnFy9dC9HPV0=;
	b=nPmKKI/Gnm52ut2WENE3NqNThLlT0ffUUmNNW7EPobCyonRGrxz47aMzoqz88SSNCJP/
	 uqQ80BJeGsgktSr68e/dlg6TRTICfB7kIj2yEeEQt3HldY+R5q1Zx0bL2WOw/zw2Y9Up7
	 VAXFB+sMjq3FAK/Eb5LK5X2C02eGSgzq15WS/KZ+LEJNLogajx3YZZPQsUQ3VvP0Vad58
	 cn/O7JMDjuHfE5P12INKHJp9BBIXGmXXjRWmBHjOTE/3oYivrNkMeWb/BhIhpwNcnwKYs
	 dFoGWqEbWK4YknR39fxhFHT12I/NNckzbjdwEHU7UvZOKqyiMzhgH25DD4bSy/CL5Vg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XReDPP9D;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dcCp9OM+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7BF606A327
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 08:51:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF7BF606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XReDPP9D;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dcCp9OM+
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A24CcT81811541
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 08:51:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JIjn8gtZQqWMr6bT/qxK7khzwhH+bixDnFy9dC9HPV0=; b=XReDPP9D99nIrwZ0
	yotNp0bmeTYK7gdFNJbZWdLk6ND9e/WfJeEZ31tdc3XvoRbX8cL7O3X+qQUov+ZB
	yl9Orz/hsy8h1PQBjrQghdjRTQw/9dDaU0goyswbeGLrVN8WWLlD/GJK3N3Fm5ue
	9tPNVj/wGVNYkRfpVKjTkFZ5jSsphgGdqyLDq+gxOJresz5EeS0H03i667kCgyCr
	o+zKPjG4nrn9Ml2Vd7YneU6bGAiQ9UM8dJa7lMzoduhwaCRB/xgEfctglN589pZH
	BdP8acUyhm0Ca5r54pQ47R8hb8s0PbH2aaJ6tiRzvZifvMH/Vi6ehQmcl7KnntGV
	F+x1Pw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rgx74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 08:51:45 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-944101e6367so513919285a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 00:51:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793609505; cv=none;
        d=google.com; s=arc-20260327;
        b=Uv1MjhUiVnLLPQiab4QEv3POsZhdUKWqPn2aGJvNJLZfVEh4bkdZGDPm53SiDfyTB6
         8Cma1S/FnBhh0m8Y2nu+C71GhFxRDc8XZe8QwatbTe/ql/56FbJoOwQOubZImLRm3WLt
         hElQJ3Wn6+Ogxkv8C+dfVN9yolvwdmWRphsvnigcmLIIIhYx0fHagSZzE5MKikHNsL38
         IfRAO2k/IkUVtgFrW+WII/4gqmmkTGREUfkVydwjOLfSDmT1OcH7f/B/fuiqrAXZ0XxV
         lYgJQ8YX7y5Mhl1+cUodMWnGvR2OCYLTPlSpf+NGqfAGz4AXMeSm9qNerJO5eyzRX9aG
         rQiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JIjn8gtZQqWMr6bT/qxK7khzwhH+bixDnFy9dC9HPV0=;
        fh=XISVZD9IA9GPh1vejefO4m3FNaDFJWyBW1O1K3cWWK8=;
        b=VPXFPEFot4b7HGO9ilwtcBERdI8/F6KmexKRRaX15rwz+5+M7fnGlxM3Np3BijUvxV
         KTwMLPMjdQ04bGLuapMs6mBMLMEs8BkBi2jUA/lcOmMvENfZ91lgGpfLCYx5Yo8GUMle
         Nmxqu0ZjY/M5FrGx93kDutoBJYx6wphpGsQyLoEZdEsCuhF2sZz/dKxpGd2UectzGQzz
         8I7F+B7/bBYtSmCiO5jTtIF4OP57RFer+EmLeA/VV66v+hB3m5YBrIT5NNDF//rywsEL
         wN0K2p0BjUsHR54BDI1QsrziAbmFyczQAF6x3c2VzeKb2+Ul3XibTFazZTHfrvXfgWKj
         cc7g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793609505; x=1794214305; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JIjn8gtZQqWMr6bT/qxK7khzwhH+bixDnFy9dC9HPV0=;
        b=dcCp9OM+WqesPeKJPtsCJlDxgF8VmMh5jbak7eRQF+iarusZmVzN09l7P4zckz8YCa
         DfGAXuJ4sflHeN8o/HVvcJHAzTo7gryGlOaZvU7lh1dFTOlXSOldnqYAFxSjY5ElB4k+
         1c96Q4dQBEACQiDjMT3s4D15on6EfMijweyXs0+WnRR2yr8iUTum106CkjmuCUZNW/CD
         koZAmeEQUg1EDC3r9PBFHpEFx6VyZ0NdIOhKIiTGQeK7Hl/1hWRzNRxD5QGb5ztr6/Ex
         MUUdjrxRAnggdK5WDsSz8GPc/lzncFE7U7W7/9ZvW4gr9kQCMt3Fet4VpxC/XclQQXLX
         Nudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793609505; x=1794214305;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JIjn8gtZQqWMr6bT/qxK7khzwhH+bixDnFy9dC9HPV0=;
        b=S6O86s/KOe8VE8Mztxa7xav5DesDivwa75O7eGSkzr2ydJZAEtmVuM9vWZWbjT2VAN
         tffMdjXLAO9WDx+6ZhrgL2wTDg9/RPQaTbKczAXtLAG7jqSFE9GMI0B6jdYoLsvjlWB+
         w2yySRqd03F+4+bDuXHovOemOsS+lZOL17mDU1aMHnpivy3v/V3xsmFAHz5oOzgkLn7E
         X/eYs+rprWTjyjNhnjxhRJ2Nb3kaHU/O++HZ6LsASiSgkibxopdF+ul0huliYGn82FmW
         Dm5E0ADPAEXtpPoMglbxjeIo0R8Ak+YF9Bv2/GmN7jtwlWbu0yRaJ7CrdxxZCviUg0nf
         xLXA==
X-Forwarded-Encrypted: i=1; AKwUvBzdTU3bWVES4uAO6kIF1xHvxHXsie7aZU8baVwiIKPoVTWwajtzML+07U6sulmYUmMeoAke2UiUI4vZ/UJv@vger.kernel.org
X-Gm-Message-State: AFq9FYJdKBCVVYccbZ0M/G4bXYBs6M/O24Hlq6Dbi29kSmEJIXB/Rew8
	nBO/cK47jiklmhPZ5kO/HWMihhStcmFuHVXZpUHU6y6Ybmx2YBXlyUZicU3hBN2DcrZa2b8di7z
	0NHYpbXOa9lIkRYYL/cJj2VPNG1LxcBWT9buTnU+PBfKf1juGzme1cPd07kOulF6IXdW/S6eZkM
	IbyiMkChSjb42BXTItjjJaoBwtA1UNe/IN070coP+nCiE=
X-Gm-Gg: AYBFou1pAYIl5e3C7GoUpcu2RQmGADvE0qNP2VOIPXzy4PSxi7HRZOka81Zg2MI3Nl7
	HrR+rFHKtOw7K3UXEo9Ea5UB5qumctJY9s6glMZa3g1Ugk2O88pCF0dg8beugWenNXkaAeKQt33
	/d+D0ewN+lKz1jbEcbOQ2PHhK7iDYTgzK61QQjTqmmbqlLBkmD4nL824gSs1nktc2bTFFLNvIn4
	fjeEOIJtICdkKHYeSYpNolG2+TGfMax8E65dRBxCxbAsS2Jnjh0bKxWjOz5xn1Qe9F/VAGOSAg=
X-Received: by 2002:a05:620a:2b9b:b0:93e:c12d:4ec7 with SMTP id af79cd13be357-944133f0eb7mr1861959485a.39.1793609504866;
        Mon, 02 Nov 2026 00:51:44 -0800 (PST)
X-Received: by 2002:a05:620a:2b9b:b0:93e:c12d:4ec7 with SMTP id
 af79cd13be357-944133f0eb7mr1861957685a.39.1793609504418; Mon, 02 Nov 2026
 00:51:44 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <tencent_0D164F79882608DC3FB1B70913F736690207@qq.com>
In-Reply-To: <tencent_0D164F79882608DC3FB1B70913F736690207@qq.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 09:51:32 +0100
X-Gm-Features: AclHuK-EJcKoQq8ZTaXsIzEoJvTlXhA2-TZ0zFrIKuJnpNWnR6DDxucUMC3DkOg
Message-ID: <CAFEp6-3KgeKHEFtbyuZRd2PW5uiy=ofWP9z_FnPaqJo4qDL6sQ@mail.gmail.com>
Subject: Re: [PATCH] media: qcom: camss: select GENERIC_PHY_MIPI_DPHY
To: Shuai Liu <847807867@qq.com>
Cc: bryan.odonoghue@linaro.org, vladimir.zapolskiy@linaro.org,
        mchehab@kernel.org, manivannan.sadhasivam@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: ZodE5yjaLWzX0DlzAkp_-Ri66AqauaWa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNSBTYWx0ZWRfXxV8doDWbhRWB
 Ka0eMlqqns1RgEozVKcI5oi1fDXv1xVKclG/WT76QhiU53FoghjBV+7sncgOW9kok+pXJM8ayGD
 oj1QWIGIfN3UX+4yFQztErTliwnF6q8st/Wq34lmoUo0CNMkVJYNlOrXCdC7L2btcFXatEQ+S8p
 PAImwaXChxRXAFRXC6Sdam8VOghH7wvMHnxhFnj9wSdFSkRDgbJSdDYZegfIDZVXGNT/zzLqp/o
 uZW/T+p3x1As7BbyuNKsRrxiX1taOXPsXAbMBgWzcuIFkQ3tJNo25skScLlhWoOOWxVhtpYrQ3r
 uy/JKjiYNKEXW3xvMdOYTGihh5pBpaVlEM5PRtqrjySs7VrOQofUIvDb81xZSnnosfLGaiNXqml
 7ev5hOv41aBj9Fy6jok6+5d2IPRazypZTNRGsCKEmm9xkuRmeD5VaTcoSY+n0YHyu3Jo0lpS2rr
 8E1LG9JHQY+QpimWgig==
X-Proofpoint-GUID: ZodE5yjaLWzX0DlzAkp_-Ri66AqauaWa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNSBTYWx0ZWRfX8EKRyvarkYCR
 9sviuvxAFb8q6tGUEDfNjLge01DJKbxsQvRWIvrW1x9mxV4HrvT0zn5dkYvJp0hiMc4Gv100tmK
 b6wwSY2Wnq2yisOyuqdr/BqlXxYOW1Q=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae84f21 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=dZbOZ2KzAAAA:8 a=LO7QhAU4TRSVvaEUstIA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020035

On Mon, Nov 2, 2026 at 7:58=E2=80=AFAM Shuai Liu <847807867@qq.com> wrote:
>
> Commit 0ee6c8a921b1 ("media: qcom: camss: Add support for PHY API
> devices") added a call to phy_mipi_dphy_get_default_config_for_hsclk()
> in camss-csiphy.c but did not select GENERIC_PHY_MIPI_DPHY, the
> invisible bool gating phy-core-mipi-dphy.c where that helper lives.
>
> With CONFIG_VIDEO_QCOM_CAMSS=3Dy and no other driver pulling in
> GENERIC_PHY_MIPI_DPHY, the build fails at link time:
>
>   camss-csiphy.c:(.text+0x51d): undefined reference to
>   `phy_mipi_dphy_get_default_config_for_hsclk'
>
> Select GENERIC_PHY_MIPI_DPHY, matching the other MIPI D-PHY consumers
> such as rkisp1, mali-c55, cadence-csi2rx and sun6i-mipi-csi2.
>
> Fixes: 0ee6c8a921b1 ("media: qcom: camss: Add support for PHY API devices=
")
> Signed-off-by: Shuai Liu <847807867@qq.com>
> ---
>  drivers/media/platform/qcom/camss/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/platform/qcom/camss/Kconfig b/drivers/media/pl=
atform/qcom/camss/Kconfig
> index b51745c942c9..b18ae4405502 100644
> --- a/drivers/media/platform/qcom/camss/Kconfig
> +++ b/drivers/media/platform/qcom/camss/Kconfig
> @@ -8,4 +8,5 @@ config VIDEO_QCOM_CAMSS
>         select VIDEOBUF2_DMA_SG
>         select V4L2_FWNODE
>         select GENERIC_PHY
> +       select GENERIC_PHY_MIPI_DPHY

So do we still need to select GENERIC_PHY?

>         imply PHY_QCOM_MIPI_CSI2
> --
> 2.43.0
>
