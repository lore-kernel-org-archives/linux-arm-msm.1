Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793972378;
	b=uYFmQWOfZqRxzCzS494rWO1y70ExbDlikqDebsSreWOzQVT/OdGQHXuVhgk1zbjLJO+J
	 PGv4KTU2IA/EmQ5bQU4f3F2Rm4/mbcjH3ws6OIzOnAbGrOGiExhl/qZls0uLx3Jp6B2t7
	 BtZnxcd14XogsMx0GZaxkcP9LFq6111aFIBg939cAnJHBe6LaPt76waxP4PobHUjZVRMB
	 ddJSYArcpawozES7Id7rl7cxu4aEO3G8asqTgMWEnkdMFgXQmCCUyctIo4Q6vVlTPDjhQ
	 mGLfOLEPk0rUEL7rZtApfL/nUlx1n0RQA2pUdrFJ02GyPsvNDRGbaMvYqGUOxWuhJ4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793972378;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=pjCkhgBdLsL0cjYhnAXlrwHE99yz9ZM1gMqesSt/VaI=;
	b=ebLPUuvUlutZnfegG2XNrv1/qq/s1Ju95qVhaEjarSC/+4yj5rqeIi4P1V+PUZeSBo65
	 S+c5rpcnR8xzw3rklBBOH6NrXCogb0Anj5Hy0kUv7FFJnTUixR5emtr7uFk2pxaFX73WY
	 +9Zl6YMw3N98rAnF3jMZ8FdwBR6DC0izYU1ZRbTUrTEjhemEve9fQQnevFBTFETS2gX7A
	 /8zuRJGoZwx41lj71YpWRsKrt7lxWwVh5EVJWC8eprftSGOnjTHlbBZRI1ji4Y5Zl4wRj
	 NfgqvGJESA3MLORRgErIO+EZ5sFF1AN3buX04ssyS8hy81jZwCPWKbTVPhdcq9CuyoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R5TjOCec;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ZaU///b7";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750D7606A329
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 13:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 750D7606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=R5TjOCec;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZaU///b7
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6APCov2076163
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 13:39:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pjCkhgBdLsL0cjYhnAXlrwHE99yz9ZM1gMqesSt/VaI=; b=R5TjOCecc9muQl8R
	h26h/Le07HzjtoUp+wJVOCRFnN2h4FaExz8ijnLLxuDxS5fOilpDu9BBf0IHLAAj
	jQ9j3v+y0/blM8qgXtI1WF5Sd16R3NRpzCvFjDvdZYn+PDpB8am0hwZm5YP8Xnf0
	M6uxhfR/z9Y1s9qlj45CYGxV6ovnvXL5kmvqitK6mIzXoyl1sj8zUjicwl/AFUyS
	VW314nC3v9GHAtC3/2NLDf57x22ygKRhGWi4LzCoCpkLJZLGORxLghFNd/k04f+o
	44NN01JxIaeV9WMVS+tY2TNLCouWX31vX34aCL1h8zRGdrbqfqilLBZMH4nhokqT
	WN1Kkg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pcay0a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 13:39:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so151742785a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 05:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793972376; x=1794577176; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pjCkhgBdLsL0cjYhnAXlrwHE99yz9ZM1gMqesSt/VaI=;
        b=ZaU///b7O7HiBTaQ3y4PX6SFJJChgg031LFI3yqwbT7nn2Q5rX5b03GW+AvOGreCtr
         L7fDU/PLx0NdgwhjE4pBDyotZH2rzq49775a868A7qfroCpnzrA1Nxr4uVlLTifnUDql
         LnUx7lT9iY2n1y9Q26JivOjYwfLxYxZGWiEn587tzGFv4hlDqDhN3V4lXqa/BNVmOQwL
         xB+s/vgSLtkC2d6oJPxheXkM31eRpV1D26CxZifNYUd6P3t5bjdF/bfbTdHJ0J0JVTlN
         rmlBjlp0+tU17134hxRkb00XsWp2mJ3s8UC71epOYZAxSzwdyUS0reKm4NODfWaaMzW4
         LnqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793972376; x=1794577176;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pjCkhgBdLsL0cjYhnAXlrwHE99yz9ZM1gMqesSt/VaI=;
        b=pwqo4ljig2oUS05lj9VWraImfwhqAsHR3un88uGlqnCukBqUj478PyU0tBfN8avC2b
         FQ0oDpCESARtWeZ+ySOzs13AtXWWH713QOsiYfMPMRrYZxnV5gKaQSKDzg1tEbUSu7Vl
         5Yp7SGKOjBdmVVG23yEUCcr+phWSdzxXfIl0cdxAjtHV8GAlG7NIUFl7Y8MCHeqGsJOs
         5X6VwtYe+pCKepJMTPUYPV0KDDNtpZu5N041txa8pHaxJG5WcAYqMtQ3CeniymqaDKsH
         L3NxTAiOD5eLoVXu8x/hCO5VhiPkE76ct1F5E+08umQP8SezvAuO5Gf/76gTaIEqwJA1
         z97g==
