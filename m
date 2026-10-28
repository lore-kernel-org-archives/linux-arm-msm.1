Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793190932;
	b=GClnD/IGNEhbeqxH0AEoNtpmtZB+YvnVVaWyirDuc6UjMYAF43SaSgwWQuGew+tg+IeI
	 +MLctQiC/h4HKTKk03StEM4qL+SGFyRAIgnsh2MtI/9T+LGvvF5ON7Gc7MGIjUIbokICc
	 2pgyJWUfmdCxSt8JXkmQq8X+CjxOHHh7H5OZ1KuUWNsrbcxNRq0keeSEdGmhaGdt6IyRg
	 OLVhbHTDsvcXmAWY++Z+Yx7p+VYT9unb/uWoRB8ycYIYDpdFGQqtQJXKArLTZpr46U9C1
	 /ERyVqj7GP18IfanHgtx9ekH8LolXyI1mQt02XnflrHW7bVNBJ2Fcnv/CDRJ83/7kXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793190932;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VrXv9WGeoSLtqGTNbnuOriuaWFR36i9ga2sA+5vpHpw=;
	b=LNFB5ccC5cXNcED823j1mjAaX6ccCLIjK0sTXY2Ahzlg0U4Hf5U1A6XEG8iHh3A5u2lF
	 cGtXVhw1xujB0TnAnt1fehRIh4b7YBcuLJsAXkUXVuQiD2Vgq0puYURz7Xc8d4bSxJmXN
	 /LXjowo2XtRiJ7CKvzEAfRtbNwkTFB+ysQiKvjaj3uba/W5XsKoURPYWuHBDZjY2CQaFB
	 /NxSRE6aVLmhQYg6cCpxfOM9bfY1VxjK3VKvYv6yBy0Hhqn3Na/CorQ19kl73C47d3fPf
	 S8sXl2DD7ss4Tbw1aJllMi/KZWCgtjfqWdQJSS9ilzFQqA+/AnWHZO11uC6g8NOnVGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EOmFV3Ci;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PtiODmxG;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB44606A322
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DB44606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=EOmFV3Ci;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PtiODmxG
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBdx4f2105712
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:35:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VrXv9WGeoSL
	tqGTNbnuOriuaWFR36i9ga2sA+5vpHpw=; b=EOmFV3Ci++b0gq1Fg/2pk4+xwB7
	fbyg5BdNRkHs9tcWltuHb/jt920jdY/GobZdEonla8s8NX3ZJ+TgFPAGmly9/9Ai
	Hst9zg6sV2lI4lASwyQI8V9Y631t5/G+3hNsFpEJSUW1ZSqHWc6rauFyFBrfuI/o
	EzqxYqULaV5kWkMPiXUkILSe6B/Bmhax2ECYKTGSRgAL38L7NhY2eUDyWUg/cBg/
	mZSpnoo57OSqLSr8MLjdTPoGs9YK1Nkb5rGBPWUXle3FiG6yB4bXBVZ7yOVC7PUv
	wUeHDk3rsN1eY2B382XXxM8rRZWtX3yuoxkQmHmD/a/f8GRfuC0krArqlEQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk12puhmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:35:25 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3552883bd19so1688094eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 05:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793190925; x=1793795725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VrXv9WGeoSLtqGTNbnuOriuaWFR36i9ga2sA+5vpHpw=;
        b=PtiODmxGWSeqyiZXlQ/9FVMQhWWz7irSNj2gqTd6qT2JUHTH0ptJs1nAwg7k8Ib8i9
         4CIpC7E8iFqxl2R8G4PCYVrwmEk0nlPDxKXq6LUvUZxHi8U17j/EaoyxzWefml9bjXpz
         KcOFzgYbeaoRJhskuopg6NuUCfpXQBig4PJZ5O1g+jKksN5Rgs84v2M1aK/CzgnxM1fZ
         MtenjcrJ3H2Sam9YJtXm+ErAoHwsxGCriuh6KYcHVZheEcKpwdov7deYsodiIdmBdJD8
         el3ZqP7RO0OLLY6xAHWAX/3N0AG4YSXsxTlan8ra+5TKDrgV0aUUO9ygoQMI1D3Om7xP
         7a8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793190925; x=1793795725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VrXv9WGeoSLtqGTNbnuOriuaWFR36i9ga2sA+5vpHpw=;
        b=Jxh1gNfmmQ/WQYGsw1XhFXL4Sr+9AWHbA7WjBX46ZXWQzDqMnn4oQaK4ZygiwULwza
         Er8UqK9dDOSbYZipigm/YpoCLTpKMLbaWGO60qZ2RakYOdL9+ize/pGE1HrE+4Pw5sag
         JxHMNm7tGU1wkQ+VgA5G7M2jUox8H/G50NlrQ6VBAOq7tboHmJyUk0L6L3d7ijrB1gc3
         rRFo31JTjCqMWeJqpE85FOBsTmRB++AQYDUJiB9fG3WL47gTcCf2VfUuEHc/eI294MEH
         tr5/zQhvOVET8wT68+tlkDEJvK/ffLM123uL2DaZkfzKLxViyoLwd3Vp8nt7R8vpm5dR
         EqhA==
