Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28454DDB4D
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 23:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792021605; cv=none; b=mrhZTRLrXmkLD5JUWfBn48EaH1ZyAZvHp6tY0MyRdgMUDGott+RcrlVtpvkZoy6gk6aFAN8ZxBAkN9pxu5hCKUSoHtqONRf6YFVV7ji/7JKVcYfmyxrtL+KSSTIQK2NgQVfRZCFsXdp1XaQTbfvs9tLhuQbgpnxA6qlJjVNUONQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792021605; c=relaxed/simple;
	bh=PD4O8NeXrpVFSdk6A1M/yZB7EiBrEVY5GZoYdPfOTBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FTt8+42wu0893cBiTM/GtSY0JkFYN9biiOQrt2eqEteZHZYxNjoDss/93mizj363ggD01hyeS4rxRzTRppmjNkI9DvtyBGDdGPQfAH+cn6uyw2gRA1ii6sREIKhZvh2vzq9bfgMMShkT6pmPFzL3A2jh4jCc4jO6uxqZik5Euyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JxiEO0Cr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L8Qo3Ien; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JxiEO0Cr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L8Qo3Ien"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ENXrY74167046
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 23:46:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iGsSHjvhagPRXiAvKSbTu3/S
	aEhQGd0uTphQRGhmwdI=; b=JxiEO0CryCiXsww03jKFnqlfHqxReTyDdp5kUXLv
	QULPpT3bTqj+lWLIHihri1ovAEzk4GyRNwUyYc/O1WY/L399eRXvkjwpN9Ee8tVu
	nhgkYjZjLiTdRDYUVYMLrSBTFDhmOGT3/Y28aeetbLENcyaTTlVKEuXjH7X/WcEj
	K2IOA8BZL0305lUDw7JTpuHTaDg91pAaoVRygueHQaxER3u2nvoE/fUO4GW53Gss
	j6cJAhqRwH7uSPC6qXxRXstO7FEHXCa34JNB7E20gEeMmSBsyrG7ZttvWpI2iU49
	/nvUSTC4mSVM0y+b4hcbwVhZsv2IkP0fgS2FvCf5K0Xh6Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hac231tqt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 23:46:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb7f9bb86so957207985a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 16:46:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792021603; x=1792626403; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iGsSHjvhagPRXiAvKSbTu3/SaEhQGd0uTphQRGhmwdI=;
        b=L8Qo3IentWa3J7h0S5kyDB7gScSm+sRcrPvMJLHG2OgJyE2R/5lDfqYWzeoIAWYFJG
         K1kbpeOSYdAfUJ0Verj5BY3LQbbREHLdRJW5qHrcFaUAx5nqjkJtlnqZ+2DRn4mYpK5N
         UOnG618yOnVOvYNIZSMwEM7tlqxfXL0NHg4z+QAzkGp9sqv+BGsQ25TS/0iaumUcaZOA
         Md7bDvvguuEWrW7lKslNFiQ1Lo6hLTTn5EfSIBVsm5B6lZCcm/UA7G0nrL65RT8rC7sD
         GSR8h0k6lqjYrArBfmyrWWK3sUunG0FMXBf/TS+qDDWv6NPBZZbS8eJgMAsTInqq5Gty
         hfUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792021603; x=1792626403;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iGsSHjvhagPRXiAvKSbTu3/SaEhQGd0uTphQRGhmwdI=;
        b=ozb4Wi4alLyRJ20H+bG8CceK6KJ93SOjcaiWLFARFdNOj7TreXUy0VMiubRO4QpCrN
         S7pjnPJZsFsHjfjkD6ckNbRZCZFlXU1waVs9EpusHClJtXYTOybcgc5UJNBAamV02FXR
         01rl5UVlnsHwpCnZW1Wcp+ruY2/k3nqXCkkYuwoijDlRnD/D1R/HsaQ+43Z16xDmHpWB
         0OvKfv8jqMFH8ewst81VN5yxWtRDoegEQBPlHonwNojBMLn5iddSQcxKaMhlGSfcY/4k
         frE9Iuv4y5LtTpA+mxy0eg9HO7x4xy1GAakL9eHzrgcu9eflTVUEa+LAM41BtsN13AZv
         hdCw==
X-Forwarded-Encrypted: i=1; AKwUvByh0po/eIHzeEIHmZgdn0tNeprRcwYj2PtscEVAPHtMSsM6fbXX5Bu8ItYQ0RXTjsCXXTZmEzRmUCxjeJpK@vger.kernel.org
X-Gm-Message-State: AFq9FYLYQ4TgczK7Bvj0C4QA3ZG9zhj7GBaikqcr5/Crb5Brq/MEjMrh
	QFB7TdKTRDj2S0kJxsumySNXUb4a8VmSlUBBEzXomLb0Z728G1JDUf/2qW7M4ukxJkhX/OpPb1f
	ww+KnZkMRlxtDAwbjdKOpx1Dmy0f5C6Ex/Kk8EoYAQ+8QdntKhM803R9/FUo6vqYzfZZc