X-Forwarded-Encrypted: i=1; AKwUvByY3VhoNM8UYh1aGym7nOdOb2xSide+FeHax4SEWgOjr0PHIkl6NjU/OBzv44HZysMoc8lEMOa+MaMLl8Zk@vger.kernel.org
X-Gm-Message-State: APuU4Z+niqwoDiRgWlL9TeimG6hGk4evp4Ah1UeiJZiWeWIf85hB9ko4
	Gk28crr2Q0DrTJYMidcuMkyH83jRqssDOp0s0W17KahabsT3RTKwlIeVCTND10GccCwxfvSyFgB
	n8E/TGqkM4hRzMBt3J2KMVpIM8JbX196fi9ORuEYIKSBh8LnbN0pi2MKmZmaOti/QFnAN
X-Gm-Gg: AYBFou0+ZGa3WI6i/ZK3ToFCv6Kl2k7G+8qtOwA1JpuoHYGaSoHWThg+fPHCI7n1Ckq
	FziKKlOkcnjLbbxqDNB0byYVdDMalqmfkHuApUkH2SfJ+nfTl23DlKkmddquLfTFJrbfpfFMQvB
	pwQMvEdawWaWu57szQMmFtVmqaVKkOfyrXPFoJc0oVMfOAHvVkItW6UDmvh7vLsdRytvA7DcXEa
	WTV4FEt8Up0ZaGP+E6WDOqdVWAJresY20+ekaWFHUDSTCYI9FOzEqAHSBzlMWWl3iceVZbb980G
	AkahJmB1K3WEHQKyFmHMNALqTrKvJeS5P+1DVPreJJzI4/8uEMBaanHlB+rBiEVeBXpN0r0/gdR
	uTpwCmkGnC/6pWW/g/c2f00CVT4Lp1BF1pH40MZ7l5Q/3hkGmpqyI2x/y0EkQBfiYr74aHH8W7W
	3BcqDcQ/kNdXQBB58H0Es9ZAVx3+O7ftUZuE3iTo30FVItZiCP9Y2nqbaHgZlD
X-Received: by 2002:a05:620a:a91a:b0:945:fcd7:7823 with SMTP id af79cd13be357-945fcd77e03mr112040385a.63.1793972376410;
        Fri, 06 Nov 2026 05:39:36 -0800 (PST)
X-Received: by 2002:a05:620a:a91a:b0:945:fcd7:7823 with SMTP id af79cd13be357-945fcd77e03mr112037185a.63.1793972375910;
        Fri, 06 Nov 2026 05:39:35 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c0030a3b50sm369070e87.79.2026.11.06.05.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:39:33 -0800 (PST)
Date: Fri, 6 Nov 2026 15:39:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Robert Mader <robert.mader@collabora.com>, rob.clark@oss.qualcomm.com,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Bryan O'Donoghue <bod@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>, linux-media@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 7/7] media: qcom: iris: describe QC10C as TP10
Message-ID: <se7js4dwankc53n4jxmmi5qzcav6xbkrztrtdae3wcj537qtqd@syrjvxuv3apf>
References: <20261104-ubwc-format-docs-v1-0-389044012b4e@oss.qualcomm.com>
 <20261104-ubwc-format-docs-v1-7-389044012b4e@oss.qualcomm.com>
 <86b801ce-a56c-4ff8-8915-9be369fc0ce8@collabora.com>
 <CACSVV02t9=tm2qyG531f8Ne90ADAb1_ZDDGEg7PwDmoEvGxPrQ@mail.gmail.com>
 <7b4d3a85-6aea-4b96-a4d0-c2f16e488ad9@collabora.com>
 <7e8a6645f181c9e8d663eb97bb1f32e3e4fd8c67.camel@collabora.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e8a6645f181c9e8d663eb97bb1f32e3e4fd8c67.camel@collabora.com>
X-Proofpoint-ORIG-GUID: 833h6k3LhSTdTsGXtL41HzHjkCtwnE0z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NCBTYWx0ZWRfX3/64AXi3OJVv
 wmlKahe/p/A74pRgcd1TVhLvT3VUPQdIWF9+LSG5455EGMZqRghO0sZbwnabxd91anoWSexPT5k
 4s022OV+Xr6t9HlTosZdoaFFI87QTKX4Qicb2by5cXO5/fPr0nu7GE600PiSuW7TpyJYH+YuT63
 tIKmwijnumHyI/4F5CY3/tFpWcg6WCee2RBtGHB+4Tpb89hF4kGnisfH6bMbO7bzy5ocaPZ7FTe
 KKDZZuUeTm4pylYQBMCNdj4MCcSTtPQGC5wDX/r1e+hrFkNbJamKFYi8chIX42P6L50qhd9EZrF
 AIELr+tpweZ3V0cRoVIYtTUtT1fJhxLmM0TmuiSewDJQynGr4yaZ5tHmb96Vwz/q63mNy4UXCG5
 s2Cu3TmfUcjpwp95fE6b+MPYRQIcbSLO95bm1Qin3pBd6Ix6CcL6rPBgFRUI3YYGpDDaTLauFoR
 0M/tVyPSDMHDRwHCFBA==
