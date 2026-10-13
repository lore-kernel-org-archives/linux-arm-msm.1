Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010343B14B8
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791880873; cv=none; b=gzFlYbkWuX3avB+iLbueVbYeC3h1GdfpkO0lT6LuCPsyp+iFtC5a6BxHdDaOUDJGNwvSY42O8xFniiI+yx0x/n3j2/tBSvnbplUYxEXvWLKgzHYp9j9QIQS7tvoS7jkokKoIaNplv9eltxfeak9zpzp3Cd/Dk5fls7qPKR5hLfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791880873; c=relaxed/simple;
	bh=SZeSOfhpBgSklVVO57lQTd7F14WNGLxqtL0kCZFGdI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IXYhnMAkMsY45kbGMUN/fRK4o+m+1blcAwjM6bbLRhS9+vlCZvbGicRm5rLcxDDbmqbWNwHQu8p0kQEWsBwtXvn4L8TcrS6VAo/zVOSf+FunkxZyJI58fx9ucPGKp4I4GO2cgX9y25Dyjs0mXVa+YR2/onlhKgMKpca6qqdIP9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CIhMrirY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g5rT9E6G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CIhMrirY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g5rT9E6G"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D7OWNM015194
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:41:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QN+6NZQ51bJOafHGk5mxbx6f
	KGsT/rjASaeUBfF20ns=; b=CIhMrirYllT1+mJTgGVfBwp54dmEw0yGpfTBe9je
	mKswgHbOSXKuxYHb72LgcncVBngKDUurERoiEIsi+z0hO2bSC4J9WzPOZYEQlv8v
	dGGJWnGNy7NPWLE176UuuFQUVBMG5iUplS1c0c0KrBqVHJz9LWcMEUWkyY8atjaB
	XQkUjC7BJUsUsHzCOPvvTjXw3eb/sHEmkOeoWRZ6j+sBLmizbv/Q+WVML4mGv+0f
	gwOs8lu2H7A0C4LOQhVwRbUyZDBxfFCNGGgvKYGPxMtW4+7SoLy0E5R/pDTXLdOO
	nC7JYytoGHujxkZLPQFKAjl26blL4FTyzqyt6itNvUxIlA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9g7ug9yt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 08:41:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb6391e89so596058085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 01:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791880870; x=1792485670; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QN+6NZQ51bJOafHGk5mxbx6fKGsT/rjASaeUBfF20ns=;
        b=g5rT9E6GS1RJZxkCCBTy66oON7Lu3hU99D/ZMAvqkb036RDdSRaXloRz7eiVsWDCPA
         D2vt9bklgkRi42znZ1AqtbMBvaFhfDjIYztVXtQweSuzGsGCxxCn4C0VUuCxfA+GmCtW
         KEwplR7WsQsgEtaDk0SYBr7VlN3aF51MX+dX1q960kR1MaMSu0X084HR/oqK9vuJkBDX
         RS4SIwIwo18M6j8UW+OCDQMmNLIq8jw5SvAfRDJsic1CZS8r05bD5GY3yxtWzNWpee5G
         EvMwXqREWzsqdUK2fjILD+ArGnuZzu+g7T6An8ShKSSgLGIG02y85DDPMCtoHIJnaXkZ
         1pGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791880870; x=1792485670;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QN+6NZQ51bJOafHGk5mxbx6fKGsT/rjASaeUBfF20ns=;
        b=d4YsyUcUcp3l/g4v71BuykCz1pGxK5TVJWVxUeymW0JTm4uNh+Zg2ybsSNTqU6mETQ
         0ZtWf2rk4ZaAVcGMySNilxIP16QYXHGz9zKKR88GEAMhivulcZuUG2UJumEcCYU2Sh8Y
         zT5af6YRjpHu1XULaCvDIPHCL3JIO/xUUvAsmUlAA9JqNCII/0vJv7/1ds5452Hkljwr
         bDrhNDOu+qZrUJEdUjWoMrZtTI6DVvMaw+QVtgfzh9UDGF2+ZtxIQwxu/MtXBPpnnEBA
         4Po+S92dbI+RxwtRJD2l/vgDevKkWyd3jAlPy/AfAHtxM0RAyQsqs1lZ1/FGAzI4MNbt
         GGVA==
X-Forwarded-Encrypted: i=1; AKwUvBwNDXkSKQQWlaarN694xVekIXoOdGCi9ioGwhldJ3ThPGNMdMvODYmsOxboY/IV/dlymmDGRFZkguVJ5Yb8@vger.kernel.org
X-Gm-Message-State: AFq9FYLjHq38KhYjvqTebFmoU/ilPRxjLC/esYAH8zdkE0YaoaX+jSGU
	IuWTzD9PonqoY42ojN/jVkxwmeh9S5VC0BeBSIjfIXhXIIWtk/6GbONOzYmcsRYJhd8vEOGQPh3
	Fu5wOL2b8b60zqXihKcvvOJr2pq2DCvpEDYn9jHS3JMx9t2s9xJKH4dsS3/ECElSgLNqm
