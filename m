Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1219E4A0121
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789995558; cv=none; b=dXo5QQIKnQBrGVPEktbS86PGv6vsKxi6Ad/2ckFVKh6t672cTdLZ/GHFgT9+HTtA/ve1hqz++AWVY0YqCXReFxVSWTh0wDzYC1njIWV8r2AR4zWs9PPyhlWMHaeUsoV6jK2sFcS05bFHCi77ckJtcN+Zvfo99xo/yPR4gSLLMFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789995558; c=relaxed/simple;
	bh=QSpKCyM8sZRrkH8iCybVhH+lwRqWiSeaHHG1sXtFQNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gzNuyRw2yJEOswPtRA2huBwCJp3b7Vxa8F3jVeiqEoY2a+xYBhc+zTbkmQG/3hCnmlQ3Zy2kGZhGHOHS7x4PSHBJR5B5I4hTi5wpf6N+aBhC+71wm8EOERZ22OJlderdpN+6ESXKKA8bvvppd2148a3suwsK9maFAYfB2OXewvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bV7wF6vD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cKx26hCc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bV7wF6vD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cKx26hCc"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdxUE1413956
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:59:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nBjYFzsEvpA7J7qMIXXY1VKcNjLps3zJt5nU9OdLkCQ=; b=bV7wF6vDiIYe+4kD
	+pvPl0xQg5uJfQetk5ooKP0jfnO/ne4/B5IwPJXfiUltdTRIiN1Xn/aDvZOy5ORY
	v3LMK33fSckoRHq41Pmqc9j4C5XpuPZIIrIrfvtSX4ejImX8ffWk9alyXijDZYlj
	EZPKu0Bq23bDCB0nM6D5/jYh79+d13iO86WLzBEhgins72kvI4n/+6WDzwFVBQPG
	dTha22GmqaS0hqV/LMnswsN2J461I44CE5OQTqpLTfsNWekkGbOhzrcZPKjOFWpc
	yHgId5i1cHqshYz7bwZsqPt12XNedVRD64jR/e7r/UA27xLwaWf2xh4cGUqjZsFd
	EhXjog==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gu01d1adg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 12:59:15 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9806535f8ffso3211843241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 05:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789995555; x=1790600355; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nBjYFzsEvpA7J7qMIXXY1VKcNjLps3zJt5nU9OdLkCQ=;
        b=cKx26hCcgv2VTw6hWQWr6T/NfFnQeloM1cuIRT183D+NVLXARoB4gOp6Cjxz4bW+f7
         hnws36J0IQDbPsLn/Z/qDmF7gvykhOTixYy4QRPnqyZu+cwpth7A4wyU2Ll2Sm9B3azO
         PaPvP1XcXXtKNFBhfHrRj2k+hZnxEJzO46uEcRPXOw2Fsx4Q6/3tG1lqSeJWzPJnUWad
         4WtVMAtR0iaRXRkxpxwBAvvFDiHwrnF/Vr1Eb085L8uxJSJoqGC1l45SP5ylYdgsaSIz
         x1dshSP0JbNjFwzJ+CMUG7c9J9DQclesddEq+rI0/eKg/028Az9XiVamJdUBhmFqt/uc
         vSNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789995555; x=1790600355;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nBjYFzsEvpA7J7qMIXXY1VKcNjLps3zJt5nU9OdLkCQ=;
        b=fcfdmi6GVOvZ5hZ5gXKfx3BFOB3GdW4TQNGcGi9z6UOXZATr5dkzi0ZtDBapHmTknE
         FhfM3p6rpOBiHV/RU3W0VqaU5quZjps3fgo2BhBS9cUuEiB3oWzq9uqmCVahMs3KT7v+
         beAvWXm73nDXZnA5YNMbzqNaHtMhJxI7x3ZMAnSkiy83581L80wap/mmOgZ7791J31uE
         RQdTl9uEM59Yr3e/jbeAP+z1Vjj5U0S+GKlQ5NHVsj1k9/bHSb82MhABCdro9WSdbn6o
         GWIJoRrxHFe0gbgK5/De+2+F9o0vxgWubAX4svsh3S1WXpr2iiEqdWab7yuTcULinxYU
         zf9w==
