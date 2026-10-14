Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90DE348551C
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 08:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791966624; cv=none; b=SbIAoZPUkd8lPFkxfgkj9L74muy1TmFN/fHxTBn57CdmRipjdzjNe45WnMRngQXFSsUVsdXgMI2VFZIUOcfVjMv4s8TQ/MFVN4KDXwvC1hSgcDC3CzSS8AvispoHKaGbMOn6GSxyEDPM9cUO1ndsdbx+WYfyYMAn/boZQ2H6EGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791966624; c=relaxed/simple;
	bh=ZT6FOcLx5hbreOIsDX43bZgWp7zpTZEdhRy0JiuWAik=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lvwfqQPrS5fBSK01/w8j7lwnxeZZ4OwD/EevhEFMNa3xifyPfJAJkt0LD4JadbGaNM5R43aObaVK3pM3XQpxYK62j30G4xreEZChgODcf7Fppktgn2XtJMB2divbChuDkyucyU+Ink0rr+M7pEsm1SWTVPdIhHooQxYc0HlWMgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CUgXgUME; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vd4GiHr4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CUgXgUME";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vd4GiHr4"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69E663Sd3365341
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 08:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5dobmJMNsUw57587c4QcKw09
	gC0COHOcPZrtPPfuPUw=; b=CUgXgUMER0ZTIewiEPvYRLEEcjMbTE0PMldELdDc
	vH7FraZ2aaPVdtqMCxPV5AvdUS+OHUI0Gk+oH1eIK/vqlzOnxxYxATJLC3s5Q4tD
	uNeg3gPCCo4OOZn/Zki5eEIEoDCqsZbcx0V/h0HoDhGKJGCEdgpp7qKLB+ICYqfY
	Zwzt6JvJObl3gPQEc/KgX3xEMkYRsfTbVULnCoqwVx7ZwnhzHcLQrb46uob0oB7e
	SGBPibWIu3ibf/yy4TI6cFVYMF4uP9V/k+YCGQk0+SWHx4IqPfIgMDzArZFPLwxM
	XXeAsIU9GJawVc9stPbAEN/33aQafbS4zA23K9c03Z/+YQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4620jnw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 08:30:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb6391e89so838999585a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 01:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791966622; x=1792571422; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5dobmJMNsUw57587c4QcKw09gC0COHOcPZrtPPfuPUw=;
        b=Vd4GiHr4fhvmoTI5VnG92DoG16M/ci8pLPq4dV2VNmDwbTvL8C6NXSqeeniNhjaJ1m
         uPRgVVuRvG6CdOjp6bt4PJIW60lnGZNyfPr7C1ktaFo3Wu3PPQ7dZi4EmVqYYlvzRPyn
         QfFAOJqDIo0cWsWpwGDxZFxMXfJnHePsBaMhuICrVnV57b3dHJdVmvWRmpiL+2ysDSJ0
         +1s01Wvms8u2BbuZJHWLg/O0boMdzOqGGgcbPADMxCM1xfLzgzgOSo5XUxdpUOpJQq8l
         KwCb6pvXuZ9eeDzkxMsTWOVlVbnEbi1Zsg+m5e2wmoN0K38YjrOFHhDg9LFxwwNBjKxt
         b8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791966622; x=1792571422;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5dobmJMNsUw57587c4QcKw09gC0COHOcPZrtPPfuPUw=;
        b=F6ZJCRoTNbWMA0fmU3K192KoEgR1nwPKm0Yp0jmhH0A/DFSQpnCtvYsYgETZ/nkS6Y
         iiRUXy+2IVozkBPMtB39EHelkum2GcV7w4ciZ3Z3rjgH+MiNrAVITAiV3QC8XhGsI4RJ
         3HCGG6Kqpe11TwxmNUMdAmCgOfE6NU6I/2EbdBtiAJghDTSBba9KALuXQmt6qMunib8V
         QVNCJnQY72zK51Xbme4adGeP9ebAu4GMPfJEMs7wDk7O0K0qGwIDOvzzckTXTAS3Yg1e
         teehIAtL4Fuaos3Zl3J9ztV4MJnRKvBTxzF1xgmY3zovSDUib3Y4nq6Qb/jl0C+TXjJl
         HtlQ==
X-Forwarded-Encrypted: i=1; AKwUvBy5Q4ga8IeegXlqqQQpxfJHuNa1s8yAUKjWYEB4REanqTuPFDqEpl2E53M7k2A4WqyRqryEZcWpvjZFzANb@vger.kernel.org
X-Gm-Message-State: AFq9FYKxLt40gzit0yp3N1okGgeUza4IaUKCpNGtby3Mnr7ElW+Fnyhz
	Nv4Lke96aLJXVZbEV1EHPPqJ0rXfqMvMbF0fJwsCkbId8pLhMrBoRq3vPsd8RqbHZBu3Ot8LtMM
	6VUVU+4v7YsiNPS8RypclbOzsxHKAWXz5BkgDUQ6TGqc5Fw1Mh2TI7V5x3CwATxAPF873
