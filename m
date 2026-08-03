Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969F1391E43
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 18:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785782655; cv=none; b=G63c5lgPqrq5uXlMe3qyCvXU+1z7OdCA4uDP5Jiu1TLkuSlhyTGApCiBGA7lX1Z5HTD9/jI8IQ9goW4GKipYirOuyO0CDj7naeMt6HUqouFZZAlCOCjgAQib2u7kwh+aMjU6jMf6BMFofvazSLkF5qjyx1VqLrF8HF48mBSr35s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785782655; c=relaxed/simple;
	bh=bXAQQqF14Av9v8d6AoQGiIbXYyJTIWFFqvsdLtcEZ6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kl1X4GI2QVGSpHa7n/LuPvYxIQNDIXRmP0Spsz11mV4zQvHHJdIelpCe3CCdQefjiSpqoAMW1RNXHNINLDk5pOumd4ds/AvTnQWiaBeFSZOnMA4IOE919SiF/stASIDHQXvQ9/s70vCTDr4Y3Xg/2FcADIX7KXThxlsG/j49HOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V2dVuXAC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J7qICUsK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V2dVuXAC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J7qICUsK"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673GwK7R1529999
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 18:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+iePS/7Y1lAG3DI18rGJbRqO
	5Vf5QH2o/6p1ovwD9ZA=; b=V2dVuXAC6M9k3u7AxB6+oZbAca0OqJeUSbJXdmwU
	ltTniyUbk8RhRvhtkYN1Mp5iXXzwAP9214YJUiSJ4fQFGHMTR+GWapVtBb7fANOv
	iKZUCV8yIZChww0mQRDxXGgHCj2OIA0hiPesnzfQfPkAjfOOwewX2DJw5ckersVA
	Zi9A2Pa3kP+o74B9ibYZ5KFM0Mwj/r3Y4Rw0lWg9XnAXQ1+UVzA5VjJPp0+tK0RR
	tVCXYwhGEaUURbC2s8JPlyMn40rp6XR++BN/NckDHrr8T/OCyQ/4aCRqYAlnkLPw
	6hlzI1DmoSzw7wJi3CzTOGqnDYYMhXSm3KvFDhkfvjD1OQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnrbb4vq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 18:44:12 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c12e43b98so39467551cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 11:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785782652; x=1786387452; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+iePS/7Y1lAG3DI18rGJbRqO5Vf5QH2o/6p1ovwD9ZA=;
        b=J7qICUsKlcLVmxcTHrAi+p6FS2HIwBW1rx33D80R2yqTinzcK0M99wWdtZHI7AqzU9
         RZcSUjCBJMFu/t3muiHXuvc1HlB+GErXrXdwWAxRhuX9+inBc8uJ8lmbjZchdAUuIHKn
         tPKNauzv8on+SV3K3C5p1p4DvP9c9Z7lr/qQZpTKlbZ4yDVVW63UC5/cULo2Y4sv5cR5
         oE/VGjtWxA9kh5O6z+x/tkvxLCDP0Q/y83GSJre7kLHKba9OOjv+noW6KhWxVK+c/azh
         U2M2Gjtm62sd1Egt6ib/3aexCofKTbZEHgBFKjpLLOfHCEK1oLPCIZzulElbyCNusdoK
         L9Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785782652; x=1786387452;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+iePS/7Y1lAG3DI18rGJbRqO5Vf5QH2o/6p1ovwD9ZA=;
        b=GyosbJUCI/gPKMoaBvrXijm5Gv2BgqIo4gxSLg18cTRGhc5fXfkWHVtZwsR1clPN6s
         nS1yKvPBPNmz37ftwbP3KqNifa8a69TIRsLKY3zef2kCQd5xVQdXcnM8L65vkbET2758
         6qmrdP7rCyQBOFE8btKWrAUuWsKvUOclV3H6lVFghz1XM6N1n/f8oTrpl/8IGIRHSmVu
         G2CM3LMW/I/4uV49dCVKmjdoU58HPN0rMaVuuPO1sHlvB5cC0+eWyUBAhXzPU9LcvHNc
         LixpicLMpLaPZIM0eUwFon3eMDTagsB94GKZb3ForxWwoiMQw+B5RktXBLjW5eKkxbZX
         3ocw==
