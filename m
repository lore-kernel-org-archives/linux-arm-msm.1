Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1BF4FC8F4
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 10:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788861778; cv=none; b=QU1FGOONzQukjdzcXPo4aatwbQ+PqSwZvccXAyEKyJP/wsp+T2nR4RzOojul1jd7KA9hL6lSMXf5+20b/Z9z4RJGOHUVBI9PfhEU0CX2DskLgRt+sVkE66oYl4gj3wVb3BFveIHxXcWoevuJuMFdYSABc4QiR75tpPYSENnpclo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788861778; c=relaxed/simple;
	bh=nu66mMKWC73o/vxB4qVjJ6LaMbWAWzdLBk2oam+8eO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QKv3m1OXapBMMLAvMSXZAC2Xp6rP1alOiLDRt9GjNwbXTipfTbS78hJ1ZltxKnWU+b0dh78AGxOHpPf8N0++NotH+UUxwVZ4Y/42lqcJ2QnfqnZa1lxHnn7/cJEc0x4LjpoVoNGKU9gc9F/vNwYXIBuzrcJiWNdm8fJUmxzhnPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=htKLF1O1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jv0rdC2c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="htKLF1O1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jv0rdC2c"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886M1vP950800
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 10:02:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hRAvu4aI94s4uQ+esf+PyyrN
	kw8w71mQnH/4hgf3JqA=; b=htKLF1O13lOBNYC6cLwdnixMeOgCvTL+5V/epkaV
	blUgbw7g7doZydVZpM4KVw3uJKruk8AbYYE5RKFaiLZwVnwMsSRGUhKsGUcL+b2R
	9GcA9S6Y17bEk/OKoDusc2nDfnKUEIpqdS7qdJAyr0RIRHbXER8T6r9Q9H3yxMDZ
	6KZ6pBtfCKY94KpNl+GA5HPD/EtLeOT2RqrAuMuJ45xWKVqj14c7lQRDCdLpg9dx
	/kIERbObmdi/mR4OQsaigY0jk4tJq+uBGCTZaFE7GVFWr5j6NoekeOf1yllT54VM
	KXaI2dT3zOaQQXM3c/qyPfqRf84qRcXlZqkVX3auoAusaw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcrp8y1m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 10:02:56 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-398d292eac1so9187794a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 03:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788861776; x=1789466576; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hRAvu4aI94s4uQ+esf+PyyrNkw8w71mQnH/4hgf3JqA=;
        b=Jv0rdC2c/RXUbVN638hNNBh9uHY4br5YrcRtxze5mder0IaDZLYbBRO3dq9cO4Tq4l
         QEU+PlXbhWyEZjW3VkVU9wBOruAViYyAwduOtKy1afj8RMly7J8KDDPoBP/yj3jMwyg2
         4cDjnvwAaWZSjTqgqr26tKSNa9ZmRGBggkDYblTlYaRmI+beFhAe3wmH1UW8FNUxLcoz
         2CBpiHr6lDVknq0lgEth8FRekAsilQ0vULAMpdFSy+6ZZLeruF7XcbSFEedgpskvm/TR
         7pP/eGmxoEmMvqoij2D2xgxyFVHOTrrfTHkGwmChvi5hU4Yd361ET0cO3TCXuyrHVudW
         TufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788861776; x=1789466576;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hRAvu4aI94s4uQ+esf+PyyrNkw8w71mQnH/4hgf3JqA=;
        b=VwLHq6V4GJd3+VtddxQaSnP8R4UqULvFQ8Ns0zQ3eGbM+r64MKjo9HtXfDHXue96UL
         nLxBnpZv6gFRdIUW6bgh2PEPytN9mJE2ZKWH3d3aFp9sXALUddZP/msuUsYxOehZQv2W
         ir0OH4VFNtyB/1bj6nbVDNc63Yp0A95fO9zRg80iSSX94X54Qt3BVckehfcFMWzEJQX2
         OTzfeKRW13guJEklaoEMsr0I7V6I/qDvawQbIasudFvBY+TV/J2cyijDi+S27lOwzhdK
         kTitnWCcFY8F0xM/O5SVx2M2uou+LmDUyPbUUEoeyn+fW0gT9PITf/qD6UKF51dTvLX4
         45rg==
X-Forwarded-Encrypted: i=1; AKwUvBx8m5fQglAnz5rvCIbkkAcAZ7uLJPSvzgD+V/Aw2OWTWuQ4XdBj0/CBKJsOKSbc1DI2aDGnwx775aJDYesI@vger.kernel.org
X-Gm-Message-State: AFuF++mRN1gH6NBooj2gZVnkMDwO4vxSv0lwdUPbwlRKXleoSPADnZLw
	jBc3uXMFmLjs2AhNYZVEs6PNS/IPEala+hAPU2B3rGc18wRWbT85ZIxbvUPH4Mam8bXnNor9f3x
	jSz0A+VeoDi+NA8EfFaWumjMVDbXnomaYjg31J5mI5BCLSdi2kA0xbdcw5y9i7FUP1bO5
X-Gm-Gg: AYBFou15rxPfEWLqBQroyG6MiQEdb0LDLbC28RPZkJjCvOpR4EyHlABFjDX1w4UnwHH
	n5AcCywheITuGulIs0FQI2AiTxhz5Go8DQMT2/wWNTsmOHxe6YmYmAc2+sCwKIZEdMtNz630++e
	VcoqhMHAXv0TRxKWnXiCTzziNnLfmKnrxXl14Q4ueyyVdIlit+H8NFv4dLm6r8a5fbgKakYwIs8
	wmi++9RGdsvfQqVOLNJb2XOaUoXAYOWEREHfeGtmd9Wwo+wLEwMKhCJjzmC8zLwBIfK1Kf4JfYO
	Zn2stJJxqeSsxdDAd2zV7EgOmodfEinLuQXLRPlNq1Qk4xvJ8qJYtEwiddgAFpBy6tNqZphErze
	WI760f6thVhE0VQ==
