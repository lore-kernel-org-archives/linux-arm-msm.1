Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F36E383326
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789371778; cv=none; b=OTkUEmusyqCfOvbpPRM18Mx0nC/V1vXnllZiHB4o0UG+k7IPtKR5kLiWLlvYQc0Ybb1+WI+fymlNnx0dS+MbAHz6pK07sN/vtktzSTEwVYADQo3FfgneeTFaKrkf9b9UpIkjTlKwKZiukMjiwkV0dgXCcWK4xSYdftjLYLvt80M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789371778; c=relaxed/simple;
	bh=Ecv9oMcZiKcb3r4FxfhtvajqCKkdlzzOKYk0tnl5+1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mib5xXLI/vPmgXBD+jGBPPmmoA9fNocYIVkpTvT8cx6e3rUvs9b9Njw+ZnwaxQQzh0GTlFw5fBV5MoQsPbLAi0e/hn++dGJDNulsxx9RGjECEtyweliuRez473bXbOXWby6x2aHwbWoD9uqMBz9UBoimfjyiuU4mJJnSjdj9MfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fV9IQ1UI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FG0g4nWl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fV9IQ1UI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FG0g4nWl"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ioBB3901205
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=18TzJHUXiw2eZS6Qr/JfqLq6
	QNN2UZmIxsv5CDBSN2o=; b=fV9IQ1UIhJjO0Q7okinpLeytG4qsb85MMS2VgmHK
	EwSUktM7r+DLRKbK5PT5yOrvjQIG/6ipTknSj/ae9FavH8RrjHcCD8dnms1AD6iE
	DOtNGWS/aYsGHD1p4nOMPy35J6LDnxWpuAR/X+rAxpJJ5mu5Za2Gf/PvxXCfGg0G
	v07D+NImqlfF6GsEWlXSsBLa8SVaqYVBObEx3IS6AeTHrneYLcVxqB4MrAokTLGq
	gUN7QSkEGPVzTtYpnx4+Ja4Q3lnugRpDB+AYNkIwBsge1XRZHpzdpvhR9l037m05
	OLCdi0SPo+7fU75N1xuUXSqT0X6+SS6mdYfRn17hF1Or4g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9d5hxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 07:42:56 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a07b5b5efso267054485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 00:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789371776; x=1789976576; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=18TzJHUXiw2eZS6Qr/JfqLq6QNN2UZmIxsv5CDBSN2o=;
        b=FG0g4nWlfE5wbTj9InxYxDiGlZlHhvWDTvKcvp3b5R+4595tnAkcEtoCk/ZfG7bUz/
         n5vIm3BrW76YQhTE0j4HYSMwlYXxZB1+E/A/bvcYt2CVru+eRt8r/Ai3ShDRyLnaS+l5
         9/6cG90ZT3zpfUYqVhAsvfWU1hvhQA0QAMc9B3/3TP6XyI+UBGzBaTvLxNnOVUMOWWHj
         7Cf6w8mZw4IiQzAkwkRU2HHb87cgOLryzrTMp68Iq2l+GCVjk/GPEoSS8sCpeHC0cRuN
         wl7Ab2nSYOcpcX1ydCJ4/OmV6nmmw789gfuCoCsuA1x2ZsiYl9qExr7CexdBQcZGWytD
         1G3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789371776; x=1789976576;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=18TzJHUXiw2eZS6Qr/JfqLq6QNN2UZmIxsv5CDBSN2o=;
        b=mnJN4GA66OeIh9bB/wnxqnI4nvuS9lPNuuq9SCI8oXt22CiHhMXlZVNgLBpYaIEZoU
         GqvHMtTPMpWKrpyHPGCNa5buw4DlcQ7cSwfxAukzhJDDvIhFVBceoSdFIZPvGpwhcrpf
         2xWVS3GIszKKmnIm10XUoDmetFbLH/5+zjq9LQjLeru1BeXqAn/NU5Fdf8TwWWR2t96/
         oSSy/IYfwU1HV2T+GLirB17no2G1Jy4N5F6CYF73o4irDPru2y4TfIFGROlhcBkLsK0B
         VC7bcCtIjt/uk/dpEknl7DTQJ2KjXfaZoWMJV/xvaFLSvMl9+XeDTewG36jUjKUN8qwW
         2DbA==
