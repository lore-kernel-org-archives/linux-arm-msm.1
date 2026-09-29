Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1FF12F7EE9
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687894; cv=none; b=M+QJV2wvsICLjjmuEEc/r4Q0Bo4OOGNWjHS9rctLfa13zTAu/NBT5g0noDvWDTTxqySyDqjpzs9CWe5HdOzxgSoNvlvnppdNoRoFkdrHTT+7lifp+grmOt7xeOC2kQQ7wfqUfRQ/EDA8fRVzwkxX1U3qaMFRzlRa1GbtveAHCPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687894; c=relaxed/simple;
	bh=zxlynqi9fA8FlivDnTAJLSnkFbzFLM6PTRJzA0vvrQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=smB+ZEy9cx6yR5tyqPNrTobTIl0SG97AwJIQ5VWd0XGDJFxUK1/qaWaD4q1F6VoHXo9pB1fp00xgoCovggvlMHVDkQMOvN8lVaPN/LtrKLbJhKiEbU1vbpxExj9/jn9Xk0reFs+UESWEsiba11j/wwTPYFll+taVtjHRbA1E3mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KMil+mGs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HBId9aGv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KMil+mGs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HBId9aGv"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqfWb3936799
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=7iPBVhcUH178RCfdDLu69SKN
	FsRS6mvhRrQFeu8efrw=; b=KMil+mGseY6xEm7eHWWv6S2XW+SZ5ztlbecdyUKU
	UaOCljx9hInVasq+uOM/H+7U0aXW484crJWmizv8LtQFXd27Qt8JLJuB4wdE5bLW
	Kh1irypBIOpRPddBIkFN8JdUap/kv3c25e/B9cScsM/6ofUt9W9vE+fzWi8NejFF
	rIBex24AlKsDV8prLcUQp6i24ItSc7pewZjRA8WXagr4W43rFnYo248m6boV5/dZ
	ppFmD68bqcga/3icp9430da7AkO9DKvXGdyFWiSgx1iZ7PpDLimil3hpqPqqB3VC
	b/+qDSO2rlXnfoLZvgH4wsVs1RpO0iq3sa9g87B/0kQ8dQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0bn1gnmb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 13:18:12 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7b4085d29d6so406450137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 06:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687891; x=1791292691; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7iPBVhcUH178RCfdDLu69SKNFsRS6mvhRrQFeu8efrw=;
        b=HBId9aGvdBby5KTP/ewuNd86FmgOar/L1DERs/n8QLqI5VrRxqoxbsHcfbEAX2ZBh1
         HY2fPiyPle/m7CLWBAqT/qJWbjF/f5KTEXGuYdO3XY6lGtSXPX1gl/M4gdQHNtPN2kuy
         9pA0ovRsZEf+q8YVy4h7ow+o2WWOJMgH1vuzf2o/VOo2BOrjNKNie2OGJbW6wc6jrm3Z
         oc0h53ROKizp4bkfd8ZhqBYzCr5Nyn+q3DM4+7e3Sp7kOLNcSyzcRRX4VH3oumAZl5FW
         7IUQsb4/vECjIvOOXkW8MRYS38YSoJs4E1p7Lh5ybNSJ0KkBIi0Tqh2LEZLBsh1DXVAh
         0AWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687891; x=1791292691;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7iPBVhcUH178RCfdDLu69SKNFsRS6mvhRrQFeu8efrw=;
        b=m32P0ior/TvhkGG1n5W9aqLT0aVfjbspPNQZGyCr0dF8Ul65NuvtIke/LDMamBOW56
         EflUJ0dz/XGPm5cSe7IbeYGk7FyZbPbpsq5mochGJptxyowK5WRMJSDXNMa7gKxDEANR
         F7SjezjRyiiIQV4GoyeujQwIetfwfxi5jFiaGHu7FqkAy+BoJZ5H/zDk6GOdevRnqE+8
         H0MGYhsB64+kP5eJS8tbrR/KVApstlfICWtOnWGAeS8sP6hxaYS7eYMEAlcX13sBWi14
         P3vhTuHu8Snkvc8Lewj8bJhIw2r09+kfbtTuXNQFDVYqzzNz6kpxQM5+7GextqN4obNT
         a4pA==
X-Forwarded-Encrypted: i=1; AKwUvBy3njLzGaAKUj8TFyXJJuXnLreBXxfCkQ85CJ1a7a/Za1l4uOMg58wqo3NthBrCiOIFvp6KSx7e9PCKBh9z@vger.kernel.org
X-Gm-Message-State: AFq9FYJrGmnUguk6OVHFwCTl07dHVKdQDfDEKhP+odK6/1OHdaiMYbpq
	du1pAkp9SW57LluEYa8I3M+uT97w3QXEjZ5ua4L4qvsoeDkihx1LlfyC1qBGDUzT6P+bVJJ96eD
	P2/MKFmouPkNRB+1FhB8tXsfyVc9hmCnm5iCC8mGnBdrlpXCgc4qDf8B7ykMUVlWQ+U2m