X-Proofpoint-GUID: 833h6k3LhSTdTsGXtL41HzHjkCtwnE0z
X-Authority-Analysis: v=2.4 cv=TI3Q2Fla c=1 sm=1 tr=0 ts=6aedd899 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=e5mUnYsNAAAA:8
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=g_Gk0hPVKUWBytyV-9IA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NCBTYWx0ZWRfX7LHwltEODAo1
 HcWVi+NuSBX253GlA8N6E9Dteg6my/x3QEVXBbGOul14QDhWaWhETlh4ZNriATdNUfh04/Hkvue
 3s6QtV+drOKGWOJKvLLuAnKCEf0uPAA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060054

On Thu, Nov 05, 2026 at 03:34:55PM -0500, Nicolas Dufresne wrote:
> Le jeudi 05 novembre 2026 à 13:35 +0100, Robert Mader a écrit :
> > On 04.11.26 23:11, Rob Clark wrote:
> > > On Wed, Nov 4, 2026 at 11:00 AM Robert Mader <robert.mader@collabora.com> wrote:
> > > > Nice, very happy to see the series!
> > > > 
> > > > On 04.11.26 17:36, Dmitry Baryshkov wrote:
> > > > > The comment describing the QC10C buffer layout calls it a compressed
> > > > > P010. It is not:
> > > > If I'm not mistaken the display engine / the DRM side (including Mesa)
> > > > describes it as P010+QCOM_COMPRESSED as well, and so does my pending
> > > > Gstreamer MR [1] . So if we can't pretend that QC10C ==
> > > > P010+QCOM_COMPRESSED, then we probably need a DRM_FORMAT_TP10, wire that
> > > > up everywhere etc. OTOH if we want to keep the DRM side as is, then the
> > > > comment should reflect that, IMO.
> > > IMHO we need DRM_FORMAT_TP10.. on the GPU side, we have TP10 and P010
> > > as distinct formats, both with and without UBWC.  I'm not sure if the
> > > same is true on video side but P010+UBWC was never exposed, or if it
> > > truely only supports linear P010 and UBWC TP10.
> > 
> > Oh, do I understand you correctly that the P010+UBWC implementation is 
> > not compatible with QC10C, meaning on the GPU side (Mesa and display) we 
> > don't yet have any support for QC10C exposed to userspace? If that's so 
> > then we don't have a choice but to introduce DRM_FORMAT_TP10 I guess?

Yes.

> > 
> > On the plus side - this would allow us to make the format single plane, 
> > matching what we get on the V4L2 side.
> 
> Since its single plane, we should aim for a variation of
> DRM_FORMAT_YUV420_10BIT. Similar to YUV420_10BIT, there is no obvious linear
> single plane packing for that, it would only be there to support the
> compression. Or maybe this one is abstract enough to be used anyway?

We have DRM_FORMAT_P030, describing this semi-planar packing. I will
describe P030 + QCOM_COMPRESSED for v2. P010 + QCOM_COMPRESSED will be
repurposed for the actual P010 compressed by the GPU.

> 
> Nicolas
> 
> > 
> > > 
> > > BR,
> > > -R
> > > 
> > > > Best regards,
> > > > 
> > > > Robert
> > > > 
> > > > 1: https://gitlab.freedesktop.org/gstreamer/gstreamer/-/merge_requests/8195
> > > > 
> > > > > P010 stores each sample in 16 bits, QC10C packs three
> > > > > 10-bit samples in each 32-bit word, which is what the stride computed
> > > > > below (width * 4 / 3) assumes. Name the format correctly.
> > > > > 
> > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > > > > ---
> > > > >    drivers/media/platform/qcom/iris/iris_buffer.c | 2 +-
> > > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/media/platform/qcom/iris/iris_buffer.c b/drivers/media/platform/qcom/iris/iris_buffer.c
> > > > > index eb8de60c1177..ec2bf2a2d953 100644
> > > > > --- a/drivers/media/platform/qcom/iris/iris_buffer.c
> > > > > +++ b/drivers/media/platform/qcom/iris/iris_buffer.c
> > > > > @@ -266,7 +266,7 @@ static u32 iris_yuv_buffer_size_qc08c(struct iris_inst *inst)
> > > > > 
> > > > >    /*
> > > > >     * QC10C:
> > > > > - * UBWC-compressed format for P010.
> > > > > + * UBWC-compressed TP10, YUV 4:2:0 with three 10 bit samples packed in 32 bits.
> > > > >     * Contains 4 planes in the following order -
> > > > >     * (A) Y_Meta_Plane
> > > > >     * (B) Y_UBWC_Plane
> > > > > 



-- 
With best wishes
Dmitry
