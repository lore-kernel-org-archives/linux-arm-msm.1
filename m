Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A469B3E44F8
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 22:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790720327; cv=none; b=Dh7PMGqcgRO/YMPGWEKVCG45CRORnQJU1adqUkYTJbeag098mIsFwwCmL21cVxeSL3EgSAuBrmcbgsPgQwPqSIlIqu5eyXK0+6vP1vAmuqvb2R40bNy82nvuTI6bdaXBBlSzfDTvK4NSTN7q7xlCLTr198H76cm4RT/STR+rfXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790720327; c=relaxed/simple;
	bh=RIbldL7RmoZJB+4oI+sOM02ju88vpR1QbLJnL5LcQDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lisbk109USnohgKVtrIvabNswAkoPEl7OybcDPKGGm7uyuXcGc5eStaKhEAVih/jwDOgISHs1y+1aZVHtseWZOIhKjhYRYARGbW7cacaeUbbF9DqZN849XZU2bkWQWqzlHkwRggfQGRlFOms06Vf9ZYh3vrrZCFsWsbTLAip/FM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PYwTTWS+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ERjcVYxn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PYwTTWS+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ERjcVYxn"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TKn66I708248
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 22:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=efWurbXWJr4
	abrZmzfxo7NYYbMEg/gvYeU9UOZfHRdE=; b=PYwTTWS+7isz+Q6g+ocPGDXm3Ft
	njmIKEc7WNqUhNiYt4yNCxyu4a2OFJWKv8R8kDAkU6K1HxEiEm4K1zRQvgSZu8of
	ETbPPUM3tYNHiE7+cq3QKmWkE2m1DtraX9J2Nmo8RhU29fuX1EvALTxVJxgOiZZR
	DMlLPqbYGNBmNCk/i0t+IQilmhDtTalruYgW0AlCWpU1/qNwW0qEc34yz7k/S8Mb
	Xyd/y2DN0CGd8Oj46td/JjRaLGVgK3QpVl3trArlLzwvS4eGuQZjwunv9Nij0/RP
	CTvvsB3BNLHqQ1IhmNcs/WTnd2VNFvwFb828uN7eF+FLAmtSI+zYD/UPfMg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0g1ksqdx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 22:18:44 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c58ee2116so820653085a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 15:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790720324; x=1791325124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=efWurbXWJr4abrZmzfxo7NYYbMEg/gvYeU9UOZfHRdE=;
        b=ERjcVYxnU0rzwH9tNZjxel2ZPwY2JB7V+AjCcc6NBW1ccIt1sT3mw6P98bvzOU7WDg
         9Ql1JDfJftzC/v5rkP24w9B5IfOzQ+eU6iI0prPA8CR49usnR+qRmZq/IjrgZNXOnV4d
         1LFMFab4Sizd50IAGeYPQbU+rkCI9IBQZunxioENtAt0FwkuOdy4saT4IS1B0oy5hccG
         gEHxkHDvQaJml4NFgL5zaIs8NKDA6l4FmGxou/fi8G6PcueR96UJgR93eKcHveerdaIv
         Xm0xfaSi3KsXzLawizLcJ7qVsN+B1idv0sC0DhX14rA9nQ0oYYS0ZuPcILowu1x9p6/h
         z11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790720324; x=1791325124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=efWurbXWJr4abrZmzfxo7NYYbMEg/gvYeU9UOZfHRdE=;
        b=0WAhTwljtbta1qNAsBz0rcHEt0xy9qSCZAq4ceLWD+TuQ2VpI62FBJRWg7hE7htzjl
         Komr8QgFgDUp/c98TMhmMCaQYLXlDHMcE0nkZQRuGvJmYhzLsYlBNi76cQ9v48UpAv1S
         bWwdpucOuQ/J6sssrVJun4ydlu57IhIEgQLwW9jR4tdMQZ+S2p4Tdoqib/eGO/1LNRid
         Gpu4+AN/3C4BAM7NjDbsWWBxcH90lOnoPadwTtY8KnwzO5u3cNt1tJhtGh3t/K2W/mIY
         Y2Gz06NdK6rCxW+LA2Kz9UdN52JCI3r5LMTZF+hFtHn7cxTr3H5hrgJWihdslOBIsUbC
         Vwjw==
X-Forwarded-Encrypted: i=1; AKwUvBzUQ4gWhKioxAHZ60/E1W6BxO8EtB0PVPxB3S7K4vKCyGsbtWJc6w0u/lt572ebzre9TgRbf7ZqQrEJl9TM@vger.kernel.org
X-Gm-Message-State: AFuF++nH/fY5E4yMn+WqWpZJwFYIQitQqNf+8UdJ7zIMfMMGE4//Qk5U
	ldFOPOq5hb1TtFdQVrGAMKAAQyDn5HThJgUvnIlFK4eOoiz9t43PpET2MexifKE+GjQGg3mEhis
	/GjSG/ZUXQw602+hH4RO1psAW9KAH7MmkDeuBWxf5pTi2T2OenV2kOfhr/mhKtNMmGuAW
