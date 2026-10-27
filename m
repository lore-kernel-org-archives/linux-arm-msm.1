Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793099521;
	b=EuhCebOb6zIfRxoQQk/YXzFVlBsXkw3BpHaGPFxB9Ox6RVpheAvh/n5naJPhR2zmx+Db
	 +5zwULgbacpJ4DUqX3fEuUgIZD5bKHjuvNBgycCh7bhIeVTfN0lcsGhNngnQlWB/otDEh
	 SOxZLsgDdqLJsIcd3/zjkriCmeKeYzVLWsFjMsZI5vLzEdZsxJe/oOYEKgreYP1rsy/Ti
	 VQPHJptoNvGcUUYrLFVr9LTWpznGghlcWustw8giPR2smnK5085yZWfVSu7jYwKBecmqC
	 xgf1SnnrxTGPffAtUnBwx3QK7JFxJYhQyf8jwCCccLaCpJZV1Y05Bgdt2XGjqc8xFzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099521;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FtCLJyhlU+SpPWQsK4RHlbtjukmxd1FVsKSyDoa/+wc=;
	b=tPt4VLZM0F+45TCPlgUPk/idWrk9wQNtLDDNx7a5a4EAeSnqoztSFFDzjTrtNEP7lb81
	 331mtkxxe98QsdjvpeUnhOjZXdPQCkGEiE4hLEawGTL5tz0/CefdaszYKEtoQAhYP3KhQ
	 uCHlEda5JCJrla2dXx0uKcvNHqR/Xl8clQBm/wxLeTLwAeJ48Bqkw3WU6edLkD6ee+AOG
	 DoilBgmx+hKFWSOrKqHNZ+xkEV7RXo4SkC8BtB03/j00FYUq1YgF99VGZB5R75XJqtbcn
	 mrl5zPo2E4n/gvwzFDC+2+KNS84fNFVjSriuf0g0bPGjsadl6dVXON31xvh6lHd/S9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W3BoJ6xW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ccMwch2j;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116E6606A31F
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:12:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 116E6606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=W3BoJ6xW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ccMwch2j
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeDG01936095
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:12:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FtCLJyhlU+SpPWQsK4RHlbtj
	ukmxd1FVsKSyDoa/+wc=; b=W3BoJ6xWd7t57pU2qjNrJ32YoieGr2XWsKmWDWTr
	wpfyEOPEpmjaU6fBJIRXpbhgqvLO+/oyq1KlZZvVxVMcXdMF35pWSv7t/sHJ39pu
	HP79jp7mp5dOERsaBIwzaWKDSQVqUdIXMf0mPjBoUVVl7Ilw0jzSVi9hf+bq667v
	oFhDecKIdSAteeIuPnmnzs4s90Cf78Uoun0LZll8j8K9uU/hafwPkUZl4tTid+2C
	XBZrHeyp/UCkcA6HdhSt2fLQvvoq3ey2rvChOw4n6JcNU6PFrODWgd5ZwBpib3sO
	CV8W7yM3MzwTwnCTzX63iHMBYS+jz/sZ8hzJjDxLHCjXRA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjfavthcx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:12:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93cb71b1443so893583385a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793099519; x=1793704319; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FtCLJyhlU+SpPWQsK4RHlbtjukmxd1FVsKSyDoa/+wc=;
        b=ccMwch2jldDtGSInmXmTq+QyKkyIoNLnQnoO+k0gufIPNRgGdnl9R/4hFhNNnBlxhF
         5FKRZvAQdlUPDQJL+nW+auFWW/UGiBjbAQmozBE5S8BziyLoDvRr3SRdb6OjIhKIjqaH
         AWxKeKXsnWKEBXdnL9Jf+Pa528khXOVoFSagc1YBCC3JnQ3PaBILVqdtZsFwR37P2Goj
         mi4lwaKUW0OyPb17l/TZDK8EsRfJKHtxMlMJAP0fiYFiv4sHwc9dwyU9jAmmxgjIFzxb
         Y7IV9HobzKExqpMcAdxyiqx+bHGeN4Y/d48znMD5giSzrctG3/adjKG+ggYE6vxM4/m4
         YSfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793099519; x=1793704319;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FtCLJyhlU+SpPWQsK4RHlbtjukmxd1FVsKSyDoa/+wc=;
        b=I0HUkIP0u5dv1gIImtuMHyniuIeAHF6zJp5IyeRh12b5hYpcpmyKpomtNZ59dzUGkG
         cooHg7m+vlRm6foMI//ISRd7UFL8zAxB/z3rK5LjvKSvwM0E49m8G02g37cMtau3LjlF
         cNlqDeGd4IpoPM7Mn8bPM0IIaiNb2kJB2mvK4we4VUul0BkbM49LWl2TIlx97wmsq85S
         JtVf7LU6Mwn3AOZF/z9hP9HxvyGSxW/OfjB+jDkZnxP6Dsxr61JnGvS8DvEOTotxyJ17
         4z4zX+yNZv0nQWc2SZQ63UxraEoRophX7ecQyTzneOQk5uFGotB+EiHRqLfLmZbqCbiE
         QfXQ==
