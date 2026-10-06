Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1063BD638
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 22:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326545; cv=none; b=EoEB03HIH6HUCPIqSFYkHPXOdSkCUStcxqJfgLX0ZN+lAZBhS3Vy2cvTNQiAeS4XIKOS/aSizrQraiKbT1sVUF1N2NaSLEIGqldKhs3MNL/PjV/UDxVlLro0Ty1ek8S7pHaMQh5/OpvhVNBDjzjcgplX2r3BOGmYKsyoll3QHzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326545; c=relaxed/simple;
	bh=VOMacKAim2NeRKzYRGCKCM59giQCmbzASTn2t1LQzPA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X9jRhxR7X4DEE2sWQwi+D2Xr8SVYUFanoXIJWpW2jTFIdtVAMvj+L44FZKWpRp7PnbFI2anhjJ0i2FuqAVM69Ufyktsx0cFu5E3aE6DR/gVvuCT/ADq7HIq7LThRHCUO6Ws4GrjnvHXtQSX6B5El8ANGKl2dRFN4bFr4QCl8Vd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mn2f8f68 reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mn2f8f68"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LerhY2389912
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 22:41:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zwweVgbuw4Q
	eHx19ruMA4VKdQmD4Y6znPZooowo2HgQ=; b=mn2f8f68JJPPZi+RFN7X74QqpLR
	IkHyOI/5pn48/3g/a+YNnFLfTZAOHqP/Euzuk04jET/vNiPfVvWPfnYxrS76+hYk
	DyJ/IKw6f1jU3yBSXwaGgTsR/y7i5uGVMiDjWUVFk/dKJN5bGf/wNYNZFoMMzgXp
	LmrrABKgTg+mTtbAqMe6cvSbYntQ7vdS/Siea/3L3yUvUiqAhK1d8kVUY+kFLDbW
	qTyM4Fyse6EOX3tPVHnOAEu1HniQnROg+H7NBwd3nBqVmXwfsoYQhkRfByeVHPBH
	eeodvKV9/ws0RgQ+QydCQHEteIPzV5H4MsNOhxwgPw3pc4T65KCTOr1laxA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xfbk0uj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 22:41:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936aa34873bso658338785a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 15:41:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326465; x=1791931265;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zwweVgbuw4QeHx19ruMA4VKdQmD4Y6znPZooowo2HgQ=;
        b=dHm6HZYi67Pc5N6ANLtsPlM68HipDD+VSL/8X2CcFdCM+ATe72lz0ZrBi0fcXBK3BI
         ft8rokggfNc0WAFbCkHhplvdsL0WUr8R0oOVXPMbyQKUG/gctL4ThEGCv4Czm/6WRamQ
         itxPrmB8ZMTb+oOWXNmWi9nc4+LMI5rw60jG1eRElDxkbPLjZKTNunSnCPs1tWbQH0kV
         Zb6b7zLt1GXGuMPFAOs7/r8XJnxutNgHtENCqz/10n3ECt2Y7l0sBFx6dSZPoR9RWk0+
         9fiDU8yZh5ug8srNBI3N+1/P1TJqFeJS1fbMTgp9C1qiFU2FS492AiUzzKpYoAWPTyYt
         rm+A==
X-Forwarded-Encrypted: i=1; AKwUvBwZMapti8GMNiEoILusVtsYXAkyaVYzu8AxWuAZZHdxuKcLi80GFbMhkvU78/guEauOYrcpFqB0gNG/RGSU@vger.kernel.org
X-Gm-Message-State: AFuF++l08Vm3cjRYr+vkUDOQGAuwPMteiT+USQstjgH6bvX5UCPCFn8j
	os5ul+SPOj5/B5YME8N6c9yGMJou0OZeu2IhGr/KR2K46LEYwxxSN0XqxrMEbuSqbe4QuRrR7Zp
	BT6dRR/1D1EPFhlZ9pV1JmPZJ+rg5TEZHZxNIrJY/XMWtgzbcWrQ68rVjkKRu0HrvvDmh
X-Gm-Gg: AYBFou3tjxXcUtjNPEVt4MdFOn3zdXWB//t5gxMy8cbobiTv4+4HvUfG5QsnivENOKo
	YpdR4BVpyyUZHKI5fr4FU61/0BRo3IGRppHUKoYd9nVhaliKeKsMV1EQnc68ADqtSMEVSNHw9pW
	bNnKfnnBrKFI18MMyUca6Sqp2rou4sdBdoMHKY4PA9SoIeWmBYvr1xy7tRzz5vFNGQ4Ze4AN1G+
	Nd2G7EIhbwRfmePGMz8OyxqS/iUYLJ0Y+tOKsi+voqy/Grb45R0zTiq2FdwPbo8TSCkeZwbY4hX
	7aOMu6tNRLxVfJdfmL/uhuaGQagIbaB5yXybzGOG/arWGu8VG5sgxm40Rgw=