X-Gm-Gg: AYBFou18zievtpDPLnD0y6x3D/dKXSsO3uf2s1wcmv3GPRH2z5GUYYfIe1meI71pkLF
	ti4EhL6bIyAYig4AvEvZdMDjWqwOhtuywspAVSme1Njv85fPPGBL6RyS/hhiUq61HYAL3kPbYsB
	ASIuO/QY5YNZo+efqsXO7XPnH6vRSZXqVa9xYqPH8KI44i8P4A+RxuNKshOIRAsrTWBP7VyZpvf
	+YIFK8PJeMDKBEAD2QAqJX/EjcEhjILVDE0QLuUwmMLqP9R6Qa4Q0/rpdhvI66vO4NBZmkLXJZF
	Fhe3EnwWo59i6edM7YwJ4unz9+xfawOfu/lCWxrBT8WmXXApdHx9MjFAj9xEDF5cc6ugVc+Umtx
	GMIG4ncFPQ8BR
X-Received: by 2002:a05:620a:4484:b0:93c:a468:2db1 with SMTP id af79cd13be357-93ca46833e0mr6334885a.58.1790720323929;
        Tue, 29 Sep 2026 15:18:43 -0700 (PDT)
X-Received: by 2002:a05:620a:4484:b0:93c:a468:2db1 with SMTP id af79cd13be357-93ca46833e0mr6330185a.58.1790720323446;
        Tue, 29 Sep 2026 15:18:43 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a014f77b7csm16981525e9.8.2026.09.29.15.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 15:18:42 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 3/3] firmware: qcom: scm: Allow QSEECOM on ThinkPad T14s Gen 7
Date: Tue, 29 Sep 2026 23:18:21 +0100
Message-ID: <20260929221821.505551-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260929221821.505551-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260929221821.505551-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: O7UmBJT4xUtLYMkMkgdfMK1E3dig8K29
X-Proofpoint-ORIG-GUID: O7UmBJT4xUtLYMkMkgdfMK1E3dig8K29
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4OCBTYWx0ZWRfX2PxXklLcaGah
 SJSNuKGSWSkxjhANN8b7SHgibf5E1I2UMx1lB3lqTJpynHUqi1e92qkN9+3QyYhen02687AQMBb
 7JS5jUYAlUPPJ3bwBviqlL3WJa4c4yw=
X-Authority-Analysis: v=2.4 cv=Ysia1IYX c=1 sm=1 tr=0 ts=6abc3944 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=qIna1hWlAHbsUj6keHIA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4OCBTYWx0ZWRfX0o04l/lCNDis
 r82LRdVbKYt7jG7dvpb3xjGnttyPUiJZLa31e3YWex2QtPssWUat3RLfqDDhc9OQKUiJ8kcSvwR
 6KMWxlaWkmbKS71zdu4WbTR6Q+YsFUQfpCF08m+j0VQAl8fmbU4PU77DT6NDzvHSFuUKRjV572d
 P6LO/4ymRGAFLYRiiPs/1Z3YNzCjYw3MemkDZTOG3mMUumDkgo8wvZ0C5huWw/9S7cfPmrcq3Vj
 24TENKsCVc19n43CGt8pQO0FXZdaufXAoLRKIl/wkRDeORsuC3VYwgoQUyo7DHyQhpGBKHgj453
 gslbNyho/2dITF2bwkNIiJU9G3Zxt0sobWGNUuSntlnh6aUPH1Uv0et4Zks51zjdztlvagwVEqi
 NswSN8lXuXEDi/dHoQMKxzZulCyuZq741WJUfHB/B1lvnY/eS0c1fHnRSaFkYY4IF5FCnErS5Dh
 FeCkeRYMjHkiMw0LQjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290088

Allow the use of QSEECOM on the Mahua-based Lenovo ThinkPad T14s Gen 7,
matching the pattern established for the Yoga Slim 7x Gen 11.

Assisted-by: Claude:claude-opus-4-7
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index 899573674c2e..43e250faea75 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2244,6 +2244,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "lenovo,ideacentre-mini-01q8x10" },
 	{ .compatible = "lenovo,thinkbook-16" },
 	{ .compatible = "lenovo,thinkpad-t14s" },
+	{ .compatible = "lenovo,thinkpad-t14s-gen7" },
 	{ .compatible = "lenovo,thinkpad-x13s", },
 	{ .compatible = "lenovo,yoga-slim7x" },
 	{ .compatible = "lenovo,yoga-slim7x-gen11" },
-- 
2.53.0

