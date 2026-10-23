Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792727074;
	b=NmnPyc9g+m3Y4dNQlMofyFl43S21vNPP72L7qKMutdaxeesKnTqrcQxhGinYI93WP0dc
	 BvF1CMsgGCBoYZQXhHEx7llXJ3u/Ip47ib9AlFFVB07I2U3d5w0yhTTTlcl2nK/eIN1iQ
	 56+K+Q0Mh118ZLzvKzHxFrfeMf5Xs23sqzM1jjnYvVrQSiQbfxg4vbpj0kz2iFoM2Q2O/
	 ltpOdoCIOdsugjwHboFsdNiR79rbLBxeAN0t/gUg5xmHeu9NIQFqg4KI9yf/ad2cir8yW
	 sGG6/IvlVjlOSW+cZMPzs6uTPNjnKf0XTkB2VanmErC5/DSuKhetBtKY2Nb/nmfxRow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792727074;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rDVviVjGMtt9TG+XFk050wccC2aDhnzCOMB4PFkLb+o=;
	b=RmpSyXtGySm4K55X1xCJjE4D7tbP2WF4dJcYF83EQYmeGxn02pPAf+6j13yt/9NaYCbG
	 mBOl0K2qin8a6BzPXJ6L4aq7jzLvVZzz1r1o5sWyoj2dEO2CYg0Po0BQ7lpaGztBiZny6
	 5MHZxAC+B5i8AVSQjEtELinIdTRxx08BjcBYNF3RsSfu5lf/BlQwFGqIX9bYq5cNFMGrI
	 okiypK2Sivzg5Y4b2pOWo4eDrHCF2Hz9L1TJOdCPGOj0tvUdrV1zh+EmALv8kMYOKyWNd
	 Q4aMo2tqAfgmwH1bLAa2pdfk1OMmNeiSTN+UyJ6aujyoKjeMXo5rjdV0PkO8yLo0ZmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HGR+K0Y6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ia9isg9E;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3B9606A31D
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 03:44:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E3B9606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HGR+K0Y6;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ia9isg9E
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N1F1Yd267705
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 03:44:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rDVviVjGMtt9TG+XFk050wcc
	C2aDhnzCOMB4PFkLb+o=; b=HGR+K0Y6hv3tjU6JGy4GJhJ8z6ziq+8BQ4wCfSCn
	HmBc4nsKBrcYy2JHafV2oyTldGFfivc507qHTGq68kw5pIK+/pl1b1IPb4o8aYAo
	NvpCb++xRkwLgbxlXdJT7+sLLMpGAV7gDrhs8GFY0cmX6lbwlp3GqsdX9BDS7UYT
	Ih7dsrR6GiXgzBAKpZfb95YDy/Xnn7ZO7J23gUnA/KhjYpKy6jtN/Zp3wM/1fzMM
	59+yLsOR5Q1VnH100zc7UvVg9lFuSUjCIIRExcpDxqMcGtzhMt3o2Oz8pIJvlvL6
	gXsXRxpPxPKc0R+QTndiT2RIWSDv8L+Fu7KbOapxIXtn1Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmbhrhj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 03:44:32 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35cbea41088so653662eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 20:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792727072; x=1793331872; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rDVviVjGMtt9TG+XFk050wccC2aDhnzCOMB4PFkLb+o=;
        b=ia9isg9EOEG8SvBP8Xcu9KUkCM04oWNwkWKfmv9x+C84B41XkLrAj80hXt18VnpaLY
         mVYb3jOfoj8FMYteHL/O0nNBFEhPJrPIdd8nHpaFb/u/ujW7t7kyucAuOUbkA0nG9aKB
         QdlDpk985jmsNIOM4iSqyMXl16lmQQmIZqgL9bzWHYzjy9nokKHJjD6YJkZff4HUVydW
         VXZ/ERsFNLkM1gffr8zPLQT0CJrmInz9QKtTvQic+x1ul+HykIW3d3Hkh8DpYGxKE/oa
         +/K6IIbr9+uBex2iEiIcrqyQJYN0/tg11zsz5dAC+XYIPHPE+WwNLN/aN9vrnJ3JjBK+
         bCCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792727072; x=1793331872;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rDVviVjGMtt9TG+XFk050wccC2aDhnzCOMB4PFkLb+o=;
        b=ZniU4R5NFy+/9WsMKAV0H1kXPgmGAMjzG7cEAjTqgCCG4+hxWp9i4excLVFMPYp2Kv
         yDOPC5IyuCkpXI0CQBFBHtBDiqm8kGT9szvsRuGV+IK5CrM6zt7TZbw5dGqNhx8IOOIE
         iiPryLVv/1J6DY7OlG623IEw9ZmX0Af8bXXdvRoZjGUAe3vVAA1erQbz5nVyqSdcgEre
         OpDSdEw04ZPuy4wgbWwR7mxhcOgCBx7yeAsmXksb/90R7nbM/xRbrXACb/ALEG6AvmQA
         8wffLvyloDrcYyFDgG6ntb/y7GJlbOLL8uFBkFtzpWD+98u5Jr/bm0lTAMx5EKDRvSsP
         tKEg==
