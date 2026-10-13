Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88FF53F6BE
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 19:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791920113; cv=none; b=feQTc+AX6lU8Y8ik/sCBi4CFjJ9TRhf4elV1BVGp5NqMIqEklpRidCuaSQ2hLpkypH+cxPemqPVnuI3QD1oCu1AloJyD7w2ssqzxWhqf8W0MeNVpRYhgVrczXx8c5JIr6ufLU4Cg1IAfK2sI50iN6PCxth3gkOOOD2PMHMCoBg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791920113; c=relaxed/simple;
	bh=F27BAEZfm3tcJz/NI3m4hcFR8pmZBDDahEKHtdyiE7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZx/HJosFLCZFodJEkbyARSxOyvhgW+aeX7fe/D0IMzGCBDbHC6MU11pK/HfbBJzcKh9QA0mOmcCp7m8RgrIxX4yPp6SR+08a+VSaoDpolHp2hMLtcUjGzzWJkqrek6XYhm1o3bqYM2xD1TqHfUacYrDwLxI2Kd9GUF+rNZPIGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GKUGmqS6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DCKjNwHC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GKUGmqS6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DCKjNwHC"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69DE41BG900267
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 19:35:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2pJw4wS84zkKGQAUnSx20Oil
	d65I0R6KMD1tR1I2vUo=; b=GKUGmqS6GNtpON1P26ntvI8NiF4VkXuYPqEfn20u
	ZsDX9eujs4oBVwaRHWh4Yjf20kGRTy2pluKLZm1OUUeoFsew2j4J2bbwgQ+oec6V
	BW7nhrPcM5Zbwgz4sgXmfpLo4cGMMaWGWOr05wbpid+QQKt2C2hKcEUriEnPohCp
	6gF51kEpgwfu3RmypLmABbTguntQ9MarNXwSl2yJku8+7Yeljb+wMMPz5Jo6IIFC
	E42GNaqeKk3vtDRb9YQqOMYM/+tWnf/qJ4ECOM1zxiu9XLunRx1zLN7UriV2ayJl
	otpTWV1OhullX2IoyTQzDGUOGPR0PTxBEJBtRWpFDijnUQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9g7uk80h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 19:35:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93dd3c3badbso756602485a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 12:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791920110; x=1792524910; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2pJw4wS84zkKGQAUnSx20Oild65I0R6KMD1tR1I2vUo=;
        b=DCKjNwHCXtgmZZKsrjdXcUKKlYvOzAMGJ0il6yuvd83o26OU3BJkCegM7GOsaXXjNH
         Xm2GNDPxm05g5u8fvGll//Z2rn0q639LSbxPZNeV/QTBFY9HZljC0qCFxCZX+W2f+E1W
         pgiI/gzGTEouHcInXJusgMd/m3PuPv3IrPQliVlJZYt6jGMA3IWbW1kJ5krQG+yXrW0F
         1YR/TPwgmcMS4lGVvrx2iENmAX5ycoZlhi7lW2472PmygT5/GvcMO+DW7SJI1tYTcrmv
         x4yVNbb2cDQQQ6H/eNRHKbnOi8XjGQRimMQ/eEqc69a9UcjD9NL066IuoxPxNmFD8DZj
         stUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791920110; x=1792524910;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2pJw4wS84zkKGQAUnSx20Oild65I0R6KMD1tR1I2vUo=;
        b=XiT1Aax3vxsUsF4MhSeVQoMDiQaekNwgYjHOmOnBitgnzJomqV9AgaFK84K3Fmtpfx
         F371Gt7uq+1eSK5gM2+I5fPKDVhBaYfDMfw8JzuEHpbSfBFDVChayzyHlHjMtfx69y1P
         PopDkLG8MnXBlNwXUnK3OIERh1NgoOXFmy5ArLn6VXz1vB32JhBcGYH/wBmvTcHJi3h1
         KFA8QrwSWqqnZDuXX2DHnfqgTwD5sLDQqN/xmdEJpEvmRpGaBsnK4owueIep7QvLuIgz
         +XNplLGZY+3P2Ze6uUKusB8qHu2oL6HhMQDG/A5dRYKcn/EoC21epCh+3bUvuzrg6KIb
         ag6Q==
X-Forwarded-Encrypted: i=1; AKwUvByNC5q5ipj/tRBT2fUvuJkZIVtHwpy8CJobrp0ur2n7V84QTwF9H/UW0TA0z3v7n1HKn7/ielyXw9iOXUR9@vger.kernel.org
X-Gm-Message-State: AFq9FYLkDWvvHr670REgFPOlMmS5jTEMpoqexhNm+RAWeXwmHLx7kxJu
	G8ougKK2tHVAIpBqYZzdfpLa09Vf6bmubMvEzzd4UyKxiJ0/0mXzi0vz8PXvxrQ80u3EjXbg1qY
	1MPULNMhcETfCL97IN8TKe5pe6IenALlhPg20k6s/Tg6fYdCAAtht4Ar7ldz0zfHOSCUQ
