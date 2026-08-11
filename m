Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEF3412C03
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 10:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786442871; cv=none; b=YfOK9EhZi5If7wIrzKh2QubAHjuau5SmrCAHFN4q/5gE3LimcGuVfhOnPzWFA+jLQwKJi2tpMo5DfOACLoV2ycUyGj6a2pbv2aTgrgYWkjPWmc1q3BjoSoW569jJ1ZTKyYaMhW0NmWGOvee8rpiVuIHGxx1xfGWZRNtUCOMMvPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786442871; c=relaxed/simple;
	bh=IP3uviSFgqAdqvLku3HwTuCcjOeQSXS9m+wWP0ujGUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ifepcrcgqbbOrKGj7RLt48NcMqdZKNZF0phmkYZsH3Ws9JYzORDR1XDMSpnOm3S9Yj0jqxvkzWXzdlKOAqY7nYg1cT/LJTsGqZ/7RHmtnuAz9vcIX+q2ulp43BwgqH6rUfphjgsR+r5+1FZqCNcFVbtt4gKaUQo5L9anIgkH4fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hiXIA5qv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dqBEtMHi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hiXIA5qv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dqBEtMHi"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B78BJ73307941
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 10:07:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=f0PV1nf78gJz/48ngj/s9B7Z
	KT+dzu85I+qi7/RstUk=; b=hiXIA5qvExVGQ3O0hs0wUOaNRIQ7ujA1Nbi5VAL3
	KEGhzL393fF5LsEiWpLHdxumr3hi4DbcMGiUEHCwL2DL5mjtsP7hQSWO+CVZ5AfE
	rs/POrbuO2S/d8DYBsjhRe/uYpp5+9+kUotHIaptJy2jbB88FZHijzbHQR1jWjm2
	4CIqJzRKbR9nLIPhDlm0qg0TCD2jHjVcbSJyfUVZU+3FRxsWgnz5pThmjNK+1FZi
	8D38OuCrosGT7Za+WpUheh9zxa9jF+v+iAw6iHQPQ1zHWua70KaXkPSOlUwql/p/
	pRfP9SiPCOjgImBX+fAool2oTOvmytOH8OiHAThTdduQ+A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjyfugnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 10:07:47 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90410c668adso6716936d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 03:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786442866; x=1787047666; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f0PV1nf78gJz/48ngj/s9B7ZKT+dzu85I+qi7/RstUk=;
        b=dqBEtMHidGORbW+1rP2soFd1pFzLj5/rFEwUi+5K3el8EqeCG1x9ycD1+cYbibiQs3
         caRPDf5HE6ROSabbgVgqKGmx7yDUTp6ZXiDWgTdHE3CjtajVneRQdprFsRYNmt3dObQ3
         gkMh8sFeSmwjotl0cqb5jbbE8+3GBTeYqGRrp6GTMcTh4/YGmnbedEAWo+FsunJ45ZMU
         tm4gRnWN/E0aDB06KSiaoaFK68Ko6lJ6zgGeu8h531LlvF0H7SF9F/sNb/cgaV74Xxwr
         A5rYw19+/iaVK/D3tJBKdJ7eHug1glSdxe2U3crcir2qJJCebwMU2W7P/85HFXQFvzPf
         vbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786442866; x=1787047666;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f0PV1nf78gJz/48ngj/s9B7ZKT+dzu85I+qi7/RstUk=;
        b=cU9eelMBTq+N9GeFzy/UurvLxYZ1nYzS4wfMyiluijjt6UB38s/Tdii2o1FcWIlELE
         5x5/dtPctzX5vBBZOuPHaUUTwJJL9dX1jtzWuq3lSkAISfHmetCReC7jYrbv+mGb+k+Y
         EcZNHfB6BGvpkBgPTmYblP/JrbvuLj1xXF7iZeAyPdka6EUWik1otnXrGpgiSFfCrlX7
         2IZAMRhlfPqAo1ei5SlLxCJnLsCJKHGvCWEq+eYLzPYtvHoKNtjQjNYJP9CuCin7vlxl
         B8HwxeqgpQ5BL/99jr5aiFxuKqHXKs+ahr1UmsD/7654lUe2mrkJAitGICpc1q7VZxLW
         E4ww==
X-Forwarded-Encrypted: i=1; AHgh+Roe8uZlZihJU8cjfR4VJRjeOu6FROyIahXk8q3FZeualIuMqBNO/24e75CC1P+pKonVgqAcuid7UCGiniCN@vger.kernel.org
X-Gm-Message-State: AOJu0YxZrW2Iop/r6JLb7LX1bij3fudOj3YvVME22LHq9STMz2JVB9e1
	3YWJjvy5cpj/uPBuFJs/mRL9rxKTi3unSarvyBxCxEYJsMmTDACrVJ/VXpfzDjyt6W9D4JZs04f
	TOxaYHxAfl04l0ftY/jlGvEtsRK29kDCkoio3JlQcEhPp5v3fXsb1M+4GqF8oOz6ssJcs
