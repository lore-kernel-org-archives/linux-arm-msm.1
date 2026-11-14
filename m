Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794663229;
	b=z85RZj2ilkqs89BxN+TaQ7LvT2OnLiP4f67tKNAOL1uNMefYIdQab4ttB5L6hRMclHfC
	 9OZXYLf9HcClWYlh3x7eQdMQcJfxydXXExKqyWrJ6bYi+rUDfREfv5Xk0nxphoV3tfwtD
	 L4/L+hPmK/wfLaHtGvEk66MC6BLjAMuwv9jctfpkD7a6RAgRTti20SDS7jQL+9MSQRv/4
	 MpZspBKlEUv9K4ByxFVP89FtZAWUrEY68furUacrwAiv2LW8XtE5iLtXejBwOMqaccJla
	 PH5trhyV7Jorh/SzPSnNfMl2ytjMEJK7FSq2FQHy56eIVDObMwBb6rA2oNUWDX7hrvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794663229;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7rjRjbUCbBEYBTu1h8HP42axTTj090IQJUErwaGJ3I0=;
	b=qeNzrILsVLYHe/iaYx1DPmvZDbaR6JRxYJ0CHwBmT7qEQ1s1wDLUiLMvvbLGmARmr7du
	 5Pkq7/tlMpWRquNoeYQjAtn8HOGleyaDXSxP5zlDir1NzHXOGabEt1+emKWk6AC+ifNFJ
	 6/jYQ7NGPM6ulyjsu32Xvu8TFvTsBD3b7kXl8gL3gEBEpm+W3ID+BvfinmVELccmc9Xj7
	 mhW/1t3FhwNDzOaRthVgL7RZQtSFiyPhTewaDyJ3FBYwoFuAODVVxci5Rjksx8YHVdWyn
	 oLVo985Yh8n/M5ZbJZtupI/gffBTEVINoADiOriwNCjE/lwRW9FPazJRhy2OpCdKIKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G0jg0wOs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RzT8w3yB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0F560A2603
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 13:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B0F560A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G0jg0wOs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RzT8w3yB
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wVia3717025
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 13:33:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=7rjRjbUCbBE
	YBTu1h8HP42axTTj090IQJUErwaGJ3I0=; b=G0jg0wOsQwALK0I6fuaxrUZqtF0
	kFrTDzQoEGgsxyJb5bqP4NFVV5luZKBpQLKuHtBqTAIqipRn4/yCloo3dQWhV6+q
	okeBZ5mzCKd00pIh758obnvtrIwQcGvf05sYR4vHafts3yHceY7bth5/NxEQWfd6
	PHc3eCdhIN9F2DAH61VcRihlWo93PPrx1yW0TN/6pJFnVOcp21T5q6GmkTDtL2dE
	pohaw+CzMhi2biEd+Wy5Fu6gNirvJQkvDhP/scrBsC4XpqJneLyX6kv4ZGOCta50
	V9g1jX0Fs1GrUq9wz+UwFgsisi4xILG0rzJ3pCkKeChQnstIhD+D55rKL2w==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhk20ua1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 13:33:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ed08b07232so15517795ad.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 05:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794663226; x=1795268026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7rjRjbUCbBEYBTu1h8HP42axTTj090IQJUErwaGJ3I0=;
        b=RzT8w3yBbOZ/egjlC6qaR5ZopfFjy1o9ujp/4l/NL3qU+oAQ6LtJKJJN2nGX+JWBTc
         7SyBbVGRbWYXeBqYeQXYL5vNaZvjyr6E4m9iABaqj7Nvld3WVnDjICXJwn0YVzpxlcd2
         i+ykLgrxLu4n9T39+lh3LE4xuNdYgUg/yQiYt5BcgMHqLcxMAdO91xKW5rr3pjJpDDW3
         WXM+A0+Ou6ngD4WmYmpB0h1BvUDZ9zeEjtO3790dioZR9Lgf66hMMe/pFVy6dy5wislq
         C59yDGxxnSmBi05Edx56xWJrfsO+EyD+eyaeobkj+MO4ryJYfaUpfham/WcwN868sOwu
         NFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794663226; x=1795268026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7rjRjbUCbBEYBTu1h8HP42axTTj090IQJUErwaGJ3I0=;
        b=byMtANlAEMiIVhEwPR0aZcK5t7lEaaeSoCmuTmtVA4slTd9bhuNFb7KAcdlXQ6RV1O
         /v6uPlfeM7sQTb6Tj4nfxzq86p+qtgKVgcWeNG78+j1KHjTjL2Aw+ta76bh7qlQ5LSe4
         Jx8bUmZMd7l5/j1gDhmMSUEomIvprwGmm+4FZN2h2RPOxyvUMmhgt8OgeQGCaNI9cjTV
         38qlIoUtaHqJbNthq5UC466dbvgYZDX5ZbrDWopeyi4FStyb4y1rrkoZJQ2gTqMFED9q
         6rCt6kz//3e1p0t7TuF7aiZ3+lUDnA5IUesH9DkwtMLlH0Sk42hAJ6jAgOaVXvkUnwfw
         V1HA==
