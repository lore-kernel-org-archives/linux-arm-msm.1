Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506F34349B4
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 07:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791532353; cv=none; b=qYtakY60gshP8zEUiJxdvGa4GKPgLs88AAt8Cr1hD0bQia03S9m3gh8PCB6duFo/p/0+QPbcDHjXYEMlEutjp0V9CKy58c7RLY8iLglXyEOqggq/oy+XVkr6AXatELcVieA3NJMlM/3CSUfCl1EzITHRj/v064+k2kCri5k6yHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791532353; c=relaxed/simple;
	bh=kFdS6UjgyZ+sc5RdW9BqWyrb0+OVvxoQt9fazGBVrPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZtYWnahgxvbdujjsEJgx9befEQ9boKh2EImb3Qy83CHU5y8cwyIdysH10Y3B+Pn6RWmz403uedO++GTTv2P1EraDMKyesmGtaty7Twm8zYltJVAqzGLlO+s4jdjU3DfST5IG1Fq3oIP6M1EP3RoCitg/5jaRt5P7oktZrBUl8lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UY6O6pkf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KYjJ1lq5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UY6O6pkf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KYjJ1lq5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HCd31712596
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 07:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VBvSfEAeglow5QvR1GvNQDQm
	2rjRQlHlmGnHZrTDfZQ=; b=UY6O6pkfp6oOYJPmunQih2TlVC8L6CiIP42BNa6i
	puhIvcuD5xX+pv+5QaIGSoV/gzMloKAvfcLdHuQc0Pdk2+5epDBnxTBDDrk4e8WS
	0iE+7qZphXf9+KlSWjgVY8YgVV3StbhXo0rHkShZjyh2FusofBGa1KLoMSVmnbEP
	jYXc+Lq+O8lnomumWzzgagbG2vnz/WLJpSnvoxundV5pL1J+tOl6MJGDWbZFtXFq
	cctfsBpQ3krFKJHlfriwh0WTvVHMMdmmDFD/AdBmdD70Hrobi4v6FfD01UrleVzl
	gEjbsIzohQhRM1nMA7avPHhM/lBM2k6ILAQixD91L/KKNg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxwaj8k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 07:52:30 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-139b62317d0so21581039c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 00:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791532350; x=1792137150; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VBvSfEAeglow5QvR1GvNQDQm2rjRQlHlmGnHZrTDfZQ=;
        b=KYjJ1lq56uowoVJq30iztYx+ClZ6jim9Wm5D3ljlR7GwaaqflLaXd5Q7edX7FIb/F/
         lvRP5oCbAE/nToQP6lgAPwkj0n6Z4aeTwCLwM8BO+Qv9UTpmFFjQAWfuWACOdgBB1cCK
         OT7od7/35xTeAR6Cs0+c5I09NaTS5blYPj1VSIt9krXd0TztzGh//eKE71VAX+HwWlbM
         q3ZxGy3A2OBO2aDDUdQdsoYWU1dAOFCWpjKblGlvvmrE/zvOXtfEXhbU+YA+9o3tDNN0
         vxyXv+RXZ9RyvGioj2Ze3wsXpBFiX6fCE7P0GeD/GSpTMPRAe5KTO3WsO/v0FLT0HkxG
         iQtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791532350; x=1792137150;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VBvSfEAeglow5QvR1GvNQDQm2rjRQlHlmGnHZrTDfZQ=;
        b=ajU/iiputmEDLPXaH+1oLzEZKTHwjs8693F/TD2rl8GSEsM4dPJfd1eBj5wKU1eVFK
         wh+qmd6I1VPaGPXAswg3sLv5C/APJKbAypVWx8ZvtfI4MMqoWhCq1GsgLhQli7nTWk5W
         SKigLsr4Oi5nb2uO2k1Kx9SBnQBCK1TVlWLBq3P3hQwPMMj32n/A1nSuQ3X1rgvBly5s
         hre9YW0evwIp43WCw7JokRwJPlLfygNnaA7sCs/2TNnDEmTl0bbF4w4qhHQ8cabG4RTb
         M5pN6hub5fQQtQ8gvflVQyDQf40MB18jHrjnzih4tgcaMVPJ52VUu8JjgHF4QTOYEOUU
         Xo/w==
X-Forwarded-Encrypted: i=1; AKwUvBx+vJxwoMRnbigE8h59LPHDi8pNa7Eziz42xu7BJQwPo68Jb6wLz2fgZPgZJjVDBNW7CYHJQYJgzJpdaCpL@vger.kernel.org
X-Gm-Message-State: AFuF++nHbY0GYSYJY8tLA1NjCnC7JOMTXVawK5L+9/PpjM6buY619uwG
	wkvbSCXgdyH72x5SkFahV2EFTPmvSZ2E/bG/kgC0pR5o4v8lWWWtehxN/M/5b/STWIIwZ4tIcm4
	MBLiKegGMeIn3y1KYg+rBtGGdaRl8fjRM6xNLTro2zymccGQFcQNXrGnA6dH2MPOJVioP
