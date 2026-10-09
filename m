Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7763EEAD2
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 08:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791534880; cv=none; b=nWa0QTe+/mT25JtKtu+uuBR+Me5UlBN7UEcDsbh29ucjUALY8Vi6EVO9xpajyzl3PhWTDT3UhihsiNPjJOHxO8qZZ9D9tcsjIJcAHv6Pmxxtf9YnXhdvF/38IAr5c2E1SDtjQQ5LH0G/gu7esY87w162GwvZyTjIspkXhSuhlf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791534880; c=relaxed/simple;
	bh=lAPdSxc4N52ymWesLJxs/NmVMPwU4ZpskHIl4jduCwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YeVB7hOFtCO7VXNWb8mtwaH8u5BqO0mg5Sn7hPenSDWFa7yAUj07WTbWVFiv+XUq+WmiXtL4gX13wZGzbuQ/Pk8bRFursISdJc8v5G7/A1OjL227K3vWkWK77vwrYsyDXe+wKCqYu0fXYFucgS2lTGnEiA5V+wDwsbXZWPF5b00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G3JmpNuR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EYxUVJNK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G3JmpNuR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EYxUVJNK"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KGAi1625936
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 08:34:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pKNoPzYs9svU6eazntWGtkQq
	4hl2TnKUIjurAm47tJA=; b=G3JmpNuRKq8VIslY+OgL6deVdaPG4ukkBvVnmJYO
	ePlZqQOBaIg7OaQgHr0rFOCWAnkM1tiBgsQRfSVqLtLG8mawsSz74HInpJL4Gsj8
	1T5V7KuYgH4ALnWjD3guijJhwqN4yXLN8+AA4keRSG2t6p0g3arVUSKhez0hCWxR
	eRqvCxI5AZwi/ADYQXmEStlVLy4gDiNnZTdSy9KvnhpJXW0V61vpJMF+31zx81xa
	Zarwiwhg0rfx6XsZw5ck4kF+3Qw339Q1kW6jbV3HmDDGDjExPeddDPYHPh6vlc44
	tojO+ISeb+xbMGARcO1zwCYImtm/IC2hEwNtVn9UqiRhug==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fyj2nph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 08:34:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93dea1b6c89so1110404385a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 01:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791534877; x=1792139677; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pKNoPzYs9svU6eazntWGtkQq4hl2TnKUIjurAm47tJA=;
        b=EYxUVJNK+8iqPlUY/Z2Z7W4qGpK1yxQ8QC+fMRjGYsQTEMERitGASUmvb0F5UUKkRo
         4Vik+jmZ59XIdn14gOxRAHB6Jrs55PvBokTctEBs/KM+k4znJVCdB+haOGTkXFSqcKK2
         GUiMo21Xni0ndAEvz/8tpsNDiYWkM8USQk4LzKeURFy7See0RPEdc2RkylR/ZiBwFbuZ
         an7NWqVvJFoXIsD16GYAxkZl9PnCY4m7TIFzChB36KfX34bXkKb/GG9y6qY8IixxJI0f
         LYHfZeqgrPnjR1YKjJvePe1711FnaeMaGsJ6wEtPYiW3o4bE2yx/Eu8kLqI5SoWg0VPL
         Luow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791534877; x=1792139677;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pKNoPzYs9svU6eazntWGtkQq4hl2TnKUIjurAm47tJA=;
        b=pbS0vF4dnH06z7nC5KW+G//RXdfp4ubbn0N8/cvAZMZsAQudP3uGXrSPu0oC41JZXQ
         P+cpTh5u4OBXoDTHMV8OdxpB0jSR3EmZhVG70zHZzqUZM2gSlfVwTQVLX3WYFi6k03kW
         vFXrA/wmH+MjyxgmwfCBLYsOTZtX8AeWQItgBXRKIUT0n/oXzXgKC64rYh2XQtjvjzUx
         GHOm58vYmfEGk05FNWIFmnyrsuDPSS5kTc4hJwLAnZ2qOzxRL85iVrtnHUxKAGA1seca
         nnGpyPW00k4Elm2KYCFR6AXcsKR0VekBU0NcmwXkKCidU/Sl3cCiu+OLYy3KPjKs9qca
         DNbQ==
X-Forwarded-Encrypted: i=1; AKwUvByrSXuMhEQ0fyJfS/dl59KUQLROI+JaeT683Kk5/BG5wG0X70CabpojCynCmkjwS2tmYlYUq9Bc6Ird+IES@vger.kernel.org
X-Gm-Message-State: AFuF++kbopM6Heg2pExJxjDeTWwLhY6/1k8mmGA3uM6oxCU29A3vx6jp
	qLDih9LB7r7hJzTqB2iFdTkR2kXLmLmkX6VsRqNIpyYAptEJOdEaWByQUATptqV/6VZcxFxraIi
	uGdwu7TIs60NQQYsMg15SKOx5ulgxUk+Yalopk6rgXp/oKQgxwEJVByI9uPiT4yZJPsEc
