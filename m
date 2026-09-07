Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC844EA396
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 13:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787904; cv=none; b=TfOYsrR8lvcXhuOG50WQU+hLxODhjL13ny1EQhq5ZwfKL9ysrVRJT6WlgUCXTSIgRoWUHC3vH501hO7MeDHhjuNo4MFsSeT2eYpOve/yDJ5fbvBvlRZns8TgcE8N4TSeEOn2lAqqZxhOkDSUPYX477/B94MKoPoIWYTMTrKPINk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787904; c=relaxed/simple;
	bh=8ZGAGHOr7NVN0KR3XdeIRqRmKRqrF5dgUOgIMwdgrbk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g1i4kV9w2eN2ra43PzK62QMuxl6V9l0Z8FCPidp5Fkybrf0IM8uhD6d1N0DbE4EWAiaJlRVAa4op5K53aCA6cB1Imo5VTkHEtQOYRoAfGmYQatoCiindZOea4bpcMm1VatANCBGDajfTV9lrkUKpWMlQiF2ApSZI0Zk3ZPpWEss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cE0ww8yr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dHFMzpqi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cE0ww8yr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dHFMzpqi"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687An1Xk3180953
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 13:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3kkNuPRvUTyM+QmSb6oELf+9
	QvK3eykU5arY9ibysLY=; b=cE0ww8yrah27Sy5bFMJJ85wijy/lNSSTsb2q731+
	wvxtVR1xfQzd2TFBxLD8XRxIujzFD329MsQS2N14EbaFalOozGYaaGqr3Xe0G0Xf
	QOlqqBMOxdoHo0RKmF/U81n3jZD8PA+raWYfj9pPQySYsWYNA6J+BouhHEH2PrHx
	HYx4ZMXpL1j3c8Bv9DXNSveTaD8Hmuo+3MNtb4YValJ0AlWF9MFZMOGh+N8fI44L
	lcmLKfIOF3jGivuHgOYlvMxCQlW38PRFex1FprNSJ4dVGwq3lExaLflnfzOwSQdF
	m3xNbsa+ToXqq1v8Khtkn8rY3ANdnYpYSi3AOeRL/OYR2g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsw215aq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 13:31:40 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-738b76cfe03so2951318137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 06:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788787899; x=1789392699; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3kkNuPRvUTyM+QmSb6oELf+9QvK3eykU5arY9ibysLY=;
        b=dHFMzpqiJD5zzL4IEgeM93W7GuqPWhxrP97/gWXKdujdNd5dsHDl9F6l8AFOergRZ/
         a+6mf2D2k7pkG8WHf8Opz9N0qqb+eV0ZrLsUkaiSXiWTdNJEd6dCyjjBzpQT9AIN4Jab
         95uxIvFphd+6alHDz/yEaOtIZi7zeB1syzGOe25mWgB2FPR0b+DZIFUf0faflqfnfuVQ
         c74EeHnviS/0Z6tJm3m4qo04OFPFCkV6WqClLuK1ER4OaL5va7u4arpPcfgKttP85PZo
         jyUxJ5oaU4dim3CYQ+B+7TgoSMuC/QOZCksh9VArJZaI2WGvM//ugdnX8uMBXEtFf8kW
         CMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788787899; x=1789392699;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3kkNuPRvUTyM+QmSb6oELf+9QvK3eykU5arY9ibysLY=;
        b=n2y6wDyb1RqpBH0rBokgHFQwOx8N7O/sHZeskN5q1BiYNgHrC2ShA3IkpLFpXHxzqD
         W9ngbB0P89/IucJyRX/4gwFvwzXgImgpI1ATQWZYbncIpzMVwwmZjk/j2HMlHWcW2SLj
         ARZP9u5rbLtTnvQtSZXU2Nl0tZakuUKlRwQQrzQWJnAqRUlGOr3KJab5E2GbdilJxxMy
         cvo/QKe72dEtSSnIiI3UuqMCCo2SYcQwduiCQPws1rUAM51nEutUZxjwa6ryviOydte+
         CRVWxbscNtB0mbkiiGCS3YQJgKebr/Mvz1hqdhCHr5I0rEmuAEpk4XYpFSNw74d9S1X9
         YClA==
X-Forwarded-Encrypted: i=1; AKwUvBxz0A7bUryK9Z4hX9mv8wOHvDEU8QoPLWZ4LLy91iNnkjud7MUskW/8EL6JVXdc9uPOfb8154xEx6Euligg@vger.kernel.org
X-Gm-Message-State: AFuF++lPjxMgWKMSsb6lqvifxI5VwqvyJ9LfAnk3jLmFEWc3N8tCYgCi
	562hIcDx4r4K2NPYzza9hf2FMp6AHBT41p4kDvAJC/qHWEU/Ot5JgG4Z5LuOpCtadqd7t/2TQe6
	t5QbNsT/k2ugo9ztQofL+NDb7mcn8zvUWW3CGqE0cJWcOBOA1SZGG69VtMxfA1Jdw5TvC
