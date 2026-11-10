Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304706;
	b=wyx4UZsQvqfCsLx/HlhU2ZaScHMDQ50a7QsVpEmTRDDdAfvLrO/7aduACS6zoCWoMoXM
	 AXJQk0p7IWk2JGFcCUDrhaNrnyYe7J6NkPai0/tIZYynu77KP0p7MCZfoKR0gF/FEAgnC
	 0+I4w9qASpPg8CD5Vpban9h7owB11AdOr+k5mHO3wh4NVIFTl7LvHL0C0b41GSAskhj/X
	 8xcn2TXNlRt6FL3IMYf2EQ4BArEOUh7e8GS5TpkDsppB3i3YD41Yp3iCtpd0pszT9/5mg
	 wOmZPWuqoa69gOYxEITFqbjZ25noKLAAHVeqGtUSxqA2C+FcI/bTkQy3jxScrWvC52A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304706;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=riYYaHAqjeIdiWCPuLdbc8hgds290pjODW7RjCbA2ow=;
	b=FE8CIB6mcuk32MI939jyt5aBQxfXF0b/FsxO1K8pgeHqeOgw9R/kbSb0h8J+OMhnuLlI
	 /t4hxqtxcn8Zi2gRvXAB09UjoOR6xrRrRiN91GJUKj+9QsquJWx3Oqv2N9cEyct9nNICq
	 R3o9F0eoAw9SWN6I2raIb4UY/cQeOC9GuOE8zqbArAulP65QIOzUEUTs84G0XH0aEZadI
	 zAWs2/HhCuVUjgxBEPxvVPBfEEE13p9amw+RgYhLUPttAV1Y5NhKMWUt9WSg0zH6VvpIK
	 qVXd79r8WHkx26eq+yZ/hBOqtcxA3qEk9fiIciEYd2v/iHOK9LHcyPpb3cmgrLdPhcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YwYiODmX;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Otdi77it;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9D5606A31C
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 09:58:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB9D5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YwYiODmX;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Otdi77it
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7lAgO3392451
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 09:58:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	riYYaHAqjeIdiWCPuLdbc8hgds290pjODW7RjCbA2ow=; b=YwYiODmXjRJmEA/T
	q6P88I1GJDSo4yWM9K4B4cXdQPe4Sup3CKQdQ/kwbqzIKkiDN/H+NduBKs40F19E
	izpTQjJq6+VS6SwjIYWQ3WjRcSkshwVOgQnfMWFFSYSug+Q4RzfYO9sNI/Vx90/O
	Jr36nEk2KAK/FdAfD/W17tDBGC0nsTc5yEzzo9yTjA/nF3mkYgibEwQfjPtMLzGt
	G2fjK6hdJ0rKUSmoXjxEcHrTxRTSxpVhvRgqwQAlm0tfhMH9Fag9jE9OxlLIU4ek
	HTb4YprNc3AGKWKZEwWDzZ4ZOJCci/6nSQsW/mFuEabjNh+IoNFtHheqkXvU7ZMo
	XjtcXQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4humjg2wk9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 09:58:24 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so4538240eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 01:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794304704; x=1794909504; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=riYYaHAqjeIdiWCPuLdbc8hgds290pjODW7RjCbA2ow=;
        b=Otdi77it+izgwgtDLbp57LDDZqQOqXRLIWmRpYccc52WvWEzD61faPbsaSkBCZ3ZfW
         uW6H3PKJJEFGLNKUoSt5sEBh+B/Ean833rllfLs5XTviueJDKRbu040EC6E+yguRNxmZ
         I73G2NvH66WCwT4cTDYVarAsP5/6QS51VhL7DvqwR0qALIw/FcjS7FaXuMB5Hvsar+yN
         brWWMTf+l2BcEEVKblfdFwBKQXo+hhYd8ccSjoa+tVwGBODwKK0rxVPoDkXUWuqDk2i5
         PiQNzlBoBH1N8sxqwPMHCT+DplR+SaHyI7oulYPKih0/WWMOwRZ46h55aeqf0bgvP0CW
         uvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304704; x=1794909504;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=riYYaHAqjeIdiWCPuLdbc8hgds290pjODW7RjCbA2ow=;
        b=CnDV4YGwbkOTJqefroOriGSl3ByTgOSfx/GYMsCVYw9ALXgxDLXBYYKc9o4h2bL5nK
         h1DdkcZZrhSXMTUf9Tj5fDRWdrBzHuh9agHFpmAR4DWAEDxdDIHGBrGl9hsOtHqog4L2
         Oz15kMHfUdTGRNAN9SN5qX+Wa3jhS0lwGQ4GqsfJ+sdeWiyZdtZOsu4a8U1XXxUEoXtn
         KItO6tU9MuMwu3FVa1C1juHd0wGmhz4dXNLAKe5rjucm3RGcJJZe3ADnSN3CQC2QVL24
         7Jih+zkoAlh5A83b1LGbUM0gZROcHTloeXhuprvKN52FY48ywY3nK55l9ph9h0M/xkRM
         boWA==
