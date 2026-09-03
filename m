Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43A44364052
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 10:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788431350; cv=none; b=ko8+JQB2p07Lp9d6IGt/SssjKiqRMFM96OrgDsNVreH7Ny21G06+Fj9dLCh7HToLjG9vICEnvRsDUOUvItAjBvhFEcO9Vi+vNDC8t+FksMvdBIscZD9FIwJYDHF5lvI9Z/uxR1weBpHucoPZqVXalaUBtFBoP4UQl12K9YhU1nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788431350; c=relaxed/simple;
	bh=CtuOHhvn0E4TUbq+OgmjX/oKyJCWZnbZHedFjAHUIx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cByU5ZqEd6upbXomQFNB/Tdhq3NJVh0Qoybo+Sv8GutmMnCVehbh3hze6rF5nJnOPAmBQ2N8EzfzyEk6yjuWNaOY5fppXeBdM7Nx7MG9pUVA5Gdw88pcRSY7I9B1aikvkUh7nJIpdizkbwF6QfYapJP5EzJDOB//nmpO+zT/KPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lxqWMWe4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W7gfJbNv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lxqWMWe4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W7gfJbNv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHMi73852419
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 10:29:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SuqNuq60cUzgkmpqOuziq1QD
	J8ux+Da3AYrpkY/+xrE=; b=lxqWMWe4qnCyBvmHdjEM5dLf8idwz5n4wuUFgXUs
	C477Ew+mWjnLxwGd4KMy/T7R0Te6uxMkkR4FtXaDzeiUsek3CiFyEK7eLBfcfglF
	c8g6iJxvq5tQPTwecI6qy9gBZmI+Oz1WVZg/vJvL2ls6cMFh24Na1306eOJMpnF4
	ToU8pEh4ohoLKx4v2ru0X+U94RvtokE1noMn2ll7O1Zdz+IkYYbt+VvAaaqCaQwZ
	w9/xpVKrVSoncOP3LyKUVI+C093U1DQ2Ackjy8l1aU8KaTOpP/INEA4RRE/Veuz+
	oaB57ydOT8jbkgMC+4fwt1x8Cd6ipG86xsE+leoCYcMhFw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf51m0ksu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 10:29:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-938153538caso426713385a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 03:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788431340; x=1789036140; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SuqNuq60cUzgkmpqOuziq1QDJ8ux+Da3AYrpkY/+xrE=;
        b=W7gfJbNvKcvJ6pRXMBLaGA0smcCOyVeWwSE3SW10cHeJw4d1E/4CsfO9TFgAY4muzw
         JeB8m/OJNGwxIXwmr/x3/IOl4IeSI4wmNiiCZqBOKCpSjRtniCM0oST/Q+CnluIDgKuS
         ctS0/r1sfZF/jcIGGlk5IK/2noDespDxqQ9lMQz4idBP1VM4NrgZLYiwK1YPCAXQz/FL
         GIMiGX5op9lW5BpTJ4tSIrZfUqPWZOP2BVUkGvaxSCAYmM7txMU8/yznbMfPOtMGUgUl
         bwNieb73kgNK++HjyGX92Ai+uZFrf0V9RW7afCYUoR0gKyhH8AcAMVxxg6EzEJbd5/Q+
         nCPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788431340; x=1789036140;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SuqNuq60cUzgkmpqOuziq1QDJ8ux+Da3AYrpkY/+xrE=;
        b=phtivE7l4ElNs2ZTmK9hCO6/rynrgUcrj5plGdVcbRqmT4+je/OiVgtNaNwZDXeSen
         84oaMok+L3xoWnyGJGDeeWgL4X0RzhnoHJDfwlbtul11c733hCUOpCrUbRGQD27r6j13
         0VUPKbBNQopVdf6SjidNgn6LVtqyx1lEdXehS51i1izPzlszsrwzoRcDnk/TiO6w/haw
         EH1DDdEOLg3ILdlKOy39pfn4i+LQnA/2GNLajHpPDPl/m266tHxDrqT2f0p2yhxY3z7d
         WVq2D1a2QeLjx1w1pL3A6qGLrR2Z4wUKjorxhTB6eRCd0+pInas9GHiDxS5P9sk2lkPo
         nJ8A==
X-Forwarded-Encrypted: i=1; AKwUvBxLfadcTb/8AApydVSfx35zmAXqMfeTPv664044862jR4iv9dJQ2T/Q66PNU8idWtiEaGB6VWrlHaX2PmAY@vger.kernel.org
X-Gm-Message-State: AFuF++ntdS6/Ie0WH5PbNqdLtMdb30PpRNzYT0DV3c3A4lN7N23SxFCj
	n2++rC52c3/qy7TkL91jMhMLlwNqo//RY1qUUIpI3DcFwIhq3VXN+etZGYlCdebtgAZRG1t/Nu7
	btC2/XPIVKRiYWs979tZaUweWI4WACR1ayvNeo/vEL1sWKGzOvHfGnqz3pvtHM4Okcm3U
X-Gm-Gg: AYBFou3+ol5WsHu9P9ATTfP3ao0o5DvIM80Ur2js5sV28U47B+knrsY0W0KWyHVFrMG
	Aoylptc7l21abWvsfZ8RAF9o4a6O7r0AdpHZuHHHyqXyihZFPlLMAykZSKOaI2UoZBHPQxTA6zq
	D7P7jITW0FCGlPGCcLE+MfKrywTYhPAavQecuAt4dIgaqDdbD02XJV6i29FOTAXQewGXWjmC/5y
	u85cbKQPCFmlFi9z3NjDLIEDkZJ/1aaZepd2UPqZ61aT1cQL7YvWtDKZ2Wp61WNwMZnYgcpAKfG
	ffKTNPhtwbHu9A0z+rkJdg810G9oC8T4sLCuH0oPxari8e6Gfrr6AjHkBGK8EvWG80X+hLgZZ2g
	ba/TeNM70e9Nh
