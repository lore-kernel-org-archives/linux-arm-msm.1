Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503924195A1
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 10:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789466427; cv=none; b=fm9IiAQ2edrpMnIiqmFCmm48FKPDWNIe4bkKO4PgD7xdYENVn+VS5WUAwU1jmVmzUkBUMnGALOKS+pauClG4ZlVmr5vIAPEbodnrwlt1/g8spcuvqF+iWYUK4B+MzUBklICVYrWEPIhbiejsCwRCPoV5X/tUG3eYN1/kV6nAhpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789466427; c=relaxed/simple;
	bh=3EKHdUtlfbgnXzhwbfKX96Yd/Jc336claAx5nngK7Ck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Av0XWYmg2Di0VQjgeM0gcDO3s8p+V6j6vwmS4NdVzhR+hCe/avey/Ca9Bh15hkYuLMn3O34r0087qPsPiZF4QcMDq3yapE4s6FPjq5/M5M8iE5KNI1bCPsy6T089/redk2fj0rbGj4TDNorW4pIk51CFlSa8F0PUY8OL/GuzJWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AIYPnWsm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vgo/v9Uz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AIYPnWsm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vgo/v9Uz"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hPWL3742102
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 10:00:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CIHJOWMLGhLlhqJ7ANPesOl8
	7R9CmRzbsHGWLK7lnrs=; b=AIYPnWsm7HzwL5Hy4SfEJhUOkXwRr+yhXl/9yS4/
	YKPNzN/Pw/Hw3P7WJPwUh858+HMofjpxZvQRrIYmWm1cHLJAD/Q/KyKDCQUcsoVB
	nbC927Gqd1S8m+l+aQpTlPgkzRq10UkpuqEqX7PK7EjhuWIUegsyFG2ebaLuwbiG
	UUprmdxj1eHwe5FKgM6THRn/+vIn1E7aEYlzFOW8dq7hFM7d7Uqek/YmQxzXffWi
	PB4uePU4FX7jZqybTTP+7QLw0TY64aYHxNzjrCQOf/QLFlyo6zPt52ufj+TeW8qn
	zhBdrqXuPUqK7znQD6JYSgo8JF5DZbEVKYFSQaHnnMRMYA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpyux14mw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 10:00:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936e393061dso688941885a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 03:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789466423; x=1790071223; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CIHJOWMLGhLlhqJ7ANPesOl87R9CmRzbsHGWLK7lnrs=;
        b=Vgo/v9Uzd5F61jegIvOxNFyBxIyMbXrgn7Q40sCf/1cUm+0MMAvmP+X18/W1kkNJva
         1dmuuKHQpV8dfbnH51ylG8UaJ8yTGFXz8J2T0fdbjJh73z5e6bLMXi1yh3f0Crx1x6GD
         LyaS6qibPKREMI5cOSJkuorlL5E7CI2W1noFP74O1v1fDtD4vWNyUPf9eJTbMwe2donK
         1eYabO/0LOpmzrlNrZG3cDFFMpsvf/WUJxwjrTGAKAzzcZSuJ6wDIyTW2LdrMWYAT4N0
         cNd0guAUENmtb92uL1WgYKUyFPoP4lo1EZnn/3AFKv4hsVKfj+NnaDi9gCntbmMEXLXf
         bbdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789466423; x=1790071223;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CIHJOWMLGhLlhqJ7ANPesOl87R9CmRzbsHGWLK7lnrs=;
        b=QXmMkyVaicTEG1ixp6lj2/mYdj0fPMtYU41iqUCkgBvySF7GWJKbYpYxiV4Pf8L2Bm
         hKpcVpocg1MIPVQi9nhqgoGqou8EL3fuOT0y9KzeyxL8Wxo5HYp0iIN6C0o4AVPvqkPU
         HcYiU8l3qkHHSNRcJ0TECUw+6js9AXMWmgHbLkllnyLL03noJJ5s6lAb2uSA1PyyMEak
         QcwnbGqqPxDKHybFnNjVcu8AEfio9R2QzLUA6nLmd0lFX6BD1K8l8tCujRBUJrVvWydG
         Amu+cqYkhH8l1x2Ys46DHOUrkoIDnMcgV3/ev/cmMPwTQ4fUm/PpZKudTRVf98oGX/ow
         d38w==
X-Forwarded-Encrypted: i=1; AKwUvBxEPdy+bDywSqUo04AXuqLSXWIjxt2cboHibha5EmO+XFABo229ezdaowh1Trole5wid2N12mgucQfK6uGP@vger.kernel.org
X-Gm-Message-State: AFuF++knNj5tgl3awK5XFuf++YgC0zznWZXEJZR95T+pyifVz7F2STN3
	Ktm9PbSdpAXvQcPmRY4C7lw9bZel/bs2qYKuBOYRxqNbGyyUr80ZH99TlIfh0CPVP1jQ2fnAxSO
	j2n35xtusk2KZ1pkpd0zfGH0Sen/2t+hZ3HKkiaJXPDrgCVfjdUXaQGk0QKqXjTU4VlLn
