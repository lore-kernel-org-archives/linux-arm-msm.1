Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200878;
	b=DG++U7cUSn+ta0i5lkwQ77DwlngDDOJpmXBPr6kfS27mH3WuiqCQTbeSKRG1rmoZz3tE
	 gt04mQ/ezBx48hXdSmzOJjfmKfLzbwdl6zShhbmxFh1nPbMPXMP9Xijx8lwMZqWaiMayh
	 JiCkA3Kla4vO6MlALQac6aQqaeRVLESZLvPfU+X7rQ3rr+f8jwq7QeW4NeqLUhn5kUnxi
	 HRGOJQzbDpYbVrf9IBWp7c2633GtBrAHCarv0fdtSTCKVVDAWhECQsD4+IAZG6ej2PcEC
	 V4VnS4wOkNXOXnS1CVRKTRz9KTiFygU0dSjX9eEDMdcVnERomev1LLwY8y6WkqRKAIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200878;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mtyicMFphg8NIVF2KmS0oSGWOULir4B5NzOfXYC1xoQ=;
	b=UlyPC77bSjhiCRC4tIFlY5axCY02Yv4oTJzbF76gCz4/f2veLIcubXaXfBrXABHRzsva
	 2IJlR0PznORjA2y5Rn949gkvUYcaeTUuRn7/4llR2y9avS2VhdEGBwoTtOBoIdtFMlMoO
	 RuEuouDUwTUQNhygKAXQaG3F94Ye9VsP7dUpOYZoSHJVhUGPthOawaI3fNZ6Wf8ayclj5
	 i3LgBKQKZwgjNxTxC2Mgaol07bjPQY2a3aB2yLsicQN2zEmPA+gZ0BuIzO6/7nFwIz9tp
	 Si4s3O3olimAFUvqnAW92zVVolFqCSqTKSYbFejSUJQ5U2OAvSaWC6eImEqyjya0E7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F+NFIjQd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O2U8h9Kz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274E260A2617
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:21:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 274E260A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F+NFIjQd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=O2U8h9Kz
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAEvx2001700
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mtyicMFphg8NIVF2KmS0oSGWOULir4B5NzOfXYC1xoQ=; b=F+NFIjQdS2yHtIq0
	XVAfqZLJkJbeyypfqPMoto3ULOCSYsonzYMFk1m7L6oggnOfJrOUO+VPx+Q45x2R
	gskrkkoQ/M3HYqIMW29inufC6KXCHsLz5SS9Uylp+NOcxoAKEujfpyZ+EBJxPRox
	glKj+vL6AcYOMWxplYAktVQHoHWWBPkT71PVgZNGt4w3o2UHmsb6Zxi/zlv3KYaX
	rfTaeUO14fiSwENsSIgvcpp2QbwXQ0DJWEskvLfJLc/kv9l8gPWUgVyDyWj60r/A
	qiytn6nF06/Cx3bWdTW01qYi7eSwYm5xs9CTC1fO4NWLtOV+NM1lpduM4EbQe0b2
	bxbaMQ==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdf7sm4b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:21:17 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-6799288480dso1942636d50.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 08:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200877; x=1793805677; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mtyicMFphg8NIVF2KmS0oSGWOULir4B5NzOfXYC1xoQ=;
        b=O2U8h9KzwXl3Drgf1Z0ZkiTDS9BR8I7evYrvg5H+08SJsHOF2uw+tg8wp9nOEa4Fg6
         zZw3Kd1EZItTfjPveXpTPlf90ug4smYK1+0DqtYtaWHxvGHWRD9/53XJzDh0w7DmHJ3w
         wXfQ4sAEAEDBW4l/dGGsftk/Sp5ZJdiyBY0AiZnsXr7l3H8wzIOUHILEMUp+hMzfkfDw
         tXoJoe2fMaeZZ0OjQZj+G8vIyteP44r8C/Efqhe4X9wG9yLYHmskKaL1oRazVdweGg78
         kkCOGPbv268cDge8jzjtuRspHxyl2bPSESr87gA+/nXBvnItizDc5f3g1RaDwvDTyuQ6
         E6Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200877; x=1793805677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mtyicMFphg8NIVF2KmS0oSGWOULir4B5NzOfXYC1xoQ=;
        b=RRfbDCf/MCkNd2l3BIvqsGd5xsAEifHY7rgRynHVKfLXBs8H5yWPc5SNfzstLsXsR/
         UNbp8KTGMTE9h0yOEjW6VR4dLj1dQsdMqIVW83Ekb/m2uotC260aalseydNxW8XVP7TZ
         NiyoqBxMC1a4Qw2nUqgKc76xAiv1/lAY8LDTb9mcRwssfif+ZNHJEG/PCQK5URJfjPfw
         gF6RVSjCOwx5h0mVJWUtDbeog402lbhSZ+SM5h30ub7jn6f7WOZTDXt9/gMYtjJ8SXFR
         ZGZCCfRkXJhMrBLjrU/zFdzDRbgA39/2dRCWBF/oj+KCbtvQ3TZWRYfKA1iKK/PgVHDz
         ojpg==
