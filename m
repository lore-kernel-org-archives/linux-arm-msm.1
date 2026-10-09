Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1349634E744
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 23:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791587128; cv=none; b=gNUN2U9Oa5IF4U7mGF4WZ3eTnh66+RiAkXHodoVgcwrcDst7n+gV3Z8wyx/d8RWIzFnU0/zRiD0GHcbFT2EYj9SqUYajicIKTPHApiIzDupGYWYtCyh0b1QBEUHTSNKq0wG/D9DVZCrsJkyb9186BkZoYx9wwCuStcNKqFvAyMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791587128; c=relaxed/simple;
	bh=cuml1WRoVPo5CU/+noegueeRxjpqh8+p6J/SZJnA1Js=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DZGAgXkfarRgjKMkQvAlai9rk8ZQuSk6rY71umAEUKd0F573vmV9+fWOCs8EkzW4V3KP9qybIhePr32O8sQftpKftbjsMkNMpGxeNeJaKIGBG5V1N/BHoT/3CIwg85Z0TS7jwY4vheo/MfN1/F0/C1161ur27o30zCBt2cXcN+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A825mXVh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jnDuoouI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A825mXVh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jnDuoouI"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699Khpve3275351
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 23:05:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=92iPLLNWa6TK/xvUvTOqX3t1
	epK+uEt96Kr0e/HgmSs=; b=A825mXVhs+KZwUrOLshBD8MYP9LLoFjL+Yzw3ys6
	dtB5xLCIer94OMkdcIa3QJJKsjuzxMkafDAmzCDvDRkbTxS9ubh0+WCCjENVhJWU
	gDhweaud8dn0TW7ARsHFTOjF1H10S3n3jTDeyn6mJizHguPz8ziI35vTSTE16xOg
	J1kLYlLWQ2UqwOT6DGAcCj/dpzBGVTFWMegWR9qNvf0iSacKFdB9ajhzKC3vue7i
	cqhlKLASmdGk0rFfJRHB0s6OxR+4SqBmih9YfjYEgnPcr/5BfHXvQVuT30kCgc2W
	P0KsLXRh0tcHyEW7qi8QF2Fa9HyrVs76IdBtlsrAeMYaIQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h74t7h27f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 23:05:24 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91b650901a0so6756676d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 16:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791587124; x=1792191924; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=92iPLLNWa6TK/xvUvTOqX3t1epK+uEt96Kr0e/HgmSs=;
        b=jnDuoouIQvmXvA9LrB14GrvwcEsgw7GrhO+ZFcxV1c6EVXdHbYqDilYd+wKqNLu4xI
         w//qxIVgyNY6ABXXhHJYOaicdnSxDQZoaIugIcXuqpLQXvcwNw2B9jM3RcrxLbahDcpX
         ZBL7JWShiL0wIcC5N/F/IdoV3F/GrwBjp3jcq14tABqWEse2B1OF2aa3wazduN85T6V2
         52G0Nurp7JU8q1X+ZyS/2A4up4ey3cok7F5FliKhjAl3LP1EnwIPByP8HxCq0ZoWgIvR
         t+D1ZAOKRI6bg2SzEH6gXainB7CMnW/qKCCM+HttMURFCnGN7Texvmc3S9Tqq3l+enp/
         Z2aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791587124; x=1792191924;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=92iPLLNWa6TK/xvUvTOqX3t1epK+uEt96Kr0e/HgmSs=;
        b=WOL3c/JCXO2jowoAAshnrM0fGEY9K4YthZ8wSDxNqH72EL5C/GRaaWCpvqiwoR0tPy
         kJy0aUSaAcjM7TrrdrtMheOP3dHBIf06bC87kL+aAlPn2A7Q+lLODSuBEhXLhlMdtiLP
         B2+tocs8PvZXZeiE91ZXk/vQjTOEL/izFTwIfb6j4j6qrpUCsvwR90PByVBKWkBhNkZL
         AE9iA3+s4Y0HjancflwR/oCDFwsmQtQ3vczlYwgWVRfghKhmL3L9INf0LVkCbVAh9XZM
         VGiAVmnVk1BeESQh+J8FqLhP4TP5sqw3Iw2GlnhCWAcq08Lt/Qcq1GQtev+A4jsfF6V+
         dcRw==
X-Forwarded-Encrypted: i=1; AKwUvBwnKq1S0dg7n/9OY41zl9tty2f8V6+kE+NoEdhtZtaec+VKynkRzX/HQxKYgrnfqdA2oxczj0Byz9ynB0vA@vger.kernel.org
X-Gm-Message-State: AFq9FYKxJI/hUN2rl1wawTFBuRDvxba/co8As2wIY020vbXk5EkgHPss
	4WJkhN/r7FWG6/OGhtwNGYUDoeLlkY+UDf2XmXIm5rKGt5CyLn82b4na69MsHSwSwKlDMfBM6nC
	uqrM3SOk7DhoOGBgW8jVLr0kQ60amuegZKF0HuVPMJq87KxFjoyryfbyMwrB91wsfLbGdju+Fc1
	WaOTnPow==
