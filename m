Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500748;
	b=g/WMTRuJlRQgi3UuWg6kRXB0g+8aHEXqHAMUz6QfewAtQ7Vk1OArmPGrUGfoc2hI1R2C
	 +Zhs2Gtxyiq1vGlGf2Dlfi9/vWT9+AA/lGC5huxNaVd7ecs39N24P9O92RZQYVqhBmAEw
	 JKQfx8qxtI6IKz/EO9Uchs4vRqxChr68cZ4fjiuJnSYfk4azFBr3x/jUaUWXkVl6QsIEf
	 swCs4g4Pmgnd8K3CT0aEVQ1LigCMKa5woeRY4fD850q2NHWBfeLSruf1PHjUqML/upekD
	 HC5yWulR/fwxduD9+0wkCidoJRawQkR0K6fr7sgq9UJd+0wkE6mRQ/uEIoETMjQwpFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500748;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xdCT9mPPml0Q8wxCTcyjG2nS4+iWw9bwXUbx6nWuof0=;
	b=x0M/+DCLXQkcogCszgR97dswsdC/HPOUH2R3diCm0AaqE0wTj18jz6YYFN2NGyAFq/eh
	 DpfF8dv0IEBLpKj8Y+oApa9eLoYeAglZQ0U3a4PA0AdSsufeIAi/99VYpbgqejMbNTRrs
	 ZAOCq/FLz6JBQjfPCQdDLMbD+DGy+m09H6AqBpq/hPWSXuY+3cpRw/TJgGir/fldbjCQu
	 oxXpKog2EeiapsA+rxHgIe3BnqHBcB3CGOBfhTSH1/lnFTi4392il2T0fiszLpNmRgdtc
	 5W+HIsGyMqcXQYUgoV18qkZNGFRO2KL6OxQITOsnUpeBHYUsiN1N14zypqbGevvm2Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JUvMggwp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NKvotkgg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D685606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:52:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D685606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JUvMggwp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NKvotkgg
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KAxLUb600166
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xdCT9mPPml0Q8wxCTcyjG2nS4+iWw9bwXUbx6nWuof0=; b=JUvMggwpxL3toZgH
	hutbs4SCJOrpTKJft8P68vKHx/tLNum5fkeLv26k2g6LlQNPIks0jXoou2PGtzXj
	FEn8IO/EqIVxK6mgqQHSvuwr37HqFEyzmm5RVdR2s0n+9QpIISgqI38Tw91G8MIC
	NeE/E6XEeN/T8bk6fYiwDJ3KPRRi96tkKqCFPpim1d1OB62AZclx4QbvKa5TqeQY
	DJVu77NwPGTVxKvRjGM71WjITDk47YQvxwj/Yt0564H6gk+Hg8g1dtgBiMECM4My
	un7NWuvVIkyeFkb6gMunwPXCEeS1OHqadnZlQNiNVZwr6pRdXKq8zZbdmxE+n7ka
	CDzlPw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5n2gg4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 12:52:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2005ce21so559476285a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 05:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792500746; x=1793105546; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xdCT9mPPml0Q8wxCTcyjG2nS4+iWw9bwXUbx6nWuof0=;
        b=NKvotkggs/uunAeiSyukUFvAIPFkm7QjTKUiPq2/ujqpm9Q++FBmTYDWmM43BoYahy
         w3fq8mapMbmjQYBp26KjPg0XFYdjWLE/aIBEFfi2GszvLwRqZNl17Xuod9dJPFPp4MfL
         81QduXHIOJFXgbucnMr8HM5K+Vi7ZYhcp9QHd2QU8SGUMoy3wD2x757DIpXpnP4I3WzC
         ky8RGJBs9+MZk1IZ3Gh4Tdmc4cy6f2yNw3CWHLRJ0sbcFPfC92Xs/rhUednqjp6YRoGQ
         TZtO8IkrVxZgUFHvFlRxwby+bfP86uB28g/Nz1PrO/JHiTsXqkI875TH01QDJs5jW58R
         QQng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500746; x=1793105546;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xdCT9mPPml0Q8wxCTcyjG2nS4+iWw9bwXUbx6nWuof0=;
        b=l3+0d5nLcJj6DtgGilXWr6AzhBu9ouGX1aNmvthIO+t8bzLFLBiy9DQVDxeQ7dMHte
         rE6jyUgYIx2WR1611brjCk2cmld2Tadawje5OzuDo5etXNj8G5IVg26AsWR4cdnaNFb2
         MrY0xF1x9IEcrH0NCdqsRKZg67EbQqEn2pnxBXRi6RnYgjup0szKs/+HkxQx6pit22A1
         IMEeIvzGm3tNA98FS2MkEe0l1Xnsh0/W6ZwqZemQL5I2M1EkhMMqerjSK0zm1fFSH7kf
         Y7DulV0MeXT2rkisEcIFUDHOJNnoRK8xiPqLfHTGdfRlvoyL4/2um83/SMW06Iv86RdA
         dDtw==
