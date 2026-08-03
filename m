Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE73B42EEAA
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 19:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785784187; cv=none; b=ffjfl3rxU4WS212gyfN2m8sQdaqbk9CCfM8MM2T0JSdh42Cmvoo3CDu8X0iKIrm0gADCRgGAJ72lYTcdL6TnHyFo8wFq0+w08g4FHX20yd6e9mp10Q4qLPrKBO6gF7d9UXf88jdYi2kMfluBwrCKl8SkZyIgL7rX7ZVnP+4pIFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785784187; c=relaxed/simple;
	bh=Rmmd8CUZrD78yp5jRVGRccCxdhlc6zmp+lGG+y3hdO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CsHYf/+fZ/g527hF69amyuFqzbFAZ/g9/r+tyV2zm5rE062V8L1e1IRQSdGLQ52CYCAIOsKGWFNaokt+5lM3Cr/kJ50QuIYTpHKdtYIvuwmsjO9JYu7Exa5rtFRC6TFMxzX7Hg7uvQByr2sUfUTXIV6AAGBwiW988zBV3xbboq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lD42B0K2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W47+qji8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lD42B0K2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W47+qji8"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673GwNlu1530037
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 19:09:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rGz1Y18dNb/KJayXUCubJBtB
	boeTWds/Oa3F5Jt8iv8=; b=lD42B0K2m6dfc7LWw6YNsNbUVPlGXSCKvkqOEzFi
	SzQcaL+ZJAHyKrQYjDuGaN7Pvk7WwE3Qr1/Znix5vc5qEJ7d4466SYRSTWKTnhlA
	8U99Qpw/Bhe22Y9ORrCH3b2ixsmXQ/vMMsFr5pA8mPFcMcgH0Q0sMf6yO8Hdoprf
	CYf/4pCAs66Ggk0GfXdtN+OT/85kPfVsxIriAT47z51Ca8R7Qe72Dmaxp/MUjATy
	KEKc5pXKaUBwxYyCEhQSDSpCSqHd6shPytUnjV9+j0lIaGJidxYmh29pz7DIaA52
	0lYwnyrjntyDF1VVjxp1NPg/3bgyKjaTIo/o7drldDb85A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrbb94p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 19:09:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51bfe3fa93bso35660651cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 12:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785784184; x=1786388984; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rGz1Y18dNb/KJayXUCubJBtBboeTWds/Oa3F5Jt8iv8=;
        b=W47+qji80W5Z0I3S3VynSGYbqs5YLdWRHMyDHaC5sALW4SQ/Wo1Ds7/6y1HwXm09kq
         vzMU2gP9UG+QztRyZrqf9YsZLAbxG6YWFZdQ+iX746GP2Q8mkjIU4ymYjEcAorhVHApA
         cd/TA6F+700g162JDlbEFhqQyuZxX4hRRDuhhl++LIMVUfVGgfW1WtBwcn0Yl0Glj8Em
         K4wzGtHtThb6+FURanptL0XYHn007GwCyOCppbWOmIRuo3LvnjpzEug8Qa9mXqyUI0Hn
         9r/22iYh+Ooqy/JkZsUrw2iVLquutXEuIey1A987RvEV7U55aA9ZNgdyph6L23Cf8nF8
         L50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785784184; x=1786388984;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rGz1Y18dNb/KJayXUCubJBtBboeTWds/Oa3F5Jt8iv8=;
        b=rox/igR3JncGEqtM4Nn5LEBto37VkxnjlDyiBOUjdQg8oA/XN+xOUQ3S0EbdqG7Lxf
         3iK9vkYAEC9oMloRdVlj7iz9gaUB91a1Vl0mhMw7JpIV6MM6ZlAjrIA3ed6TOxvzLhpH
         XhzA+11xw6kM3DmgCp9fS1z2xknfuwmNYgu0y9kW+RAM3R3EOWze5TjuctTkdApeG0Mk
         hQ1brLEExFFl5OxDeVcQEv1S5m/mA+QImKOR5H0OLz9YUn96sR5XZ54lCS1Y0TJ6WfUB
         qkyOLnWLqiRSXAYpy6h8lPc4ba0bH+zXNc1Ka5yY+i7rmoHh521ey1PvvOMrxv/ynKf5
         kfHQ==