X-Forwarded-Encrypted: i=1; AKwUvBz3fM0LZ3etXQcfmJ+2N4jOzvENE9JgRbEWeA9fkhOOigqHocKww3yyFSo3HIrZBLnmuNiQK5BvS4lVat3l@vger.kernel.org
X-Gm-Message-State: AFuF++k4+cg+is6vy2QpFMnQWUl8NZCJZJeR3aJJ9YeTDblrRZPhU3PI
	uwlDPI330kJ9oBF2OTK4nveGURyarRR9kbxippb9OPKyFj421uvR4n5T6PjBMTaribrOcXDWrV0
	PeeE+I5m/4mjAWt/L96RTGxRdWcOcSqyaPjeuNAUnyG5BhSZvBdIWYPcaFHzU7tN6DlAy
X-Gm-Gg: AYBFou0iba9tK57cHcOnITFLJNu2CVhhPBHGAPY7OIyY5akubUmeTt01ZBudzSAPiDx
	4ZiQuHSRKjhorf2s1Y6Hb3YARoCJkmchLkEoiTLkO7EwMuyIndXRWugLkBe5EulWsvlEbCwL6s8
	QeN24pmriQeyue0U0CkkClgno/Bf2bAGzELMSVOaKEN9R75SeBtJPxGicoBZTzrUZfZVjmqiyyY
	T5Yypj0fGuSAqK7LiysU5ZUZqeCuZr/5VpRzlTBDnzDJPqaxwved/wJ2Szkoo2jiXGL4LIqjNfq
	3tEc47otFEuQ5J+RiGi46CShBQCMde/7GRNqHWmyPi6h72xL4klOZ5rn6HA0T+55YsvIydLFG6v
	nnxWyUFllc8TYNHAQiUBRvfKLGBI=
X-Received: by 2002:a67:e9d6:0:b0:7a9:e680:efd5 with SMTP id ada2fe7eead31-7a9e68119b3mr420319137.28.1789995555155;
        Mon, 21 Sep 2026 05:59:15 -0700 (PDT)
X-Received: by 2002:a67:e9d6:0:b0:7a9:e680:efd5 with SMTP id ada2fe7eead31-7a9e68119b3mr420303137.28.1789995554810;
        Mon, 21 Sep 2026 05:59:14 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a359037aasm320278766b.63.2026.09.21.05.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:59:14 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 14:58:23 +0200
Subject: [PATCH v8 14/14] arm: multi_v7_defconfig: enable the Qualcomm
 Crypto Engine core driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260921-qce-fix-self-tests-v8-14-107537869a72@oss.qualcomm.com>
References: <20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com>
In-Reply-To: <20260921-qce-fix-self-tests-v8-0-107537869a72@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1209;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=QSpKCyM8sZRrkH8iCybVhH+lwRqWiSeaHHG1sXtFQNM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqsSn1lcJ3rdfljJxEad/UDO/DxiFyNO4ZMK2Jv
 VLsS+uPsKCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCarEp9QAKCRAFnS7L/zaE
 w8Y2EACRLm5tVJGsdU7wHq7uz5JVixX78aLj3rfMQCXd4kW/b0p9kP3eDeDlGTJnQsUCtPXIXMA
 y2/EiDWvq600Fm/uQ/LI5K+1UpwXl/bt5f+fnx9vo4v2oArTemL0dibH5JnYhmThpdzSH19drVP
 qMB+8xybF0IONLKO+pJw9GgKmwsjjLZxCteYfICNGza7czGTRJgSVAG2UKLxNffTci6zBsFwffb
 mD1WQMzj36dQckB+pW18UJw+opwEPwHZcZpdn8sWBC5WjODrMXVqp0EU0QnpLStmDhUUC6EPNn2
 WhCYVxqWMXF2ExPaOhGhY6YOXn6dJ98GP1p1JArCDu5bNeSJkXkIKEKPD3OmVwp4ML1irMLN4K1
 PGT7WV66l/33kw0Ffle1SuQWAcbAx09pVH82isAfn01nLpmFxIgv7At9AZ5W0QLdmMQwOo9cVDk
 3Trf/zhcHuDH4FKTV4K/f+R5OWcj1yps4XFD/x9ChGkwCv0jGZSMZnP84abqWb+AWOg5uT3wy1S
 YPNst0ftsiuA5iQyA0uYerx2gojteeg3NK/aNXhHPkha6yfqgdwOo5kjPIkpXAfjaM3zfCcFk2C
 apa19Seh8cGC5LyXarhhZ6BHRXEFG5LqsSKB36qsRakdGows/AwFyD2FDnv0uwIgUtAv6nC+nOj
 BFnDgptCV6+I+mQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: D-eBwiZWT9t09C9OCRAIVmTrkZY-Ulxb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE4NyBTYWx0ZWRfX4Q5iGg5QpQzP
 Mml+aWYb9ReKqvCcnJjg/W+sl+WvqdGjtlATkeTFM8joXROCB+2lJg9l9XI6eKmd0cE4zVqDRoI
 6VEIK5Ov2CwTgDXc287oDRHQFzuqcpE=