X-Forwarded-Encrypted: i=1; AHgh+RonJx45sBrXKks1DYGIpM6Jfh5AXmnjbPvTKPM/xcp6jBtaKXwIbK1tg3CGUzX9nQmggtxU3moXqUDMsVDb@vger.kernel.org
X-Gm-Message-State: AOJu0YzXE40JwtyCNWmoWzFkeF4vfpXGe4xGMWOLXb7TPnkAPVrCo/yp
	sY0yj4u+G/Bx2nKtbc7tLpbtv5Qx5I/qyoogkKxtLSY0eCqhWQGAvE6cviGF2Y+dSdcvFvMbnS+
	0tsGiV2iCFEU5aFs4ZZZyiir32zj4Cgw/0wjB34RP+rRUxiJ5KZJbSX2v0gKjqMPgUoO0
X-Gm-Gg: AR+sD10IwOKQp41APalvc+yRggapqOAZyMZv9rAf+peAlIxHXXLJMq955A0DQBnPWy1
	YKSuSmUSHLJ+J8QCiMZapkhuKQmfGkkI2rciggVaMzSoslj9v08PUkwr44qvuMAgzKdfEsbO36l
	oYmkqx4QR8LS2Cf0jQOnJYY9a4CE/QwNzfvOVfgdswe5wyl7i6u18coym9N8y4YY2K1DiiYRZz7
	cRbj2C0OV7Poj792Rz4Bv1XXIamn23cXp8eklIwE28sm9IUi5mP5/HdW07B06S78kNfsYKHKWe/
	EIs6dQ6yaJQXSW8InlZlUp1M1cDRvGf8EZ6RkdgoJHovA+rImwKdEp9nn2/cBcfFGkD2jTisecJ
	iuLdvKUzVh5kxi2RvgDYjpgiYe3qYY6E95lNDROXbhSVc8TxFLAx8rOP0/HcMdmEFcFsBVqrkUB
	bI+qhBK0L+zyahog==
X-Received: by 2002:a05:622a:14d:b0:51c:1c2c:a8bf with SMTP id d75a77b69052e-52b568aedc7mr187664221cf.43.1785782651801;
        Mon, 03 Aug 2026 11:44:11 -0700 (PDT)
X-Received: by 2002:a05:622a:14d:b0:51c:1c2c:a8bf with SMTP id d75a77b69052e-52b568aedc7mr187663591cf.43.1785782651170;
        Mon, 03 Aug 2026 11:44:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e2441e96sm2161483e87.42.2026.08.03.11.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 11:44:09 -0700 (PDT)
Date: Mon, 3 Aug 2026 21:44:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sm8250: Add JPEG encoder node
Message-ID: <2rtrk7tsquxekqhk7tsiomjnfzc3xfqg574cbw2m5b4ui4ovt6@2oxme5w4wsqy>
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-4-atanas.filipov@oss.qualcomm.com>
 <ln6tr2vwv6zmoo3kcivjjf3rqjxqm2fltwcpn4kk3iphc4rzlb@qdpop32fjm5l>
 <ce631db2-8e8b-4b97-8164-c701a1b0dc1c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce631db2-8e8b-4b97-8164-c701a1b0dc1c@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDE2NiBTYWx0ZWRfX6mLDca6CvvHo
 H5wDXUteAVH6XtthqywfcnwShruJ5/zCAdJdrEVpM46JlZS6O7tm5gniydz6npoSxXMPCKBCbYW
 bYSZx0OEsBr5LicB1MpVi1LZpBBdYMA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDE2NiBTYWx0ZWRfXz79fQyaiBTh+
 gRw7sfxoXXOMlvRRgtswgZxb9YIps6AxPkjO9puYk5Herq1Vk1KMRsNmoWtB0z2/RwTVL/EVB0y
 Fo/8q7C2YlBpvRnceJov5h5OA+B0j5BcaB6eaNsScH9Wzor+N/+YGkpzwjjKZ7dXGerk5EUYlYy
 wWJBbRjCXi0f10lkF8gPD215nfDHbKvc/BbGprbU7p8zDRqCeXiv09uFy6bF10WYeQoZqMhf9wB
 yXsan0mnfOANStXQpAA0nVw4q2p9k6Re41VKb/xGGZ1N3FqszldJKLjLjaCi1s6BPMfVb5+gwOG
 Zb5EgKCRtI8BwrJf81aUkXafeGisixRVApgdtt6gtT/daWP3ar9bkzI0/qp9rYv8bnBUvKgMcVt
 wP/OW4FjyfPrCOlTpVfKht6As4a4DXbplUJbkovWtLO6nrJ4MMA58skdS8J8aMYkpP8gijqu6po
 UVvvfuwLhHZo6E65lwQ==