X-Forwarded-Encrypted: i=1; AKwUvBwST3M5gkiOibligiM9kHOqCFGAwxuUCVCDcJoDECt5i0StG/C6d8XQ29pJ+Rr5e0W+XXEx7yMz/kk2bm6D@vger.kernel.org
X-Gm-Message-State: AFq9FYK4jdF751IiWeu54x4F6xprprCR+vybN9m5bc2b6qqWHKXBzqWw
	Fauczr62zsdQ4mhruxSMlqBghC7p1Pqf/oewbp0DCv0PEISK7icayCI6MkU4c8l0xrEWYq3foAb
	fOB9yCc/Ih0li+p3QnopRNtIvzWAxMygeZDbBEwN7AQVjhbw53Evof8FGsodUk4ZAo86o
X-Gm-Gg: AYBFou0Pyjb6pz4ZpsiYFnJ1lBRD7LSp1f4ghsO3n2TjUF46X9VLQRFuoUklxQvnc8Q
	EUzpfc7i3NMTHfffV1mASwmymjOTkxjTHHOkEZF4Tfve+Roddyk5dd/VkAMkk54FJLoomSgrvbz
	c+Nr5JqvXCXdAiZ30ZwwdaAUrk5Z8zOM7+rK+uT9yeJOVoLsMXIMbiFGvDl7aSw3uT6rdHnhpIx
	ZNI128gkfz9Zi+WR0zIkEyl2aabCdt46Kd0KlBPFrTTSk65NT3G2JOt4S8wNBaquAv52dGxKV9L
	X3xzyLAjgEmwr0DJHrTyp9CU183MXWV8fG2JgWo2tHLExYYUZIYvSQXZXJrz/C7jl06rk4s17bq
	AcGaX6z3wul2/ELgNy7d9nABoFQio2UoO6f8BfAQtoA==
X-Received: by 2002:a05:693c:8804:20b0:353:7d17:9a86 with SMTP id 5a478bee46e88-369d9872726mr1282484eec.26.1792727071870;
        Thu, 22 Oct 2026 20:44:31 -0700 (PDT)
X-Received: by 2002:a05:693c:8804:20b0:353:7d17:9a86 with SMTP id 5a478bee46e88-369d9872726mr1282459eec.26.1792727071304;
        Thu, 22 Oct 2026 20:44:31 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9e10b5fsm2708799eec.27.2026.10.22.20.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 20:44:30 -0700 (PDT)
Date: Fri, 23 Oct 2026 11:44:26 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Yingying Tang <yingying.tang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, yintang@qti.qualcomm.com
Subject: Re: [PATCH ath-next] wifi: ath12k: change MAC buffer ring size to
 4096
