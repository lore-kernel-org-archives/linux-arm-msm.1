Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1781C353A9B
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727294; cv=none; b=u6UCeCz6mrM65XwefpvWUqn3vXuza/mlybI3XiXMFM2eoY89fYBmvth1mXoXgRlOQblRq/jYf4Dpt1tqf3MQe6hFvfgzx8Nq3hiBKJisvwN0K2jhKuMtwPutOZKK1BT3EPCHd5p82KEyubXTRBsTcxnEnPaH8BaQxdKIAmGHcgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727294; c=relaxed/simple;
	bh=N14BBnZYEzW7DFK9cV8i1zuO010YMCnevZrohK4TI+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tc0OaUu+vfg88l2Qw4dqnZNu0tGTH0xdC0S1vpjVwHDH+cYtI1jDlGnPSrDgtWdseUJcS5O+aehzHDeDFc8tTCnMjXnPwSPm2X5TOuTCsDpnVRzCswbQkav24wbKQKCDPNvceu/X6G5gFzshoWSNNW6IniEE7Jzk8fd7LIExWA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DBVStTOq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JqIS5tmc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DBVStTOq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JqIS5tmc"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MDWXfT1027199
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:34:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SkaktrxMNR4XV9Ly2K4y2fFD
	nw/dOgJ04mgtABo2xXg=; b=DBVStTOqFmSjdd+L9FfYmxnYcurEORf50u5RTr1k
	dFIR1a3m2INT9Asd77s8Ebhqhr4HqnPO8uO0h4NqO+tbbByptF0gtVDu5+Ryz08f
	+krHS8drlKo6ObKJv6B0PWel05geVsLFHHTTYliXpkwsBFZ1uStifgvacz0cl5NJ
	cmg7yRtMeBXjj2QzgEcz2WB5XLtJe+J29r+svY3c9Wee1h3d/H0VxawDxpCv9Wvc
	NZMI04GbPs8W9iq+l3ZhIAmNTjnEhQaJ4X0uhmK92BlhHwdIUxAs4erOfhc5AznM
	9LGFytLWNe68eFuZuj4HYpabXusQEBj4Nh6BxKFq9hGoLQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjt7997t0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 13:34:51 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1b4d961dso107902261cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 06:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784727290; x=1785332090; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SkaktrxMNR4XV9Ly2K4y2fFDnw/dOgJ04mgtABo2xXg=;
        b=JqIS5tmc4YwpK5QvneHOt+ZKGSyPBfB8MyUq31mLTIs+RxPESZz6nARmEYf8MjeafS
         EBnOjp2lLrQ2trCi5Bnf1+jLcF/wZKXkeksgAEux2dkItMpHliaBalfDOKNnF+VkzmEG
         fzCGYstbtcu6Ns5c+L/qIAWiK2Wzm279oqZqNZppOTUtePXoP7rghIx/ehzKINhKdNLc
         YbEkf7vJDJRMUTLAONcPEtwCH7XlKGKN2N19mu1FX0e0TeoV1gorlWBVIKCT1BfWBZZp
         T12x15uuAjkdxhWyheC3/7ZG0vzsq/tDbKp2MlG2cJgATN+wCf6ykk6RryXsguVFJIId
         fRoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727290; x=1785332090;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SkaktrxMNR4XV9Ly2K4y2fFDnw/dOgJ04mgtABo2xXg=;
        b=nmgy2MGFLjrhWo/f360P6XtQ72cKmfke2+9L6wgZFKSP6UnIjo6KHH6aC4+DfcXeu6
         8ad3p5EMjaUYwEaECVb3xqlk4LY1KRF0jA+yCA7GNt/nIS24AFG+itsyUlsqEyi9u7QZ
         tv4bFamsCYikN2UUxHafIOE0GPloPos3mrJrAHmPHMieWQKPE3S3hIEDn2rx2TvllFiR
         nYx9Edu9T423S2MVIpAJJ5W8Hz9YvN2MNd59TIG71yvCMFNXKaIDQ5qjhwOBiFqhV+eg
         bjh8v4WLfUVgm/gi3D/5Les3WIPAD3WE65e5GOGnJILzy8Oi9J/oII0P2GluVVzc9Tbd
         aLIQ==
