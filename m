Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0652941E6C8
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 11:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785236597; cv=none; b=L9NAbPFaAFsFbaTc0z7UvM7TcnJndd29vXOUPXaZciRfAmNooSLnkdl+2ydUCGIHGXh+RaADGFVl7nk4sM/1B4YmmHmuFAw7V0I4fAXaMgRceYeTzIgMBYhFu83lM9WsQK0u7kSH38l+HZ0lUtwWWY/v4+Pmpim9ygqocTxaL3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785236597; c=relaxed/simple;
	bh=EjfjJhyKkopIFf8jZCgPQAegYPIJpv6YvDDhZgvzbTk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=U8/aOoyJwyNHavR8Mksab9tvSe8huuEOqoY7Ii8HSmva+VVjlBgRWODQnrn+0c9b1zCz9xc4sAW51+HL0vo4w1CTEDcD4ZHgEAhCTpQurVT7ZZNYOXSO7dU8PgPLsbaQ/X0Q+pdA68fS2JM6Xr+TuDcJh35/JrN7j1LfH6coeRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C+AQudHm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R1k0PGy/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C+AQudHm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R1k0PGy/"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SAgbnI2043733
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 11:03:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NQD0Nq50Trjosw/cJsYhN/
	WG3UOQUuAE5o16CdOdw4I=; b=C+AQudHmyplDuyRyCScpu0bE5MZNwvuCJ63tUt
	Q0rlYfcrNBGC6QQIlsAnmz5UJ/4OZzXXulMak9wCRZWmADKQ6o2OXvr7fd5BSDtQ
	C7YH4pByTbPZrEU1hiAZumwRlgX9AZHtTlCakEzECnK5t32X11Ev8cC6xpqNw4I2
	U18Xv8ZC39IC4qp00Efruu1FtUCj7cOJ8FBoWLT/HVI33e9qpIzgjb6Zcfasg63T
	1nyIVciuDxlkpG3xukhL/8URrI/s86MNGKFB9YXAMHnSVgZFzB0x9KUYIwjftjXG
	BLAG2T4TjuYAGrzkrB8HW72GYgFyEENbK/yF/6zBQf/1hcMA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpptts7a0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 11:03:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc6dd43737so79055945ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 04:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785236594; x=1785841394; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=NQD0Nq50Trjosw/cJsYhN/WG3UOQUuAE5o16CdOdw4I=;
        b=R1k0PGy/3UlugBKCoOju/KAe9FBTASZYae/tMcMM/+8y/Q6SgcFcr9keSCG93s2QDa
         pM+ebfVy5sntlKK/GEunNF16qVa5TZKjFGxm+jQkfblyCJABBPRPm2We7ZFWFUX6gLT6
         8suthy5rlaTmzHP87+yIOIMn7M/9/sf1RSRVU/PAIyp7/yt+gFDTG7+ZrvN7dUbRsVOi
         ewnVIax7QvYkyfpVqUkOjJyWT95qkSNutGhenlLX36Mbh7r6e5EQPl1ByytycmOBW7Rq
         dc9na2wa/JTNvi2czqKwUPaIGRyvKPrOZZOOW31Px5WzxE/REoU5DYA//MZ/rB8A7+8M
         WD5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785236594; x=1785841394;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=NQD0Nq50Trjosw/cJsYhN/WG3UOQUuAE5o16CdOdw4I=;
        b=DfFmxU/JjgodMwr4zdW5TCOHs5o2VVM9edmZAXbDrP/p+PVptvLQIaJA04/6Zpkq48
         h6WPgQ/0JxQyUuks61XtT8OfQSI5Bw8THph33JjWzaPwnpabFyUjfbZ6Eha9vO0UGU9M
         DcBwGu5FhJl0HAripAkYNMzytoxDXKwLBT7iwypzXr6R8WlKuR9sz+HOUzQmidRqpyTd
         LnFdv80bvgHMjPUo8SN06yp4nIMvYaekJeFOtGGyBfkGdjyyYcgO86B9gVaoCi2Q9Hgo
         X+ajORVK5FBypC1uSR82lYGR0oPexHeJ1Uglu2O2FU7NsoPMTRylUhEYFoUwPp+y8+n5
         ngWQ==
X-Gm-Message-State: AOJu0Yxd0ZSyDOoBoU9YG4jhidIRX235/KC/IS1U9emcFpmBtXgUARlt
	zx4ufX5PXIoaplDjFs36AvJj975Ht8gOXUoJLbLB1iPbCMQ65ma1ToxAxinsKpkXPwrcTQCdBNH
	ayQD15TfzhLh58+h6J+U8GuUYWvTK2/SzFSvTV+ifuWR//P7eL+mTAiqTkP/1b9dYT/G8
X-Gm-Gg: AR+sD11fV6X0p0S38vr9atzmxVFa801RZ/ITzMzacoNa7LHwJd3jguiSD+hUqyU+bPr
	Bu8T2kogdEa+6oibvdrSRTqF8xIJ30VrftOTAZug0R6pZu3YB/hktmkyuP7jBjGBIkC4XfstyzQ
	rRFMRrxFVGPqALbM8kwFs1E/EpQJGC99ZadDAZ/7yEcm9b3o2jfdWlb60oPM07yDLhlpVpweoQq
	n7FtLJtSoiHT/viZmRAOvRCfd7xxQp+w640WW0SoXvALg/B7pDpc3S+9YkEgonHAOnrG4hol3my
	x9PjA+y/qciRiTBx/6vEfPidKJh+RzkaWUBqUkurEeGN1AJOt8HnwFuKpnS23bYjDhNgXRpontR
	pVEYgwY+3BEeVwrI=