X-Gm-Gg: AYBFou0dU48Us3ABWCuXHEDF8pUv5BZcmSbaaKFCKE3dG7Dmdb+dZAezVNvHWz05J2w
	LgdtL1/sMwZlywLB31AIrY8WyoCkFj3ErPlOnf2u64NPnz9bA4yjFRObshfGwxXNCKTBc739E8G
	QxkX21T808gshhyT6Q3WC3Jt9Ry5HUEbWxcpbarfSbjCi/0pVu+3900rrswahEKQLaDOm/DT22Q
	wtI+C4wq8W+aJbrk++bSH1OGGhyEvlL1f33T2suqWiTaNmeQDb31kSdhaf2NaPoLdihNUGJWV0a
	FGXDm/DBLxDTPZt57z+CtTUpLDde/Z9YvOjoovhOpDQfd6Hpk1sedEjnIjqhY8eORAo0vRXVzmg
	moeDpoqajqD21Zf0ATOSvv4p32U7En3+E1PCEgFBewQ==
X-Received: by 2002:a05:7022:ea46:10b0:152:3812:496a with SMTP id a92af1059eb24-16a65b0f48fmr1379482c88.43.1791532349601;
        Fri, 09 Oct 2026 00:52:29 -0700 (PDT)
X-Received: by 2002:a05:7022:ea46:10b0:152:3812:496a with SMTP id a92af1059eb24-16a65b0f48fmr1379169c88.43.1791532342879;
        Fri, 09 Oct 2026 00:52:22 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becb11sm4230189c88.4.2026.10.09.00.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:52:22 -0700 (PDT)
Date: Fri, 9 Oct 2026 15:52:16 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: remoteproc: qcom,kaanapali-soccp-pas:
 Add Nord SoCCP
Message-ID: <asidMCpsXHY62FFT@QCOM-aGQu4IUr3Y>
References: <20261009-soccp_driver_dtbinding-v1-0-40862f7fc58b@oss.qualcomm.com>
 <20261009-soccp_driver_dtbinding-v1-1-40862f7fc58b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-soccp_driver_dtbinding-v1-1-40862f7fc58b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzMSBTYWx0ZWRfX3M9i3RW0vD5J
 3Dj/jYon3e5p1VHO0jLX2xi0wdza1iZDOlLRcO1Q/Y/IEVYNCvYuP2KWfiPwk3Sv7LbXqbUQNnD
 FimyzoU0uxMLOo+MWcT+4ltlLwEuTt4aG9aNFHuqfHYQ1FMXVDgGmuSKvr37Zf4ETQWaJc5vVw5
 ueDJsM0mTt21cH5iMyJhlStMV0kFRRFiDbOU4ipvc+CC6M5hGU68XXxpjIKAciAaVw9aIHohWdC
 MiNAFfytMpvIh9Z6ZfT6Wc/C/JR50TvhULhniMN/l/aZZaeVLix0TUzT/5e5HJpNFTNyLxq81FU
 co9jiYZdxGPmHGYyikKXJCyBwDevlkp6qmjfRcBIdLmIqbllJPelmISdrO6AZIf5f78HJdbPA3e
 pTW6SdNgYxmSaWUsDVEo+2cXoSWYaaRvxuuJPE4P4iVbeBnnHZfaYC/zmS7tqu6BITklyordzpH
 hiJxHyg9+kZf0c30W/w==
X-Proofpoint-GUID: ftxKHUAwR2qJRvC5eYA8XhFkikJcRT5v
X-Authority-Analysis: v=2.4 cv=cMB1IVeN c=1 sm=1 tr=0 ts=6ac89d3e cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=HvrnEgK54qzgPO-vPg0A:9 a=CjuIK1q_8ugA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzMSBTYWx0ZWRfX7BxQhErMGtgb
 fnPylkVtXyk59NsxKrmWvw+0Ms/ARV08pLVztQsp352/1JcACjbNfuU1sYTmp8V1fICOoZ6sPwJ
 MK1hdnHQRVXW6xMAUx3pVV+GC2L59hs=
X-Proofpoint-ORIG-GUID: ftxKHUAwR2qJRvC5eYA8XhFkikJcRT5v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090031

On Fri, Oct 09, 2026 at 01:05:39PM +0530, Anurag Pateriya wrote:
> The SoCCP (SoC Control Processor) on Nord handles hardware fencing for
> display and other use cases. It shares interrupts, SMP2P states, power
> domains, and clock with Kaanapali SoCCP, except that it ships firmware
> without a separate devicetree image, so it cannot use the Kaanapali
> compatible as fallback.
> 
> Add qcom,nord-soccp-pas as a standalone compatible with a single
> firmware-name/memory-region pair, while existing SoCs keep requiring two.
> 
> Signed-off-by: Anurag Pateriya <anurag.pateriya@oss.qualcomm.com>

Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
