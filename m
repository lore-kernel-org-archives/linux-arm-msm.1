Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6160D39BFF1
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 23:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792021621; cv=none; b=k56VqFfoBwDRRwl3w2i/Y7fk0eG0PsGb64oJ77kUBjx1AJCJ4KzKuVJcLsYzqvu75bCnYtxL4pea4jpwG+0Us/+z71tdPBXeVH5jNx2q/EAiSQydNEXxZbHO+ls/44Erx8BbuWAClP1Ls2v07N/qs8dX9T0mEKaguFvdaq82VhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792021621; c=relaxed/simple;
	bh=VMNpgjn2vngkCQ2fsUTVUd85vdIjXbEJ1pGkDNawlvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Fyuje4+ogYzU1HFHWgF7O3vfJ+W3Kw9Q41zoEVRY0QBq4eRLy6/QGKTY7OCKbmccC6oN/lmdrTl5EL0RZUOCRtMLWFmxtjzfXX7WxE7+zcVIiXYRe9TWoqXF5JLF1Yd4T3ehIKdfKJeJcRGCm9+Dl1te81XBptIvetakjanmgvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aythbRuD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QPyNz2C+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aythbRuD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QPyNz2C+"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EMLkgs500271
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 23:46:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MVSX185AgSrbI09fOTWvij79
	MrTIRjbwy7Bb3zRoM0M=; b=aythbRuDEL9m8f+kyN/1bOuBhBunx6ptFyZh24so
	rRCqeRzuKYYbiLbOs6kD72uXjQwEW3Dqd8DxtEhsF9/XIHWGDqmEN6cm5TznYK2g
	sARAAaLbJKes6c8FwRfRsDtIuTiXypv+LGPMtcI+pVyt3WJIjua3auH2ULzxC/34
	INJiqzMF2kIwQqDCsc94H5C5ndTcm56ptcdxs2lJEs8DioRFpRvva4nThqIKojEp
	j5ay9f4VU6s7nvhnTm55iXzMJq9fJNjfUsmcImMLpMVP0jWQulTTFJW8JwAs9va5
	wFNVnKRjQd2f0zx+ByYY7iEH3VyZsZ3njjPSO0xESp+INg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haagf28bx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 23:46:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93be1861d2dso145656085a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 16:46:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792021618; x=1792626418; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MVSX185AgSrbI09fOTWvij79MrTIRjbwy7Bb3zRoM0M=;
        b=QPyNz2C+vpp2X5y4WgYi9160MFdusc7BlXlEvd7+RC8PkTjI0FtKn6Tl5zVxCgbFZq
         Z8xzu4pTTSKM4l9E53BqF9pt7w+dhdWZDdXC0dZX5Jq2iUcy/zTCMSWe5law8MVbePdk
         NABsqHYrXRxBHGEdMJWNSoHss4mG6s/Ps630n03dwtllFhwKEn8suy+SLntKi2nPZS34
         XmBMG3SpnOpcsJ6kp/da+u5AEw0jeULhYYTieMnzewzYRra7Yn6n68MwgN/s1JpZYn0q
         KltrxJDpzN3BKV6uV/EeZnbMxi8OZhSXrEvhMQIzN/2O5V5FvfWb+x++zR7VG3mbpR99
         W9fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792021618; x=1792626418;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MVSX185AgSrbI09fOTWvij79MrTIRjbwy7Bb3zRoM0M=;
        b=1E1RhnMDWzcfvNqaQjf/LIE7KVr/QyDHznl2GHadNA35RJODBtdnHhpZ9ce/VQpItB
         w1dPmiPjiBDoZOOublQ4HvCdAnkuUfNCm8SNnO4bim74J4JDVLv2kUvU8QZJSxPgfnw1
         UcFuX2S6txk2z7V8kcoG58c1h70GVGg7OrtWVpGsiMUFlfKFxM8N3InGH8TsVzB6avuV
         yZzT9w2DjGBnLSY6tgSx+z6viKm6u4/nfJC9ePlWEm25tRvJ5WO5FutY2XF8/K20zfDL
         Lm5z1GNL7D61fYtwOrIJQuCR7uhYndiIZE5iVU2k20of1RN0M/TsFm+P4xZessXgmqMq
         el0w==
X-Forwarded-Encrypted: i=1; AKwUvBzKfZJspDNxskAGOQuo9Cn9Zvt9aCMpn3N6B5lrLO2n9EZpgBKSexkr9vDErrXGGpckGqdefhHsuMOVYn7C@vger.kernel.org
X-Gm-Message-State: AFq9FYJuoXHg1453cmKyuqIsWI93TlHtgthRxOm4a+3hNzOT1UyTFTr+
	MBZOS1qFJeYhaxH2BMbY0rspah6tqskniFjkHcRudljkfLN08xFVpdu095VUq64s/pnUV7D282H
	AUAGj02wFgMFSSjGLOCuSlK5B6hi4ZE/uTEYjB+j1erm+q9d6AjJrl/n5D099ucIqhdtk
