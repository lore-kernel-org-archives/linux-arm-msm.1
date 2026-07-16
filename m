Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E088143F084
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 19:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784230241; cv=none; b=kvN9OOjnZCuHm6RaCbGhz2nG5UW+FLNRnOSoaohkOjoC++G64YwkGXOAwGxV/sMl3TrTDik9452oy4pSzWMjZQfaF+4kB/hhDHZhN+FYyh5v8s3GOqXcM39vikuNI4MxEca9lyGIpSooAn2STiIo45sRpOWGpntXvp6oi3EOpss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784230241; c=relaxed/simple;
	bh=2PN/tmpjLEOAUOEiIZAeKGoU4acuia+bZfUQHfdDPFs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=meVCot3//XwHx3ZfsCdoxYNdW6DO+7PFddP7Rd11wqVFL6Cu5xCe1FInc8C2AhRY+7/5iEcVLVtUekl/6huNHRcR7FtO8z8LRhdrbQsOQXwWO8fl7DdbZsh8zjeujuMZHyLIdsT7fK3jTKZaVRoHjMTHDZh4EcCUbXBP0r17zOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y/EZ3Ir1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GvkxIaA4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y/EZ3Ir1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GvkxIaA4"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GHZYtW385750
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 19:30:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SaFYE91okIj+RlCflYRRadYWaOtWBl4IVntenGlu4jI=; b=Y/EZ3Ir1QGXeXv0Z
	DR9sFLAcEpk+p1UmWegJE9o8c+VFNbKmfjVifLDWIwBnFBou80iILZFbdj3GjKJ4
	px2oRdjcGQKt0OoaUq+pMIM1jNcaMdJ+R+vT6L1cpKDjmc0Z3h1Ii56Sv/TRgFAO
	heC5sdanEubVPm4VjIt24zLhsiKCD1YupbJMOVhKQBx041tn8hDFMpqQOuqGamMw
	0bZ3thRxNDl4nIpzSXxR+GmDu0cMx1fyzmQMzqJCp+emfPEc7PZL4lADaRfYPVYw
	vbu2YaWj95nZyHgHhA7g1upnhoByBqgeXP/Zk2OOiQWsyn3USzOwGeqxrziKklyu
	SA+B1w==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff3u6gdwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 19:30:35 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cab041eced3so8102040a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 12:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784230235; x=1784835035; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SaFYE91okIj+RlCflYRRadYWaOtWBl4IVntenGlu4jI=;
        b=GvkxIaA4UkFUIDNVo1xYfNcpK4GOwQvY3nwIj/gS8rIL5d3JAqTytTGXXLnwCCyhVo
         adwh8sDhnzBOp4oGTTasL76tYr2dLPevlaUgY5W1Mbwnk8Onf4kEdc6+asfaBslaq58i
         p7QKp4OVSVtSoRAUUQK6nR2NU/CW19qyXv99qU7YScuDuJc5WQ7qXWo6DRKVFkzkFE7g
         3G3WFEoaxWusWOaeLmxfJ57cKUQY2J67I9v2Xbw2rMBNlS8lzUZsfAwcSPccSo0Z8Dai
         D/oRt+ovWYgRJS+hvh62xuN5r8M9eBmCxKojjZ2Xk1r0lvKpv0dOY4SVSG0xunNjqXko
         pPcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784230235; x=1784835035;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SaFYE91okIj+RlCflYRRadYWaOtWBl4IVntenGlu4jI=;
        b=rSRwztRqrcsqxyeC6EdqZEOxn6Osn2soH9fXbqKqvJBbfVl1/Itnt3+aBWvMk7qwss
         ODqpx2tGt1m38+ubtFlt4VBkQXfrRF05ZFEmZ+uFfGUoZWrIPy/wydMlOUyGRCPkgVcy
         DbiVAixCfbdmdc8MOSdpMl081bmHwHWvkALswEM+/JXfAC5GTXW8DAxCivHTiw3C06SO
         2qpayc+5pnki7Kcn9WLZSl/WzmM1YlVYg7xVsHMeieX/8eQ3JvMZIS63lBjIVkwa9EJE
         KgG7nUhXNq16C4m89WJDPrRV/1ASFvrsd9Qmptyke/G/ENYkYVeE2u+6ZPidjQqyEQNs
         GZvA==
X-Forwarded-Encrypted: i=1; AHgh+RomwZ2eCp/fQlN1uf1xbnVDi8kujuArrMRdrKmZkYtmtsldmdKOHwnDTxP5QT5WGXV59phijF5kS/T5TOzV@vger.kernel.org
X-Gm-Message-State: AOJu0YxNu+geTxVISL6M52taGNh/2J1uszW91OtAgOBD1vHqUYZA0kCp
	/jmWF7HpG11nhyC8orRS6CaKh6LncfdQTeoWUmUciIJhCn1OTEM+nUCPPd5zJcz3rDZLpej38It
	CgqJDtbvsfQBlJea4kBIiz3TNx+CIkH92Usc+TNdJCGt4FG90vbSopfohU9DLIWxaAeXA