X-Gm-Gg: AYBFou05FHNW3xLbPRa6jihedFroUMh1iHt+NxpvGXz9gc6WhUwmKQwqFOqNwx1zmpQ
	EOwsDDheS5qSo5PMQ3C5t6RpzTVGDVaqf18vVWHkzErLPHM1wtNjyPddjra1jeq78Z2rc9S+le5
	Lztr8fnWW/qsuLlFVexxfYJCzlPkWWvdLxHeS2x2jrKa7ea0l92OgDpBwQzTrapql2tg0O1E4Yx
	LR90ysG3MAAokp1vgj2hETKpals6LjnO6cw7gz08gxVUaNkcWpLORK/ybQ3y+6oai/6U5ybskEH
	qGC+asYJ8hFRyF3TD/o9lWR3UlD0Y/HkbIKQKeEVcT94XdY9BBU6yaj/TPLl+dSl2WbgpfaasCi
	CaaTPtP5rHvZNKfk=
X-Received: by 2002:a05:6102:512b:b0:7b2:7aac:8ccb with SMTP id ada2fe7eead31-7b27aac8dc1mr2849925137.17.1790687890904;
        Tue, 29 Sep 2026 06:18:10 -0700 (PDT)
X-Received: by 2002:a05:6102:512b:b0:7b2:7aac:8ccb with SMTP id ada2fe7eead31-7b27aac8dc1mr2849905137.17.1790687890247;
        Tue, 29 Sep 2026 06:18:10 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.162.105])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a00cfb479asm77089755e9.15.2026.09.29.06.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:18:09 -0700 (PDT)
Date: Tue, 29 Sep 2026 16:18:07 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Subject: Re: [PATCH v3 05/12] arm64: dts: qcom: pm7550-eliza: Enable BCL
 sensor node
Message-ID: <xttngc5acpc4bj626ekvbjcdwswnh4wjp6yiej6kbwxz7cdcv2@cj7gxywhskep>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-5-f5ca00889cf7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-5-f5ca00889cf7@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfXzDgT3pCmVZzn
 DyZJrXZBeKlq1sGpseMs8BdDlyyJJmh2L/RQdlYonE7NKjzK40cW9ihKOLBPTeCE1uVQzgHBf55
 VwARoL0SF4Huydvz8jZWhl1QL036MBI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfXzExPY4kZMjAU
 EjNmCjCrQ+DV09L3Z2dhNvmtSnDUdji32hZn2seu3U9GpgsBvLUtjQ5W6YMwJkGY6OBrLQWOqwT
 crzJ4x88i+dOwE9jwpDAIyZJ9Pav9HUa8rnLg2gQohT7Yw3xe329KQuuQxO599pMtt0yC3qxHEq
 6acwaFHSTQqk8Q7gox1EK4Z0sa8rKt7Ci+wpDl/xDX63wA+NMfyMpQ+uJ8hcmda+7DtD3C8H0f0
 cyAaaGmrCrkQznd9QmEiqeyyc6Ye/fUotc8Ri79s+KxXBUE0gIQXem8F0wH/EDeM41FDI2mWIP3
 JMOr0yD/nLs5P7+BySikRwr/bSFUJgNkT1yxCpgtD7plfW0X6u1NlUMEuZK5yq97T/bmffUK1Gn
 8BImbOsyNfXJqUSWyA2N7eGRx4GH1vM/m2JrnI0X8P+G4jB429Of6kmMnQ5k+BE6co7QbFvZFeB
 HVdkWyDt4u//aowM6Bw==
X-Authority-Analysis: v=2.4 cv=JMiuIMKb c=1 sm=1 tr=0 ts=6abbba94 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=6/JeGS87fU6CufIuUkUOiA==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=GBzGvGGi_yB6IOxyoawA:9 a=CjuIK1q_8ugA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: ipdmJHc0mS051jH8vtncWjP4TxUw6_Xy
X-Proofpoint-GUID: ipdmJHc0mS051jH8vtncWjP4TxUw6_Xy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052

On 26-09-29 18:39:37, Manaf Meethalavalappu Pallikunhi wrote:
> Add Battery Current Limiting (BCL) hardware monitor node for
> pm7550-eliza. The BCL monitors battery voltage and current, providing
> hardware interrupts when configurable thresholds are violated.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
