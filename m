Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7057052B1E6
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687456; cv=none; b=reCtsXB4YP0pwVREGgAZ0965J2wX/aCFIvRryPW8RFTIPqRLCeggs6nkXd0bd2uZVKFHR/716o9LEAjwlyJsIY1FRIr2uxPj+b4nXiRCboEquNx12MSGC065jTs9fK6naAAa9/usiUw1VNwYPo7FZEtoNNgzuykqth2Ew4QKI0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687456; c=relaxed/simple;
	bh=3IiIfXJtyk2FPxWnJXKW0rHvOYkXxJjw/G0mKQz+Aes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rqLp/S+NVDJ1K001XKTsbRzI0bNFmvSwyRddHexp1x/bCgFsRVB0tEY8vtJHmG948YVwGp4/Fbvv+CyN3XEVzvBKUTD7m5tYzGDoXqekvzT6kTfiQ25TnC3WvGbrj8KXlM0ZZYi262FSxkonpH6RCtMqDDFyhWFgu5ELvHpdeJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B38cCOiJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KfBWkHbW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B38cCOiJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KfBWkHbW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqfch611547
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iAn4rx9XwpXXw1tzM/gvOYMp
	G2xmnXsxaLSpoR4YmIg=; b=B38cCOiJbHoUVgfoImjmRex/4zvUdgGwPgkHhJHP
	3UKmxcUBffotjpZtO6ZH+tzoIJfhuX/VuCpp5desXYrUCH8Sf8pfLVit+ddQyJad
	acqYdqGe5dOiyWVDnMicCzj1rSLNyx4WzboKn2UrcQTuZUZYKtH7uyJ30XTbZmst
	HMFq78T4ax0uP2orzRO1ygexHC+kSpeYWyXcgO9BmXKVt/13REjvZlnOkQTebIOx
	BE0YmR2c7rZ6Z9LxSCXUVTPFUEUcqGNdq/+Sm8SMyAgmuAhpknCAjmctcoMc8zzx
	1uiO6UpdsiFAvmq9+1Pl7hGY5p849BFBh4TzLCFgQ1jk3Q==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h00s4u6tw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:10:53 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7b497a7878cso374773137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 06:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687452; x=1791292252; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iAn4rx9XwpXXw1tzM/gvOYMpG2xmnXsxaLSpoR4YmIg=;
        b=KfBWkHbWsyXhNidRfDmF3SZuV16MilVnPJwP4dN7qlfWl9mtEpIQeIFev0cE9zrTbz
         To8byYPp/Y7pyj4N/m0uOpXrurJQ/d3BkDz16JsjHMOiCLtPDWTo/6JvGcf4WwU9Asgj
         5/F2L9e75Bw8zg7cnwejBnI62tkWoWuhT6fS5htsIbBi6G9Y1T9ul+sBLs0UjBTacwrN
         d9HMt+M3ZMBN91wazqyjOP7MAWMXHUqZ36+3EH7GGWvg9HbHmWXROwdMfTUQqnBR23yR
         nKPQQU6vEOu3MzWqVD5gQNLm99jBE2iHcEtDwY3QJFGMchGq7LMZ3p45pxPg2HaF9vIg
         7W3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687452; x=1791292252;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iAn4rx9XwpXXw1tzM/gvOYMpG2xmnXsxaLSpoR4YmIg=;
        b=nuXKN7lTx9WJCxshME7yDYE0hBUXKPQpz3IQalmOqKX/GbUBBch/tDC9uRjxIRem4J
         np8Pursu/7GpPSc7qJp3JkmVcvoN5FRdxM02L8ue/CSsvvrGCjNhFcceqrZ3BwKpVlwd
         hv96AzGJfDIsz2n/SZIwXgw2jf6QL6ajs9pDOnJRoVbJvnIHZxMQ2cafOKSjhL4+qedI
         nkyiFloktIHcB6OEuuwp4q2ElSSFGMT3h5F2+F6vxP4mWkus+UZvzzSLaA5JJ6wMkEbe
         KjPMbHM4opA2fNEghHptFiyg1erUlpSXjB85bBn5FBYWok5kaElg8chLoEZyfL6bYIWT
         TFIA==
X-Forwarded-Encrypted: i=1; AKwUvBxzCEBp/xtKE56YIETQlj2TNj4lQXeCHgrcyLxW9Hdn+A2C90Vek+u+l9VKk4LcN4CJY4RZ0JSG0Fm2bZFl@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7BOGi0YRQV3shkvtJVIrCQR+peJ6ra53FSBAf7/AusPuuygSn
	WpOMFfgXuXSED1psOjOdiuTCDcekX3pE37Bq5rnTtVR0TEupCQncPYdYQUIePRYP8w+1YKNDBmF
	PFyNGg7gA+UfM6IscMt+2F/vFpMbMnfUv2TJ1VH17XiPpmjsqZQMnNeNqGx6LHC6JMnWJ
