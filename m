Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B71A4FDA4F
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 15:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790782024; cv=none; b=gkP8LqGlDSHeP+L/H2nfcWm0JlH/r9b9VHxu2MT5R+LCKVnYYILtuW5apR8XDFeNGLA/6AHopkr9xH/S2nXQBmXrgMhNAGItm8p60o9wpLquPK2W3KgJs5q8ayPlHFOTVTH/O8KX+133TQs7zYClgyYH3Ee5KwhMpVeSVMmgvpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790782024; c=relaxed/simple;
	bh=yCPp8YgXoeapKbNnCIZfiPYU6VDPYmYj4iyaq1RVyJs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Kihpuq4Q5UyJ2AmFo6BD6BbbpD9afhveXL+AzMLjjWOnzZ87TTUhvpYb2CHawYfTQgdlzQunshtkum9ijRL/xufHznkJml74ZhaoCYMG9Zv4dSEGKE5DVAtXiDlSiPWy8ZL3yss6pJ1+EYttbKWuEGeE+8/kn5QDOFwtaAUAPos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JGiX/Y7n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MOxA4SQm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JGiX/Y7n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MOxA4SQm"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE08K62970854
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 15:26:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Dcex1xAebPX4V0UA2DmDO6IM9OBE2nimJwk
	C2WwGyEM=; b=JGiX/Y7nw2ZjqIJRgzSr0GNYoSezaWXAwU69BVP7X/wC04Akdi3
	dCTSW/79Ka/Rtef5PRuaZq6TKJfuNTpGuPMBL8nlXchQrAJJPvilc9EQgAPIQggy
	wfmY1VexiAOZDnQVsj9e9hDz667wo8dQj9udK2ioorZwrkqxOlEI72DHvke95tMh
	6jAPl6rggSzPmnmdD0BzJ+5nrfkdmvdg0/tpGuLA/ufFMqIbRm3F8Q/MKirdUMmU
	nrahXan0w6lTLkDISLADJwtmQSkjHRVV9jsdiQdvcaiGGS/463vAUzYFugv4NMNK
	9tP7OXfllCzkdMNWFZa3cj/LRevXUqPwsUg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rhekjfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 15:26:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-530d86d40acso119215571cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 08:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790782013; x=1791386813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dcex1xAebPX4V0UA2DmDO6IM9OBE2nimJwkC2WwGyEM=;
        b=MOxA4SQmp5WhxS7dXjPJ7fEPO3QuRrLJOve01uNxle51WjI0XTaqe7cx0D+ijz43ZA
         x7+Ob+PI20RcZ5vjCGZDgNI9YJSEBdlguyGFgJNVFc7hu5aDmEJ0XIgDQX/4hXOJ6c8d
         v6gWY2nBUVcJyyB3o+O8yFpm1sFopThRKB+9qyu964EJoUAETu1flShyZDQJXSF9u1e/
         BWBGq7OCZtmFP8m5kL0R0goAN8EFCLvFM9r8QE2KwpaKSg8Vg3svm0ennGqxiiMtNFcX
         xJ/O7qZdxaC+pcZHYsdl5h3Io/iNNcuLiAQYBERizmS4eJSC9rK3MCxzBYpeGacI9oOQ
         CNTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790782013; x=1791386813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dcex1xAebPX4V0UA2DmDO6IM9OBE2nimJwkC2WwGyEM=;
        b=L+c/9AWANmlh3lOtVA93m4WiBqTwSd4qsxzrHmna1aAFrqzID7a6nzA9a203tYFOI1
         wiezlC/P/ItRhsBvHDVsuLdSYCdmwMphgZIgWWHT7xMwKgyUsusyqtu/x0o7RT8McTN7
         H0uGHP3GRNIeCe41aMJxMy3SRGZ9bw4iowvlwLU5GbfTgmv9knvQMl1d2CsDOt9uH6kh
         2VVMU6HqbRrNgUUEvhYfUhpPqyje13WY+U/xi2J6YW8I6c4Exh272/9u3VwXQPxvYL+V
         /mZwHfXBT0VsdAbeMcD+HMGTLBEB2hv2sAbRBXdNPxJBx7/lOMIP/YV0OyZu89a3xpy7
         2dmw==
X-Forwarded-Encrypted: i=1; AKwUvBznkp1lGOcHenBTdzImlVSBMbMQZjayZwCLsGY+GwWFOpmYlVNZrNQIxrF1OA2G+EQYKh5EEB8p7EZ2aFkl@vger.kernel.org
X-Gm-Message-State: AFuF++l6my9gOBf1r43mEPf6pr2o+BAifkIhjQNxnAHLXlt9I7sGyJ4O
	AZliHlm/JIWmx2PWC635fcKUB766XoU+iYVz7HSZNT0CghotCD/ABed6yqnGr7tLe1O+0wcoWFF
	9ZZ0QXCgT0a2Hk1zI6nl4RXcE6K/9Ln+3aT3xniE3y1sXj/vQu+t0rIauzbB6ybJulHUY
