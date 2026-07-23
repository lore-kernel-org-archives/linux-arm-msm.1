Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A730635C6AF
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 08:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784795202; cv=none; b=qKVBXozskro5SS7oBY0XPAAlhA9OBJjr18OhfJ71CMJ/Uj9ADqBItyRY1l/mFS3HhX/Gv6F4pSKpEKNe5H+RD/c0HaCJe0UcdKBrJxsq1yD7ekDXpGqm7fpiym3/LVKAdAM/C6l6GVZDUx68rVYuYjdC5clrGiBNJAK9HZD/20U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784795202; c=relaxed/simple;
	bh=WIU9rURSuoj0mbv7QIh1Uc9LxjoSXGPkyJQesEkjZJg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LouOBSM7/t143ogo01HH+Ik7KPNlGtI1cscwtm66CNyUVJTmZUt/X0cI0pTdVTDtHngNwVe2y/HAvZgCU/7LfiieDLamceg+YPRleZhTY+9JNBvCXgGoQzkso9szRrHtqEI3fwYIskohhGpSgUeIiDRutYLe1AT6rqh2SJzKToM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=E+FmnVTv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QL5NEBBe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="E+FmnVTv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QL5NEBBe"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N7BcoE3434547
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 08:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5wTsxAnw0vjrNK0ve/deSbPT
	ftCcHduSz9Ei/0X/wx4=; b=E+FmnVTvZy9HuHaHiDD2ecK1ScaoxsKOOQufObDW
	+3kuCuFwNFxtFsidz/LO49NRzMATRadbf7ziKjFfTlfN8adDNhN37AqekmmnOylN
	DBdI6vaXhsvkjSpaHfr1Sf+LUKo4JmZHr4Mx3E3Tc7WHC3zfg6T2GBRiwqvyUJU5
	T1trkuyNnCSmJJCdtBxdGC5cUzHx/ACvB7qmYlH+xsx2MXuJsLWU/JGKN++bcPwJ
	M699O5OP2AKB1QhEtuueCCoOMD0U5cQ7BXeDlkP9EYbxsdfB9HxP5MrmrRme2sLh
	fO+Twk0gtkfw6Ux4eG+atdWwpqXVKwsPQm2ddNsXM5kVEQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk5cc28ne-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 08:26:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1d30035dso6067471cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 01:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784795199; x=1785399999; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5wTsxAnw0vjrNK0ve/deSbPTftCcHduSz9Ei/0X/wx4=;
        b=QL5NEBBeakICBKJdrQNhU+yWiC3MeK/VFKT6eDuTE+b11R1HlxETD3aeKsbnUIymrA
         S+/cFrroauAxwYr6JDgeRaALEVIJw8ajaf/siZ8IEsCjPA8ylJLsEi15kM+PH4D0EInu
         9ejN2E8qZlI7yYPBZa6nueRQAwkJQ3mJvggumCzmNG3v4tZBTzzr2iA1oTa2Wmi6hV9W
         8kql2OSXf76SP6OFZD5WFfHWJ249SbQ/uyOFK19bUD9X+HXqMc3qOguZsGaG/FLFTx3Y
         9oms5OymO2QvACt9JXQE5hMLLMkqckcelj+vM+Y3ZWb4OpzG1ks4cV7ZZ1rRoD6xhVhI
         1c9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784795199; x=1785399999;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5wTsxAnw0vjrNK0ve/deSbPTftCcHduSz9Ei/0X/wx4=;
        b=KRR1g+qAFq0GNEHiM9+TvcAh2n++f+t0We5hEBWeoREH5VqD3t+14OK8mCvUTn5kIk
         wwfwu0DRLb4gKZLfK5LLuS8d2XmGVvnD7BxazErRtXyjpiWsnDmVT6mImh2eX6whsRqi
         +k2tmH+iH+kvnZ33OlcKgptKQPQeEGiqpBLq+AiNm5EmhLvphRknjVdMJdQdNMj+t88/
         zs5/yV2fS74D5lSIunfFBRVNBYoDBXV1xHc8EZ2CTJU8NtyP85L6ePAAvJmTbtetfAjB
         xRdI8Cs3f3H3Ycc3TdXMXKGqaS6NEZMDQmS2bKflRk1AaMw3Y+clh8VcNhPJFENKnytd
         rqCA==
X-Forwarded-Encrypted: i=1; AHgh+Rq3+XzSii0qXw17l8ppEzLAV7GWbiO4IW8s/yhkaEOAqJN1E7Btxti8uKfXsIDLwcx0GFwyzFiOCOzLmhR0@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2wIHCoSDg9JyJyZ6bDVGgHQtLEVwsbeyzZBZFXkAiK6cVj3KK
	i2uN5ySMSERGcmBNKuG95VlvQIHRiC4KgvWHb+9tITYgj3qv0kLKH2fqxgkkE2Zw8Zdk2ak5JpV
	yJd9c45aXYrChofkMB5dwel7y38Vl3KiEJ81bdwPIE3aWAYFn9uOL7R25euJXvFKTrYEs
X-Gm-Gg: AR+sD10QLUM+DD2iMQg2HrnAGfsDaSQ+KItQBVCRnhvnQaQqIX0u1yQ9+ywgp9gy34v
	7sHh+PLzHWhn656a9vLujQ4ZpADzE2wcnZmmxG/aK9GVtDrgKinxHehfHXb7sTlg5iLuWHSAp4T
	/GOrnzWCL+0p69uibDmHfL+RlPw9fKFVh/D8GKbtx++OpeVNJdOFFGeGBM9v45fz4Ez2foqvY1c
	orASAF0nr2KBy5sd1XOfZGrS0z1JGvuICkIdLR41fth9rLW/qNJWUIUY2W44OM1vD46N4ZCVjJ8
	24R2t/vMCI+VRlIB36RXLT4cokI4IPl2QKCDH2gH8Ai4jJGcLhzKvcx+6OgQ5Ca0/zId5SJI4kR
	7awUX0EdpqBOVTpo=