X-Received: by 2002:a05:620a:2853:b0:93c:7582:14e4 with SMTP id af79cd13be357-93e9b7b9d91mr70292085a.40.1791326464697;
        Tue, 06 Oct 2026 15:41:04 -0700 (PDT)
X-Received: by 2002:a05:620a:2853:b0:93c:7582:14e4 with SMTP id af79cd13be357-93e9b7b9d91mr70289185a.40.1791326464279;
        Tue, 06 Oct 2026 15:41:04 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:03 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
Subject: [PATCH 21/45] media: v4l2: add Qualcomm IFE statistics format
Date: Wed,  7 Oct 2026 01:39:29 +0300
Message-Id: <20261006223953.3382273-22-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=D8TSufRj c=1 sm=1 tr=0 ts=6ac57901 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=ayFhjqOtJfiHK51EeDoA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: 0e02lVChT2foiKJbG0TA5zUTF5VCaTbf
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfXxqe6y3OV1Uwu
 KMWEeT7BIjJi+qB2uV8oavoXn0PNSnQhB07ZAyZDBcsRVvH+9QUShOZu5VOh8CRxGjLQNM+TJPp
 DbMRxMvZwCEg2t74SYsaVvGh0/4wN24=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX1YDrthPnEYcg
 Q00XLTRkIRJjxN2sSd39UVSMYFFQ8Q0+K5f4G2p0GURLAnabr4hR+HLVbUpa3UXEtSZaqEqxkrm
 LJU5yrlev7/igzJaQXkmQuqg3u0FAeqmWwG9iWoCm4GpjWbzCO/H4BL1AoS1JXfGSZkUDRStIt3
 /Xbds23OwmCtfC76HYYCELIVF5ezFdBtau4whWDEET7FmiwA1MAD2bH4ZMUma4+BNqL9VUMgtfx
 IeLxxe4GUYmkLAJwhEPV8LGJnzB4yEhqgGN8YX4Mvg60YSl/DO3ZRPJJEZCwRrK6Icwmp4w3euE
 6qrLCVy+XoJLvX9sV5k4ch4iszT8u604z04vKTd+4ZIx2P7q+YuhnnmMTf1QNdn8LajC5U8adJw
 Voq/06UhdvG6AhXMFlssb1ALkoujdiWA4Lfqc9hBzI6+Hec+vMhooacaDIkygAuLrNkFrEneqFN
 /LRAobweRUCMojdB3rg==
X-Proofpoint-ORIG-GUID: 0e02lVChT2foiKJbG0TA5zUTF5VCaTbf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Describe Qualcomm IFE 3A statistics buffers with the QCF1 metadata
format.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/v4l2-core/v4l2-ioctl.c | 3 +++
 include/uapi/linux/videodev2.h       | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
index cef1593c1835..b7173a258225 100644
--- a/drivers/media/v4l2-core/v4l2-ioctl.c
+++ b/drivers/media/v4l2-core/v4l2-ioctl.c
@@ -1467,6 +1467,9 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
 	case V4L2_META_FMT_RK_ISP1_PARAMS:	descr = "Rockchip ISP1 3A Parameters"; break;
 	case V4L2_META_FMT_RK_ISP1_STAT_3A:	descr = "Rockchip ISP1 3A Statistics"; break;
 	case V4L2_META_FMT_RK_ISP1_EXT_PARAMS:	descr = "Rockchip ISP1 Ext 3A Params"; break;
+	case V4L2_META_FMT_QC_IFE_STAT_3A:
+		descr = "Qualcomm IFE 3A Statistics";
+		break;
 	case V4L2_META_FMT_C3ISP_PARAMS:	descr = "Amlogic C3 ISP Parameters"; break;
 	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
 	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index 70208a9443d8..4a0748b60a15 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -876,6 +876,9 @@ struct v4l2_pix_format {
 #define V4L2_META_FMT_RK_ISP1_STAT_3A	v4l2_fourcc('R', 'K', '1', 'S') /* Rockchip ISP1 3A Statistics */
 #define V4L2_META_FMT_RK_ISP1_EXT_PARAMS	v4l2_fourcc('R', 'K', '1', 'E') /* Rockchip ISP1 3a Extensible Parameters */
 
+/* Vendor specific - used for Qualcomm IFE camera sub-system */
+#define V4L2_META_FMT_QC_IFE_STAT_3A	v4l2_fourcc('Q', 'C', 'F', '1') /* IFE 3A Statistics */
+
 /* Vendor specific - used for C3_ISP */
 #define V4L2_META_FMT_C3ISP_PARAMS	v4l2_fourcc('C', '3', 'P', 'M') /* Amlogic C3 ISP Parameters */
 #define V4L2_META_FMT_C3ISP_STATS	v4l2_fourcc('C', '3', 'S', 'T') /* Amlogic C3 ISP Statistics */
-- 
2.34.1

