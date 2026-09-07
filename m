Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5333B4C9010
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 13:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786025; cv=none; b=VjrRzuGpiLSmoHhyvKIXC2fZw61KSOKHNdN4C0/bIyVb9BmknMintL4Etdrez/TlYcXpIJ14wEXCkQ1cDxrG8WjS+03lWUHKslxiwywh8pShYac5v5CwsV+GdVkqzEdZogPbTCRC/WYfDHNAp366sxFViUcdZ0rQNRve7RkdhEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786025; c=relaxed/simple;
	bh=05EZwX1QMXFOSIQZ14nOKqI7np8+6IotWEOKE6xgP10=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tbW+0uNYqH+2s4F0TEk8JTZYfjcC91ZsyP2pQXEZcaWP+/SaIy6HLwJlRpsmJFL1hbvzAwYlZPIqHiReppWF6qtQIt2O/YF4khCziZvJwmhxceuYpxrCgPcUacZsxPVWPS7Aiknb4vFc8fkzhNU/yBdfUe2YeK7TZu2aCMflobs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P/YZOSaa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HrPH1/nC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P/YZOSaa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HrPH1/nC"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnDr2004211
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 13:00:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M6RYt5tuFs9RsQAwQKjVnrB/
	XtbCHA2aTJv14rJA75U=; b=P/YZOSaa1sFa9rUv6gNOnJuNt/rsb4w2KiE9Cwyv
	osWXW7TEtLEscRHiOZHzIY8HHnmoVuCMBOmXLbdspwkhapzLMMy20RznhCRcj8zj
	yjlK15Ap52F3tS+8WAzy0sfGEqNINp4otzM8DPtRQl9xrCHcKMWKJW6DKEgyQRRh
	TFVvQjg4+vDLNMrh+CXVOPkiBAypptynIFJRVfJVnvMVpfAkgMgMBm3wdD4167RH
	818C1iOe+a6HthteUMpXPvzMt8o8x8RvbDU/HSJgJ6J7FkxRAyiN8L9nFRr6cGqS
	C4xcMACYvH7rmPbpeaDE1bNw34sPxJmYMcVWMiReDBGjxQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghssg1370-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 13:00:06 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1b8088202so3231761a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 06:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788786006; x=1789390806; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=M6RYt5tuFs9RsQAwQKjVnrB/XtbCHA2aTJv14rJA75U=;
        b=HrPH1/nCeuxtDzz5ahf+XYrcxv2I4t71RMTJaRmhIWD1owCxLRP4/MIJ7a7ItB2g1G
         IA61APHK3BLmL3f801svgKokgmumK3Xn7uoq5XoQStZFoo0Yxjb1Sw1bLYrtPPNohhpt
         UNOsvQS47YleDOoeGP8uEy/f4C0StTk3b+fONLLQIPCc5sSSpT27ALqZi12RVvULx8S/
         IcqZakCKwjy3OxlX6/o442MVv9R3/E+qfnYEsUGIc4YB7PtzknmSvtHJyqCOhltpIMQj
         eLkvsy2G0JRH43BYEN7Mx045ldZkUjktrs6lBjQPe6kdyGl7atxMoYa/jbSmouBJpnK2
         PrZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786006; x=1789390806;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M6RYt5tuFs9RsQAwQKjVnrB/XtbCHA2aTJv14rJA75U=;
        b=FEqHBIrXJg4lkztI2e7yVeMfTilDpMC4yvPmNWJhIft0ABrYu4lzJJKwkUwtHX6iGr
         ICbPzPs7GWtNUHjLYh97lwzeu7m4Ckm/pGfG5KKfnazva6IxpgVTHhgZgqHTii7wzv6h
         pSNcbWPU0E0MfR6yqz+jFhRTvEd7IG7YznXae1gDnhQBrU71vnnrbe2VxP9YuOS5rY7B
         PdO4TkZH+EJO1uJpjTJGkHijnqB4yCFhoUow2ZaT1h8OkXQz9eJ+p+v7ayVTdNlSSniU
         aV09IJtowYqWGotlm0M01OIrnS9bDBmIryOocuc+FAJTHFGq/dB/7HgoM86YciYO9yQX
         OGHg==
X-Forwarded-Encrypted: i=1; AKwUvBzB5gF4dtBd9g7LeV8T8LMscb+rG/bQimFk/NIR6j2AnNcnmonbCMayjn+KSHomyE06zOWRsQ8Fd6l2ilWV@vger.kernel.org
X-Gm-Message-State: AFuF++mKlVMLtCLIs570ExLyH8p3iZFQHi7X7+eOpOtjGYEO/+KqWaG9
	59OUGMTwFY5UmziU9rTKAbcdN5l1SD8eT67Oa04qTNQGe17uO+nrTg5jUU+Gw/iiuCsbOcd2ufj
	RWYoF1WBx0keuWK+cmy3h+67rwrzy8Hri+vXYsIwIY9lp9vravoo7hVurj8ENqh1Bh1fX