X-Gm-Gg: AYBFou1eonBA6ZSMol9l+us0WDAgRXOHOmMiT9XqPHTEi+XMrbcyL3aAxj/a7VGmXa3
	g713iXn3TvaGvqj3KBto5eaqeWFOgCYb7EJ3Vwcex1EzwMIdVLX3+RnOQVGWyFSelB6dKixHO26
	YHhxjCw5a8xD6d9NkIo3IdDVBCXVYRKA4jpyhPNoDafOj8f/F1zn0fPBh6AzHy648vabc1JuyrE
	DB2+ZARJ+RUuM5KVuT395I53e6h9OcAp/O6roqZE6A6DVnjx2UGHG3TsTmLKDlnKCf4SzVJ1wim
	ll6Q/MmTCv3aXB36SB0xXWcLlQqu798XgRZ7DiFk7ypYKLj4Lj90vTprrtmwZgIEgj1iHnAHiFm
	cHjH+Sa057+ek9Es=
X-Received: by 2002:a05:6102:a47:b0:7a5:4fe2:b380 with SMTP id ada2fe7eead31-7af1eff6903mr5006503137.26.1790687452105;
        Tue, 29 Sep 2026 06:10:52 -0700 (PDT)
X-Received: by 2002:a05:6102:a47:b0:7a5:4fe2:b380 with SMTP id ada2fe7eead31-7af1eff6903mr5006495137.26.1790687451535;
        Tue, 29 Sep 2026 06:10:51 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013c6f760sm3102825e9.0.2026.09.29.06.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:10:50 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:10:48 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>
Subject: Re: [PATCH v2] arm64: dts: qcom: shikra-iqs-som: Correct PM8150 L10
 voltage range
Message-ID: <vqnl4ofgxtxzulzr6xxbgb753vkcgyjwjgj5x5fra22o3zox4x@w3ehixdlzv3j>
References: <20260929-fix_l10_max-v2-1-2fccd87115e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-fix_l10_max-v2-1-2fccd87115e7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX6Fg0PMz/qXS8
 d4yvtIqeYH+I8L/kqGuyHiM7KHVuzMZ0/rFh4p0JSil+1/UrDNUprIWbMRif8SgaFBkUg56f+eW
 LVoYGmoQkSJKVjA4dvCEzCI0jBilzuo=
X-Authority-Analysis: v=2.4 cv=ALbfqNVA c=1 sm=1 tr=0 ts=6abbb8dd cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=NkAsgdMbsgjDGuKY8CEA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX7bxFZSKkEC/V
 cajHSmZ+EMyvglf5yDFzPO4eiOC4bHhArVOKh5jQYoZPocQnJBAEGMfApgew9q+JIBdNdIRQk9/
 YEniT9IQ3qFZGJbWtBNH3JuWpN1n5d268ZCTDdcYyc91Go8f5AV4kBEB4Lmb6fdBoW/1htl+aav
 RBnP8h+jzkZQrAS6RgTNrGeFEzA4Uznvt6+mFZ9YQ+btHPqu29x2/uKFHtHgdq69VMMXCX5Bcm7
 GakKXXHp5P1Z12PuuMTZyokf9cq0MvmRI/2g+v7qVo9RDkZKhQIwVXrGTIeaGsYMJvICsmkzNXL
 +5CwbmMMFUA6I3zf1YrBU41naJ+QigjHIxDI+6pi6qgGAwlJLDuawNImwxQCKmXSSiP/dVsTwMK
 2X59jezB3CwKIbBOrFjCWtUgn5r043D1oHyESVCOCgDCZ/1RTiHr6RjjkHhYsM84d4B9GRgZqbK
 IhiSgZXWsEPD2OIvC8A==
X-Proofpoint-GUID: 5GuNmzzuAL_qvyrzPcu47KlSuPQUI3xT
X-Proofpoint-ORIG-GUID: 5GuNmzzuAL_qvyrzPcu47KlSuPQUI3xT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290052

On 26-09-29 14:05:18, Rakesh Kota wrote:
> On Shikra IQS, the L10 rail supplies the SD card's VMMC. Its maximum
> voltage must be limited to 3.3 V because the derived VQMMC voltage on
> L2 supports up to approximately 3.3 V. Allowing VMMC to reach 3.544 V
> can drive VQMMC beyond its supported range, potentially causing SD
> bus bit errors and resulting in the voltage negotiation failure:
> 
> l2: unsupportable voltage range: 3500000-3296000uV
> 
> Reducing L10's maximum voltage to 3.3 V keeps both rails within their
> supported operating ranges.
> 
> Co-developed-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
> Signed-off-by: Nitin Rawat <nitin.rawat@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>

No fixes tag?

The rest looks good to me, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