X-Forwarded-Encrypted: i=1; AHgh+RopOdrq4qEmRvsT9is76bAB+K8aAACRkEHRcvhiXuHslc4oZ1I7Rdg4IvhktkpUuu8vFbmtz4M5GJJIHEF4@vger.kernel.org
X-Gm-Message-State: AOJu0YyK33mmh6MKIHh0udxIf4vVzXzx1XWLKMS7zPFvAtTRn4m0xnJK
	jl+9b6BAkAWdEOh+PJCDjGw9YY/7o366RJldKPrU9NEYkasvpnj/NCJbZog3kRt5nlOUgJ4uE0m
	EpBANSWwOp+BGrlaXyodobWcyLFcldaOPoDv0Zoz7qH9nIbNp/dGuXZBMpFwk+lHDaGfKt5qaP5
	C0
X-Gm-Gg: AR+sD10WbXJHIuRNVBhgK9Lom/6CKmn7fRcEK1d1w5DS0GcRbiyUzUsfUknU8/kxinI
	Fbu0MQlZAWVYpqhU7aJ3cC/D01bCiJ7UkPuYxQgcEGALGtzEHoPOcV1E3X7wQYW+3NspwxUEbCO
	LTXvd//AVkRZF4PjNNxj1rQPQG4b7pbMXfOdnsAOABxTp+skWfyLm3jCQeAs4YX577W3MEfvvAP
	TGLfvElUdipU/yPK2Es/ZS9j6/UyJO96wIh6kuM1Pgq+Q6iFAS45e9fUr5e1xaxGxA/Y9pDhQoA
	ha8da1OzEOnUp+vJhla4NLKqZBnFhVErdmFTT1XV62OsTi1rMqMmnPNBINFBGXiSpeyRO5DXVqz
	yw4XekXWj5IOmMOchlPZnbNXGBBKsAeEaVp+yTqR87d5TC9N5wsqSSOGKiSalkF0waTmYDER++M
	MIB8a0NSrtPBhCFw==
X-Received: by 2002:ac8:7f45:0:b0:517:78c7:d93a with SMTP id d75a77b69052e-52b567a8c0emr202339751cf.16.1785784183866;
        Mon, 03 Aug 2026 12:09:43 -0700 (PDT)
X-Received: by 2002:ac8:7f45:0:b0:517:78c7:d93a with SMTP id d75a77b69052e-52b567a8c0emr202339351cf.16.1785784183434;
        Mon, 03 Aug 2026 12:09:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e23cbee2sm2211688e87.29.2026.08.03.12.09.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 12:09:42 -0700 (PDT)
