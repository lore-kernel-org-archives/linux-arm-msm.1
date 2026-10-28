Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193865;
	b=dd8xilD0g3osCl39+o3cDdiDAqKu8tRF3zPf/bG+FChg+QWkXQoZcQe1gyj+thkh1BpJ
	 21nzWzoC4h2zaN2s4GzfAMDifDo4/YHr4pai51VuDC1Gj8sbJzLkriR+g6DGqikhobIxk
	 Hc3F76yhJwR8deJmd5bx+LbpL5091bM2v5LzqNS5CF01rwxmH4bwHiUKKsVpN/izljB5A
	 kFEnR9APuiHAI2c4oL6rDbMYnvJgqhVljcND8D4lILj3/Bh59la7SPLbi2eKGtry6cjha
	 X/AN7Roc222o6PK06J/MrFb067T1GbGaYQJEbToRxrMALUic/wXzSUg7xVi01S0Q4+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193865;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MkvFpAtin74QnzCAAH0IykQRbTDYxYwsIiLg0nxomb8=;
	b=hSShHep0HRYsjsdRafn4aE1mLrwD9gLYRuX4UUF+zVHMtcAEG0CHXj8khbGnyUOd9kXr
	 yIPbLwK7WnZSwOMARzdYJezyrc3w3fGf9X2YVQmF9UMfcPtzD/VwAouki4VVFuuQ8X5qm
	 TU2pEU7b7iCClA05GS+mA9wvj2GQyfPS5u4kd3OzBEdR4WVTG6g3biUuDuNqiFjBrIYQs
	 jkn92xa32Oq+02GGMs0yoTbTDj3wrYeYMGvMvXlvYlhDdxK1pY7nGaDvXRqVhbMSagR/d
	 hBZpXofEK/ZVfC9/A6JIPU69sJJs73aCL9qjDosXyLIeosYjHO8F8ZHMJRh1S0FHtLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="hjAw/KOT";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jMa8LWOd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F231D606A33C
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:24:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F231D606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hjAw/KOT;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jMa8LWOd
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeYif693388
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:24:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MkvFpAtin74
	QnzCAAH0IykQRbTDYxYwsIiLg0nxomb8=; b=hjAw/KOTCala2OzsqHDzXHmsLW6
	6Z/uFjD3FTk+NQjLFsqvGJW3rYeR6NDq+wMC3lE9GWpm5dXzlqkk/98546CvRDOE
	g+FsZiX7xJCDpPCOAhp7FvmWpoQt2rtuc/Vb3+MZ3zss3aw2v7LByAu9aHL1ivp6
	azFJJO8muTbrFif/BcmCDGuyZuSFR4wknQLTRSH0VZN+N7Qxfb2xtwCO+kYOcBHm
	9ho0pPGWPtckl21N/+oOv49iE2vh5VEf10UHuhcSoK34QocElZVHxaHUkdeYMw2P
	B5/uloLK/VTlH9cuty/hax2MA7mI+Ra1v+Knfr+UTbly+Idd5PO87fuHQ+A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be2ma2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 13:24:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb93c874bso391275585a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 06:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793193851; x=1793798651; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MkvFpAtin74QnzCAAH0IykQRbTDYxYwsIiLg0nxomb8=;
        b=jMa8LWOdqLd6/I6OnsPR1wADRNO9bg3rYnJQYSzcouOGw2VyHqbHkWkdas9JazagW9
         GNB3NLeMa86S+tZ7wl6ENzh6a2LNUmx6RDFx668eaV4w+Ct3BeovPxNN+1Mi/QqvGM8M
         TGjMtCki+nc1r5u/7e4uqec53E3lto4jEsJapcYpzEcC2mJpTvZp88Qs8NCuW+2Nezhy
         fH6NnxWoh869lLrF/XuX6KAkMZOXmk7976vb1IL70cDDNCYYuLdWHtf78Bf1NE/pfj38
         M10FiIr85jBfEiyA0mm1GLQroKRBeE2g1W5NYLd5EAM0kJSaRRavL4g/FUp3lnDX1ESa
         hRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193851; x=1793798651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MkvFpAtin74QnzCAAH0IykQRbTDYxYwsIiLg0nxomb8=;
        b=CioNwVdCfc4tnb9hoy+Ze4847p51FrcXvO5zumC8ok8R+QG638kUm8J2uRnZwrMQq4
         w41/MdeelI1ea7gytFywF8wgMjB6rF60FGjmvVaFN0Lu6Uo+GpK7SPvVxFpiDWttksk1
         4EUr8yV3EDQbOamtQ3WZEJ8OdUc5z8GVf46fNohyecWShe5i5n0HUYhlwSyW8LicsTg3
         1siom9anD71ijdM3JwaKYw9ccCI7TyQhaS598+kbpzl5KT64iRMxJpiBwCDVSjhtZbwv
         LeUU+5sOvIjWCiFRoUizOM7WCoyYEv5a4vI8DFhuT4/aOGiVyi1NUwOa/wEEdU1Usz5G
         d0PA==
