Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696F8223DE7
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 00:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790988441; cv=none; b=g7nmSklQMN68g4vKygZIga8AQB6AGYiEWEDN6erU/J543TBInCBYw8ece98dPwHp9UF/WulKDoYcjHWGFKw846syny+s6gw1jeFdUdRhUvuwZw1iXYRLgatJ5N1imMtea5mDIqnDiYGm/T4CsIVk4gkLY9FTpH4L0vqJ5N0gKlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790988441; c=relaxed/simple;
	bh=7MnVFgNdC3RvPzdpl/bBNmvKJknpsmhzM9+gnj4Ftng=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PLo2ZhKi1CkfDu8/F3pAHk5NEsHdEVUqNJyx7RKpsNQMqexfI+5ogonhGoEJKt2qqhxpn0kOiq3sFoVwrLiiVDg0lkiPLDQ9qtZhnCT+4M708gsxjOIviZfq4+QvDDfbxN3xYZTQktHDPml/+IhaWnrTcagvqZ03QQnZCgWOmTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L/Q6ytf8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UBvQ1Wnh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L/Q6ytf8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UBvQ1Wnh"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 692NeZOb2502371
	for <linux-arm-msm@vger.kernel.org>; Sat, 3 Oct 2026 00:47:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ZcxU10TAc9LTeYRglm1g/5Bzo8itS+vHj6k+ekfAkQ=; b=L/Q6ytf8kWv9eKaD
	xtQE0v7LF3Fw6PfttVeQgX3/zHCGQDa8tRjgtvmlCP/SgXsbjn6q8ibAAxVHx7sh
	jStM0GEul9bIF8qNtm5E0+qCEcABPZGoUsIShQlUDW4c8kYsw5dqDTiJPyDUEFIF
	prGYDqLKIluJ7V2Egi6UD1Fl7jpscIhzmq5QWpv6ZHfktYNyiN1jDl1Mqcoq87yb
	1mlLtmI1yjjj+jEfg+/wa66KCv4kVPji7Em/cne5B6zHl2rVbx0PthAOOcDil3fB
	w1/EKzWsnjp10k7GGxLkTNnwLR0xSkwPLdWH6pHNM6Mza70lVhLGH4QEKplnRkw6
	0d69cA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2ft8st62-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 00:47:09 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a082c014aso32966885a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 17:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790988429; x=1791593229; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1ZcxU10TAc9LTeYRglm1g/5Bzo8itS+vHj6k+ekfAkQ=;
        b=UBvQ1WnhIWeduXK/BJww2TiHrQsPfyhhR3ZA15JJjeegtzgNv6OiejSk4Mw1dqJS5D
         x1TWnSeysN2znW1OLNnhBrwLZdyPd6SWTmroLKTHQbTusM7B+CZqGB3AdjyyAtYwOQBB
         8qdsOseZHMNSHK0SGbFuHlThOavIqK9EUK1xGzQPeTOWxu/BKk7MkFvS631vQbznu8xb
         emwWMQsXJRL/B6xMQh5hRAPNGKqWAyHrA76KDntB3PsV+17+Vn84poNYCntEsEe3SJIF
         +HTMMyHVf0EhWwwLxwQDdPRkJbAJvMayy7HzMlXRwsDQHXrtb1ljABwt2ARS+1RTq9Tf
         R4rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790988429; x=1791593229;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ZcxU10TAc9LTeYRglm1g/5Bzo8itS+vHj6k+ekfAkQ=;
        b=1TDGDqVqkki7e8D0hgPF29IPUrIpAI6i5OLqhPNDZcjDfyrPLUoXB/EkCTWugPdi8Q
         HvQLQeP8viMAdSuwEHJ0YeVOKIGonmnoXfY6YUp/ycHXDN7+MwwPuInvEHJ5WYzZfKS+
         KOJyZKoAHakmleJq65D7LI4LhWcl3n+VhEOjxYm5TBAVQeOw791uMItL1sA/XxbsxCfM
         c1FY9O8X4NqH4GZsoyy2mtkrnDb/wh2wHoNYywPaZJKl5UYOKeIZ/674+fb3z/f6AgmU
         5e27I5BkxHwT2+8QYij2If8g68vep6Icm/sppwZErDE5P62F8raLxVRGcYJpxPe8sgCG
         OSfw==
X-Forwarded-Encrypted: i=1; AKwUvBziynvOkXgCVYeQ8LmPaZodhT1uKD2qtN7noLAsiZCWGYNEtWUnnWnXWcKNr83FzSA3S5HmyoXqXDizaQZw@vger.kernel.org
X-Gm-Message-State: AFuF++kCrscuIbWkqFnYtQg/0h5qhP8z2twyuFdfxTBhR6Ed87P0tTDM
	cPkkrPi+R6ym+TAdqnpfUeHiAJZ4uWQB9kO9m3BeeCGCWk9swgEbcCpQAQdCY1GDS1prnsskoCY
	V2LhvqhMK9oHjwIP0AAaoxapjvcNoAefL8cbLiXqYwgRn6q1e/B3oYDk8d8UXyHEcWxeW
