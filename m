Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15787455610
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 09:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789638609; cv=none; b=mkh5t1WEzQ2LVYYj3JGcm+KWWVIumZdUuMgOKIuJBQ3nGjD+E6I5IvgHklCsPeVOmSVGbXM/V/uh3PJIeFul8OJfQ50mCCD7V+FmVEqeop4zs7P7V45F9OmGX70THhPkw04k/BHBm8NLSZVYXvzqbniXw6G11fCSVltY16GWWOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789638609; c=relaxed/simple;
	bh=xOrPUnzbedw6kt6yPbrXP/61YDvqt4FbJjPsYG6H8bg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NP/BbXooUAVNYLJSqAoso+9Nb3o5AoZExamSFiqUtvP1w/OxBNn86kVe2t4gipJqXkKHRhiady4DLLzWGVOALtKPmOoIVzDvSWojp4bgoDhKghLA/D/JgefzGsEvroHGA73+SK6HOy5SoeXKidPq/Ooq8vOGHqfOWeEpk/k7Wj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eq3g/gpT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R679CvnO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eq3g/gpT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R679CvnO"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68H9ZSNu2410420
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 09:49:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ebwLc4I+nSXZhdVKp1UmDQhXxipBI4WgJpnSLBihB64=; b=Eq3g/gpTQfYmmfOf
	zavsCp3fvQQ4SohIfjbfjpWw14Rb4cBSJdX5Iw4fK4zOLYykgPdKlc7hb8uLTB1c
	erHp0Ex8yeQbagrtca2VRFa0cVPlLFNkKs5F2IJFrKzkqmEM7BnlRmVijSik0Bul
	rIwoYPUBeirUEox08FzKGZe7UTy47ciSh+vOdhX7KtpwHXxuHeKHC+hF/nxUWZ+O
	YhvJaOpvtDZiLEw40ZBXeg5QsfbWXg3bTDrNFmXehiUKHtuVGT+En2m+vVBaxE3o
	ByrZJ7is1umsG2ooRMKUHusXI5AZnGQcAZus7SjlrIhQjnrgaFBPZgBJfursbMx/
	InvdJA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grdd6g4gj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 09:49:53 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so169698085a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 02:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789638590; x=1790243390; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ebwLc4I+nSXZhdVKp1UmDQhXxipBI4WgJpnSLBihB64=;
        b=R679CvnOmVp+gPonttmKNt8AQ2Pm+1/FepmeN/9IICOd3ROGYNemukV3gAs+JEN8h1
         dSkc9xmWjKdjlmUKdDNKrMI2FjpZ6qNCtpQYYGU84WQAXWFIzgzNoYcKNu8nts7pH1xp
         N0GG7BFkAv1yrEB9/mzyFLObdEoeTt7+bPy4X9rS7n/JXTAlG3DNZswvPbqKzm/OBs1F
         n2hTugUyRWlgUfZtJ0iblMdJ5g4rFoHttbbfKCdMQSssnURrSEKPq0PhdTkfJY/1H8cr
         GHWmBUp6vAsKocg3v9Hm+dpe7VW6x8BCUVOr69AF8K1UH7XNSdlYOkzAFhnhgikNML7J
         qVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789638590; x=1790243390;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ebwLc4I+nSXZhdVKp1UmDQhXxipBI4WgJpnSLBihB64=;
        b=1FlSvIPpsenNyq+9PRhLp6QYrr14/XF0HZ++9bHJKpxYNT7OQQNuVnFJRS54HbuJzL
         gzJ/M8TVgaik5C7OYS2JzwHDvFU/kA7wGpdXtB+OyzsV9N+fe9ruUGQQZxZFNFmkkxsy
         5k7UNRxof8rfq1LFb6jYXKbPGfOzVzmAcakNDFKHLsbnl1g9M0mgmpDWbw6q6JwGGk6g
         oCQjHlJ/HtTmHQsAv1YwU5qHTZhzMYBa66W0/dbQTvPiRouu7snxbhunPC+dfnvaNFNz
         d40RNlC5sIJL2Fs3SA1lREu9l3/JX7Tc2jB8bEOIZj77y+lztS2K6QEYY3f7jfHohI7F
         2gLQ==
X-Forwarded-Encrypted: i=1; AKwUvBwLwU950WEHqPgca+v0jCzv17K1kjG+WDfb6xSX5pF+ly3GdnT3X44cppPXEklrGNy/91ZtmGHmt0slgcrM@vger.kernel.org
X-Gm-Message-State: AFuF++m+shLXD823CWNlok47ktBCPObnFVsIVymc/9iFTpcIvcSkXFMl
	qdPZ/XFTn51rgY7vPTOBUcfOsxRbbqdRYDPh3zq2WGFHxxkXBAn70GYltpkylWm1FHspZmMxeSr
	jlywLz2WlpY6wCsq0XPt8EFp1nIcCgFdC3j8/juyh0+qeyBGGrfaNzBAh63UaqHNU3rxj