X-Forwarded-Encrypted: i=1; AHgh+RoeYiGjErTPqa2BMWIxkBtX2Qz9akzYZEcAR52Oj726khBBodeWtul7Lc+CX967B9Wze4Ga/DY6ksxBuUaj@vger.kernel.org
X-Gm-Message-State: AOJu0YxaUYNOYyIlhLsfxEqM8w/WX2Ck0ItqvAabXmYTm6hcOB/6mlsj
	DssP06yFTXMr4RGYrt/+/OSiK9PAVlFUwhlXH28HX27purwVX/n3OgonnzbeuEyrYKZfg8jpQ4u
	XFtUrtUHQOJG+3tEOF/8zSWatigW/z48ZbZz2u+l/WKIaylc2JklV9FW4/IcXYoe6X5TY
X-Gm-Gg: AR+sD11TUQa1ebFOhRP34g5yTNEx+3uVVoQqmbwetDFUqpXpHo8C0fq8lgbmf96wr/5
	hQDiVC6X324X/2fsqA1e/yT0EkMoB5946PGOZ4VvnMCqBThYdU+poM5/bCLc5PMnOGv5qzghTzZ
	IPMXn3WmfYYDKL1vDjxB0CmxU/nrIl7kXNdFmpbFH8N4Wojlcakp6rV7uLSfz9tO90m9WZOOmQX
	92o3uNDFhwFsC/4zj3f426zNPR+XDNY5hHJn/j2sIJJgOPwxLcwfMITy5nHH/8RMHEDLJKKekRO
	1MOXrwOb3ZMCTWvIz4dQYjuMIUKlq1JKVig80uWr1aIjbB6yeQmkc37q+Rx7jcGUNbtK9upL/WW
	rWm6xClJwJXgmAq1jjH2TphTRBSn2aINfYY6FFXy/FL2VYNU6fCF65Qs350A0Ovg9SUNhzc2OrG
	C7yYIo0/qZjI/W/Q==
X-Received: by 2002:a05:622a:4cd:b0:51c:8556:55f0 with SMTP id d75a77b69052e-527a9326861mr41663721cf.34.1784727283550;
        Wed, 22 Jul 2026 06:34:43 -0700 (PDT)
X-Received: by 2002:a05:622a:4cd:b0:51c:8556:55f0 with SMTP id d75a77b69052e-527a9326861mr41663141cf.34.1784727282889;
        Wed, 22 Jul 2026 06:34:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2a9badae1sm482006e87.28.2026.07.22.06.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:34:41 -0700 (PDT)
Date: Wed, 22 Jul 2026 16:34:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 1/2] dt-bindings: qcom,snps-dwc3: Add property
 indicating presence of eUSB2 phy
Message-ID: <3iubu5nrdd2zwdks2qisqmlyzj66wanwpwvxpls6xgrqjrpakq@b2xb36qgexkc>
References: <20260709-eusb2-interrupt-handling-v5-v4-0-d4f993925608@oss.qualcomm.com>
 <20260709-eusb2-interrupt-handling-v5-v4-1-d4f993925608@oss.qualcomm.com>
 <d742u7jrpm7gdoljgiwkfexc47qhprwoibk6fadpm3qilbdpgi@jrkbrwfmqmrp>
 <alBOC18CpkGDhM2m@vbox>
 <20260710-warping-resolute-wasp-e4b8ce@quoll>
 <7a099224-ea95-40ec-b279-f8834f261e23@kernel.org>
 <alFTxg0HLyke0gCK@vbox>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alFTxg0HLyke0gCK@vbox>
X-Authority-Analysis: v=2.4 cv=Sr6gLvO0 c=1 sm=1 tr=0 ts=6a60c6fb cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=kytnFc8dcNkQ8RD8sAUA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: USuPXerO-d8bPSh4wCjq370lu58eZvp6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDEzMiBTYWx0ZWRfX1yV9fUjYB406
 QPlIhPr911j2uf6PheozX5PSiGRsnRY26omdteubC/4yPlHLwHUOf9/UgTixQZxc3Gs2ozp1/sk
 28Ubr1qwOTrZVxsea05gTe/HkEFVYewxc3kmaL5isbbBeqkniAkVvQ1kVsPs/AVGxnZo+5Wg6mL
 n5WhJCYOxBZNirc3ZhufrLmu1UQLYEht+lKSpFXXSuXPWTdhkUm7+93wVCOih6Da3plQmwvA3Gb
 t77cf+0DSTi23UtFReXAmAjwwtpL9cqVfv64/kvWauSV4kr9tB+EEqScLg/55tmF61D7Dg+U/61
 34DblR6HwvpPJoEWGAvypasnolT3q/kmiCC4ZLzaBNiAjTdWsLESYjLUQf8+LWrYIYBeA249hHg
 mn4oRB2qWoYLJ1mkSqhDSudtEnI6cx0VccZIOt8WHacNQv87di8iTKwR8xn9qVp+yyxJqzCzw/d
 p0yupb2tvfMN0+VeCQg==