X-Gm-Gg: AYBFou0hVoxzdZiie0HwrDciHqcjc0tRQTm5Z/1Gy/sWV87djP6uTp5l3P2SxlcoYR3
	AA3v8AU7sLWU9fthoY8+z1MBoAZFJMqiIece6wPjVctCIV0fB/sbAy7n94Nvuj3Hnloj/qXPjv0
	P6QTXehZFBfa60SBdM7Rwj3w5SowMCfn7qrUxp4We3g1z0Taa3amdg8uMSdrU/vFcOTr1ToafAk
	5saXnTEZ5wA38FVMmsdrqVQKSoLkqDm4CxbL1DRwgvMKjJ0i/4NejFtDq2Mw6iDDQCCF+k9SKfs
	Nv7lQhsfD4AQE6a2ipt6yxte+Bt3e60UpLoT/a1Bk1P0WC0Pe/LzR+6/FAa2AAGwZd2/iarlRzK
	hVSut5U1edBx5FIyyfjaFB0QiK8zSzukjrdZBvw7sWl2pB0+JuWamLQgYCFuviTrLjYscLjfMmc
	h9Tx5ysw+wi5IF
X-Received: by 2002:a05:620a:1a10:b0:93c:65e3:df81 with SMTP id af79cd13be357-93cb5a5be1bmr1444375485a.13.1790988428818;
        Fri, 02 Oct 2026 17:47:08 -0700 (PDT)
X-Received: by 2002:a05:620a:1a10:b0:93c:65e3:df81 with SMTP id af79cd13be357-93cb5a5be1bmr1444372585a.13.1790988428238;
        Fri, 02 Oct 2026 17:47:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c71911bsm1160748e87.11.2026.10.02.17.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 17:47:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: abhinav.kumar@linux.dev, Wentao Liang <vulab@iscas.ac.cn>
Cc: airlied@gmail.com, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, jesszhan0024@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        lumag@kernel.org, marijn.suijten@somainline.org,
        robin.clark@oss.qualcomm.com, sean@poorly.run, simona@ffwll.ch,
        stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: Fix VM leak in dsi_tx_buf_alloc_6g()
Date: Sat,  3 Oct 2026 03:46:55 +0300
Message-ID: <179098834079.3641559.2074719170971578581.b4-ty@b4>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260916175738.2089950-1-vulab@iscas.ac.cn>
References: <20260916175738.2089950-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GPdmPjYsCN-Qo8bDwAQf2ev_eVZxA6CM
X-Proofpoint-GUID: GPdmPjYsCN-Qo8bDwAQf2ev_eVZxA6CM
X-Authority-Analysis: v=2.4 cv=c8M+0h9l c=1 sm=1 tr=0 ts=6ac0508d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=e5mUnYsNAAAA:8
 a=nOZalv0Y895iF468lBgA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAzMDAwMiBTYWx0ZWRfXztbgXUphoH6V
 JtiNxTDguXWXpiXJO/kOxB5tf2nC1JJf9PZaWnMzc3jeYqwVGzje8PObmqUCq4y1cFhAvxHYb4w
 GbcFg459dSkw74uobqInGk06R8EK0QM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAzMDAwMiBTYWx0ZWRfXx6uXvT3azyxF
 6zu1GdUDp3i30Y+7lCHEbsWCa+UQxwzGvqT9RkuLIX9E4+0o/BoMjI+QZ2/FmH4/PjyONnMeOYi
 DygT1nRmD9bLvEH5QwCQSCwvhx1zJGlVipKE/DMl6KiLtlCMiafFPwEAfsYj9OySocILEnb8nB1
 XTBbj4ka/JJ0zbYVq2enoGwxOwFBMmpcv/hQmZhOUhFnN88w0R1Yk1WyyF6mYn5stSbsqhaNe/l
 PFNcdVqhxbsZVSlTEFP3iwyBGtNbUlbhb+ZY+ABxyXFx09ilKyL/966w0XhAKObC3XVGpcucqVb
 niKbeVQ10iba5GLbe6kW2z9uyxTMTykNjwg9P/jz8NSqUUcYUVsFQHkOPDx4GfQosAe1yGpbHdg
 xAwcxNaV8hHvKmgfets4bDEDY4q+GYWxS9Q76LoRKoAElwn7hAUGzNSMhxLwTuC23PjL9E0Cfen
 hO9K/byusQRNDF+zMEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-02_07,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610030002

On Wed, 16 Sep 2026 17:57:38 +0000, Wentao Liang wrote:
> dsi_tx_buf_alloc_6g() takes a reference to the kms VM with
> drm_gpuvm_get() and stores it in msm_host->vm.  If
> msm_gem_kernel_new() fails, the function returns early without
> dropping that reference.  Since msm_host->tx_gem_obj is cleared on
> the error path, msm_dsi_tx_buf_free() will never see a non-NULL
> tx_gem_obj and thus never calls drm_gpuvm_put(), leaking the VM
> reference.
> 
> [...]

Applied to ttt, thanks!

[1/1] drm/msm/dsi: Fix VM leak in dsi_tx_buf_alloc_6g()
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ab91ba61871a

Best regards,
-- 
With best wishes
Dmitry