Message-ID: <atrYGgGWB_zQIrc1@QCOM-aGQu4IUr3Y>
References: <20260610031358.2043716-1-yingying.tang@oss.qualcomm.com>
 <atcr70WFLxp8zreK@QCOM-aGQu4IUr3Y>
 <0423c93c-8359-4fd5-9ba0-17e5ed3927dc@oss.qualcomm.com>
 <atnVeGiu9Q07HyUq@QCOM-aGQu4IUr3Y>
 <atoTUgEIfkg6b29U@QCOM-aGQu4IUr3Y>
 <cbfa35c9-cfa5-4eb5-a203-09c9069e3b0b@oss.qualcomm.com>
 <atrJv0wgF20tmuDr@QCOM-aGQu4IUr3Y>
 <38fc5a6d-c019-43bb-98f6-ba6a667c64e1@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38fc5a6d-c019-43bb-98f6-ba6a667c64e1@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAxNCBTYWx0ZWRfX1nu8M+BtVlsT
 9cdx7xTnfXCprUoWGCpeM/dqEyEgl5nNzcL8bH3gev70w9WN5cAqtcQXVVvHqag5Fvq8g7pj6pc
 G5EEDQfbHmtwHPs9v2ZMCtwL3vtzrxU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAxNCBTYWx0ZWRfX/0vYC80XxeqY
 oshyKZW/bB2wZmwxWvaL/Zw1t3NiJrLRWAap5zc3F2RrHoHvVeg/5TCaVbfgbHMSt0PKSZFO9uS
 DF01cuIRnJuABx9mLTu/tqvOxsOxBITB+mqzNflV9LrRQZIr0t+6Fub/WJ7QNp2Pge7pT5LFywc
 qmeNcJnfwZiL9d7La0Yn7Y5v9AlfA70VpgdwZVDhtwRu4l6HmX7gJ5yIxHc5FuTQ9MhOUetaQoc
 2Wj8NJO/l8uO695VWH5V+mAxthnCFcSuCkgbUv4E8iXVY3WJtI5oloVHaB7Tm1ozvAlJaycF6Bh
 GnJ2B/AsWSReg/PyO0//3pd95wnYLmqgwkPCWUzc0CIYofLKPUrpMqfHdjF0o+7uP2/WqBrrmec
 hVR2cYStOSgiED3NDX0nhi779EseLoME9tXFKDHEGTiuUrU5l1hpKA2h3YTIl0I7UCFUcWZwtjt
 UXyynBnMc8y1zU9HaGg==
X-Proofpoint-ORIG-GUID: PQr6UPsckW6d88SkI9pa0-r6DiH0t8Ym
X-Authority-Analysis: v=2.4 cv=Nt1E4MdJ c=1 sm=1 tr=0 ts=6adad821 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=0oYm2DgIxsn4U9MLWVAA:9 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: PQr6UPsckW6d88SkI9pa0-r6DiH0t8Ym
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230014

+ Jeff

On Fri, Oct 23, 2026 at 11:13:56AM +0800, Baochen Qiang wrote:
> 
> 
> On 10/23/2026 10:43 AM, Shawn Guo wrote:
> > On Fri, Oct 23, 2026 at 10:13:18AM +0800, Baochen Qiang wrote:
> >> On 10/22/2026 9:44 PM, Shawn Guo wrote:
> > 
> > [...]
> > 
> >>> I bisected drivers/net/wireless/ath/ath12k between v7.3 (broken) and
> >>> the ath tag (working). It lands on:
> >>>
> >>>   15f7603b69a8 ("wifi: ath12k: Increase RXDMA buffer ring size for default memory profile")
> >>>
> >>> The previous commit, 643f0bf93617, still has 4096 entries and is broken.
> >>> 15f7603b69a8 changes one line, .rxdma_buf_ring_size from 4096 to 8192,
> >>> and works.
> >>
> >> thanks for sharing this. I can repro it using the 481 firmware once get 15f7603b69a8 reverted.
> > 
> > Thanks for confirming!
> > 
> >> so the rule here seems that rxdma_buf_ring_size must be at least twice as large as
> >> DP_RX_MAC_BUF_RING_SIZE (I also tries four times large, it works). This rule looks
> >> reasonable to me, since WCN7850 get twos HW MACs and its firmware setups rx_mac_buf ring
> >> for each, and each ring fills itself using the buffers all from the single RXDMA buffer ring.
> >>
> >> maybe I should submit a patch mandate this rule.
> > 
> > I'm more concerned about how we would fix the regression for 7.3.x stable
> > kernel.
> 
> we can try to ask stable team to backport 15f7603b69a8 ?

Ok, I can do the backport after the commit lands mainline, assuming it's
part of Jeff's PR for 7.4 merge window.

Shawn
