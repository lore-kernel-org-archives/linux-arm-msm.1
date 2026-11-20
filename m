Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795203320;
	b=sJq3PvItasaG1VwKg9yhyLg+geHkERxVC/JGffHcz/joPEUOJ3ESufFMOgrp0Zn2N0YM
	 dO80cGs2mxxahfsu5LffrCAQuQjV/PlqFlZgxHIhXsf43dzbhIDa2YD9QvnGFd9WDKG7G
	 7RU22Q4Q6bIO4X8WwIA45cKosXLUdB01mJ06uLE4hihxN4DTpyDQj9FYrH4x/kbfPbxvv
	 3f/EG+b4KoCdd4CUHzenDc/8WLZE8+b25+U+D2vRSh4mSmTyIV6z5vlEDlxEPl6y3nUA1
	 c2FKGFN/DLDPMs4MqR3XoE9mTv3KWWYvXfvnQ0FNas3bqg0QXKRDqc7sGOmRHuWhOtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795203320;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=41CfvWilGEXnA95p4GfArJCQxJtfnNTP1owROe/U+kg=;
	b=qlQ2HL430CEyIIqq4p8SzGSGcGpvtNv6vk2a+6aLL9/WbBhG9IZGx+jyVliCmHxWBcnu
	 An9scclHU+OWF+l2i8uvJaPhiAJWoyWO0sKzZM0xDyiiX85vCDLlW3IYBSinFv3f6Hpvc
	 1xrpPjAeZDZja96DCZblcUqwjt7dlKzMEMEIUtA+yWxLn91PtGcwYldetJKcdtsoJ+Hdc
	 +4WZ0dc0aKf4BIXXje5Y4Dm2coCm+E+ndb5iGBVHAuO8o3MWH7wVijwA05rxiJIkp72p5
	 Y0aY3LPo9TFjs/lVmU8DeqDHTSJzThnyC3+90tT6khxofEyCgVFy80lTbKM2S/kQQFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZGCQrKt4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JGiyszoh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9FC60A2605
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 19:35:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF9FC60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZGCQrKt4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JGiyszoh
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKIPbtP2070386
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 19:35:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	41CfvWilGEXnA95p4GfArJCQxJtfnNTP1owROe/U+kg=; b=ZGCQrKt4/uDsOq/M
	Vh5HlJGRDrVRvRCUjnew32SQ+6unuKLVLWVCbzNU2vQPxZL9Wm5rppBZcTYj4kAw
	pWEA55PcMtn4a/YXSD795fEqNHeA7an3iPnHOnMRKn6bkGrHZZ84HKRc8Ym2Pgyi
	wzgdka2FkqmXSFmUghHJTdnSxWFHiFO/AnOiQUUAg0gZYASxiqcrAyZS11hr5UgQ
	J4uOMEPopbBPeobs+5kJU36PC8r11QztOI7yoQqgOQ0DE2O4fbLLBTeADN5frTl+
	uLMJGN/JenDwGsuAqLqynsvJgXKNnmq6lZDBNkmsrrAHWT1lD2z7qcBtB0sciOST
	hIH2VA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2t7vgq0f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 19:35:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-949b0d322fbso191578485a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 11:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795203313; x=1795808113; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=41CfvWilGEXnA95p4GfArJCQxJtfnNTP1owROe/U+kg=;
        b=JGiyszohZM1xaaC4b1ExSiKsSsXAFefRwSSth91DSBCZQTSS1EnR2AUyLQNYgs+CbB
         CfaUO9baTSVA7nBn/CocWR+IxujukyoqkRGQ8e64yI52l1LSsFYrYwzFRGd7CU85llsX
         JGu1UfSj+NvxfJLiihIkszI8CzfopMKSJV/NVb4mOzfC4DUUrfjlY9kTDDkVUnUsLLG8
         XPDPYH8GW51I3Fi2FSelCH405KSVUSOQdc/eX89lN7/uwqjtZvxJI3lJlfNT/0DVHI6h
         YkLHETC1sWqCd2EsZytVdofDr2wy6O8OlPCxdvA63PHbcdCTLmxjToXdZ3sO5gBKx9n9
         yBMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795203313; x=1795808113;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=41CfvWilGEXnA95p4GfArJCQxJtfnNTP1owROe/U+kg=;
        b=aAUMeuApudBqP06YAdAdimnh6RTRSfGJNAvBN/GHDXipsKUGutHO1MYVOg7wdyE7ka
         Fov3CmXQzecUoZZdfwx01DDmfnXt+R7tHdrmWaiwehjzzD6LkhyHPVwmCQNQ3FfWPx9c
         gKsz3b6IZdTd5ayI8lfYyV1tEH022sveNouCLEIsHeuTpLzsiHNaWEtGeuktebrSSsJh
         5/L/vRH+v0m2OQnuZ22mCTm4bOxTptBUJdaH95Bz8lHeRnu3YJBZFA5+ij9i2xQy+Jwy
         mLTpMRVkODtJrRsJG8Y4eAXWQ6nSFMN6oCB+SzQYq6ddkLfgcysPU0e3cqwTynYtdbtQ
         DLfQ==