X-Forwarded-Encrypted: i=1; AKwUvBxJ63HphhxIOXXASeO3AgvWUCtGDKxduffq7hoABaaDMpN25SztcJH7FxWE/CgkelZmHTQoBi61/qyp5Rhd@vger.kernel.org
X-Gm-Message-State: AFq9FYKpumawewvd8YtOxgZfnoKo7TQiMGk1NIkWmec+kQWoUH4PMiDs
	vC3j8QqWaRKtVWun+OBtyo2h1EanbG4AbxBdMQ5tGVdLrp3l7elAyFMHQ69nqkQ1uJ8sdCXBR/E
	SjQTss4YM1UFUijD+6IA6TBjIHFekSv8lBHWzOTTJC8YlQNLArb7RGcMh/nhGq6rea8aZ
X-Gm-Gg: AYBFou0wro+TfnnASxLWuPYRBXB83bo258f7pbGYORodtFWgTPg9joKdOk+ouuPxov0
	YVn5nrQhHDbNnb8CwZFnvEDIMhGdJlR2d8IGGpzd2Dcu44i5oCFsSfcLwnqVlXnYXH8EvZqTwkn
	IZ+XnTGEzfJ03xj+kD0G5AlzwIDIpso6Vud12RE9ZKeA68OSC/vyCh/qk14/ZEFCb/gassMn42K
	NcSyEWvtauCnPRw4aJ4+hD2EYRxMcj5nKCPQYqoeLTIy8TaW9Rr2g8cI7P5t8mwpnoOmHO5KUkq
	0JOffmGWucMLpC4pPiyThw0V7J57VXbz6nujzv8z47ktRfTVEoGv+u6xPgGP9BgomZQ4L+EIWbB
	l5syuH2M3A2+O2vBH+yjNwFQhn/yplPSTCaRWKl5NlX75wCEgcLSeS3Nt2l41tzoKylv4uSvAqN
	ahjQoCx6eh7bZNJ8hsON4Ka+pspVURQO95
X-Received: by 2002:a05:693c:87c6:10b0:366:fabf:6273 with SMTP id 5a478bee46e88-36a20459a30mr3508468eec.22.1793190925156;
        Wed, 28 Oct 2026 05:35:25 -0700 (PDT)
X-Received: by 2002:a05:693c:87c6:10b0:366:fabf:6273 with SMTP id 5a478bee46e88-36a20459a30mr3508431eec.22.1793190924561;
        Wed, 28 Oct 2026 05:35:24 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239644efsm10015881eec.23.2026.10.28.05.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 05:35:24 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 3/4] gpio: shared-proxy: Drive the default value when no votes are cast
