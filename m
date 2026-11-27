Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795810553;
	b=EPxT1a7Fps2R8kc6iPVinkdiRa/0clQmXn+2iHWgSDgmWwoMTXXKcbV8llpKEUaMx85Y
	 NwZ+M96z0quBOg+h2+VBvlrEzEY36XIF38nw76oJ2xIkghpAab/iaKzRkk5vVEBKGr3MK
	 +dFKSQFuXrCntK3NkW0MZzguW5J/Ku6OnDTirDUQr56vCtcTSq4blClnJFDgL9sPzqEb8
	 Q+lyXZ6qzXdlYUTwcHgXUqfL+u0TBTpM3eAF59JrgpZSv18tdC1VKL6aqBZnB7WVhM+1Y
	 09PrdJTS5yzygvGy9Ti6M33ITX0LSIrR8WvGQFGrdDve0rAghNx71TQxRH8GxuP5B0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795810553;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5gNzs6EANygMZK5ge43vpOx516Pj7m7kYw7rk2R+/3s=;
	b=WigCc8bTryRuxRWZs4cCDFFFJCy+jM7kkRIV0bpaw99reUHFJnbs6t5Wt9s/ansnGX0j
	 9V/SapQ0wSF904Rm2xKQdapE1mQ1jja4cXSPk2ZCsqpaCC/bZ+V9rO08ALTDsR/yT3WNz
	 IdgSaKc+oCRuO9YpS50sGBbRby8BWN7L4VPUrHiQ6QpnEf3K96GcBxr6SIOGxwE9teBB1
	 vLjDHm6U6x5GjKcN8vcsKm3m3BZaHBkogGkMRll5/xHBRT+2LCsLDFW5iCvysiEGFRde2
	 NOhkUHGRuLckHqCZL6YeuAJtMz/dvkh9/3ZrarqdrdbewRzBDh89aM0K2FTCIbzL1SQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JfV9vyPu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V4PqBIB4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC250606A686
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:15:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC250606A686
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JfV9vyPu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V4PqBIB4
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJBuCI3754343
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5gNzs6EANygMZK5ge43vpO
	x516Pj7m7kYw7rk2R+/3s=; b=JfV9vyPudrDx2Re24l9pRGmD6DeB+zU2fzjR5t
	oEWwTgUk5XBlMfnCO4nuy54wDyG5eOAyZv2eaIF/aBtese/jT9BlBZxTb24XXoWI
	NlcfdzbGWwzq5mZISUytpcXVw3WmIij0Dpvr7ko+9UCyN5DI9m9evKdZjNGVfG/p
	Elobrocs5/ENMgBaskuDtEPNMeWt74RYBf+dRqmBp1IHeGWYWkGhSTxxV9o/2yna
	3a1ROmp/9dKwWB9Yi2NGluowy+EXjWiDWKYzx2sHZmnr/ebZN58SvDsEr4pxwQhC
	TYkeCstOzxBNTmSqgl7jq5QZaCrfvRospcLyh0lA5h2eFPJg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74gharrv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 20:15:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-949b0d322fcso1378572085a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 12:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795810551; x=1796415351; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5gNzs6EANygMZK5ge43vpOx516Pj7m7kYw7rk2R+/3s=;
        b=V4PqBIB4g19NVQq2TUXgzxT7VgFIsVARFImJk5ZJsUBIaCqHqy5ZrGwJ5NcOm/wD/p
         3T2kBCnxC2CIKyZIc+Xnutz10zYOx3qiJ673UPXmK3ZAO9BnYfYH9NDrMwBvV18T61Bk
         CZGD5fOlqaA1PKjh5cIHx2r3myiTDN7OrcpijYcVf96xr2S+GFvIeeFdm96Ev8JzNO5K
         K1EmWYIGKAiaIFo380MOOUYOUW6dN53pFtNKR+QcdOBP1bA9H08aplnH1XdrO3ozD/i3
         S6bfyAzyEjqS6NJmbVxXHYX/3MmReIQGkGswkm0k9T1s4whAM7jGoK3dHBd9LBbtsQjR
         YSIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795810551; x=1796415351;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5gNzs6EANygMZK5ge43vpOx516Pj7m7kYw7rk2R+/3s=;
        b=fHq0IgtQ+VxvIyO/olomynkDNpg42f0ESqIM1qFpeAfsDKKE9iHOPa50PJNDpEOO61
         9tq7zHze+VUNh63ZkBNcwKP8W9hxEuFDtUVhVX0OjJDf1/9kIqnTF2oygabN4JUy8LDY
         AHw2oKvJM4uoi2xbp1E6JlsbgsYgGR3aACL3Y+GUNzp/ho94Pi9A1DhhFR0mtjTG7ejM
         UZ5qVo+JgAZ/lugesoPITdkK7+QGI8a9OpxS/ib4KnsdR93yIroTfaNiJ0wpqA1401p3
         DxHvU7jgJ9cqorkGdZbXH8YTaieBviXVx6DVO/AtKkvSAEMURDCzvtxGkDl/kFZYhpap
         W/Fg==
