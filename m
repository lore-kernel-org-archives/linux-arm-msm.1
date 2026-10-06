Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F53638AC9A
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 23:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791328004; cv=none; b=NHHrT0z0ixtF0yWK41jCY7bOkLfFF8j7UlkMNEHOngUQYtZrDSHKGnw73MPdBtglttoMHBZeMmxos71ZqVxsmYHHa72EfLOScWwv5YVunuwGt2GDqRk/e6mD498h1/XTYMDnZwikVVU7NWEB3iel+OBV5oG3ncEnVwJSP3XT01c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791328004; c=relaxed/simple;
	bh=lf2gPKESrvmkB7VGLx+xjcIuYcPGvqsnSmiCwFiffBo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hFh8ecpc+z77g8eBrkeIDviXtB2b3bjk8zSHYRPkSPwqH47ALHRd7Jg0ZpA67EowQZmBo9HrXKq2aDejXBdGRHqNnYzKESjk6uIVDiIs7z3gdYLgSCifmc5WYfS+MumRh4SysnJqpX4dPACFSEShAjAAEBiWja5OarB73YtTpRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WXki4E/m reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WXki4E/m"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696Lh1KW1430100
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 22:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Wt6WAlPSs5v
	av3gbeuNRj5D/mZ8C7CaxsN9sJXdvD8Y=; b=WXki4E/mTbwW/uxDPoIHaJKh4T0
	XdUpP00mXJRbARoQK47zyVDMA+UcTFf+QjgyFbi4HHJ51oyodROl2chU/DKKTRlH
	le4CjLcvwGjuoYzq9q3lMFOm9gMJ1k5eLjwgMDZqSkyEaI31dXKAhJrGfOMmmHVw
	7PkZNTTa2FIxJzPL3SMzHkXBXLWUm7i9LbHksbrWnYKgJOWWwfJ4PHpmmPUqAvEp
	r2U0tLTkSGz58UlzXdkdzc8qWWZ+eEiWhOpSZ13iIK0FIfD7FucawDviAquRiFJb
	Uuym1+oVdmUSifadEW7POwBxcZk1h86MksuaJJ6qBMSmOiv9NkrR4HSaC5A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xf7u1ax-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 22:41:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93909014c85so552049285a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 15:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326507; x=1791931307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Wt6WAlPSs5vav3gbeuNRj5D/mZ8C7CaxsN9sJXdvD8Y=;
        b=fno2MSa2Y4aUnYQ9bwgPwPh6iHBldKUUlSMZwcbaMiAwKiVZQqxnGsqMqBBqmmX/iC
         D/TfiPV+DXxd4meZkQhEgkzOSnkM3v9DgluCZltsjTrfr7w9tPBMQUzIqaMzxI9LO6qU
         muxPPmX1/SYR3wGQdX3Hy3lUwDFygETb/+nukxR5MN+lV16izNRWbFPvevYMHMXK1gjo
         /EBgvAc0argUeU2VTOa2L82xrGaaKvhC5tgO4TdCKEZLRNo/IoygZR6jTOlGTMKLzzRE
         A6eExOfM5TVjzGlaJq0JlPlMxc5u6Ia7QMnKELw9AkMFM6ag7M2/rbyF6X8gEK/DMHxu
         FFqA==
X-Forwarded-Encrypted: i=1; AKwUvBxDDCD1dMru1zeIDRagn9tcrS52CBmXUHJma4SPE6XzrP4Duvh9G2CL1dlE4rBZIdpt8U+seXmuSx+Je8pd@vger.kernel.org
X-Gm-Message-State: AFuF++kCORWngFb6kZVeSdS6Gfm8G+zsWRY0SAE49tJKn1FAuO6cRQBY
	qNvsVieA48m9X2oM7V8DFS1c1kB5B6+IXtXr2kTDSE+knifROadsG4mUwhzPJu8qgsxWmtxzVqc
	JayCsR8qMJBkLv3OzbFK1b1tVeOjrAhL9ZUTUqcpw4LqccuIY8bNTyvYF9xyiW82JCkOq
X-Gm-Gg: AYBFou2LpZCuCIcgkCSyYonxxF4f1ER3m/CpO/eBgyQepJqa5nkTp5DSX3GT8kzd63c
	egSHIHcKtQqkEziTtZiVXSLGkOsTJdQLy1HB/zASvLObnss21xdji5Mdcm7pMPGAUCyhAHAdrIo
	9anpassidhmDrzyM48+GL+26dJKFEYDpy7p1uSG/rlUrZrTFXU38tyE8ixXL66NbiXce93h/Ymg
	KHUp13Fv9H7pKvkC5J+ASH0NJ3TfNUkC2MbpCzu9fEpAzi+ZPt1Am45ePiiEaFm2zoxxPPzmfgg
	db+NH5+R5a0CH0ubRerOEIELXd7J/d1NJ5i1Nb+eHUV6aWyAFahrj+mEs6o=