X-Gm-Gg: AYBFou2DU1XQbIiSgLQDukTfYuUs3RrX7hUIbrUdcvHMlSdJmq03T+VsAqyV80eWbju
	KQgDf1NDTVHCPVcHg1WrJDArygRsYlgqCV1CSzj0UVQ8rCTHwNYryBTt9TeM3Jk3kM61+fvY8LI
	86ARoYjUt/zV9j6TTqwfxPCsTFyjf/2eoObkY3ThHoMyI+q1MuMjHyBdOuIg0/00MZw0Wny/L0+
	SUtY8VFbxpZCA1azdZeQdodF9pomSe1dg1c5cLCvsgfuNqWX7mxRts+MYEMNYOpy07gFK3cYvqw
	8zKfY/V98T3HiHaBNPDejCDtI98eo0w77tmXfRInsW55YIGdXCA1zdbAeRr/C3hRTZlOld5WBQh
	bAVCj9mAwqbPZZmVDEQWChLUOmdzsjg+M8shr8w0Hsk9K0MGQxvPXCgmrqEKyO6Ch2e9eSnneBf
	J/3zcIFdY6YIgZ
X-Received: by 2002:a05:620a:2701:b0:93e:d364:c9fc with SMTP id af79cd13be357-93ed364eb53mr2144273285a.5.1792021617513;
        Wed, 14 Oct 2026 16:46:57 -0700 (PDT)
X-Received: by 2002:a05:620a:2701:b0:93e:d364:c9fc with SMTP id af79cd13be357-93ed364eb53mr2144271485a.5.1792021616901;
        Wed, 14 Oct 2026 16:46:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d973f7sm934666e87.70.2026.10.14.16.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 16:46:55 -0700 (PDT)
Date: Thu, 15 Oct 2026 02:46:54 +0300
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
Subject: Re: [PATCH 3/4] arm64: dts: mediatek: Use DP AltMode defines
Message-ID: <woavboapzszyqhm5qrlca3iqrlq33j3ehy4u4mxsib7emre7yx@4mvuaqk72nj3>
References: <20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com>
 <20261014-dp-altmode-dt-defines-v1-3-b657c9b6e4c3@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261014-dp-altmode-dt-defines-v1-3-b657c9b6e4c3@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA5NCBTYWx0ZWRfXyLmYjRIsI51E
 54bEEbu5lChM5uU2BxYh2qIfHfufhuKVoNY5kuLffIqRcIbxHA3F2M66cuZ6VMy6N/feYhQuukj
 gnJPaTvw+Lyh0V6jyv0OhoSQ+8vAsWQd3i975YlkhKDQ7zamt0MLV2tQsjbX4OtaAUGneFGNf7I
 hpzz19kCYC5KX5I+MEqDxtI6FMAl3LWgeKhM9cNgSQEGM4zYcQddvFrc4s8uve+B065vzGtLtd1
 yiePLVkFRMzSFHni/yTF3MAkGXgXeReGliMnrJgJq54qS/fTbRwkK9fjSJcev0vlW/Oo1v8cJFP
 hmS1qfBSA4WHAQ/oYTY9O4uP0H4l7i8aRkr/SrRKvZMNnet39MSZrI7NcgKop9Obf3qC61JGPLF
 pQE2CAdS7kFLhELTcxPidI/0vqH+sBZWDY38vapTIl7hng7zgTCWNEyyZ4E0aQG/DsAyammTjYR
 FcldhYfIK7gVjXznS5Q==
X-Proofpoint-GUID: YVcWQAICtwlxmjMoCH_3BlCjlHYeaIj5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA5NCBTYWx0ZWRfXyaE8g49DD3or
 ZYLRwjaO8PRyvMxDJ9LcRcbewuP5ZEs4RH7P8fMgQa0HR5G6mSuuWOk01zPC9GiWEdMX9rl32E0
 HN2sJLaDDRdnntxjd07Wsur6FnLUoG4=
X-Proofpoint-ORIG-GUID: YVcWQAICtwlxmjMoCH_3BlCjlHYeaIj5
X-Authority-Analysis: v=2.4 cv=V/noQuni c=1 sm=1 tr=0 ts=6ad01472 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=QX4gbG5DAAAA:8
 a=EUspDBNiAAAA:8 a=M1rqeeilqGQJneHCTBQA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140094

On Wed, Oct 14, 2026 at 11:31:51PM +0200, Sebastian Reichel wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Use the new USB-C DP AltMode defines for the SVID and the capabilities
> VDO to make the DTs more readable. This also fixes up mt8390 Genio
> platform incorrectly announcing UFP_D (upwards facing) support. This
> feature is unfortunately not supported by the SoC.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi |  8 ++++++--
>  arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi | 10 ++++++++--
>  2 files changed, 14 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