X-Gm-Gg: AYBFou2QuDkYp7WwuPUblpGZ3VbLqfukSAkuY/7de+y+5rE+Fc7IG5ilGVyhuPnscOD
	3F7tKn6MN2ooH13PYWs2OLO7q3Nad/5LsicBsdJLAWaJ4s97rxkNjyE16fcYw2zjJMFxAzgw15N
	pplm+ldog+gvxch3PTtWD2sRWYaV00MduVxa/4AfTKBMCKfJiHEm5msuQPwzgmFIsAVD98i8rev
	oNK0lKyo1zN1c+UVK0ZT2Jo9TS3uC63W0HV+PSwe8u0QhjGPkvUdai+/VcurgEY1nxX3+Fp8swC
	1WK5n3OkXPPaxphkm58aEr1S1FNCwP0vJaAOYEsCLrg5n2wf0E/YpJWqxko7bPA3YQSgRETPw2T
	kSDIXBCsjFkt9d7od3mYlX1F81OJyGD/NZbQ8XF/8YVUQAMAzBnNrkWxU0Tj5CQJaAzMuMeyFD3
	jfyMXKFc3i18OM
X-Received: by 2002:a05:620a:46a1:b0:93e:95ce:53b5 with SMTP id af79cd13be357-93ebd28b9b7mr596920785a.52.1791587124267;
        Fri, 09 Oct 2026 16:05:24 -0700 (PDT)
X-Received: by 2002:a05:620a:46a1:b0:93e:95ce:53b5 with SMTP id af79cd13be357-93ebd28b9b7mr596913385a.52.1791587123677;
        Fri, 09 Oct 2026 16:05:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcdde9bae2sm1004191e87.35.2026.10.09.16.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 16:05:21 -0700 (PDT)
Date: Sat, 10 Oct 2026 02:05:18 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: fabricioakio@gmail.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm630: Add interconnect paths to the
 BLSP I2C and SPI controllers
Message-ID: <k4yulw6hzkiw37ju7tp2bdxbh3kxrffkemyfb2zlxeuk6sul24@j6obth36alho>
References: <20261009-sdm630-blsp-paths-v1-1-6a86ba193e8e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-sdm630-blsp-paths-v1-1-6a86ba193e8e@gmail.com>
X-Authority-Analysis: v=2.4 cv=W8atxhWk c=1 sm=1 tr=0 ts=6ac97334 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=OGs46NaP8JcU_4BjHI8A:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: GfGu2F5ouomWj2hHRa7t1ZUXfRUfvi_u
X-Proofpoint-ORIG-GUID: GfGu2F5ouomWj2hHRa7t1ZUXfRUfvi_u
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA5MiBTYWx0ZWRfX3rrrrwQom//w
 P8K1uHAgY7YAUvTVtH9dekvIydUpP/a5TOljH6S/dAXXLPWFQ7ZR4W+XLNRt1WT3gw2RBQec8Uw
 bau3QceG0UxSzypesn4HF707Dbczhc0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA5MiBTYWx0ZWRfXzZnqA5RDoVt9
 D5aVfTvz7XMXIrUKiWZq2BHzMCV0yOZKPrKBWZ2LXmblH3g7LZGZkaqlon2oic9LC7Ef3uEcp/U
 HY3G8EGzG0V4s0SodHei0OdMDqUIiz3NKgn2Pko5XIPYy9TF43zMvqj3NGbyhc+ent9o2pWJR72
 e8qLRkZss4WdBCVT93Pnid5h34M5+W6g1CNsw5Lh/ZdYFl3bIhvq0AkzqI2ZfPmHCS3XKyEk0nP
 vmYKOlsEOToLw4U49rD3yf+fD+8FqJcx+9Q9ggrl64dKqjdhngruiWO2yfpbQCUR0tqouFy57Sg
 Mmxg4o0wa1d4pSYsJsKwiDoaDelhJl9ytcMjMh/FeHfNGqfeOmIeaiMKE1EGF3GxNvRbagmZoi3
 wbhHOROuwjalVAitUftKrcf73W72+deGGUxKWDJuFKjeMX2zRiRy0tjPYgtpBrpPi27tg0hd/Gr
 padd7i9f4NQqiQHTekw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_06,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610090092

On Fri, Oct 09, 2026 at 05:49:30PM -0300, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> The QUP I2C and SPI controllers move their data through the BLSP BAM
> DMA engines, which reach DDR as the aggregation NoC masters BLSP_1 and
> BLSP_2. No path is described for them, so nothing requests bandwidth for
> those masters while a transfer runs.
> 
> Describe the path from each controller's BLSP master to DDR, as the
> vendor kernel votes it. On a Motorola Moto X4 (SDM630), with the
> boot-time interconnect votes released and system-level sleep enabled,
> an I2C transfer running as the SoC entered that sleep hung the SoC
> without these paths; with them, 5,000 transfers ran through about 3,000
> sleep entries.
> 
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---
> Tested on a Motorola Moto X4 (SDM630), whose board file is not in
> mainline yet, on the sdm660-mainline tree. System-level sleep there
> comes from changes not yet posted. The UART nodes get no path: their
> driver requests no bandwidth.
> ---
>  arch/arm64/boot/dts/qcom/sdm630.dtsi | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