X-Gm-Gg: AYBFou3QnFeSg/GwSsaImzdYhNiHBYr6DTyPEcFkJxNYmEhGtLbHpyrAiStzDIDJjeC
	oBOk7m6aMcRl51+xqnDHWuY5GkZSls0xS35QS+S4C0B7Nsy6rkAMbvvy2ffSeUsBwEM9dsrWcSP
	SSdwVPCHDejQFDnPt4Xk7MgOwLn+Y3B198hkyAFUooqqs1Zat2KmZhyMk5WgmSbxBByFDCUk/Hq
	+3HEmkscJbZnAcitQ7eI3dclhW8ixUp8Cm34xB/DjhqBxvchFAgoorlKhOwgrrt+PimtLxLcFpN
	xR6UyOtfe7/5FDRd2zmMppAeDyOEemWEvmNRqoRltqb2ht18ZmuZJAf0sGmNcsQ70z5dy2plmJC
	kCjq97I7dieBOMAdBBOaf7JpRpgc+YQ==
X-Received: by 2002:a05:6a21:6f16:b0:3d0:868d:8ccb with SMTP id adf61e73a8af0-3da3a0a8503mr37283027637.13.1788786005458;
        Mon, 07 Sep 2026 06:00:05 -0700 (PDT)
X-Received: by 2002:a05:6a21:6f16:b0:3d0:868d:8ccb with SMTP id adf61e73a8af0-3da3a0a8503mr37282924637.13.1788786004899;
        Mon, 07 Sep 2026 06:00:04 -0700 (PDT)
Received: from hu-kamalw-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33517b57ac8sm17681070eec.28.2026.09.07.06.00.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:00:04 -0700 (PDT)
Date: Mon, 7 Sep 2026 18:29:58 +0530
From: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v6 3/4] regulator: qcom-rpmh: readback
 voltage/bypass/mode set during bootup
Message-ID: <5b2yo644hjtnyue42da6zltxpai2hlod3verxbkecbmmaw2ktj@6qhufjoik7kw>
References: <20260801-b4-read-rpmh-v5-v6-0-9fcb54928523@oss.qualcomm.com>
 <20260801-b4-read-rpmh-v5-v6-3-9fcb54928523@oss.qualcomm.com>
 <0a73bc50-71f4-43f8-9d95-14a763d63c61@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a73bc50-71f4-43f8-9d95-14a763d63c61@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX84Mkfzem5z19
 ENDy3zcuYHks2XxJXRaPRnmFkx8bjxfRtM1dZkOYzo4P3G1cbCpyANleCMOdt394QcBuNAYWyIo
 oAVxWgmKJco8K200bKA9rKQPkhEEN7Day1lS1qc56i0jeVVO/ebvOq7botriX7c4RJ4eG4GvZSU
 sR45R8L6D6igmD+maDf03O0w9UZpuizjzikpSaz/VNXJwqbBUFE3uw45RYk+4sbT0q65eMq7nxh
 Zebrn5K9eE1UUBRPCHkU8S/FDd87gk6V8zUcq/8HLKdiwJdpV6k4dhT2OpZBACFdaHz2ui50wDJ
 dd4wcKYKMLmK2pvk5p5g1ACo58ctpBp9mCZRS21KHNCOMXbWtrwYdi7RaiYvyXwYIfeu7wJHF3/
 9qj+2pNflYVp0Q/QQXIolzHBcAHdvX5q823v3gld3o4XQGo0X3c/pIHTHKI5AoaJ5XNrhuoN9mt
 Vu13sJaHZsUGRDMz5IQ==
X-Authority-Analysis: v=2.4 cv=MrJiLWae c=1 sm=1 tr=0 ts=6a9eb556 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ci_LbjHFLAaaU83jS4EA:9 a=CjuIK1q_8ugA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 8dlbQg1ejnSI2YbC0xBOndiS2S114E80
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX2o6Pw9jIEtmB
 Y/6W8N1T7+AuP4yHZEQaEsRA5f1pTFuD3hXHxLkHtJ4YYCpnQQVScChsbMaplcCRGGRvZUaghh6
 0AuYjdNwUDIsupWNNOWqR5B7KlFch0Q=
X-Proofpoint-GUID: 8dlbQg1ejnSI2YbC0xBOndiS2S114E80
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070143

On Tue, Sep 01, 2026 at 11:49:42AM +0200, Konrad Dybcio wrote:
> On 8/1/26 10:00 AM, Kamal Wadhwa wrote:
> > Currently, during regulator registration, regulator framework sends an
> > unnecessary `min-microvolts` request for the rpmh-regulator device. This
> > happens because in current design, we do not have a way to readback the
> > voltage settings that was set during the bootloader stage.
> > 
> > Fix this by using the rpmh_read() API to read the regulator voltage
> > settings done during boot and make it available to regulator framework
> > from the very first read after the bootup.
> > 
> > Also use this API to read the mode/bypass settings as well. This will
> > provide the regulator framework a sense of the initial settings done by
> > bootloader and thus preventing any redundant writes for any setting post
> > bootup incase the same setting was already applied during bootup.
> > 
> > Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> > ---
> 
> SC8180X Primus hangs with this patch applied and so does SM8150 HDK.

Ok, i did see some issues on SM8550 but those were mainly related to the
voltage range check leading to some regulator failing to probe, for that
this below change may help.
https://lore.kernel.org/all/20260720-b4-regulator-core-clamp-voltage-v1-1-8e5eec076a8e@oss.qualcomm.com/

But i suppose you may already have it?

do you see the problem with the rpmh_read() or in the voltage range check?

> 
> Interestingly, SDM845 DB845c doesn't
> 
> I think we may need to opt some platforms out of this..
> 
> Konrad
