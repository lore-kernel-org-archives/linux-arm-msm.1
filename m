Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAC8E4457DE
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 12:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787230100; cv=none; b=QGSn4n3OSQY4LIMsmMv8ZDgKY3qNobzaZ/axpmcYfWHZgyZTMMgAUa6pbUcwyt1TeToqLkuUQZaBVCoCAYnaK0f9rFVuM8AX9EAbDpkC+TBsU/nVpPOM2BPxIMZHNqHMxXs2J1KgESKWexbwtGTF4xM/6RTebB3+Ecqpt/grhMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787230100; c=relaxed/simple;
	bh=449Ex3CsleS45P3M4E5SNBEUaD0gKJyWNYaUiEtMSXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HkIZtL1lKW2MbdyL8wFlR8LsNIpxg08Ocsvy97zSZtVyItaCVl4KfTVYQndQnn+p3JvDfq7mUPsaClyKomes1yppUAGSlwcfQPRyODTD9cJDXWhojYIJQ5N/JSR7H76m2lnluI3LK1ByLAdK3EoPJuxrOeLfAfuFSZtkDvHrkSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EQViquN2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uk7ZpLCm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EQViquN2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uk7ZpLCm"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67KAP3dP2215930
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 12:48:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d2Rrcr6IN2TrSdxDUmXvgWf0
	aEeJTdeSxPsPjotviE4=; b=EQViquN2iJCEyWL2poAcVoGeXgOS2wwNuNSVNAPn
	fyBGMrI/aYVv2QlijTlhS+iMIeMAOGwaiQY4RK5+h6H2aZSFBx/dnyiCvx9skrHC
	+lsPqgSuIYT0MLk8HCvM19tm+WBwroKHYDQO2mCeTP8SpipGbyLdLk34/rHXPNQO
	y9lrFanfD+xjCSp4NAso9YfWQitV4kVmk0lmPf7CGGokeG/FyaOJj75qdyauvfh7
	AXGYIofULsjdWLGo2eXUl+dDUvgBCixWNyKpnbZGOm8nqYN/BaAdjBEqCARdkdGd
	qA7G3TaX+VIK+sXWPVu9YaBtxokm+CWsMPHXgo/87F5j3w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5ytc8fpd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 12:48:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93494527488so382672385a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 05:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787230091; x=1787834891; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d2Rrcr6IN2TrSdxDUmXvgWf0aEeJTdeSxPsPjotviE4=;
        b=Uk7ZpLCmHVmFU2g6mXHSZzZBgiPpAeQuLGyN5CN8HwQoj3PkRfwzQmCEm7ZYOmeain
         xA6LCTqMsY+VCrBl5TxMaTjShl6Rii2ktLPZFpSkKNTWm6AQJm2mTLk6eFak44TkkQVP
         jrqs7niZQhVFJC4qSHkmJcDj5+uFzgWhZvrw7UWWklXsl/xjHQXdcnCWdX3sau/NeutJ
         lnWdP6Dbcy4PPbaNwfSOfFO/TLQsMSNgFmn+KudfpC6mmmKK3OowBGw9nH0RONGVUoLC
         mwvrKNNlIUsWYxtd3XjB2dZt/RnNUnaAAd55AbwT2FE7OJN+dpIWnA5e5O9VOegbFRf5
         MBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787230091; x=1787834891;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d2Rrcr6IN2TrSdxDUmXvgWf0aEeJTdeSxPsPjotviE4=;
        b=bnl4z5bmqI/90OjHp5BNjWLc1LwT1aSd/7guu7rHegFo+ewq6uQVeDvi7p+CEoS7dI
         92yDoVR4estVJpTvePeZZw4EQPjDSwYrXfls5JIzPMiWumfxswNu4XtM/vRelRDsMxez
         vgP6Te0nsWwsWNzFym8QReSuNmhm3Kp1GDIKvIQARNU+hDGLm9RSrHRBIE+62KRM8XCW
         mzg9xwp3MlE1c35KUY0bYZrNoQLXeUZqkUsN+TOJ3yuYsa78rlHVDMRC1a58uMuS0XTi
         5NtLpagKHRO7bf3h6AaAC1c7PilsL+7FbXLJLuWWk/x7bMc/L6tKShryU0veq+DY/eZW
         6vGg==