X-Gm-Gg: AR+sD11iL50Gr8zNTcNXbkRa175+8PHg7osAyIZdNOa5JfGoyK6NhV4y9q7NRuz7xmB
	VYO5zjvVc/DLvgKJlpm1YH1ArGCC6ztMXXxbtRQ9SriCcCXEyVvfV2/QpY9JyBFFfk6btHCBPaL
	/Ptq13VOaZZn1TphhPV4n7cW/ZTSmuzQJq3TuTipJ1Twk0WWcn/kaYfi87VS/H1y0s9PL4SkSOy
	qOqBa0HDQNEveYpGIxrmq0zpcwUlGwL0VHchKarZZsoN7WN2f2dyF94mTO0I3JI1E3u4qnhcCjO
	BB1GyIwKDMyaLpCtRG8t9g/XRiiB6voWBx5K9oaGYkcRSCaNghNcYBCZ2kB9gC1CqwZATZP2fJb
	E3RpAC6NQjoVaPZRLP0NxvhO9uw/8AOsecnwbb2bzOTCfoAoiTOrR0DrC7p3hx9I7MjvmO5wNxQ
	fEpeKEJ/zCC2NNXQ==
X-Received: by 2002:ac8:5cce:0:b0:51c:1c2c:a8bf with SMTP id d75a77b69052e-52d5870199amr14591241cf.43.1786442866434;
        Tue, 11 Aug 2026 03:07:46 -0700 (PDT)
X-Received: by 2002:ac8:5cce:0:b0:51c:1c2c:a8bf with SMTP id d75a77b69052e-52d5870199amr14590961cf.43.1786442866030;
        Tue, 11 Aug 2026 03:07:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a0fa3fc5d2sm1669011fa.10.2026.08.11.03.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 03:07:44 -0700 (PDT)
Date: Tue, 11 Aug 2026 13:07:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: ipq9650: add the PCIe support
Message-ID: <e4gwudluyhv6y6obygojott6dbkvtqnrgo3x5t7n7ogrrpyhfu@l7lkbkry5bex>
References: <20260714-ipq9650_pcie-v1-0-4197749d06bd@oss.qualcomm.com>
 <20260714-ipq9650_pcie-v1-1-4197749d06bd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-ipq9650_pcie-v1-1-4197749d06bd@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: hBzvDwY73eE1UK9Iw_oaXSLDQG3S8Fek
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA4MyBTYWx0ZWRfX9hupmxvX6yPE
 IK0jpCeG6h/B1cb6n+iDgU2/QC3pmiKLhDS5xS8MVe6fV/MVrE6uZc5QLEQk7XsPKZHTBiOSxZN
 fvag/EBfcL7G0+2TQnZrIKef1tJTRpY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA4MyBTYWx0ZWRfX32AoH9lD5Gl7
 roqi6TV7N1V+eTogd8ftjW/dQxdpzZNtn7ueE2cYiSiI3Q/dKQyWR9e+oZD+jGUV0hfvx2t41/4
 CkC1bdAPW7PIvrDEOB5Ep+hkCoba4+usZg9F3qJsN1wMF181y+q9VTBQWg3OUiubfpQkv2pWeyu
 a+sGr5BJuSZMwI28kQ3+uNnkAtuC/4+/QF4x3peSXL8JP1B7c8UWM1AuMoJJ/NC+3PtToCfItK8
 2kVeJ5GYzdWnFugaRWxCNwcBUXeT94F5a8lCcZcI6gaHBH6tZSp0jk6Zmywvkimu7NA+vCltZaA
 iIHoVVvVt8Iq1WkTk8mA/UGWiilUA16MA9tt0uFviJEI3/BV8ENmMMiLqRL9vEK/W6C2sh14cC7
 W06EvhPGIHM1h3upSrITBjDwiJSoshntZO2up3pPbW4MmXjUoRfNRdUGZZmqLGACTyrawTaVjsx
 30ycGNAxficDibcTSqw==
X-Proofpoint-GUID: hBzvDwY73eE1UK9Iw_oaXSLDQG3S8Fek
X-Authority-Analysis: v=2.4 cv=Zd4t8MVA c=1 sm=1 tr=0 ts=6a7af473 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=jIVGqzqqGd92ZoTDXmYA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110083

On Tue, Jul 14, 2026 at 09:59:16AM +0530, Kathiravan Thirumoorthy wrote:
> IPQ9650 has 5 Gen3 PCIe controllers - PCIe0 and PCIe4 are single lane
> and the remaining instances are dual lane. Add support for the same.
> 
> Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq9650.dtsi | 665 +++++++++++++++++++++++++++++++++-
>  1 file changed, 660 insertions(+), 5 deletions(-)
> 

Provided the dependency (gcc/icc) lands first:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