X-Forwarded-Encrypted: i=1; AKwUvBzrQjJ72cZ2WVRkNk2S8tsb9KQNgzYZtCdp5H3VxNWn+IRYIxGbo0jlnrNoGy+LHdY7Ggoers7xVbyzGL8y@vger.kernel.org
X-Gm-Message-State: AFq9FYJV4iTq2vTQPh7tFyNx9ztHD+o4bKCPG8v4ANEQNDHpeXdfyTzm
	BkZsG7pFobSA9V077nT+PGG8pmu0gWB1R8hHNexr/HqKujZxLtYdjCT5z6z2R9HlXLYstdBu21E
	NTHFfkHr37gy8I581h8QdVWn41GD2qRa/FkfGQYBfMbIkQD9/XLNtUy44dsZAKd629DkT
X-Gm-Gg: AYBFou2BC4xY/nIbBSaId0SXLHWJx8ah5anxlnEZyvtIV1NYOB+AvAVVGs6C/mT3mVT
	frlSrqj4dTxlpGxB2NuPfoiaqcHCF1PC/dxVN3acgJxhjyk4uWK+Qhchs9GYj7SVf7/u9QB0zK5
	dA8fEz5kd6xWmBR3zx0KazVePg4kcLoU17My0jEL1CYQpFnWbTCVsKNfJiTFYc7OypYfkkyobUx
	CIIStr4iKKycfEbtbJ81qYSUO8/ZRN6hroTEbFC8lqKYnLRMxq5paS2Odm+MbQYEzHRYN5MCjHS
	hHV72DgDGqd+twbMMEbhn+IPUWgeB89U2wocFjR3MfnNVqN8LzLw1RkfGRwyyoW5hYLBTk6kTs3
	+UtFlVMLxsEGmNr+u+sP8uRz6Ea2o0e1YzDDKsyztURK5nWCmG4uYKQnqCT84S1owOc6t7iWJK5
	7ggo6XwqugDG2rvlf2TKkkuEs6ANAo4dnJcv7ruAeNI1bc9IVzOvBOmFr9ivnX
X-Received: by 2002:a05:690e:2061:b0:672:d32d:999 with SMTP id 956f58d0204a3-67a7b9b9f21mr1313090d50.14.1793200876540;
        Wed, 28 Oct 2026 08:21:16 -0700 (PDT)
X-Received: by 2002:a05:690e:2061:b0:672:d32d:999 with SMTP id 956f58d0204a3-67a7b9b9f21mr1313046d50.14.1793200875859;
        Wed, 28 Oct 2026 08:21:15 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a803cdd1asm1107541d50.4.2026.10.28.08.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:21:15 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:20:40 -0700
