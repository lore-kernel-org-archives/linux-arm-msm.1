Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07BA433E62
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 17:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785173624; cv=none; b=jhDZwswTuDvqMRxtwtVltuSGxNDH6hH5vWEslwp7dMBTme1OzLmIvniRkhEvPFwNmByIy6+ZY1XTP+dfeOUARQAdb3eCIqn+WuUkWp+FmX/MC15maW+bWBQpXLHOnLQIXYCO5upexvark0kEXiwZKOzS2FYXS/AI10t1Y+z4WEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785173624; c=relaxed/simple;
	bh=GD8a4T2pmPzM2HYB9bDCBYlqyMkxR+BMc+7jXGkZ7w0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DVzl3C04vtEyrDrVHjwNBwp3XUzG5/WLhbs3usW1ZGteS7z5gvFbK/E2vzfg+f6XCVXM7rljGxu4YnIrqx+0Dnk8D9KC0YrUHpMoubEtHejV/NmFDaBQwziTCvSj+uuGRfDr7CsHikFYWblId4WrlDOAb0PFhPakG03QfqLGE0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J9O2Ssum; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IJybNoIM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J9O2Ssum";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IJybNoIM"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RHSFtB355572
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 17:33:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NnKGuinEzab
	GvkvID4K385i66E8Iq+o2wHXhRmPpykI=; b=J9O2SsumrkGXRlssgjjirkf6ba2
	InnICcd0wgO+aevOVI2lFPGRZj1AsVRgxFLF7mJGLW8E8WvZ49qNaPbd9K0mT62X
	D0OWbaaDfYjvMgBKev93xmDFT/+F5VYM7hZQdNVJmO0fskBZ+bFaNVf5PdOjngbP
	mgrFpWwqmoiXjxI/5asI/uO3U3M8orXagq5xcO60KP8BCqX20wDTSIcNwZHW9vWf
	R8cvi1mhg8ulSiBfqGNYi/K5l55j5Txm4bOopmGfecJw7IWvlxoiMIZu89pwjwrh
	yqWvE66wxWFP5cLCwBDLPnnMgMq4QjFZr+LNaDgp6uoRxWAGgfnWbUMUdaw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbrsr0pa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 17:33:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5276aa86d00so36534341cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 10:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785173621; x=1785778421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NnKGuinEzabGvkvID4K385i66E8Iq+o2wHXhRmPpykI=;
        b=IJybNoIMucneh/mEPv6Pj5GAsIbTDpmv0wezhtRKPDxeEvVC06sV6pX0q2bM53V1au
         KOxPQCZflWeTPBC1lTdfs8hrc6+B+gYc3dXBPKqSaFtSBNiSFa1+zAAy7lCre9C5zXmF
         Hz+uJE5JFKfx3ylp+aop/9PFSzW0pQvYnss4uA8iOwzjxmdpUHn/3jDor0bg0cKu0XJh
         oswoU2dqnG3gpWFzq/8/BWNSjWUx4CzrUipK9RfmgUd5hlcMgqFnGUv5SliZnOciTf5C
         k4AGp3LkyD9K1YyeMY2H5F/EgAjem1u9r89h4WSwRr3gVzIKiuObEaydoMP0km01yRCE
         JkJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785173621; x=1785778421;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NnKGuinEzabGvkvID4K385i66E8Iq+o2wHXhRmPpykI=;
        b=pioRlPb5rzlMo11b38oRQtO0EeRYU3FDBz790o445AfrigBHFTdpxfqJytLtHzqZIZ
         7WNswjCdqXl4b+bhYWyy8liI/4dKjaZHfAv2o33MjMIMa24IArFuBWUoYINaihc5aFiN
         nESznmApiEQHT9rsODJgZEmeofdETmgDdxfm3gVorJ/c4XVTSrsslJOp94ITZ6SJmstH
         vjncL8M8S9qlufWLqWRCHxBnAfmat7AnkH4qOpqfl4ZoziEnKafj/tXCI8I2Pg1afGe0
         QUfA1gkEJmMVbx9RXNFyqTgIck7ux7sPVIBlB8pZ2Z++KBmgvUJ2qoXfbNCxQu+n1fYs
         wcSA==
X-Forwarded-Encrypted: i=1; AHgh+RrsoqnyAEn9JAeKo5h/NIaXPegiRc1KNTzrR+SEdbyGGMaWqxykwseCjhGtPGGdRJ+dDqRtgdHRQHITFaCd@vger.kernel.org
X-Gm-Message-State: AOJu0YwYSY34bSgIIAlOUZ7OLYbi+FLzt38r9qV7bZl+tTlVO7e9HUqq
	84yGrcpQP/0jO8exC2FQ54luPsQkgAwmDvdwMaQGkNtvyD0q8Vrry0/TKH8Sp1VNX7Gj3u2QZtc
	CBqIXsRKtlp1dstqmxpCJrgZKORyn38Uj8u8w3ZiimdDlpElpjMYzF6u7QhMzJ+S288y/