X-Proofpoint-GUID: D-eBwiZWT9t09C9OCRAIVmTrkZY-Ulxb
X-Authority-Analysis: v=2.4 cv=Ht7jiETS c=1 sm=1 tr=0 ts=6ab12a23 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=QftN5WpXeUmWSfsFEiEA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE4NyBTYWx0ZWRfXyZCmIusiR9q2
 E2CKtRn2y/nxHOVh9Bcn0mGBgGaelMqT8SZaptW4qnk2B8qAB9AQzHT4Hl8qyzf6KH8tS4X11E1
 QGRMqqSMKE2EU69vH7ZvKp39hQqNtsGG89QcLnW+6N9Oklq9qkXV4TqOdKeBn7bD/yaeU5Jn7cz
 Fd92EYKuq7eoSCsEINIJyoQlFOLE7+fvBu0f/1EeRT/q8kUipiX+/av6eQ6Z+5ALjDirCIa4B7m
 Mp1mC29zyX2doyG0M5irQgrzaJ1MLnE+ozkOyWET2RhfQ2eurwnRYtGxZoyDCPZMeg/xIetlCu0
 OV3oKd+SdC9i+EO1HEgydI27xO4QFaUnsnY2j4BM+NTox1YGiyEcEkJSr4W4plc7Pliwg8DxXv6
 FdnBM2DsZBqKUW8fb3+ShfLCHuqK0IUE5tC3p42ERWQpVMHZvHrbeVZTfaPfY0XaJw92GjjHb9Y
 VvteMwHoHRWhLyOgGfg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210187

The QCE core driver should be enabled by default as it binds to the qce
device node and scales down the interconnects if no child auxiliary
driver is using the IP. Add it to the multi_v7_defconfig. Disable the
crypto part of the driver by default.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/configs/multi_v7_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 2d6292f8cab39596b540084fbd8b30f4c25cd4ff..7750b11f80312bf6a6f0fb276315f32f8714b4dd 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1150,6 +1150,7 @@ CONFIG_QCOM_SMD_RPM=y
 CONFIG_QCOM_SMP2P=y
 CONFIG_QCOM_SMSM=y
 CONFIG_QCOM_SOCINFO=m
+CONFIG_QCOM_CRYPTO_CORE=m
 CONFIG_QCOM_STATS=m
 CONFIG_QCOM_WCNSS_CTRL=m
 CONFIG_ROCKCHIP_IODOMAIN=y
@@ -1323,7 +1324,6 @@ CONFIG_CRYPTO_DEV_ATMEL_AES=m
 CONFIG_CRYPTO_DEV_ATMEL_TDES=m
 CONFIG_CRYPTO_DEV_ATMEL_SHA=m
 CONFIG_CRYPTO_DEV_MARVELL_CESA=m
-CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_ROCKCHIP=m
 CONFIG_CRYPTO_DEV_STM32_HASH=m
 CONFIG_CRYPTO_DEV_STM32_CRYP=m

-- 
2.47.3