X-Gm-Gg: AYBFou01SySQE9fJZ++w8YfW5uLJdRbgrpq1kMg/w2qwbTQz2TWe/0m/m9vgaCbnecA
	Z7aYmP26WaXllo/qdQaTLvrX6Rn/rBhjtCKZzHuvlHeJ3sVKGU1cvCpxyyFM+539RXkUmPpNQp6
	460jkVink+F8QeUNVijW3smQ5TmAZDUM/w732x5q1LNdaYXAfx1Ujk6HTTOD4qYeJOWrAUKhUC9
	21qQ4f1svX5zrzVJR04q7Petu3lGPvXWlmX1s7f91kCyKA35jyJ+9ZSyf9J/sR+HWOrmL9umIq6
	hnxh5AcTFhKSyJbfBY0GHNHrh8mDM9mP547lU7t/3w2MQFhBcLmivUxuRfLmerEKBC/Ij14/+Qi
	hvY60h1fetKtkcDM=
X-Received: by 2002:a05:620a:2993:b0:93e:9508:8360 with SMTP id af79cd13be357-93ebd1dd868mr1949236485a.27.1791880870217;
        Tue, 13 Oct 2026 01:41:10 -0700 (PDT)
X-Received: by 2002:a05:620a:2993:b0:93e:9508:8360 with SMTP id af79cd13be357-93ebd1dd868mr1949233385a.27.1791880869465;
        Tue, 13 Oct 2026 01:41:09 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.215])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc4ec6sm3777164f8f.48.2026.10.13.01.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 01:41:08 -0700 (PDT)
Date: Tue, 13 Oct 2026 11:41:07 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, mukesh.savaliya@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] soc: qcom: geni-se: Split IRQ status clearing from
 mode selection
Message-ID: <ikemh4iun7mlbmjbx6u3ng57lnetsfjuznvvkxy2h6ifokjbnt@fuf6dvxmyfle>
References: <20261012-cache-se-mode-v1-0-22945ed0da29@oss.qualcomm.com>
 <20261012-cache-se-mode-v1-1-22945ed0da29@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261012-cache-se-mode-v1-1-22945ed0da29@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX2c+BQJwgymgZ
 YpTSYKMiIpw8Zy7d8ik2mAWAncsB7qOKYJF3yoAI7ZA/zdIIzrxGLcXIK2rQ/bdtJHSaXubcQaS
 NDCHtUoVf2W++Kt79b6F6o6egbzrWT6W0reIJuXyolKJkaCtr0muBuxiwZ0JHUrF/uRttIBjF2e
 +XEF0zzWTBgXLnF9iDlrHALB4+bSF0X+Q7PC+/c1dUN/peCbfdvtGLwQG3EeZm/1JtqkOo/S26B
 Sw0M2Uyhg+pwtLE3GbHIv4bnmUSa1eriTMUG0KyY/fftiMS5Ib3WHTGyfDAIv/UT8k5lMK+Cp5S
 nNH358C7EBDsQtE7ee7HEDzR8923Wp33NkQqZ0/dW/K7C3Mr1MLO85NG+AFSBCbfyOZTK9cz9pa
 KcUe4PwxUsR9XJhFlSfoJ+PUMbQNn/j1yB3qDeeGbusDk2u+Gv0GcRjZP4t1i9KxNaHHgIiKEHE
 8iTZht/JpWbnC5kZ2xQ==
X-Authority-Analysis: v=2.4 cv=Z495j3RA c=1 sm=1 tr=0 ts=6acdeea7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Rt3kCFFBWhWisHNmluDamg==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=jWHmtuPnX45FG6paAcQA:9 a=CjuIK1q_8ugA:10 a=ZXulRonScM0A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: N-lZVlKZ15BeBOqVPUqIIGgvr_1NhpN1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzNCBTYWx0ZWRfX2gHpC0JNuJbD
 f77cqA/cHtNcvGz2UDYPH4AC0gHCuQXX6zQpaGaDtj7SgggK4HV7e2fWlVyW/TCG6vQl+oXGQCD
 1cHRoZLNnc/g1Pv4JkEkzhfQ9VdlhY4=
X-Proofpoint-GUID: N-lZVlKZ15BeBOqVPUqIIGgvr_1NhpN1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130034

On 26-10-12 17:50:21, Viken Dadhaniya wrote:
> geni_se_irq_clear() both clears pending interrupt status and updates
> mode-dependent event and IRQ enables. Split out the status-only operation
> so cached mode selections can discard stale transfer completion status
> without disabling GSI event routing.
> 
> No functional change.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>

This could've been squashed in the second patch.

Anyway:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