X-Gm-Gg: AR+sD12tDqZ94setUqoxu0fV3rxTywY74e52TOOWz28b1HDdbj/5dwL2k7j+L7PDi/M
	Y+jmRCyKdBlZZkHhBgmoT14alMRzdo5unDIHOLWxsdkxpZ/Op2v6rgtnSZ+KU0mHqFB2BCUmWnD
	y2S67KkbUSyGxXd0jGxaPd5+0aWv6tu4tJD0/MKEh6UVVZUnAV+f5W+eqng07a+GPEu7GHdCJVz
	ZBbtULsKBZh91TiR36IYQ/mIrTPnKwjVx8ci5hBlamx4wSWFmV7hF+J+A/RfoD4APlnWJak8oy2
	DViEmPFW9lpiT0MOLFxlAc8lMZ2TMISAnqYEEl8TEeYdcMLsLcZDTmTMQdB19IIpDilgTI1vEUZ
	s8qR7zxt59Y5mEGUoA4vH53Z7HZZytG4V4GRhAQxR
X-Received: by 2002:a05:622a:5a0a:b0:517:72e0:612 with SMTP id d75a77b69052e-529a864cb58mr95958091cf.42.1785173621197;
        Mon, 27 Jul 2026 10:33:41 -0700 (PDT)
X-Received: by 2002:a05:622a:5a0a:b0:517:72e0:612 with SMTP id d75a77b69052e-529a864cb58mr95957871cf.42.1785173620802;
        Mon, 27 Jul 2026 10:33:40 -0700 (PDT)
Received: from hu-yabdulra-ams.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb5543370sm2945391a12.15.2026.07.27.10.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 10:33:40 -0700 (PDT)
From: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
To: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] accel/qaic: Add <linux/device-id/mhi.h> to qaic_ssr.c
Date: Mon, 27 Jul 2026 19:33:26 +0200
Message-ID: <20260727173326.2219191-6-youssef.abdulrahman@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727173326.2219191-1-youssef.abdulrahman@oss.qualcomm.com>
References: <20260727173326.2219191-1-youssef.abdulrahman@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE2MSBTYWx0ZWRfX1hd201qubUwC
 LJ8FtSLlJrs4PF80r9JY+O3Bs9y8nXudvpNIdehXqN81rUgO/cq4Gogeg/CYqhdyRFGUkkWGoUD
 qP8YcLvdCjX0Z2WhIsdjWS+LSUAnzj2njzFWhrdXVPciBRcfi3vPZb5q+BBO3w8fZjQMYjV65Xf
 rXIbxSoJICF6vQor7smfNuQKCiEX51dW8x+3uiGVb+OCZfWN3r6RWD5q8iUZZ+SC4uZHCzeevE1
 zBa62XeS51RD1YMAaLF8Cl1GWsfBVhqdzw6j/xF5GX1vLLNGu6JUoWmUgKnemUPx8qRMJfbIGPl
 Z+bJ6QIsfupDMDDnqmJk53ezPgKFuI2q+nzbJdS0s4RLv1GVRNbWe3KsFQjyS+HiTH4qy5l64Ip
 iXzo+PoUW6C+Vmvtc+qeLJ5gMBPLb0iXdlNqC2PxOmAoaDvkFBTwEOkg7Ry5f8VNVK75saFqtmz
 Kqtdf5MVkm6wyGLz5qw==
X-Proofpoint-ORIG-GUID: st8wzM6QzQu2ixzN9Uk7hYfn7A3sNQPH
X-Proofpoint-GUID: st8wzM6QzQu2ixzN9Uk7hYfn7A3sNQPH
X-Authority-Analysis: v=2.4 cv=ALkdLnG8 c=1 sm=1 tr=0 ts=6a679675 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=bDPGSfewVkDLoBZFfnUA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE2MSBTYWx0ZWRfXyQAmYMb2Ayr8
 4vw6GpGUWZfZ/NN5+5+WmeTx2fiNtKqx273bP+aPLUBKjTHEfdwvxhCD0Ri1S5MmYcP5rAaCa8u
 ux0ILb0o5Br0EWAO1E2MjXQP7yE652E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607270161

qaic_ssr.c uses mhi_device_id implicitly. Include <linux/device-id/mhi.h>.

Fixes: 9675093acea0 ("accel/qaic: Implement basic SSR handling")
Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
---
 drivers/accel/qaic/qaic_ssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/accel/qaic/qaic_ssr.c b/drivers/accel/qaic/qaic_ssr.c
index a98928654959..418f14936f9a 100644
--- a/drivers/accel/qaic/qaic_ssr.c
+++ b/drivers/accel/qaic/qaic_ssr.c
@@ -8,6 +8,7 @@
 #include <drm/drm_managed.h>
 #include <linux/devcoredump.h>
 #include <linux/device.h>
+#include <linux/device-id/mhi.h>
 #include <linux/kernel.h>
 #include <linux/mhi.h>
 #include <linux/workqueue.h>
-- 
2.43.0