X-Received: by 2002:a05:622a:2446:b0:51b:fd82:22e0 with SMTP id d75a77b69052e-5283dda8f00mr18586181cf.3.1784795198939;
        Thu, 23 Jul 2026 01:26:38 -0700 (PDT)
X-Received: by 2002:a05:622a:2446:b0:51b:fd82:22e0 with SMTP id d75a77b69052e-5283dda8f00mr18585941cf.3.1784795198268;
        Thu, 23 Jul 2026 01:26:38 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.163.114])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956b0266ccsm85614305e9.3.2026.07.23.01.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 01:26:35 -0700 (PDT)
Date: Thu, 23 Jul 2026 11:26:33 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: eliza: Describe the CDSP
 remoteproc
Message-ID: <sysg3t5eygzahcm2trpktny25x6jej65fjztlwuxamq2a2dh7t@rfoldrm2eqhz>
References: <20260721-dts-qcom-eliza-add-cdsp-v2-0-e1e52bfb3c12@oss.qualcomm.com>
 <20260721-dts-qcom-eliza-add-cdsp-v2-1-e1e52bfb3c12@oss.qualcomm.com>
 <33arw44e5cnz3ui54f442rkgu4smczb4fwuyiouxo4lvne3v7e@t2tl3fsq3cxf>
 <gyjvnu2mljqdvwn55z42tjrvtmz2nrqrsxi6rclsk2ubnehnw7@wwm257efnqyg>
 <sypbfhwfovwwwg4hx6loyqocq5h56vg3v37iklvj5h4bdxnov7@hgtrnd2byond>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sypbfhwfovwwwg4hx6loyqocq5h56vg3v37iklvj5h4bdxnov7@hgtrnd2byond>
X-Proofpoint-ORIG-GUID: AZry8aG259qytre8T-pA6YVcYAj3Feni
X-Proofpoint-GUID: AZry8aG259qytre8T-pA6YVcYAj3Feni
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDA4NCBTYWx0ZWRfX0wpgj+yoF3UC
 Bh76D2dP2rGX9ll9dVzrSpc2J95rBKeWJF1GbtciX8d1hpsp4SZF8ehNGaupdxA/WyHdadn0Dt4
 ccct5xKuwtdutYfb29KeHczlktOodss=
X-Authority-Analysis: v=2.4 cv=L/ItheT8 c=1 sm=1 tr=0 ts=6a61d03f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=6dw9+iwJWV8PcCi9M4lOBg==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=27PokNdQq-y80uRLYyAA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDA4NCBTYWx0ZWRfXx2bTd53Nr8m4
 XdwngdUGZkTNtIcoJPkOKVWGaDM8gqBul/WikVGdr7Z7fZtyelSpeDLHYWQX2eGFANng+Pop7SH
 dzX0xPttYcdhavoJeTQT37ZD5sSq8LfjFOE1Bv9GWEpTljpGYyD3WxOZxG7ZUVPNLtHvqT32p4B
 OnQfDYDnX4Nf1QlYEncnTrV5zYsJhh+upiWx+66td5PcHLiqA0xyUnNzsvnqw2GePZGeOrXpDo7
 Dfy6kiMA1LshLOY2hLhVaXr2vPishLXaXNxeH7fFzPWPCvQHoeDh/qNq4OHCcGdYziAQS390U9O
 xhWGCAfkzAd3YARNxx2fhwt36vCVv8mRImYK5DnGC2LNKBN97MElgBCQMOUv6DzgTHZtZ9CwOb0
 a8kFJ/Q3Q4ZYGh7fQnFe0Q/ZlM03Ik16fWrBv3nAF6GXuozhIATYA62k1A0eUElLBjGOmB6PYBe
 u/IU8i6fmhy+NeqHH7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607230084

On 26-07-22 16:10:07, Dmitry Baryshkov wrote:
> On Wed, Jul 22, 2026 at 02:01:27PM +0300, Abel Vesa wrote:
> > On 26-07-22 01:30:27, Dmitry Baryshkov wrote:
> > > On Tue, Jul 21, 2026 at 11:25:48AM +0300, Abel Vesa wrote:
> > > > Describe the CDSP remoteproc along with the related SMP2P.
> > > 
> > > Why is there no glink-edge / FastRPC? They might be not yet supported,
> > > but please mention it in the commit message. GLINK should probably work.
> > 
> > I'll include the glink-edge in this patch.
> > 
> > The FastPRC was sent separately, later, because it wasn't tested in time
> > to be sent together. Mentioned here:
> > https://lore.kernel.org/all/20260721-dts-qcom-eliza-add-fastrpc-v1-1-cbea68d8e01b@oss.qualcomm.com/
> > 
> > I don't think commit message should talk about future work though.
> 
> 
> I would not 100% agree here. It simplifies work of the reviewers. If I
> see a DSP w/o glink or FastRPC, I need to think why it is not present.
> Is it something which doesn't have GLINK support? Or are there any other
> issues? While stating that abc will be done later saves us from those
> questions.
> 
> For me it's similar to the USB support. It's not infrequent to get only
> host or only peripheral supported in the first patch. But the commit
> message needs to specify if it's a hardware limitation, a software
> limiation or something which wasn't done yet.

OK then, will mention in the commit message that FastRPC is submitted
separately.