X-Forwarded-Encrypted: i=1; AKwUvBzHTylGCZCJXyGU+areyZWkWE00p2dqYiq5W8FNHVZ0786rL82u8JpndJLtUlhRMxmaDAa0xv0y7PFkjAca@vger.kernel.org
X-Gm-Message-State: AFq9FYItCgu7Pc5E0uGKznNkZIAjVC2poVcfG3ssVMIjAdtTX/r1PU2O
	khKpWXg13VS0AUbyx7fiwcAFx2JSrAHvyZHijgfK5rkBUNURdTrBJDAGZvYvpgZbcQVqpUPJ61M
	+rZziDF70vRas52pO7q6biSL20+3DRHwJiNc03tz7J1ccC8/6FCEOttV8wCEYj/flDjH8
X-Gm-Gg: AYBFou3627w/DhkrQ4mOcxoiXEK7Znyqzl0Tmw5Xr3iE2yb7i5vLsLyLIkdHbASNRhn
	8+CK2s8MrOpazxTDyMzniLdp8Vf0CBLujJu5UhnMYMu9rHNq3Shk94uSmJ8F0yMPIfGVYm6bFEM
	Rc1CvePcZz3lj6EgdBgcY57iCEzr9A2Av5WjpxQ6+iGPIC9LOoryTolJ5Ib/XptHK1Hf85PmjBB
	ZTEY9sVSuRY3fgggXVPUfbmKhpl75+wkz00negjnY0PIz4td1E3QmxAE6/ZmsHdGbMDYIPUm0pX
	OQyDJcG+v/CnOgat3mKokm8A+CBrl5IWe1xG5f+aMzB+4eNWE+eOdIjhD7w4lA236nkP5CzVs2u
	N+4JgVb48INBdSome
X-Received: by 2002:a05:620a:468a:b0:93e:5821:2c5c with SMTP id af79cd13be357-940ef92bf84mr1471865985a.60.1793099519185;
        Tue, 27 Oct 2026 04:11:59 -0700 (PDT)
X-Received: by 2002:a05:620a:468a:b0:93e:5821:2c5c with SMTP id af79cd13be357-940ef92bf84mr1471860085a.60.1793099518606;
        Tue, 27 Oct 2026 04:11:58 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a359f523c0sm128773315e9.0.2026.10.27.04.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:11:57 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:11:56 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: sm8450: Add CAMSS device tree
 node
Message-ID: <gntt2dsfdsv6iptnl3wo7ys42adio7vogd7eomwuj75yli7e4b@vfn4n3shptrx>
References: <20261026224957.1115370-1-vz@kernel.org>
 <20261026224957.1115370-7-vz@kernel.org>
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
In-Reply-To: <20261026224957.1115370-7-vz@kernel.org>
X-Proofpoint-GUID: qZs3ZeYmUcBug62CT4sh2VI5kd973YPw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfX4b6eQgwbKUtA
 l7tEKzB5vLVDapmf7Yj6uFhfqSHGd5Zr1JpaiWZR/2rswCoDV7FgU2UKlrgjJoigpPGGzQJFEDS
 SfoxQwPzYVg0mzGdtIe/1yMH5oDUzDU=
X-Authority-Analysis: v=2.4 cv=EIeTQFZC c=1 sm=1 tr=0 ts=6ae08700 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=machDEjTdI7jPHO31ysA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: qZs3ZeYmUcBug62CT4sh2VI5kd973YPw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NCBTYWx0ZWRfX+KhzpmrxdrNC
 h0A9ThkwY8xCQ0l12EfR5ER151EYnQlcF4jzt8nLVQTT5jcyEazFW9uXIPUqK135rLROUFd8Pt/
 j4BoPuf13pCKKopyS/wZnfY0zA+hFGwlZ2Qdu8wKzHO3ISyPqgWKKflcZZIysWa6npTI6OO5Ypt
 xjgDT1ZeKfmHGqAwheN++ab2/EwLib42uTanRB/gbtuvMRNmzshnL7AsezLGMnvARuF4swJnae9
 m3cqfjJhYH04Q107iG9ERrA5XbuddaiozCBHi07az+Rb0ei5VZOpOqjG8uvti5TK2c1MxVwAmbA
 7Rr6sLWP5p9Lrxx5F9HLdiy4Z7r7dprPLZTluIBxwSctzVUb1XnpmXZMT43adCY/a1vdiu3gR9/
 cm7pTp1ascm/oMu3/GRVGIl5kM2WF6A313dn/lx5vMkibl4cS160BGgZwew7QLPKMWsoOx+S5OZ
 BesEu1Z+GQzfd3Mus6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270044

On 26-10-27 00:49:56, Vladimir Zapolskiy wrote:
> Add Qualcomm SM8450 CAMSS device tree node to the platform dtsi file,
> the CAMSS input ports are connected to output ports of CSIPHY devices.
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