X-Forwarded-Encrypted: i=1; AL+hErGY2x7JqAgbJJl9yKBuLwg/lJqLW74ZNwYVymSQGj2XQglHZAd77bT61h6gRXbs7T0YJ3zRYmQBYMaFmEwL@vger.kernel.org
X-Gm-Message-State: APuU4Z+KUAkxTc0VH9KJyB6nWTz805ufuauCdUFW5IbNRNn9tEZwz74r
	4YnYvstiNRxNs0/VNvZ0DXJii1g7GetyOb3U9n2mk5qOCNhhJF8cK9zb/NYuaBMUlEeHby4uGgO
	ZMIWo++vNRrpmhqWz5Ut3Fr7ab6z5coFBR7lsVljog8Tk23EFpXE/dIcTldt3nfzQIK7J
X-Gm-Gg: AYBFou11guRnHavvYOsbUlq1frT4vpFncmD4G6x8GTyG+kTnXV4yHJgEiyzacgdO1+v
	FWFW3BTw+sjiWvU/+RWCZxbxpr4Zcbaif3VVmKIJKFqhb3Ly6LPuil9vbzYYRwWPijDZarSOA8q
	ApVGqOlcldAyh4R8Mduo0nR6+MzsCyy9zZ1l7DVNLvxEVYOiAQV0vN9UZRyvOjNTbHVwGRzY3xf
	4P8WYRSlPNyFzMtOVI6rscRSi7vkGp+7criHtVDQpb5n1Muv2G2W8m2eaSG1+yLBD/JYbG7jlwo
	PDMEi3P0+jW5ZxJf2532BR7NU50UKC30vZi++ommr6y4pws5HFkGXl8d4ewISZEFCEm7taX9tTs
	TodkZb5EXDpXdiSE6kqOXD3zE2RaKfFi7sIzHZS7aYUlxRuhID9c2Rg7X/WnIJaUki5N99IKW0R
	7P
X-Received: by 2002:a05:620a:1d0b:b0:949:75f1:e5fe with SMTP id af79cd13be357-949bab1719cmr629546985a.73.1795203313034;
        Fri, 20 Nov 2026 11:35:13 -0800 (PST)
X-Received: by 2002:a05:620a:1d0b:b0:949:75f1:e5fe with SMTP id af79cd13be357-949bab1719cmr629542985a.73.1795203312591;
        Fri, 20 Nov 2026 11:35:12 -0800 (PST)