Date: Mon, 3 Aug 2026 22:09:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: "Gjorgji Rosikopulos (Consultant)" <gjorgji.rosikopulos@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        linux-media@vger.kernel.org, mchehab@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sm8250: Add JPEG encoder node
Message-ID: <mpiuqkxaq4bvz4pc7iug3aoar5jkxz4tpetbg72olrzfar4zlc@w7sgfwfksl4r>
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-4-atanas.filipov@oss.qualcomm.com>
 <ln6tr2vwv6zmoo3kcivjjf3rqjxqm2fltwcpn4kk3iphc4rzlb@qdpop32fjm5l>
 <ce631db2-8e8b-4b97-8164-c701a1b0dc1c@oss.qualcomm.com>
 <qje2bZKWSzkQQGDw0traOE7SqoXhCBLeDrilCooH6Vh6cYeFWAh_VyhqspJuzVs3iA4ye2U75aZHsVGorNPjPQ==@protonmail.internalid>
 <476aee61-015f-4793-9be7-a102c1c3e811@oss.qualcomm.com>
 <3e8b2574-eab5-4c34-b400-c75312b9a772@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e8b2574-eab5-4c34-b400-c75312b9a772@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE2OSBTYWx0ZWRfX+hfqxqx0QXBL
 bUdNCdhB0LZAcZCK4NPwQe5FHHGPCgz9YCCHhSNnJn9uzh4MVQtaGIVv/IttNsOwUY+Vyc1vcYI
 dkErsRnQSWKEbk6uGkpVmeo/8WHhWWM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE2OSBTYWx0ZWRfXxhVVsJ0F3rx9
 8qMczqaXqZKdU67GgMhqp+i+0um3zkmAVuS1WxDIU48GrVtbc+Fo20vMAaez7PXgGcH/ExPYws4
 b6EoW+jGfb3wzBXCGH8ZMxYNkQNENHZMqLllw/2Qv6nRA/GV8wJOSlxzr2hjbUPfgglWTAc5Q15
 IxRayG+ijoMJVqxEhni5WZAV9ACMt/R1OFBkKKr23goRIc8+ORJIrcz5LUH3ozg8vLVLwxmuy5x
 nje+7j6WaN8LAgvC8p8/esRBOreq2tXGmuFw/rACfc8WALaXDxRhwHdvGrIvh2nqjQbVNSSsE0X
 c2QTezWaLwl7WyizppX8XuSvX7IcbxJi+Opjfu6f3q7f5vFheNx8jRKEgoF2zGQ3tQYEpvnLIk+
 vU2gEDRDJk4JLiu2brwBlUO6DeepwtSqWJSGWyRqCm9iS/fEs2LU7/RySdA8iL2ERj7O+c2RyFt
 Tb3y13oV+MQFwaiUN3w==
X-Authority-Analysis: v=2.4 cv=RNSD2Yi+ c=1 sm=1 tr=0 ts=6a70e778 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=oQmaG_OvwICbMNobdCMA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: qKZwxKwg7v2l6QGDzLpvNCFxRU_6eM83
X-Proofpoint-ORIG-GUID: qKZwxKwg7v2l6QGDzLpvNCFxRU_6eM83
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030169

On Sat, Aug 01, 2026 at 11:04:10AM +0100, Bryan O'Donoghue wrote:
> On 31/07/2026 20:30, Gjorgji Rosikopulos (Consultant) wrote:
> > > > Is TITAN_TOP a part of the MMCX or CX domain? In the former case,
> > > > please drop separate mmcx vote here and let it come through the
> > > > titan_top (it might require camcc driver and node modifications).
> > > > 
> > > The change was requested by Brian, most likely in connection with
> > > upcoming migrations. I think he would be able to explain the exact
> > > reasons. As far as the facts are concerned, this is not currently
> > > necessary for the driver to be functional.
> > In the documentation we have this jpeg block need only TITAN_TOP_GDSC power domain.
> > However Bryan request to ad MMCX and MX.
> > As i can see same is for csiphy. Maybe is better to sync with Bryan.
> 
> Check hamoa - I believe it is the case there's a separate vote required for
> MMCX/MXA.

Assuming TITAN_TOP gates MMCX to the whole camera block (please correct
me if I'm wrong), why do we need a separate vote on MMCX? I might be
missing something here, sorry.

> 
> I'm prefectly fine if all that is required on kona is titan_top_gdsc but,
> basically I'm asking _you_ to go verify the difference and come back with an
> answer.
> 
> "Not required for Kona we checked" - its not about being asked its about
> checking what's actually required, I'm highlighting this because sm8550
> perhaps and hamoa definitely are different.
> 
> All of this is in the power-tree documentation. Please find the place where
> the power-rails are stipulated for venus/iris and then check to see what's
> required for the titan block and represent all of the necessary rails in the
> jpeg@{} such that jpeg@{} can run standalone without any of the rest of the
> block switched on.
> 
> I'll trust your diligence in that.
> 
> ---
> bod

-- 
With best wishes
Dmitry