X-Gm-Gg: AYBFou3UhcOmIAzhjELwSV2iSoF+zuXmBe58mmHQcpuSKCpx5Sc9x0oNfBNnzV8JCfa
	mAcWmvaQs3vV5+7A4CmNy56qNx2FoSszjofKPWyX8ZFXguX0SeCOVMzFLCEHEWG/uw90DJ8LDFp
	GU7vAD8xPkwdHdAOi1O59j23P85cf+wOio9188Z2qvZCp1nL/OobDh/khJEIeSQYeojfLW+KmVt
	XdeNX0vwfMz55rh1IawRx41wmA68FhPekGgIesy+q1+gqIoEZCcdnctj+FcKVwbATwDwm/GhLWH
	WK1fhc50e4BujqbfwiZnCDvL0xqosmQxs81TylDwsmVaxLKHqcT1juUqEmk2DevB2Vi5TOe4mtU
	+eGl8leb+2BOCUlZo
X-Received: by 2002:a05:620a:601b:b0:939:a45b:76ee with SMTP id af79cd13be357-93ebd1dc726mr2524661685a.23.1791966621618;
        Wed, 14 Oct 2026 01:30:21 -0700 (PDT)
X-Received: by 2002:a05:620a:601b:b0:939:a45b:76ee with SMTP id af79cd13be357-93ebd1dc726mr2524658685a.23.1791966621064;
        Wed, 14 Oct 2026 01:30:21 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1b4b8cc7dsm23559775e9.4.2026.10.14.01.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 01:30:19 -0700 (PDT)
Date: Wed, 14 Oct 2026 11:30:17 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Subject: Re: [PATCH v10 12/14] soc: qcom: add core driver for the Qualcomm
 Crypto Engine
Message-ID: <2cfacl7qglbbognw6g37qnhslrc5fhstluiol4eqanqn2qg33y@4a5nevgajbgn>
References: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
 <20261013-qce-fix-self-tests-v10-12-57162a38a554@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261013-qce-fix-self-tests-v10-12-57162a38a554@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: kCbEnu7QMdhX1GrSDjw7OZFQiPHmJyDu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDAzMyBTYWx0ZWRfXyge9hujd9acI
 dcmju5OvTTvngTrtUrPeL9GJOZkCEaByaaftZ8rjxcm8JAqHyKEoRRp1ekaHE/fcN96jWOuMYG0
 pT1bm+Rzp8QzfZgEJCLGld0KqT+H5ItF7i3J/dBdSPXx0hEpFd+YCEr6jNPMVFLmupWdDalbJn2
 PinZWDdHidvEObW/ih5ftX1vxyo9I4le8KkODW7tUV2mMgJ0YyMLYuSo+9qF0dxv7bTPFIVrsg9
 W1HeZjE6RdL5hgOjenV7sIDM3iVCOHxMSGC3cBu4G0koqnp2Th5FH228MDugWM2JqRb+ugrRs2B
 a0T3nyyZstpfYXm0cfb65vtRbk7E0HaMqW3q8wf7YsUX4Rnx1EXEvA624IVy5g2nel92wQyvzDO
 wu6IzbNpNSKrOZpmOqKZ1gJ+LmJai+VmSxYU/I5MKCHNzKbPSqxA/uM2+mRTsMH1C6wIYciJh/G
 3tVK+4dfgaH9Drd1CAQ==
X-Authority-Analysis: v=2.4 cv=ErZHPicA c=1 sm=1 tr=0 ts=6acf3d9e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Mf7eSssg9PIvhwxWQfMA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDAzMyBTYWx0ZWRfX78sWM0YiGASi
 LVt34UchDRZrN9d6FLWVNwYZPggPSeYvdloc5Hff4LcE76XSqjgVfovm35neSr8TmhD+Sy6ZUSp
 cZetUgKTpOMaytmMGEygWHQvGnSgwhE=
X-Proofpoint-GUID: kCbEnu7QMdhX1GrSDjw7OZFQiPHmJyDu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140033

On 26-10-13 11:57:41, Bartosz Golaszewski wrote:
> Add the core driver for the Qualcomm crypto engine. Its task is to bind
> to the qce DT node, set up runtime PM for interconnect down-scaling and
> register the auxiliary device using the crypto offloader driver.
> 
> Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
> Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