X-Gm-Gg: AYBFou0hTXp9d8R047rCrb2rSBx/mA8+hJ8MxfB6fyVwLu3Y/YRs7pRufSVL/zvsuMg
	tRU0RcPdT16ZJcIq1CzaRtadQzUgFGzQEugH6SuZ6tMUIo+4nBAYHHb3kCvvokrE9tzLEWyzpX/
	/DyU/rRnteUK9kF5GTHwnut2nlC4+/E9qQhdpuLd6hXk3iQGeRnUMAHWFu7p23wXeHrELRFDhTC
	wQLGnFNm7zYd5YemgTk2d9cKGZ0gvuwTxyEV7l1JTngbQWOSUU7wLWiW2fMXlFbnEA4JgaT7FuP
	Y2VpzGdoZl293sPgHdVE2EihSI171s7KJo5jp9YFHAryrg6WCXnPB9jpToKk8WEtPwUQ4nopvZI
	rQsZ3+PYnVYvl6jKHP8yfY1xw0yFo3YmlHBE0IutVNWwTkjIO873Owh1RgWgHzulMwtEOkoxptE
	HfVgr8Fz5UQYJq
X-Received: by 2002:a05:620a:468a:b0:939:57ca:7e08 with SMTP id af79cd13be357-93ebd0e4190mr162079385a.2.1791534877298;
        Fri, 09 Oct 2026 01:34:37 -0700 (PDT)
X-Received: by 2002:a05:620a:468a:b0:939:57ca:7e08 with SMTP id af79cd13be357-93ebd0e4190mr162075985a.2.1791534876796;
        Fri, 09 Oct 2026 01:34:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a9c3befd30sm4730841fa.3.2026.10.09.01.34.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 01:34:35 -0700 (PDT)
Date: Fri, 9 Oct 2026 11:34:33 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: qcom: kaanapali-mtp: Enable USB headset
 and Type-C accessory mode
Message-ID: <ytqzmngqzb2ear5ovqexrzcw63t7plac7hvsbh3ce32krt4mfd@e3yyzs6y5anq>
References: <20261005-kaanapali_dp-v1-0-6faeac3a6d59@oss.qualcomm.com>
 <20261005-kaanapali_dp-v1-4-6faeac3a6d59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261005-kaanapali_dp-v1-4-6faeac3a6d59@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=BfpNQbt2 c=1 sm=1 tr=0 ts=6ac8a71d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=bh13_d1_8jtD0fUh7gcA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: krmO0KJo5_YzseFukNqKhRYlqeR3nWkj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX+xLmUxVnLEUs
 6wmumqyl+T1PHcjnQwetlkhexFCWZdq4RzuIFqOzUFUy2t2gyN/vhMN4suHPlIJZV503Vn7UXt5
 klUU+1jo+n0a2OQQLJ8WdkyT4kWutKR3H9E0MoWL4kYB1vifuwBnYFg1mkUIjlnW4mAj8uFBLaL
 mRPOuC3IOJ5q7zEjdh2Oq+44HHlmo1AMSJ660fRb/G06PGYKLONubyiS85APubpGjYJZOux19U9
 YZoExrJ1IoDp1mzywWn9mQTg7r6F0g1hpQXFP7GHyrZd8AhuXAIdzqijP6J6fap9Sl/NaX4EUT2
 o1YgH/JbtF7dYxVnMU/mAaC9asuCdawzmSW1Q3pb6InBEu9D1Z0+TAvukTZgEDD6vObR54vaD/7
 KPCecA2rJH0Gep9Q3OnbaQW+qTttbxfsEnLMfvm+surmnT18y5bEBZ8nmPcA8bMyXXiM+r3BwhL
 6muuBjDbQKs8ohYtkvA==
X-Proofpoint-GUID: krmO0KJo5_YzseFukNqKhRYlqeR3nWkj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMiBTYWx0ZWRfX9ywmp6L7WqYz
 /rUrJveKK5K8Im9pDXglyOygLNLFCsgo3Yx0YP3AexmFrzKc/cpa2ZLYpzaM2B2IDb86WkBwHGG
 tWBIAAEYKJdlpMKDU0SGQDwB8HbUrXQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090032

On Mon, Oct 05, 2026 at 12:54:29PM +0530, Balaji Kalkonda wrote:
> MTP does not have audio jack connected and relies on USB mux (WCD9395).
> Add necessary nodes for proper audio headset support along with USB
> Type-C accessory mode and orientation.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 51 ++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> @@ -916,6 +926,42 @@ &gpu_zap_shader {
>  	firmware-name = "qcom/kaanapali/gen80200_zap.mbn";
>  };
>  
> +&i2c3 {

No clock-frequency?

> +	status = "okay";
> +
> +	wcd_usbss: typec-mux@e {

-- 
With best wishes
Dmitry