X-Gm-Gg: AYBFou0l2D8ecpxkIefZ+SV/TTHg3sKdr3osv6Wdbvr1hJui/fTMB7jrFsawDCQ4/vw
	YMCzVLBhYoSObgfUWVYqEq0N1z9DX0pd85gbn6Sl2bObC58g9GeAqBEuTvmryXkF2Zr2TztA6IY
	bZjp/fR7o+WBGibPYwZdIoOZ8P9fNvXolbQqyjj4zx3y1hFR0UX2s93NHFH7btcEq9TS04ZKtkO
	D9OTd/TDirqWZg87y+rl3jFAGYbuG2DGma0wA3esiZwPZhuxgeyd3epesD8Sz51JGS4oSiP3BnF
	dalNYCPcqvclkNngYnS9c+yIHBb8rs4ZWu9Ozxx8vwmX7R1/s/dA8psjXzG1LTqlzLBDW1PjuTz
	1l/wGGUzbJomegfovfle8bqXdQhE=
X-Received: by 2002:a05:620a:4722:b0:939:99a0:e6f0 with SMTP id af79cd13be357-93bb785b07amr965473285a.30.1789638589733;
        Thu, 17 Sep 2026 02:49:49 -0700 (PDT)
X-Received: by 2002:a05:620a:4722:b0:939:99a0:e6f0 with SMTP id af79cd13be357-93bb785b07amr965470885a.30.1789638589359;
        Thu, 17 Sep 2026 02:49:49 -0700 (PDT)
Received: from brgl-qcom.local ([90.161.207.100])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4870bef7687sm15736333f8f.1.2026.09.17.02.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 02:49:48 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Jingyi Wang <quic_jingyw@quicinc.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] Fix intr_target_width for modern SoCs
Date: Thu, 17 Sep 2026 11:49:41 +0200
Message-ID: <178963857689.7532.5477084907068663029.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917-topic-tlmm_intr_width_fixes-v1-0-3bc1d056aa6b@oss.qualcomm.com>
References: <20260917-topic-tlmm_intr_width_fixes-v1-0-3bc1d056aa6b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: b_A47p17SoEJ2RaHsSnEZ9fv2gc7AK50
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE3MDEzNSBTYWx0ZWRfXx/Mpi6Ai18Cz
 TS/0ApV2yAfrzgu2+htN81wdzjXzwh4z7OdGbDAeLWt00VsNjlYn02zEzcnSmZ4sWn3rUtqYxdp
 DA4gQMYwD/NySkPqTF9EuoxlB1dQHUeVwHRNpw67Pr0m2uvpb8WtGYcDU4/L3nhl0BzuIBvmkP2
 Mc6S5i56+/MhPCWTfj80JpDAl6bBQyW5sTV1ieY/MsvauxbnpPIitpaAdppZUxey6y5Upmzd6nJ
 JzY7rEExCtp/MNyb5Kt8e8l6JueZuUT1cMvpA9hZVbAT4jW+KahleIanENX5fLt2Cb1aEtE0pVq
 mGQRSvC2hH/guiCuxTpmJR5EMLi2hq0qyB9Qp+fk7VGGsXn0RIen/zN+v1E6t5CsWz+OZlU07DV
 TDo21NPpKslrGvYSbP75m4Dc2QRmMD26a2CcFYleSinkFfNPobnkm5VjxhIvdOvNk1UR3SYhQ31
 sqcJ67reVthvGB92POA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE3MDEzNSBTYWx0ZWRfX7o+7ZDjnyvId
 9OPaWnVOV6nNMgWbHFMGAalOINYH9iB6u5FcwYJAzzGh7O2mX9mfp5LWjgm/y90RV8jTdAFnTJl
 e6JGha4CiKRCxg4t4NiyhCtKUhGPr6U=
X-Authority-Analysis: v=2.4 cv=GeOCDgXL c=1 sm=1 tr=0 ts=6aabb7c1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=BQ2oiuy6hHN+kKmom1QVvA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TOHDll6vaYcQP47MitwA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: b_A47p17SoEJ2RaHsSnEZ9fv2gc7AK50
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-17_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 phishscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609170135


On Thu, 17 Sep 2026 11:03:24 +0200, Konrad Dybcio wrote:
> Following the Nord patch, I asked the robot to ensure the value is
> correct on all other SoCs and it found a couple outliers. This series
> fixes that up.
> 
> 

Applied, thanks!

[1/3] pinctrl: qcom: hawi: Fix intr_target_width
      https://git.kernel.org/brgl/c/9d4c3e0c6a53eb390d58b8d7aaf08885e46f93fd
[2/3] pinctrl: qcom: maili: Fix intr_target_width
      https://git.kernel.org/brgl/c/912df33f296e6c4ced8c0a5e7998d570a0b82214
[3/3] pinctrl: qcom: qcs8300: Fix intr_target_width
      https://git.kernel.org/brgl/c/dcb5df182b37587d5ad6bb4388751bf5180957ac

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
