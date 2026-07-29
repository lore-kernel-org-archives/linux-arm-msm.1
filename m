Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065DB3009D4
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 01:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785289300; cv=none; b=PRF9RisWq0FtApVcNQLLiqsVJdxeji01OfddlztBgjOJMKhcF37Q010Asv6PRmZpSyLdTVvIm6+dkUWRCj9ASfQGwLKyc3bTbEak6ljDTwSfzAmsmcOQUn8RVAmse1u9RIgmQS3eV8IVJ1XLAKOBwnZtFH03erJmT3TeEXGXaI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785289300; c=relaxed/simple;
	bh=5woRgv98qJ2H+lburjDWIzo14dGjw+6dhQ1+fnloWow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sYBCy8MOSGsjeX7vM/cYKDX+4o9c0uNvqpPXcw7WuipBWdaroGhTiftnoTsdV72dhyooQjVZ9XE/E9oUrM3hT+xHRHWyTws080BHcFhztNRXOezMqvk/fM27Mf7fhM3S0JYfi1iB4sqG+2sCwTyTGrmexwRY0gYVsDcN/FpJSq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d4RUfxVq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BQMY/AoJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d4RUfxVq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BQMY/AoJ"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T1Gp8m088921
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 01:41:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NDSoxv1duGPaBGMKLf96xEHj
	RxlgSZsqTyGauqE3y/c=; b=d4RUfxVqXMyvn3CnF/S48P25ZTC+Vd7T9pRzww89
	MuZLP2g2gEbVaaRrgKBwvVd0elSBzQE4YALB4TWAlIBwJXpWVEsHF5gyIa1Lf7q7
	0moH0eC+WKnBbOlENc69At8gzVUTekh8AJqzPL1hxpT3FGzQlgmKqeeIz6q6nDRx
	ve10pb8JWK/7+4/SO8uszjgrQq9x3pmuacZ8NpBRNE8M89RJPyy/A7205d9Xi/ZL
	EDWSBsuLklQMr0QVxESU5NHVdQ7KI3fppU473oLeRPLfYc31nk8BLIauKqZ1dbrm
	KsUZpNCYdZjt9Kgh9nve7tesONhjASYMIEy6y+B+3TfldA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpvd3kd4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 01:41:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38e6d253330so512610a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 18:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785289297; x=1785894097; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NDSoxv1duGPaBGMKLf96xEHjRxlgSZsqTyGauqE3y/c=;
        b=BQMY/AoJw3WzXIwjWRJjO3uIeFEuGVD0AtjH80QdesVprj7+9sl9LqpcHuoPbDxrqV
         8WQIAE0tMFl3Dy6XuZa4j3+rs9JyJrYEI2fMvsp3gff+mjGJBZXvpzPfjirVIPWmWP3n
         jeY7H94L4+McnZzlCy/7XR6KaDHLp0Du6v+nSjOr6CqF9gOshchNdMp40Fp4yPqX40cw
         9UEeT1iHPXRg6JzlsrvRA0fpiuXuISP40nNhdBiarwZRKxh72x5BhlZSaBwZKcW8S5Mz
         yzbOEbuX+hti+D3L50T0I/QHjTWTUE/uZjw9MMf34ldbZj6eXOPoPbomKdLnlP5c7xix
         l3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785289297; x=1785894097;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NDSoxv1duGPaBGMKLf96xEHjRxlgSZsqTyGauqE3y/c=;
        b=SYw6cJHoGTkJ9fULalnt7kq1VXSuz4nGcm8FypDGw2esFs55Hdyj85JyblEPkqpkWJ
         FVMBM+2oLo1wirn3V4Sq6+lT96h8ObipSe3UOjZyc8fbSdWgX1kXNGtNLtXzrRN19Kdr
         W/qgNtGfHycsHK4HxMvFOWKJDgzzw2n9vQTPlF8zfznoncUFqjQkoVuT5qdiLkyVUZfa
         06Fph1nnYXEA4tCQePUBzb9GO9QnzUnAafyJ6B8+wOpGACS8YHKvf22Ty5xC9zM0EEs7
         lfKZnYpBDFDO3G9151h7PlFXdE/YMHw+zuNIn0mE4mIRP0mO2a+6082f/xOw6aoR9wvn
         vDqQ==
X-Forwarded-Encrypted: i=1; AHgh+RqBNi/0yX9Ddj6DgCaHpqJpAFCKhmEa45kiIwzuOHIR855icpYK0Z4Ut+blMNlaGb4uk3W6Bez+cAWzC/4g@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7PzX7dJLWEfqN/X8HRFWRcFw9h933bCkKD7RRx0UY9UN3GsOX
	QnMkAsKIbL6YO1ve/ZkvKnpj//6Tc92ISdRMqS37Ipt8IhdI79JV4dSMd7m+mA3VJ9QxwB1SaZQ
	6bMukgpZWzUj1VXnHrPVfvrRqFp1feLcAKINVhWZef7QGMEleuVeldBpr3iEytvXkGIQx