X-Forwarded-Encrypted: i=1; AKwUvBxcc6J/yY5Epqee22k6/J41JIxgBCn3c/Uocmlp2/sCOWH9i+Yp1vwKtUNdo0hlvPPr5/lZ+o2H2e6O4NQA@vger.kernel.org
X-Gm-Message-State: AFq9FYIFL38tubqu1SQ6qSCmtosKlmVg9ORH2uobk/l2Clnjw8jVO6ku
	hryQ329phz+7TH1DJeFEgFG6abPfDYXmyWRa3BonBNNWlzh8MIiq7OzWV8LklfkfP5GCIga/drS
	pNjMn67+bRUAdLcvmZDSOqM8knBdTGPQi5QkqfQU324ZOjyhkOYloSO56neY8lQqJB6v4
X-Gm-Gg: AYBFou19T7M0ZYsK89wl+vXTxrKYTyEUcE7EMmymT7O0oPydB9BZcq9ZHT/oD0YlTvf
	3jx7kVC13Bcv8xa+r5Qj69ShHXyWwIYa/r7DBvDFdbDj66bYXBaDMoqpXbJ+9zSOJoOAx8mzHVn
	PZob2uWtV6Ygx7HrfLLpG2jxTXFNYh9RGoxp44TfLqgsXBDukDy1gBLA3Dgc+EY9HsipDaRV25i
	FAy9njIAaqdjAeYM9DKSE4TdVVZ8LuE/bh5PV5bnE23O1RXsqYUJQefb5vj/6gA5KcBRGrAy+vV
	fHCYE7UNNKR6rfeegavxbW0EGx4aw8XvKkvaWMeT+/jV9SOnyGjfn5gpm/2o8sypbDqePZg8+ID
	KQsiYHrey84S2PzKS9S6dUv05/Z69NULLc/E1mxOFE09zm3qH0WT9Hp1TsGoW9466/IP33Ti9ZQ
	==
X-Received: by 2002:a05:620a:3904:b0:93f:31f0:6a77 with SMTP id af79cd13be357-943f4b3d96dmr930534185a.11.1793193851158;
        Wed, 28 Oct 2026 06:24:11 -0700 (PDT)
X-Received: by 2002:a05:620a:3904:b0:93f:31f0:6a77 with SMTP id af79cd13be357-943f4b3d96dmr930528885a.11.1793193850586;
        Wed, 28 Oct 2026 06:24:10 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b496435c7esm1457824a12.29.2026.10.28.06.24.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:24:09 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/6] media: qcom: camss: clamp VFE clock rates to the highest level
Date: Wed, 28 Oct 2026 15:23:59 +0200
Message-Id: <20261028132403.3505037-3-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com>
References: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: I_2rN2ZqC4kxUqLO8k9wZ1g5mCZXOMvu
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae1f77b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=-HOgthFiqlNClzdobJoA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX2G8MMK9PPw7j
 Li3Un542lHuR5xrjlzRf0Agl/UZi7RNJnOv23MW6SAh/+p+yVzI4Uyg1cR1XnKi6X51UVHmXrjp
 86VYaXIZI8WMQ8lAFpJfaiza60tQlh0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX7VVMO+zppTnL
 1XKPxNL4nXuzXbTHdQHwd7r3V3poFpvhro/iIR6OA80EBDG8LyEz/nIyZ8wJmNHh1bQmVmePQVf
 8Il+V/6xyi2vCIX4ka0hpUfq9yryvb+res4mZpURroy77hV7f3rWFJE4JQ/QHUeC6XVdWqQGR8L
 bPom7C8Mm/v+2mPTdom2hPKNBp3PEaAPr9nOr3LbSPiBVAsRjnPMnNOVWokKVp55/JEOE6ruze8
 WE4q49abS4WnWFLvgUuxOkbnUYUOjOX46zL8qlEAbp73RrNVuWnrMPJFRsE0CJ3YYomvrfdxF6G
 tV8nrYfIpnk/D74FcU/8vWJ0pTEGQwrkhC+ynqeDGouJudvxsFE2ATnTE+gny4pxCbG0+e7ri9O
 F21Nh0sKNz+qSRr31/0Kk8t3hNQ7R0OTfXApB02T1LCWMevV63/qyLDhnh/JBtEAP6GaOum4Hyh
 MqJ7qinsj3h0+IeN0Lg==