X-Authority-Analysis: v=2.4 cv=RNSD2Yi+ c=1 sm=1 tr=0 ts=6a70e17c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=B3ZJmAp6NTfFOp-SqM0A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: dW_OJN_OmBFCJREpLtYsepFRFgUTFmcx
X-Proofpoint-ORIG-GUID: dW_OJN_OmBFCJREpLtYsepFRFgUTFmcx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_04,2026-08-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030166

On Thu, Jul 30, 2026 at 09:02:26PM +0300, Atanas Filipov wrote:
> On 7/30/2026 7:01 PM, Dmitry Baryshkov wrote:
> > On Thu, Jul 30, 2026 at 06:05:24PM +0300, Atanas Filipov wrote:
> > > Add the JPEG encoder hardware node to the SM8250 device tree so the
> > > qcom-jpeg V4L2 encoder driver can bind and operate on this platform.
> > > 
> > > Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> > > ---
> > >   arch/arm64/boot/dts/qcom/sm8250.dtsi | 72 ++++++++++++++++++++++++++++
> > >   1 file changed, 72 insertions(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > index f11da2ca4181..d42b29419320 100644
> > > --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> > > @@ -13,6 +13,7 @@
> > >   #include <dt-bindings/firmware/qcom,scm.h>
> > >   #include <dt-bindings/gpio/gpio.h>
> > >   #include <dt-bindings/interconnect/qcom,osm-l3.h>
> > > +#include <dt-bindings/interconnect/qcom,icc.h>
> > >   #include <dt-bindings/interconnect/qcom,sm8250.h>
> > >   #include <dt-bindings/mailbox/qcom-ipcc.h>
> > >   #include <dt-bindings/phy/phy-qcom-qmp.h>
> > > @@ -4486,6 +4487,77 @@ cci1_i2c1: i2c-bus@1 {
> > >   			};
> > >   		};
> > > +		jpeg-encoder@ac53000 {
> > > +			compatible = "qcom,sm8250-jpeg-enc";
> > > +			status = "disabled";
> > > +
> > > +			reg = <0x0 0x0ac53000 0x0 0x1000>;
> > > +
> > > +			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
> > > +
> > > +			power-domains = <&camcc TITAN_TOP_GDSC>,
> > > +					<&rpmhpd RPMHPD_MMCX>,
> > 
> > Is TITAN_TOP a part of the MMCX or CX domain? In the former case,
> > please drop separate mmcx vote here and let it come through the
> > titan_top (it might require camcc driver and node modifications).
> > 
> 
> The change was requested by Brian, most likely in connection with upcoming
> migrations. I think he would be able to explain the exact reasons. As far as
> the facts are concerned, this is not currently necessary for the driver to
> be functional.

There is no word _driver_ in the _dt bindings_. What is the actual
hardware wrapping? What is being powered by which domain? Is MMCX
directly powering something? Or is it gated by TITAN_TOP_GDSC? I assume
that MX is powering on PLLs, correct?

> > > +
> > > +				opp-100000000 {
> > > +					opp-hz = /bits/ 64 <400000000>,
> > > +						 /bits/ 64 <100000000>;
> > > +					required-opps = <&rpmhpd_opp_min_svs>;
> > 
> > This looks a bit strange. Are you sure that PLL levels match the MMCX /
> > internal clock levels? I think you need to vote on both domains.

This is not addressed / responded.

> > 
> > > +				};
> > > +
> > > +				opp-200000000 {
> > > +					opp-hz = /bits/ 64 <400000000>,
> > > +						 /bits/ 64 <200000000>;
> > > +					required-opps = <&rpmhpd_opp_low_svs>;
> > > +				};
> > > +

-- 
With best wishes
Dmitry
