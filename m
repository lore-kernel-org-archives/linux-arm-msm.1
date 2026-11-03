Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793712811;
	b=Z7MdN1eM33fs1EpvRy5FhYvvUcxsgp47Ew73cAm/Hlh0B7TLv5tpCSkMyRwqkf0cQA4+
	 5zDVJwut3b/zVoU2tU/vnE1cVQp6b+i/cUx7Pva6U21WQ3ppDYnI6FpUY3TIPVlcUGPUu
	 RLzuUAhS04gAlRXfG4r04GYuxHMc30AIyE1WRxhyg7BMMUyyM1A6JzFfnZrDqkObOWVnY
	 PCIaVczQhvCLdm4rZMOL2qZDj4WD8kE4Pig7MySgRZJofdorV4LSdinW3qGsDcR3fO6m9
	 +lOxRe9R5GEwepchb4nU9gWVGjTxG6rhJWOaqFD5l6Z9QDpengAz3nLSRceoZEUlfOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793712811;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=iQP0DffgHZK1//+ou8ZDmPpNoN8WnAJil4ETuCdPbuw=;
	b=AizLvcmUrxM6GKSjVAR0A5eweL3dkic5+LqvXFS5YRgFXIE22MoLOT87Qd/IGpKi6j4/
	 b2yUFdWCRbId8oOSX4xlZZGxA67lCUfQrALW8nW1oWXmmQ03K4TW24jKsnrPU0xR/jMUL
	 rwXVXsV7q4+UCvIwm6tLp4G5GX5PiZ+BNETZ9Dt2qcikdKjNB+ziAFh4JjsNDa5mLbFEJ
	 nxKP35sNt5eo2oWHX7thUxJTHEAFvz2y/4QchFyGZQi552DrfxD7E0ILp8LKAtWuKxwhA
	 g4pt9K4qKwXbqx5S7e3F8dbWJuj+c4BbXAE+GrYpfR3PkGKAofLevv0Z+bpEEhwI9Gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="MSO/3svB";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="K/frGJWR";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F9B1606D83F
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 13:33:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F9B1606D83F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MSO/3svB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=K/frGJWR
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3ClJEM3476966
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 13:33:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iQP0DffgHZK1//+ou8ZDmPpN
	oN8WnAJil4ETuCdPbuw=; b=MSO/3svBkez6VG0Vv+LeY1+7Kyq5hXZ4kt7PeNjr
	5c1IYcz5yvdrVLTXOKPQZvZ5osMXAPK2tQJ44o9TAyYiApulqHTN+bHa8Zs70oqD
	VDQE+WRZCxOGuqLg+f9cwFP7jpfisAsxDuSZjkYmd7xk+Yn/tv6WZ52cvXZBBGJ7
	RprlSD1WdkS+bEFanAit0B4fgrhT2Y2GRJ2wJlU/13El6CRqEDCxnmMa4G+QlQ+t
	quo0cHqNJ1Xvz0Kax83RdUB6gGAmo/VQ0HnxnGOzCyMAWJMuTg73G5ooTdj4R/PQ
	jMae2YFCv9sChkxcFtCnOugBKFiHtNTqQU1hcyNnXgOvyg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq94cswuv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 13:33:29 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7bf45382794so3547266137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 05:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793712808; x=1794317608; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iQP0DffgHZK1//+ou8ZDmPpNoN8WnAJil4ETuCdPbuw=;
        b=K/frGJWRoOoeH+z+5VIcBk9jtjcU4LdYas3VxJFUcn7b1bGOhJrcyRglLhX4qqzo1e
         Lcijc4l/e2CdmPfp/h1GUGOzOiT3czoVtqpPhH0AmTgXN+iiiFH66kJshmAQBb/zxxp1
         zjUR7Se0ULEDpvl3h1CPuuMMXbCpkqIpnqkOKrK4Eg5GftjB2chLqqSpBV3Pz06mXVzY
         OoJRIjiyDk8ypd9P/2BsVZWwfT0BdV8osE6YR26vylpSje0S0A6vso25W5A8TVdmKvOk
         kMonoPmvu77MY74bOiug9hFL12NdhL6IhFaKRWat2WaaHk+QfzWb01XAnezhOjuF22Ub
         rqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793712808; x=1794317608;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iQP0DffgHZK1//+ou8ZDmPpNoN8WnAJil4ETuCdPbuw=;
        b=qCBxinQpvvJT6A4UBaUSxw0Tnc3K5AGMc1GBnusSSGscKYpoXb0Ef4YTQlra7PrOn5
         6z1ue5jhPdLTmzhHCZVnzAeW2oxGdaXl3UKfFzrewr60t+SY6nM/WoKRbiGQL98fmsdv
         fVBrpUye0D7BUkUI8mLG352K/D3rh6Z9BVKdZWwvx3pbVUd/tsl79zPrYhr11KKmMM+r
         xVtuT42GqRRMOdGVpsZce0UMLLFV+slpFNFsfa2p56UK4DpKfh7qGMNXDur/n6U07CLE
         cQrY+8billEl3QNcB+KeI+wTeelkx1k8nOSgfXj9rckrmcNtEoGebh6U3nENN222xYeW
         hbKQ==