X-Gm-Gg: AYBFou1+iBa2kfLrnK0EFyLPSrGjVVC/YdKZaYA9vlHESx8Ks1VMg0ua7R+lqWpMEd6
	sn6CegRT76fC+4lZg75TqXsuRSgxfE5jx1cCdhPwh4Ji/aE33kECamFRHzrl9n59cbXtgGSDlPa
	CvdpW5B49QtXOIdg7rb6NcgGTXfWxnBVnspIkkPWK+teqWHZxtpY467zXTuV2grzjj4IjQhGtVI
	f9xp8xh4jFGGPo3BNFdJ0zEoV4rf/v36Fw3PBRog1v4BSqZsHC9k7T0SGU0ZIMUKNIuCh9odM2P
	RVZLIPDbkV31Kd0/GwwR44n2+RYiFsrv3646L5umQYmgHCmpLkMDq5oBR6NYylRA+0M93XoBCSX
	mR7vRDwlc3yGW
X-Received: by 2002:a05:6102:3a06:b0:77c:6bdc:824f with SMTP id ada2fe7eead31-78a4a90fc19mr9086709137.1.1788787899558;
        Mon, 07 Sep 2026 06:31:39 -0700 (PDT)
X-Received: by 2002:a05:6102:3a06:b0:77c:6bdc:824f with SMTP id ada2fe7eead31-78a4a90fc19mr9086644137.1.1788787899009;
        Mon, 07 Sep 2026 06:31:39 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d084d62b0sm124378275e9.2.2026.09.07.06.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:31:37 -0700 (PDT)
Date: Mon, 7 Sep 2026 16:31:36 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-crypto@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] arm64: dts: qcom: shikra: Correct QCE node
 configuration
Message-ID: <iow4xf2uflvjduax55tkbhaw2r4436uqvys22u6pbm3ry2gryw@g777gu46cgin>
References: <20260907-b4-shikra_crypto_changse-v6-0-0676f61894b3@oss.qualcomm.com>
 <20260907-b4-shikra_crypto_changse-v6-2-0676f61894b3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260907-b4-shikra_crypto_changse-v6-2-0676f61894b3@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: r2Hgm3u1OsbSpwzy8in8ksF7xQ16QHx9
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE1MCBTYWx0ZWRfX29/kqG2IFzly
 dd0rZV/awXqZzYDOglxvkAJm0Hrwz1X7kOjQqSRWpc7IrucIKftwiOP8lNRwdX0Laa8ssV2M2m+
 a/tNvwwddUsjGvXhbzhyGe2rxkQcMQs=
X-Authority-Analysis: v=2.4 cv=eKwjSnp1 c=1 sm=1 tr=0 ts=6a9ebcbc cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=mSLAci9PSNYu4dxlomoA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE1MCBTYWx0ZWRfX0sW5qYUjNVNH
 CWYEggTqgbk0lZ4VElZJL6zG7ESCPpq4Na2K5bWz2/WqSsIK9JP9udOw1++kQA90HIcvVCT8I/c
 oXj+qLOBNRLc/qCLL++G3j8671Od9SIx4jzlRVzbwkqVBTTvSHkNwgu+YN9L8WsSgHUG4Kn8qaO
 wEzr9bUuAOk88yCQsIrQnUppgU0aGMK+9aCSJm1/xAndmc/spDkyUwMliACni8Rsm4QF2ucYkq6
 smIJTJInrfYus2oGGYPumzI3vX266P8VioVkBEx9cSF1ftQWHlPg8Key2BBI2VAHcj/5Oi/Rye2
 nbqq/Tem+pshncdMXaquccfrg6d+lV8ep888UcVrq2dw6NwwzAPVhMHpr+tL6TxYEdBO/iaRSYh
 A5PVWLsylgl5HvThV9OmcYweRrvMa/VdZzP9er2488uMjo48NvbbP7rEn4TCJ2XXnse1y5KBSCV
 mMSmHrPCJIbF3qi/nrQ==
X-Proofpoint-GUID: r2Hgm3u1OsbSpwzy8in8ksF7xQ16QHx9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070150

On 26-09-07 17:33:37, Kuldeep Singh wrote:
> Shikra is derived from Agatti and uses the same QCE integration.
> Update the QCE node to match the underlying hardware implementation by
> adjusting the fallback compatible and related properties, including
> clocks and clock-names.
> 
> Signed-off-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>

No fixes tag ?