X-Forwarded-Encrypted: i=1; AKwUvBz79hsuLk0K6HMl4u+mUPq5K8a0i4owAYdvUF6kRaaOABmYybzxfDl+UhpDPBr6IBfpy1Rg0+SWkWUVejWH@vger.kernel.org
X-Gm-Message-State: AFuF++nIzMJkMIzmOfevI50SGIvx/vyvrrSKWN2qTFkrA9PGyZ8QqMC9
	EXvJDvvAa+fRJltzMoNZix+aG9YOLt9uEdKFSDqCrBraap9CskLN0QaXY4t24XzvOGo+R7j9VUV
	1I2rNeXCrBoqrOkDRjKKifYIcO4taQsv3ugFZdvJ1jEIrwJ2V7pUZ27baPjEtDJU5F2a7PCpCN7
	qy
X-Gm-Gg: AYBFou2sA6ulnYoV3ypGNhbApMGkrRC2jnS84f46Pj9Te3tSGHRonIyRY4beTWVmsqd
	vfRcK/GEhotcDYMkc0egiFPw3z8XX72eeZUDz7fibf30VGRVukidv0bzTd5TUA0+e4nfeEJEfU5
	Vu1xSyz6hyPBh84V7RHF9KNPQON+PvN6GDQuhcvjhKROclXCURlOsz9VgNekiTenMRAoDURUezE
	gEOYRX3G7uQVIxxBqwODPJ9HCm3W/fsdPTVBo8QNMiL482Go2SfAnOkW+P8pX2M5jBY/EbZ4Ddu
	TOv+3ADEG/Cq7RImAScePcrgZxfNaTcp6f+Ki5lJs5VEpHyJg30HfZi0EKiosz+g8OV53xO7Kxu
	lSB4w/BbQMvn9cyQ=
X-Received: by 2002:a05:620a:4712:b0:939:72cb:bae1 with SMTP id af79cd13be357-93a1870cae7mr509576285a.24.1789371775605;
        Mon, 14 Sep 2026 00:42:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4712:b0:939:72cb:bae1 with SMTP id af79cd13be357-93a1870cae7mr509573185a.24.1789371775081;
        Mon, 14 Sep 2026 00:42:55 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb36e4a6sm26412847f8f.37.2026.09.14.00.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:42:54 -0700 (PDT)
Date: Mon, 14 Sep 2026 10:42:52 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 27/31] arm64: dts: qcom: sc8280xp: Add domain idle state
 names
Message-ID: <qmgxlw2tj3ngrwgeq46p7oscpfim54da6odddf46peopjzjx43@uqjgob2rawle>
References: <20260914-b4-idle-state-name-v1-0-660c31187819@oss.qualcomm.com>
 <20260914-b4-idle-state-name-v1-27-660c31187819@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-b4-idle-state-name-v1-27-660c31187819@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX8YljpXJBvdk/
 bLDusDpPHv0pqDUyKoxBBum6r4vmzapAXqAkws4piG98gm0SXCP6Q6ExI4R+kz/DHx2OgW7jtfT
 VJnqdX7rjsVaPdrKvYfEej+o6Eo0zFI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwOCBTYWx0ZWRfX8CU4gLLWHiO6
 w5QgMC5swQkLTH2kwZ4Vj9kauoSd1+oQSu+YHEgPU/mFCgERPCxIINxxWkTUvkUp3mCZEtvzuQ+
 1FP6TLlGBEa2pYCIn+b9qySVOc82uEpTDwt0/ACWFb7deYE1kgJ4JPvLTzAfcl5L/9wMEQgL2wF
 /7n78WcXs7aVFI2txogCSWSYyNBBrKWGEBoM7PR+IgA8UQyn5yZNP/pYHkFMleYjNFtvPYAVlHx
 UEn/KXI0P65MGY5r8aresBFbcJJ994vJnlh94wjeXakyRtz/02Dc3FPJFsPZgmO5Av/BKecMDJF
 WC/k4g94vDLy4XvEttbzhjTnSeCaMSV2gFhr6K4aXnYiriB02bFI+PlmJvXHkwINbDoEyEMjlpi
 JmKSGZI8Ef6hDRvghsQ+/IkHCUiPNTp3CicKVG+dOo2IdZCoWZ9gX+ypE4L5CDD4oo7K3gkmGh8
 SC4lSprMqDgzMD0ST6A==
X-Authority-Analysis: v=2.4 cv=IOSXmQvG c=1 sm=1 tr=0 ts=6aa7a580 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=HAnpKfeiUU4SruykqnYA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: UIxgxutciSM931iY3tfA-cEbzE6JcsFZ
X-Proofpoint-GUID: UIxgxutciSM931iY3tfA-cEbzE6JcsFZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140108

On 26-09-14 12:29:59, Maulik Shah wrote:
> Add the idle-state-name property for the domain idle state so low power
> modes are described consistently and its name is printed in pmdomain
> debugfs.
> 
> While at it, update CPU idle state names to match the low power modes
> they describe.
> 
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