X-Gm-Gg: AYBFou3Cf9+G3OOVhAeTeW3w5kyG7T77F2fsECwvdnbHFxHiHMquVH1HP90XUVBZ2JV
	BNFCdjGs8ZXgUrib5X4Dq4Sr9cJ5Iwo5xlnPi56flC4gI8ownUnqNHq+SvzGvKwiQXz/m77ylOo
	9yciIt006HSAyiyjyLgHcAllNsqy3aSVSPJn0IjYXhnaNTlwFdWO0VVVuCgMxHzUBf9m4zRCESv
	Sxy1GA2w+5VJwaGKHphJvh1l1rYyPsdGUMhQe9jT47oNqrAYPJAcnlE3cc6hyQuDuJ6sn78H8v4
	jo9l9P0UVNUERv+nCKj28gILf38d3K8Oq5e88dJuOp9ac+8uT3Nfs3t3pIayCi+tddCQwaclkED
	eA5Hzu5ex/j5qD4qqQUvEAZ7bHqOrHxZXylzkGEJZp9p72iEWVVuDLEGSQLLTHcV+jR7uHfvC6x
	q2aH0oRCmBI5oF
X-Received: by 2002:a05:620a:2691:b0:93e:a51e:7ffb with SMTP id af79cd13be357-93ebd0bfcd2mr2871711685a.2.1792021602941;
        Wed, 14 Oct 2026 16:46:42 -0700 (PDT)
X-Received: by 2002:a05:620a:2691:b0:93e:a51e:7ffb with SMTP id af79cd13be357-93ebd0bfcd2mr2871707385a.2.1792021602398;
        Wed, 14 Oct 2026 16:46:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d93e00sm939809e87.66.2026.10.14.16.46.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:46:40 -0700 (PDT)
Date: Thu, 15 Oct 2026 02:46:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
Subject: Re: [PATCH 2/4] arm64: dts: rockchip: Use DP AltMode defines
Message-ID: <qgkw2qvqwmchclsdf3k5omanjd7qvm6wyxfjy7bb66w4koarnz@6s5k35dmqvai>
References: <20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com>
 <20261014-dp-altmode-dt-defines-v1-2-b657c9b6e4c3@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-dp-altmode-dt-defines-v1-2-b657c9b6e4c3@collabora.com>
X-Authority-Analysis: v=2.4 cv=PYJqFShd c=1 sm=1 tr=0 ts=6ad01464 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=oov9_tbh0Q946gG9V5gA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA5NCBTYWx0ZWRfX3pmszS5TxHrS
 BPZCgxZau9vBOxj3HgHFlTzlL72HWWUUJeJTg8hB1PLpvVycobcU6x+OUvqpW3I15aCMnzYINUl
 VJpo4rLp3Zt1AwOIbPakYlBCL0m0g5U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA5NCBTYWx0ZWRfX6znW6gSf/PN5
 shV5Bhk7tGSAO9xUdizRJyAxpIeWrmPZrUnpMVP1USO30ui88PG1DMf4zS76hSj5qpBL0R/Zceg
 irm+BuNmhhzYkESKJWwwcG922AEmjL0kXEe0z0aClnzbUkr81ldib2lu8/8oYLiHxsJM1pQ1jia
 ltJpeC3L9h3rqEXHKdX6zvPxr3d2tr7QsXs2PTKXb1l0pBZuY2kA3lrnGagON+cHe1Uhl1/uU5P
 9RQjCxX63uFNOLxVSh41wL2pSiXzrg4UUlrQtEM7KoG1oALxYeJqCzJFHjPBfTdzyNHqsPOvO/s
 sydg3rphNGmvNKWgfHEgH9JIIwuB5XULsvjQXEW13cNwf6MGo/AjdZM9inD42TK+3cOjXauacSW
 drITiVhI75eCcxhuDdYwv8hzrjvJ2Pl1CBmBp0YtY6r5yMe/2e0R9lMZthpP6da7M4bm8vkkmWV
 nQ4M1JfnSaQxFZYCdPQ==
X-Proofpoint-GUID: Sy0exKnwelawYe7pR-MuqOH_tkPKAy-h
X-Proofpoint-ORIG-GUID: Sy0exKnwelawYe7pR-MuqOH_tkPKAy-h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140094

On Wed, Oct 14, 2026 at 11:31:50PM +0200, Sebastian Reichel wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Use the new USB-C DP AltMode defines for the SVID and the capabilities
> VDO to make the DTs more readable. This also fixes up announcing
> 0xffffffff, which is simply wrong as that allows using the port in
> upfacing mode (i.e. the board receiving DisplayPort data, bandwidth
> above HBR3 or pin configurations not handled by USBDP.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts | 8 ++++++--
>  arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts        | 8 ++++++--
>  arch/arm64/boot/dts/rockchip/rk3576-armsom-sige5.dts         | 8 ++++++--
>  arch/arm64/boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi      | 8 ++++++--
>  arch/arm64/boot/dts/rockchip/rk3588s-indiedroid-nova.dts     | 8 ++++++--
>  5 files changed, 30 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