X-Gm-Message-State: APuU4Z9TQGLfMP21l98vVCIlvJR7919fISvAAWDu4YVeZl/yUl5AtHwt
	oQOgmmx0e7srECdAeUAqVdfR2IMdP9PLL/dbj+AxDTMIJfDz6Jm+2sggSZIXWF97OvBMgbjiuBw
	scZ0D6GgPEgrSNZ9XUUZ0CCjFV0L7g7CQmP0nCqFYGuZgySC6/Y9EV650v2WRfwc9LGVL
X-Gm-Gg: AZFdTZeZB9/lKGC3dXCNU6tKQD3595rwCQx8lxVZU2l5kzanVfcTcK/tD+rksFmkPEv
	OIf5C0xI4bOZexVlt3c/jpKftJbAYGI5cffb929/IybJa1ssfWk0RCWQ5fK70rUQpyj/WlLFUXX
	0otqArjl89GMmxsNYvVUub+doxuO+XqqgRRecWKsROmu8uVIADs89Jb8pD72qCkDtFRGIAqc9j+
	xM0jptI9NhaPOmkFf4htyLfaGcrw9bX0ljHP+gciDMn57auKjemGLmpb1q6kb/2KZ0eh6y1LjkL
	OKCb8c0g7J5w6eTxOonx+EzNjw5WxXoHE9PDtkrFSPoJVDoLIiMpyqucLo40SXE6Oqjd9USye0G
	LyEytuhEW3+F5/rXjUROiM98y3jDHumBGYzp3LO6aM2ZRrgNACX0PcvNJb8R/vnU4yXfQP2NdAC
	JurM+IPanYdN5Ph2VGh+frHJzBnSQkZgjbbS7GL7PZdyKlyTskLTOo4P/zugTCsg==
X-Received: by 2002:a05:620a:2956:b0:949:9cf0:badd with SMTP id af79cd13be357-949bab2f511mr4493845385a.73.1795810547739;
        Fri, 27 Nov 2026 12:15:47 -0800 (PST)
X-Received: by 2002:a05:620a:2956:b0:949:9cf0:badd with SMTP id af79cd13be357-949bab2f511mr4493808685a.73.1795810544398;
        Fri, 27 Nov 2026 12:15:44 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8050fddfsm64591511fa.16.2026.11.27.12.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 12:15:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/3] drm/msm/a3xx: follow the msm-3.10 kgsl CP setup
Date: Fri, 27 Nov 2026 22:15:24 +0200
Message-Id: <20261127-a3xx-fix-me-v2-0-839408d293ed@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANzkCWsC/22NwQ6CMAyGX4X0bAkdkRhPvofhMLZOZoTJCgRDe
 HcHXu2hyZf/79cVhKNngWu2QuTZiw99AnXKwLS6fzB6mxhUoSpKg7pcFnR+wY6xcVRyZdiysZA
 u3pFTctju9Y9lap5sxl2xN1ovY4if491Me++/eSYs0F7InQtHjSa+BZF8mPTLhK7L04J627Yvs
 Wir1L8AAAA=
