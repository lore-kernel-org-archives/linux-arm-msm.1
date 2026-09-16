Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD4E4FDE7A
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 13:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789565908; cv=none; b=ADf2n9dHKjFpn+uTObLe1Ewvqcvi4+5HvCopwjaqnwcaMSjnjpXKABRlYm1zIC/1O8wM7gXeR0TUVhc4eRX6kr52c8Nq5cT3DSUEjhzgIUhYiE0FgtiPJHh74BBkmQ4kGBhLElWrNj+7yFRpvEu4Ozq7ldoPpk1//cAG5LPjUzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789565908; c=relaxed/simple;
	bh=gr8uD9XWy7EPGvPIwLrmL5ImB5sWtzac4sXA0IvvQd0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CAi28+BSk2DjSrVnI1wxInMygo6tnNWjqUyW57LJ0SaBXwQqk/uloQiYGdLbzILXFxdgYVyOpR7WRGqVTAuc5efkOnRzSL/+EnBqoF30lCdzFAXSzsOPTBtd5Xlp7f29znPgHwHWRAPdczZVhSi3jdjTTCNfcLgpDByry2DXd3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F8kSfjgk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TY6GmmXl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F8kSfjgk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TY6GmmXl"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68GDJIxx2788843
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 13:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LlhMlNHGEpK0T30X/QJXpo30
	EE7ZsUpq2JBHpDtamuk=; b=F8kSfjgkXsDY12jEah2EiaQ98LB4kaRz6Sw5gUOD
	dS3eDgCRFh2ZAlTRJWcgy48XpX9PzIAhjSO7vthSxzPJPWWNFJpzhJp8tEPrxA4h
	u873Ci8ACv7nlOsU/Dxof+ezLjEs6cWrJdbScBHKoIJkOJCit5ih2E1IKCc9RsrW
	8tqiyc37ynjhH2V2nkDN0x8QKoLp16aB5CpbzEz3vMKQcbtKTOSim68smku3mpnf
	Jr2fiDpHVMAZpKyHzvxkPJJzWnXzIRWTLBjtOnE1HQSOL0ConSZU6fnNXNekqQie
	DQXtDrzY/AfZkQ3j7P/oIsPs9mGOpByYOlSBYjOiyMn6sw==
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gquw2r2ft-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 13:38:12 +0000 (GMT)
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-804e6c7acb6so6621442a34.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 06:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789565892; x=1790170692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LlhMlNHGEpK0T30X/QJXpo30EE7ZsUpq2JBHpDtamuk=;
        b=TY6GmmXl6/ib8uv3Ot3V+A7hpe1nV7WaAjtJh2DTJgi+RvnaWH0WhXbxGQs2/W25tl
         JzL5jE66B1YNrLST1a6g6M7+xRV/1yeZlrRAViRCGHhqlFNsvy7kqRvcPvBNkb6o+BWi
         3HFnmhYSDZuHra6x94y3aeuI9B7Xwq6SSeOXIR7ijIfJ6yKSEKTcgGvyFUG+w3Yp+i0L
         ymn3xLJ74biNk9FMxfqL3BchmeYt88DEEtNospknxEGb2o/3H80/5Nqyb8OlivHhGT6e
         aMn7GmH71Lp04Ya8zDGlEipejxR453DfOAR2COsqbEbNI6r6Yd+87NUzBnlULQs/yRnV
         UAOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789565892; x=1790170692;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LlhMlNHGEpK0T30X/QJXpo30EE7ZsUpq2JBHpDtamuk=;
        b=Fv9Dz0jA85yHoiAVyGZB7IVTq22oZWq6oxTPPYpTDCWPTzrSfiw8n68VEcaomcn0AT
         OO77Cnt02ljqOKdBXUcFd1jBjhVWpZwFNIYT5XvXaCSs+s6VfItHCSDNT46tM+3HG0jt
         SVL5FU5P0YOxHKIax6gP+0g30bv3sAg2Jbc9OCcEN75Dnvw1G73+68GyubJVNKQSwDHW
         ePqUsEEztP7jJeUbaKiYlY6ytMKyNA8GHat0/ERsvLva0ivp6a/ZAHlPuzBU0cZunfsu
         tXsI1upbwypYagpynNffIsp8pU1XWIuTcy+t2zYT3zYoQDkG6J9Nn2j67c6oe6UnErgI
         PYog==
X-Forwarded-Encrypted: i=1; AKwUvBx++8wlgIHfRGz1o0OQVX5IivPTPl39dnxThkpxgVZ4ki+7Bw1is094lWEaoqEmR44z8z+rLOg/GNzvmaNe@vger.kernel.org
X-Gm-Message-State: AFuF++mqb8xFM5HJwxu1aXvN6pETLhIVG4+avrF/PAzWvMlYpnFAuPt7
	wNyMRe2iXLOI3ASAUSDNL0w3X9cG7pcSpbOUm82QUfbGH//2AvE7A1AgFn44hALqxUQofNLKVpB
	63cKU3ny1Zy+D013zzgEbuVw4FP75NQFse6MVngrAvlsNeOxSUcNwVvRpa++0Fd8gR9d8
