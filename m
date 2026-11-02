Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793657080;
	b=HjNUIUCZoUMvme0aR71G69V/yhd0pcj/b1DZXM0e5DA86XbiouPsvO/e5EpKdzpc6BAu
	 UGa6HYEt9oZeLv4coqcoW/yAMCEZBj1ePJ9dueR8QxeJg9Tt1N5ob+0uDHHtcdvWMguIr
	 K6McD7mpBg1zZoFNhD2VOJHcw9HkU8GHTI86+PjWi1xBa4TD8uVvwaGyTazU6ecSxZYEK
	 SBTc21cYeMFtKdRzGRjGMpyv6r/GtjszMhdjb/wCMAbRVmGfePXJRIiHMWAcJAihFNOg3
	 +OCFhv6DdaYnECbAxYK5PZws45qx3EanoZX0QlUb7SngjiACDUAnegk3XuXgLsZ25xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793657080;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KTqlhnQMr2NCQesTIo4IGBobCa+G+VXCAaqS3tav790=;
	b=yp1ZwOCRN4q7kg7N0//VQ5xTpQsmT58T8pA+nsbefbM/QTrfYdw5UJIa+NdoiGofFX68
	 x5B2OokLMIZ4YePikrfMw6Xq5u4/wEiGUdfb8QetsDZ9aannB7pCqSkCbUhBli59u/xQ0
	 JcZmTN15HrlrGTMu26OCpkVQsUbQGR100bypYhmrxVmc4FfRgTSlxXlzrfa6KFRlB+1mw
	 HTdVlVifGH56LQRgnFl2lAxrIIn7oUaf8fENHH9mmAaDqrWuhf3xEDeW8i4a01TyBa2be
	 vgqMJMLLUR9Nxg02JKvk9vNLLfqH1/ULAy6clgWFIve3OPO/1ULXCrNoFQoJ4uIqUHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Dxqyh/3l";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="MS/Dt2UK";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAFF5606D82A
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 22:04:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAFF5606D82A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dxqyh/3l;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MS/Dt2UK
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K63oH1746037
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 22:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KTqlhnQMr2N
	CQesTIo4IGBobCa+G+VXCAaqS3tav790=; b=Dxqyh/3l7LZuJED5FqhN1rlwzRI
	LV8tS+19UiXQK4HGEkDEvQskHuQgeXqFWk3O9Rr02nAYWMRLgcnVz9e5n59cCEj0
	A+Tv+9u8eZoz4ak/0GOb9G2MeyfLv5ZRv5y48817eRd5fZpG6G4DzAwxr3csVVqE
	+lDB1PaoTI8LUWdQLDSmPO8spJVKiDxeAvuykFv2B9DhTKWTyNFA406J/R1Bdcza
	eftG/WJSIE2xRJ+8eqYXIU8h1oCePK12OadW36kIG6MW+yeWXv9kJ64+G3K6N844
	NRVXvZ+P/gZvYwnZJIqv78Zi9XBbt5ouXMqslPITMeVEk4K13hxGoz33dqg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvu3ps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 22:04:39 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cd61bdc8683so1750221a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 14:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793657078; x=1794261878; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KTqlhnQMr2NCQesTIo4IGBobCa+G+VXCAaqS3tav790=;
        b=MS/Dt2UK4p+ujIIOoTIAwzrVAclYwh4ZYVQUr1QEx4HhUs1yz1o+CAoqH6uzf26gps
         tuFF2WJ9M7r5Cnc1yRFAEH/gN3K2yUF3+AbLhKDbCgUYv7oBTI3sbF8lOTGNKukO65Yi
         JfHjckb9cRIaYXwhu/yyM5vbx/rmE3Nfdl8EUiUJxtCPyylr+iYabp4dK5umdkdSsqW3
         hh7QKCmzmlaHEu2PqhAbOjpTo9dshlvL1+8VxrvXomh080s/xy3MOPld6nZdVn1zcXno
         YGkWa50L5qw0FfLvlWkqTgru5ajqU1it9VzjB9ActgWEq/cNvtEODeciZzcYxgT3cvY/
         ZIWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793657078; x=1794261878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KTqlhnQMr2NCQesTIo4IGBobCa+G+VXCAaqS3tav790=;
        b=ep4GQWFt2DBoLtgeHBEDxXj7ZcWWHGmQjvSmm/HoT0Yr7/faqn3T58+uSvwO9pW1TO
         dfA/eZ5C0aI04KQsEd3Np+poY6ELdq8VOXD+xMrDjXWSfyGPjbzjGHeliz3RTyOmW154
         hvxofdqA8aF0WQchxPQLp+tpyu9z4y2d0wv+CsbFxYhAiRZ/KGnFNVsXFse9C2W/0swP
         P+KDGey1SAqni0yvf4yUeZ1yz83xAZkbTrkZAKjALATssoEoMC99UG1l88bu2AIHRc65
         OFqWnh0YS147SvWKtlOO0nIXqvptMBE9R2wZwBVcD6YZ8RwtlkZGX2ejgsGsc3KrHu5A
         DQpg==
