Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B83C4EB856
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 20:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790109722; cv=none; b=cezpPj6TiChd0Xx45ZiOLz6uw4JaRUiWRdP2Sw72q5rLpL1SD/sm7ZoEgw9oYSLSkuVlvyBDTkDgJOtOctntJdilVlgeI5gJeGlA2s/KpXwqnKU94EXPHm095PCM1BOtaE7zaUjbjnuguBD8GVPemHcv6gKGvUxcQN7URmCxZbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790109722; c=relaxed/simple;
	bh=vakGs22BbcNPWIXA0rOWiz3UEs+upsXFnGyjZNiJ14s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T3h2TuMsaqX/ZkG6JnYZj3xcd/EZq9ZbaLSHiClcKyeDF0zQo2XT+P1Te04krkipak5MOmzd9IhYyX8c6K2ILIOLcz6Sb2CJmJN5NquGk+Av8IrGkYVfzdXzaWXENxAKpq4UPZkEMdBM/DDABHCnUYeI0x6y5k1Fdve7K2+XQDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aA0+H6g3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=auBc2efq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aA0+H6g3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="auBc2efq"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7Bli1873680
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 20:41:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=381iYosL+3itKnt5YRFUwV8J
	LY4LD2cyjBXKrHQ2ChI=; b=aA0+H6g3oXd2Sa6hy5rldT9oCLIck0OdeO2hMwWA
	+lOS64/elxIhA6SQVJ2g9onAMk1vq4NMRfVdYqwpdbWvUraWiccVFHulQApfZo7A
	e+akbRWkGnFucV1PBRoMRLpyMihQyGUkHArG4Ulu7sfq0FXmzrEPKzIN4kpRAFxS
	KDP+uwgKchVdocWU8boMFiJpRw1Gw0ORe2pHUsTVuhhXOvyP0R1QqF+upcJ9HBrw
	jJJfe2m25FchMK/Im8DCRNUUtTXliCCVzWlniL2dEY7ThpUPZXIeav9Oglc6rueC
	cfx/gCZvPyQxHHzN0GK29/ShUY4h0WhwqCEMwnf1o/t2qA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guqk4u1e6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 20:41:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934956beec8so74089385a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 13:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790109706; x=1790714506; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=381iYosL+3itKnt5YRFUwV8JLY4LD2cyjBXKrHQ2ChI=;
        b=auBc2efqPM0HXKV23CLxk3ddObcdpwVg6OvjPdlAuMjQGBt4Q8hjPY5kxla4e5cpwL
         Qf/5f2hjUNAOcCxLA3vRniuBI1T5sAmt9Yb4TTieDtH8f9K/fNYw3qqN8upDyeRkwPZ0
         zHNN44QQ3MUFC8YA/zlw4hMIn3pHBkx7RefExWwlYJ31sAWc7r2s9ts0kFRlunlH6jdv
         AHu7ZS/gc24iJNs7cuHL/SjdGq4AR62BEIWMVzRjSEbh+CiR46FbEJqJGlY0G6sjozjq
         kkJfxg7QVG8E+OfL00dkjveGKEuSwIEMoChmWqLmXyxWlMYcbp6Rwdrf1aTyHU2DlGl3
         21Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790109706; x=1790714506;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=381iYosL+3itKnt5YRFUwV8JLY4LD2cyjBXKrHQ2ChI=;
        b=g72R5Ub7h5dX8yzkF1Erz+whXJx+EH7c5QgGBoqiZSK3ubCokB0wPJDMDOzKZbfZaG
         xVbRoCHHTw9UDErMtIN4hOHIo/R0k/o+cPJl9MKRWf8iGz/sqOMBUki34DfmU2eA/R0z
         pKVgRqKhED/R7fx9YfYPgjbSNoaGglzOLS5Ll3gnghTXND3WFDZKQtgQtFt/E/C2592X
         4iKss1q/N47FHCCs17I95Xcum1q4Em5yLPh9IMrzyJ3T9r1lKirAnLOEpyAEan2ntntC
         lRAPY97eXL5w2+vuAhiPZZR4hlouhy6dl7Lz3A5oSm+M3cPCZDYuJx/13HMvIaKIzheC
         ln7w==
X-Forwarded-Encrypted: i=1; AKwUvBzK19RC0FUkz0Q2/d9Hj0MrYMO21GmquAuodygXbjkU3Mzo04z81r/UAe5w5qpEhQ6hS2n7ShCn7VQRu4OU@vger.kernel.org
X-Gm-Message-State: AFuF++lToU5f5KDYike3tWGTy1b0fXGzZBv7u/LXSl4y709eHMUOROEh
	zjswQ8wxdUN8xuzR0yXeBrLS/SdAwupJsF4ZtFnh/eO5q4k77c48WmOH5DDO/DtRsOj0mAXx5Y/
	D+PfHaPjVWU/dbHEtbg6Upp2X0xcnyk0rfrJ3Jv/ZrXDOWNBFgt7F+bTzEE8K1+S47L3h