X-Forwarded-Encrypted: i=1; AKwUvBy++fFt9VZ1G3pINkpmoF2gxiCZ+yVIpVg8taLggYRUIc4Is9h8HHC8aTbZRqt60duFWs8jZrFDLSOFhP5Y@vger.kernel.org
X-Gm-Message-State: APuU4Z9MX804fKjnk0cgz1DLBItUnXtlakRSOIcb6BiAjHWbQ+SqP2LV
	U+dhdNDEIpUPBQSEteh/qK+5x/f82SJNs1i6AYcW3zsjIQwkm5dZQnLUFR8Gr0qziRP2jXVTXRC
	ULc2zVwEyXzk7T1jwYHIKBmBecSREzvqqEZhn5NPYj4OpqH5f8KDEBOkzKhEqn5qDzcZF
X-Gm-Gg: AYBFou0Nzqdj5eWKQZgLdcIj/B0a1676XTrckX8LAqDwY/ipuZPYVdAujEs6hKgpxIM
	SCeBR6XNiR8vvkMrUnn0ZEUI1vpQ6v7u0gC78AU8F3CqRhCrJJU1je0mer9u0Xmy+sHZKxWIrk1
	Wk8VwwVtQdYwbuCCLPicty64bmtUZvD2+X/6lIQDqmrO5pTp5aoYVZLje8NiGo2IF4LfLQEu1gU
	s86Vhy5mZPaPsLmLea8QrHVmHbwnReuA5OfVyY9VQYcvv0ve98FGExrJ4mNLpS4BUxI6O18pmyo
	0Y4JeNlP5NxavVUBr7W77ghIABrTCM7nBK91/YZHN9o6FA+0ni7oKZf/vZbN7XymY1/GF+e9j06
	GSN8jHLau07E4o/4+sNOuwg7njiRbqc8lWLjMVmrexe55YmC+A8w9MEsgfNvYyz8=
X-Received: by 2002:a05:6102:292a:b0:7cb:bda3:27ab with SMTP id ada2fe7eead31-7d07262d5f8mr5193741137.13.1793712808400;
        Tue, 03 Nov 2026 05:33:28 -0800 (PST)
X-Received: by 2002:a05:6102:292a:b0:7cb:bda3:27ab with SMTP id ada2fe7eead31-7d07262d5f8mr5193716137.13.1793712807714;
        Tue, 03 Nov 2026 05:33:27 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71bae0f4sm22349359f8f.58.2026.11.03.05.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:33:22 -0800 (PST)
Date: Tue, 3 Nov 2026 15:33:20 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Subject: Re: [PATCH v12 8/9] arm64: dts: qcom: shikra: Add OPE node
Message-ID: <zymjeclhd2ezemd6jeujtsu4y3gb26gi2v4vd3gmi7diuaa23m@aqr4blf32t5b>
References: <20261102-camss-isp-ope-v12-0-702254689feb@oss.qualcomm.com>
 <20261102-camss-isp-ope-v12-8-702254689feb@oss.qualcomm.com>
 <bac09735-4136-442c-9208-556568d39967@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bac09735-4136-442c-9208-556568d39967@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=O+KsLx9W c=1 sm=1 tr=0 ts=6ae9e2a9 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=AvtK1wfCeudOeV3Kv5QA:9 a=CjuIK1q_8ugA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: mhDuRgtZG1vYyFrPDvvlZWoOpXICQN-n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfXzB2Hk616+gNr
 3WI7eC/GPAAQkKmnHobX9D1FFfUPA/FEG43Cc3j0UxBNLT8dv2sKKQXY9spO32mpi2mAdEpZlVL
 y5uRH+aCn0q8dt+fpGQgyT//8wNzSJIQzOfBenMw936yp1ocmq5ymXKSwrxMyaFLakk2EuqlNS+
 bvo4DaR9OZqkrL/3JLNkFZ9KDDQAGZjIHNeuC3AxXDbR0/NIKeQE9J5DNcQntWRH8ygbp1kBZ1Q
 FQV35jBK73oxAtHLsBFF5nNHQMBlgY8WoocexxvzOQDZXflxsPgyg/2yzwumJGHtwwwwqGn6KW7
 GdehbYwVq1frtocrC+PUditr909HfgoAMCKfk76NTK4QgLWwZ/bKsCY9C6Uuem3dGST9XD0mqyV
 LyhNkb+xsf3Qbh0Y/7JWzKavaYvJtWslnhOU5iSC5kwyNl2BqEntpd+Whd9+pX+c55XlyOkO5t5
 6gzguwZBMDGekClpOIA==
X-Proofpoint-GUID: mhDuRgtZG1vYyFrPDvvlZWoOpXICQN-n
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA1MyBTYWx0ZWRfX+Xzb2YJzFNqi
 4YrqR4Yd8OLgRndNzBFQwfENSK0LbMuvR1nZAQQVPaYdbbnMvRFNLkPC8wAEmClvwMheLRDQzvv
 D2WkElZTq+UvVfzMDb/1xTTOpeNW8UU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030053

On 26-11-03 16:59:05, Nihal Kumar Gupta wrote:
> 
> 
> On 02-11-2026 21:17, Loic Poulain wrote:
> > From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> > 
> > Add the Offline Processing Engine (OPE) device tree node for Shikra.
> > The node describes the six register regions (cdm, top, qos, pipeline,
> > bus_read, bus_write), clocks, interrupt, interconnects, IOMMU mappings,
> > and OPP table.
> > 
> > OPE is a memory-to-memory block with no board-level dependencies, so
> > the node is left enabled for all Shikra boards.
> > 
> > Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> > Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> 
> Tested-By: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com> #Shikra CQM

This tag will probably not be picked up by b4 and it will probably confuse
some of the scripts maintainers use. It needs to be "Tested-by:".