X-Gm-Gg: AfdE7clu1OObT4iYdaQ+FDvSE1Eu2DSyXU3Yj3AdG7inou8CJFCAQjgbUrV89s4+WFi
	K9EAz4dt2yP6HrMoiBdpnTotKnYRx2wc5m913Q/3NL+AaK+9/kxlIl/2nykqMZl5aFzCFTnwvkw
	xa1qCZLA8L8w3RDxLaCQdM+HGp+si6naxR7qNyVLAA+tqd8D44n0kd0V8DYR6xrj0/s05hXzF1g
	wdY6VrwRRoPDrmSUDFA2LUM/yYBIs9G+oBbWvK83hfLIKG9QKC48tQrpO+1moC7JOVxiIzaOaKn
	x6VRGogwIEcU+xeACXBm3TLlB8stn1dpo9cM4DPIRO05YSvxvgvr/hsSc/pwohBdtBigtjbFV6s
	9/APxLh0iMmlWEHPQzT69nGurnA==
X-Received: by 2002:a05:6a20:6a20:b0:3b4:61f:1fec with SMTP id adf61e73a8af0-3c35731bc86mr13658025637.2.1784230234778;
        Thu, 16 Jul 2026 12:30:34 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a20:b0:3b4:61f:1fec with SMTP id adf61e73a8af0-3c35731bc86mr13657992637.2.1784230234345;
        Thu, 16 Jul 2026 12:30:34 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6c2b17sm21468394eec.25.2026.07.16.12.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 12:30:34 -0700 (PDT)
From: mohit.dsor@oss.qualcomm.com
Date: Fri, 17 Jul 2026 01:00:14 +0530
Subject: [PATCH v2 2/2] arm64: defconfig: Enable LT9611C bridge driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-shikra-work-v2-2-86ae8552259e@oss.qualcomm.com>
References: <20260717-shikra-work-v2-0-86ae8552259e@oss.qualcomm.com>
In-Reply-To: <20260717-shikra-work-v2-0-86ae8552259e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Mohit Dsor <mdsor@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE5OSBTYWx0ZWRfX6LatyJwkTRh6
 ZOidOlLKTvDxnDC0gF/D4azGpLfiytDGbfpf2bNTIe3ESZBnN9KF4ekuh6wv4mlgMyTp/g7VYGL
 K8cxtR9EIyPpjrqmBoRT81iY6nTcQ2wTWB3yp951GK2gV8PZswOEaR1x4c9sj4neeeQDVG3LNkt
 syYkNG2eIKTg/Ij5rt1V7LW6zWq2No76nOJXSVFGDqPrmUNWcqKOF28rxCzkIRY6OG3pETgMlr+
 +Nki+ODWqJupIG1iRLGbUfFaFxGc8FMltmHABdP8uHkac6m5Kpjb87nvcDk5WTvAAMdsnnSUaRI
 64QV1z0i3hGZGnIuYvw4/yhj5uG1bZNqLmnG5z1xHzJJm5EDNi73xC+5zJBkv4GaRBMlTnUNWCu
 zFbh3zyN0gvCjfYTe6BzV3NQHm4zQCRjr1UozEfKaWbqtoH5Bfvm1yIwEfzkXc7vkTa1/sTTh52
 DKf5x7XX5iwjZnub2og==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE5OSBTYWx0ZWRfXxMD1TVwXMJkd
 TvfLWWXmhghqz/MuGYVYt/67xc6XO/qDfeFIAStdpCqtZ5c52efSOPAhqpiw/OLiWbc1cqcBzFE
 AvUgaG6ZIULme6y9OnWrd401hg51ao4=
X-Authority-Analysis: v=2.4 cv=DYMnbPtW c=1 sm=1 tr=0 ts=6a59315b cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=JLjO1t5ekhtB3RsVtqAA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: vfvSGo9CMFlqiRrbK9UC0d8I4fXOBzCR
X-Proofpoint-ORIG-GUID: vfvSGo9CMFlqiRrbK9UC0d8I4fXOBzCR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_06,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160199

From: Mohit Dsor <mdsor@oss.qualcomm.com>

Enable the Lontium LT9611C DSI-to-HDMI bridge driver as a module.
This driver supports the LT9611UXD chip used on the Shikra IQS EVK
board to provide HDMI output via the MDSS DSI interface.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index e1d8e65782d0..8a6922199545 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -965,6 +965,7 @@ CONFIG_DRM_I2C_NXP_TDA998X=m
 CONFIG_DRM_ITE_IT6263=m
 CONFIG_DRM_LONTIUM_LT8912B=m
 CONFIG_DRM_LONTIUM_LT9611=m
+CONFIG_DRM_LONTIUM_LT9611C=m
 CONFIG_DRM_LONTIUM_LT9611UXC=m
 CONFIG_DRM_LONTIUM_LT8713SX=m
 CONFIG_DRM_ITE_IT66121=m

-- 
2.34.1