Received: from brgl-qcom.local ([62.245.128.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm6806343f8f.20.2026.11.20.11.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:35:11 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 20:34:57 +0100
Subject: [PATCH v12 4/4] arm: multi_v7_defconfig: update the Qualcomm
 Crypto Engine entry
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
Message-Id: <20261120-qce-fix-self-tests-v12-4-b5a2a44bc5ae@oss.qualcomm.com>
References: <20261120-qce-fix-self-tests-v12-0-b5a2a44bc5ae@oss.qualcomm.com>
In-Reply-To: <20261120-qce-fix-self-tests-v12-0-b5a2a44bc5ae@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1408;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=n/kwYOMR7eAiWhZVvnFhVSRXRzZNHQxPDtK0VW9Na1w=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrAKDl+exRoCxSgXKkfWo1bCLJugtHPQ5RgKsBU
 Be0CPNs2EaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawCg5QAKCRAFnS7L/zaE
 w5pjD/9xLwdHyFbKZWUgw/HnEyN/cyMIR6cnngISMQfyrYIhTxHVhyu7G3jbdFCXrvo6Xbo4fJU
 YNbpr5A0on48pvyNXpDWo9JtW8kUcLJWvksQlkKST+7effTOzMF0Ui6ZyLqRTtZQYHxa4R9RIAp
 8zkWigacXyIU8baZeQ9EWfWg/tCaPNuHAmM38ZDZPY0fLijH76Ea+ZzhUqH4JjEe+zSEnTwgmhw
 fhzUYzldccvlzzuDTDFikgoISQOivBNtqYxILxuSYoQGjZk+UNXaP55LqULEetHuEtziC5vpeAg
 Nl3LT+qNGq/Efm7F26E3x9LU6nxDZ+0tivj8NHlmJvLYArtSJmT8XauIt0w3EJGGV5zjgyKJF8A
 VwpPA0A/6CP8F9FZEqj6UVst3wRQzpupfJvH+I5FgRKbUNmDaqTVnkkBp7sgOewZdpJZmh5PKHr
 pD/BsJPYbK9ApWc02RcyBQxcscjs79IBp7dlCDkTxMYWvpUj7x4CjC2FE2LQ27bcZmDzQ2qkvFg
 zuGNW0fmCQpgXmQRslszqJqX8niFlPG+FKVYkr5Iio5Am/XA/cDBsBUUt0gixdI5y1ypgKZy7FA
 ugk6NAxVBKf9ifvl9Jb49tvQnxae6et7ze74GaKPUwpfsgrqHEPVjDi6hMaDdefQ4b8eJ1k3gNx
 tSOU5E6c4KWxi+Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: sJZyMTUIAbfOlBzhu4b04QBEcc0vtKYq
X-Authority-Analysis: v=2.4 cv=BZZNQbt2 c=1 sm=1 tr=0 ts=6b00a0f1 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=y0NJeVxnVzJs6a3GlOz7RQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=5AW58fNYxLuDjIPvRSgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: sJZyMTUIAbfOlBzhu4b04QBEcc0vtKYq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA3NyBTYWx0ZWRfXwJvMAmylfGd5
 hodZMGOWemORhKTs658N+fYQDRL1W7VYH3bmzTPUcCN9T//D0ULpODsDhQQTSkqjcU2Dp5/zz7j
 SWN+GoCGu1nxJ6I6OeBZrfF2CbGvXSA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA3NyBTYWx0ZWRfXxyJEdeJ5YuCW
 GgmyyCUA3jGEgZC4lrjyq3sIKfJ24lQHs50pqFC0IJRTwd9ld9OXo5Wv5m/hbRjxDzoChMi5Igr
 k/Xm4085hDPK2FDxGnG8WYjyCWIqQQP6dexJr4Q78ut8QLHxq4TrjlFelmkMSPg/JBXwgD24vNo
 KgKHYbX7SN2Px0ojv1CWg1tF2ixpQEXbTSPbzGy/bT4hj17PQv4Yk9F8G+9P+os2Ex66TaWVQTd
 ca8uy2E0N85XM0AXDul+SSYC2zrb4maQjydzv8QIAYao+spbZfbKcsDZ5ghTyjE4SQ+WG0ikkdH
 qPoriWEmBgbYAbW5NrgDo3iL0fsjKxmzGlEf2N3jvHonmuDtWw3dvkuHIo67OUmBE/wv5DggTi/
 Z0UlpTc1xL6pFMO7Yw8VwhKmDQl93Tu5geUuUsakmrtREddT5CmXAm9ROcBJhwqIS8Tqm41TkBX
 y8MUWU3/iMxYF6eaL1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0 clxscore=1015
 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200077

Most Qualcomm SoCs contain the QCE hardware offloader. The crypto driver
for this IP is being split into a smaller core stub that doesn't register
the crypto algorithms on its own AND an auxiliary driver than handles
the crypto part. Update the arm v7 defconfig to only build the core part
by default and leave the choice of building the crypto part to the user.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/configs/multi_v7_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index c54bd79c30701ebe59c0e6ef3b43309926154bb3..2413ad6f4d4b02163ad880bd8ae0ca30b1aa7cbb 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1135,6 +1135,7 @@ CONFIG_ASPEED_LPC_CTRL=m
 CONFIG_ASPEED_LPC_SNOOP=m
 CONFIG_ASPEED_P2A_CTRL=m
 CONFIG_QCOM_COMMAND_DB=m
+CONFIG_QCOM_CRYPTO_CORE=m
 CONFIG_ROCKCHIP_IODOMAIN=y
 CONFIG_SOC_TI=y
 CONFIG_KEYSTONE_NAVIGATOR_QMSS=y
@@ -1306,7 +1307,6 @@ CONFIG_CRYPTO_DEV_ATMEL_AES=m
 CONFIG_CRYPTO_DEV_ATMEL_TDES=m
 CONFIG_CRYPTO_DEV_ATMEL_SHA=m
 CONFIG_CRYPTO_DEV_MARVELL_CESA=m
-CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_ROCKCHIP=m
 CONFIG_CRYPTO_DEV_STM32_HASH=m
 CONFIG_CRYPTO_DEV_STM32_CRYP=m

-- 
2.47.3