X-Proofpoint-GUID: USuPXerO-d8bPSh4wCjq370lu58eZvp6
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDEzMiBTYWx0ZWRfX+tsrjzsGgsrR
 Sjlbw1aD4I7dG4wOVZCCTQJCCLUwS9OQAA2WK5MzT9w9aVlq6mT0OTBQEUBTTFBk0qQS8Q/ZKuM
 RftBKNzo5i50Ew9R8tY4ewduM6FnhK0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220132

On Fri, Jul 10, 2026 at 09:02:29PM +0000, Thinh Nguyen wrote:
> On Fri, Jul 10, 2026, Krzysztof Kozlowski wrote:
> > On 10/07/2026 09:16, Krzysztof Kozlowski wrote:
> > > On Fri, Jul 10, 2026 at 01:52:45AM +0000, Thinh Nguyen wrote:
> > >> On Thu, Jul 09, 2026, Dmitry Baryshkov wrote:
> > >>> On Thu, Jul 09, 2026 at 02:22:36PM +0530, Krishna Kurapati wrote:
> > >>>> Add property "qcom,has-eusb2-phy" to indicate whether the SoC has eUSB2 phy
> > >>>> or not. This is used to modify dp/dm interrupts during host mode suspend.
> > >>>>
> > >>>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> > >>>> ---
> > >>>>  Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml | 7 +++++++
> > >>>>  1 file changed, 7 insertions(+)
> > >>>>
> > >>>> diff --git a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> > >>>> index 8201656b41ed..0c6a839be82f 100644
> > >>>> --- a/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> > >>>> +++ b/Documentation/devicetree/bindings/usb/qcom,snps-dwc3.yaml
> > >>>> @@ -152,6 +152,13 @@ properties:
> > >>>>        HS/FS/LS modes are supported.
> > >>>>      type: boolean
> > >>>>  
> > >>>> +  qcom,has-eusb2-phy:
> > >>>> +    description:
> > >>>> +      If present, it indicates that the controller is working with eUSB2
> > >>>> +      phy. This property is used to modify dp/dm interrupt configurations
> > >>>> +      while entering suspend.
> > >>>> +    type: boolean
> > >>>
> > >>> I still have exactly the same concern. This information is already
> > >>> present in the DT.
> > >>>
> > >>
> > >> Could you clarify what you mean by "this information is already present
> > >> in the DT"? Are you suggesting we use the dwc3 node's compatible string
> > >> to infer the phy type?
> > >>
> > >> The dwc3 glue compatible describes the controller, not the phy. They are
> > >> separate IP blocks. A board variant could reuse the same dwc3 compatible
> > >> with a different phy attached, making that inference silently wrong.
> > >>
> > >> The phy type is described somewhere else in the DT (in the phy node
> > >> itself), referenced via the phy's phandle on the dwc3 core child node.
> > >> We could walk that phandle and check whether the phy node's compatible
> > >> contains "eusb2". However, that relies on a naming convention that isn't
> > >> enforced anywhere. All current eusb2 phy compatibles happen to follow it
> > >> (qcom,sm8550-snps-eusb2-phy, qcom,sm8750-m31-eusb2-phy,
> > >> samsung,exynos2200-eusb2-phy, etc.), but a future phy driver could break
> > > 
> > > You have a fixed/finite list of phys which needs something special, so
> > > that information as Dmitry said is in DT already.
> 
> Are you referring to a fixed list of eusb2 phy compatibles, or a fixed
> list of dwc3 node compatibles?
> 
> Either way, the list is not fixed. New eusb2 SoC variants are added
> regularly, and there are already 12 eusb2 phy compatible strings in the
> DT bindings but only 3 in the PHY driver of_match tables, they don't
> land at the same time. As for what information is already in DT, I've
> addressed this above and in my earlier response.

As we expect more eUSB2 PHYs rather than non-eUSB2, you can add a fixed,
closed list of non-eUSB2 PHYs.


-- 
With best wishes
Dmitry
