Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793265235;
	b=fz7mgV8DkiLAhcytmDHTVkeEnZ9g27bmQ7cG0NIp8eKGkkFH1L4iPbUkHGT3UxR2gFZI
	 Q9GW1Gxhzj8aKw6erV/91tLEq0tkml9KfK54ZEkl4loA4ypQnHbTnpnT1ktglRyyGzobA
	 AdeJkxe9+8EOhRqt/fgSIEhvX1LgAsEM+4KFfh3D0heVb6iqlkzGW8ndM919MN40cVqkD
	 TI1TSA6a1HTlLqcRUAclxbjDt35sDgnqXuB1iaz0WKKTNwLYDi7e0SH0Qn++o9S0kT8uR
	 CgKa/hMCJAM1Mut0YWDGZsBiq0mMceaz8pSxAPW8Nh5JKA+wkcOPuEUjhqCYUVOwaBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793265235;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NFI2tWyPhBr82xP3dv2G8dPBOkHd5ea1/Lyuc2i+joM=;
	b=cGF2/guMWY5PwQoW/2T6VAS7tK/j+rYNw1XyHbNJb2uESq603PNHlPqyy1xKrmfnZeo+
	 MvlkQ7K+sbWXAChAq+EEHzEpvqcJ9TmZHqYDoUWm/FBEt+QPjX+JEQ9EdIslTJ0gN+Vq2
	 xi4jaJAWvKoAc1apMNqqdWjbmljqTIS4CqBOkKnhoPKY9K7BC0lQQuabZGzagew8zxVxa
	 DNcozekNIhnR6O9o92GLUAafLxEmOPm/YT+5iWFhWnb6J3YjE4IC4HOTlgT1Jd+EC0/uy
	 vL/TyWs5Lm+klUEl2tcLdCdHkZOI4yOB5we8m+M1m64L1WjufFP8GOCUWDMeVYgFQxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VXnCYEPe;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KpXeVObf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C825C606A31D
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:13:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C825C606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VXnCYEPe;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KpXeVObf
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T8v9UY659653
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:13:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NFI2tWyPhBr82xP3dv2G8dPB
	OkHd5ea1/Lyuc2i+joM=; b=VXnCYEPe9YSbImLRUGuQKMURvR1ySaRCMl+Lj18Q
	Zx/ZHn2zb2QOwDwsXCgHFMW/SK60JzeWnBTtmK6+GNxO0FDtv7NtFJxr3VvymlQ9
	QK86BjfqS28+DXntQgb2c3MaBrg+E6hqyyG+psQ7bCDTvUlg97ijl0j3xJD6i6D2
	ns2qANRayGrXABo0yj8EdBJj4/ogpvM/MapqjgZ68YKzo2W+PJjfgkh4NV+tj9um
	WJ/tLxnCiMuegvo6nIyRBYbJz0/BocifMlD7qY53iiVoK0Hi4OT3g3SSypWYg+C6
	rbfJE/HHMumMA9vntiYt3UsIA8d6azj2jORsw/g6zubMNw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkkehuuqn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 09:13:53 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ada8bc8575so3298968a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 02:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793265233; x=1793870033; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NFI2tWyPhBr82xP3dv2G8dPBOkHd5ea1/Lyuc2i+joM=;
        b=KpXeVObfHXYpbSCWBX6V1TXXfFuXWVoTDA7RWHMjzHFp2hLDxR9OM72umo7I7Tds8X
         wcx6f6s6YnTRfk7KrfM75cLEyjs+17UCN07PYU5+TdilELBigSsTCUJAvsMygVyNQtvb
         xRbtn9pymIbU1EvnfVeds+Shj7x9GVbKWDmKyPh1Ua0RXvXVp+tVvJpRgrQzFiKImU2Q
         hzZWveNAS5Cy2QX2EykxvKpxep5FfRsKn3Z+jX22a7f7yF0/QjMkWYy6QPGlllzMn8Vu
         AbG066+3wGf+LSxZmSeNOPyUYgpKSBC6LXioX2p6VlDtw9wMUygVIQxZ4HdqpsCVMiUQ
         6g7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793265233; x=1793870033;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NFI2tWyPhBr82xP3dv2G8dPBOkHd5ea1/Lyuc2i+joM=;
        b=2pnA8g9nUtscx4mZZ1kacJFwn9VtzdhY7kd92Pj3wv5/CtZC1jmvd+brkcu4IqdHLs
         7lmA1HhJqvkPGVvGTSyqdSm+VcIhANvdicCORcJWP5+2Mhz4mIJ7wyTtV0kx17BJzMGB
         4KCuq78ntDY2COoKu/GZIRWPHtnYeq6Wn12Fr/yOwvmh1Qw6yauANysX3518s55HeFE/
         gtbkeOUn8L7F2AsgHHr2o4WBFqs6KMpU+NN83Pgb09XHhUdkMDnZq60opiBEdApK1jxr
         c3lRfOx3BMzXKPHWPoWqQaM9/Ytb048TrHIV7mLfiJgtwVCwUWpltB6YZkRTDKYu3yY2
         FvXA==
X-Forwarded-Encrypted: i=1; AKwUvByA/vjH695lBX8gKU8w+UtpczXMGY+6cZ+tQFMurLJD/+iwQzlivgYDm5eWRuQ1nIbKGfbWcJfKEJdQNHWy@vger.kernel.org
X-Gm-Message-State: AFq9FYL+AV2e/+pJQHjFVA396lpBGyY4W7EOfKsXMLdrLBmFiTV8zL8U
	+3Yk9ywckBd5BEqtb6mvH4BQbxKjha0zVV5FLff14TESsB4CiCbxXemgrj9pecZ/b0dtKzM1/wL
	chofIFHaflkVFaNJx88kuakRIfVRwuFdGboLpbdKgVAx4lF6pxauZGO6Xvb1rrGdJlYtQ