X-Change-ID: 20261111-a3xx-fix-me-bf13e6cedecd
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1143;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=9u2J6T0zD+aRYytEaKwDgO4p8UYRuVHirQrfymlclSA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBrCeThc6JdlLTLoOb2UMIBzZKLjUDoTPdkeAM9H
 WiFuLL8TEOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCawnk4QAKCRCLPIo+Aiko
 1VC0B/9h6hsIGfLVmQnnbkrKuIXaE2zGfHHJ4pycLV+JI20l2iQ4XDuXbCQXPP249Z65RZ0ji3o
 qOM0I7lhr7sKY0Z0ZEIz+PgBqkN4v1OqHdWtfnQzesod8IkOhNxAPCL+IyfgznNYVroNvopdTuE
 g7l2G0liQQnVJsNnMNi0VNeh/ANHY9HpFIG9Nts2ux5HYTHnnvTbbwUtEV3RUOAdTeS+p/8YlwI
 iMOKhyG7NUEPRNOBKt0Ki0zHvPqtRPpLowlyK1DK0BeVBmf+Law8RW2aMCiv1jhExd1wsnBiMsP
 FXuVMvyvodwi2QJRJ4p3vF3hRWjhvAZAMkx5Mf1MIWnNVsnz
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA4MCBTYWx0ZWRfX5dRVQOBEgv89
 jVjk5Sk6iLQhiXQc1w2KmhTBMZWNpVavW1Bb6uQ+5k7cCTxDasd0EJJnignGjvYrJl2d+5Z06qA
 Nj8d9LfhpqngI1ljyZzK7zxvOJ42i7Q=
X-Proofpoint-GUID: NCv893fCewCNMwrWNbG603dWJUmEncCl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA4MCBTYWx0ZWRfX94BnyAYQpbPh
 bPmM/Yq+Suuuy8VAi3TgBhR4GAaodUtexBUjluh8bZh1RVqFYCAWiALy4+j4VO2S8aMkeGF+WEg
 05FPOThJKGmrVu+GVvVIDtiix5KhyYn/YaJJhLXVpnBrxugc3u+n9w9xTrCg0uhKOLJikHqrEUG
 nKVShGpa/YIcTuVrdZc1H+alr8hroYO4YZ8f0oRPrfIu01GsDWitAv8YAVUu1tHZyjn/e+fSo43
 InlXRYtiWq0cPid9vL3Kk1MuIw60TuIWBRFVZhDjI6CS9cbWrlRQoRAYfSmtLwT0kZzhXiyg7z3
 u+eTnFPMOzFof+/x2y7m+a6oPpqb7RPLZFIE0yg2GAStI/zViHtRdd3unsKmVUMKWifqWBKu5Or
 DC08NlE4to5V7oxOSRGt9Ypqi/jGTbkgyCOiG3sYrwPJpoU0RxrBA2vbcecENPiSEVEs1X7zCgD
 xKVk7PfrXhOU0l6WCLw==
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b09e4f7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=QxjlNS_XKnkpB_o31RsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: NCv893fCewCNMwrWNbG603dWJUmEncCl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 suspectscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270080

The a3xx CP setup in msm still matches the msm-3.4 downstream driver,
and a3xx_irq() silently acks the CP error interrupts it enables, so a
CP error only shows up as a hangcheck timeout. Report those errors and
bring the register range table and the CP_ME_INIT data in line with the
msm-3.10 kgsl driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
- decode CP_PROTECT_STATUS via register-XML bitfields, not open-coded masks (Konrad, Rob)
- Link to v1: https://patch.msgid.link/20261111-a3xx-fix-me-v1-0-d81f50f1ba1e@oss.qualcomm.com

---
Dmitry Baryshkov (3):
      drm/msm/a3xx: report CP protected mode faults
      drm/msm/a3xx: update the CP protected register ranges
      drm/msm/a3xx: update the CP_ME_INIT data to msm-3.10

 drivers/gpu/drm/msm/adreno/a3xx_gpu.c         | 32 ++++++++++++++++++---------
 drivers/gpu/drm/msm/registers/adreno/a3xx.xml |  5 ++++-
 2 files changed, 25 insertions(+), 12 deletions(-)
---
base-commit: bbfe1d58f42ad2cb56a01f5717355901698075e4
change-id: 20261111-a3xx-fix-me-bf13e6cedecd

Best regards,
--  
With best wishes
Dmitry