X-Received: by 2002:a17:90b:39ab:b0:398:9be8:ea68 with SMTP id 98e67ed59e1d1-39b261da75cmr43496167a91.21.1788861775463;
        Tue, 08 Sep 2026 03:02:55 -0700 (PDT)
X-Received: by 2002:a17:90b:39ab:b0:398:9be8:ea68 with SMTP id 98e67ed59e1d1-39b261da75cmr43496037a91.21.1788861774900;
        Tue, 08 Sep 2026 03:02:54 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1434c745a09sm3818443c88.7.2026.09.08.03.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 03:02:54 -0700 (PDT)
Date: Tue, 8 Sep 2026 15:32:47 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Anurag Pateriya <apateriy@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH PRELIMINARY 0/5] arm64: dts: qcom: shikra: add Ethernet
 support
Message-ID: <ap/dR6Wn6IhdROZK@oss.qualcomm.com>
References: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
 <e9388ffc-ddc8-456f-ad7f-1d185d35ab69@kernel.org>
 <ap+zd/2QmerMwi0o@oss.qualcomm.com>
 <c23369fc-84ff-4881-8327-c18fc3692306@kernel.org>
 <ap+3+Xhq6ygnPzQ7@oss.qualcomm.com>
 <ap+7oEcW6GONVdEk@oss.qualcomm.com>
 <c0e617f9-202a-4786-8383-2ce7567b7d29@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0e617f9-202a-4786-8383-2ce7567b7d29@kernel.org>
X-Authority-Analysis: v=2.4 cv=UfRhjqSN c=1 sm=1 tr=0 ts=6a9fdd50 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=2Yymz3qdJ2OcZe8EWdwA:9 a=CjuIK1q_8ugA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: W64kkgvI0-6BllxuiEdH6P2xDm3LBOkt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDEwNiBTYWx0ZWRfXzRhdttazCDwO
 IOzW/S4BYvC1KZL3cV6wPg7NO8xLUoycA0AsdA6T2CyN+19tzIsdvTsOIoRQ5ikmXKkn7BSoULp
 8AQXV1qOigiL0ciChOjtMM6Nn9ct/i5YcgRVCpIWJ1VZsDjE9t//4yWf6j9u2cG5cdTU5u7QIEe
 HGotNKtuFf+mR7GuWecq08zI0UG/IOz1dZdL7C8doHRLLRnsJp2RHU8aCTtwgAQJvmV5gT3keV3
 d2KSy9BpKmUcoGDrJjqeZU6oMibDCsz29TyEa2y1NaXD7xg4HX6VFQzVzMo9TJWaLfjxvOsqdcG
 Szwj6j7q7nSZFOWKMyhu4VeVBMfbe9TJDvArVndq1QfdEb7094xmoY/4kVLFaCoKoZD++mi2ziD
 oVKfrL87DN3bTCDXx8yyjCNv6MQ12aociqezCvLSvBosoBLIV1rZvCcRiEWSh/rcAfVQn6vwWTI
 uQB4BPCYk/bCEeB/bzQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDEwNiBTYWx0ZWRfXyf4AveIQmSuv
 N9557fixCBMa4s9e5uVvoBeLtS/7YK5DwicLrcIWq/htBvDfpHHob+awtxiZSsfAsj4690supv2
 NP1Rzghr3iiSm360cpONOmQvEBOiPqY=
X-Proofpoint-GUID: W64kkgvI0-6BllxuiEdH6P2xDm3LBOkt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 phishscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080106

On Tue, Sep 08, 2026 at 10:42:40AM +0200, Krzysztof Kozlowski wrote:
> On 08/09/2026 09:39, Mohd Ayaan Anwar wrote:
> > On Tue, Sep 08, 2026 at 12:53:46PM +0530, Mohd Ayaan Anwar wrote:
> >> On Tue, Sep 08, 2026 at 09:14:45AM +0200, Krzysztof Kozlowski wrote:
> >>> On 08/09/2026 09:04, Mohd Ayaan Anwar wrote:
> >>>> The only reason I added a PRELIMINARY tag was because these DTS changes
> >>>> should go in after the driver changes and dt-bindings.
> >>>>
> >>>
> >>> DTS cannot go after the driver changes. If that is your requirement,
> >>> then original work is broken and needs to be fixed.
> >>>
> >>
> >> I should have worded it better. I am only worried about the dt-bindings
> >> going in before this DTS. The driver changes just add support for
> >> whatever we are desribing in this series, they can go in after
> >> dt-bindings and DTS without any issues.
> >>
> > 
> > ...would it be preferable to instead have the split like this?
> > 
> >   - This series + dt-bindings (on top of linux-next)
> >   - Only driver changes from [1] (for net-next)
> 
> No, because it would be against explicit documented rules in the kernel
> and against clear guidelines and recent discussions within Qualcomm. I
> wonder why did we have these long discussions about Shikra if only a few
> people were listening and the rest will be repeating the same broken
> process as before?
> 

Understood, thanks. I'll keep the current split (bindings + driver to
net-next, DTS separate for the SoC tree).

	Ayaan