Subject: [PATCH v23 06/15] media: qcom: camss: Add Kaanapali compatible
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
Message-Id: <20261028-kaanapali-camss-v23-6-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Authority-Analysis: v=2.4 cv=M4bYuCws c=1 sm=1 tr=0 ts=6ae212ed cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=Eph36bqoL6-XvbZcx_wA:9 a=QEXdDO2ut3YA:10
 a=Epx66wHExT0cjJnnR-oj:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: eoN7zOvQFYdSqkDqBQld4kf34tHIhAqv
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX+eB6hVfD2uVP
 8R76wsy+XI/pIrv3TGhl0xMmhG87fFrs4smeJaCsDRGtzSdP3TsdvcXbT37Qrr4XT7X2jgundKS
 4DLfukDJWgJZdfPFjvW5ZHyPC2AZrjE=
X-Proofpoint-ORIG-GUID: eoN7zOvQFYdSqkDqBQld4kf34tHIhAqv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX4e2NmS66PGqV
 lgMwt8E4i+hH9J7Y74wSBeF69XDQy5IcZx7uMc+kPTwiK6KNTMIodVRPm7nvR7jjnl1goMIIXR2
 t/ikhbGetWouvboIOnYQ02SH+7+OUjGW9u1NhFY38FahtIgQ3HuBF6n8uypVytkog3ShQBAwYzW
 Tt+b5aS8wn+N8Rh+OW7WjMdFHMvRygcibh+AXQzPGTSRssE6sGCQbrqFBXbbXdyzJ8+fQyMifdt
 083QWarJdIzYuGBVP5GPn2E9CnTJK3xAMus+9GCHh5v8z9XPmOo55HILiE/X2toGIFMs1o5gl8D
 mF4Y3OqyyeavxmBNTNhjk3h/HxjCk+IkvbFD6D5UEhmFPUvAkzgajhdlkpyBB0jbB+ISDiOsei5
 e1VyTSXccWLzTdcBHNJ19rGhP1FqBpltSBMiG6hT6Q5mKglQu2MRE0kRPlaQmjtqh/BGo/adpaE
 n7Yi8d02CtEzQFl1IkA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

Add CAMSS_KAANAPALI enum, Kaanapali compatible and Kaanapali CAMSS driver
private data. The private data currently includes only basic information.
Later changes will add CSIPHY, TPG, CSID and VFE resources.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 22 ++++++++++++++++++++++
 drivers/media/platform/qcom/camss/camss.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index be58a39f4a8b..98ec23c39fda 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -38,6 +38,20 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct resources_icc icc_res_kaanapali[] = {
+	{
+		.name = "ahb",
+		.icc_bw_tbl.avg = 150000,
+		.icc_bw_tbl.peak = 300000,
+	},
+	/* Based on 4096 x 3072 30 FPS 2496 Mbps mode */
+	{
+		.name = "hf_mnoc",
+		.icc_bw_tbl.avg = 471860,
+		.icc_bw_tbl.peak = 925857,
+	}
+};
+
 static const struct camss_subdev_resources csiphy_res_8x16[] = {
 	/* CSIPHY0 */
 	{
@@ -5589,6 +5603,13 @@ static void camss_remove(struct platform_device *pdev)
 	camss_genpd_cleanup(camss);
 }
 
+static const struct camss_resources kaanapali_resources = {
+	.version = CAMSS_KAANAPALI,
+	.pd_name = "top",
+	.icc_res = icc_res_kaanapali,
+	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+};
+
 static const struct camss_resources msm8916_resources = {
 	.version = CAMSS_8x16,
 	.csiphy_res = csiphy_res_8x16,
@@ -5823,6 +5844,7 @@ static const struct camss_resources x1e80100_resources = {
 };
 
 static const struct of_device_id camss_dt_match[] = {
+	{ .compatible = "qcom,kaanapali-camss", .data = &kaanapali_resources },
 	{ .compatible = "qcom,msm8916-camss", .data = &msm8916_resources },
 	{ .compatible = "qcom,msm8939-camss", .data = &msm8939_resources },
 	{ .compatible = "qcom,msm8953-camss", .data = &msm8953_resources },
diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 431afeb381aa..97fec24e6804 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -96,6 +96,7 @@ enum camss_version {
 	CAMSS_8550,
 	CAMSS_8650,
 	CAMSS_8775P,
+	CAMSS_KAANAPALI,
 	CAMSS_X1E80100,
 };
 

-- 
2.34.1

