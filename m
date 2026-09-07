Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F657470450
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 10:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788778299; cv=none; b=BknROze3W1avBVBicBYnK/KJT+CeGASklg7kvOHjUFbsSbZoAF3e60fLSrJnPzUdLKb2oVyupqxR3QBmwjx8+8/NYvs9TZNU/f4p9qJFy9iKowbJDMOykTU/H5eKIDNWMe6yVgOY+Sgctb77sySvQLyGzrOaH5bVjExrsY2B1iM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788778299; c=relaxed/simple;
	bh=95bc2dL3j7zvq8sUrPF+9bW5u8zLw6OG/1joY1aHH+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FNy+4p6jOGvXnXw2sQHDtPyyXBTrpkrPeT3gIzQo+XKlHk/Tl7E9tmCVG7j1o8Dw3lP4uoq3tJt4t/6bUSTatXofDDrSEBjqCIPuqjIkwyVlAzTZFvN3ZMhgJb0ZtN8KydjTJpRXVVI9+2sSymrZelyxROCyFBZMKxD/64f87us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mnv4DWm7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g4PhuG9z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mnv4DWm7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g4PhuG9z"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnRWJ3777752
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 10:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	25t8LZQEskZfrz00VfAiIDyejLTp3B4Ek3J9ELiuiog=; b=mnv4DWm7lUIjYC0m
	1NpUGTYcRsRUhjgsEFdcrG60wh6k7akZ3QUT8+2Xvdb/VspS2uaPdXeWQ760SaAa
	KJW8QkR3JI7OnNu2LNaW49ydQHuNnm8h+g6rlkQjXlsyCeHre4gSIGeAPa+B5vVM
	SIbejZRUQjORITbNFGCE5Wcu2b3MLpYQ2V/Je9lFtOITNZdnlBXzLvnz0u+w22HI
	o6/rHA2xVPQ5Zk6sstDb8ZQ7JdclrduyJdnyr9gWAKgfHh5PHBr0JzBEMiAnIdRV
	EGv0XksXXUIN2I4Cu3ZBXPLmqWugV1zhORV3hc5qmZ0d8Uy6LbKfSaDsuQ1YuvNH
	7c3Vww==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghsfygq53-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 10:51:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939062ecda9so421623885a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 03:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788778290; x=1789383090; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=25t8LZQEskZfrz00VfAiIDyejLTp3B4Ek3J9ELiuiog=;
        b=g4PhuG9zqQYUVKYsnYtY6qdL1nn457/SJwNd/qFjNJghDwQxBorywWasQvcUXz/Nod
         wDiCRokNb48H32hm4rVU7j0EzxHhfLdmjy1Y3jTdOzFd1aEBOwcH7HXiHEsxo3qbpEjZ
         ghA13ylhhISJXHDIfErNqldBdlSehvOp4DYaADqyqJkLaIyeJjG6xWdeySETmzsz7Jbx
         Gd2wikG5D8hB0hPWjitH+SU3ApeJPyXszsLxXrMT56NDA8PoUAIzJAg77tlPslR4EgNo
         xm4RTYAqh9GRLR3m0r/plFnwQCAuq8Pod0lzS5PaDyk28XSDJyvf7d24ZLr+MxhP7GY5
         UCEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788778290; x=1789383090;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=25t8LZQEskZfrz00VfAiIDyejLTp3B4Ek3J9ELiuiog=;
        b=bgelz5+uT85KN42+4Mq72O5wVLLYXJbotHSiXPiUtYYRMPUpXNpGOUBUxbBBO3xPWR
         6xTXu/4qHyvJlHOqb4cNAur0J2yNbrzdQor7Na9rNXgmGulWmjLBWQxXwCt0IJ9dFyaw
         DtfOBRd/mgYNOD/0wMDKOszCmzKC0jPL44tiJHmv4VSmLGb7oND8XgLycTdKELTDHVlg
         z6gPOaLLo9uOavpmmXKbo6Gl9JSHZJcvffdVOw5fStOvvad1zPlk5qo8MxXJvA9ne3Z8
         oORxK3IWXfyOVv07YGTEqcCTFYaWjVLX19nenArKvZZh3s01BQIDHPIBb9a0z/JpCQXm
         y1QQ==
X-Forwarded-Encrypted: i=1; AKwUvBwlSK5eN8BBwoCbYCgVGWjquQmlqegPAdVWWJtxovlzgyD2adyPeD56+K+QMpJv/c5o8V02UT+rm+RWFuJo@vger.kernel.org
X-Gm-Message-State: AFuF++nxTBtB67/mAGMG77zr8d+LMz3dPshkhaxD/Eo0b/jig9dXzAln
	Q3+UozNMaRKsqwU/Bq7XECqipAvfr2axX7Bt/eADJLyq6HvC3BOOBmHus7m3HuanA+ya5rEy2xt
	9hLDOz5cng8qfbgdUQdTGC70akNvCmwNB6dVzbWImIuKhyUZ87bPbcE6lSlcLhnAquf1w