X-Forwarded-Encrypted: i=1; AKwUvBzmubkC6w+Srv5fUkcnZdTURM74poPc9Cik1kS9VbljPjvIcLGxuCNzhJxmzjKgv8SpjD3oqGW4CHO7N7a3@vger.kernel.org
X-Gm-Message-State: AFq9FYI+QnY4LKaQYqOSDAO4JVna+BMGrMh/BVxIjK4rjxCrSilJa452
	MZ8tDLw/sk1Vst01PPusV97LJ0XCT+UXuKpt/SF+wZXjOYM0odsrQs8Us0rUt64npdmg05LGAbX
	f8Fz9bJWc9mujEpYY8i01nKP201oU3vPPx3Wm0JZpua/gP+AWZKLu9UiDkm2Pt3YNR9w/
X-Gm-Gg: AYBFou1f5KY/OapTjSQbJeYS5X6sXfURyBi3YRnEzFtjRHyrJGXZIPb421I1J/Zjm1w
	Qo5yKLeKnznbKvEkIyYRUsUBuqbR/zC8C0hTIV37GFmKQV1HT/p0rZMPB9pUNgcll12bVjTMgp0
	VFhV4kwGdB84+Yz2ZA2/Fl4DMHmBln4kPIyNVuQQITX+/oTlnBWgZEVGSjluoX1W7WtT1yFn25H
	Cr0HACKwKiAngHd+7WtQG9IwkGNg5uMol1IDH0gjB1RLhEmYNbm1u3GG83NgrzrbNwFPsjt0iDc
	hZ21yJem67LEsNbL2PbxHACtiuibYQ7ro7m+rzbmAHBNlBP7rH9plK+8T8iae9gEdD73FQObS36
	hd2DTfBVf1lxDj9fS
X-Received: by 2002:a05:620a:2948:b0:93e:d364:c9ee with SMTP id af79cd13be357-93f29dd495bmr1630744085a.74.1792500745881;
        Tue, 20 Oct 2026 05:52:25 -0700 (PDT)
X-Received: by 2002:a05:620a:2948:b0:93e:d364:c9ee with SMTP id af79cd13be357-93f29dd495bmr1630737985a.74.1792500745230;
        Tue, 20 Oct 2026 05:52:25 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d80f9b3sm5714688f8f.20.2026.10.20.05.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:52:24 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:52:23 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, gaurav.kohli@oss.qualcomm.com
Subject: Re: [PATCH 2/2] arm64: dts: qcom: shikra: Enable CDSP & Modem cooling
Message-ID: <isldc3mvcyqj3o6dzndztlobwft76zkph2lmlryki3qkpoxset@izxcyvx623vp>
References: <20260911-shikra_qmi_tmd-v1-0-96c1cca82f30@oss.qualcomm.com>
 <20260911-shikra_qmi_tmd-v1-2-96c1cca82f30@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260911-shikra_qmi_tmd-v1-2-96c1cca82f30@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=aIplOr9m c=1 sm=1 tr=0 ts=6ad7640a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=8nJEP1OIZ-IA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=WKeXBwMsz3nlfjH64nsA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfX+wuvSU2jwjAQ
 vREeVPO8hF+Rs1aSOsFewLDwMGzgolFzM/bzPlXwMZgngQehZRNEXClWQSSbgUOH7kuGvSxrPTH
 i+0D1Y/nRZVJisXzHhN9LlFrCOmOBgA=
X-Proofpoint-GUID: BwJnWwkkwsFGBHDrWegGc3SpRBqAMy7Z
X-Proofpoint-ORIG-GUID: BwJnWwkkwsFGBHDrWegGc3SpRBqAMy7Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1MSBTYWx0ZWRfX2AwhR4VFqrjK
 1Nq3G8aoezIOP1HdoS+8IaCePz6ZFxqYEwiX1rZhJHmQ3um34+kOXGTO7i9uR2yPN9ftIlPrDrB
 OKhBgRfqL7X2QyIj8siUeC96iHDVqs8OXpPC+RYm70LCrpaskUTlK6KkOt1qEnF1GAJxh4wWOS2
 8Kw/DoOBCvyGpDdu+BbFPkxz8/5ppA3mCYWir1xy+Gt9/yB2RyXm1YyYuhtxgJjdnaRRpwQuR6L
 AS2dJ2PL/JxtR17It8wx1Ny1rnBQsdQZoRDCzY+bUUCcUJ1y1LuecSZdMVp/+H6Fg+n6ec76HLd
 8xovcj69iD7Y3mdDnGNDPEvtBrQidfGF/Hmhu1iX1TwWS996Z4gxT14l7eTNu6dTIMB0qSMuuwR
 uPGMaDauCAFz9rIjRqH+RiKfw9w8ossr+zAh5rXIzdJGuA2Zs+GOgi6FDN8cMDwJtQ3dx53YXEU
 qUBku6BABpvUgOYHalw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 impostorscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200051

On 26-09-11 10:33:04, Dipa Ramesh Mantre wrote:
> Unlike the CPU, the CDSP/Modem does not throttle its speed automatically
> when it reaches high temperatures in shikra.
> 
> Set up CDSP/Modem cooling by throttling the CDSP and modem when they
> reach 115°C using the QMI TMD cooling device framework.
> 
> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