X-Gm-Gg: AYBFou05jX1Nx6ZXrwIz/VjFQl0csTqR5DaCQLODiC4q+ACGZlMF6QTaL7PvwkjZ4wY
	nI2eRqjP0cGC6N89PdFBi4HvCpOuLY4v9kbKNDipQ2nKPgrDfIimG2C3CAMnUPBUJ+a2lbUu7L7
	aatt7VqYfCX2XI/Uw9bASh02/pwST1XaSnTFTsSmiRvIu13XKYb+t4C765QFeJ37kf2JWBEpog0
	ONT5PfFEmYvy/Ow/yPdACToobTDSVHHPdAYhtOSzCNHbIVbIP8eS5uY9ZK9OadkOstTjON+h4Le
	ih/voHt9PFG/jl/bb7G0f5pNf8UtIeuoXqGBCB/+zU9+x3j7PSbgN+DRyuGwKCXMeGF4N7RGf0H
	KmpJkBEWbFtMhsA==
X-Received: by 2002:a05:620a:2549:b0:939:4a44:5f99 with SMTP id af79cd13be357-93a297cb330mr908706785a.10.1789466423257;
        Tue, 15 Sep 2026 03:00:23 -0700 (PDT)
X-Received: by 2002:a05:620a:2549:b0:939:4a44:5f99 with SMTP id af79cd13be357-93a297cb330mr908622285a.10.1789466417390;
        Tue, 15 Sep 2026 03:00:17 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb32d3c7sm30971178f8f.10.2026.09.15.03.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 03:00:16 -0700 (PDT)
Date: Tue, 15 Sep 2026 13:00:14 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Xin Liu <xin.liu@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nikita Travkin <nikita@trvn.ru>, Birk Skyum <birk.skyum@pm.me>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: x1: split PAS remoteproc iommus out of
 x1-el2
Message-ID: <v4brj3i6npovcksaqi7qffkl2fo4ihkg32tzrh2sttfjmwxnj7@s52v4b5nkw73>
References: <20260914-x1-el2-unfuck-v1-1-00d8bc35a635@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-x1-el2-unfuck-v1-1-00d8bc35a635@oldschoolsolutions.biz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0NCBTYWx0ZWRfX3ZlFsiqbxo8G
 ORPW4jwnoyD8L6Xm57EWe0L5t1Egf0SMpnN7OJFgYtFg1A4HFskvyKD77nJsvlUmqsTNrzj85vf
 +5YCDI1GGl7T4G+XnbnXAZbPLfd7I+1mo12QKcU7PwWhrKOiIg4YkKKdlyRN7rebkX26Sf9VBDP
 0jGXK9f/ZGaVUwrJRHnf88S78bAFxNQepMakMhJicDQE7C2gubPyNSvXhL28sqm4PZHD4/zaITE
 052hxFGVCdwRXhboVe66fBWU5i/+Ph9LNxxnwnn2raRBnVIgjoyIB2xyCRP38K+dVd4FPlJS190
 t7b9jjilqnF/wEYlyw5YkO4HneaRfrxTGLp43UkrNr1O4mYWrXTtVSBZTVCKFDPBrZhxKf5IZ4I
 IY1PyH7FfVmdwJBAHcIS493I5l0seXl9CuBl0mNXKu/ngTHbeHpajKIHlCld+37+LihhIK/Ty4z
 u+yncbban4mm0c7MHjA==
X-Proofpoint-ORIG-GUID: FJYvUR76bmozzId4zTvkGhOciz8KBkZt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0NCBTYWx0ZWRfX5xxN+alaA29g
 C+qGu8Yi4SYCr4799LDo8TeeBtjxP1b7Xk2Q6PqlPel+Nfwf2Umwa23Xa3HrqJn0xBPT8ubn/Ud
 7H+WQx+lD236nXf98Y7VbpYYobUq2hY=
X-Proofpoint-GUID: FJYvUR76bmozzId4zTvkGhOciz8KBkZt
X-Authority-Analysis: v=2.4 cv=QYLzLcbv c=1 sm=1 tr=0 ts=6aa91738 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=InlpzHCLAAAA:8 a=gxl3bz0cAAAA:8
 a=z1J0HiCIPE4x8j7KUW0A:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=j9sqBCYxEfXq8HZXc0HF:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150144

On 26-09-14 21:42:21, Jens Glathe wrote:
> The shared x1-el2 overlay currently attaches apps_smmu streams to
> remoteproc_adsp/cdsp so Linux can program those SIDs when PAS is
> used to authenticate and reset the DSPs.
> 
> That is wrong for the common WoA EL2 path (slbounce + shipping
> UEFI). There the DSPs are already running from the bootloader and
> the SMMU probe path leaves their SIDs in bypass. Describing iommus
> on the remoteproc nodes replaces that bypass with a translated
> context that is never set up, and boot dies in an SMMU fault storm
> on SID 0x1000 before userspace.
> 
> Move the remoteproc iommus into a new x1-el2-pas overlay and apply
> it only on hamoa-iot-evk, which is the platform that actually needs
> PAS-managed remoteproc under EL2. Other x1e/x1p -el2 DTBs stay on
> the generic overlay.
> 
> Tested on:
>   Lenovo Yoga Slim 7x (83ED, BIOS NHCN62WW) by Birk
>   Lenovo Thinkpad T14s G6 (21N1, Hamoa)
>   Lenovo IdeaCentre Mini 01q8x10 (91B6, Purwa)
>   Lenovo Ideapad 5 2in1 14Q8X9 (83GH, Purwa)
> 
> Fixes: 47c88db49f6c ("arm64: dts: qcom: hamoa: Add remoteproc IOMMUS in EL2 device trees")
> Link: https://lore.kernel.org/all/20260130073113.3091884-1-xin.liu@oss.qualcomm.com/
> Suggested-by: Nikita Travkin <nikita@trvn.ru>
> Assisted-by: Grok(xAI):4.6
> Tested-by: Birk Skyum <birk.skyum@pm.me>
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
