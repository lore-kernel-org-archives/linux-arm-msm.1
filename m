Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200883;
	b=CARRbhAstHk6xca3sUFeSv0o9RpxfCqXYyf5AZFuq8Q5gXtubynh+LCTv5DmXR0K7vjm
	 jX0MGL8rrGBk1vnmEPwBENknC6qTc5om82yva8Bw3O76bVAAC8pnhX0dKaXxKbeX6FrTd
	 qaz4BZ25iEb5UctV7gsUGmiP4t7MMZ7a/1rFqQN9v6fD0d2E1RgChBnVIljDaeF3+8Au1
	 CHgtOXzbtTQ8aWT5RPt8aROLsaqiJuZWysanzvpo+7+wS8ewqixoY33jnVxvvauuTFY4p
	 7qdxktVsHgqpph3G+BfzFw0U2FNPOF4yrpAoKAXUlEEQ3fWHP/Y5vjYDIl6knpIuymw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200883;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HAoVo5RcQ/NoFGjRJUTPgIdHUenOlnc1PdK0zXPqYhg=;
	b=OI1Lnm5BnzRo6og80nkdzIab2VfweVwdelB7ox/+1Cxxr9vU8UBig97Lz56ZYCl51gR8
	 PkyfAVAn1fPkE8zGY8YDjELGSO9b+gOfM7wt0lBQM3CLau+9tGLwPTeQEHdqtN+CSZj40
	 2x2mzfh1Oknq9SNURYNzsmFfATabGLSZHqT7omK1qYi6ySLy51HjN6ttynpsEkmma7PKe
	 3LTSVO1qeL6SmqwkPaHNlHVl0HRA1lA1w/m3TZa8Xkoe07LADNQdU838YTh6CugiSyvFY
	 hUEFYemyvxQG4Bh4qJEU6wjsVjPkgckeA+9lZTAHD2s0Cfhw2JdR3yGnF7FnwYVdOGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nZzseuKE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FQ6aHHgv;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D871B60A3827
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D871B60A3827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nZzseuKE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FQ6aHHgv
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAZW91458804
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HAoVo5RcQ/NoFGjRJUTPgIdHUenOlnc1PdK0zXPqYhg=; b=nZzseuKEmdajGeTK
	g56F9YULRkwTioXg3c2PI00JMwS/wiMdnkstMV9EQ15zDq7euDY8hncpZOEKNCbH
	EgM0th+McGsiTQbjUeuY4NZmBE9wbM4Djv85Zy9YwxtFvyNxrG7y9r58Ln98jBov
	x+nqTH26SMk8uTUaE157DWTUGFFUyJQg0mgr2b3/IewYwJyGZ80t8S+gp9jW4KA8
	q2RQYqpPglc71/MryyfYUK9oSkxX2zTpkcdluGXKrz4TYxZaLzQWLbRhxYKSeAyl
	4eSaAQumcfORrfLIikFwmLgK0vjpe4KoDBLoypLY54kguOR5IpmgUWCa8dwObk4Q
	C+2m6w==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82ttrph-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 15:21:21 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-679b96a1e29so1904170d50.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 08:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200881; x=1793805681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HAoVo5RcQ/NoFGjRJUTPgIdHUenOlnc1PdK0zXPqYhg=;
        b=FQ6aHHgvEsXFs7aiwgUBzf0I1LI7KSINilslqWW+NGFmP5lly6y80giHMkGwntT83G
         5LG8cT78CArOALLo9bHandtNKzQFK0CH9mLRhDuecR+/E4fCBWiDanw5OQkH9D8NRKPz
         hr13Yef1nyit/jWoLc9HIOOb7s22FikIYhd50Qlv89NBxp+/QQRLHUJ/GeRJPTeOQXsL
         uCH0Q+rEX7saikB73Sp5QdMeP3KV1rOuUF9XPbts7Br+szcAzKmLdl/NmcFJrOWuCODF
         v5tMoLnbioQzoNAJUeZeu7VX91iJJ5hMASUD/Q/nhfaN1x5bFLrUgJhw28NXTCRvmudW
         o8Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200881; x=1793805681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HAoVo5RcQ/NoFGjRJUTPgIdHUenOlnc1PdK0zXPqYhg=;
        b=fIUzLP1CqAjDlVIAyQj4jH2GcboLD6tgY3UnwE7UT2QVdhJDk+6CiFdrTg0QnGq14Y
         fz1N2e5eLyt7xw2ozWBjOGDfZ0NmR3YESn7Ik4gvEeDj13r9OCBuzz0W5PiaMfFoSMrx
         HrUNMVOnlJHmK2ybszNcZiPTJfMIhyVOPqTKrQF3sx2bqHu/mxLukELO5hsqacPajLfs
         S3zSzWHo6r/Qpzck6wWy7Z/rtns9e868t1kqoUyIitnEId7IzDySVJzjUW8wEO9oMOKO
         YkFxuWQ5z4wPcw0JQwlnjnbAHueX8E0Q8E4a9+hDiH6LR4Yrh0Cy/lvngF8LyDFi3XSL
         t//g==
X-Forwarded-Encrypted: i=1; AKwUvBzP6Gn2lNZGCiLh5qGLHG7nBle73SqE4XrYnqMLtm1awLhxmxvNBICtyhqxvzbmmDF9wvVQg1SjVGfff+pG@vger.kernel.org
X-Gm-Message-State: AFq9FYI04GJY7hhYKb5l0qcIqXv7SmSUhaEaWuJIy2Ux80raKysp9iGX
	vwiVAYWDBIXWu9fEuR3rJ7ZOOuZloCmJ1uxFWp2htgL1kybCH9J3Y0yigbGHshvolg9bcGDuENG
	QoFrmC4zzFob2Nk3+yn0jKAVeQRN7cSGlTVV4XcSXDO0uKNwqZtXtkP0q02lj0NfTLqnJ