X-Forwarded-Encrypted: i=1; AL+hErExNbULaMMoJx/dNGBoDGA8n51Gz1lGsp121iysYVhBsnKqz1N/lizPGESuoErKR5cDVLqT9DyOK9Psj0Px@vger.kernel.org
X-Gm-Message-State: APuU4Z+AcdWtmUnHyogaUTCy2yXLj1R7NUEzfnjgDlK0T3KDC0Vlyise
	Qdv+4yCTak7sE8oCHfpIE6FJRW1cxTBgJJYhRjA23/R2VO2hekyHvZzFUFUMUxLq6r6G9pUEwkA
	nIUgie86U4RC/X5D9q5KsJXlVpkTHrIle+CeD+ioddpl1WxVwMxPYyHIyaGR1kwvWtLj3
X-Gm-Gg: AYBFou20w8lfo6zMEHFfzKpcP5JndOoLruMrTZm8GpmrpWTl5fm5TDBCcqTNq6VnYk2
	r/RdA7xFIyCFxk95j9HEGC2EpJbcQ2ToiY+Vjo+04X1wfiopsqTdO+4VCC04gnl1EbPw+cBs7Km
	Mmd4F+NBhdwFZN191k4TekFJ/InwThT7kRoU+BjMIAYV2kGHQAlmcEgLsGnRio3fvygLR5aAM4n
	EPN7P/ig8V9sthdTmvGKeebrGNHzmPqkx78WwQjjWANb7O7J3bOmxJ64jGCpW/N3aVf2bZZ8n+i
	rYOPnf+sStOfBTwjgHBAQ4UoZntwX5oBwh3U7a16KwtHlVCk3K7wo0JcYEnjzenAZpwmsBXgyUh
	223UwpifA/+LOWK/9c8IHxy1YxQIci4IIckqVNr2sP7d/vVha43C4H6Bx/Z/kThBqaCsfDAA8Kz
	zG/z2r1A==
X-Received: by 2002:a05:7022:e884:b0:144:e535:3ef6 with SMTP id a92af1059eb24-1b3b6046680mr3319741c88.41.1794304703485;
        Tue, 10 Nov 2026 01:58:23 -0800 (PST)
X-Received: by 2002:a05:7022:e884:b0:144:e535:3ef6 with SMTP id a92af1059eb24-1b3b6046680mr3319695c88.41.1794304702767;
        Tue, 10 Nov 2026 01:58:22 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11346sm7333141c88.7.2026.11.10.01.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:58:22 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 10 Nov 2026 15:27:14 +0530