X-Gm-Message-State: AFq9FYLl5Qwp8ymUtww4e4ZDKFgu5fYEKIJ+eOZLWHQIyCL9k6RT4wFp
	XzHIR0m4ZBKN+tLp/44fMAns8AYERMl8lyBAvCUcKZlrccCppywzivagRcNchTfJCYYa3K+oCtk
	TSsxWypvlPQl4uwFpIy3VPsUq2Sz0QO0XLpgfabaW0QxOkdbUrCLXSvcX9LwaF7M80mdH
X-Gm-Gg: AYBFou2ezOpWrJRhAXY/ZB3HokNROeRxA2FEnHK5MWppZ941lOm/u5heeGdyIVwvKx9
	N+RHwad3Wwlbibjxv8ov5jUyzxRMmpr5t3sclx2WFMipZrb5yiWZ7Rx5a1qR9wPwhtgafViRHRF
	yt9p6TwmpjWkvABSZaZeYK/pUeyj9PDL+VZ/GzwAqvTzFDK2z846Fu/nvhXQ3mEPFvPM/4dU0ax
	so5wbcDYHqFTghA258ecuMRY7r+SDT8wrKA4Ez+M9U+k6k/e4l4K634pCBz4z1b/03fCXmxeq+0
	AazAUryagiaf61sWyThnjv1oo8cm3ULLnQeaiRgy5xDItZj14IvKzOMaJMQFgvIhIYFeaUzLHl4
	oxksu8mpFQx/QWhJl2HI6vu9+ntymY0CUWA4mLjkWuMbXZawJqrcFl3nVeafoBFVOG7WZHcsXcg
	/ubgXy686DDg/83m6YitkBsw==
X-Received: by 2002:a05:6a20:e212:b0:3dd:85a8:4c57 with SMTP id adf61e73a8af0-3e928d43f88mr9437913637.30.1793657078545;
        Mon, 02 Nov 2026 14:04:38 -0800 (PST)
X-Received: by 2002:a05:6a20:e212:b0:3dd:85a8:4c57 with SMTP id adf61e73a8af0-3e928d43f88mr9437894637.30.1793657078108;
        Mon, 02 Nov 2026 14:04:38 -0800 (PST)
Received: from localhost (c-67-168-198-145.hsd1.or.comcast.net. [67.168.198.145])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb36488892sm380786a12.19.2026.11.02.14.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 14:04:36 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 09/15] drm/msm/adreno: add temporary __maybe_unused
Date: Mon,  2 Nov 2026 14:02:53 -0800
Message-ID: <20261102220405.30730-10-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102220405.30730-1-robin.clark@oss.qualcomm.com>
References: <20261102220405.30730-1-robin.clark@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae908f7 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=6Rn/7xRx7Ub4NEhlm8k1cw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=SI4bJWXHUBEfUJKjJlYA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: Z5yJvJ4r_NGSZjoi4WHV50xejXxOOBJp
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfXx+r3GuJIJU3G
 LAg2r2VdIHAKzd7FRA8/7WmrKiBUj7rW8praDut+/T1Pp2DCQZW/Q3zosHiRF0D6cbqYwwL6y4a
 PGzQ4f3GkggJrhKstAOo5NcVIkosYgo=
X-Proofpoint-ORIG-GUID: Z5yJvJ4r_NGSZjoi4WHV50xejXxOOBJp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4NyBTYWx0ZWRfX3UrP3Rho6atY
 Q0OzsBsSS41lfhMZFpwsz2SYK5poIc4cR74HcaAaD1HGV1MfkJxwhm7pKuGqjeB7Eld4Y0cTLLf
 RnTj7mJkey2o05X5hs+b1D0wMv3N2pwn8UFB12cLsY8BAO0gGxcDwVFAOv405UYHGyikkungmEa
 WipAjBw+MkAej5qIbOiC7IKk2QyOvuchsA6+Ua3WoKxLqK98djOBtUnTTAWNbcgWKmDP8aDz4GC
 v+unMeC/hq5HPECQlN8DYysUkYfFfGxEn/ItZ3TPGGnhGUuWy2cP1xD/a4w/z3w79seJBqrLcR6
 VLM5x6JpxRH6x0GWpoku2jHdXrDkRO5F4E28XvfEJdTyh5QcrBtXpynj+0fCtBStUcLylXkykkt
 /5Uf8LCwb3K2tzLZgPB+s7oG7QPRUUQcNvjJJ47Mi1fg52hfjgR1aCb6JeytKpHlJlgFCLI9hLC
 HC0sXovCkXCvZb2/0TQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020087

To keep this series bisectable.  This will be removed once there maybe-
unused protect tables are gone.

Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 6d6e4c7cf919..c43efb85fde7 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -168,7 +168,7 @@ struct adreno_protect {
 };
 
 #define DECLARE_ADRENO_PROTECT(name, __count_max)	\
-static const struct adreno_protect name = {		\
+static const struct adreno_protect name __maybe_unused = {		\
 	.regs = name ## _regs,				\
 	.count = ARRAY_SIZE(name ## _regs),		\
 	.count_max = __count_max,			\
-- 
2.56.0