X-Forwarded-Encrypted: i=1; AL+hErH1zm+VyzGzXSFp+Q5ngByTVJVbLQfOVnW6qaRvXBLEAOohz8NwNPwee3HEy7WWXT58hyhTTmKfhl10MC50@vger.kernel.org
X-Gm-Message-State: APuU4Z9WmNo9tR9qD6Tam5Xmwv1geolfEpRwRnjRSNaPgJxk4ewD/HfC
	C6R0AzVVFHqkopTxxHBkEjq2GKYZCIKm9MZL0aBJThy3fPB3hHmEsKBR6xtgBNWlrWewTM0fXQr
	fiJu1JRcEEfb2+erq836wyxc8sJegx65bbQlbdRL9CVWxljggeXkM3O5Y8Hz+2/lpz2EVKvWQ7F
	5Jifs=
X-Gm-Gg: AYBFou23UrxPQQj/y2IoScOo5iKJRAtlzv3D+sJN+Qodkv0jdoaZkskbuB4tPCaF4fr
	4l/roXurGdRl4VR2WmKwoFWGxwD+eURzjocEdT9Be7Dn1voOaKXfGCWjPFk3JFakZA8GxgytIcO
	JsKnGWUGigoc7rC6Pey9j6lnJ0AxdupcoZIZscTxF8E6hD4LWBPBiKcvV2BVmGulbu9OfOUqvSM
	fgi1gG4oGpEsQKyo7VsFphmKgvaDoPVUOSuanBDmpsYsjIMRdIs9m/XqOKJXN8eCsVUcprw52b6
	+2SsmBu5WIR/GNhUYmbWMUSewy3ehUbsGChqJH7JBEC/OGiIg51U3NfHJL6t12dqmYbOzoUIVaU
	2K1Q70PcXBwzsm0X1mHUNp1LH5baqPnXqGEDOge8Q0h8xLS5uwH9bbG10gvrymAuw3+m5Wz0jql
	TTXx0DRyHa1anYL/4x6bxk7Wp4cMoRxIH29kHC
X-Received: by 2002:a17:902:e84a:b0:2e9:5ed2:c3a3 with SMTP id d9443c01a7336-2ee0dc04d6cmr52558175ad.37.1794663226597;
        Sat, 14 Nov 2026 05:33:46 -0800 (PST)
X-Received: by 2002:a17:902:e84a:b0:2e9:5ed2:c3a3 with SMTP id d9443c01a7336-2ee0dc04d6cmr52557975ad.37.1794663226156;
        Sat, 14 Nov 2026 05:33:46 -0800 (PST)
Received: from ap-kernel-sh04-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8eb275sm20266965ad.64.2026.11.14.05.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 05:33:45 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 4/4] soc: qcom: socinfo: Add SoC ID for IQ10800MD
Date: Sat, 14 Nov 2026 21:33:04 +0800
Message-ID: <20261114133304.989635-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261114133304.989635-1-shengchao.guo@oss.qualcomm.com>
References: <20261114133304.989635-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: Ynb4gAYApqaIjge9s19ZpCb9k6ID4CdO
X-Authority-Analysis: v=2.4 cv=QanzLcbv c=1 sm=1 tr=0 ts=6af8633b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=0mEx7QAgp8bgaAyPUFEA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA1MyBTYWx0ZWRfXxpWo2y8MwifB
 G/EcJAdP+c+Z7o+IQL5+NZCrpK+/UWVPfDKHKDHkPIRxy76PN8Rpq3Y+uJ54DGyxJeI/cYYMqEm
 GjP0X4IqRMu5Z180LSjbPhGtrafcrPU4PQ2SJ2GWoJay7TgVwMf+xHc1qQUmcwkMiuMoHvgl6ec
 Kt/F4FpeeS+sPVL80qIujDBJqAMrF6xA9Lp+tusPpHEY9qkkmIdVi1U5grelDa8zgdbf9vs/P56
 IVTxmwTTT9I5LzT2JgQCHqDgQn+wemzoJGgkM0Mod3qnmdNUipLQkPV6N7HMSgiRvAcDhlTqhmU
 MrlEgctGL6zJXXnE5SMnurKOJHl0CMXF88QR8fAU+D3ATBFChGo/7syWuUFvJ5M6Cjchlu+SuTm
 +jmXQ3fULgh9X6FqXH66DJNd3J7Wo7i4qultfWmtq/RdrLjBe80knfh9grhcjN1r89AEqkeNmT7
 hc/xLtzDVJTmHmEO3tA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA1MyBTYWx0ZWRfX9Q4SC3bCIces
 kMkVzaSRx2EWGzeegaasbTXbQh0lyElpv/s3x1DuhrkWbxmPL4CPl6IDX1pA7RI2u3L8IL2dgdj
 PT7vzYnjvW2i5v/jKCy6tmsSRB9GvvA=
X-Proofpoint-GUID: Ynb4gAYApqaIjge9s19ZpCb9k6ID4CdO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140053

Add SoC ID for Qualcomm IQ10800MD, the robotics SKU of the Nord SoC.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index ecb4369fd309..950b5c226f04 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -561,6 +561,7 @@ static const struct soc_id soc_id[] = {
 	{ qcom_board_id(IPQ9630) },
 	{ qcom_board_id(IPQ9640) },
 	{ qcom_board_id(IPQ9670) },
+	{ qcom_board_id(IQ10800MD) },
 	{ qcom_board_id(QCF3211) },
 	{ qcom_board_id(IPQ5211) },
 };
-- 
2.43.0

