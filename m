Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64A837F011
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 02:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785292623; cv=none; b=fSgh5nssjbNqRLxPry2ASbQ3lrAKNfB9RKuXDzuN4TWwm8mE5SaKD2oYLtBL72PTZBsljC4ReYMptA3Q4+0neZjTCvHC4MKMOfM7jHTnbhfFQZN3F99pTdg5pT7NTdgNgyTSakPr2ztgHzeRE7yMepDXlAefS3Y9nlQyfUHfgWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785292623; c=relaxed/simple;
	bh=S471m+tdpEr9wmUfnxiHe9ToeYW5aFGjn+EhvG5fI4o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YN8+Z0WzwmhdDPWiwIPDFZczFroVYynLKhFBvQ5/roPnTNAocTZTGQNpgAqWjtFqJOcNLLE0EhMvttIPcf9Cbd0wIgq2IVRWQY1ua17Mp/TLD5MQ4H0PSVCPvYmmYQWsOu1YTzC+3G2btceVioUHUnJGnpVdSEYyJvCiBim6Sgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FQOTOyFG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K/8y5DzM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FQOTOyFG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K/8y5DzM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T1Gq71088934
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 02:37:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=N3pzCw8Lm6+
	R+Zm/K8e8vhASXvpOVrEIMZaSYBWoJt0=; b=FQOTOyFGpbsr5cCH5J12dKCfFKu
	ZmZHl7OjS46FcF5KTB1i5ohBon54ivp6sRtlJFjI8dQIGm23afKnuMTHGY5CSv+3
	KtudImKFM55Fu33DgODv4RaWXBh3d7FntiVFtGdIA8IX4typepIQgatjJX1RjArK
	L85zwoALkg29wSztifbwlUqlQiTAhCHGhcu7LCrMMjSEj9S2ZVXuM1AUDdNMbXqP
	qyVEhhWrbfcuE2KQDd4AXpvCw0pXJt3waciapg+vBzbjnTZaWnxxL/aAYzCDr2Cb
	i0esIY+1PFVooUpDF/l2WQEHnYuwZzKjuTBmVb9gX7DXpxGeZF7qUgKlQow==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpvd3kjgy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 02:37:02 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f005ae3d1so72912a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 19:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785292621; x=1785897421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N3pzCw8Lm6+R+Zm/K8e8vhASXvpOVrEIMZaSYBWoJt0=;
        b=K/8y5DzMU4KQ7HqRsTqQcJnRD2L8Z3MHdWL9EVZVU3jcD5oBUW7yEc13tAwyCru7/0
         pk4HC89iE6HqOFGyor9LwJRTUSxno004+W41uaFEyLvjwN2iQYiVY/RJeH6C5uGMiowr
         r7FM0FqTeeaOXdixIqNekCyZIEfITh12J9YqkmA2EXpSQvXhLLRh/1wbdh+xiSj5+Yfn
         z2ly/M9lEwjavOUEMacQEnoeu2lcAQpuzrS8U2GX82hioKn1qMxw7qX1FedYLyyZJI5p
         La984OWm5UazdAhKsR1euy+Do2Az1SBWeEkyK2xwtOQKol2/eDtDeVHBU1Mtm6tW3TDV
         IVPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785292621; x=1785897421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=N3pzCw8Lm6+R+Zm/K8e8vhASXvpOVrEIMZaSYBWoJt0=;
        b=UMTHSGvUNRh14sYj8K823VjGdvAANaBGoKKhAyeSr45H3hlykM4H2qeNWUKBbMuSBR
         O/MVIdrBryc93s2gqQIDN4yWvYppKr1vPJlz1trfVVahZ8ejYpWhhQNCNjqmyr5GRq/Y
         2uJXsJnR4xBzlkz+Yfbh8pcDpyTAs5k/1kKIFBZSBaaCSEPfLUYO1/b+8FmBjmpuPQK8
         Fzdv7T/la6wRa0inWGfZhaZRsx3g7JOIda4uiepGm4bbwfze4KHA7VyGh+czFFtuoBK3
         cWDJz9gZzjK7y5fU49+1zDaLexH7+/Dj7Tl/z+U3xnMf8Z6OYpfd9S6ixC61JVo34SDu
         3Qsg==
X-Forwarded-Encrypted: i=1; AHgh+RqneTRqeO2LvEifhyiqRuJ8FGz3c9mte24Ho/KNejSn+qja4UmysUMdm5g3Kl3ryPno8slYAOE/zImJnAMI@vger.kernel.org
X-Gm-Message-State: AOJu0YxJ4yyoRt8c+yDpWZ0Ao7Y+hTJ9UncuJouN0404+LWXvcO3qsU0
	c7fvAbqUlouGIvOnZgyGkJN10AnGdR3TsmbvYuxrunQcWg58o+L9JAXAVQ+TOvW+VnNS/A2D+OR
	UYDisMD8EeA+4E2JTjXaSyEo+2Zu6rDaIRcKXfN7/6GP+S8fAs7eViGNYdgp9bYM8WoB1