X-Gm-Gg: AYBFou2esABPZov0ytNPH8OqL4zvbK1Or98gYEyMruf9ANl60oKhZ8YGDH9rnPqqDKI
	pBSbFsK5LiW0U+4Gcne4Xr1aG/B8mCQulmPvDE+chV+OVYLzZTp9zUJlFxfUlm0ReAIfKkOdyVu
	wS2F69RGeigbOswbbq2fvCXBm/s+NUMJeNnewjMtPH8CkP2d+0mNT2Z+G7p/2bcDTszN0xHN2Wb
	T4I6WxZT0qOGP64axM8jJOKKuz0Ize1URYK8rJiAq4g3PBDEIWXmx21ds85Uxrq+8iFkJ4/Jb69
	7S+BLluMm8Nxq+1oLA2HWnYj+zUQ9/N/nbCqoersPnzTB7XOMecstgkLDLAZ4yg/L68Kkg/7Rz6
	7Gxr29rQs7o2uiTV1GpspipxSyqHRCgn/uJIvAgBDUftKKw4tYuJ4383XByuz3r+ifV2a45hfrU
	DKcTtPKzeOausH
X-Received: by 2002:a05:620a:1722:b0:93f:1d5:9973 with SMTP id af79cd13be357-93f01d599a2mr131052585a.73.1791920109805;
        Tue, 13 Oct 2026 12:35:09 -0700 (PDT)
X-Received: by 2002:a05:620a:1722:b0:93f:1d5:9973 with SMTP id af79cd13be357-93f01d599a2mr131048685a.73.1791920109255;
        Tue, 13 Oct 2026 12:35:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33d6ffadsm140754e87.29.2026.10.13.12.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 12:35:08 -0700 (PDT)
Date: Tue, 13 Oct 2026 22:35:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] soc: qcom: rpmh-rsc: Skip read requests on
 unsupported platforms
Message-ID: <5v37ztg44tvvwnofjssb6jpgxuwftjkr4mtk7g6oan2jggc4om@q7s475cmh2ui>
References: <20260911-rsc_read-v2-0-98675c248278@oss.qualcomm.com>
 <20260911-rsc_read-v2-2-98675c248278@oss.qualcomm.com>
 <53ea0718-285e-4e81-8f95-76e9b0c0f6af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53ea0718-285e-4e81-8f95-76e9b0c0f6af@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA3OCBTYWx0ZWRfXyZY6/5FsOLLX
 gY/KxfotHHQpNLRLo89qymX+8ARu8PHbfhTD9EdBK9Gd5ynOyVy0f+CwNJFX6vcYCdbpg/2B8rn
 KbJ4wTWpbm7Vn3C0byC68YcETP1QALsawS9IpmK3qErlFmIPv9ywI/wPMwjX8HQ//ggroPXcENW
 lzRm+1kNmVm6kHgeV2xXU4JrCaa0dQfU4lJ2CwdWpljDWf0hYK9MGtGYBfdk6p6VynzM7jB+FjX
 D4GtGgVa/SXss25HW2jV/Mxc6DVA6mFbe9JWzcTr6lu06T/oMldEzgKqRe1JdgLdsucVfs9o28O
 TyEa8WiAJduPiQeGAbp7orJ4LetMz4x+NCjg2WPInz7PrsUpBMTVpu6B470RKxNm4FpmqBhu4wb
 g264diK7OT8vS7Paw0zZr6dmB3rLD22fBye3SaxcYgH5Oj7rf2Zt7B9bPG7gjxgDUDg42Bh7Q6D
 GA+k/zT/DdkuhzUoPbg==
X-Authority-Analysis: v=2.4 cv=Z495j3RA c=1 sm=1 tr=0 ts=6ace87ef cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=fcFkctl30oArz797GRQA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: u-eI7CZqKLNzHAX3yP3e1XV4Uf3Onf37
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA3OCBTYWx0ZWRfX0qX8c7MirFXP
 QFr2O8ZYooTfThEki3soT768SOB7kZVVHcLjMDZBezxlNH+4JF0K1s6BTGMjdrNVoq4a1vY4kAR
 MUBSHsAl4aAXx+e+Jj/8jW3uSdXbzk8=
X-Proofpoint-GUID: u-eI7CZqKLNzHAX3yP3e1XV4Uf3Onf37
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130078

On Mon, Sep 21, 2026 at 04:29:43PM +0200, Konrad Dybcio wrote:
> On 9/11/26 11:08 AM, Maulik Shah wrote:
> > On some platforms AOSS do not respond to read requests. Read request in
> > such cases will consume the ACTIVE TCS but forever waits for a response
> > blocking the subsequent write requests.
> > 
> > Skip issuing read commands on sm8150 and sc8180x platforms. For such
> > platforms return success to the caller with the resource level at zero
> > to avoid the caller taking any action on error code.
> > 
> > Fixes: edbafe65eef2 ("soc: qcom: rpmh: Add support to read back resource settings")
> > Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> > ---
> 
> This works as an immediate fix, but I'd like to get some
> comment on this:
> 
> https://lore.kernel.org/all/3058d570-aeb9-4f73-831c-c30626296006@oss.qualcomm.com/

Maulik, any updates? SM8150 is still broken. Should we just revert the
commit?

> [...]
> 
> >  	DECLARE_COMPLETION_ONSTACK(compl);
> >  	DEFINE_RPMH_MSG_ONSTACK(dev, RPMH_ACTIVE_ONLY_STATE, &compl, rpm_msg);
> > +	struct rpmh_ctrlr *ctrlr = get_rpmh_ctrlr(dev);
> >  	int ret;
> >  
> >  	ret = __fill_rpmh_msg(&rpm_msg, RPMH_ACTIVE_ONLY_STATE, cmd, 1, true);
> >  	if (ret)
> >  		return ret;
> >  
> > +	if (ctrlr->no_rpmh_read) {
> > +		cmd[0].data = 0;
> > +		return 0;
> > +	}
> 
> This should be -EOPNOTSUPP and consumers should handle it
> appropriately

-- 
With best wishes
Dmitry