X-Gm-Gg: AYBFou2XIXr4xrrYerrS2SW3G//4w0AL+pEUqEHc3uQT2yBe5E9ztDJZAqCcr7QxWhG
	9oD9FuAUwRNDmGlyyRDky8kbTX7qxZodAYhbs0IZVMbuIJGw4MN6zZ6zXntfuQ1L/nqRKQSUaD+
	MCSRDQjHXbNpn6KXO0Gs7sv9W+rV8TRNNHUhB9UGSeDY+WBxTgDMMxh4sWiu+M3/95fspX1d3Dl
	vAoXpl76tjAMnFj5x1tYSlFBghxsP85IAOrqYMqR5VqWuAjB58muV6rRdmb8Jh7dUl6grN4rBim
	qeBced3k1gc9KHrU9012D704lsFfTKEcg0eKqXucCRR22tV0ZFlVDAZxJdF/gebL6nqTphKrrNp
	7u9Vc8s83R/Rb+TQ=
X-Received: by 2002:a05:620a:4546:b0:93a:10b8:4c3b with SMTP id af79cd13be357-93c25096a2emr96675385a.2.1790109705631;
        Tue, 22 Sep 2026 13:41:45 -0700 (PDT)
X-Received: by 2002:a05:620a:4546:b0:93a:10b8:4c3b with SMTP id af79cd13be357-93c25096a2emr96669785a.2.1790109705035;
        Tue, 22 Sep 2026 13:41:45 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48868779472sm1056265f8f.23.2026.09.22.13.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 13:41:44 -0700 (PDT)
Date: Tue, 22 Sep 2026 23:41:43 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] clk: qcom: Add lpass clock controller driver for
 Glymur
Message-ID: <dadpw3tpjoitgsm7v7l2wt5jmzdpj2zxjxef2dknxijgn6scsi@cbkn7daetyzi>
References: <20260922184425.56114-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260922184425.56114-5-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922184425.56114-5-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDI5NSBTYWx0ZWRfX/FJ2D4+DfdSL
 mm4WdoPPU7Yqk9SuLwdP8fzqJa0pOXfm76peW0cgtVHwVrY8x5c2hZm8LQiavh8JrROP9zO2Ozx
 OfJkYMwr7zjsoKKDtFvNVrscSHOlboAhk9V7z4U8ElK/a3IYukaeF/9e4e/DRKDU+u1F/eLgPqM
 D7hHgh1WWHY2PT2qoHICOx47S4ulE9LXLTpiW5Ay0V7GWi5h1XPvgcD9fZPUxRGuf/EF3v3AuHW
 iIMiyUYW5+AX9QHikKsVwW0WzRcL+LwX1cyKSNE7gxhLKGXoZ1fhhb+0YlsChMLiYhY8G9M/5DN
 7UHaEVa87hzkIoMcWsW8McZXMmF9WF6wK0LqwFlF0ie+1smesRcR9kXm6YaApl9Z9YrQe27M9s8
 0B1v52VGFWD2fM6UVbBf1sn6PUNx9sZ92YhdaRPauilc5mPPwLsdf5Cr0xap2QAr7axwHM/hxj+
 pEj8l9C0ZLiaYQXcf1w==
X-Proofpoint-GUID: 1yGoOdAFuJA4w0agzIkYQNRHqBFBIDSe
X-Proofpoint-ORIG-GUID: 1yGoOdAFuJA4w0agzIkYQNRHqBFBIDSe
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDI5NSBTYWx0ZWRfXxJGUafH5TAjI
 T6dk19xjahOZjJm7YK0V3VMeFC25TUwKOY8riELkoJnXx/VkS1Ouy4E11bNQANEZmNT9KBHUkTb
 A0uNJf0YULOBlRdAK/e0bUifMVaKSZo=
X-Authority-Analysis: v=2.4 cv=XrVvqlF9 c=1 sm=1 tr=0 ts=6ab2e80a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=gMLPUS0fGnAuojaj054A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220295

On 26-09-22 19:44:25, Srinivas Kandagatla wrote:
> Add support for the lpass clock controller found on Glymur based devices.
> This would allow lpass peripheral loader drivers to control the clocks and
> bring the subsystems out of reset.
> 
> Currently this patch only supports resets as the Q6DSP is in control of
> LPASS IP which manages most of the clocks via Q6PRM service on GPR rpmsg
> channel.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