X-Received: by 2002:a05:620a:1721:b0:93e:9809:dc00 with SMTP id af79cd13be357-93e9b8f03demr73909385a.83.1791326507041;
        Tue, 06 Oct 2026 15:41:47 -0700 (PDT)
X-Received: by 2002:a05:620a:1721:b0:93e:9809:dc00 with SMTP id af79cd13be357-93e9b8f03demr73902885a.83.1791326506363;
        Tue, 06 Oct 2026 15:41:46 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:45 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
Subject: [PATCH 40/45] media: qcom: camss: sa8775p: add AWB BG parameters
Date: Wed,  7 Oct 2026 01:39:48 +0300
Message-Id: <20261006223953.3382273-41-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX198+hlApey6s
 WTB2D1g7CKCgrJGSz3R88cktgN+9rXgL6gBxuzjr6wHlH4in/aae0Wqqq5qC/x78q4pTuQH1/B/
 UyvgkwIVyXDqc2dazWJfiTm7AdXJU6s=
X-Authority-Analysis: v=2.4 cv=FpSQbGrq c=1 sm=1 tr=0 ts=6ac5792c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=aZ-3kUUx37z8FZvU82kA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX/RuKaFODuTnr
 8CGieUmhJRv4S6lzJEPyUyaw2kgjTBQSyFQPNXRzkn6p6ig2Bdonjv8XJ0zuuF2a83FNEclZVRq
 rHwphkgSUKmrvlzc4szCJ7KqcIZ2Uh2pguWy3S66JTayr4l2bqj7m5qABjHQYxZwXVfu4qMXB28
 dHyqtcsMhOso8X5gBj03wk4/zHbNw77xFtfj4ol1ywhj7PAUBhR/T/Z6z93UofJSrUW1gHpnI5T
 2iA5y3TVX5i7C7Pqoxd7FEQEu8IGpmWZraIUKxNd//1ZRPRh3iGwJLCMOmqc4O5ZoneuBiP/cer
 BUZ8EFF8dlK+tkfcFhzQBzcq4t4FV0ybFX1Z0JX3/wYEZnWYfsJ31GIt8nZAnyuroCe8w5Ljo8J
 5D+ty/xbaegtJ0YWDA3PS+Y8gSu6W0jdJFrLO6M6B50UHSc3llEkJacxKY+lYw8cihXQNgMTump
 7iXqmeoxHMLqEb7t56Q==
X-Proofpoint-ORIG-GUID: 1Q_7BK7CPcy2MpTGR2kCiSdNlwbmtjXm
X-Proofpoint-GUID: 1Q_7BK7CPcy2MpTGR2kCiSdNlwbmtjXm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Configure and control the AWB BG statistics block from IFE parameter
buffers. Derive its grid from the active pixel-path size.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-ife-mod-v41x.c      | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c b/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
index 3c53f585133c..b35a3f375026 100644
--- a/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
+++ b/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
@@ -678,6 +678,17 @@ static void mod_v41x_params_apply_gamma(void *priv, const union camss_ife_params
 	mod_v41x_glut_apply(ctx, &block->gamma_256, enable);
 }
 
+static void mod_v41x_params_apply_bg_stats(void *priv, const union camss_ife_params_block *block)
+{
+	struct ife_pp_ctx *ctx = priv;
+	bool enable = block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
+
+	if (enable)
+		mod_v41x_awb_bg_enable(ctx);
+	else
+		mod_v41x_awb_bg_disable(ctx);
+}
+
 static const struct v4l2_isp_params_block_type_info mod_v41x_params_type_info[] = {
 	[CAMSS_IFE_PARAMS_COLOR_CORRECT] = {
 		.size = sizeof(struct camss_ife_params_color_correct),
@@ -691,6 +702,9 @@ static const struct v4l2_isp_params_block_type_info mod_v41x_params_type_info[]
 	[CAMSS_IFE_PARAMS_WB_GAIN] = {
 		.size = sizeof(struct camss_ife_params_wb_gain),
 	},
+	[CAMSS_IFE_PARAMS_BG_STATS] = {
+		.size = sizeof(struct camss_ife_params_bg_stats),
+	},
 };
 
 static const camss_ife_params_handler_fn mod_v41x_params_handlers[] = {
@@ -698,6 +712,7 @@ static const camss_ife_params_handler_fn mod_v41x_params_handlers[] = {
 	[CAMSS_IFE_PARAMS_LSC] = mod_v41x_params_apply_lsc,
 	[CAMSS_IFE_PARAMS_GAMMA_256] = mod_v41x_params_apply_gamma,
 	[CAMSS_IFE_PARAMS_WB_GAIN] = mod_v41x_params_apply_wb,
+	[CAMSS_IFE_PARAMS_BG_STATS] = mod_v41x_params_apply_bg_stats,
 };
 
 static_assert(ARRAY_SIZE(mod_v41x_params_handlers) ==
-- 
2.34.1