X-Gm-Gg: AYBFou1lo/q+/XbS/4dOtyip0PyIeJBmF+s3ubl6lP/FJahWeiuN9Wv/QKxMnJVTra9
	yvHU4U9bt4xrDhue+EF9NISFuARgu9cr+nP6/mDEyqtqsUeINGo8baV4j9tTOynlZlc8QrHTN1L
	eQ2KskScOV1RfyT4ugHnJSaCp6SKdbc1GN2RnPl6jvBChewkte1+qrOFMsk462zweOxQGzZ4N1s
	sWVsftPT+eI12B37vFiNu8yWg7LLuyANYzUMkFOL7IAIHdnv5zjCWRr3G0TKbCBZfh2yTWjLtPD
	2DLJgbjQ/bc/b852wry1+SW8ev714G9g1QUNKWmvONhWsKY8KFk3OafLuQgtG3bFHBMHHlI/NFR
	rjVZhJPNjHHTkEnNKTxJmjpGH3zySTnYue+GD4eNSRfrK2O6b/eqRMdCc84ZUcw9/4F3URpMKjQ
	AlYDTfFGgoo07xiIExDqIC/2bHCpqa6JJR9E09Bv1u3jXqeKqemquQ2hLLmlpe
X-Received: by 2002:a05:690e:438c:b0:677:d31f:5a6b with SMTP id 956f58d0204a3-67a7bc157f5mr1294947d50.16.1793200881036;
        Wed, 28 Oct 2026 08:21:21 -0700 (PDT)
X-Received: by 2002:a05:690e:438c:b0:677:d31f:5a6b with SMTP id 956f58d0204a3-67a7bc157f5mr1294931d50.16.1793200880381;
        Wed, 28 Oct 2026 08:21:20 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a803cdd1asm1107541d50.4.2026.10.28.08.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:21:19 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:20:42 -0700
Subject: [PATCH v23 08/15] media: qcom: camss: csiphy: Add support for
 v2.4.0 two-phase CSIPHY
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
Message-Id: <20261028-kaanapali-camss-v23-8-95f250b18612@oss.qualcomm.com>
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
X-Proofpoint-GUID: zODJeJtHwU9z-l3p_cwYC6xYfvyHpCCX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX2Ei4qI/TSi/I
 XXcdNjpWnAighrBIg+pBSzIVxVdc/lsudILSLybnsb2XsrgNSpjPM24vfHKOEttTGelqWCt6GuK
 G65IPJmYje6QnL4lVoD9n54XvuXhO9Y=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae212f1 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=JczS9Y7s0yypmJa40voA:9 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: zODJeJtHwU9z-l3p_cwYC6xYfvyHpCCX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX7BYIAHDs1W4V
 bmdSjTO4KO9suMAnCF7QxG27ltVh22KpqyvXbiApQlt+jnRjImefYMWWz/h9M+dM/VcyX9eon9u
 jyxbjiNPnactuRiyrNc/yaaWhqt+Ipy+9Tl3cbExhOz+1Kuks2A33dXd2mnITiDfWQ26cTmWZ1h
 6F1hqjnzFdT4pfeijirfHRgb9tXDjL5crtHVSA0AY+zWG+gAj7UeZG5fvCfKXpGZDv0GKt8heH0
 6aodfSrH5+PbHDMdeLZcEgoQvdlhH8suBhtmI8qUr8wpgg14u4XUG40J/uBq0ArxiOczhczQDpS
 XTG7d5NnOBHf72H+IhoBVofBnu7I+9VEPCfsvGtiyRc/9fXzvmnivOY7oq8admREQK9maDiQvCB
 8+Obzxo7C9JC9ZkvTylkELPi1BlvpuVcTaqMglB9I2N+S7+xgU+sEmJf5jXdVeEENfSlNW1z2HS
 3ZWRWjAEIT6+Qmsq0HA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

Add support for the v2.4.0 two-phase CSIPHY found on Kaanapali, where
the PHY is driven by the standalone phy-qcom-mipi-csi2 DPHY driver
rather than by CAMSS. Add the mipi_csi2_dphy_3nm_kaanapali configuration,
which reuses the x1e80100 lane sequence, clocks and supplies but selects
the v2.4.0 common status offset, adds Kaanapali power domain and register
the "qcom,kaanapali-csi2-phy" compatible.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 47 +++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index a64242c66cf0..b0b63dd3d958 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -38,6 +38,51 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct camss_subdev_resources csiphy_res_kaanapali[] = {
+	/* CSIPHY0 */
+	{
+		.csiphy = {
+			.id = 0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY1 */
+	{
+		.csiphy = {
+			.id = 1,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY2 */
+	{
+		.csiphy = {
+			.id = 2,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY3 */
+	{
+		.csiphy = {
+			.id = 3,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY4 */
+	{
+		.csiphy = {
+			.id = 4,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY5 */
+	{
+		.csiphy = {
+			.id = 5,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+};
+
 static const struct resources_icc icc_res_kaanapali[] = {
 	{
 		.name = "ahb",
@@ -5607,8 +5652,10 @@ static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
 	.pm_clks = { "cpas_fast_ahb", "cpas_ahb", "gcc_axi_hf" },
+	.csiphy_res = csiphy_res_kaanapali,
 	.icc_res = icc_res_kaanapali,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
 };
 
 static const struct camss_resources msm8916_resources = {

-- 
2.34.1