X-Gm-Gg: AYBFou0dSPnC6Qgo6gUqq6NPvGCkIWi117N3D/xt2dNFEsz4GUqOsv7u5kCI6T7OE52
	CgImV4HQXoljLPCiBVzF19kBaqeUY7oWkkCl0AxtASMZLJ/4yAHDml6H6OCT8QkLTp2JGW80Ijm
	G/Jqn0v422ANkYP7H8bXAiY320OEalgVnYwoHYoDBWgnePoDBPaGRITj8yg3CKQyTzw3+p8omHP
	diFqxT9VvTCzDGk6pclNeC0LA6OXkRISQoDYSL6FipcZwswRQOxszzeGwviNWG8joo4pzLc5xmp
	mq4v46bD/rRh+Tng8bgc6BnvE/9W+2AnSOuck517vNkifhh0a2qavgrn0a87gDDWIomkOjR/+e4
	QZDe6fBiPvUFm/Du85ERp1RrwuKPiQjToMDT+s5tzoktqgyCmYGNsm4PbFgwr616g3WPAKKx5Io
	YZ43oPPlkK/5vDUHI=
X-Received: by 2002:a17:90b:1c82:b0:3ac:4291:f569 with SMTP id 98e67ed59e1d1-3ae57df557emr4015075a91.8.1793265233234;
        Thu, 29 Oct 2026 02:13:53 -0700 (PDT)
X-Received: by 2002:a17:90b:1c82:b0:3ac:4291:f569 with SMTP id 98e67ed59e1d1-3ae57df557emr4015054a91.8.1793265232701;
        Thu, 29 Oct 2026 02:13:52 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e8401casm3428556a91.11.2026.10.29.02.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:13:52 -0700 (PDT)
Date: Thu, 29 Oct 2026 17:13:46 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 1/5] soc: qcom: pd-mapper: Add support for Nord
Message-ID: <auMOSm_roh5S-DTY@QCOM-aGQu4IUr3Y>
References: <20261021073633.2163128-1-shengchao.guo@oss.qualcomm.com>
 <20261021073633.2163128-2-shengchao.guo@oss.qualcomm.com>
 <d4349c3b-f6c7-41c1-963c-ca0e21e2f436@oss.qualcomm.com>
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
In-Reply-To: <d4349c3b-f6c7-41c1-963c-ca0e21e2f436@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: iy7y2j5-SYVRY8WEAuYKhkilgcZpD6Pe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAzNSBTYWx0ZWRfX0C+k0/5aNiBM
 3A5K0/wXT/lYQjudh9b2A5UoGL2o0mvQstdgiF4/m6d+71qjnb7YmgprK7B8hOyQPAW+6gpstG5
 Lk2Qye7rpTzWP58MN5xIHhxVADm/jY67PhHjLG2AANGAm+lZaLAledu8+r0UN1+Bueq8k73i+l4
 p83/fwde5GNoBpl32cPTPGSuLK/k08p9rKxJEv9ftOKYn+XYk7Ct0fKEMUmCMh+vT533tDg25y1
 FNpw1hual+uHrSXCCt+gFx01Ah/eJzXPjuIrgSKcn4tj6ZTGD9EVLOsn98U2Boi2sCtSm4UljAx
 +ZUWfE/6dJQxdziwcDiLh/yPh1YnobtNrNfGdRie23CF8MvRBKLjj2wcr4lPnh5QJCo3CQgt6xX
 vqS8mZ6tz1BFfOC+aWwKxDySTe8icdroB/ba03lgNd1eL/nzOvv5ZZoFJReJeojU+RHpxjpz6D6
 jp1GNhBsBEmmD5teyOQ==
X-Proofpoint-GUID: iy7y2j5-SYVRY8WEAuYKhkilgcZpD6Pe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAzNSBTYWx0ZWRfXxZ4BNeoxi4rr
 OmAQy7jfkVoCGf511Q9NTwGWocKqX2xyVBG/QsO6W3lU1KhpW+tILy9UQNVuCWmNcT5ZUPevnyt
 tcTQC316Vc9NnKAMo0JjOY3K7I2AC9Q=
X-Authority-Analysis: v=2.4 cv=bYv+w+PB c=1 sm=1 tr=0 ts=6ae30e51 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RyhwSFVHSLl6ccd3bA0A:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290035

On Wed, Oct 21, 2026 at 11:56:55AM +0200, Konrad Dybcio wrote:
> On 10/21/26 9:36 AM, Shawn Guo wrote:
> > From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> > 
> > Add support for the Qualcomm Nord SoC to the protection domain mapper.
> > 
> > Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +static const struct qcom_pdm_domain_data *nord_domains[] = {
> > +	&adsp_audio_pd,
> > +	&adsp_root_pd,
> > +	&adsp1_root_pd,
> > +	&cdsp_root_pd,
> 
> I see 3 more CDSPs:
> 
> https://lore.kernel.org/linux-arm-msm/20260929155152.1898666-3-shengchao.guo@oss.qualcomm.com/

Yes, we have 4 CDSPs on Nord, and they share the same instance ID and root
domain. I will add the info to commit message.

Shawn