Subject: [PATCH v2 2/3] media: iris: Skip redundant HFI_PROP_TIER updates
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
Message-Id: <20261110-fix_dec_seek-v2-2-210d8c4fc31b@oss.qualcomm.com>
References: <20261110-fix_dec_seek-v2-0-210d8c4fc31b@oss.qualcomm.com>
In-Reply-To: <20261110-fix_dec_seek-v2-0-210d8c4fc31b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794304687; l=2849;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=9rwHDwJH30YYpsnnhv+f/V2usq3fbaNIKrsSLkQDhUs=;
 b=/hEgDVf0nOZwuvoFSkD+o+esSMm6hLP37P8CLEsIJ4lphz70b+4odMYDw+Mvb/WXrlMsy3EuC
 lUHQYXtKKdrB43IWEaQLOuNGVEpIYEmbKzlXHgFRcEWad89f4p03qSs
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfXw0/zKlMCMIei
 qitDCdV35KKhUGQnkuQ22YRVzUJMQ1dNDN9Ha1afj1mG0WeAQVH2A3ICOKMYMQA0R30V7pB0pRl
 tqp3WQqQ2ARAadRaN9ike+Mtk3L7LxWhWNpolvetHE61yV0ORh6ttKO1o8PXiutqpJwayETL1hO
 98vUxvt4GZW7rErcQXQhSNwSFs8C0dP6atg1sGUg9vbJO80Hs2OL9ZEyBzz6L15mHvACB0tuX5t
 DmjglubdZsyLaigFqeE+mh7TmnzC8o6rSuXFy7J5aYj6Q4DsVyY56Ve9It/QzAE/z2rcV/qgs11
 8BHZwGwqMVHJXUSaoGtyNuyB2qir68RcoYFXBCL5S/0pl8gQ3go2+ZHvnkASS4fFUD8XRpwiGKk
 t+lq4oCv5xVU+qiYsePc/oME8yj2g3cZ/Pm2A9ml8KKnHKEp5SuePycfJgggeFENtn7ZJ1EnK2+
 eq7ZkvHZOW9Qngyf2OA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfX665h3+5UEYtr
 zVqKOIKjPVM/omAi4umN+h65m1sfkTmsC5yfITtyCosvYAPYLrbqQhWffn5lp5jArMtxzQeE46T
 de7iAA41BPk9iL2J0fCnwynR+QbDGGQ=
X-Proofpoint-GUID: wu64c4QWsC5jGa44jCnjNLXFar47KWem
X-Authority-Analysis: v=2.4 cv=B6gsQ+tM c=1 sm=1 tr=0 ts=6af2eac0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jJqbJ-F1a0nUChmTeA8A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: wu64c4QWsC5jGa44jCnjNLXFar47KWem
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 malwarescore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100039

HFI_PROP_TIER is applicable to HEVC decoding. TIER and TIER_AV1 both map
to HFI_PROP_TIER and both define a .set callback, so iris_set_properties()
programs the property twice. TIER is programmed first and TIER_AV1, with
its default of 0, is programmed last. For HEVC, TIER_AV1 value overwrites
the tier selected through V4L2_CID_MPEG_VIDEO_HEVC_TIER.

AV1 does not require the tier property. Drop the TIER_AV1 cap and its
enum, and make iris_hfi_gen2_set_tier() read the value from TIER cap.

Fixes: 2af481a459a4 ("media: iris: Define AV1-specific platform capabilities and properties")
Cc: stable@vger.kernel.org
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_hfi_gen2.c         | 10 ----------
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c |  3 +--
 drivers/media/platform/qcom/iris/iris_platform_common.h  |  1 -
 3 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
index 79bbd06ef8d2..706698201c17 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2.c
@@ -999,16 +999,6 @@ static const struct platform_inst_fw_cap inst_fw_cap_sm8550_dec[] = {
 		.flags = CAP_FLAG_OUTPUT_PORT | CAP_FLAG_MENU,
 		.set = iris_set_u32_enum,
 	},
-	{
-		.cap_id = TIER_AV1,
-		.min = 0,
-		.max = 1,
-		.step_or_mask = 1,
-		.value = 0,
-		.hfi_id = HFI_PROP_TIER,
-		.flags = CAP_FLAG_INPUT_PORT,
-		.set = iris_set_u32,
-	},
 	{
 		.cap_id = DRAP,
 		.min = 0,
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
index fac61ece177e..9464543836c0 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c
@@ -603,8 +603,7 @@ static int iris_hfi_gen2_set_tier(struct iris_inst *inst, u32 plane)
 {
 	u32 port = iris_hfi_gen2_get_port(inst, V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE);
 	struct iris_inst_hfi_gen2 *inst_hfi_gen2 = to_iris_inst_hfi_gen2(inst);
-	u32 tier_cap = (inst->codec == V4L2_PIX_FMT_AV1) ? TIER_AV1 : TIER;
-	u32 tier = inst->fw_caps[tier_cap].value;
+	u32 tier = inst->fw_caps[TIER].value;
 
 	inst_hfi_gen2->src_subcr_params.tier = tier;
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index cddab9a9c375..973a6f91a49b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -135,7 +135,6 @@ enum platform_inst_fw_cap_type {
 	LEVEL_VP9,
 	PROFILE_AV1,
 	LEVEL_AV1,
-	TIER_AV1,
 	DRAP,
 	FILM_GRAIN,
 	SUPER_BLOCK,

-- 
2.34.1