X-Gm-Gg: AR+sD1244aaaaaUlDF6K/4CDq2njZKLmW2E2L9iKEG9mACzsaum+/P8/7u5dpOBJJK2
	TjTHQrtkgLfYHj4YZ4K27XaqxNsW8h9GKAZn18r3fOZj3keTkUHTLbyWI+XKXPoGrb5tAlLezKt
	VVrYmuNEbr/k+cWd1C+VgtbZ2QkJszo7QsuOcHRJnsMnW9xrFcZvT5zm6pDcCHQQd/NXmJPd3/r
	mnEemHmnKKsSz80KsnYxOXJaZsbLdYGqmD6rzvf+ILKEqRD6tTYKC0v3Uy/RXZ5GCbkNbOLUheL
	OZk5oMbrtE52UZemKlMxVc1AQBINwS3zVzo7g8WLpTGWLIJWoA4mTZwOxXI1Yv9up7stw0deXsh
	hdMkhE11vzjJu/up6hKCfzt1QzU2b4xPuUqc9fYzozwU=
X-Received: by 2002:a17:90b:580e:b0:37e:1620:dabc with SMTP id 98e67ed59e1d1-38f832a14bdmr429366a91.0.1785289297358;
        Tue, 28 Jul 2026 18:41:37 -0700 (PDT)
X-Received: by 2002:a17:90b:580e:b0:37e:1620:dabc with SMTP id 98e67ed59e1d1-38f832a14bdmr429344a91.0.1785289296891;
        Tue, 28 Jul 2026 18:41:36 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d37368sm5981696eec.22.2026.07.28.18.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:41:36 -0700 (PDT)
Date: Wed, 29 Jul 2026 09:41:31 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] misc: fastrpc: Drop unhandled DSP PD exit notification
Message-ID: <amlaS4fj_UMfDxKu@QCOM-aGQu4IUr3Y>
References: <20260728073851.682023-1-shengchao.guo@oss.qualcomm.com>
 <7761fab5-089a-463a-8de9-1922da2ff602@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7761fab5-089a-463a-8de9-1922da2ff602@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAxMSBTYWx0ZWRfXwZmyEjCt6uNt
 IuaBr9GuSKdD50ro9anNHXnmCJZ0/ambr+C8kkTW/Zk3hW4IQds9OGVpDp3fi0lUWwOzcZ7ycpv
 uyHM287UT1bHu1lvF6cjT4dnJBYqptA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAxMSBTYWx0ZWRfXwezZw1Dlqpmk
 QMztggIhzTccqpFGaAA5oIwOWOBu0waQ9CV0vm7inr+59Fn2G/PLG2VccaJuZO6KDQvGluRjq/l
 fbLPYwg6cNeqGLnDtxvdFu7eiV8P1Ba+fJKAuIgIuB8tcQEJViotoKwgAs7GYjP6TiAmcqTqwyA
 BxXeBFfZtuTM3owMj6bY1G5mMPbKIJvt1SghNlA7lTo8muhFl8R0DOxrAbUiyA8TC2/VBGTz/g2
 5OzsZIMGZildBBvYNL/u2M6QFTlqvb6dEVnl861EJMq6wygzbf2urWl005G0i9aLXRFxgPYB7gP
 rf6OLPgSy7ciYcIOD4DGeEhDZK10v4uGb2sz2F/uplWwHf83K9rkbAQEZaavTpinK1zmYXWqdo7
 /C9UZFRs/j51EkNjjNthoV8a7Tzd5txUWXFrOIkd3I439E4qfmVrUfxsxVWfQtywrv8mMe2YLFQ
 QPBT1QfG7srUFiVDtKg==
X-Authority-Analysis: v=2.4 cv=SqegLvO0 c=1 sm=1 tr=0 ts=6a695a52 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=9GNMV6-CCpsCGH9bzfgA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: MyHgwGMa_s-lortwHIW_Jaoczdzue-8a
X-Proofpoint-GUID: MyHgwGMa_s-lortwHIW_Jaoczdzue-8a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_01,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290011

On Tue, Jul 28, 2026 at 04:06:50PM +0100, Srinivas Kandagatla wrote:
> 
> 
> On 7/28/26 8:38 AM, Shawn Guo wrote:
> > Newer DSP firmware implements a PD (Protection Domain) notification
> > framework that sends PD state notifications upon request. The PD exit
> > notification is unconditionally sent by the DSP with a fixed sentinel
> > 0xABCDABCD in the context field.
> > 
> > fastrpc_rpmsg_callback() treats every inbound message as an invoke
> > response, so the sentinel is masked and shifted like any real response
> > ((0xABCDABCD & 0xFF0) >> 4 == 188) and looked up in the channel's
> > context idr.
> > 
> > This is not merely cosmetic. In the common case idr slot 188 is empty,
> > the lookup fails, and the driver only logs a spurious "No context ID
> > matches response" error on every teardown. But the context idr is shared
> > by every protection domain and the listener thread on the channel and is
> > filled cyclically over [1, FASTRPC_CTX_MAX]. If slot 188 holds a live
> > context when the sentinel arrives, the sentinel's return value is written
> > into that unrelated in-flight invocation and it is completed early.
> > 
> > Since neither the fastrpc library nor the driver supports the DSP PD
> > notification framework, it is safe to drop the PD exit notification
> > before it is ever turned into a context lookup. This removes both the
> > log spam and the mis-completion race. A genuine response can never be
> > masked: a real context is (idr_index << 4) | pd (at most 0xFF3) and
> > can never equal the sentinel.
> > 
> > Assisted-by: Claude:claude-opus-4-8
> > Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> Does not apply to linux-next, can you rebase it pl.

Hmm, the patch was based on next-20260727 and still applies to
next-20260728. I pushed a branch based on next-20260728 for your
reference here [1].

Shawn

[1] https://github.com/shawngsc/linux/commits/next-20260728-nord-fastrpc-v2