X-Received: by 2002:a17:902:cf01:b0:2cc:9e99:55c9 with SMTP id d9443c01a7336-2d015d23360mr21443835ad.26.1785236594432;
        Tue, 28 Jul 2026 04:03:14 -0700 (PDT)
X-Received: by 2002:a17:902:cf01:b0:2cc:9e99:55c9 with SMTP id d9443c01a7336-2d015d23360mr21443075ad.26.1785236593880;
        Tue, 28 Jul 2026 04:03:13 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bbdb7sm49850535ad.38.2026.07.28.04.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 04:03:12 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 16:33:08 +0530
Subject: [PATCH] pinctrl: qcom: shikra: Fix intr_target_width for summary
 interrupt routing
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-shikra-pinctrl-intr-width-v1-1-46583734d808@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGuMaGoC/x3MQQqDQAxG4atI1g1oELVeRbqQmHZ+lKlkhrYg3
 r2Dy2/x3kHJHJZorA5y+yDhHQuaW0Ua5vgyxlJMUktX9zJwClh95h1Rs2+MmJ2/WHLg+yCqba/
 SakOl392e+F3v6XGef9bYR1lrAAAA
X-Change-ID: 20260728-shikra-pinctrl-intr-width-982cc47c24c1
To: Bartosz Golaszewski <brgl@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785236590; l=1264;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=EjfjJhyKkopIFf8jZCgPQAegYPIJpv6YvDDhZgvzbTk=;
 b=PlPaquflpDSRUlGLs04B9moFMs1fkciY50RA88Wax9zwx0jnwDDlRA1xsbTnHcUtSFe6i+KMh
 1/rfkzOFe59CvJ9Np+64zHPyAZP+tIjPexX0kiavG5YUWXhNGaUUOfc
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDA5NyBTYWx0ZWRfXwYwET2kT6jB9
 eXU0trf3IHvBTvQcVqzDb3+7oZDk054QiP83dCOn2R6NyfC9Uk53rSjMoUMuXNBNGOYv4QCJvCy
 yDBcqgHSuHZNrRBZn6voxYeRxjh/Vfw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDA5NyBTYWx0ZWRfXyknLFcQaivCy
 oc6S/HAKheCbyt4GOjH96FcPuWK6EZ1clD1vg85k1mS5DUhr9xauhXnYEIjt25t6j4sdQGJq4t/
 wp1xuR71ge1HhB3PntDelyKM8OjOaVuJI8YFNZX88kjJK0D+1m/Ft8GAvKo4H4wXA7JzXwkd5mR
 xa4HpAFUqrssia1d4L8pW9K0pIv/n0v59+UZmm+1zb47iwyJ7807/tNwS/Vp+Q8pEp1ymXm2Nim
 MCKV0MsH8YqSjLiNMOPg0s3vwLJbnsHaJjp+9VugrRge/r4jv5Mod/Plkc3wz5GIhsAZextxDUY
 cPZ9nZs+0l/jy5Kr3e/78ENWzapqpfWyZQ473qy8VTc8HoNi6zeXStfE5shGjS5XUQq2GoSZT3B
 FZVwvSTebnMT9YiaGObumF3g5GMHn4CmDRxOVYngkgou4+sNZIpOJjYU1xGbvaYCCropHSLpKhI
 2oJndzrNFsekKKr96/g==
X-Authority-Analysis: v=2.4 cv=aa1RWxot c=1 sm=1 tr=0 ts=6a688c73 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=dSzjJuGR07uXsTsEdN8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: w3bKpHLq-EhwlZVKjAIZlqSaYksP-PUb
X-Proofpoint-ORIG-GUID: w3bKpHLq-EhwlZVKjAIZlqSaYksP-PUb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_02,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0
 suspectscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280097

The intr_target_width field sets the mask width used when writing
target processor into interrupt config register and deciding which
processor receives summary interrupt for a given GPIO.

Without it, pinctrl driver defaults to a 3-bit mask. On Shikra, this
field is 4 bits wide, which could corrupt adjacent bits and mis-route
interrupts. Set intr_target_width = 4 to match the hardware.

Fixes: 9db68ec534c5 ("pinctrl: qcom: Add Shikra pinctrl driver")
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-shikra.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-shikra.c b/drivers/pinctrl/qcom/pinctrl-shikra.c
index 0fc98369948c..55aec2f675e6 100644
--- a/drivers/pinctrl/qcom/pinctrl-shikra.c
+++ b/drivers/pinctrl/qcom/pinctrl-shikra.c
@@ -44,6 +44,7 @@
 		.intr_status_bit = 0,		\
 		.intr_wakeup_enable_bit = 7,	\
 		.intr_wakeup_present_bit = 6,	\
+		.intr_target_width = 4,		\
 		.intr_target_bit = 8,		\
 		.intr_target_kpss_val = 3,	\
 		.intr_raw_status_bit = 4,	\

---
base-commit: 0d33d21e47d9dc66f91e44da3fc9220c74d93df7
change-id: 20260728-shikra-pinctrl-intr-width-982cc47c24c1

Best regards,
-- 
Komal Bajaj <komal.bajaj@oss.qualcomm.com>