X-Proofpoint-GUID: I_2rN2ZqC4kxUqLO8k9wZ1g5mCZXOMvu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280053

The VFE fails to power on when the pixel rate exceeds the highest rate
listed for any of its clocks. The rate tables of the VFE clocks are
independent and need not have the same number of levels, so a clock
with a lower top rate than the VFE core clock, such as the SC7280
camnoc_axi clock, makes the VFE reject pixel rates the core clock
still supports.

Keep failing when the pixel rate exceeds the highest rate of the VFE
core clock, and clamp the other VFE clocks to their highest listed
rate instead. Take the clamp into account for the other clocks when
another line powers on an already running VFE, so that a clock
running at its highest rate does not reject the request.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
Changes in v4:
- Keep -EINVAL for the VFE core clock, clamp only the other clocks,
  drop the warning (Bryan O'Donoghue, Loic Poulain)
- Dropped Reviewed-by due to changes

 drivers/media/platform/qcom/camss/camss-vfe.c | 40 +++++++++++++++++--
 1 file changed, 36 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 59be37f83df3..bcc2c1929af1 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -918,6 +918,20 @@ static int vfe_match_clock_names(struct vfe_device *vfe,
 		!strcmp(clock->name, "camnoc_rt_axi"));
 }
 
+static bool vfe_match_core_clock_name(struct vfe_device *vfe,
+				      struct camss_clock *clock)
+{
+	char vfe_name[7]; /* vfeXXX\0 */
+	char vfe_lite_name[12]; /* vfe_liteXXX\0 */
+
+	snprintf(vfe_name, sizeof(vfe_name), "vfe%d", vfe->id);
+	snprintf(vfe_lite_name, sizeof(vfe_lite_name), "vfe_lite%d", vfe->id);
+
+	return (!strcmp(clock->name, vfe_name) ||
+		!strcmp(clock->name, vfe_lite_name) ||
+		!strcmp(clock->name, "vfe_lite"));
+}
+
 /*
  * vfe_check_clock_levels - Calculate and set clock rates on VFE module
  * @clock: clocks data
@@ -1001,9 +1015,14 @@ static int vfe_set_clock_rates(struct vfe_device *vfe)
 					break;
 
 			if (j == clock->nfreqs) {
-				dev_err(dev,
-					"Pixel clock is too high for VFE");
-				return -EINVAL;
+				if (vfe_match_core_clock_name(vfe, clock)) {
+					dev_err(dev,
+						"Pixel clock is too high for VFE");
+					return -EINVAL;
+				}
+
+				/* Other clocks are clamped to their highest rate */
+				j = clock->nfreqs - 1;
 			}
 
 			/* if sensor pixel clock is not available */
@@ -1045,10 +1064,23 @@ static int vfe_check_clock_rates(struct vfe_device *vfe)
 		struct camss_clock *clock = &vfe->clock[i];
 
 		if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_levels(clock)) {
+			u64 req_rate = min_rate;
 			unsigned long rate;
 
+			if (!vfe_match_core_clock_name(vfe, clock)) {
+				long max_rate;
+
+				/* A clock already at its highest rate cannot go higher */
+				max_rate = clk_round_rate(clock->clk,
+							  clock->freq[clock->nfreqs - 1]);
+				if (max_rate < 0)
+					return max_rate;
+
+				req_rate = min_t(u64, min_rate, max_rate);
+			}
+
 			rate = clk_get_rate(clock->clk);
-			if (rate < min_rate)
+			if (rate < req_rate)
 				return -EBUSY;
 		}
 	}
-- 
2.34.1