X-Gm-Gg: AR+sD11yBbHxgCM7l2pEu/xpztQPBT45EVfWx3kfC6kxuAfuKwEW9hjR+RhHkUx3Wno
	DWa31yOyCUMhE2reMCcWTcq6/n90BCIkwez6SlMTM8OKmsGc0nFw50jVHgdF1WOrs7GsmckQvpO
	MT44WTo4vZzbRGLm75FCOUeD87xd2X4ai4sygpb+MNyds9hr07ubH2Yh+xxf1cbSIx4tqerzU31
	pfSLME02DycVME5uM0crBVPeA7ovcpQBEHsHbCZAR3PNwJT1JY2TIQfT7dzw1/XG87sk+d3pEID
	ECjp/sv2jwR+0WebFP4UT8eq6lN45AG3yai8RUR6LRuy7sK5RGTxOjCC5lW1a2Z9G1bhw6tsHjv
	EpKdqmFIipzr0+zMvQUsAcFPMK4vw9lPi9ZnXoex3gv25w+AUVS4=
X-Received: by 2002:a17:90b:1b0b:b0:38d:90c1:2400 with SMTP id 98e67ed59e1d1-38f7c963fcamr3864592a91.2.1785292621312;
        Tue, 28 Jul 2026 19:37:01 -0700 (PDT)
X-Received: by 2002:a17:90b:1b0b:b0:38d:90c1:2400 with SMTP id 98e67ed59e1d1-38f7c963fcamr3864559a91.2.1785292620889;
        Tue, 28 Jul 2026 19:37:00 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13e72745b1bsm3737813c88.14.2026.07.28.19.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:37:00 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: wei.deng@oss.qualcomm.com, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: Describe the PCIe M.2 Key E connector
Date: Wed, 29 Jul 2026 08:06:54 +0530
Message-Id: <20260729023654.3840494-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: c547f8c1-7a49-4cdf-b1d9-22f00c6035de@oss.qualcomm.com
References: c547f8c1-7a49-4cdf-b1d9-22f00c6035de@oss.qualcomm.com
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAxOSBTYWx0ZWRfX8NAPlqaO1pIL
 OTZwlZq7c0+o9BXQ3FK3XZ8EMajUdPsxWKiCIINCl7P2+9b3xYCFnVNSugDoOyMcT1TUSZsj5BW
 plC4PYrFfeoayzY70O2Uv8GboFYdHho=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAxOSBTYWx0ZWRfX+722UI61fDDG
 4ARfM1IRf+W7GRkcEA+DsF0ktUwXr/04x0LmJLNIpBAAU65ac8z3dT7Eip9nP4O8ZrwyfVe7Kcz
 FyNaI+DKOMavTu5JugAd4a/RK30QP9rfLHP8Anal3JfcGExD03c7QNbbr+H2LkxPlxdUG07+6lz
 8EsdxKJ/ngLs1J2fwx5ejfp78+ckknLt1YahyIlKCMG3sJsMEw/N/fOWYFKMY4JWvT2XwgeKLBP
 7Tq8fFAEfQCR6TLK9+aXGISk6jBezZE1yWMVnOv6YVz37pFthkW0OJNhpQXno87T8iGJ+kWKV2i
 4RXBOI0F92osrNiSIuDClFe0vBEV0GRv5z9U8U3LRrDb/e1XI/JalmmjThVrNN3VV6RU3V7hRH3
 bZzfNOmBb859gSspio3Lq9UB/YMROziyQSiy+3sDvc81vfqGuwwPWGFmIqf3ImIcFpliuVINgon
 FnmHyr9PyCRWGe0Mknw==
X-Authority-Analysis: v=2.4 cv=SqegLvO0 c=1 sm=1 tr=0 ts=6a69674e cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=moYCNcv2nuM3ObtSVBcA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: QNjUzsX1lr1xK8U-vyR2k0cfHsndYK0d
X-Proofpoint-GUID: QNjUzsX1lr1xK8U-vyR2k0cfHsndYK0d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_01,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290019

Hi Konrad,

On Tue, 28 Jul 2026 10:11:30 +0200, Konrad Dybcio wrote:
> On 7/28/26 5:39 AM, Wei Deng wrote:
> > The concern I have with moving these to monaco.dtsi is that other
> > boards sharing the same DTSI (e.g. qcs8300-ride.dts) don't have an
> > M.2 connector. Adding port/endpoint nodes in the SoC DTSI would
> > create dangling endpoints on those boards.
> 
> Is that a problem?
> 
> Konrad

Fair point. I will move the port/endpoint anchors to monaco.dtsi in v2.
I will also split the series into 3 patches to keep the SoC-level
changes separate from the board-level connector description.

-- 
Best Regards,
Wei Deng