X-Gm-Gg: AYBFou1pc/ByZbHStHovUHtSkIScp0DXnamdqxMKFMMGtb5LIUeVVWxRPruKxB45xzh
	11ibAAtstfy9p8pGie381ih3kSKlb7M/JY5Ez5hqSPhhUuObOShhsocDWe7L1HyOxD6Wgt8+FDy
	KnUQPyE3WB7i4u9LYekaTpdRpSu1lGuC6zDMZxkWD/T0I0omTxvXIz7S16z0IQ+buyDHsWiAiqm
	iPzI+C4oEADUCQ2nB4N22CxZkdGwSL73NUP3OZamUuOeiUW00EGiFaYXxTvAHrzthyqnL1v9oHS
	rOjg//Z/VzpQrZY/qgoiC7shihbMwwz+lR1nS7XuSsuxx7coRBY5z/ItaxYT8wfTSOTOoDDUk0a
	vMOUh5QrjGfRh1UHHxjRyTF5pPK4P5G0XO0Y8ao1PchW5LYpI8RV5rBFqkokRg291opKlw9/WVT
	BcZu3qxA==
X-Received: by 2002:ac8:5946:0:b0:532:8ed7:534 with SMTP id d75a77b69052e-53374d402f4mr32587171cf.37.1790782012817;
        Wed, 30 Sep 2026 08:26:52 -0700 (PDT)
X-Received: by 2002:ac8:5946:0:b0:532:8ed7:534 with SMTP id d75a77b69052e-53374d402f4mr32586621cf.37.1790782012128;
        Wed, 30 Sep 2026 08:26:52 -0700 (PDT)
Received: from localhost (ipagstaticip-a5183818-34e1-b901-fa5c-deea35ceefd1.sdsl.bell.ca. [142.127.77.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-533824e35d3sm1719971cf.22.2026.09.30.08.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:26:51 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Connor Abbott <cwabbott0@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] drm/msm/dpu: Fix GAMMA LUT for sm8750 related DPUs
Date: Wed, 30 Sep 2026 08:26:43 -0700
Message-ID: <20260930152645.22194-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: MCsCe8JAvt__k1LXeIGIv4DeC7z2P-YN
X-Proofpoint-ORIG-GUID: MCsCe8JAvt__k1LXeIGIv4DeC7z2P-YN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2MSBTYWx0ZWRfX3ibB4ZiG0LLO
 56sDCplSlKTq32bgS6J4eC11lE/rJcDy+KBxDFQ9k25iLFES336UgpgRYmhdNmgLUFUX9Q9gUqe
 Rj9XL+/v1D/qwdqo5WvMvJWwX9UpVHbsiFiBqpJLfMoZFSRwNIFqGIInHWZFk0QHpyNkLZgiIzh
 8bDxKImnIZhkzhWbuMHcL898x9hgGnWnKu/oiS8oviYB/d3WrtjXhaBLV+FOCPNWwL7BfuxZJr9
 W8amnxHFP27klrr+OHQtW3qsm+BF7hhH1Wns3f6aK9VHLzx9dda/yoM+bKgZvNK5LaH61eR+Suy
 KffXGQR0HUxaWz5qresKQgb+c+RMIy0bD08GvI9XoBg7xJ7ljBgy98rvW3UG4lEBsiML++3XGFC
 zrnKghQ9Mc5N4ZGPScbbeMCd8FFUe9yldu5Nb43A3SUfXSl26eW+zVbpu0bNU35SflUTF+sDB8T
 IxuOYnlHRI3X5CseMXw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2MSBTYWx0ZWRfX3HWYtndvbcPg
 2ZGSijHq1eZDWGaI0gV4+nwSicwkeaGzLu+6H8y3Ifs3tMw4M6sNfbJicVl8kSCDnS78JZl2+yw
 +RHHtMKTX+6dPcXdPPyyYjik/0uwJaw=
X-Authority-Analysis: v=2.4 cv=Tu1zFzXh c=1 sm=1 tr=0 ts=6abd2a3d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=8VafS78ZeU61HtrzG+bZhw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=ILNf-aDmxzXD4JfHqJcA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300061

Add missing GC block.  Fixes GAMMA LUT on glymur/knp/etc.

Reported-by: Connor Abbott <cwabbott0@gmail.com>
Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 9a993cdfab85..107150a8553f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -428,6 +428,8 @@ static const struct dpu_dspp_sub_blks sdm845_dspp_sblk = {
 static const struct dpu_dspp_sub_blks sm8750_dspp_sblk = {
 	.pcc = {.name = "pcc", .base = 0x1700,
 		.len = 0x90, .version = 0x60000},
+	.gc = {.name = "gc", .base = 0x17c0,
+		.len = 0x40, .version = 0x10008},
 };
 
 /*************************************************************
-- 
2.55.0