Date: Wed, 28 Oct 2026 20:34:47 +0800
Message-ID: <20261028123448.510401-4-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028123448.510401-1-shengchao.guo@oss.qualcomm.com>
References: <20261028123448.510401-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: WAoy425qxdRhQ2LfVInQFz0dgzWeFBFT
X-Authority-Analysis: v=2.4 cv=DtDDa2/+ c=1 sm=1 tr=0 ts=6ae1ec0d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=oUwo9orgbciHMXp9giMA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX4MwVchcVsxui
 ngRl31rdIxmx3Vi0rNVbgbtWrAizWFB1HpU2nZwwKOYExMdQsvI3hBNswCb/fI8B/0AubefE9C7
 oQPpgdlAabgJNQlufaL3TgJmb0g4ynt3xZzCPrp6CKzIYg5JqaT3H0VbrohsRsU8Y20XDc13EO2
 BmjTDSW0U+arKn1k9g33poHNwrn7CxE/QlKx9ch+c9k1wuBiwMNU0xhetdiOmyHgNRlY//tQLNZ
 GmJdTkeo8Uz0AEQ60WsT+/NaQ+Yi9hhcmPyH10GuWjUQUsrGhtbdt91PrqNsWpGOCGJTkhGTefy
 e8YixJJidGXQJBf2KLAZWPRqzhzpmFyIFnD8qClg9ZH5qJpgZ3q4139K2/3/oSzUsJtttqngFtY
 ulDSIvbPtuTwzJLVYz9mIi5s2QjhRIpkzaNbgbmqMSYxLn9hYfwF5WBY9Hs3qVQ9QLMjRgn/5yN
 7kEHcPUdUztr/E0+FNA==
X-Proofpoint-GUID: WAoy425qxdRhQ2LfVInQFz0dgzWeFBFT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX1DIK52Ko0Iyb
 ZwRqzNFrjoU4WqWJEB5uyY3QON2aZZTE/6AVaG4QMhQz3mgLDsMW8aWpu8eNg2dzSmPlykb2pR4
 qgXm5koNieVcjL2gMn56KYMTKUSl+Z8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 malwarescore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280050

A consumer that requests a shared line with GPIOD_ASIS never calls
direction_output(), so def_val keeps its initial value of 0. If the
line was left high, for instance by the bootloader, a later
gpiod_set_value(0) from that consumer matches def_val and the proxy
treats it as withdrawing a vote it never cast. It returns success
without writing the hardware, and the line stays high.

The consumer has no way to tell. Its request to drive the line low is
silently ignored until it first votes for high and then withdraws
that vote.

When the requested value is the default and no votes are
outstanding, write it to the hardware instead of returning early.
With votes outstanding the request remains a no-op, as the line must
stay at the voted value.

Do this for all lines, not only GPIOD_ASIS ones. A line configured via
direction_output() can be left at the non-default value as well: when
a proxy releases the line and restoring the default fails, its vote is
dropped regardless, leaving votecnt at 0 with the line at the voted
value. The write lets any remaining user bring it back to the default.
In the common case it is a redundant write of the value the line
already has, and it only happens when a proxy that has not voted sets
the default.

Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 drivers/gpio/gpio-shared-proxy.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
index 4eae3c9a5168..75d0d617941f 100644
--- a/drivers/gpio/gpio-shared-proxy.c
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -85,9 +85,16 @@ gpio_shared_proxy_set_unlocked(struct gpio_shared_proxy_data *proxy, int value)
 	}
 
 	/* Desired value is the default. */
-	if (!proxy->voted_change)
-		/* We didn't vote for change previously, nothing to do. */
+	if (!proxy->voted_change) {
+		/*
+		 * With no votes outstanding the line should be at the
+		 * default, but a GPIOD_ASIS line may have been left at the
+		 * opposite value. Drive it there.
+		 */
+		if (!shared_desc->votecnt)
+			ret = gpiod_set_value_cansleep(desc, shared_desc->def_val);
 		goto out;
+	}
 
 	/* We previously voted for change. */
 	if (shared_desc->votecnt == 1) {
-- 
2.43.0