X-Received: by 2002:a05:620a:4443:b0:939:e62:bf0c with SMTP id af79cd13be357-9396e2fd194mr427630085a.4.1788431339618;
        Thu, 03 Sep 2026 03:28:59 -0700 (PDT)
X-Received: by 2002:a05:620a:4443:b0:939:e62:bf0c with SMTP id af79cd13be357-9396e2fd194mr427626285a.4.1788431339137;
        Thu, 03 Sep 2026 03:28:59 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-484492cdbfbsm12766527f8f.33.2026.09.03.03.28.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 03:28:57 -0700 (PDT)
Date: Thu, 3 Sep 2026 13:28:54 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?B?SsOpcsO0bWU=?= de Bretagne <jerome.debretagne@gmail.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Konrad Dybcio <quic_kdybcio@quicinc.com>
Subject: Re: [PATCH v2 01/16] arm64: dts: qcom: x1-crd: Mark the EC reset
 gpio as reserved
Message-ID: <axdbfl44qebnc5ntwc5iuukuem3ob4hngbhzmskd25yb6h56tq@cxuq4mu24ugp>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
 <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-1-f4ab7e4bb75d@oss.qualcomm.com>
 <3f26bf2d-19de-4cc3-8af2-c26601da2576@oss.qualcomm.com>
 <ygyu3t7o2p2xvm3j5wrxp4svzo2rzymvzgod2szhz4z57elc7a@hznrw2e35oen>
 <182336df-b505-4ae4-901f-e09c0eae80ed@oss.qualcomm.com>
 <vjgskn34g563t3hre3ypg7ocueywzt66o6zusohqnzetowfwik@nn6yaq25jono>
 <c909e82d-a94a-4e56-976c-ace85080133d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c909e82d-a94a-4e56-976c-ace85080133d@oss.qualcomm.com>
X-Proofpoint-GUID: GKUCmaY_I1pilt7cLEwOEUjznGBApCsX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5MCBTYWx0ZWRfX1qco0IrlDWQ6
 jWnj7IWkGiicH/b+iJby0SLBgnNtiSIovKycDqR+kDLC+DXIfslg5W5/FxqNJIGdSyGNpmXQ+48
 FfCTXUAl+qrITJexfu1JqPorCtCWy60bhgNDeRqtN7pOFt99yHYG2AbXnD9wW2ZCJGUYTJM9fpD
 JAyJ1TzwSKZO121uL4Q0TvDWU1jM7u9PLSs0HUKO0Ajq/fafWg9vc2qpu7GSsnkTfV1z/KDIbdb
 tUSvhW/LE/ntrKwIpuG5isNdY6+83lovUip5TIFFczbtOaHhs737WjrUSkT4n8D7Wz4IJUxLycP
 V9ODxzymSbf4kx3Pm/R766bVEXyLmaAo51FutETjasEzs1Iz/uBvuigLi8xn2kpxLGbtfLMEL3r
 4U8tgFF/sbIlOe9/MaLaccVWBnRmnDGAB8cODBix34MEA5L2JN3ibXfeHkZMDlECubK3jTqIhp6
 iztA0QlVy4WEU9x71ag==
X-Authority-Analysis: v=2.4 cv=X8Ji7mTe c=1 sm=1 tr=0 ts=6a994bec cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EBSKJjQULo7IWly0vkUA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5MCBTYWx0ZWRfX9sEEKxTThY/x
 qT3tafYZEaz/A2LkXMlag163Z2k+lF99auekV4FmHdhp/u+GzMUTGaU9UvGwqnY2cmujtsnR/Y1
 Zhj3KLVTr99O1YJQno1dsqZI/S2Ekjk=
X-Proofpoint-ORIG-GUID: GKUCmaY_I1pilt7cLEwOEUjznGBApCsX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030090

On 26-09-03 11:37:09, Konrad Dybcio wrote:
> On 9/3/26 11:29 AM, Abel Vesa wrote:
> > On 26-09-03 11:16:20, Konrad Dybcio wrote:
> >> On 9/3/26 10:34 AM, Abel Vesa wrote:
> >>> On 26-09-02 17:53:23, Konrad Dybcio wrote:
> >>>> On 9/1/26 10:06 AM, Abel Vesa wrote:
> >>>>> GPIO 65 from TLMM is used by the embedded controller as its reset line.
> >>>>>
> >>>>> On some devices, toggling the embedded controller reset line makes the
> >>>>> device not power up at all, unless the battery is unplugged.
> >>>>
> >>>> Have you confirmed that behavior on the CRD?
> >>>
> >>> Toggling it does nothing observable.
> >>>
> >>> However, the documentation says this GPIO is actually tied to EC reset.
> >>>
> >>> I still think we should reserve it, just to be safe.
> >>>
> >>> What do you think?
> >>
> >> I believe that contradicts the reasoning you gave in the commit
> >> message then..
> > 
> > Yep, will rephrase it for this platform as:
> > 
> > While toggling it from linux doesn't seem to have any observable impact,
> > since documentation does confrm it is connected to EC reset, lets reserve
> > it just to be on the safe side.
> 
> Have you toggled the pin into the correct polarity? The EC FW seems not
> to be handling that pin at all, so I'm guessing it should be just a dumb
> chip reset

Hm. Good catch. It is actually active high, and it renders keyboard
broken after EC reset. Also fans start spinning full speed during EC
reset.