X-Gm-Gg: AYBFou2ajgn2r8OClyPG5JR7QnSqxDjOYoCxwFVYxWsm91fymM//TygOJTsPEvy84Wb
	BgYt5lX/pWrJl0b1ABlGOgLLJ/I3hAVOk3F1N+vGC5WpUCUSJNAi8quo6UZmm9/159iP2DL6PNn
	LiCX0rkIPeS2LGdl8xjgos0krlp+h95h0GtSITQM0MHs9IDsP/m05qymjxkrxOOMsPSpl0x4rQ0
	DHt64RCNlrw8klPtR+gPTK0FA/+ZUSxURFwAFdFjbv1HGzBb4bJvHgJv5NioDKYD+bgTXvmMF1B
	/6I0YiTy1Acr9OK+lOrS1z7zAumXBVbXHVo3WScHnaJ+hvI8vJ8TuXTHAv8rHuT8+Weadk+YyrP
	G8MctrIrrPTzvchwLjoIjp2Rh2RrHF70HokI7toR/A7jBWpWU3+VAl/fOgcwU/DNeybky6L9FG0
	BDRwVYtpUmY3Sc9/28RXm5z51gQf8O5LRxH67LELKg5X8+jrS6J9M=
X-Received: by 2002:a05:620a:2ad2:b0:938:39e7:725 with SMTP id af79cd13be357-9398044de6bmr2002577485a.32.1788778290119;
        Mon, 07 Sep 2026 03:51:30 -0700 (PDT)
X-Received: by 2002:a05:620a:2ad2:b0:938:39e7:725 with SMTP id af79cd13be357-9398044de6bmr2002574085a.32.1788778289725;
        Mon, 07 Sep 2026 03:51:29 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:e90a:787f:72ea:b218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7703cefsm410263775e9.5.2026.09.07.03.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:51:29 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 12:51:18 +0200
Subject: [PATCH v6 8/8] arm64: defconfig: Enable CAMSS OPE driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-camss-isp-ope-v6-8-6b915b9c5131@oss.qualcomm.com>
References: <20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com>
In-Reply-To: <20260907-camss-isp-ope-v6-0-6b915b9c5131@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: vTRYqp9HJqFGW__gvwpn_3YAfleS3gvu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfX3AXhnLNQ6QE0
 +F83J1VdhqUQvn/GTtQs0/1PyVZyZ6g2qM56ZwnX3eDJU283FtEt2C+36wQXANPhmA99UineAxT
 H4V3bExmMUFRQShn0xWbViKo7fg4yJdDPysFuQeoj6WaUlPdAvbAptaW1VXYr3GdmjxT9750379
 IScR+luIN/t864HMdmCc4/R+yH+qJ5pQM07alPmsDTiDK+AFcBEUf52ql1UaJhmWneZSvKvAUDU
 fXLwokW48xc6H+6kbYYPqye9aPIC1tz1nWCOloLcwPDuriJP584Uy73Zhdedx0PKIi4PpuaHN59
 BnGMDHufYu1io4LrRvmFR/I9QxwIGuvxK6yqHh1RV3hkz6U/lrr7DAQammsdoJ7pchjZfG7opxg
 Vfgyxw0tkoSJ5tJ31ljQSVPVZh3abLIZUo4f/bzY1+GNnvttKMZtN74mJhUa4v9MQjy3sXhDjGh
 mEmyGANQ+ErCdsK6QJg==
X-Proofpoint-GUID: vTRYqp9HJqFGW__gvwpn_3YAfleS3gvu
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExOCBTYWx0ZWRfXw7QndcgklLuz
 28mQR8ikGB96v0nDujlxineUeDcnSKc0WosI8tJvXnDABgefU13wdj91DgRBsmeo/0jl+zT440z
 ea9TBBr+QJdYtF1nxUnFTN8IMlvf1ck=
X-Authority-Analysis: v=2.4 cv=AduB2XXG c=1 sm=1 tr=0 ts=6a9e9732 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=BUwzsxYIp--Ly0ysDZIA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070118

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add CONFIG_VIDEO_QCOM_CAMSS_OPE=m to enable the Offline Processing Engine
driver for Agatti and Shikra platforms (e.g. Arduino UNO Q).

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98e0da38465010d11166bb0e058f4a..604a0d58521dd6a1df8718ea3fce28cc727a08a0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -931,6 +931,7 @@ CONFIG_VIDEO_IMX8_ISI=m
 CONFIG_VIDEO_IMX8_ISI_M2M=y
 CONFIG_VIDEO_IMX8_JPEG=m
 CONFIG_VIDEO_QCOM_CAMSS=m
+CONFIG_VIDEO_QCOM_CAMSS_OPE=m
 CONFIG_VIDEO_QCOM_IRIS=m
 CONFIG_VIDEO_QCOM_VENUS=m
 CONFIG_VIDEO_RCAR_CSI2=m

-- 
2.34.1