X-Forwarded-Encrypted: i=1; AHgh+RrvHbNkODoKLaETaIRAcAhUAMJGAUQLKAR+UAIinIE10vQ0oSMxYSMHd/FT9QTc5AOPvt3bNU1EdPyBsR78@vger.kernel.org
X-Gm-Message-State: AOJu0YxJq0iSegO24ryBNrfgZ/kPE0aQPBPHeEMKTg/cXR8WKXC5ZzNv
	8tIwh1/TT+hLgXmf9M3hAnLmhdfBOK1DiGxuwHBGe0LaqCWIcT6ZovhRpw4JPa38Qge6nJ7HlRS
	ZpCkpkndSo4PxFwvce7rvBe53Z/ILKiBQLe/dZ70CWeoEEGd6p/ped0Hzsq7a2vvMuDDg
X-Gm-Gg: AR+sD10IK9Z8bw0WT4tgaLNar1ca7we7NMSXqJOocMaSmJdoLVRbe+h35GteDq9viBK
	MHPL1mEOqXhOWjkPLYsMHIjMaUCitI805vg1rdzDnjxVWbJhrQ1PCwFRMJEabIwuOAgIs8fCpYZ
	07XUHZKjWsFwwK+YccGPhVOdQedzzxZ8yEdbzqoJbgPFqeHwPcFr58DNUeCjGfkzJADAfwHFR+o
	AQvzwgfzyC8GPI4oikGjCSQISabkMG76S0Hw8oZMuZUIeU03V5/WLVBbZyyC7B6WIOKEFFSy0TL
	i4cy3cqz8/duRbTDAWb848rRcfvkXXaIeTpnFYwrIKpn2JgC0bBg+TePdHQTnnDTKNtQe6fezOy
	Fdhl+wyEuyAZuk5Q=
X-Received: by 2002:a05:620a:63c9:b0:934:81ae:6d1b with SMTP id af79cd13be357-9371e6f7247mr1220472585a.22.1787230090906;
        Thu, 20 Aug 2026 05:48:10 -0700 (PDT)
X-Received: by 2002:a05:620a:63c9:b0:934:81ae:6d1b with SMTP id af79cd13be357-9371e6f7247mr1220465685a.22.1787230090333;
        Thu, 20 Aug 2026 05:48:10 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499aa11f832sm136903335e9.7.2026.08.20.05.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 05:48:09 -0700 (PDT)
Date: Thu, 20 Aug 2026 15:48:07 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] arm64: dts: qcom: agatti: Flatten the USB node
Message-ID: <xeto7gds4bwj4mcwitoaaxh6u72d2x3rw5evex7uuwle7i7ppy@s7unldat3cth>
References: <20260820-topic-agatti_flatten-v1-1-ba9dcab9dc2c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820-topic-agatti_flatten-v1-1-ba9dcab9dc2c@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OqZ/DS/t c=1 sm=1 tr=0 ts=6a86f78c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=XQXjnm9Gq3xsJ3B3hqUA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA5NSBTYWx0ZWRfX/0Sn0+pJTswf
 ymzHDkORtQrIWOywu3u4hEjyg35PE0rjrtzdpa/VQFIskWlU5Xu7/8qkPVzT07x/8v+6EB7H7JP
 8OwtVlDxnlEav4+jzLRnM9BjELlfMLFx3e3MVfZUuAYettn7rc+olIJkFw3jUYMR4XLsosmCeYJ
 mkdBGDgGFsuXbgTxUa2n7JF9KsRcF8ah4sQld85IBzZP9bYRvTwwfGPR2k5oLC//27OiUX7VzOP
 gKaKgW2sFMMkDXBOJj78tphoYI2oXm5Ca84F3zWjVxCXmSmw2cs8OLfBOA0XICBYQS/KMqi0AhF
 5n4dcsvOCQFsNgWQiTV+OW34LQrDmrX88lzBEwaYzKdCq0fMjLhg3dvIlh1uC4+WfGwWyPrcS/z
 JvIyWEir0V8iaJBUMcLoDPJnY7NFJTGKq2i01z6Ux033fnZRxxsRLN/RM72ITO6XQFy6E0ZFXIr
 QG3fMcN9a0tHdMomKDw==
X-Proofpoint-ORIG-GUID: 2EvC0YYA0xi0i1jwjki6_kogSI6w78Sq
X-Proofpoint-GUID: 2EvC0YYA0xi0i1jwjki6_kogSI6w78Sq
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA5NSBTYWx0ZWRfX+w6ocmNsmFMy
 Pq3JFSkmgykGB6kEdvwRiTynwxZfkYB9zjvwUTZdM8dRXMuuPxxew7kLjF6Zr6Eomz4cDtb1hmZ
 aSOoByr0tlPCplaOaaaJl7ZMpYNNoi0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200095

On 26-08-20 14:37:16, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Flatten usb controller nodes and update to using latest bindings
> and flattened driver approach.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