X-Gm-Gg: AYBFou3nWQd5qEtcsxu+OFB2ilqQLsmCLuvcGOTPeTwz3HzzFs21+i+rMP8h6PVDv/R
	3mUJjrdDuoLiUtQuKvvEG6/sTX7fgEut8/dAVP1P1dFyF3VHB7ZOGiLcCJJ+/GfNfmD7Od2B3zO
	u33StXcYlB1TsmFiIKUw4iCg/afLMK1nrmX/FOEpGu4Iu9c0Ddt7LRx7cH1B3r9a+Rsp/9Wpruz
	mgrpr7Y55PqQD2uUj6zlWQbhl8OPkP2WjUhwGyRtR4BSYy0JkvjKJ/8hNNKHo8HAxrnF+zX98Gc
	y8gp8Oa/al6J14M/So7W/e9qWoILNymTOtPH4sleGY5ReJ3TsDzz/vefMj07fHm14y9wKA8xm++
	6eyvHquN9eBnyizFEssTqjmAIf9BStZ9SY/JDvftfMAM=
X-Received: by 2002:a05:6830:410c:b0:7f4:effa:a5ad with SMTP id 46e09a7af769-80b2ec5aac4mr4800096a34.10.1789565891846;
        Wed, 16 Sep 2026 06:38:11 -0700 (PDT)
X-Received: by 2002:a05:6830:410c:b0:7f4:effa:a5ad with SMTP id 46e09a7af769-80b2ec5aac4mr4800069a34.10.1789565891485;
        Wed, 16 Sep 2026 06:38:11 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-80b07ad0302sm2541841a34.25.2026.09.16.06.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 06:38:11 -0700 (PDT)
Date: Wed, 16 Sep 2026 21:38:04 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2 RESEND 2/2] usb: typec: Add onsemi FUSB15201 driver
Message-ID: <aqqbvEH0U6LYR8UR@QCOM-aGQu4IUr3Y>
References: <20260911073414.16711-1-shengchao.guo@oss.qualcomm.com>
 <20260911073414.16711-3-shengchao.guo@oss.qualcomm.com>
 <aqfyPQ8bxxvBEB_3@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aqfyPQ8bxxvBEB_3@black.igk.intel.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDE4MiBTYWx0ZWRfX6DB+LmpTRBIa
 N3Ti1ClyHjzPXnkl9lUpjl9ZB/z5015XiA84hCTe3I4jW6Q6Yak7bHQNans6QI4CIFY0jgkhMeg
 MbD5l2fXo3OHFfGtPCSTCacSNG5jvg4=
X-Proofpoint-GUID: RWLphmxmRkdCGd64sdPFXqaVSAIjtiEN
X-Authority-Analysis: v=2.4 cv=N4m8hG9B c=1 sm=1 tr=0 ts=6aaa9bc4 cx=c_pps
 a=7uPEO8VhqeOX8vTJ3z8K6Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=8alAasM9Vt_m-_31djgA:9 a=CjuIK1q_8ugA:10
 a=EXS-LbY8YePsIyqnH6vw:22
X-Proofpoint-ORIG-GUID: RWLphmxmRkdCGd64sdPFXqaVSAIjtiEN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDE4MiBTYWx0ZWRfX5koqOWRoh3Fq
 S/W4cZn5iqu119836tTL190FTElRFaXAE99DAmXafWtan+d0pJc4ZZRnpRMYJy3+hcfS9SHoK27
 E8cWuOBgH6aC7So9Sus6M0IlGICGW3VYrgqG9d1QQDcctNxlOwpmKKqktuJNVdlzHPOYJ/7SQoJ
 9sL/kpROYEVgFgRpcuPKT6dUaAYXt0x6JZQOS6mBwDJlEfA9rMr0mdhtSItZKJYe2PCxGnrid9p
 PEVGB/zSEA1lXls8pb5lHr+QLPaS0B01Y855Wv8MLFcytZRPzC/Vs3N+xguFo+vTOeJHpflNxQS
 0Rp6pyXimWz/gHcOzwP/ZKUSHxguMszFGPpHcutvkhJ+Vg9n9bXnBWYwDsKIoGGjPJhvv8C0UsV
 mfAKLXgzFnKyiE5+McoYh1t32jjuDrJWwnS5qFmeEBBSStiKGIv2E6LESvhzIR5e+YS9ibm+Oj7
 LN2aWBmnXW6dkMxekaQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-16_02,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160182

On Mon, Sep 14, 2026 at 03:10:21PM +0200, Heikki Krogerus wrote:
> On Fri, Sep 11, 2026 at 03:34:14PM +0800, Shawn Guo wrote:
> > The FUSB15201 is a dual-port USB Type-C and Power Delivery controller
> > which runs the Type-C state machine and the PD policy engine on an
> > integrated microcontroller. The host only observes the resulting state
> > and may ask for role swaps, so this is a plain Type-C class driver
> > rather than a TCPC driven by the Type-C Port Manager.
> > 
> > Register a Type-C port for each connector described in firmware, report
> > attach and detach, orientation, power and data roles and the PD
> > capability of the partner, and drive the USB role switch of the attached
> > USB controller so that OTG role switching works. Data and power role
> > swaps requested through sysfs are forwarded to the controller, which
> > performs them asynchronously and reports the outcome as a port status
> > interrupt.
> > 
> > The controller exposes a per-port VBUS ADC reading, but the Type-C class
> > has no VBUS attribute and nothing needs the value, so it is not read.
> > PD messages, PDOs and alternate modes are not exposed by the hardware at
> > all. The chip-wide MASTER_RESET command would drop both ports at once
> > and has no caller, so it is left alone as well.
> > 
> > Assisted-by: LLM
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> 
> You changed the commit message, and that counts too. This is v3.

The resend only removes a Link tag. I did not know that removal/addition
of tags in commit log counts too.

> A
> few nitpicks below.

I will change those as suggested.

Thanks for reviewing, Heikki!

Shawn
